Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523038;
	b=IOVehO0oYGLVYDJLfWDkqLI74HgGipd1r2Kn4doj86D/Wfz5amlcnkwCUF/CO8Ykfyer
	 YJhqSfQR/EcrMSID6FpIAzI+gJ+0vB02BkRBANoeABkFeyQiRAH6GQjSCKCtb0IRNPqS+
	 iXoKU3V5pe+GXOw1ZOPohYH9/CXYC2O253+Zw3mOT7/YcF31DBr2KCz5iFKurBYKet1GW
	 q8t0f0gqz+KEqlWCIha2054I07bRwne0uiTl/8/KLE9DLvZUQ7wcRyHM/9P93Ufky6KBs
	 4PN4r1Duz5F3J0ZoxknYA5u4Db1+8b2xZWVgSBl+6Q1DgiVfca1AiWiWpdSEGgHAOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+YVhDETtUQWm9g1HvFHGXlxhsLtvKkYiiefCwtpS5Q=;
	b=DevmEpR0VrcqJ0xMBJ/zPfDxXDfm/Px1AzxgjaVMvYF5ksUR6BkQb4ZdIbtqjVSCg6vg
	 1/19f9CqKWhEir26l4XSZFQ3lIzv+Ib9z38Zm5cDdSKTNFOm3un6l4UFzx1eUIHCbhbcb
	 PvpC+XRfO3yw9LC+HPkg/cBoMuie4MEfiLKwFYexEvGnVTLy8H71MBG3alkyRylRSPkWS
	 djieikvcbUJOQnwHjuzbXJS6K8kE0dZI5S5AnUj9OJPWpSk9F4YLZQSWF3F2wU48m61QN
	 PxlmtsmPrXCj04LgM04xmKC3MmrUcmhCWuSeYfa8rzKQk/Lx5mfkg+RJfJl2sd/GAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yi1QS84B;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34335606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34335606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yi1QS84B
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so2814139a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523035; x=1793127835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+YVhDETtUQWm9g1HvFHGXlxhsLtvKkYiiefCwtpS5Q=;
        b=Yi1QS84BGHvS8TsgRfabeYKIqe70t8cUNCXCVXCmavgsqsUzeP1VJbf7UDqxQRbvHX
         Wk+y8GqSYwdO0exxPbPb3hBvRhyAnCfeNVAoY6WIdDkjacF2+jMOsZ6O85wi2ebiagy6
         GioTRewLq6QPvGlqHl9+ygm4T/An5kAObTYsZnhek1hxs8BAcMGDMgbCHwiZmjy/RnB5
         YD5tUsMix7DS3s753iR1oqHU9WTOG64ucFZIQCdMcHen/Z2mUpf2bV1RvKjopYaP3DpJ
         5nXAcvUs+HJ1uuKHOcvrmICOwUtEkSp0V78sG7A9zdGKwYF5ZAfgwvHeah5uaX5AX2de
         t2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523035; x=1793127835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+YVhDETtUQWm9g1HvFHGXlxhsLtvKkYiiefCwtpS5Q=;
        b=1c3dIzfaeH6gyIdc1xyHXeXW6dzzz6bZYESop/QoAOsZTo8CTR7Fm+kHa7ZBqvrXe+
         iSqemwE5uLo149J2lq8cmQp1uv8+yvuEGMLWPDr8gHMUCzfSM3lLpI1uDiaYLYCWZ4s1
         Q20UPy/AcxrtsvlO8lY1xa6z0NBYRQdmkR4lf/+uaUaLWmeVFzuyi5/FbViTBbCmii7K
         sdw6mXUaJ5q1tguHiknzFqfeyLpt4I21TXycJxBd9wuAd9YHvlo6X+IGAST61K+pZoQ5
         Hp11IXy9K1K1Vnop/rbZe5o2qmEqtYRM8c9Mn/HqbpkHXhLbdCPQe9SkD26ad0XbSoum
         NMzA==
X-Forwarded-Encrypted: i=1; AKwUvByZaK68AaxRzvpzy7+1LzgVho+KaKXG4NahF0CsxYeQhBnu5ZeE33R5eyjaxCXQHUIEG0f5cqmNWZq3+6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfHkP2HNgMEgKyAI6UgAXb448Pt1g0lhjdqKUtB27Z0Lb9I5uY
	WO8oHRXVDHtoKk4HMxKahIpI+QVMfOJN0MSjMA8xZ2jDyXMUA4JDHr4H
X-Gm-Gg: AYBFou16K8gZxgoY4HCmcjmzTov4eO3JsLbz+4OU7eX1WEYvGPRUUpbWHtENoMVhYFE
	Me+WAQndBS/QYAMHdUSo9xhMoaLznDY4k8T3tzNPQdW6uBjvzNp1jT31WGIvrvvbgK3jPbw07fr
	A/p+WwoLIYXER2gJnT3aHpmpTNgmb9AgJBK0vBsdiQ8Sj1ii8P4SVy3F8VVYScLLvubBnjShX4i
	J3B4CZyys/Y3ZgsirXJ6bxb2G/n6R34ExekshuWWVzNw5yjDJ+Kz/XVtecbzgIHGrLO2UGJZBjV
	Kw9q1Af0rT64eus6JvvnQNc+otTB1Wto7nJm8toKbOVL0VAHlYEEWAxAVTwNlbfgMWNRcJjGhH/
	5sDSvGg4x6Qze0vvYBIVWLU/VGuUOYGjwAg7WN9ngqnzQtoarrtry2+wFeDwHb4CFKgknEEiuUY
	ndrUXyUpxSDcHo1kgm/cL8UW0nr1CivrA7XhxU8qPB4AQw4mJL9REHidTWslR5cj14kM5Gm7ug/
	U9ec1nWphG5MAsj21L4V5EdQe9FAPuqBeT1zD8WclHhU1t4y8i3pH9g0vf6PcEYkLi/TL1BHKQZ
	Hcj2pXvPyw==
X-Received: by 2002:a05:6402:c287:b0:6b1:bbff:6ce1 with SMTP id 4fb4d7f45d1cf-6b3a81c7156mr5153026a12.45.1792523035337;
        Tue, 20 Oct 2026 12:03:55 -0700 (PDT)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403110a23sm24516a12.17.2026.10.20.12.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 12:03:54 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH] ksmbd: reject FILE_ATTRIBUTE_TEMPORARY on directories
Date: Tue, 20 Oct 2026 21:03:51 +0200
Message-ID: <20261020190351.9445-1-mike.michalo@gmail.com>
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

Setting FILE_ATTRIBUTE_TEMPORARY on a directory with SMB2 SET_INFO
(FileBasicInformation) succeeds: ksmbd keeps the attribute and, with
"store dos attributes" enabled, also writes it to the DOS attribute
xattr.

MS-FSA (FileBasicInformation) says the request must fail with
STATUS_INVALID_PARAMETER when FILE_ATTRIBUTE_TEMPORARY is set on a
directory, and Samba rejects it too. smbtorture's
smb2.create.dosattr_tmp_dir checks this and fails against ksmbd.

Return -EINVAL, which is sent as STATUS_INVALID_PARAMETER, when a
directory is asked to become TEMPORARY. Do the check before any
timestamp is changed, so a rejected request leaves the open file and
the inode unchanged.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
Tested on ksmbd-for-next 454ae8e5c306 in a QEMU x86_64 VM with
ksmbd-tools 3.5.7: smb2.create.dosattr_tmp_dir fails before and passes
after this patch. The 187 smbtorture tests run by the ksmbd CI, plus
smb2.setinfo and smb2.dosmode, give the same results with and without
it (smb2.dosmode fails both ways, for an unrelated reason).

The same failure reproduces on the Ubuntu 26.04 arm64 kernel with
ksmbd-tools 3.5.6 and smbtorture 4.23.6.

MS-FSA (Creation of a New File) also says that creating a directory
with FILE_ATTRIBUTE_TEMPORARY must fail with STATUS_INVALID_PARAMETER,
and ksmbd doesn't check that either. I left it out because I have no
test for it; I can send a follow-up if you want it.

 fs/smb/server/smb2pdu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 40af35c0aa29..1ed8e8135c58 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -8695,6 +8695,11 @@ static int set_file_basic_info(struct ksmbd_file *fp,
 	inode = file_inode(filp);
 	idmap = file_mnt_idmap(filp);
 
+	/* MS-FSA FileBasicInformation: a directory can't be marked TEMPORARY */
+	if (S_ISDIR(inode->i_mode) &&
+	    (file_info->Attributes & FILE_ATTRIBUTE_TEMPORARY_LE))
+		return -EINVAL;
+
 	if (file_info->CreationTime)
 		fp->create_time = le64_to_cpu(file_info->CreationTime);
 
-- 
2.56.0

