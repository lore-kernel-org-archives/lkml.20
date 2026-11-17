Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.210.91.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919852;
	b=wjeo5ABCsZ4vYzleM0k9A6RdekIccZJcU8KQZ4i2gm3efyEIr0BnnxN2MKrAjEiaFeJu
	 YAOQWXyJNqzcqsmbODK2bKeFngdnh7SnvDMmC46x4BYKQomvK8JlK0uCwAIRzEZX0UjLJ
	 MMssVkdEzxAbobpSEfNHxmWdxFFK5bLLmUUOQusNdGskPWW/KdjPnhpDk0BwKgRbf2+/l
	 BcqJ8uO1Z/+ZL1STeAiSIxHTAXKGZFcvqJVy/kPjR8zCGem0x1KB8P6G2E25lk6UdvxtW
	 Z3oywEOOzb07cY2302/GiTwn6wAhO1vJEC+j37dB+mm3DwH0CG49kDZjStOHXrw8EfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919852;
	h=DMARC-Filter:Received:Received:Received:Received:X-OVh-ClientIp:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=NmRVqvgA6LQRfVb3+xw0hm11h1ZXb2VqypRcp6l/2Uw=;
	b=Iqw3Qg0Ahv7hCNK1wP1AcUNtIHgtdJdpC+bKF+IFRbfwR3XeqjlChhSMH/88bsYxjQ4k
	 yYhkl41pdVWUkJvlS874VY2t/gq1QDj0uYJr0CJYyNfljQzMcjW2FPe3UKg8RoXoqJkRD
	 5HsIxRD+htv97NmMAB0bOJW3olxXIjmSf+QCCHRpweeTdKiC3bNx+V3zpxQow1Q23ck2m
	 6zM1XXq3ETKZU1uGnulAX6lbLuQr7HLctAwnZ5M0RZvlQn9DajWNMqrZ93PguYGLsPjSq
	 6kAetrvPv8+t2IIWPIF6Wlb5U94Aj3nxNHJNqcPS+rttoDGklJkyn9rmtB4Bxo1hj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pixelcluster.dev;
	spf=pass smtp.mailfrom=pixelcluster.dev;
	dkim=pass header.d=pixelcluster.dev header.i=@pixelcluster.dev header.a=rsa-sha256 header.s=ovhmo-selector-1 header.b=IhHVfrGP;
	arc=none smtp.remote-ip=51.210.91.51
Received: from smtpout2.mo540.mail-out.ovh.net (smtpout2.mo540.mail-out.ovh.net [51.210.91.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B360A262D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769B360A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pixelcluster.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pixelcluster.dev header.i=@pixelcluster.dev header.a=rsa-sha256 header.s=ovhmo-selector-1 header.b=IhHVfrGP
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo540.mail-out.ovh.net (Postfix) with ESMTPS id 4jTPjJ2zbpz455y;
	Tue, 17 Nov 2026 12:50:44 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <Felix.Kuehling@amd.com>; Tue, 17 Nov 2026 12:50:44 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.99])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jTPjJ1Y8yz1yXC;
	Tue, 17 Nov 2026 12:50:44 +0000 (UTC)
Received: from pixelcluster.dev (unknown [10.1.6.7])
	(Authenticated sender: nat@pixelcluster.dev)
	by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id BF5878E2101;
	Tue, 17 Nov 2026 12:50:42 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-98R0028db774df-3351-4ee4-850f-8694323585ce,
                    00F4D7524EDFA56606BD67631AE7EA1B984E627F) smtp.auth=nat@pixelcluster.dev
X-OVh-ClientIp:141.95.41.139
From: Natalie Vock <nat@pixelcluster.dev>
Date: Tue, 17 Nov 2026 13:50:16 +0100
Subject: [PATCH v2 10/10] drm/amdgpu: Bump minor version
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-prt-explicit-sync-v2-10-bb3851cb6a0c@pixelcluster.dev>
References: <20261117-prt-explicit-sync-v2-0-bb3851cb6a0c@pixelcluster.dev>
In-Reply-To: <20261117-prt-explicit-sync-v2-0-bb3851cb6a0c@pixelcluster.dev>
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.15.2
x-ovh-tracer-id: 5594596638179156284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGsrjNRgW72yCqkGsXCnOvH7Q6+rWSTt0QN8D7NsOnSRWHW0a1UZ4YzwG3PfGhk2CpDQZK3YXmisSLYwZztr4rBMwMPXW7T3V/AOBPzHqgdP8gAtZmRSmFwzhTkWYmyZ/ZDp71KSx/CkbaMRhkClvUYNnGrD1PzweJNkj3z5YHhSlWNc9ry/1K04Ol0fBWNhEL66oxzy/AkUSTRdOPfSv1iAMFatuXPZ4igKw3QIc3MgFbd7EmFmYSHglT6XHKAJXimVe8T8Fqv0mPC+Q1p7iYCKLwWZoNUbd7LT8X0mEGw6E+B5EkhOIFNfODtMUftuzqYdLPtOdruAs2418yTTya6sqzn70iwvealvmaqO4anQOfF0wyMRadUwLGMt4ZUTHfBGEvltLlw/9AcjUUkuL0EG7JdVBqy2JfP6TZfo9buMqWSnGpxlGstaxjaKBDrftHvEqpH33VxEkxue/twETVtfkDKVbgPUUQEn48HuzYFFTyPiGQx/tNfI9v4b/cCzszYtvngNmRTmQyy4hx2ipsoPVr2yKem3XVROXv/KzHj18OKOW0RUvhKkCwjH7j1TIpqGkUDWsIwM7NuirMJPFiooCNCb6eUHV+wGPcWZWti64U6MFKk7asAf1jAROkkwwLMeZqa4m7ZPMQxmFGr/JnW6teXfeI93yp1LfHh0emsDQ
DKIM-Signature: a=rsa-sha256; bh=NmRVqvgA6LQRfVb3+xw0hm11h1ZXb2VqypRcp6l/2Uw=;
 c=relaxed/relaxed; d=pixelcluster.dev; h=From; s=ovhmo-selector-1;
 t=1794919844; v=1;
 b=IhHVfrGPVz4jxFCa/EIJa5yDhr86zA2cKFQezqSho7Ja9xa/n+YivJ7mssW80C/ZnNBbMS22
 Rzf0IZYYg3ZNzicPHKQq6tXOuiJF9uTnipYxoqFoVi/EUTZANKLXFxkZf6rggWEWuoFFcLRe9oE
 SA+foZpLhbCy1QgS24nDC4AhYve6Dcce6xioEWxsD8+dhjAkdRQO60aYB51B+qLxz06tLS432lK
 cggaj7/t6y4lUcdtejR4+Vu6dSLn2E8b5HyY64OuAC7tjEqkIPO/fDXHxw/md0Q4PNH/Mz7Tewo
 GSqu9TMvqLh3aHZUfV7gqyJwNKSEHVf3deQPfEisDGLBQ==

To signal availability of the new AMDGPU_GEM_VA2 ioctl to userspace.

Signed-off-by: Natalie Vock <nat@pixelcluster.dev>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 188c8ec234c02..5b0c373102068 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -129,9 +129,10 @@
  * - 3.64.0 - Userq IP support query
  * - 3.65.0 - Add userq syncobj timeline signaling support
  * - 3.66.0 - Allow jpeg type 4 packets and VCE SEI command
+ * - 3.67.0 - Add AMDGPU_GEM_VA2 ioctl
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	66
+#define KMS_DRIVER_MINOR	67
 #define KMS_DRIVER_PATCHLEVEL	0
 
 /*

-- 
2.56.1

