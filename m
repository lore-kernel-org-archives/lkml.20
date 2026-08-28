Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869C3C9EEC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897917; cv=none; b=cZaeOqJ646qNomBIqtZEwsbRvXhttmkUbWggDV9PhKDEWiaT8XZ81WtPN3zTu/OCSzvmCKtaqMzb0LivY5BpLi41nZs0h8bth8WhaZajcbqK9H683Xd/G2iyYCCvxo7QXa9VBf3ymy2E5S7AbOHdXTFnDSyZaX+ajctLXSg1lSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897917; c=relaxed/simple;
	bh=OeN0Lav0sDKSoCcN2RqkRGO8fc4vJdxOu6ngp7tAmD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L55Ho/Bt/uZVVk5B6DMe4YsYTdPmcWw7IrCGyzAYj7tBbQLuI5SO75KD+A/WpMfVbQjfN81kNzsnVkUcRYMqRedlpmDUGiWZi7bz7a8tn0tRGlX91/5Z77sNe5nyi4QdFCG/E4voF0mmlm575sO7lrniFa/4sDvi/TtnJKp9lI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2gGftgl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2gGftgl"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381b831d535so1336639a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897915; x=1788502715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4KnJNHHlG1FDDJ6KhAC+DODrr7DQNNSCNVhvaZK7wI=;
        b=b2gGftglJxt7/TbatfiGK6bz/WoPKtINp/JpY0l2FIwyK7I5Bp4OQh1pEW90atOqcD
         tX0jiua4IOFtaoNfGdIHxXmxdlJxlRETox2zJk+YEWBdW/CuSYz43tDOUeWh91sZeA+9
         kdV2JxjQSE6uM+OfVa2It4cuBs5t++8GPb9m1pUBHXwgQ1ascBZjh84bjQM//7oK3lII
         TIuu9cTxCtr5Ymb7rzAyZIuqX5rWCTOfKymxnYg/YvclnbtT/U7fCukrEgXhEqLouUR+
         GpxUmk9amdoxoNIPnbxyiFVuli++o7oltX7yiP15KQJ7cKTV7cVri93gdk6TTP7h7RNr
         qcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897915; x=1788502715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4KnJNHHlG1FDDJ6KhAC+DODrr7DQNNSCNVhvaZK7wI=;
        b=SuOoLw2pbv3HVxS/zVUjvZ/W1xqk3CKIMONw3ipEFkcThEuxHPeqj/Gpx2KtY0A+dd
         rSbRJSsmUqKtMDZxQbrHoXOfASeLk84ke3UC+Xm8GRLmRK6n6kEVCyvtxt8AK8nTZccC
         E3iHYm5rkT4yzKrrWAQIKiryy854wnm0NWli9adEXCnhSpAQNvMtwIjHQtIqzILJ3hCa
         FxSxWYt2TKceQtoR4UmGMUL9Ky86SjmEAJlPJBYMN3ZS7O2PftP8C11u0al0SRbz4c45
         f0Y3zkunFvTsjZGaeTOCXgME60KiI5Jli4VZ3aeapPMIGZ6TBp3i4q0UdAkj/rfrzwmm
         jY8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTu4aQltXnTyxNv3EXHaaCnQkXzW0kzltr8IoP3tIlRVJqwODGp86pNo1pTAAIYhAVmGBXRLmOkKfq+RU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHZoKgs6MCBUpiXSbA3HavxxB6b5ac2n2ykUIvkzpLo4NsnltB
	9KiVIl7muQxbG+HdNcFXkvQq7KEYrvVRF7rkSNCPqDgExqbLeKXXfT2P
X-Gm-Gg: AR+sD11yLTdb84CuIH+WK49ba765u4oRqzqhdWNxE4VtVjqr8wmMK5Bg923Vu1lWGMv
	QSuLWFErAayn8y3Z7ZFEAbVujqu1es/gBlmuu0FQoodXblmfBfZFlYOsjkL8WArPU2rmMgJQzRg
	QMIsb541rdIvt47knNIypuX0uCjNxOT8Xeg20loQuOrQ8WGdKurCU8m1z6HX5xG6WOf8nD97+OA
	vlHkPp+omS33nDFlXskMQSIxPeDD1GgOO/wN5o+UPtqchFYne0HXtMl3jSA8oywFBIsliPn8T3G
	q5eGOc2c1odwF/THqBUpYVWQ+rg8VcS1qPoaxeHR4dOeU5Gb6nkQ5E0sn40JFP8Kog8kzCOEnET
	vKkoWwCivWC+baMPfU6mSknBC2MhmXt/6bntGmCV73AOhn5jF/YrI3ynwem6/3gTK5SXyziwqoa
	Be/8Yr9vp6aW8kqEdCjYrE11L06+o3SFzjCTAJntPZpV06P0wMDg3bW4sMsIZs
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr10023490a91.14.1787897915157;
        Thu, 27 Aug 2026 23:18:35 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:53eb:e6f6:37c3:14bb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d22eacbfsm793778a91.0.2026.08.27.23.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:18:34 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v1] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
Date: Thu, 27 Aug 2026 23:18:29 -0700
Message-ID: <20260828061829.566256-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gadgetfs_fill_super() fails, it's error path calls
put_dev() which drops refcount inside the_device to 0
and frees the objet. But the_device pointer is not
cleared, leading to point at freed memory.

VFS will then call gadgetfs_kill_sb() after mount
failure leading to put_dev() to be called on the
already freed pointer.

Fix by setting the_device = NULL during error path
before calling put_dev() inside gadgetfs_fill_super()
so that gadgetfs_kill_sb() skips put_dev().

Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..77efa984ce84 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
@@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	 * from binding to a controller.
 	 */
 	the_device = dev;
+	get_dev(dev);
 	rc = 0;
 	goto Done;
 
-- 
2.43.0

