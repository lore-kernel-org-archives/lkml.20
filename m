Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B071C5499
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123225; cv=none; b=eOYb3KMYGAhtUsYuKScZPrXTHiSxGa5bPU9m9Jn7ZIggBuQXFN+1Q8BqiEibUzqDjB60URy1uZeredlvhN3R+Do6uYibPz9f9zbV3COYPqCWqoeQnQWI0vf4JV5BDB0yrNFKoNNp5FrgXxGozB7wqo7PWDZmWH3ApCJadnG0ZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123225; c=relaxed/simple;
	bh=R1f53fZVOQpXpGpCi4RklZRTZOgEf4RFVZqHIV1IEjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRevOutoXIp0I0obwVXtGfBW8mm2Nilb1iNLhG3VIBuZTiK4YD0X5hoMO+J9vlW8UaleGrf2lDpWElMRWnQxW29nrDSfx4m0NnXMq3zstkSzxROspsVnjVUfe/H8sAzwS6lE91gq00Tw908m6CIG4kHVUuM8OUgUF2p0WUGl6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZIn4Nb8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZIn4Nb8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so458308a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123222; x=1792728022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g9IQw/iWHXUIP0xYQGBwa0OfUNbaaj14Fj4E0JqM4sE=;
        b=LZIn4Nb86Im+eJt/C2Z8tvysgraS2xt11OqHgABFEDtbc4L9UzgX+rkAmvCaf3qWpZ
         YrRQ/G9DWEHcA3jaEQVGVLgo1w6xS4ttOxTDJiarb9APKyqPBovADl9C/WFYx5gjuNIp
         NYxK934bVsZnzU4025+/660RdteqDSkEOjjCLYBYpp75chpAug5MlTcNHiCFHauNf5ee
         xnPfvK2P7k2P9q/jSGzTildbi5YZA/ZMctd1x+Sw+aJdu1TmqCj/gJ7+qoxkkdY/d6XH
         x6jcETDeUjBSd72vBER9PuBgP61DzxNIUd1eDYK4dOCXVpCQ5fk4AbXVPxL3+XP5BECO
         5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123222; x=1792728022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9IQw/iWHXUIP0xYQGBwa0OfUNbaaj14Fj4E0JqM4sE=;
        b=xv/BY5k6peuXFKBXFuaVYdNoOBpncnrvsH9LdIPhUSfKAa64itDvmmz2tXOeZ4wciv
         /RCym4cqFn0/aQehI8WY0NSb+O4iCeKmlqBCpAA/T5tfvSHG3n/A4Brm5nimvXbfI8AV
         NHWrABq+rBtYn4QbYfm7fY0KxsFNqvJxVqPTtVGvU5t5pRE0+/pvwsSlnpWoQJRByNrj
         vtLxlrzR2gGebadvZFMMDu8i1zOBtdiKxoau/ZSn0cNC3bzSFB2DVgsq0VxZ2VVUx/fy
         MTyXlm3wkgvqx/YliKvQ9OhxLUAYMLinsJ96lOoZnXDscTytJ+O7mKY5xB1of+lnf/lI
         sSKA==
X-Forwarded-Encrypted: i=1; AKwUvByL/rKXtGrjczECBZZadJptqhM8PHt/VawHlIX8hFJPsl1/AH27QwKptNaUUX/WPsMQBsYYCSpj/5llplY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBXeDufEhMc6OBHXxWO23XNqxwta5r7kQRr9C51tbSifCxie67
	JQ+2R7pBUQohBsLYLdDOxfpsTPtUq4+t5+ul1BZZyhBIT6EP7irqpRKb
X-Gm-Gg: AYBFou3+MOp0RP+InSVQmo1fKx55B2n5LFibaHgtTYOcXyC92+DJgd2/Eh4fvoqjk2Z
	ecY5FMTL4ojmkCsf25Xi6Q6bCR8vTstnlvogh6Ly8roRMZ/5qjbCcXy1/gqcbtAn6EN8cZmjLj6
	TaWGKi75PG0b9B67hlP0Ch/sugKxdTJkRYqDEo+6wLbnkg3FMVwKaQ3QTTGDyFcIuZkZIK5HXkS
	S+k5e+1lBELRC4TPMGKlfqdZscdZsvkkKxEBJjuKAW0gd8/+L7elIQN0EPpaomEkJoSwkwW4y6u
	rQVbLamhyfwTPiTNbPwHMZcJHvhwl8reg3GODxfKdvwBWp2VT0YwHA3Ue7E3EImo2bgXDTuZhyP
	GN/w5tXBihp2sF8yDTaGPlu+fwL7k+jtA477y6KjXYA1vvt+6/HCEAbj6MAUVy9bYCQ+yI4trHw
	yW9bNxFKoiGLOC/qlqDsE2ckfMGfz5mQGacdXq6LfbN5NEBt6ULRO/dMIFT6CdotAEEhdRysUQK
	TsgEehUJmk=
X-Received: by 2002:a17:90b:3e89:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3acbb689d36mr1258321a91.5.1792123221974;
        Thu, 15 Oct 2026 21:00:21 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm7017040a91.8.2026.10.15.21.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:00:20 -0700 (PDT)
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
Subject: [PATCH] keys: big_key: Reserve the final quota before destroying the payload
Date: Fri, 16 Oct 2026 13:00:04 +0900
Message-ID: <20261016040004.324286-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A big_key is charged a fixed 16 bytes of key quota, regardless of the
actual payload size.  big_key_update() currently reserves the actual new
payload length before destroying the old payload, while the subsequent
generic_key_instantiate() reserves the fixed quota length.

For an update to a payload shorter than 16 bytes, the first reservation
temporarily returns quota.  Another key operation by the same user can
consume that quota before generic_key_instantiate() tries to reserve it
again.  If that second reservation fails, the key remains instantiated but
its old big_key payload has already been destroyed.  Reading a
buffer-backed key or revoking a shmem-backed key then dereferences a NULL
payload pointer.

On a KASAN build, reading a buffer-backed key reports:

  BUG: KASAN: null-ptr-deref in big_key_read+0x110/0x310
  Read of size 64 at addr 0000000000000000
  ...
  big_key_read+0x110/0x310
  keyctl_read_key+0x2da/0x550

Revoking a shmem-backed key reports, with oops=panic:

  Oops: general protection fault
  KASAN: null-ptr-deref in range [0x68-0x6f]
  RIP: vfs_truncate+0xa2/0x730
  big_key_revoke+0xbd/0xe0
  key_revoke+0xc0/0x1a0
  Kernel panic - not syncing: Fatal exception

Reserve the final fixed quota length before destroying the old payload.
The reservation in generic_key_instantiate() then has no quota delta and
cannot fail for this reason after the destructive step.

Fixes: b6f61c314649 ("keys: Implement update for the big_key type")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 security/keys/big_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 268f702df380e..6aff1a73c7b38 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -195,7 +195,7 @@ int big_key_update(struct key *key, struct key_preparsed_payload *prep)
 {
 	int ret;
 
-	ret = key_payload_reserve(key, prep->datalen);
+	ret = key_payload_reserve(key, prep->quotalen);
 	if (ret < 0)
 		return ret;
 
-- 
2.55.0

