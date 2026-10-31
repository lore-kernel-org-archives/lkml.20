Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433498;
	b=eFaV3ZcdQ4cjkB16d5W3b3XvvjlpsaTDlw1IOoL+QDaDa/K4y/2sgL3oFR4yKO8HtQrG
	 rCYD5Ln5ZADupasbyrEkOAozxyfUL3MbJBmoMoOL1RTt4NvF6hPVjI2MkZWBYZhzKxhoX
	 CGKDmEqiYUTgk3n0W3XneT2dUKDOp55sa210ljk9AwqESTZkxfRX4oSdUR+ATr/DSF6e3
	 BLS9LXDlhrMxUitC07c8MIdK3oN/YHe9leLSA+Q8isPViCh0XuvZ9EGQbY6KVI0rQ9/Yk
	 Eyh476tt+KqzhBRDZOnVb57/tmFQeLaccxiqX5eCwbvHWRKOb31coLmlitf2EJOOBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3H0+VV/AZBdEHlcibiOOrB1N8yScEMjvqj7EU00SaxE=;
	b=Cm0/x1yx1NvkhFPPseMwoqYL8UqqHMdFBp+yI50Djx0ZRu8PQBn9OEcuPOI9EYLFkt68
	 a1gl8DbTclO3PI+7kCK1vuFObItF540NRTdMBh6Dsc8OxQhdz0xNy1K85KkBYyIZgapLs
	 DNH5b4MHHbJHzSLktF8yVd2dr/SN+hCTPrIYlfmQJBCmKWvo4ej9nGGwfxPeRWiiWPUPc
	 WqbAAuITWVY22UrUKZOvK19VaB4uNjl+99mypj8AEb6rkbxxi1U1PqLAUfno30GUIk0A/
	 KfuzefPQKyLlM4fbW00Rlnlsf02RKGx49NLoiyg3u6sntyz/XhnlYcIUU83Zqk5fILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfowcpjm;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F4D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfowcpjm
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15843335e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793433497; x=1794038297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3H0+VV/AZBdEHlcibiOOrB1N8yScEMjvqj7EU00SaxE=;
        b=mfowcpjmkN1ixqsM8t0ZFuysKdsfbcq443ZRQiXTtfckF2AivptqiHssl+pnEfiXHQ
         2LYuCRpoTL0FAzFgvonf1i6kjtUjz3PnAPfZ+ksL+N+U57D/5swViZIlYabMWy6k2fKW
         ir9++UaNkyK9MnZyWmmcbGOtpNDzodcih28PKopsxs1oxDqwQqpWGtE2B2b/D+VKPuEf
         0xaZSPFICcjUnNQKcUjnQzFwgutYQbz7Aqf/C4/XuK7DGxsNNlYLazmKvjXPzeOSrMvW
         FG+dLXydrh8t6OulGTyRONDUHikQ0JXdrE/NvPqWtgO/od7b4QwqgeQkrROlYeUpGEq1
         0ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793433497; x=1794038297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3H0+VV/AZBdEHlcibiOOrB1N8yScEMjvqj7EU00SaxE=;
        b=L7eETyvgV6vj2iYmhYMrvMtyk7X1ZghG3KVCiS0sv2ZzmlhAUDeMLCvcrskMgPB7lz
         cxYXfGSqYp7Dn77aHCdR4YrzhskwllwSgum4iMk0Gl5BR/yKWVPP08bDgVRU3WPbkPWs
         6FES/Hya94M7eLpeUuNLk6Lp1+HxOpsh4FhIfhqwiKRCBzE429GNm8HZz3MI/GHyx0Yz
         LMDv/S0qLK1A823Iqi+8JtbDqLLDUXHdWLsb8+AGPgdVqJO3MIA4UTUgFf0lLXIYPSt6
         3VE6SpI3co5xV8yTCTwiZXYv6YCTiUufNwJ52IEWdV4obAFZMTT2u9W/CJ5cAwgJpefi
         7Vew==
X-Forwarded-Encrypted: i=1; AKwUvBzfcnCG9Vwo8mKooAkcSSS+JefJqwYo4TUx7oVEcTH5LPPd6jPnJ2C0P4ZjGvbHBcenaO9hFu1PNYsvo4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSzIj0x1GudHkUcjySXpTgq+oA5B9mJMqDD+iMDzWOTE24fdsV
	YTXdn1NRG0k4Ag+oZuODhMoO6leNsxWadMagKnJGTcuC+ics8Ogr8mJK
X-Gm-Gg: AYBFou3hic95dRJxWcMAULCPhPVzibkYQQnQDsWwQv81I/AO0scinhK3tW/AbRzcQLf
	TA3GNcuJ/XoKk6P+iK7/Ci5dPDnBpGjBIH4fjAtIojzt5vqdhNdi2A/LOV167Bt0sU2ktlUr9qT
	JtIGg3kAfGtTjF+tsSZFPrjQuwVZ/nbO1olJ/RQBW+ga58ub1Lhr8OXYj6zuw1HSjLJ6d01hshN
	Lui1/8oAS0rE6jkWnRHEacqtd1ewV8BceQN+ekwfSWLPJzbOL22GRWKmdhNaQdEBOXoMmfDlj3E
	WSDg7pAMAmoBA53bbhUOHIhD1c9OEq9iW8bZzCNXyz1VJyiX6g61JKBtUl2cERFKnUUdVeK6KJN
	KkSXGDZne3B5TAbKty0J2DOk8HCqKdvbGrhbDuNyGU3uEq4YYPJkGuEQY4vEqKJEJkgXeg7plTJ
	bcRiDg4YItXt7zeXpdYvCB5h8tqYIfbL7EahTzHyEmfnwALVcKRtzPdkurJQmTD8j7bDCbXASh8
	7gY88lXjh8XpXTHAc5Su0cZx2fdmju4rcJs6OM+BYbGgv6SMydcfD+LrO0DC1r3jvjYXXiSBwUJ
	z+hiXj1LaoQXZtIIEcljj5VbWtXgmdRnDXXLRsFOWCMe
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr103987265e9.32.1793433496591;
        Sat, 31 Oct 2026 00:58:16 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1076sm119448035e9.6.2026.10.31.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:58:16 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/stat: reject invalid flags for empty paths
Date: Sat, 31 Oct 2026 09:58:10 +0200
Message-ID: <20261031075809.3173603-2-thnkslprpt@gmail.com>
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

vfs_fstatat() and statx() take the file descriptor fast path when
AT_EMPTY_PATH is set, even if unsupported flag bits are present.
This bypasses vfs_statx() flag validation and lets both syscalls
succeed with AT_RECURSIVE.

Restrict the fast paths to supported flags so invalid combinations
fall through to vfs_statx() and return -EINVAL.

Fixes: e896474fe485 ("getname_maybe_null() - the third variant of pathname copy-in")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 fs/stat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/stat.c b/fs/stat.c
index a2e63c6c45b7..b75a411b502f 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -371,7 +371,9 @@ int vfs_fstatat(int dfd, const char __user *filename,
 {
 	CLASS(filename_maybe_null, name)(filename, flags);
 
-	if (!name && dfd >= 0)
+	if (!name && dfd >= 0 &&
+	    !(flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT |
+			AT_EMPTY_PATH | AT_STATX_SYNC_TYPE)))
 		return vfs_fstat(dfd, stat);
 
 	return vfs_statx(dfd, name, flags | AT_NO_AUTOMOUNT,
@@ -812,7 +814,9 @@ SYSCALL_DEFINE5(statx,
 {
 	CLASS(filename_maybe_null, name)(filename, flags);
 
-	if (!name && dfd >= 0)
+	if (!name && dfd >= 0 &&
+	    !(flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT |
+			AT_EMPTY_PATH | AT_STATX_SYNC_TYPE)))
 		return do_statx_fd(dfd, flags & ~AT_NO_AUTOMOUNT, mask, buffer);
 
 	return do_statx(dfd, name, flags, mask, buffer);

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

