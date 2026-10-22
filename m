Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693162;
	b=cKwo+kJG0tm5eGxZ+FalJO7W3uJTaR4yacW8oBf25xVLgzZv0bghOrKJ34HmsJQgcWNq
	 ILTrU2UJvA50j4k3zzd5f0p1oQ18A6GTKRIz8FI9/W44S5oaBAp2EFPFeSupE5704tlHB
	 2HTzb9S/FAO9GbE+iVgMGwoEAZ3HqoVCBKpuOanqCiEA3C0/K91j+vrsBrBM1zY8aAwnd
	 1yi8opLlV4fvBy5uI5KShg7CSW3oDG3QgMxLc99hfZ3MYhdN6sEw3RDi1kSMpqIeb6ooi
	 g4zrw4DClo6dOEBzYfdMTo5K19Cv3JIxUzDxXKNIzRX3FOMQTumEPFxwIF1IWuNk16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zgrpe7JsmaN5TXdCk9XO8/nBWq60c5XZRX2ESQ08pm0=;
	b=ibJPdnFip/zcGWbmyRDMwpCsQxptXnaNt3kMxWCD+Iq7OFsfNS2YhwlRqJqBWoYvisDf
	 Y+UiPyxw0ffZEEkjrWT+N4NdAqpZLWvSsiAiFpTdbmsMnNzXubStTKSMhY9mmPRGq7nHH
	 aNeDHG267s3DdXEvmX76KyBh5ab+ck5hio15hkMMUrJVlZGizBxm0bxsuBNdUVRM4EH+N
	 2yZfgQTV4hKIX0fI/HWLiD6BGYvXQl3hmWPDfS3tRKeBaWNJCqTG0JyObzIgZ11Pa6+Vg
	 cojsreOzJeSUr/T/3SwNZ6gKnnxU1IQ6p2CI/B+2p37OhVyBZj1asBZjmLW7bY7J0tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=ci4D7kwB;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D26606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=ci4D7kwB
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70b875f6f13so75045eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1792693161; x=1793297961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgrpe7JsmaN5TXdCk9XO8/nBWq60c5XZRX2ESQ08pm0=;
        b=ci4D7kwBiQ9Q5ZkR2aldKTJv5npfkPeQUpa/Nl5OzVrSohn7BLHwjFDKsP/+8igYp7
         gdBZhAAuh4QeaiXfOKWanXlxEVDVn1QFmRefxntcVzAG3xwz7BWUylpMgQmoiFTcwrt3
         myRakwBdaCDGp05HMmcURUof+GL4/xLkd4HmawauuvOZKvickRxgjVQwJrQl4S4L9ocI
         1WHLfTQ3u/GbjM6w7bVfxbZMEa1WkQK9uH5kqdPpYSMcco/+KdSdmPp6aBJK+yxtUFZp
         wigdT6nTBBXIRr35GuHVnPROuw75jimi6XjyUUjMiJ4/Tb1aHARqkZqXWxPdbGJyxc61
         1AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693161; x=1793297961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgrpe7JsmaN5TXdCk9XO8/nBWq60c5XZRX2ESQ08pm0=;
        b=cN/LHT4Ut9uJ8QaWPm0X5xHEFoq5gxCzbeaWUIc2HCZzWjIurO69mTOPI7iOBWEsCZ
         av1EU5drARyRta2uXA2Qr1GLElszJ3dxjv1kSKx7EDece8HyH1kGnV6ksOSudRifUrfr
         AgfV1z+Mx5nzV5xN+N05TnWyySwn9KVephaqpGbsVF/Qg2fjNoAdWdi74wl2CfSEzpTf
         wQngny2z5MGnKeKCWxPA2wDW16uVSMxPy8uIcUwHbKK+GKHadV36ei29/wALI9UJjyqn
         4cuk2Ex6d1fuvdAdB4mBNBIKV8yBZjFglsGQOl8ewPXQQKT/RMS60LU8g6NUSDQmqscf
         x2zQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+y3dRFBIenPuzdkirkT8gVwY9rusYCOG/evtuYOHMggPzKUDZV5Lnt20HAyCF7tUzNb3T5+Lgubx/2wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJWPvFj4wLOQfP3B8Krd9lXx3DuoGx8E3PxgnkyER6yK3+wFwT
	GmbFPcAwz91Vx27js8QB38gUCDua7wD3Ara2Fh+gR68sRWL1kCvBE0DPkuP6oxEi4R63
X-Gm-Gg: AYBFou0rCx7BU0hG8/D3mRdTUQjK4jF29FPusn0flVo2Y3rlXYtzko2YBP9gQjWufy5
	CYnFh1gkVY5qrrD7I5BT3Vha+sRWsCjLUk0aDKYmws25QxnYquh5RKv8g89VLuTN6y1D2xALDLd
	498CI4MzoP4VhYvnLOo9S7TAI7z0Dkr1ZmWzMMlskpxdr2yhg4My3UvG3R7zQvYumUZDY9GoeHl
	devdNPndjPem3Copd1rwEngholRPhBS3laBo/8jnboWheDGXJHk9o9wNFBZqmNJxA7nXVfvRUkN
	GsmXS0fUVVdyEPNyPGTk5m10oOMjrkxmZqm3SHH3vCvoVrfFo1ePbiJVLo9zKtoZlNmxrcpmrYI
	4bMjc0OUjzd16+j+LcgW8IMnlq87lAWKrHHUf6wjardRLv3iDwGmgP8+pv0nHpqQ45bn0LStnLH
	7I863mCy8hkmGyCZ+iQpdy13EBd3t7pTGJdisqgFAP/Nuh1cCicHzomceiLANTTvEIY71GnIMVK
	SFzqFMjcf0UVFcEkfFHxLsbxrPGwpDY9GTaPNK6lKaggB3O5d0/NSmdC8nerCTMWjrhbUiQ
X-Received: by 2002:a05:6820:704f:b0:6cd:3fdb:fa6f with SMTP id 006d021491bc7-70b88bab6e4mr113554eaf.90.1792693160492;
        Thu, 22 Oct 2026 11:19:20 -0700 (PDT)
Received: from nixos ([2601:280:4a87:2c8d:3b7b:2fa6:c84c:64a7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f786ef383sm409818a34.23.2026.10.22.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:19:18 -0700 (PDT)
From: Jay Vadayath <jay@artiphishell.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH] jffs2: reject undersized input in jffs2_dynrubin_decompress
Date: Thu, 22 Oct 2026 11:19:05 -0700
Message-ID: <20261022181905.35588-1-jay@artiphishell.com>
X-Mailer: git-send-email 2.51.2
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

jffs2_dynrubin_decompress() reads an 8-byte probability prefix
(data_in[0..7]) out of a compressed data node and then passes
sourcelen - 8 (csize - 8) as the input length to rubin_do_decompress().
The compressed buffer is a kmalloc(csize) slab filled from the on-disk
node, but nothing checks that csize is at least 8 before the prefix is
read or before the subtraction. When a node declares csize < 8 the read
of data_in[0..7] already runs past the end of the slab, and sourcelen - 8
underflows to roughly 4 GiB, which defeats the pullbit() bound and lets
rubin_do_decompress() keep reading unbounded.

A hostile jffs2 image that carries a data node with
compr == JFFS2_COMPR_DYNRUBIN (on-disk id 0x03 routes to this
decompressor) and a tiny csize therefore causes an out-of-bounds read of
the compressed-input slab. Reachable from any user who can cause the file
to be read on a mounted attacker-supplied jffs2 image (e.g. cat on the
file; the image dd'd to /dev/mtdblock0 via CONFIG_MTD_MTDRAM). The
decompressor stays registered even when compression is disabled, so the
code path is always live.

  BUG: KASAN: slab-out-of-bounds in jffs2_dynrubin_decompress+0x170/0x1c0
  Read of size 1 at addr ffff888006b45a64 by task poc/125
  Call Trace:
   dump_stack_lvl+0x64/0x80
   print_report+0xd0/0x630
   kasan_report+0xe5/0x120
   jffs2_dynrubin_decompress+0x170/0x1c0
   jffs2_decompress
   jffs2_read_dnode
   ...

Reject any node whose compressed size is smaller than the 8-byte prefix
(if (sourcelen < 8) return -1;), and additionally bound pullbit() so that
a stream claiming more output than the input provides is treated as a run
of zero bits instead of walking off the kmalloc(csize) buffer.

This bug was discovered by Artiphishell, which
generated a from-scratch jffs2 image (cleanmarker + dirent + inode node
with CRCs computed via crc32_le) and a mount+cat reproducer that reliably
triggers the KASAN report on an unpatched kernel (csize=4 -> kmalloc(4)
-> reads data_in[0..7]). The fix below was drafted with the Claude coding
assistant; a userspace reproducer is available on request.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Jay Vadayath <jay@artiphishell.com>
---
 fs/jffs2/compr_rubin.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index 9854253d0108..98bbab157c62 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -78,6 +78,12 @@ static inline int pullbit(struct pushpull *pp)
 {
 	int bit;
 
+	/* On decompress buflen bounds the input; treat an overrun as zero bits. */
+	if ((pp->ofs >> 3) >= pp->buflen) {
+		pp->ofs++;
+		return 0;
+	}
+
 	bit = (pp->buf[pp->ofs >> 3] >> (7-(pp->ofs & 7))) & 1;
 
 	pp->ofs++;
@@ -392,6 +398,10 @@ static int jffs2_dynrubin_decompress(unsigned char *data_in,
 	int bits[8];
 	int c;
 
+	/* Need the 8-byte prefix; also avoids the sourcelen-8 underflow. */
+	if (sourcelen < 8)
+		return -1;
+
 	for (c=0; c<8; c++)
 		bits[c] = data_in[c];
 
-- 
2.51.2

