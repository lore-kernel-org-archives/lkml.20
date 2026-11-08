Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169465;
	b=ErCaFx8F81zQ3JZBw+W4knBIrj0s5sM1pfHWDDXchtndc8lu3Hom2d5Qy3QffjaNfMcF
	 JUqQWZC5QlFQsEys70OB7z7HpoP01Odt4UdDZO34ltYVGfKO4JRS0Vjvv9J7xcOO8DfiH
	 KkLB0jvzCyLR7wHBDYvDGQhVZ9FiW05/s7Q7MXLyWI3Pies38xWY6fkwgU5MZlk5STXBm
	 RPY/7dApRpliHO8YuTNp8i4tUpKSZfgakPl4Biaw6rIQM6RLyjpVaGUOJ8WiUpetFQeBo
	 DLhTpeS1lhB+akKyDYSLk64uSmpFUM8zAhUxgahOzGz9c/WtjNNe4OvEoc92eBEDU+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
	b=IdURJ+uwjkL7y3KkL237PdAwUilYfmtfCp5j8+jUCgM87heF1ex+nn5QiC8zit9+S5Hn
	 0MdSILxJIvLvZfRyBG/9LMo/I5oCFRDJ6aUxoMfIAJ34ERcJkP6QaQUetu7LCNeYEY4Xf
	 nWXN4q0uiiKEnPwKLuW7UJElF5ozaGKiXOfUEZVVRiwbfAHbtHJfPJHVLfTdbgrVz5bnE
	 YOJ9os3SJhs9rO4GT5v75WyqI73tzvyHqczYODiS5xKahjQLpXTtOXseL8h7uG5QVmSf8
	 x2VOz3doERspbnLaHVugyBSpqmVmjfu0QIz9lUh/RjAyo4ktvrbzIQCOfM3mNFcsZrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hRiL58/C";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF1660A3822
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF1660A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRiL58/C
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so210391f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169464; x=1794774264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
        b=hRiL58/C+yEOjBcUCIMc4lrMyeaY3yRbL5vApL5nAobdmxS7c6/W8bhLRKoH51w17s
         iSdfLvaRR2EE4/PYFxX3MzoPef/OExTG/rX9WeGaV77qJeusrE7ZlaML/f8nghZVZQNz
         ZpwhUMXEjxc/6lMJ1Z6zrCTcSN3ssP4p9fOO1jZ1et+YmgEb7YQELg8tWFZHSNO8KOZ8
         QALJHTS8mqg9tHpUgCYle1S7va8g2yW4OSQYEP6cnum6tXtzaEZJAgbvTguwDZkcZzCh
         hZfOk6Bv03aF58fjMhgpT9Mx+h7JU8sxpk6Ht2rhHOALGZ+Q8M6RwoHHBJuU+BcXn0sr
         GZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169464; x=1794774264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVXPEVlyVhyUrhrzslMzMs3XMd5k7yY1+/ztFUw4sp0=;
        b=sMa+AHNGWGvzh9Rz73lUdnyyVAqPCwp1g8JFIKSSP2YygWCDUgZyLoxOA3lCnAFBaG
         HttzhB0a2m69sfbnUGHnhCOZFrQhA/FgtRpAO0mT+wFMzdigym63iGAOxN0w81VfL6mO
         q0s7pxS+t0l5N30TYwn/xkv9HgwVIrDw7DPGSwAIHgLVme2ZGrghtJogCYyOjmhd3TTG
         7W1fD2CtXmFGchDbWzvASmUukmMKkvzXzmjW8Q5Oqx3dB7JkPvTnXns5ZhDeYxr7Awvl
         Oy93N9UlcSzlTsvB1TFJZCyJWwXZazxwo2V0bPaAAOl5hpxldGhbpUUe3SxZm3Ip06BZ
         djsA==
X-Forwarded-Encrypted: i=1; AL+hErHfeoIqIM0HTjOwr196eHpisIvI42+dS19NgSrpaOwMQcbU+xxy5cwmr57rK6XuVQcHFNzUI35yC7q/v6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RB8ko4amzltbRJbmn71nLM3fAMbcvNJaydvBUzKgi2KUJbBGN
	qXG+BGb9xV14QB94eUKYBei3uqWVj38zOoTZlxkQdOq3hiSDPOLvicWa
X-Gm-Gg: AYBFou0ZacwycRcxD4NuIRDx6gvFAfALpg8WPYS+WR03Whx3oh2FyzAb7efGxNQlTuy
	kxnhljRYtj5cZcDcGlgVX2Bc7cIIo+h39YX0Wzkn1t1sFtAvbaXbhqPdlW57Z4Kyha4dkSRxg53
	u/q4dz0WN6O0WnYE/eGP/SDtJSDfC4Cxd0psVhERns/jLSPc/oaoxE/FjhIiUyffRPIjLETKcdE
	3fdOzoWJ3V9GHO/D3wDrR0Qep8fFTU5C7lj5MWLzA3jYQIzO+2CKNLah7GNOOrwP1/SevkgPXZu
	A1wAuQ/56skFfXD+rw8fzx3BlNS6jSPNtN9je8wWZ6V6ZrkfR2vWf+qYzesU1SFXKsKjqqSz80r
	1P2xiZCP2qS4F7+wapbFZY3T1P8rgsMY/vUCDW0brmijVKElTSkGbDzldiRCFCTdjC5+CxItGJv
	UpvHMVspmK4xw7Bvv+ispyLJPRp/dcbHDL834WZVTfnK2LpVvEhbjTE6oZv/1eoDYyQqRKbAtni
	KVIIxgir+vQoHnfjbi8VLNzycu7W7G2N8DhYp9uH+6YsI/RgYhQhk0y3ARjk6EK6Wdz9+pmC1pW
	6htrbAitM3Csdo1O5DduKq+6zDIuvtM5dt1rblruOjgCIAuQHYAHPQ==
X-Received: by 2002:a05:600c:3113:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b963c91d7fmr43603045e9.24.1794169463555;
        Sun, 08 Nov 2026 12:24:23 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597748acbsm5733788f8f.44.2026.11.08.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:23 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:48 +0100
Subject: [PATCH v2 1/4] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
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
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-1-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

In landlock_get_fs_access_mask(), only add the
LANDLOCK_ACCESS_FS_REFER right if any filesystem access rights are
handled at all.  This prevents us from accidentally treating
non-filesystem layers as if they handled LANDLOCK_ACCESS_FS_REFER.

landlock_get_fs_access_mask() is used when initializing the layer
masks for doing access right checks, so this bug meant that we
unintentionally denied "refer" (e.g., link, rename) operations in
layered cases, where the same operation would have been accepted if
only either one of the two layers had been enforced.  If the rulesets
individually allow an operation, the composition of these rulesets
should also allow it.

The bug only manifests as soon as one other layer handles filesystem
access rights.  Otherwise, Landlock filesystem path walk is guarded by
an early exit for the case that no filesystem-enforcing layer exists.

Reported-by: Dwi Siswanto <me@dw1.io>
Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 935e18b12b3c..d9ebf4857fce 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,9 +262,16 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	/* Handles all initially denied by default access rights. */
-	return domain->layers[layer_level].handled.fs |
-	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+	access_mask_t handled = domain->layers[layer_level].handled.fs;
+
+	/*
+	 * Handles all initially denied by default access rights, but only for
+	 * layers handling filesystem accesses.
+	 */
+	if (handled)
+		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+
+	return handled;
 }
 
 static inline access_mask_t

-- 
2.56.0

