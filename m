Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6EF3403EB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250503; cv=none; b=tqAJZz3CyDfaKQGq1TkqOty4exLoV7nz9Hg7tF+Kmk5VgM8fTYyjMkbAd83fjQC28rZ5OT4PFELgdXzeBiHAR64WrFc6tpyrnWvpPLwqLc8/trP10JHCldsOtPhAyMebvX+X41wkUP2ow8xPNqO+UZwbsgF5t08/nVH0R2kBAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250503; c=relaxed/simple;
	bh=mmkEj2/6FluSuVa6kOpFI+95vVAVdqDsent70A21+zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFyHYTHLbrkRED1S6CXh6OTKflMGAzUEBM28oqPfLibAkXB0yCe0TAMEttK4Tz+bl4cnuzCmdvsPdRdx/GEkrO/YFZt+qvheb2FsIZc8+MEnYv8Mna9zk9IV4P4g/uTDNm9nRaBJkv4f9Mf6OH4ecsGYSc6ZsO4ysHH7QxUtDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/og+7vw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/og+7vw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso585109a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250500; x=1792855300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHLEUnpsV2P3ynQ8MKirB0DKPzZUp3tF3QyWRet8Yzk=;
        b=E/og+7vwzpPF1cy2RTRCcS6f0NnfQ6gmDiTk5XOEiRIHyz3R0W8YXMC5PHQtS2Lmhg
         RuKXapg42VAU1HUyTDSMNyUJL9CZhc7sJGmaX2DFZLwkdDvAm8gDsc11Icci3URXOVhl
         +WuSLPq5CmU52fZpZpb/hmAUft+EagOsBfiEyy9mRIYbAeZ7owUmcxPvKB+eFVqn16FQ
         CAVH2ZBLhsEM5aJpIODrOu2MAAN7VHWdaeGG68CGZemrJ2biKOSpCT+b+y7wRmZhT1a3
         s4dhXKiAYLNoRx1imsrvm0qxZVbbXA6qFzDWOqfcepG+pObA1y9ImQplJnQ9KEajOwDV
         q4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250500; x=1792855300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHLEUnpsV2P3ynQ8MKirB0DKPzZUp3tF3QyWRet8Yzk=;
        b=PwgyBb5kcvfXpcYOEPVZWulJ94gL7F/2qVravig7mvGZyMbb6gGhGJsB4R7kyd+T2T
         iZ3P9wtz7etiVVp80qhhdlq6+HpiqYi9wIlJATkFJmbi8841GXCIRPsHFrfaFnxmwb5e
         byk0zGi9symtvZgHCIU42qdWnJDolNx23Cyh2eg/1zAT1BiUR7DjPZ0F9JUTgPyiDy4O
         /ShIAIN6oJxJS9B6IIkd8whO2SrG6L2QW7va4Ff4hW19jxNFauYtVPF+j/NUfaJGO6Yy
         yXWDcBUlGhjtqkibBrXFY/1YjGBTxsJvF5A1N49oNwPkS/WL8sBuW7++lbyqYMU0dajt
         998A==
X-Forwarded-Encrypted: i=1; AKwUvBzBlH7jIWkMJS0jYwVnJtUuLCZlD5pTc0Y0omkY8TNDvWIpn3ppRccQ9nq1c2gpFH065j9ndbdwYqXBnVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/xGRzrGUtmCOFjO0NfrmxDRaUJ01wXb40clbpF4RKH1EyySDG
	/9BQnDIspTTmK+lpukZt12F63Hrcq33lCkMS+ZLE1764j58lrtLGTKQT
X-Gm-Gg: AYBFou32TPXOtRW2RTeHEFZfv8PWyIBH9dNeCBUwy6XQPb/6QQuVm3XemKMX2EVR+H7
	hHtza28ObzLQkkIf/KoISRmLAA396U+2ZMaMT4pHaz8Brx/STBSg776tN7hSqiIZrDxh6t2uuU8
	sgXvYNL1+/6tcTBkHy4MqqzZ+K9E2W1DUEtUrCN0T+lBoT27TODACp86WuBR8Vh8D3yKBRpVQZF
	d/lpqVpEVC562FnJW71mPy2dUw52WiiEb8b5Nn8krFaVm7sQ/vGlzJJ4oX5TBUdtEMUW44tQY/8
	LmSc75xKx19qfiiQ0hHOZr7CmqFX4IJfNyUskFJcCGJuEnY15nf7RFDuMSJn2h2ctVhyNFNgwUy
	WzB/KCGyqNxQzf20HaWahtn2/oUBCIuKbd617v0MzMo+gNVmHhGJ4jM5xO7yQu+Zbg0NncSnKsr
	YEniMQ/cYkyIo2my/DUTZ3X8vKt48B+dzFwLGnGfvY2N//59BwXf0lYHupe6a+BXd6mERPRytKG
	1MuthNEcs8=
X-Received: by 2002:a17:90b:4b04:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3acef52ae13mr2520951a91.50.1792250500220;
        Sat, 17 Oct 2026 08:21:40 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm8511142a91.11.2026.10.17.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:21:37 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] keys: big_key: Remove the redundant quota reservation
Date: Sun, 18 Oct 2026 00:21:23 +0900
Message-ID: <20261017152123.1200429-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atK186hMPBhYyPCN@kernel.org>
References: <20261016040004.324286-1-4ncienth@gmail.com> <atK0MnGM2h9IH6FD@kernel.org> <atK186hMPBhYyPCN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A big_key is charged a fixed 16 bytes of key quota, regardless of its
payload size.  big_key_update() nevertheless reserves the new raw payload
length before destroying the old payload, and generic_key_instantiate()
then reserves the fixed quota length.

For an update shorter than 16 bytes, the first reservation temporarily
returns quota.  Another key operation by the same user can consume that
quota before generic_key_instantiate() reserves it again.  If the second
reservation fails, the key remains positive after its old payload has been
destroyed.  Reading a buffer-backed key or revoking a shmem-backed key then
dereferences a NULL payload pointer.

On a KASAN build, reading a buffer-backed key reports:

  BUG: KASAN: null-ptr-deref in big_key_read+0x110/0x310
  Read of size 64 at addr 0000000000000000

Revoking a shmem-backed key reports, with oops=panic:

  KASAN: null-ptr-deref in range [0x68-0x6f]
  RIP: vfs_truncate+0xa2/0x730
  big_key_revoke+0xbd/0xe0
  Kernel panic - not syncing: Fatal exception

The first reservation is unnecessary.  A positive big_key already has a
16-byte reservation from successful instantiation, so the reservation in
generic_key_instantiate() has zero delta and cannot fail after the old
payload is destroyed.  A negative key has no old payload to destroy, and
generic_key_instantiate() performs the required reservation before
publishing the new payload.

Remove the redundant reservation so that the update path adjusts quota only
once and cannot expose a temporary quota gap.

Fixes: b6f61c314649 ("keys: Implement update for the big_key type")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Changes since v1:
- Remove the redundant first reservation instead of changing its length,
  leaving generic_key_instantiate() as the single quota reservation on the
  update path, as suggested by Jarkko.
- Verify full-quota positive and negative updates separately.  A positive
  update keeps a zero quota delta; a negative update can still return
  -EDQUOT before publishing a payload and succeeds after quota is released.

 security/keys/big_key.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 268f702df380e..ef707f2a81a98 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -193,12 +193,6 @@ void big_key_destroy(struct key *key)
  */
 int big_key_update(struct key *key, struct key_preparsed_payload *prep)
 {
-	int ret;
-
-	ret = key_payload_reserve(key, prep->datalen);
-	if (ret < 0)
-		return ret;
-
 	if (key_is_positive(key))
 		big_key_destroy(key);
 

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

