Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864021;
	b=f0mdp7lw1CliwQS/UkZ9xMdsXxzDIr7MhvDykaAZIH5sic2HHU3SDauWvsKe36YW2ZB8
	 6hf7L1gfWlQMuc14lVtBXau7dG6c+L/8AHiXG0y+mzZn5kuhNHVxxpDV5Q3fYNfsRZkrv
	 mT9hpzmUAdbn9bicaWTOKiSbIpFXZlPmeKb+y0aa1VeWy9vz3vl9CLNX4d6XqBL2pQyC4
	 41rQbj+wizoyrndaRoA9pHTd2P+bcek/jx+SJnzOlcJmn4ibcK4jkN3RB8gd3tQ3oeoVp
	 EdD7dyhoPjWBIJWYWNbeUFtr4XpWH/5Zh+o7tPc2eieFQxukzYFAQ2Rkz2GhFtDmAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
	b=cgQPSpZsnSCsfTTb+aSPCGPoJfcH0TX1SxlzHT2jAMFfhJ3NNivfdukLgFxZzjZAS2MC
	 t7xs6ZB69zWLdYkegVvEOa1/aWYW8gQQTrWy421qP0owj3CnDQL28caBwmj4tnl2x/x4e
	 TsksthCNXugvjvHY3vUDfIJPsPNHvmBGQC8sMXpVBd7IMKUPZgyvlWfU7PNrq0r+50BAe
	 m03UxseScmUvaPv1B6XaYMRqZVuANeS/iMGJPhnE4Dq43kNmwUbAJpXqiKfQp1a7AopuI
	 w1JcOCAU5tIeYiFYNMkwNj/wHgVCFsa4xYZt5W0anRZls8pxoV600TqrpLTT4pgRjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9xmdOWF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA856606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA856606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9xmdOWF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1995075f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864019; x=1795468819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
        b=L9xmdOWFblG+NwLbXDVxEM3yUEyC+TFmkLH2XHlBa8bG9sQgmLPQ1YPBeJhASLaqgc
         eDKn9a+KvlBh85Zu8P7HGV+3lISdzF0ZPMUanvIrRENzvZjVLgn+vswb+4vquWHxtcpF
         sTuh260JRj3aoRnQpll6S5ZoCDkGQB1fr/i2dHD014SsIvnqVwVBWhCT/FSxwQaL2BFZ
         fipEcgNu5tF55fU/Sj45qWY33corYZyLT73Xyx0E+l7blyJ7WU28zjBXTvczrxlBQfac
         LCcYsdZWaDDGRT5F+SxKebsgMrLiq9O3B8S7XKJwimmDRZNtoZzCN87/Bb67YCy9aGLm
         kRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864019; x=1795468819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
        b=cSW0r3ZS52kbN0+erp7g4lBsvvxxAkKfS22NknFfNI51KiSh9BzmzcLTY4Z1S1cIk4
         z8NV1HkDrOrLb1DWepBxFlKCKCn9WVdIvDQCpRvUqbpaQd4pO77+U9iUSELx8c2ovg+0
         jA2JAkbcXhDSXfuHObzVdMurQWsIe+y1DSHLF/ZpLxGCaamkUIX3znB9WXBsNxunDzGt
         ADNnp0l9vQ/OU7wCalBJBO9VKBK/5AJNZiPxkTShB7Djut5q6Oe3+6tyUDSkfiOBnlTP
         w/Nlqvp1nWJQwPkGl7sFmOEexf9ECCaA+6rsDwbUX6hy2Rvl9ymqhV22EHp/NZSuxglt
         UbVA==
X-Gm-Message-State: APuU4Z8hLXu/x7tBWzgw32aYU6IjBwXO+hxi68toESgWCQ02LZ+OqBh5
	05G6lGu60bf7Vcju1+vO/9oF/F9fv7MHONLioVklveCEQsinMNdf3Nup
X-Gm-Gg: AZFdTZdRJRpVu/xsqyFvLIxtsuresaInsTDoSUzdLYDeWfoJD6eEIoba5Uae6MHYkNf
	PxTYRRM62hd4zGPjEMUoX2W+tLVDZzwB5wXDaksgnUr5tOdflH1p+eg+alROUkjXtND/4115yY/
	GzQteeMUU1EUoigHlSVwG2g5WzvxvtIqKF9l/7NtRcYvbb461isnGaF5EzEqMhzweIgWpS2s/l7
	G5uVM1V/Ua1t2okbvN+9B3RbP2pMl9VF05mEeN/K4G8ZxVcGuPnZCr6UltTixBAGtizChXZfzkP
	BrSoY7B5ZuFebXxXREi9pRkn+4kJQ3vJb+6xPI+wllYGe4qxR61belM13ldvhGxS1MhF0hRdhjE
	nVPvbXhx9nSK+7IOoL4u4hmUD3W+3aWohxV3EK/r68SESPiqBlsS8XXHFn372ka/fKInbQv5Yin
	2qkvqKYDKVS+z4U10VKEv9Pf2Tva9Y190CMJD1j0T2lWqoDz6XxHjPYIwE032fOQ6PNdxpcWcBW
	TT15ykzZEvDpRG0SQk4Qd5zrXWzBYdQX+8WbcOilZqJ9mvVa50zLfDKLAyj0F1vtYop2RcUzNJo
	27ghMyZIcWajl0V9fj+yjz32
X-Received: by 2002:adf:e014:0:10b0:490:9fe2:6a2d with SMTP id ffacd0b85a97d-49c73631487mr18978149f8f.26.1794864019114;
        Mon, 16 Nov 2026 13:20:19 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm27208354f8f.1.2026.11.16.13.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:20:17 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] ntfs3: fix negative timestamps corrupting stat output
Date: Mon, 16 Nov 2026 22:20:06 +0100
Message-ID: <20261116212006.837097-1-koray.fra@gmail.com>
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

When reading a timestamp before epoch with sub-second precision, ntfs3
converts it from on-disk NT format to Unix format without normalizing
it, leading to the nanoseconds field being used as a negative number.
This leads to a garbled stat command output and violates a struct
timespec64 invariant, as documented in the set_normalized_timespec64()
kernel-doc:
[...]
 * Note: The tv_nsec part is always in the range of 0 <= tv_nsec < NSEC_PER_SEC.
 * For negative values only the tv_sec field is negative !
 */

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "1969-07-20 20:17:40.123456789" /mnt/test.txt
  stat -c %y /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c %y /mnt/test.txt

which prints (stat output is garbled because of negative value):

  1969-07-20 20:17:40.123456700 +0000 (from cache)
  1969-07-20 20:17:41.()*+,--00 +0000 (from disk, after remount)

Fix this by using set_normalized_timespec64() in nt2kernel().

Fixes: 518013860432 ("fs/ntfs3: Support timestamps prior to epoch")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Small bug found by sashiko[1] while implementing ptime[2].

Thanks.

[1]: https://sashiko.dev/#/message/20261115180343.576773-4-koray.fra%40gmail.com
[2]: https://lore.kernel.org/all/20261115180343.576773-1-koray.fra@gmail.com/T/#u

 fs/ntfs3/ntfs_fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..1f3e5d201767 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1083,8 +1083,8 @@ static inline void nt2kernel(const __le64 tm, struct timespec64 *ts)
 	/* use signed 64 bit to support timestamps prior to epoch. xfstest 258. */
 	s64 t = le64_to_cpu(tm) - _100ns2seconds * SecondsToStartOf1970;
 
-	ts->tv_sec = div_s64_rem(t, _100ns2seconds, &t32);
-	ts->tv_nsec = t32 * 100;
+	set_normalized_timespec64(ts, div_s64_rem(t, _100ns2seconds, &t32),
+				  (s64)t32 * 100);
 }
 
 static inline struct ntfs_sb_info *ntfs_sb(struct super_block *sb)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.56.0

