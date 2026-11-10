Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273224;
	b=BoQZYyBKBK1e8kNExXg/6yy5tSCNV34d7TQ1UiTWa8CA6hSTawoE6CP+DWY9XpldbH/7
	 jbuVxodUocDoW8F6bbnFEYbGT3i3ZIUPTwz0R6PEVqw6xo8o517FtZ8Gn3jflYb5WmuNM
	 yPjUPPiB1YO6hU9fM95FHiOah04WDJaVPVdRuttCAGGft87RpKNndm4U0xQnk7vDZ6LWH
	 fpeTvtFLP0GJWRaXJfUzMN0/+Z4F/9EwAB3JmMv6xPkL3XC7eS/iyr5p3/hlLfg2aRarn
	 Gl/n5d/0TMopjRGWigW+YzQreuBo2TQAUh8EURj8fG471H1daichh5sJQ83oXF524HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Asvo/JWf9IudVRqIRZvrwZdNjM8xuitU/qHAWd3ZeV4=;
	b=ufHWcLAfN9e6CJska42ErF3+tbEqMGx37kH5YANofAj/4fCIdltyzN987tcH+Sv2y38u
	 XLFrAEI52dEKzz5SNlYDD6Cmfo/2GcdOMzs9bxL+nWt5yqjMisyQzj/46aMrudi8377q4
	 Zmt0F5G5I3BwbOmhT8yDjpOCSe5Pq+XoZvNyh2XGpVJEvc2ToUUEQYkYUXf+jSZG/gXH6
	 vMYOFZYaRU4sC4HL7k72EIM7M5HPo+XyPO5RMREOtet7ZcxoDTJXzd1kZ1autN/UEQ8aw
	 kv8WAQhwaGsIBTIhIXG3VmFdGROptNyDKyiTD0MZdrDU9i0jezqifLeSF2870kYu0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERgbyNMa;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC873606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC873606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERgbyNMa
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so1736309eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794273223; x=1794878023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Asvo/JWf9IudVRqIRZvrwZdNjM8xuitU/qHAWd3ZeV4=;
        b=ERgbyNMaajIt836onPJCUGm6DMU299dko/91aLReNQ5Cc10XnlSGtuwbhBH9WllJbC
         h10zSXh7ARPfz4zaeCCvUdA2cZbFAQ0uQINMMa45GbtORy426bEzdbA4wC1fNcxnbygE
         Er9EqpZbFMXG2OzKo1TQ22L/nSQiIRqGJyHs7Z0ahKXq2VqnVBS0l/0x18uwM2hEApM0
         dug6frtK7Y85nmuSezDkfA+WTinePoiJWWD7e/vDJKY7bq6nct4UNIH7v5eU/ovlTS3A
         aJj3Fpi4lX6y5nA73P2DFmZMQxq/zZi6CR2j/VAph+/ku/boyMkm3wAVgqx0Yu9+Elkk
         dq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273223; x=1794878023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Asvo/JWf9IudVRqIRZvrwZdNjM8xuitU/qHAWd3ZeV4=;
        b=W3FhcfssMStJcLgAHJjikcCPgK3qnaaKX8TCfo8xZUpn1P4bpHve5iCjTFpJsNxQYC
         3VEyeZ6WqanQh09+XGdX1kV8IwmCx0gTTBFYZu7zIhL6PYEsf4iel929cH74fe+kp5RT
         GBBqh0ty4zV3KTBuCRLvqQsKppWJFVd3oqhyiUylmAvJZSsvhAFpGwMRsijHjCOjcgMJ
         jxVnaZtJShLah6Qk0OVbmkJyfHclZKOaAAMPVaVRtovtg4KUU4F9b9Uhhd1JQLacYnDx
         EGj/ttjC3i0QIABbpJQwYdG7jT9JGjkTqE0GNC4sp8DPV2cOHuY6z7VOAWI4GE0clZs/
         TblQ==
X-Forwarded-Encrypted: i=1; AL+hErFscyO/gkeT1jAhCBEP+Yj0uA+WL4d2gXS7PTL0KLk7JE4Q1aU/63oyWzYN+6yIlPJudFrC9xOjnnKZNc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QI/tHN2NFEi8KE4QI8XH5UVgrkkdkqbnDV3Eew2pgsTZur1oe
	n93ADuru85SqZI+xorTQNJFV7h+6tGJyV7eQEUjHpq3QBJChyWwoSH0W
X-Gm-Gg: AYBFou2sAaHAovfpcrBA5XxkcJja6Pqsy9jmhuNlEcvI+qvvqZ7AxcxMjfr3LtiKhpo
	NTjgTO4J4wJ7naZae//CFB4kNpoNEl8EV22chOcD+aSSILcNDhQXrQOEzt+3v2QOdooGTr2RrUX
	CtnQo8o7FX4Jup/kary3gEw/KoJKlhlbuVZmQQzzm1LmK397/akEFTusgrzAs+qO9kWWdtJt4JY
	0d2DKQzwrDcg77dxu/e5xv0PAHa/nocn0SZN8+zWsO6nYFGUyFEVsrCUjU2rbHEz3dYoNeX0JIi
	YOIo5o4gBv1+mX/t4PyZ/GtO5KR2dkVNWUNNVI6J91AGbQU9eTDl3YnElWHPrsjFdzjiPadXonW
	IkHveMWxxrJIIORkGblxzQaYgVvi7A8kEQ9p5G3P9HyrAIH8lKSYbuKJ7w/1TYacl8PhFQT0Prr
	aluaBucx2Vz+9qISp2/ZFI7t5qUryVlRR1Xs7V14fkEDc2maiagnqkZwsMPN4ungGqNYZG6oXmp
	TJv950Te+PbKtHqZkv5GQB1DRMCQPIzfhSp8li4zUWp0orHmFJX0w/KzQPKJ3luWjY+TYKM6DWJ
	xeY56jljc/448fyJ
X-Received: by 2002:a05:693c:20ca:20b0:375:11dc:7222 with SMTP id 5a478bee46e88-37511dc7739mr1460603eec.21.1794273222784;
        Mon, 09 Nov 2026 17:13:42 -0800 (PST)
Received: from evangelion-g ([2a09:bac5:40e1:11cd::1c6:7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm2043005eec.10.2026.11.09.17.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:13:42 -0800 (PST)
From: Ayush <ayush37735@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ayush <ayush37735@gmail.com>
Subject: [PATCH] drm/amdgpu: fix kernel-doc in amdgpu_gfx.h
Date: Tue, 10 Nov 2026 06:42:56 +0530
Message-ID: <20261110011256.157652-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings in drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h by
adding the missing 'struct' keyword to amdgpu_rb_config, properly
formatting and aligning member documentation comments, and adding
an explicit Return: block for amdgpu_gfx_create_bitmask().

Validated with ./scripts/kernel-doc -v -none -Wall -Werror.

Signed-off-by: Ayush <ayush37735@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h | 31 +++++++++++--------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index 5939e1fb3..96f4e4ce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -181,7 +181,7 @@ struct amdgpu_kiq {
 #define AMDGPU_GFX_MAX_SH_PER_SE 2
 
 /**
- * amdgpu_rb_config - Configure a single Render Backend (RB)
+ * struct amdgpu_rb_config - Configure a single Render Backend (RB)
  *
  * Bad RBs are fused off and there is a harvest register the driver reads to
  * determine which RB(s) are fused off so that the driver can configure the
@@ -191,34 +191,28 @@ struct amdgpu_kiq {
  */
 struct amdgpu_rb_config {
 	/**
-	 * @rb_backend_disable:
-	 *
-	 * The value captured from register RB_BACKEND_DISABLE indicates if the
-	 * RB backend is disabled or not.
+	 * @rb_backend_disable: The value captured from register
+	 * RB_BACKEND_DISABLE indicates if the RB backend is disabled or not.
 	 */
 	uint32_t rb_backend_disable;
 
 	/**
-	 * @user_rb_backend_disable:
-	 *
-	 * The value captured from register USER_RB_BACKEND_DISABLE indicates
-	 * if the User RB backend is disabled or not.
+	 * @user_rb_backend_disable: The value captured from register
+	 * USER_RB_BACKEND_DISABLE indicates if the User RB backend is disabled
+	 * or not.
 	 */
 	uint32_t user_rb_backend_disable;
 
 	/**
-	 * @raster_config:
-	 *
-	 * To set up all of the states, it is necessary to have two registers
-	 * to keep all of the states. This field holds the first register.
+	 * @raster_config: To set up all of the states, it is necessary to have
+	 * two registers to keep all of the states. This field holds the first
+	 * register.
 	 */
 	uint32_t raster_config;
 
 	/**
-	 * @raster_config_1:
-	 *
-	 * To set up all of the states, it is necessary to have two registers
-	 * to keep all of the states. This field holds the second register.
+	 * @raster_config_1: This field holds the second register for setting
+	 * up the raster states.
 	 */
 	uint32_t raster_config_1;
 };
@@ -587,7 +581,8 @@ struct amdgpu_gfx_ras_mem_id_entry {
  * @bit_width: length of the mask
  *
  * create a variable length bit mask.
- * Returns the bitmask.
+ *
+ * Return: The generated bitmask.
  */
 static inline u32 amdgpu_gfx_create_bitmask(u32 bit_width)
 {
-- 
2.53.0

