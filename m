Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E1472083
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346284; cv=none; b=q2Anw/pHyN6jskdTEDnJqRKHfuGOqamZnG00Q2Fizrjq2V5o2+FTn3Xnqy1TH4xmSVPKy4u4VRUoIRyVtkI3Cjs13MWDLa9+DyCaq071XAiyTD00ER31+4419zWdKR6u11UbRL94SAmYkFNVOrvAyeXY171vmwVAV3dUIm96yLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346284; c=relaxed/simple;
	bh=5C0s/9UucVAGmXDEl+xwewW/gLO4zg1pKiD4RPTspKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G2uVQTw2j/6liB+j/qVuSBCnMkLU2gDIzMTXgMJflAUHUYFun2JSFBjg8tPD5c2vTr0UE8eMPKVFqENm0UUZnDo9gK5qNnotn/2pu1gaqvgxk9JPuvIp+dn3DaGfA4GNq8Ci++JjX1oGu3eKSHPH+FYIuaZj7zw1Xq/C0bkqPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5iGUe1g; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5iGUe1g"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a6634614cfso1058883a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346273; x=1788951073; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=M5iGUe1gc0hu7UCXVuZQ6eqxeK53tIsgVH0pkcje8+eax6BHdYwFfRWJGRlAB4BPGQ
         XVbtw3L5t1VXi+9pWMrXUesFJgS1nhFpbQ1oewj3KIt6kt+QmtW4jHXHzOwNW69IQ9W0
         8nVrw1NgRHiZYl9or3IGCAQaRgpzQTKP5tD/X5b9FM4pxlWB/gejhrdgsTHme9i56P04
         un3E8AYBjomzrSBcGxv/eKQ0rUpxAEC319HUjySf/+Jdp0JZ4v0QdR63jbUX8wtWe+7u
         jX1+ik0c5yPMnZqQGZByUYIPbAEDyKLW5grqvg/6F/ayDR5HqHojiqE/PQxfz+koyg3n
         MMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346273; x=1788951073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=bAIwL5QsGPZNmumg3mkh/nZs3jNYDXwSXWkFi6xBKfAqegCTBJ8uoWHOmFHfrML5y9
         v4E7Z0Sg1DsDAnF26X3c78/EoKaCmN/RkqDogFOKahmSknTt9uCi8Oej9FSxia9gsDHs
         9abJOVFBC1jVqUKEcZ/fXx7cCtQyEcV5jerSNLaNs/+sTVHda+YE5AyD1uypd0lbOk1r
         lBeUGb2MtbW+lw3Uodbqhwzei0w7/5bHqnztVXC2vsI8/i+6MtFZ8DThgZpPEyYYc+Br
         kMfRjm4VOhjqS/u+n182IZSdZ2z/zh+5R1W+WLLcf1js8+Bn0TSnNx8iIpDq0kmnIl3q
         4yoA==
X-Forwarded-Encrypted: i=1; AKwUvBxOEJxq6oJnhg26fJvrCQwV3GDF8R1w2pZNaZ1JmtCbEHpazJtNTcuuiBUxDknt5XHs1ZZrJGyGAl9E/Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++kb47blhX3UfAGALTKmkqOApEDJ2NetzX8L3yZpQ3zEk9dy9mfj
	wDTb3NN7+GlfWFReG2vjAlA32WWflSJ3mKgY+5xJEE2qMd7RBPR14LOt2yqijq49ohcK6u3ukcP
	O2XnpqBk8QT6PI4c0XFpPkw==
X-Received: from edyf4.prod.google.com ([2002:a05:6402:684:b0:6a5:e070:f1f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:46c5:b0:6a3:f47c:969 with SMTP id 4fb4d7f45d1cf-6a68224ce3emr2605259a12.3.1788346272605;
 Wed, 02 Sep 2026 03:51:12 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:07 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-6-vdonnefort@google.com>
Subject: [PATCH v9 05/10] arm64: can_set_direct_map() if BBML3
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Systems supporting BBML3 can split blocks without risking unhandled
page-faults. It is therefore safe for them to set the direct map
unconditionally.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..58898ae53f5d 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -99,7 +99,8 @@ bool can_set_direct_map(void)
 	 * Realms need to make pages shared/protected at page granularity.
 	 */
 	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+		arm64_kfence_can_set_direct_map() || is_realm_world() ||
+		system_supports_bbml3();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,
-- 
2.55.0.970.g62bdec98f9-goog

