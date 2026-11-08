Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177361;
	b=Ik+GXpHYqaUa9I5I3oluROa4U0Q8JkzO9HuiuB6VDYE6T+1dB+/KtL9S4kKxGHBiRNUy
	 tVezdrRVJa9dLemYohvQn0zP0HfZsTA5JZ0ZzHnKs9xsAw64ZFqHoidsNpZcOrWT1jk8n
	 AxogceqREcuVF/LC84KqmjnP6pm+WitcRCXAZYU18ViO6sJTwBO4Q2BfQnnWHzpnAKOB3
	 kRMvJQ3wsBjDEZ+5FvXUVmvCZP0TdXu6w2S50vMrkf6kMNi3tYUuTGczDP9i0BW2Okm+7
	 8UYNQG+jfEHhvhzYL9S463OrvzGj3e77RUs/jmFPWCB/oqkhvEurM5MQRXoelKrrneA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YTPXp+rfthb63UDmqgrgjjBHFcdZbohfcfTgb+voGVw=;
	b=z+h2V69wTf/BxcjnIuC3XscE01EIniOKELkTy4sDhrG3fbeA/ydY+IRc+BVTTqOpM5IY
	 MzdBB8AEc/tx4VBkrqKzlIC/FJt2XwThAy7teC0T78qf4x8fMc0uAXfyc5PjNB23XBs/E
	 b9+1do+7tWuWM29rVQv1HWCZhRGhhqIDMCHN//5qfaPoxja1cX7d/Vi9MnHewPu3ZG2NM
	 2pFReLRIHPDsh4ljbDwmD6DlqH98hlBJ4fOhhjQVt4Dj3G4AXl7xkQQkRF5ZChlGTwn5p
	 yDk/xBhXL0i/Ql28JE/S2bXGM2KTB52ncNRyAycURKAW9tpSBglScWXrg2V6etKGxIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KmTq/tU2";
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4ED606D809
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4ED606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmTq/tU2
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so496880a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177360; x=1794782160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTPXp+rfthb63UDmqgrgjjBHFcdZbohfcfTgb+voGVw=;
        b=KmTq/tU2byKqoGfA5Mu/teizX7wmKZmVmG0zXIJqaYIv82+6WSfzgcitUPk0ZP+fWl
         xaoMbh9h6RsO+eSsDtYNpE4O8jdqj+17O9UUVHgbqgnI19unpCIdXZXg/o8R/Wiy//dH
         c2nFnH9WX4o3urVTviABdOPGBLjGbpvoG+9tjlAcEl++Ozzsi7XBbp5rum2kj/XoDI7c
         PrnB6omsKvdr8kE3UOmemwFYzluI/NKCr7RtrVFNQfFqwt7sIxNUAWL/DiBB82mXBdCs
         TUyy/lLv9HSj7hm/teFcqEIY2T7Eb6N3M9PixI5kJrJQWU1pbN/YZ3N70NUn12MGp7eu
         kc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177360; x=1794782160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTPXp+rfthb63UDmqgrgjjBHFcdZbohfcfTgb+voGVw=;
        b=NORz0G1JzRqg3TNzzhRLGrc9YuzS7RFypvVr1dEX6HnD1nhvqkQFuQrYLU367RM70z
         9tLNsPLAEtRMc2pZ7WecI7t4AMOZPxw6YbCs4Nx/XhnHe+TsaVkoRqovGr/ONGg418nV
         4PpHB+v8ucvdrfNLrR25RMgR8W6p/TgnwOBc7660YUB8QHod7biV6mZTk9Nm964h+ycV
         kUMIgPyPUCcCS0mV8cDLvR4a1ktCmmOzWUO3YeDrIy3P4EHPkG2vqE+99zI0IOG0IboO
         YY+4kO42vQHvB8ZkdCY2ZGYbZBGTOYsGPqQ8Mt45pGDopi7EASpHzQXwwa9j5apVTupN
         BFlA==
X-Forwarded-Encrypted: i=1; AL+hErG9JOmCvu+euCkB5x2lxJRz9q9/8B5zBbfGz9a4dFcfBs3uVY8fbYGaEbuGmD8i7ZtizZfnRAjhjut4V30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CzdvWOGzdXz85ZfE1oCYG+lKfq1S3mSczilUo5Z+gy8g9iPpz
	xn0HGSJinFQGQuDgrDZU/aPKLyD8799gCBZzwTEsIs8QvQbf7JWCLuQUVmMUyayy
X-Gm-Gg: AYBFou1+QKcDBmTcwqy+2C0XTjUrFs8TgqlHk4ccni90mRNWJbgniiQmYGbuUtVtK7y
	piMWXdcjJfo1H5DIAbH5P5ZRMSZPUj6BU6uqdARC2AxHRKn5xJNqn5sEwES2nu2/K3cX8rWvPTM
	s2KYlDYPRDsVXoaERa+8Kg0gNBTenSxp8rsQ0Fdt7iYxVS86j8zM17CUPfQ6WHJW4eWhOfzmKaz
	nXXkXswibQtvkdjqWp8eLBzG//wACI5Y1uJ1HVFeGfazVntMhbdeGQBFZVla5EHgiedWKSY/nM3
	yX5KFnRnbdjMK3Vl+RZ+soyAieE9QixNy+dVaGbhXfE6utnYIJ5ofc5QAg/1Plm7TzfMlEWNiSz
	n8pI3aUwsbVY54A2+1x4qeBuoDVm13r76QKIJ3PPE13DSL7ZOzFtrI39JzQSQzv/yQdNzPcaYYw
	Y3zXzpiSbEKO6eIdYjM7nvgWpuLmVBAm09RroBSfOuofLlcKbb5Par02fufquHikzv3tuZ0n6wW
	lhDdYlM1Vgh19EIEUoDhHXvnfgjr2fTmmc6CquEcWqbFF3uIEdobspHNkRFRn0gmeEm5rBdhBnb
	JjaiS5FBVPaMaqkseRrAk3WFLFXcmCd1acAQRDeROpE8Gssez6FgTj0RkYtJmQ4MY1ipGho=
X-Received: by 2002:a05:6402:4504:b0:6b5:4baf:ad96 with SMTP id 4fb4d7f45d1cf-6b7224194a7mr1543782a12.17.1794177359944;
        Sun, 08 Nov 2026 14:35:59 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:35:59 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 3/9] sparc32: do not flush a NULL address in flush_dcache_folio
Date: Sun,  8 Nov 2026 23:34:13 +0100
Message-ID: <20261108223516.1125534-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
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

sparc_flush_folio_to_ram() is sparc32's flush_dcache_folio() and takes the
address to flush from folio_address(). For a highmem folio that is NULL,
so it flushes virtual address 0, and 0 + PAGE_SIZE and so on for a multi-
page folio.

On HyperSPARC, hypersparc_flush_page_to_ram() probes with
ASI_M_FLUSH_PROBE, finds nothing mapped at 0 and returns, so nothing is
flushed at all.

Returning early would be wrong: flush_dcache_folio() is also the barrier
taken before reading a folio userspace may have dirtied, as in
filemap_read() when the folio is writably mapped. Fall back to the whole-
cache operation, which reaches user aliases at any colour and on SMP is
cross-called to every cpu.

Do that only when the folio is mapped by userspace; otherwise the only
other mapping is the kmap_local slot, which arch_kmap_local_pre_unmap()
writes back on teardown. Without that test block_write_end() makes every
buffered write discard 512 KB of VAC, which cost 106 s against 56 s on a
64 MB dd.

With the mapping live and a reader on another cpu, 150 of 150 reads
returned stale data before and 0 of 150 after, every first mismatch on a
32-byte boundary, the VAC line size.

The separate HyperSPARC mapped-folio fix completes the lowmem and PKMAP
colour handling. The highmem fallback can be expensive for GUP: each
mapped folio may require whole-cache maintenance on all CPUs.

Fixes: 665f64029454 ("sparc32: implement the new page table range API")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/init_32.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 7b53ee9f061f..9cf0065fc2d4 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -131,6 +131,16 @@ void sparc_flush_folio_to_ram(struct folio *folio)
 	unsigned long vaddr = (unsigned long)folio_address(folio);
 	unsigned int i, nr = folio_nr_pages(folio);
 
+	/*
+	 * No kernel address to aim at. Only a user alias can be incoherent
+	 * here; the kmap the kernel used is flushed when it is unmapped.
+	 */
+	if (!vaddr) {
+		if (folio_mapped(folio))
+			flush_cache_all();
+		return;
+	}
+
 	for (i = 0; i < nr; i++)
 		__flush_page_to_ram(vaddr + i * PAGE_SIZE);
 }
-- 
2.43.0

