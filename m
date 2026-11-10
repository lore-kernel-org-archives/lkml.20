Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326672;
	b=YdZfIaXgtoALDevzIx3Pp7lqvKrp1BNfrnmMDcFD5uvSLpYzCGGFS/H4M+FB4c+KDvID
	 l1+vpsWOSB+JzlwI+DD0yTo25a+fg4hCjRlz7xsIHMQStOfrcKN12OExriN3cfLR0ykRO
	 T2DGUaD3si/iQsfEfpbfer1X0NkkIHtTbjuidf1sqLN9/e36ySJFMB9hRoJyh7khdEOU3
	 AqJlBJZENdtPvXvQnFwbjUfAcKfb3DrKrAmFwmLcFWNbpVZGUdMRFs0uB8vqkrZ9/hfeB
	 trEDTsW3s68KO0fSjBx9Bndme0gQZxSINu6Tmc2kdcJctEAmAxxkj7x+YOfmO45EXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
	b=iXvYSjAllzi7mT4MUyYgSf+Bip8xuyFmk9JpIS+5B8n2BGzuWaR+0eHweYw+gHHSIHZD
	 MRszyxFe7isRLezZwnzMvJF0Oja2e3s3fssicDqkEiYZR/v0rfNsxahFcmDMjqqsNqS85
	 6d3qEAqtA/1bO+ppJKe9wpD0QwZbgnnCcrrvzRJxw5Yuw19EuzHvOW5kx7a4Sl+SB9Fhs
	 kHV1RyZZMOFypPtuIdKYQK2CNx3gxhhxRnQ6qXMcajxjRFYwzZrTWDZp8lW102IUzkBEE
	 KQuEc+9/75q9uBShN/EebOuUzyNnFRuPkDiFc2xuS7aXWO3F1g3mJzogFks5vw36ncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkZXZyyE;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FA606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8FA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkZXZyyE
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1493542f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326671; x=1794931471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
        b=EkZXZyyELALl1yL9avVJv5lEXX2LYoHl1EpOSL0Q072MDRkldzJn0H9IG58wkGDEzJ
         18u/vxg7kD1o9178JHkH5L1n0UMjom/66QSgAdCOpMIJAI9iGC6zJzlZWYvdB/RIZ+mf
         ZlORW65mujj99BYyoVbpqz1slSzOVHDhRBDnglrfpmaDvWM8K4Uxg3nQE4j3Bz1JLzqn
         aBGAhplT9c0nuQnk4JqYdhK5DVUiYUdTGB7EErinTP10erFGLMujvAOa+zymBs7S5ohL
         ogUDmXYLVm06wyqrMoxQJzeUKlOKNUbMUOJUy74hmPwpdm8EBaTLoPAA6yxOYT7eWyTp
         7c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326671; x=1794931471;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
        b=PSfau7lYZ6Shz3Q01j846rZ/UgE++uM3YpV/QdzjhClOxgPJeMsLwysPjbZah3LSdB
         d3AW53HHDYdjKP46Xw4QGzKmHJuwMI84OkBC91YTLfyGUc3eF0r7OJSAlSRIF/0/H5Z0
         qOUn3pJ+u5w+2eVCCx5Wn1oN/Z01wwF5b5rEdJqi4JwSonBznbV/Ivoso0xSc74xDmvp
         R5XuHY26LS9NOL4PFNt3wIGjJd9TSFhB4zPGipUSARrudrKlLi8Mry9sHI5xfUNMoVA3
         4Fp47K7tz5s/AJXiVYPMPoSyPZzSdh1zNJB0xf102qysrHwP+r+fjMILmPY6qa+goPLx
         qzYw==
X-Forwarded-Encrypted: i=1; AL+hErGSMwM1dSXKwYI7SnVG5PS/7QWGUBGc0HtW9m2chwGVHsUzNcZtg9DM/IQ5bhcaVgkhPce6IhV3aX49Fv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yHgvp6E/zzwA3zjVofQ9YDVuBMEuOFJbqDTuRXc1RO7lwq1xM
	hzu8Lbr1gjzgaocMH7w6uZ640yJpBkhEA8E79d6zYJfCezTD+xvTPyoD
X-Gm-Gg: AYBFou0IqCT0Y5eTcna7QHM0gfZc6uAutBGhTG+oJ14wdoGGJuWobYjCBfP9WZj0+4J
	f/718C+uT9GQNJkRU0rApg7RBjrCoZuQ5Y6/XAfwM3JP9aC8zkWqvubSk0om0lW+X+zPRE1V+MO
	+z0PffqaE2VP9W0cGmTE23Y8+liWNZgGY+PrHWTJ3VNHSL1vbxh93z+PARzHEDz5ncLkJDMTB2P
	OC2PQhXAP4OEuEtlRGtM1fFwXrpYOIM5nwh9/EwwKeF1xZRimu0weCPDp+3X0iQck4NtMZ30RJ6
	GxnJ/HpGA9uybz2KhtmcM1igmp4l4VqABmzXlO/2y/KZ+yHs8bgohOiVGUzdfN9kc75gtja87C/
	c3ULetm1aTV+IenBvtzl96My4MO6v87Aihif0ptynjRX01DysNpQOFiVmQk2zuHWj1SfwYXsn76
	t+xGNyb9xITQBI2Pb9Cl6B3XCSdo3K7EzHbxrsdUKxwxhVcTs7ydTwGzmXx68bJV2NO1kzUJYYk
	f9H9+BZVLBvMbaNAefpLt/9zibgtUaTTyxaaVmyyrBoyf3SyQI+0+frWwNRV6fn5gU9iOQSmr40
	WFRlccpZ0/dBUgUEyXMhQCbD7HQ=
X-Received: by 2002:a05:6000:2584:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-4982ecf6404mr6123412f8f.16.1794326670681;
        Tue, 10 Nov 2026 08:04:30 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm6048689f8f.26.2026.11.10.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:04:30 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: make the read-only const array fw_err_code_msg static
Date: Tue, 10 Nov 2026 16:04:29 +0000
Message-ID: <20261110160429.892673-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array fw_err_code_msg on the stack
at run time, instead make it static

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index d025b4183b29..91c863649972 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -5427,7 +5427,7 @@ static int amdgpu_ualink_metadata_init(struct amdgpu_device *adev)
  */
 static void amdgpu_ualink_remote_error(struct amdgpu_device *adev, u32 status)
 {
-	const char *fw_err_code_msg[] = {
+	static const char * const fw_err_code_msg[] = {
 		"Unknown FW error status",
 		"FIFO overflow",		/* error code 1 */
 		"Invalid RB command",
-- 
2.55.0

