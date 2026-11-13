Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601443;
	b=HabbF6HTQThB57lBCCLCCQ2aLADXqBofqpIeBhUiLtdGhDD5P8u0nm2FOq6zTGIvReIi
	 dfrTd9trAzsp7FUoQLfSlGDgBh+4vzsQo0IrHC6IbAevCTWY2Og0/WUJfjIhC5bO+EE7N
	 SrqyAXrtkArWc9P1UqnG9txoZVkVS5eLH47ZmiTGW2mn8OmwI2GMtaHzPh7JFCMVJVNvr
	 x79j1KbiDdTT6dEdWi+wdk0QHjGnhgNQI4NUXSqTvZtI+KddCRadbqmGeZvj+GjChaQjK
	 v0QiLMpqJ9Pmlg21ZNuP8GQ0QZWzZFts90GPT21PeAWv8OHJY7bwnFpULTmw4L2ZLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
	b=1hoONc4Wg+EoV5mbtwjepBtknDVG8UMbTJvjcc7ieQLwEa9SDYkXALcJXL1VMfduNL1F
	 79SdL7prkTnzat/T4/qR6zmAnXq0/ghGkcfwZ+0dGLgL27i+DYY+CHEpmc1XUyYbjEk+g
	 MDCd2o9Z0xoMelFirIYowhbh9ijsUSjEGEnW8TebSx2lLCjgzaSoZr2EYL2uAZtdYpGZP
	 gGHlHCz7DhN37GecDl1nqJEu94OvM3jd72PqXfT5oIs0CBv8OezPzjXL0kFoH+8YGJhL+
	 Ahj6wJXxmrSogxEI087gi2KCG/1mANOL6ECTQyhhCLhgjg1pRseWDcoZWD1LUeKjPfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFXLIUtM;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871C606A8B7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A871C606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFXLIUtM
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9115325e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601441; x=1795206241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
        b=KFXLIUtM6AdBysF0IcYKp2OWu/zq9uLZ05/8bsUylIrbi4Ystq3ItVsjnhScR6FdOF
         /kqebKcQZWDtzSf/QEJzaC4nbIiXFJLLq0bKCXxvSpD8G5+/TJpKMEoJtFNP2lc93/zF
         a1irRLp7AfT9LoXvJNeuiuARJMYRZNTm8COdkp6t3BX6I3XumkxIiIFQydZIXTSkHIwQ
         Zg5duJMJuxueAxmOfS+fA0IKqPtI7f1LGG8G1x8y2pn4g+pwsIhM66BXIC/tWigP1ld3
         1dKuycJgtp8J7WFOa5IhUJ1tJ5BLtMCatqpeJp58gFekHt3lDxgNcwroy9iSJsLANAGc
         WRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601441; x=1795206241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
        b=UfZ/hGXuy9FZuIWuvaRLPNF7kmO9utLmCqQuaqsturpvNRV/B5EInIpPbTSvI42d3y
         mgvUJaCXTgAdax++gZ2OHFcVu/EtA3h1NltGVsA9cXV8tmrtZ591qKD8lpdCtkU9UT+r
         zkM5tVXo22uAipD2aXistMjdWS+2zX++dXAhiXBiZGHFO28fk7ZUkPUny1BBA4d9EuPJ
         UeOoePUJk1RNSIQI/TpfTHTmdLEh6FlPJ/r6GcpzRIx0GFtim31kxetwDClTsbYF8JdV
         XOIiJ91dciPnFlRUyJSA0k5/UhpakfpSTBu5RSJpZp2ZR/OL4kt76FUwGztdt5pFMzwZ
         jCxA==
X-Forwarded-Encrypted: i=1; AL+hErFg7zL6C+B23sT/DIGq3vjZpiasBrKYaaOpgoQG4bHWbZggsV+TeM+ridwiCIsMtPnquLi2Y5P/knu0x4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z88e6yKUvWTZvPTzecRKF0KspWayR7ErtCKCUcVlo9FtQ0ZIVn6
	hA5kuUSww6EV0BEmdZsTmunY7ZXOC6YwYMrO1f4PZnqUrWYuSWqaTk53
X-Gm-Gg: AYBFou0WaUqwGQv4FwEtgBbBy0YHxetoHL6PuVwAOq6FfoqjX0XKenXn2805JmWL9d+
	YXQyG06uR1qN4pJfJCrfumb+wG0bhpGjoJY9FqO3Ozyzamsqb535UWQDJheRRRRvyV6sJCAhU44
	KhQsyfSul2x+tM+LkVyifGZYNYepRBdQxzWUzzyxig5tcOHbyKSFrkBGZmaUehthbl3RkZNKeNo
	RKlCjheNOElkmCEmUvcHUTazh5IN6wJnOzumg4b1QkDmmk5dG7Eq/WAKC/ZPPOX9JRe6DdjGBQD
	P5yMxU0pAJ2m6YNMqv5DZJp0w+mLH0AhWfz99TzayXNUFDqs0iwDi/ZlV+fzwUEgsUd3hmeIS73
	oBoTTpXHFbnsZJnpCLemUMmEtRJ4ZCyjWpJK+EigiIVROCBQzz5ArppSv1aJWqqaE76Mg+Atnue
	2l6PrHuVQ4Mzjt5nOnkTnUy3vHriX+V2cHuvvN0zlDi0ph4x6rQQkVI2ipLiySjbb/r+60/Gp9f
	Z0W6uKOdYv0io/05/3DvQ28yaatrnVj7asJwlRihaZvfPFH+4SyhCPvop7fYuDNgBiNKGxRnPbP
	CFtaMz1MpQ3s+/DqC9Wx4pja7Nu7nydanW1sFQQoVNQtxB0nwb37UA==
X-Received: by 2002:a7b:ce9a:0:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb55a911aemr55130455e9.28.1794601440992;
        Fri, 13 Nov 2026 12:24:00 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59505405e9.1.2026.11.13.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:24:00 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:26 +0100
Subject: [PATCH v3 4/5] landlock: Simplify landlock_get_fs_access_mask()
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
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-4-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Return the handled FS access mask as it is, instead of artificially
adding LANDLOCK_ACCESS_FS_REFER to it.

Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
rights"), the merge operation already bakes the initially denied
access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
access rights. -- They don't need to be added explicitly any more.

No functional change.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index d9ebf4857fce..812c324cb6ef 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,16 +262,12 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	access_mask_t handled = domain->layers[layer_level].handled.fs;
-
 	/*
-	 * Handles all initially denied by default access rights, but only for
-	 * layers handling filesystem accesses.
+	 * Initially denied by default access rights are already included for
+	 * layers handling filesystem accesses, see
+	 * landlock_upgrade_handled_layer_config().
 	 */
-	if (handled)
-		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
-
-	return handled;
+	return domain->layers[layer_level].handled.fs;
 }
 
 static inline access_mask_t

-- 
2.56.1

