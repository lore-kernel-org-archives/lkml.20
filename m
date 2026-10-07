Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4752B4AF9E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379635; cv=none; b=q0XLHaVg/j3mJ2Fg6z/tpQzGss/rUnfWz98TGx5YPLGdpl1ZGW/UYwR2mMFwDgfJHDDNka2KoVm9Ex0DtwtHCfNc3BfyardXMOJJJco2SN/zIm9B5eWTVc/AkVzhjd3ul1k0OgblT/nRy1N3rSzunTQB2iI4bqyt280CioOLn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379635; c=relaxed/simple;
	bh=9FFiBZzNjNWizqOL3HznxfsDwaJdYIPdTLjkyHpckoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gXbML3RVtsNEbZKxGIMY7S2B0KN1qLsxiglmwxKphRscQW79OwLKyPVruzWCj94Zjo5cz1NZdZbelG4DrMf2swgtKX51ly5+BZ1KmxfU1Yw80zcZXzR2VxifVFBP1jN3pRHQGQ+4rHeIetIlnO+yxALIxP6aq9b2qg1fMpEJPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phn8VEFb; arc=none smtp.client-ip=74.125.230.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phn8VEFb"
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-3a77df9781eso23106221fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791379616; x=1791984416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDQwNh3Y7ViZN9kSjBt6rSxx3bjORoWLA033ou0tHZw=;
        b=Phn8VEFb6xWOkHeeaUtUMeN1rdzOKNssukJec3P+McjRuy1frUzt2Ydk7nXScKlGNA
         vZ+80p8gSADAV3DT8Cxp+Dr17X94ZbyTLX0eqgYQtnEx7cZVnVTOLoTkAGWfjmK2aA6v
         EOVBj2bwt9uRyaEQmJ0q9nRaw32aErgGeClKCf9tJ25l9P8DGu2DHzVVcTu9QzM7/w9/
         zAiuBKH8AYaqEWd6rVCnQMjzFZApFGnxfHY86RlzBiSnhoSh00EfBURJEyeb7GM+/4ld
         gHlgdJsSkauJBjG+EhPeW7rr3HKccDC/WCnSJM/jPemfBmeLAec4gmKThp1P4kS3n8Ib
         9f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379616; x=1791984416;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDQwNh3Y7ViZN9kSjBt6rSxx3bjORoWLA033ou0tHZw=;
        b=rcVXvFIbFF2qqxZygmglgF3xDssZs9igYeWFCcMTeqbDWJb5uEqJ/UHfJlm3N79sli
         VdfAfQq+BEMZal1sNSa4cPopJcHaWyJACTAxhcq+/8Q0FFXgrHvVAlG/guZyOt79GcKc
         0b+TXdXLJv8LOKtHvmwiDgKvcTi69cq8vUXeblNkHfYnpnjJDR8gZEZLksSAlz95WDsb
         M3SmLjnaJsckX/taxoDkDFUKxpIb4h/ySre4KuhMghb/1MjYGKpJpHPpqibujpCaYMio
         4I1r2sNvrbWaueABO8ZBrlc96cNzGgnHel7EFNMIRtZO3RzV5DBuw3zcT4zpE7wx4s7U
         zQ9w==
X-Forwarded-Encrypted: i=1; AKwUvBzuImIVQn0VMmTBPDxlT5BejNlaaVHDHR55wVIRgcG9OYViBLG+ZSdd8dcT69YmtXOQDLaW3Z0tTsho79E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+8mINFFCinv58plUwCQdmEIFhYMngHcceXHds4xTPmAMB7zlc
	qLvMr3HBNq2aqKsKy94BmsFhCwdpDnQQWOZROTZVWClkqZIbLZAL2ynp
X-Gm-Gg: AYBFou0cjg+sDsjvFs5xFgWSMNvdt7XKniomCyAQ+V11ZRfPfqfTnd8HdAsV7sUot9Z
	RXsMZ+OCiweXzNygqlm+mV8M55KSxF7Wwon9wRyfS61Hj/j5qoiyidIQZAN17f44Z66dv7/vGZ/
	5gNNlOyzEN4ouM20/hgbQ5ApeyMeeK02vXH3U+Ma1VCsDD9q0+rE7sD19qstmEN/i/tTOg6LjGa
	tJPNAOIrrUCADWKaqgdeAFzHHQyJa2ffsXkUd3docsFTg1zx5mvMQPUhhGW5Ofd4v3spWk+EeBz
	lsTU3KrAAPDC1anVcXFL19j3+ir7wDCQnyNFqtr8iSdbtNUSurFiY6HvWID6Y9ecKi6eTdt0YE9
	Ksxk+LlkusN2HjZ/aSIavh5jolz05NdkRNSsgUujSTIsj7fO4UIKyBD9u7Ulxuod+eYCD5SQjDm
	j4No/QiYk2X8RO2IF+FaUusjbXxsukvzJhJsQiBFWWIYYa8o++emCXx12+Wif7ywxTUme7wYykh
	DFiKzEo+JJY8/cy
X-Received: by 2002:a05:6512:3a87:b0:5bc:b962:ccb2 with SMTP id 2adb3069b0e04-5bcd074b8f1mr877734e87.63.1791379616009;
        Wed, 07 Oct 2026 06:26:56 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3083558sm32201e87.39.2026.10.07.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:26:52 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Leo Liu <leo.liu@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Yinjie Yao <yinjie.yao@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15/6.1] drm/amdgpu/jpeg: set no_user_fence for JPEG v2.5 ring
Date: Wed,  7 Oct 2026 16:26:46 +0300
Message-ID: <20261007132647.121360-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yinjie Yao <yinjie.yao@amd.com>

commit 79405e774ede411c6b47ed41c651e40b92de64a2 upstream.

JPEG rings do not support 64-bit user fence writes, reject CS
submissions with user fences.

Fixes: 14f43e8f88c5 ("drm/amdgpu: move JPEG2.5 out from VCN2.5")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 3216a7f4e2642bda5fd14f57586e835ae9202587)
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-63847

 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index f87d0f6ffc93..a094dd138c0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -641,6 +641,7 @@ static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
 static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_JPEG,
 	.align_mask = 0xf,
+	.no_user_fence = true,
 	.vmhub = AMDGPU_MMHUB_1,
 	.get_rptr = jpeg_v2_5_dec_ring_get_rptr,
 	.get_wptr = jpeg_v2_5_dec_ring_get_wptr,
@@ -671,6 +672,7 @@ static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs = {
 static const struct amdgpu_ring_funcs jpeg_v2_6_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_JPEG,
 	.align_mask = 0xf,
+	.no_user_fence = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = jpeg_v2_5_dec_ring_get_rptr,
 	.get_wptr = jpeg_v2_5_dec_ring_get_wptr,
-- 
2.53.0

