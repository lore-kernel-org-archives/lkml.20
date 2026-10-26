Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019394;
	b=TJ+l3uUXfm1dBWTFkEGQt39FIKCmIKUZqUz4hDVpDLe9jssoq/z3AbYSUC3LxP2roPHt
	 Sy+1mvJbZtYzrfGkQUEl7iglRFyHeyBAtWfFKXgS5g09UmlOEKqpQ+VfBYTQnemXEZSV/
	 Ih9He1bhExy4TFp/IXNC+TVIaeHU9ampJUm5ySUDzWfATyIIR67o/BQBEWFORAQAokGn9
	 2hr3VnII4KKGZzkasAjwfV52932vdyokD81MroEe7z9M6ymibRmT1rzgWETzq5r6waO0e
	 sFJF/u0LP8TeYywLb6QXLOLKNydYuBaflUpIwRn8WCMikbkhauDRZb71Lm46/sUmz3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6SBcn9jDTTFVGSgjb+hg+o69q85XjfukBj226MovYXA=;
	b=xrM9SaV8UZhCY0Fs62FJxqrVK3YylOWiJu4srAcOSy1O+rp2wpTW3FYab+XzC07mu9Iq
	 ULFwZ9mlUCZOb+lQjQCt1DHnufuumMdn2BaZHH1dl89iOYSFPKgcRISq89az3sv0f9kRa
	 NQN1YyO4NnfTXEmPosdezVLtXKF6zR392anU/ztO6GZqlI5inMiKoang46gvysUFEod28
	 +wSINfz9ToOWS/SPiexTW43WDYr3z5rr2JBzCUrA+QdqoqhRiex1o+eQbjUJGktSkcTyv
	 t28p4VOq/TkvWpnO95Rdgx7epx/yUZWcf4IsgFTO+agA/NcSTejTpQhKDxa3b7HGp9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c+OEEaEk;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8626D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c+OEEaEk
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab01c46697so24528471fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019393; x=1793624193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SBcn9jDTTFVGSgjb+hg+o69q85XjfukBj226MovYXA=;
        b=c+OEEaEkqr9qOvD/m9ypNhPHIFw5AfdXQ4uaFDPyIMSgH6Bzden/lrGRId1QIhBPua
         XUuhAcNdjI45c3xfNSsTsrVQFe68pm/u8nqooFRipSh/2xjY04LosuJ36a5WScDaO4Ql
         +rJxx+MhopTRc8EpK2BQ5E5iup/K2P7B8JhGbycBKq8Bsoy1Nc61dPdHCjB1qCp5y4aS
         lrxAZ8tgQp+Ieak86C1CJ+0dASNRa0idAtNKgRhOhgj3nX7rrqyFrpBNODyBNbUZylJP
         r5ib1jQt6rqZQFM4kOViulwMwR3cGDPbLr4tzUGO4lEK/ELVDNrWPQD8hPbCTXbIrroV
         csSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019393; x=1793624193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SBcn9jDTTFVGSgjb+hg+o69q85XjfukBj226MovYXA=;
        b=D0S8TWIsuNtrpg+kv8T3U8FMgN6dnVbMQ7Tc5Ai5xTuov0SLYaz26/jOmQYxX6SbPp
         WL21+JeYcaGkbnIokK08AuFC94HIaHQebnOWr9waacVSCQMUzjZ+bWjkpaispWjkigam
         XLG1+sPz+936nJkXlBEgBW92EwLWOLMHy7OPV7K93Q1nEp5zkBds0rM/D5wIEkDbmLRL
         GR5FMVj7Sz6Kr34ywojVWAgLRh1/yDZsYY/3F8jHEVRihK/CxnH0XhlBBwbJnnd0BAEm
         yEwjVSANalhLvUe1owLQqglyXGAH4SBWwkjnnVkBIWYht8ZDfzG9dRE/Rp3WJFDqAhcs
         PR1w==
X-Forwarded-Encrypted: i=1; AKwUvBy4J4nfwmXJrynbcjZ4lx2kgXsjde3C/BzePVfxJ5q96FrBCfLx0c/uPJoTx75i7TVe7jadxZ9gDHpRv+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhinoHCFHmHUmFtvBcrxsC0kKpdWxKBLHeOBU7OnsO1d/DDWxt
	4X7P6TUHBFC0Ir5ckWyCZ0gSbYnRkNnbj7mdBvrG3gFiyPjAZG8utEca
X-Gm-Gg: AYBFou0R94ea+NnlHesg4utoWigsEeFnlkhFUgMRNzrBU6ldvuPmUjCw2cLeZAsghhA
	f2ykfO8F14Q/5YvTwfdKbSvSioXXQ2YXRozSZgKF/sfjx6cf4XZWXOB8SF+/S+Vg3gMKHa2ok88
	Q3GBFu+sZ4D20NWzYtsZU5lR45BDD+70wH5WM0SFRnNfT9SR7LUj+/VW0JzNwXQohraoYTvg6M2
	6NLGv5rhQc6LdIrtYiRIEdyPtcUsjiwRuxlTtsGWJXT9jElOOOOV700Cmv0BKhWuVVdDrbVst5o
	ElL2bzIEsJ/NIGQR2jPwdXfiV31YV2mg8abFkcTQfwfk9K1+ma2RATt3avxfvnDY25fiQkkVeAu
	TDa9nThCdu+cigh1eLBwscvTG+bOeIn1hr8Lvzl9n5HVVJxIP/pzvcMM07LHGS6aKc2+e+evXdT
	pKqDXnFaG1zUhqJCVSZSW8yMfinscM5wsm9iLjBEob8Kfw9/6wsQ47C5xI4aXrvdawelA60ng9o
	fhycf+sdmoPMsGoMzgzY/h6nzmWg40OwqwIAIcrszhGh9nMyXcrkdTs
X-Received: by 2002:a05:651c:31c6:b0:3ab:2517:6a6c with SMTP id 38308e7fff4ca-3ac6fcbf299mr15992611fa.7.1793019392658;
        Mon, 26 Oct 2026 05:56:32 -0700 (PDT)
Received: from arch-pc.lan ([185.141.180.16])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm18258191fa.9.2026.10.26.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:56:32 -0700 (PDT)
From: Denis Kulikov <dar1knessx@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Steve French <stfrench@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kulikov <dar1knessx@gmail.com>
Subject: [PATCH] ksmbd: use the resolved share path for the share root
Date: Mon, 26 Oct 2026 15:55:41 +0300
Message-ID: <20261026125541.87507-1-dar1knessx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

If the share path is a mount point and crossmnt is not set (crossmnt = no,
or ksmbd-tools that predate the option), the share root looks empty to
clients: QUERY_DIRECTORY on it returns only "." and "..". Files created
in the root go to the mounted filesystem, but a directory query cannot
find them afterwards, so e.g. "rm" of a file that was just uploaded
fails with STATUS_NO_SUCH_FILE.

An empty name refers to the share root. For it, ksmbd_vfs_path_lookup()
looks up share_conf->path again starting from its parent, and the mount
on the last component is not followed, which gives the directory covered
by the mount. All other names are looked up relative to
share_conf->vfs_path, which was resolved through the mount when the
share was set up.

share_conf->vfs_path already refers to the share root, so return a
reference to it instead of looking the path up again.

Fixes: 74d7970febf7 ("ksmbd: fix racy issue from using ->d_parent and ->d_name")
Signed-off-by: Denis Kulikov <dar1knessx@gmail.com>
---
Tested on x86_64 hardware running v7.3 with this change applied to the
ksmbd module: share on a loop-mounted ext4, crossmnt = no, smbclient.
Without the patch the root lists only "." and ".."; with it all files
are listed and put/ls/rm work. Also tested on current mainline in QEMU.

 fs/smb/server/vfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 4ee72eda9bc0..1f2bc76f0d09 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -66,12 +66,13 @@ static int ksmbd_vfs_path_lookup(struct ksmbd_share_config *share_conf,
 		if (for_remove)
 			return -EINVAL;
 
-		pathname = share_conf->path;
-		root_share_path = NULL;
-	} else {
-		flags |= LOOKUP_BENEATH;
+		*path = share_conf->vfs_path;
+		path_get(path);
+		return 0;
 	}
 
+	flags |= LOOKUP_BENEATH;
+
 	CLASS(filename_kernel, filename)(pathname);
 	scoped_with_init_fs()
 		err = vfs_path_parent_lookup(filename, flags, path, &last,
-- 
2.56.0

