Received: from mx1.cyberprotect.ru (mx1.cyberprotect.ru [185.232.107.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028584734DE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.232.107.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395410; cv=none; b=NDt+T7DSe0L5JY1BJBhztnDeo/XjoLvMXdE4WiqpRjsVUxYRftERLKHwMV7WbsjzsE5LU1WqNg1ZiyNr/cT/GZhXIy3WzjsajnJRYHgvgoNlQ5iT+QhKfapIW9hQhwQVGV6SbND4BE0T69DFpftF90xZip9noks86N/5u/ZrZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395410; c=relaxed/simple;
	bh=kYyttcYV+wmWs2k365D4hOOh5K4NSNYOTXnvEGhlQCA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YPGfK57h4jd6eYNcxyy5E6ERQF+0zisZ0gRyLxBAMThxpfCF+n2zQt/gks+Z7uCSoToiGMiwe/xSnayVuQPerYChfAn6A8g0fymWRM/lwA51ISKjHSPn+4VEjc3UdQpNbTDEIDMB+35Gy96YiredpTD2bufo6ae9gQ5S3PhOM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru; spf=pass smtp.mailfrom=cyberprotect.ru; dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=pgjZ+D3d; dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=MYoSiWh7; dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=pgjZ+D3d; dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=MYoSiWh7; arc=none smtp.client-ip=185.232.107.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="pgjZ+D3d";
	dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="MYoSiWh7";
	dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="pgjZ+D3d";
	dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="MYoSiWh7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=Y76w9BTOjCpEbJnDNx2234JNCrHlNulwkjOo2N/Tktg=; b=pgjZ+D3ds6ds8uiNLbmKo+HXp+
	AEc6vvGCMAODeHcLok5TJBjIN8EX/sGpZoiF4D+6uvn0ONzXu3jYZNmYEgN9s0r7bPNwYbOOnvEmC
	eWhlUvt3x7Q6kJT40g7upogSn+rVg6JoVgPrPmbdCna37LJdI2KUPFVvi5jV1UecciLOhtJnlS+Xy
	uIwnay19Jskn8Uq32d/fIPIBNwrtkX9Avf6fnmOSwJhHR/jnw1fM/oT8WQkB2vNjTcjicrzT9jgzw
	0L2SsNGL0TxT01W4Zg2rn7cLEVGHMMJYnLzKDvYzCaycgz4sfwF+aCSDXHc2ZqOKq9aRuqhxgQvze
	Qxz8S75w==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=Y76w9BTOjCpEbJnDNx2234JNCrHlNulwkjOo2N/Tktg=; b=MYoSiWh7wZ3/ARTzg3Mi/nUL2p
	3yBq7DAfyrbReaEQ35AMNJrTyxV3/4Ny+WceKloqIQVwTTmWT3otMZSJwNBA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=Y76w9BTOjCpEbJnDNx2234JNCrHlNulwkjOo2N/Tktg=; b=pgjZ+D3ds6ds8uiNLbmKo+HXp+
	AEc6vvGCMAODeHcLok5TJBjIN8EX/sGpZoiF4D+6uvn0ONzXu3jYZNmYEgN9s0r7bPNwYbOOnvEmC
	eWhlUvt3x7Q6kJT40g7upogSn+rVg6JoVgPrPmbdCna37LJdI2KUPFVvi5jV1UecciLOhtJnlS+Xy
	uIwnay19Jskn8Uq32d/fIPIBNwrtkX9Avf6fnmOSwJhHR/jnw1fM/oT8WQkB2vNjTcjicrzT9jgzw
	0L2SsNGL0TxT01W4Zg2rn7cLEVGHMMJYnLzKDvYzCaycgz4sfwF+aCSDXHc2ZqOKq9aRuqhxgQvze
	Qxz8S75w==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=Y76w9BTOjCpEbJnDNx2234JNCrHlNulwkjOo2N/Tktg=; b=MYoSiWh7wZ3/ARTzg3Mi/nUL2p
	3yBq7DAfyrbReaEQ35AMNJrTyxV3/4Ny+WceKloqIQVwTTmWT3otMZSJwNBA==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Alexander Deucher <alexander.deucher@amd.com>
CC: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lijo Lazar
	<lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Samuel Zhang
	<guoqing.zhang@amd.com>, Dmitriy Chumachenko
	<Dmitry.Chumachenko@cyberprotect.ru>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amdgpu: zero reg_state buffer before filling it
Date: Mon, 14 Sep 2026 16:56:50 +0300
Message-ID: <20260914135650.87591-1-Dmitry.Chumachenko@cyberprotect.ru>
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

The reg_state readouts return szbuf bytes but never write the pad members  
of the headers and of amdgpu_smn_reg_data (and, for pcie, the fields       
skipped when the upstream port or AER capability is absent). The sysfs     
buffer is a plain kmalloc(), so those bytes leak stale slab data to any    
local user through the 0444 reg_state attribute.                    
                                                                           
Zero the buffer once the size is known.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 081a6eda2b25 ("drm/amdgpu: Read aquavanjaram PCIE register state")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
index 72ea37dbfea8..0086de0f685d 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
@@ -610,6 +610,8 @@ static ssize_t aqua_vanjaram_read_pcie_state(struct amdgpu_device *adev,
 	if (max_size < szbuf)
 		return -EOVERFLOW;
 
+	memset(buf, 0, szbuf);
+
 	pcie_regs = (struct amdgpu_regs_pcie_v1_0 *)((uint8_t *)buf +
 						     sizeof(*pcie_reg_state));
 	pcie_regs->inst_header.instance = 0;
@@ -702,6 +704,8 @@ static ssize_t aqua_vanjaram_read_xgmi_state(struct amdgpu_device *adev,
 	if (max_size < szbuf)
 		return -EOVERFLOW;
 
+	memset(buf, 0, szbuf);
+
 	p = &xgmi_reg_state->xgmi_state_regs[0];
 	for_each_inst(i, adev->aid_mask) {
 		for (j = 0; j < xgmi_inst; ++j) {
@@ -776,6 +780,8 @@ static ssize_t aqua_vanjaram_read_wafl_state(struct amdgpu_device *adev,
 	if (max_size < szbuf)
 		return -EOVERFLOW;
 
+	memset(buf, 0, szbuf);
+
 	p = &wafl_reg_state->wafl_state_regs[0];
 	for_each_inst(i, adev->aid_mask) {
 		for (j = 0; j < wafl_inst; ++j) {
@@ -902,6 +908,8 @@ static ssize_t aqua_vanjaram_read_usr_state(struct amdgpu_device *adev,
 	if (max_size < szbuf)
 		return -EOVERFLOW;
 
+	memset(buf, 0, szbuf);
+
 	p = &usr_reg_state->usr_state_regs[0];
 	for_each_inst(i, adev->aid_mask) {
 		usr_regs = (struct amdgpu_regs_usr_v1_0 *)p;
-- 
2.49.0

