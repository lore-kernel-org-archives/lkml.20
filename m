Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017540B11F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184916; cv=none; b=TTWFSv9RywOPnetMpqwvS5srx4GGw2iLTqmVtJnSX/H6JfRRLTR0KlrcchnshaBeinbpR2JX9jiU6BTplHuZKrOdAR4h5qwOmGn8pJVZ2vjNIdPH1B6tVZgMA8iQyesHq2hVTGR0RxhPPOWJpRm7mZzxqbu20H0QvsHH+Lu4iwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184916; c=relaxed/simple;
	bh=EMiwijCSi9gVRyUeRj2kGmZadFEy+BUHc+JcXjP3tuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eu+4OqEbEpiZB79vIcYx77n1r044as7AAP34W/5CvAM2HvDYZ2hDrYGbF/33RiLXxOiGhZCnADdYdXHZFfYydci2APT6oLZw5qY2QO71l5yBB3IiirfvAfv93cixpe9kGVLbJNzmZAz+/GhaI8B48pDhsYBRLgJeN/9TuBjEprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uw5RN6x4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkpsI+tn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uw5RN6x4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkpsI+tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790184911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/r6AwuaWI+e4d7iGoKYDG/9yrPmbnqwvnnzXS2lDObo=;
	b=Uw5RN6x48dkym/2RTmWnrXQgmWiqYO9ywMjhszl336P79penvWb38YrofBDSY0B0x1YHSi
	oQISSIWsh0jmB7pLc/gVeDOCEBc1+LDS6gxMCRCSeKoRrKtXG1PT6LLYgUdVdImJARgnX6
	EgJcce2fcd00HN5MBqef+QYmDXGQ6qw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-ia1XsDdLPa2ffllOtLgveQ-1; Wed, 23 Sep 2026 13:35:10 -0400
X-MC-Unique: ia1XsDdLPa2ffllOtLgveQ-1
X-Mimecast-MFC-AGG-ID: ia1XsDdLPa2ffllOtLgveQ_1790184909
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49fcd86b8d3so9512225e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790184909; x=1790789709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/r6AwuaWI+e4d7iGoKYDG/9yrPmbnqwvnnzXS2lDObo=;
        b=AkpsI+tnAbCar33EsO9QJ5QWszH96Oje2QnIarK3fKSN0j7y2gnkrnDO4X4wrwrNTE
         UlcFPzyCy3xnoMOgYeCf4RYYJ9BleSbkrl5CyHSo8ItcrQA0GLXRgmztvmyIAspwrGDo
         W48a6i2CcG7lHwRK8XeFiO5/7WKa1GoBXNV9AwMcwTy7r2TbHvNlBp/SfLwG7tprlczS
         GIuZKwzRj1mVFW9Zhz4TrYAv9wd/Q9gt19TsPUaDrsZugM2ovIEPJlJ1qDHF/l5h2btK
         Y9iGKPrzI4iNxHA3HyNo4i7+aX6A2RP8VsWJDamMV4uuezZxuMkcpCNKZGoHzLc/lkET
         90/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184909; x=1790789709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/r6AwuaWI+e4d7iGoKYDG/9yrPmbnqwvnnzXS2lDObo=;
        b=uqjMa0vgidw322Xkn8R0FcioRteaTdKIlmvKPWJ2pYvxNAlMOyzJO6VbncJev4pz9V
         Lo0Z3MJECrfk1tbnbI6yvpUyJpSu/2sVlCBhmgA4IqrvzVK72xyTqSOSjLrD1VJecsLs
         xzrJUk2CH5HOOn23p+RncXv8EOgCbeoV4t5Gv/kQUGL4Ar37lRVFOtBD7gnQwnu/sv7V
         UfUbBLSYzVH6ddKe8MgQRG6IaYYnHCSEZlK6fNRihDnAON8r2AHiGQD/5tE2vA7HuF9R
         BFdh/ksrmQv2SWh18MFONMDZFmme2+W6sBV7I/17FdPX0S9dPo6h8t1FT6JppVAwG2Ef
         7tTA==
X-Forwarded-Encrypted: i=1; AKwUvBy+0H+VqoIpuXAU/7Eno+H6pu4snWVpSLwDcSBbalzpogcsTaueAx+rjfQafozp5Dt8jZyk+8bA+LP0SkE=@vger.kernel.org
X-Gm-Message-State: AFuF++k0jtyLWeIx8WWeyXhQwjkn0WSkmk0mt0Sm1RBsd50IOXyfbY1z
	s8xaKEEXPCx0mCKfIWFhLhGVApRbwO0jSgI/CZBl6fi97o6WyvtsO5kELYqlTg082vS88UfcBx8
	BKP9ivXqbubN89Gv5IoXf3Y3uviEF+sE0hHekTELOHPbyAh/mAyqaLLSwZRtRFgWUew==
X-Gm-Gg: AYBFou0j2r+6vISrUSCho4TsPGKaio068rCXnVfjCJ/V+AK3PsZnTyJMZkRUDNV7WGP
	WWwHMJy64dYItcoHJ0PXwNOEKiYYDcN8gVC83UzCb4L5zvUB4ZNcaobiMK1wQtLA0niXkUPWEYe
	cQ+ylIg9+ToKV1nPVvNR5stQtM/XcGepuOJ16fityoGIhY3fWQAyINipxwHslqZ45TZxAS9gt7U
	H8Dt+7wvPBn6Ps6ra/pkwOCPS6sG7hl1EvlOfMSG6+SQDEvEKAQ/UHgF9zXRUdlAtCzfkrsTFck
	opxydnCYZv6/VZduPhz2uflK+TDPhuypakHMcGtt642HA5dEtXQ4SrXMhVxFVvz+formMrRG1Ke
	8L3ATuUxRNJ4OKlXdCigOFptnXZfLZ+Dun/PnbD+Sp2qBwGFDU7oVgQ==
X-Received: by 2002:a05:600c:468c:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49fdf15a3e6mr54023925e9.29.1790184909095;
        Wed, 23 Sep 2026 10:35:09 -0700 (PDT)
X-Received: by 2002:a05:600c:468c:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49fdf15a3e6mr54023415e9.29.1790184908631;
        Wed, 23 Sep 2026 10:35:08 -0700 (PDT)
Received: from stex1.redhat.corp (host-82-53-134-131.retail.telecomitalia.it. [82.53.134.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfbc0csm1404045e9.13.2026.09.23.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:35:07 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Paul Moore <paul@paul-moore.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] KEYS: trusted: Fix blob allocation size in tpm2_key_decode()
Date: Wed, 23 Sep 2026 19:35:06 +0200
Message-ID: <20260923173506.41519-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

tpm2_key_decode() allocates 4 bytes more than needed. The ASN.1
callbacks tpm2_key_priv() and tpm2_key_pub() provide the lengths
of TPM2B_PRIVATE and TPM2B_PUBLIC, so ctx.priv_len and ctx.pub_len
already account for the 2-byte `size` field each of those structures
starts with.

I noticed this while reviewing commit 114f00d738f1 ("KEYS: trusted:
Fix tpm2_load_cmd() boundary check"), which correctly reports
ctx.priv_len + ctx.pub_len as the decoded blob size [1].

Let's allocate exactly that amount, matching the data copied into
the blob.

[1] https://lore.kernel.org/linux-integrity/apfoKo-BdwaLXtkT@sgarzare-redhat/

Fixes: f2219745250f ("security: keys: trusted: use ASN.1 TPM2 key format for the blobs")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 security/keys/trusted-keys/trusted_tpm2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index 01f18bb37047..a9b8a31a637c 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -115,7 +115,7 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
 	if (ctx.priv_len + ctx.pub_len > MAX_BLOB_SIZE)
 		return -EINVAL;
 
-	blob = kmalloc(ctx.priv_len + ctx.pub_len + 4, GFP_KERNEL);
+	blob = kmalloc(ctx.priv_len + ctx.pub_len, GFP_KERNEL);
 	if (!blob)
 		return -ENOMEM;
 
-- 
2.55.0

