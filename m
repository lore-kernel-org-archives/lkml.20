Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202035;
	b=iM2eQImLFqMc57Ps7gBjoMiRnZcudy8vX4p7ZDL7QUotxwlXPehwGcETB9fqmevXJmBq
	 rs4609dM0qSzfulrGu3SvLIghFQg9G7I3MyxjG2swreGSzdylzz5qcwF7fvCv8p5shkRb
	 KdX3NfazRgIQVcuP9q28MhHzQovPOo5GaLpR3Kz3wHe0zIsQtuRf/pifC0orADeAE7mQE
	 t1mUPQcEVhYUOU5KPIjjUiHa6Con94GNK+d5xPagUj2QgCze0ao6/M6fMeKJrrIeGvSRB
	 9S7VXq6H7GPsTUOidAq+SOGWhHvCKeOfOSt3GuQGlLwFHzJMpNjKXChwwF78F474beA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=niA4UwOGFOA4mms81CnxsMGO9J3yqXrymq+0Zzb3sR8=;
	b=h7o1q9I9jxrFYCbG4A/XmsO1Eh4hIUOBC9eMHTRoFzRanoN9e03n9WZnOxcYtYaJJHEg
	 wMYA43izCR0GbUG5S1lSDsdqLX3uXBSV3RPsjpiURojAwtFa41EDYtyMew1A2BFYYMzVV
	 2qC/zajd+ue7JdsJyzTqP1BG2ROhmPAoOQitOZymXR6Dj45cuAQZcYBRUlvIpSCIBuMaf
	 zPN7h3LHeRJNFOvPCs+3+imm8/ctdoCezEPrs1oLFC6lSXxpDXJy5lDOyOKyeqH1l1JPD
	 7X2b3EPVVQ/m2DP70cwef2VlfTg+/ZmuBGmtcOSUvqVXHpdxkal1rsFg8PObnth+NFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1+8Ak8Z;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD254606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD254606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1+8Ak8Z
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1907094eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202034; x=1793806834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=niA4UwOGFOA4mms81CnxsMGO9J3yqXrymq+0Zzb3sR8=;
        b=w1+8Ak8Zi6w+lNdL4lEsx4wFs4qd7BtSAE9I8Q2jgtDkMIwbe++yhLjWCBKgx60WTL
         Dl1s5NMPXeUJodvIw07ZBpeNlPxdKOY279Zc0+iH+92DW5UNb/71e/UNGuasDWV1hXd2
         YBZ8WojFNZKqLAmmMlBvkglHjQUb9kXIjVOoZIK3PJLzaJUFmEtnN+U/9HlDWGHVVJ/l
         grQDWcSRW9pa5lmZfRAjrv3s9lwkq4tnBK6aF5evtMReYFBXzFjVI+SlFSX/EW4lq8y5
         XniL9jNnYlY9OSTdnL8ozKyMriMqRHb9+SNK7pZhrn1i+nMrT/4KoSaEoFIimm2YXiaN
         sp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202034; x=1793806834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niA4UwOGFOA4mms81CnxsMGO9J3yqXrymq+0Zzb3sR8=;
        b=k03vixaeR6GjRFdUaWuzJArJ/doPMV6zTUGlw020lJ0IEcu0XhEWajAGrjG7UNAe1G
         36VvspR2uwsbDoBYhSQBOBLN39MBgW2sCqcVfI1ILBawRxOMunZGwGW6awnSt5NGkmtr
         ahM4MfawmH8WLxTpN0ZlkroxUn+qQrLzznLWp68mnGOTLa1NkafHsEMz1okOkGvVgNyi
         iptitXPpLTrsE9wKQgVwqvFwitWI7MSOhE4tXv6bmhtG0/fbJs5FjnQub0jGfrVfVJBA
         MMB3rEIi5eKIVKGLCkmyLHD4fRZCKRUbgFZpPH6VsycyjKXJlx/lxyvmagwWhKaftM8D
         JTsw==
X-Forwarded-Encrypted: i=1; AKwUvBwpZIGj3bsVSK1poT7fu7/4ON//TGmsWcwVzbPi4vEkWoJy9mYoxbWUcWYQpU4xJKD+W3ofwPSE7uGoOXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhSqZKf7KdKOvKDjJgJT3cIbKkxd77zTqtmNToy98wjfoyJ70r
	4iDudOc96CmEk1ustEj0SMabtw6g1cbB3J6rMv6LhiaxOJeGhXm2TPeR
X-Gm-Gg: AYBFou0vkKaalgb5dj5egLVIdX4tlFIiz7FIfrxzdVPUHV4ZqiSv9i0Hckg582QY8R+
	pF9SSYqNSI7pY2uZAZ2/pKaoL0gw/HVtWzZM130ViYr5qUwr0h+DkvTtHVmclZTxCJA6TRwsg/K
	Xn92aR3oXhg8WRTgpTL6p9MNtO+f+AihqOwmk/zsVb6GsARKFIdBkEb1AzaaiV9c4M1LIFIair4
	1Y8JwArBkkubHmC+gSc/aq/WAwOw+S41LtBuMhAkLsW3x5Id7a4M/EIE0/bpJPCwR1m66oni1OZ
	QcNswbcdkKLO981+tL9IbAVWJodE/QVEyY9zybQ0YfVy2EM0HiGY6M7VqAfXlyXr0QxqqIsvB9H
	5Lvp3qIvykhZlkpeoMPgIU5Kw39N7pFrnV3xmjVOTZWygbTt7I8kGAtpQAqrMocA+QWnB3H/zHL
	dh/jeAZMg3KGy6rpGMY/dXVtyhZgOqG00hnz1GGG79ZoDvuv8ERYrbM+EonWwqiTnPvC/PeVTvm
	NJe+CKyvKRxV2GPM08HeJ4lFCYSNVmdSwfmLSWGh8qZArtscJd7UA//8R/28nAqjdg5yyH0agls
	RCJ4aeY2HCqj9sYux0x6Ricn7LGgw9+hHkF2wimPxrwXe0ysUNe8xdL08X3FC+/xdTpkVL4I1rZ
	H8A==
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr4331113eec.25.1793202033635;
        Wed, 28 Oct 2026 08:40:33 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ebcesm7873678eec.16.2026.10.28.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:40:33 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	andrealmeid@igalia.com,
	linux-unionfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] ovl: restrict casefold consistency checks to directories
Date: Wed, 28 Oct 2026 15:40:08 +0000
Message-ID: <20261028154008.67451-1-dennylin0707@gmail.com>
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

ovl_lookup_single() compares every positive child's casefold flag with
that of the overlay. On casefolded ext4, regular files do not inherit
the casefold flag from their parent directory. Looking up an existing
regular file on a casefolded overlay therefore fails with EREMOTE.
Symlinks, FIFOs and whiteouts are rejected by the same check.

Restrict the child consistency check to directories, along with the
corresponding assertion in ovl_get_inode(). This allows nondirectory
objects to be looked up without rejecting them or warning about their
flags, while directories with inconsistent casefold settings are still
rejected.

Fixes: 16754d61dc69 ("ovl: Support mounting case-insensitive enabled layers")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/overlayfs/inode.c | 2 +-
 fs/overlayfs/namei.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 63906b3dafcb..4428c50c3185 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -1278,7 +1278,7 @@ struct inode *ovl_get_inode(struct super_block *sb,
 	}
 	ovl_fill_inode(inode, realinode->i_mode, realinode->i_rdev);
 	ovl_inode_init(inode, oip, ino, fsid);
-	WARN_ON_ONCE(!!IS_CASEFOLDED(inode) != ofs->casefold);
+	WARN_ON_ONCE(is_dir && !!IS_CASEFOLDED(inode) != ofs->casefold);
 
 	if (upperdentry && ovl_is_impuredir(sb, upperdentry))
 		ovl_set_flag(OVL_IMPURE, inode);
diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index ca899fdfaafd..023966d89f74 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -266,7 +266,7 @@ static int ovl_lookup_single(struct dentry *base, struct ovl_lookup_data *d,
 		goto out_err;
 	}
 
-	if (ofs->casefold != ovl_dentry_casefolded(this)) {
+	if (d_is_dir(this) && ofs->casefold != ovl_dentry_casefolded(this)) {
 		warn = "child wrong casefold";
 		err = -EREMOTE;
 		goto out_warn;
-- 
2.43.0

