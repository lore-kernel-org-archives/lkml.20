Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353778;
	b=t3u3myuL5mivuthfBfDZik/OivvC0VKeel2webSteKHrG7UtRmTJ0k1q1WJ/2t/ifPi1
	 lle3V2P+0Tu5dTxBrdI/BD9gXk1RcjoCMavH48+x3YmilfL88dr3wiPtHIF7kKoRaF9c3
	 OWUTH1DlseV8UgXMiu/4dzEyJ7BHhZJ8ZlN8KufQ0ceKgbn4Z/1YuVFi/PEHUcBuN539C
	 bi9Dc+L/EwrfIN95pxsnFaHC78dyd6EoMRusJx38h/Z8brVexVuuIaDRXzaztxoXy99wI
	 9Hh6PGdb7ieaFI6ph88Xz/676Rdcq3UToyRPIczV3C+kYLQtgYNZmm4vq8SOo2GTkQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NdUGJbS39nDkhA46SqrE2gint9HNs+u12Kr6VpkgKT8=;
	b=SIDLl/zH4trQ6mZasBFAaZeO1U0GoCG/t4fUEaBz8n16o9Jvfu0pDq4EKI2cT0TE/Rzv
	 +SW003RcTQz/16Y7N7I1Ebk1MoHaqecR/SyRopgaRcYG6S+l4ORcinSFpGPmpJV/HCgVm
	 2IRParnBmPrglObyfEG/Z7ip0WgJjyPy1B/JkTc8Fis+Tt+78bIj8lqosb9BxpU1UqtnQ
	 GB+5d2iL8/gKtFVHvS7aqac6fWHJ0uFsApE2FxKWCDUJBlqiMgKNfDlSYp6fKCgufpQpB
	 NvcO0nIhq45tD61QEzTV76K6eExTuIq5did1IJMgRtIpkfv2YhdaIt60ErLJCkfrQdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kMj3tsu8;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A2606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6A2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kMj3tsu8
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b305312e4fso22686287b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794353777; x=1794958577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdUGJbS39nDkhA46SqrE2gint9HNs+u12Kr6VpkgKT8=;
        b=kMj3tsu8eSLGLEImMjNVkYYNWV2qyqkcGuSMqpR3GwMyTU77dtVytNKlvCyVV0+5jA
         4a158RkljBvOQgpJCUqo9RsOjO63b8gkx+etod+K41JxopvTezXZcvMyN8I2AAoZaNZW
         VA88jfs3kXqg4RCyPZ9qcLQQ41S3jd6RrAYyx3e03w40A2S85ByffZlauKqmTEHJ/Wbk
         IbUkfCSnw+U2qT19GZO3YptTbAgYSk8zVXIqLCHgYhjWzDg9w3DQMVagYVUwXeTYRKkn
         4Wgdipnj64b9wukcsXTtdzRpPGn0FHUwXYuWXYAusQ5u/tcdX5Op70JZV6aWKm7v6TrP
         LTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353777; x=1794958577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdUGJbS39nDkhA46SqrE2gint9HNs+u12Kr6VpkgKT8=;
        b=mcvzucZybK8lya6668q5ZKAAU4j8Ja2v+gmC6zs7/CjrvLFVUcNlx7fb9u7kpH0dVu
         GlqasqV8TAehe1U8/T2FM6Ed0d/RYJEuUPNIoKzriMZlQJEcu8RXKDioQnze8l4YCTLy
         5C1QYGGNwAmBY+gvTHBaUi/CBdu35/tNqvu11uB0uj5vulmFd6u7QKD7IDuIoLp629XY
         sIeM1ZrImXpinkRAzAtp07OCd0x9dhDj+l+sm+xtTonAmJSXFIx2YfaahuqZ90Hospe4
         YOP+q1iX+JdnY+1gMtVFbRji8ttS1oZLcatyNPf7EHlEmeLxlU3uemRJB53MiYTGUWCv
         Eysw==
X-Forwarded-Encrypted: i=1; AL+hErFsedUC8ZRUnJRR0zIYZoV1ZLboc9wbEfK4ahIuLHmMcZHuOKUnufgoC4YFOTK9D7Ap+9Ikn53zIyjlgY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mnspGsW42oROKuqrxrllRl5X7vwF79pR2l6NHjQ9YAG0gV7dI
	hrnOq27K+icB7vAYly51sHWv4atmdDLQ/0LXPzz1wkpo4jCBl/kXy1B9YnlmJo7ZzsU=
X-Gm-Gg: AYBFou37tD+jMabm0CexeFu9Pp0ylG/KK6hW8kXufzJqAAw1DsKNFsYmqwpfmSembUB
	Z92v9O5KxeZmoer9E9Ga5ed6iS6IhpzMvvBhzGQlO8mP/syblVxKGGOZ/0eDXjlvtobK+MFTtdN
	/7b/Qt+vvk8CmwJcuJpBh66a41Yb2H7eQk4tJTCUfR5kyHSwwNQfJ8KXmTLcKU0Hrh/kwkcia6o
	mymehyVicYQWr0DEjcwx0cecaBbDvrhVSZrBG48L6i0O2P1mgdKAWa0vxGl34BSy0fTgtUj6asT
	6o05I7te7A0edUYB869pczrig6SvPlVbpuXPuuuBh/QhqTO4Y+IWi9xIHPLSy+EXrU9Gl+3ZxCJ
	vxB/j3mKtWxrZDBOuw+W0BWBkjbpAmt0sOnFS7uWB8E4Bd4uPedt9t6DELnWl+5D1BTgQ9B/JB2
	xRLhywrDdrT2FGXUnn0GZfZfybyZbTzprqJlopCGWFTggJLGz+Rqgpp+ZBFck0KTNwuMgi98vhW
	Lb3z+8hW0CRZpksTfhWstGZ/Rl587K4WbjqwuJIghatEHPPNctRm9uv8uCPFeCoVDd78XjELWtb
	Mp/6eGPRYEVkXGqZ7WQdT6T/ii3cXgz6Z5V/O7v4+/sEM84U/D7yTP3WOJoIYfvuBZtOs2e9ZJM
	7GBHlC9kIwgluXBTY95tmu+Zh6l+Lrf9aFnK/pyaVT/d1/s+qVuutzYJLGp78HsDwpiCFXZY=
X-Received: by 2002:a05:690c:f96:b0:8b3:2af9:11f9 with SMTP id 00721157ae682-8b3a80629abmr5805407b3.26.1794353777055;
        Tue, 10 Nov 2026 15:36:17 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1541:987e:e160:f038])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d1047sm31652577b3.19.2026.11.10.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:36:16 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 1/2] hfsplus: release preallocated blocks in hfsplus_file_truncate()
Date: Tue, 10 Nov 2026 15:36:08 -0800
Message-ID: <20261110233609.561557-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110233609.561557-1-slava@dubeyko.com>
References: <20261110233609.561557-1-slava@dubeyko.com>
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

hfsplus_get_block() extends a fork through hfsplus_file_extend(),
which allocates whole clumps. Also, hfsplus_inode_read_fork()
initializes alloc_blocks from the on-disk total_blocks of the
fork, while i_size and phys_size are set to the logical size.
As a result, alloc_blocks can be ahead of the number of blocks
really needed to hold i_size, even when phys_size matches i_size.

hfsplus_file_truncate() returns early whenever i_size equals
phys_size, before it compares the required block count with
alloc_blocks. So, for example, a file whose size is aligned on
the block size keeps its clump preallocation after the last
close. Moreover, hfsplus_delete_cat() does not free the data
fork and relies on hfsplus_delete_inode() truncating the file
to zero size. If a file has zero logical size but allocated
blocks, the early return skips the truncation, and its blocks
remain marked as used in the allocation file after the file
has been deleted.

Compute the required block count first and return early only
when neither the size nor the allocation needs to be trimmed.
This keeps the intent of the original early return of not
dirtying an unchanged inode. The existing logic further down
already handles the case of blk_cnt being equal to alloc_blocks.

Fixes: f76d28d235cf ("[PATCH] hfs: don't dirty unchanged inode")
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/extents.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d18..924941440066 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -570,12 +570,19 @@ void hfsplus_file_truncate(struct inode *inode)
 			return;
 		mark_inode_dirty(inode);
 		return;
-	} else if (inode->i_size == hip->phys_size)
-		return;
+	}
 
 	blk_cnt = (inode->i_size + HFSPLUS_SB(sb)->alloc_blksz - 1) >>
 			HFSPLUS_SB(sb)->alloc_blksz_shift;
 
+	/*
+	 * hfsplus_file_extend() allocates whole clumps, so alloc_blocks can
+	 * be ahead of phys_size even when phys_size matches i_size. Return
+	 * early only if neither the size nor the allocation needs trimming.
+	 */
+	if (inode->i_size == hip->phys_size && blk_cnt == hip->alloc_blocks)
+		return;
+
 	mutex_lock(&hip->extents_lock);
 
 	alloc_cnt = hip->alloc_blocks;
-- 
2.43.0

