Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667749;
	b=ZOkK1NzpKMTiwvna2Yccz4DvqL0jN+Fs+tUoLDofw5q/UmAW3MGvtIfl98crdLDrtOPe
	 aKpzJ+GanCLMSw9LRCxJg2ync+HP5YHELfEIzB1oGx2mn5ImWjs2hXnGvH6oCuePTFDcX
	 q6mHO8ptbyP2zB+GLJtaULjZRXZwfHzsRd7ktGkQTjn64tOGFfdLA2Gk4LxJyipIcdAYK
	 t73Mlr4FVgxvjezb6nbUBy2YiAhxoP9kdmW4THn5DIyQG8PVF7WKx6aqJjl5fBtg0cCtT
	 Gg8nIH8NVEQknN6CZc3u//egg35Li//HhV9V/DzgApNo/NlShNDvRsahRVySyrB2MuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kzMIfhwwfaK5hfbFxkKSCWJeCOa/IqQHzX7VS+tqj98=;
	b=3EU/M0hOlQZwjxsQ8eqzQF/p9/m2PxC98hjzJ1Z+6/8dICAxIpTkZuY3KLM47mxPqRa/
	 3F+4nWC+wYY1wo625HaClLAPzp0Ku9wkUiU8a8GLTWLq2NnB/mYzjXA3AaMEyajNkBA1T
	 JAWD2a9U3kDGP8xQ3hPr/PGDmuqBtHoIOORdHK7ArrenIo+N3RlA4IneeLuNZ+goGNxQl
	 BL/z4TRS1uvTbjUSQoBEUjisoA9R4wJHiJT7YLjILgMR1B8ypxaGX8tCWIxvgbPUiSAsg
	 +jE6GMVCKV2jUvkfm7mck+PAtT8HUXcH5vEOdnGxAaWE3w7grtnpPKrWWuLnrHmDlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifOh9Avd;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198C606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9198C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifOh9Avd
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1056415a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667749; x=1795272549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzMIfhwwfaK5hfbFxkKSCWJeCOa/IqQHzX7VS+tqj98=;
        b=ifOh9AvdysI02x/7wGxbOweJHB+EFGMiTV/MiQFc7hkc53L1etsQEN8zVhUu/vqFhJ
         jdx9MAJ6D7/6TcHDR6GiUrRmzL481bWSZUXGCs2+D2DmxeTSJ97xlQBG9Yt7NXNEBBYC
         MDXidsA3Nuhd9kXe6Lq8A5MKIbTnLoVr3PQbYLCu87d7Rx5tzs4iI8rcDtV6dVb6TQ/2
         osFZ9QcEKYDcN3wYqVVuzZnsBnNItHtYnd4hZMW58SGxfNeWaCENAb9CoM4yGilW/E+8
         f0vusuxOaubHtDt20WJ8V6paIme9qf/sbFHWrjSYdTwAKUPdCXrHPcxpnxmZQRqpfCBd
         dpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667749; x=1795272549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzMIfhwwfaK5hfbFxkKSCWJeCOa/IqQHzX7VS+tqj98=;
        b=t5kFxHnIuJ0d0WcaHFdAzj7dG7rl4Jpw+bUP5YXapUsDt0HGxBoCKlq9qDfxFOodOf
         QThLqD/o3/Pzxwry4RMDhoRcKjAq5UHhvCczzA5Tlxt1JO2tDOyWiU39a1Ndj7yRyByv
         /ms4KRcAOCiQzjFBavp83434pfb92PpGDGQu3smTOXIT6zymJMOGjkCbSWNlqIcFOa+5
         4Gyiqiz2ZSVN8ar6l0l2ozkNVkj1L4xtyUTFUgLrYzV38RDFNdj442SF9CKucI8FCT5P
         CE7ImepVaN+jzynf5IpO4jl8Ro+Y8Dl85kxxosup4crc8Vrl5+pe2RQkNx4t0iwWVKuv
         aHlw==
X-Gm-Message-State: APuU4Z8OQuUg53LcgaATNPS21bwSdYbga8Wvg6G0Q1nNAqKAMM1MeBLx
	0wEEWrZMzd4zatfrQM9YdIcGr0iC0/cWkNbUb+KH9Pplwexd92ChHJ/i
X-Gm-Gg: AYBFou2K7wvwvCPtCiBMeowlkvc1sFnFlKPaypiAlEHpFpvKMhIfasmYRQbXeo6DF+r
	3MsVOHdmVFSww4/i00sKBMDQGjRspKfj7jETTarWFS4Ghx6rw5C7HJtx3Dhq2FDr4SA6M+HSH4l
	ENdt16YZd6h6hug00fLPQlmQn2Sj0bmdEL+bDveAqbMxfxasRLpwaJXawMSrKxtELDwsiT0ke+e
	s6VFlXHnerIVmOlJ45ce/4is0FkMeZPE0D+2/0vIgC04ZppVjNN32BJmUpZQQXS5LxfCSxH+LH/
	owcKZu9h9SuCQjzsyelskiYoGcZdChZW++lqlHY6+fAD5+NR0EnnidBiDNkiRZv83RjDUBwgwDp
	AG38vA2F3deNGpeXg1RgxXqxO9WYwEWSQgJEy4S3SHLWdC3Q1t4cSHBrPqc20p2qySqZWQsb3Oh
	AluyBoyEACfOP/KCh45BMI6AVeo+SA/8iSR/ReOzRK4W846N56QHXYKwpbVkPyaAnVZb+ANTIsp
	tPN9iVuyJfzVA4q6bcup2Cp/Javwivuwsm/ZM0gMj5N4jBkfVALazlqRarwZd2wJg91v/CPmpD+
	YTKzR9QhY5qSEODiaMwqWdpsbQfolPSbfa59tCDJOi9k+Ge5a3yNKfknw/c0yRLmMlUI
X-Received: by 2002:a17:90b:39ab:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3b1b0a0e87cmr5694907a91.19.1794667748842;
        Sat, 14 Nov 2026 06:49:08 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc72sm2599953a12.5.2026.11.14.06.49.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:49:08 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 01/18] mm/swap: remove unused parameter for reading swap header
Date: Sat, 14 Nov 2026 22:48:58 +0800
Message-ID: <f42af36d7ec66fb36fb7024966f4a7114f338a77.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

The swap_info_struct argument to read_swap_header() is unused. Remove it
and update the swapon() call site.

No functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index fcda5eba1714..c41c4d26a7e6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3630,9 +3630,8 @@ __weak unsigned long arch_max_swapfile_size(void)
 	return generic_max_swapfile_size();
 }
 
-static unsigned long read_swap_header(struct swap_info_struct *si,
-					union swap_header *swap_header,
-					struct inode *inode)
+static unsigned long read_swap_header(union swap_header *swap_header,
+				      struct inode *inode)
 {
 	int i;
 	unsigned long maxpages;
@@ -3863,7 +3862,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	}
 	swap_header = kmap_local_folio(folio, 0);
 
-	maxpages = read_swap_header(si, swap_header, inode);
+	maxpages = read_swap_header(swap_header, inode);
 	if (unlikely(!maxpages)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
