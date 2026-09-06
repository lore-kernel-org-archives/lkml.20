Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B11F78E6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692536; cv=none; b=cUg/G6sI5GJMQ3sIhjzqlXt5k+K7JzA6aPkNyUDibQ342UDeYGg34MMGCQ9qh73Y4ZYKeTMDOu7N+0c4zoVUE7zRf/Ilu6DreOeRIyGDZxCS9E1y/hRmFvtJFO5IXVsvRIpBXvCTuxs7LbVKBYBT/P7dfDg8YAlQjiHn7Uv0o0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692536; c=relaxed/simple;
	bh=xjHNZdArQMCZb650b76E3RrOioBC8s4U6npUhtP28jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tqh7L9xhQ+V8O3UBd3ICEctIe2xEJsU2Vm0W9IexMf8rvpmSiLDc3OGO2klSzOKdsd9BqREk0lBaW7ojM0A8LQveLUpuKAu/6RMb0CizjrKD/LE4I5I1F/eR1f0GxC1eSdtXNL8ETxW6E/6ZoCfa1LvxzTTzepGv1yWTBHPp2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iv1ANG1w; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iv1ANG1w"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8534d507f59so2756662b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788692534; x=1789297334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsoQ3WWbLMeracKBU+KB0eYOl3CW7WFSrJU6E+v+qnU=;
        b=Iv1ANG1wWZgpAPCr+lLGmw7SZUiypQkhxDVAFoyVJYNPZ7s3jNzNjngIfpsSRu3clH
         K0Om1YZ/e4ByFUr1kGpIpmAQcyx5WDeMunAhSQxFfaYZC7b8m6Yy6QouOaL7wiyM7Qxu
         TuQsHXq6q1qaf1vPXDyRp8Er3Y8WIgejlqsLohTVg4Bp9zoqhcJnbKq0z8dKuTo0EN7i
         hHdwLK3xSdKCcDdaBQDaLrABywg/f5wx2SuePusByIJDgHEVYLsb7FVvNxaMceCirH+a
         5dQDosqouGlEpIhTMdnq0PbpKGGX4JN4QO0qkmujDLOEzk1xqOHqilCxrFYFqcx2Xz28
         /VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788692534; x=1789297334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zsoQ3WWbLMeracKBU+KB0eYOl3CW7WFSrJU6E+v+qnU=;
        b=U28kk8uwVqzeEdiKol63rXrvQWWOUysi4JSbqdFcynixGM1Ld0aWbYRVEasT1H6WjO
         cqa4UaNWZilBgvH3KGZxiOuM6qs/JsMLuv7inPWTOMtDLg4X7Pe3WPho4IkPkzrHIE4k
         Zyqe9s3dHD73u2cRZ+OmpE/BH1YAgw6CDMN8vcMeDI+RvuXRqvcAUMUUY+x7nJVAWHa8
         7osGQbYGPGcAHYjWOPLaMiFvXXCN/002X9QJ1cOskwL4BeEARwOR7lcb8SftIq53hXI5
         9bojMAqgslTbk3aIXliDn3ROxX4fPkpE/fza6j490SHcZLFlYS+XRW5XRyfse35O5VJ4
         YMsA==
X-Forwarded-Encrypted: i=1; AKwUvByIm7CH+V4dW8Sv5I69nbkR2MEtr+1l4X1Ek4xJceZcpE5bmcPY02f9SBtAcKzqiyWxyYweBn+f6c+4aLA=@vger.kernel.org
X-Gm-Message-State: AFuF++n22An0sA4s3dA82fby5COOICSdHiDGmjbxP0HLWj7wti6K9WOZ
	160pUW6+d2qVr60Z4sZ0MABpW1Iwsqp+6RpK0N7fHdn7jUkmypfyeEbB
X-Gm-Gg: AYBFou0OW93A/oLnlvx3ho3S3P9FcHQAVM6QgfKeiFYEF0Zeasgt/dEYJRK4REtXxS8
	DzJ/MR/9KuR57XJB7+2vngyEN2D+U+2K3qD7foA5Gq6e4m8328Wzvfz8OBNJKyYt5bR8N+Qcdrx
	wR6zeqY6b6KR8y3ornDVmsuNmW1nHmKFkc8KXHokmXqoz0c2UwZLvvJ4xHs7sN9MKHWoRFZDj0P
	RCrhNoIUUnljssAnPmORqkWk3pG3pL8iYHNIXpy7s+/h1r9pSetpKo/gPFFu90F5q/Mt+mhnPM8
	Tlu/a2rSpFTMMIvHH4g/bo64lGUMIw30NJfECgnwWZauLHRacxWUBOiYFOKjDzK6Xdm1jjc/7iV
	o2BWuyPl7pXQCaGo2sy0wceaoEpa/j6dCZL9yrOOh+8CqxhjOuzc/FE84iVYRti7Y2ROBH+6ht7
	8jwO3Q3vx/62t9BNkbOrynl2At9SudywbdR8oIcgyIwQckYKnbk+ddA7oASVnyAfvsSd7IPhKuR
	KD8IAqyjbtGuuOOWIeG
X-Received: by 2002:a05:6a00:349a:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-8616819d66fmr24558258b3a.8.1788692533606;
        Sun, 06 Sep 2026 04:02:13 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-862810e0cf7sm2015708b3a.48.2026.09.06.04.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:02:12 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@linux.win>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	James Morris <james.morris@microsoft.com>,
	Denis Kenzior <denkenz@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] asymmetric_keys: reject trust keys without IDs
Date: Sun,  6 Sep 2026 19:01:53 +0800
Message-ID: <20260906110152.240426-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260502163328.696098-2-bestswngs@gmail.com>
References: <20260502163328.696098-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PKCS#8 parser deliberately leaves the asym_key_ids payload slot
empty. key_or_keyring_common() unconditionally dereferences that slot
when a PKCS#8 key is supplied to a key_or_keyring restriction. Both the
plain and :chain forms reach this branch, allowing an unprivileged caller
to trigger a NULL pointer dereference through KEYCTL_RESTRICT_KEYRING
followed by add_key().

 Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000
 KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
 RIP: 0010:key_or_keyring_common (crypto/asymmetric_keys/restrict.c:205 crypto/asymmetric_keys/restrict.c:279)
 Call Trace:
  <TASK>
  __key_create_or_update (security/keys/key.c:884)
  key_create_or_update (security/keys/key.c:1021)
  __do_sys_add_key (security/keys/keyctl.c:134)
  do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
  </TASK>
 Kernel panic - not syncing: Fatal exception

Reject an asymmetric restriction key without key IDs. A PKCS#8 private
key cannot identify the signer of a candidate certificate and is not a
valid trust anchor.

Fixes: 3c58b2362ba8 ("KEYS: Implement PKCS#8 RSA Private Key parser [ver #2]")
Cc: stable@vger.kernel.org
Reported-by: Xiang Mei <xmei5@asu.edu>
Link: https://lore.kernel.org/r/20260429181629.110802-2-bestswngs@gmail.com
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v3:
- Drop the unnecessary find_asymmetric_key() check.
- Reject a trust key without IDs instead of continuing the chain lookup.
- Use the PKCS#8 parser commit as the Fixes target.

 crypto/asymmetric_keys/restrict.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 86292965f..0e4783ff7 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -243,10 +243,14 @@ static int key_or_keyring_common(struct key *dest_keyring,
 			if (IS_ERR(key))
 				key = NULL;
 		} else if (trusted->type == &key_type_asymmetric) {
+			const struct asymmetric_key_ids *kids;
 			const struct asymmetric_key_id **signer_ids;
 
-			signer_ids = (const struct asymmetric_key_id **)
-				asymmetric_key_ids(trusted)->id;
+			kids = asymmetric_key_ids(trusted);
+			if (!kids)
+				return -ENOKEY;
+
+			signer_ids = (const struct asymmetric_key_id **)kids->id;
 
 			/*
 			 * The auth_ids come from the candidate key (the
-- 
2.55.0
