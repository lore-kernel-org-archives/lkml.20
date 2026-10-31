Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435466;
	b=me64/U+gWZy/MZS4SMFEVik2yZCbnn2tQtdxLIjkWh8O1O1PjnAjYt4cX7UurpFa+ksm
	 I3kZG4kX2mDQFdQk1p3iXPXIhOYoapBASt8WT+ZXRvVDD6z2BBy8+oxMnYyPXh3gG4SK6
	 zHho3/4NihfyLC1/GOzOBaSQaiUFaiuDG6tv7BIVbIk2X0DT3waL1iWWUVKFGcsWiM/6R
	 UTAk5/BVVKWE/C66a1nYRORzptYldcmeA3zCRo3/j7EU8xgjLmwG4kV0RF4Wo/PVZ8bkV
	 JMLR1C3my3Tn/I2eQH8YD5pJQHJqnDrvUVyLLwlYqViodF0rtaFEBRt6A7wp46o9lDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FwNbKMHP+2A+3oMs0iBFR8sdyk4GLtkJVZshv3zylWk=;
	b=o8C8mNlcOdw02Ur5GLx/c6ax+I/d/pd5TrbBkn6kKbundBumYb4Z5i0MuJyP8dKVAlmN
	 mzmzAutUYffNnvz3/Xi112r/+kGmRCJsU51/v5LNFKbElzZcFkHYC9Wm1XlfIDTjvoD/q
	 XxkOcZkB6ht2myVSIrNiHGTK+6z1Rc3xzuiwqTTMT/bp8B1bAfXInkFx89baHfDTq/b7X
	 0c4rsCCdNzLJQ9W5lXenUmFW8cMkmfq7VsNuXkG2bKjjeV5iiB6n/uZhdp8BTzUTbgQeC
	 gqEg/OYKMIdt983E7ImpWiyL5CGgSJnmfG4PU5PMbfxfTgOnJ3sXQT8lfXJEtLKXVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WGrQWcHP;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4415606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4415606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WGrQWcHP
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso883873f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793435464; x=1794040264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwNbKMHP+2A+3oMs0iBFR8sdyk4GLtkJVZshv3zylWk=;
        b=WGrQWcHPKjggA7hrcOG4ZeCmbvngzSZSWpCSeM2n/Xw1abuCru2ulRAuxZmiyoGwAw
         Kvmu0ofS4AhQpnW7UysgGXJKI6vLMIXMOvhCmUT4EfxfkJGJChjyimpjl/2n0neqLw2C
         F2q0dHrFp/ok6m94X3AOoWO/0mvLovv6jDqs0RWALAJwaj3Do7Pwp1CwLqdlGr3CJJGu
         apKgue/bQn8bc7kWF+8HPI3RAKxV/uEZ+SgTzHULq3XLyGom/+iLE/5kznrc9rgNmZxl
         PYRQsK9y7RlRVgWL8dgWMRuI2KAOiFEEPtc3A7HKKDiaKWu8GsJ3hNJjcpX1HyzL0MND
         MeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435464; x=1794040264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwNbKMHP+2A+3oMs0iBFR8sdyk4GLtkJVZshv3zylWk=;
        b=Ti9ymgeFd/DSIhPv2K9LEHpRNVH3L50fzGGn+w25+6MLLCtKUMGCau4e38O9jlnyx7
         BPk6SIYobL+1nU0+W7Pw301JvTAV+xLhZINUTHUSF9ikmxPpJ2cMs3JJ7Jg/fgZx7YFM
         +TYZxG/q6iTo43+fSCWVQFmlzBEivzcSBIlhId1GDZMl/oXkCZciSAU2rklUL6a7ybOr
         AzuruJt/OYcv9iwXeGTmE3nJ+4Sh1F1kh03yYsHaDTdXZYfcKqlCZzFqaFCtskg0h1pW
         AhxFrBulrkNlSXGoyC3JKkk2f91xNzAp+UdAXBL54iPbQwvSFjGY1hvb4ynESDLbMUsG
         Z0mg==
X-Forwarded-Encrypted: i=1; AKwUvBw+LUL/2A4NCo1oZxxbQMHO0X3T1FjFVMVr1ZANcO7zFds0HJHlQNNvnToIkhmt1fejKHGVW9DXLINYU2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVdL033YKfZQahFijRLzFk+Rai+AeSHf7/N1R94PQPc/i49wHC
	Gou+cXS8S8WSdvergig1KUKNMG2eBt7mze2k/pza5qXli314uuniCgKE
X-Gm-Gg: AYBFou2hsA3tTQwk99V/W1nmzvwoUg2wSnqPaPfYky0XgaGK788QaDcI7je0vJNfXD+
	vDhkXeOVGAYr5cA1Fu1/f+dC4SM2ZEIFmtAcC3d+16pogWKe77hdzLukDeCrC/DBCJKeD7PeWI7
	Yqd9kkqeQ9RuKnDOEBDyvRFVscF+aL1RnEPhk6S2c88IlxISxOiLwNKHi+QFI2ptedj1tC4Z8RK
	JAsn6NAND0DqF6dnYqNc64/VvuMqq4W4gt721m7z/uZ1rhpi9ZgFD76PzHxAfyePb15btXglUbr
	ogp9IPAlVFQ2mGcNFKgXgingXZuhabW/FlZJX3mNLufJaXql900CmTgdE46QuPbrCJECCQN/0JP
	r/fVW3WbMOSGZh7N1AVhykF3Oos+p8G11ah3xGK/H/lU7qqUODv0FaQ3XSk6NsmVVtJefHX8Nlv
	BoitVA77YL7wCZFdXewBtay3A82iPjJkT8EX0f4ykBNTBiqxPFr3GuzgedFaq6Pmh3em96c6xd2
	15G3c+e7Ic4hw2XAahoFF//e/PK/22LTmDDKiuJQgaSsbhRQ4J846/tqzLqhkp51u4UZuOGPTCg
	kzIPdbIKU3RaU4KrFwj915Vvh0h+ETZkduKUjkic+dHXuecCryKEA3PJbm86pUNpvw==
X-Received: by 2002:a05:6000:29cf:b0:48d:cda6:4dd7 with SMTP id ffacd0b85a97d-48e6e4ffa15mr7559556f8f.44.1793435463908;
        Sat, 31 Oct 2026 01:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm7229726f8f.41.2026.10.31.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:31:03 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Breno Leitao <leitao@debian.org>,
	Arjan van de Ven <arjan@linux.intel.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] fs/select: reject negative timeval components in do_compat_select()
Date: Sat, 31 Oct 2026 10:31:00 +0200
Message-ID: <20261031083059.3245047-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

do_compat_select() normalizes old_timeval32 before validating the
timeout. Negative seconds and microseconds can cancel each other,
causing compat select() and old_select() to accept invalid timeouts.

Reject negative components before normalization (as kern_select()
already does) - and preserve the handling of oversized positive
tv_usec values.

A 32-bit syscall reproducer confirmed four incorrect results on the
unpatched kernel. With the fix applied, all my test cases passed on
both compat select interfaces.

Fixes: 4d36a9e65d49 ("select: deal with math overflow from borderline valid userland data")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 fs/select.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/select.c b/fs/select.c
index 95d76531015aa..8b6d1dd2977c6 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -1265,6 +1265,8 @@ static int do_compat_select(int n, compat_ulong_t __user *inp,
 		if (copy_from_user(&tv, tvp, sizeof(tv)))
 			return -EFAULT;
 
+		if (tv.tv_sec < 0 || tv.tv_usec < 0)
+			return -EINVAL;
 		to = &end_time;
 		if (poll_select_set_timeout(to,
 				tv.tv_sec + (tv.tv_usec / USEC_PER_SEC),

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

