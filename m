Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577F47AF67
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.10.93.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396413; cv=none; b=Rre/LF5MwXj7jVecuf3fcNWT5fnYRHVurgSRilvL2EZ+Z88GmMAeL5+LbKXwweWbq23cnI0RwsjHSvlkJBlb1lJItNMR2QlF2T3vw32hxOF4r8XiSnRXBtwYjwm04OhbJqDtkXwASZYw/MgVGMocuIqvx6axAt1z83Z8woY47I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396413; c=relaxed/simple;
	bh=POz9V8rFIuePA/PFoYzgcxKHB0rfEPkaPZu/IZdfM04=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GvVOms4DZ/VD+8NtBNjYUnXF/WSNOY6vKDCwOvS13VFAm1VSU4i6DlBrtJOjQbZHGCjqpBiibfE83vjQSxJUQHZreca2vbcG4ZYOdsDYioVjFRi8yTAcGvylTcflVTqC+s5XmCZ51T6eiPhXFOzQOIssdlaAKaUPYa5jc+0NEeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru; spf=pass smtp.mailfrom=cyberprotect.ru; dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=IAV6QyNQ; dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=ySXOaoe0; arc=none smtp.client-ip=176.10.93.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="IAV6QyNQ";
	dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="ySXOaoe0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=G7k+5ltUYjwES1HZ+tIrvRED7WHcVnAbVMsryiyMzYI=; b=IAV6QyNQXJUIg8acSVFC6THTCw
	WBHaUHAPEEMCe/djnyt516IwdSuKhD4bzNXH6J7prLpCeT0LJ6EATfTgW/2wVX4tjzeRA6Uf4jB1D
	Qf3fJfGkqhThFGfeMhdpzSb7ohUuICHI2NUQLutuxM5XvPFHLaYhF+gX/DWp6ofXVdoCjRJNL7rE4
	MGRmceJXYPRSzRg0Xsnjy/yk4E1siAoK+X7YI+MfYmhkFVusE0mPHSAEfTsgbHTmFmxwWHVHn4Nlq
	Eo6Pem+TONK6/x8WZXSPl0S7B7rmUMUyIBYaMyHSTCSGTqkDNee0aig5/3mxy9Z070t4ebVaSoCdL
	fozrA4eg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=G7k+5ltUYjwES1HZ+tIrvRED7WHcVnAbVMsryiyMzYI=; b=ySXOaoe0A71bsidyk23w2to3m8
	TRsAEjiBzayhV2sFsHMPC/03gAgfyQS+K+3EK1oQf9szHwJZcS8XFVwit/Dg==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Alexander Deucher <alexander.deucher@amd.com>
CC: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang
	<Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Dmitriy
 Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
Subject: [PATCH] drm/amdgpu: check ras and obj before dereference
Date: Mon, 14 Sep 2026 17:33:03 +0300
Message-ID: <20260914143303.90614-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-1.aip.ooo
 (10.77.28.101)

nbio_v7_9_handle_ras_controller_intr_no_bifring() dereferences ras and obj
without checking either for NULL. Both amdgpu_ras_get_context() and 
amdgpu_ras_find_obj() can return NULL, e.g. during the window between 
adev->nbio.ras being set (early in amdgpu_ras_init(), by design, to 
enable the fatal-error interrupt as soon as possible) and the PCIE_BIF 
ras object actually being created in RAS late_init. Any interrupt in that 
window crashes in hard-IRQ context.

This is analogous to commit d190b459b2a4 ("drm/amdgpu: the warning
dereferencing obj for nbio_v7_4"), which fixed the same issue in the
nbio_v7_4 handler.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7692e1ee2446 ("drm/amdgpu: add RAS fatal error handler for NBIO v7.9")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
index 8e401f8b2a05..2b3a1b9f8efc 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
@@ -518,7 +518,7 @@ static void nbio_v7_9_handle_ras_controller_intr_no_bifring(struct amdgpu_device
 						RAS_CNTLR_INTERRUPT_CLEAR, 1);
 		WREG32_SOC15(NBIO, 0, regBIF_BX0_BIF_DOORBELL_INT_CNTL, bif_doorbell_intr_cntl);
 
-		if (!ras->disable_ras_err_cnt_harvest) {
+		if (ras && !ras->disable_ras_err_cnt_harvest && obj) {
 			/*
 			 * clear error status after ras_controller_intr
 			 * according to hw team and count ue number
-- 
2.49.0

