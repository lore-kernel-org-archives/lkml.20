Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F8D3749F0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850116; cv=none; b=Wxti77AlNtpbDZWw2rSZC6d/0JnJAB4ubpmqveYc1p/ogOmc1vgDlNLURUChrsPXzvjod0ugMdUUye2qFFkSMxAY/1+1U2ul8R5OJSe40Re+MdeeVkaHRX4pvpU8QCc6lQqrxLQTd5kwpwgjW3zY6g8JO+d4boFBWYic6cidXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850116; c=relaxed/simple;
	bh=6Dt0U3Nv3UU/hUnJU6VCs7akUfdBnup8mEUblwSfJH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X53FMPULDlX5/Sw2gAXAf77482hT5uHNR+5T138sZ+Sn88z9L7BI6NDOXeIpRy0F7xhyk0mxXXJUf7h/NyjjW9GIWJJV9zNXMzl1d05belXQiWR4YU7DH+pV7s9WCiH1b5KBel10Shmg8otba5rym3exUa6yLJNHT9zSD63/yxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjdEI/D7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjdEI/D7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so11670435ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850114; x=1790454914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp+3MfHIef17t9guG27n3yYy5IMEoS4o2YkTC2fwCC8=;
        b=gjdEI/D7ejwEfIP57Q2RqSvTjh9zUVxZ/v1WQQLDawyy2eDEcq/afrD+zsuWZRckr/
         NrlwFlmk7sIcODlDIEP5HuBtQvCZaRvfhfgcx7USBmNLcKbe9e3nyX2K5mkHM/bqtosR
         X4Fc4o44crgF9N8MAqkM1gfjhL26vkjdfi6XYA+LO3ebAbNyZD33BCbLfRLHiFjdU3EP
         MTZyeb2BI0ad3uu6uN24DqgvzMafadSqqJXvOyL1PpuKl8/aOH00TEa6OW84XiySufpE
         vdvc1+Jnae6Cldt2YQiJz4/jUGc+ojaiy1UoKH3oJ67hSCpERD8TElBqho3/gIyVrQCR
         cr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850114; x=1790454914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp+3MfHIef17t9guG27n3yYy5IMEoS4o2YkTC2fwCC8=;
        b=kCKOL8+g7oziEtFmdLKdTsPEExOUCz8jIXUaTun3yY5k7GXE9MNuax1xjaega1HVW3
         TkNFmJhQ/cf0vlQKMIW5/JWlMIrY9X+Nty4dngehAS679rTqJ7/cvO5I5yhAFFYTNSaJ
         +7N1AyD1qGdytLSQ3ajYiUtVv/ll4t7VYZx7GcHojCSiMpEAHOew5JkZNFZOrpQ4c7lB
         VHjBAZbif+dJlGAA9jgPiTt4eQ5syCKqgKP4wI5zAtYMlfksaEjE7YdbvasJ4Tii03SP
         lP+Xn4p5wV/dgJNbNS8oQVVeqYRGNu7Mxghw6tCthCyu2O0okA5eu/rg9+FHE9RpLUQI
         nXvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuAZEWlCQMl1eo/CDm2WCWQlL1+9g8AsSyU5hsu/LOiN9JOjc8+CPnpFf1ooM3g/WNmhZwURo/TwmQ3Rg=@vger.kernel.org
X-Gm-Message-State: AFuF++kyUw7PlwAvUPsBscXGbSW82GYVdXxNXQAX3FiWxmFM8BNRBulX
	bwMzBMWe3LaNkdknXwMxZ373cc/fPyBe5B/alUQz3oG2RzHk0o8ho0RpWlzOadEP
X-Gm-Gg: AYBFou1lHKJV3QGACCGMYgqFpdUL9fZ0dD9ID4RcrG6C1bTmgzWDzGuzq6WR9Y46IwG
	Q0RuVzz5cdgAyxugr8FUI4QpgRNVIJTHGNbH5WbltrULIVlULbdGj9FRXpOY/iZDU4FuaoTYoTB
	c1VsepmnIuvNyayT7+jKykHQ3YYliNOPMj3PbbgOg2Uq29zQiwiKBXskrn2EaFb4ry8oeqnMUCM
	SSuKZ3yhJrEemrw3jZ7A593pNzR0VnSUp0EBiH7dVgVbKCLSGPVo4DF3CKMM2huEq1BBLVGuxY/
	1kmwRxoaqJihE88IOphJlmg573J3tKJhntELv7YgiPn3eEW8IcVNcbT92XHjDEli4agl8IZCYsP
	hj/zY1itGUFWX6eqGWgVB7509CNM62zPOZgrGdA0uDAHPIOgS2KaXgIk2A3wSXrWlR/V0ik5mnL
	NH6vezqF+BZRFsAH/+ugjsYG2w435HsTRBh2aHQ7qQsjD6MfwV1Vg4+fXz4KTJq+wnYDdlcM06s
	bZaYu+n3a2h6vahYVUEsYBjpJ4wVZgHY0HVZoMHAwBy3C6zf4D8nwrbu96lylx518uZnsM6aGeK
	4AxHIJ21Qw==
X-Received: by 2002:a17:902:f608:b0:2dd:c0ff:e724 with SMTP id d9443c01a7336-2ddc0ffe92dmr39228325ad.54.1789850113925;
        Sat, 19 Sep 2026 13:35:13 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ff4d7sm12700145ad.74.2026.09.19.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:35:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: reject descriptions exceeding U16_MAX in __key_create_or_update()
Date: Sat, 19 Sep 2026 20:35:11 +0000
Message-ID: <20260919203511.2580732-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct keyring_index_key stores the key description length in a 16-bit
field (u16 desc_len), and __key_link_begin() enforces
BUG_ON(index_key->desc_len == 0).

While add_key() bounds explicit userspace description strings to
KEY_MAX_DESC_SIZE (4096), when the userspace description is NULL or
empty __key_create_or_update() delegates description generation to
index_key.type->preparse(&prep) on the payload (up to 1 MiB). Key types
such as "asymmetric" (x509_key_preparse()) construct prep.description
from the certificate issuer, subject, and hex-encoded serial number,
which can exceed 65535 bytes.

__key_create_or_update() then assigns:

        index_key.desc_len = strlen(index_key.description);

without checking whether the length fits in u16. When
strlen(index_key.description) is 65536 (0x10000), index_key.desc_len
truncates to 0 and immediately triggers BUG_ON(index_key->desc_len == 0)
in __key_link_begin(). Lengths above 65536 truncate modulo 65536,
corrupting keyring hash and comparison lengths.

Reject empty descriptions or descriptions longer than U16_MAX with
-EINVAL in __key_create_or_update() and key_alloc().

Fixes: 16feef434017 ("KEYS: Consolidate the concept of an 'index key' for key access")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/security/keys/key.c b/security/keys/key.c
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -245,6 +245,8 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 	}
 
 	desclen = strlen(desc);
+	if (desclen > U16_MAX)
+		goto error;
 	quotalen = desclen + 1 + type->def_datalen;
 
 	/* get hold of the key tracking for this user */
@@ -820,6 +822,7 @@ static key_ref_t __key_create_or_update(key_ref_t keyring_ref,
 	const struct cred *cred = current_cred();
 	struct key *keyring, *key = NULL;
 	key_ref_t key_ref;
+	size_t desc_len;
 	int ret;
 	struct key_restriction *restrict_link = NULL;
 
@@ -865,7 +868,11 @@ static key_ref_t __key_create_or_update(key_ref_t keyring_ref,
 		if (!index_key.description)
 			goto error_free_prep;
 	}
-	index_key.desc_len = strlen(index_key.description);
+	desc_len = strlen(index_key.description);
+	key_ref = ERR_PTR(-EINVAL);
+	if (!desc_len || desc_len > U16_MAX)
+		goto error_free_prep;
+	index_key.desc_len = desc_len;
 	key_set_index_key(&index_key);
 
 	ret = __key_link_lock(keyring, &index_key);
-- 
2.43.0
