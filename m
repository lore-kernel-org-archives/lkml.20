Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519802;
	b=kTYqWQSHe9fz/aDpp0F5f37h6zA7r19OiBnJLKRWaeuKrQ0En5Z5fD7hAdrWm80N5ARW
	 n31iie74xFzgSq+0HsFyLuJX9YbL24Fh13VhoVBL/abQR0I2Ybw7asNhHFzlyCcCt36ry
	 g91Ftc1J3XzQ23Rw4h4LUt3dCtdwf3qgfjugQnI25QpfFM1fPTl046wT9kvto7G0VMxt4
	 GHlV31KoBuqF2LOYt+8ogRJ+v/2FnGm/86GtIHMmvsmDyDnN+o39+1soYveaggeY8ZlDv
	 yvArPdzRWc3CTsx0yP3mEYZfKfH/yImJUs/yNZKM6VnFUwFod/MDsXtebS0e7rDm5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nF0KtzX5lY7X7pCJpkiEL7jZcDqHaKsV3dNNI6QftH4=;
	b=e06sFw2uooopDDlCqT6QLQS8Rv5XiKe7Tnl+cjFqX6+ESydBIOuXDsafFxDQ8sf8DxAX
	 UI+zjNE0X6npcGTEMfAD1bt/3EAKmvQiyILKeoU4jZvJAFnRNKvj8nQA1lga/pGzS6bev
	 bxs0/jgrMFAr14StUKDILDbzWFFCw3Xnod3u0tnqY9cgU+yABr7CtvE70VqEd2m/JV/um
	 qucXSncgSITKL5PF55KaR4Tcp1H/O4oONK6+67AEQF/q4aMQDA5vAVtcsv5i9Vk8NcE7p
	 I1vV33H8m/6MjTqJwWJ1SHfIEhkVFrjujHpCqTCKmB3PrWtQOnlm+pbKIp5o8jlPfig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTFP1YTl;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF30606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF30606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTFP1YTl
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so146781eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519801; x=1795124601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF0KtzX5lY7X7pCJpkiEL7jZcDqHaKsV3dNNI6QftH4=;
        b=aTFP1YTlXXdl0HAJpAl1IGQqPmHxAgN32nP/DU0hn0A73YWBfoQEg95r+s376VJzHz
         cXwJyunp2BoAKD0B2P8bpeTHvvj14wclDO3gq/fieV//adlJ4dexebn3RXPMBMGK0IV5
         ZYVBXOEQAwZXK4cg1gN9WZ2VCV01TvGlTTQBGtF/VRzYe8pdOTkg7LMZD/Y/IwrPaJp5
         71fu/4TZKwxsjLaVuOltb7SfYOW5Le7q4W3tCbd7i4A5hXNfcz0EW1c1kHVsiAbf3wqM
         SABhpkJu++c4wGLQSLqgWJuuI7GC3IcXm/wdMzHLCLAcvstNuMkZ0BnQjMBuUxmk9sxY
         wpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519801; x=1795124601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nF0KtzX5lY7X7pCJpkiEL7jZcDqHaKsV3dNNI6QftH4=;
        b=fgJcSgueB/A4VvxgZ0zN3hkBqs6iXxCsnLHL6GgG5zD2exyFte5w6XHaMx+guLfCtc
         pAm9yd2x7IIcBV5N7xY8idFleOctIrD2RY6GAxUCIfGiqLh/ntudp1741unrKI3efOgl
         sslg2oBnqJ+iV4HwKWDUH3gmwiOaEKtPErWDnJvp9TkkNB9nTYagEMtVu9WVcVVfHnB7
         ois6lguSScUnoZnNVH2OoIC6XE38GcDASdqeFF1RmCsIYcGobbAu4tnrwqhLdT10FJhP
         JntxjzM5bSHd+46Bq5veLOq0g00IJdBsMEszTFpehAxwJuAy0rAklr6q52a69itDkQT6
         qbOQ==
X-Forwarded-Encrypted: i=1; AL+hErFCiBR1bZ1ytZDuZTtMOQMZFxJ3eaEo46br63iKwh8cpCohZ1Tf2uXV+ldgHhfTz5IoSkL1utJ3QTWWIy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HTI3NOpIoOWjb1Dc8qOO/+1ezDxbQCay7nKWEsI0UYW6C6Wke
	R58/d9GvvbrgfpfoF2XPfIx4WaCY8IWG7hTSuxsxuZ5cnSIUhnZjsPCu
X-Gm-Gg: AYBFou0kuSr3OGN9fJGxQYHPTSMxRjPJX92e+LDgaOZ4A0vkJ26Sk3qEIO+3RgMkYM4
	0F9vlw3vkyri0Vdym7cv3HdNXoKfjNny4Xmmi2l20oJxs6FeIgiMxXwG7+3L058wq8v5a+UbbrY
	0+eayVHEYJRxMRZXbkWbrt3pbq85VwVBPuWl+rXTcXAKTeevTVF5pDHsvhXyRvCcp2JROnoqZ2G
	qSEWzEHM4StrgLzPPRvRm8uOq0FfdDOjktZxYIxpHTtdU1h4mbmR7+kETSWeK2VZvfDS44XBR0K
	b5RnnDop2QTwqYX0kWUXIxKqiYwSBQgW2MMRVG4vQu9Oe8XM3E4Qt4AQH35smz9+HnJMSeVQt1X
	VvAl9IR4AJNBGW082PcW56qAH/m+0pbgzs63yTQWOhlCgtL0bqABXeXypz7w667pLXz3tCdbrP/
	tEVTmVouzJGllgjQfqOyPpsJyA7e3sIJS7XHm9DqjAP6J4Je2hZ+mmK2dQjlDU6Ck1jevUHnXWK
	bZWdSZMsSoXbeoqAuoZyUTqt0Oh1Fz4N1ET13CKw2KfLarBigYld/p9FTgQHPs3YXg1letMIKzV
	x8wDNCx8TxgE83HZKvGJ5ebWkyJe/eW1T58AofEc08ixTDsvcH6+211BrydA56cU/HjactUhCnW
	IYVnGSMsKacUmI4bQS9iB6AEH4RFHJD4V/CDD5A==
X-Received: by 2002:a05:693c:4019:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-379675fc9ebmr349506eec.30.1794519801217;
        Thu, 12 Nov 2026 13:43:21 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm1194466eec.27.2026.11.12.13.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:43:20 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 3/4] f2fs: require write permission for F2FS_IOC_RESERVE_COMPRESS_BLOCKS
Date: Thu, 12 Nov 2026 21:43:02 +0000
Message-ID: <20261112214303.16198-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112214303.16198-1-dennylin0707@gmail.com>
References: <20261112214303.16198-1-dennylin0707@gmail.com>
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

F2FS_IOC_RESERVE_COMPRESS_BLOCKS does not check who the caller is, so
any user who can open a file whose compressed blocks were released,
even read-only, can reserve the blocks again, which consumes free
space.

Require write permission on the inode. inode_permission() does not
depend on how the file was opened, so a caller with write permission
can still reserve the blocks through a read-only file descriptor, as
f2fs_io does.

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Suggested-by: Chao Yu <chao@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 93f892b11915..9d09ce597f72 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4436,6 +4436,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (inode_permission(file_mnt_idmap(filp), inode, MAY_WRITE))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
-- 
2.43.0

