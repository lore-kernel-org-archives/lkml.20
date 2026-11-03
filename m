Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718344;
	b=YVvC+bx5SOYlEZA+XsRm0ALvpUdyEwV/p0EUNbnoKiouMDi4g+/6e5rC5Xipjcgm2gm9
	 ngqqP8giTh0yw2oDDwtEF8AKUUjRkmIaTfegHz8OD+xt4GuvaZnXtMCzbyG/vzQ3aOfZX
	 FwY5w3avFCKcbjOTdADb2x8FCBDf7t943cH40ZaFXK2Nl5EptOUZQHBEhXbkouz6GekXW
	 b0FlhpDAY54crezyBrd3fVAFLzoR3ogaGh6RZPUyc1c8IT4JJKyEGUqbTdySQmehN+Vt1
	 FWmaNAp1Q1s86sFKKvTxeezb0DbPQ7D1x+X0ZvsTLaoGGMzczzPVdsyPBsxdDX20vPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=67TybRkP8njggFQDhor39f7CtHtsMroxxr3yAFAiuuM=;
	b=HNUfyOB4txudzQ1fRKQ0MIjfG0VQyNs4GxdfNKWbhuJXyTwr5TaivlVSBkd/wWkZ2YWD
	 OvnlyKJxGHbD5hAnrewRI695x5IeSCHbAwInGONG4pBQVvIhy3vRB6DDM4QRBR1TSZcKh
	 HIYjU5QsT0WdAbfa0ezLyZDeOITDmAlzl30c4eLvwsBaFd0xAXPZILErBDVWeAr7Fi7DI
	 uTfZheVRj6QVNSgcvE2eVhH/zv3btB9ogeWg6/2bqvDaj6JHg2lluu8Ubzcz4mCmuSoyN
	 ygZpo9AM6ei+lhF7HH5L/pEg6OeKN32XyIV5JOqkUCT7W04wqExZp8bGLP4SzFNQf/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=bMonX4KE;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D3606A78D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809D3606A78D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=bMonX4KE
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98c78660542so2174649241.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793718343; x=1794323143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67TybRkP8njggFQDhor39f7CtHtsMroxxr3yAFAiuuM=;
        b=bMonX4KEsTOZ4px5x4FS1daHqkRFFxhdMlwl1RsI1M6dJVaG0bGGg1Chz1BG7/AhcJ
         VxfKuWb6/OQQ9VhHPU4eqMyMBtEfakSZl24U1Sa9Zfm3tU0/1pYykvU7TxdFT9fgiQvG
         U+aEEtMxPEhcS0Uodxt1iYwFZOBfP3f+GBT9b5P8ghApqaie9bJHVnGCgoQzn4FSpI82
         X31IQ7cm3vdLOBXArvxnpGvHEApelwa2KRd2ku5AFdbb7k8Vfonr/Vd/kkVzJkzapCuy
         2GYQAPac6/pHaLVjVidNQRhFhCE5CuKlJiyUYWuyzuevCQMDzYkoO5+6MEymAGnpXnSU
         EGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718343; x=1794323143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67TybRkP8njggFQDhor39f7CtHtsMroxxr3yAFAiuuM=;
        b=AEwGgXig31bSfCe3hF07V3kdWC9ht0PKsDH2K+mgSLjeWyzJA4xDmmRMggywgNIZl/
         SJ+3yv32u+4w5UBiuFlV2A0Z5IEwqb8PTNoDI7N4YSXw+g37+sll2AMa4c1gFrq9wfFu
         psKYv7fp2w70mute3J4iTuxbgwFGVxjBA0DV4ey6szldxOyqEUc4yi9jmvJLk8hy6rIa
         K/BAwUiW5DBey57jJhHKOTMmHdnmnJMjx+gjthz8v4tvIREj41LzsnXLMNxFgijg3CQQ
         jlQyORYR1hWjSXgJQNOb1YBDD6yA0fpTLge8heCO9wHh5uKawJjYTAWj2KKG4PWV9Hhj
         gIBA==
X-Forwarded-Encrypted: i=1; AKwUvBwCS9f1TXnCm6OjVy0Yj/W5jHoObk9OtUghhS/AYyYT/uSIn1khVXKCXTORPPW4E8T57K+ITWwbh3E3YKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/JQp9fWdJ9axe3+D/Rn3IdvaAw/Sz4oJea4aHbrALVtbwbeOx
	YkRQ6Y/lJi3wTNO0aIHOKKFkbPz0aKPk7ZI0ajfMH9zbFcTbovQeZBrCuzrL+ANPbz5NW02CnJ0
	J8i5w/H4=
X-Gm-Gg: AYBFou1qgW79Je6b9Ac308g7mY+V80A+PoQ7htRwUpMCLp6GQXL//kFZNHTCxqkLCT0
	2rAYxH+Hf3YXt0VjW11vIRcOhR5XfVaO09orNDNLzn2rCv4+AKX/9YpPjAvBNIPZo0UBFTJnS/g
	RbNBP8rcAndGj3X09aK/hF1tW4zIcbmnhX9gGB4heaFAbBI1OU678DfI5Lzfg6E6XA9oDCniV6o
	30B/Utaa8M62XNtKh9fNnYTt86GhFgQFCQdSqhjoTbA/Xuw9CeVnsncSE+kMkOJDAnWf9zgK0L0
	iZX/9eosqUmNtFDg7y8N2mhIFdaPBWNpiUvu3rZO9nrvX8L4jD8ZyEBX1Vfn0zAZZqzmDacdy2+
	2XzWcFneHrrPXxO3rewJgPNNdx/4OUwrqw8vHcbq0TLgYZEsYSV6TTroU+8kUnkJUhCaXI+yHcv
	FexHkFawzemsdXWLTVyJj2yuD/ep8Ql6Hh1lbIflgBRWBBg46U8ER9EIXQJa1YMycLvbq6BvWYy
	up/pc9dhKOfMX8uixBgx5YqZbcgl9GkkuPyhJSnmR5bUtIv5id6w59jMEx6kVwSfNPI7/FfF31+
	90UmxkU7mRcpKtrnIZSzwDsN8f1Z924UptFpsx3rjqZx
X-Received: by 2002:a05:6122:420e:b0:5ea:c874:6c4 with SMTP id 71dfb90a1353d-5ec689a714dmr5635533e0c.16.1793718343201;
        Tue, 03 Nov 2026 07:05:43 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bbf5easm12733681e0c.3.2026.11.03.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:05:40 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 15:05:17 +0000
Subject: [PATCH v2 2/5] btrfs: clear dirty blocks after a delalloc failure
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-btrfs-data-integrity-v2-2-577dc2690061@toxicpanda.com>
References: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
In-Reply-To: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793718330; l=1851;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jNWS89+wbKg8G8W46m/SRpIJP0/cRE8yhKoG8CaTcKU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAA1w+5lm7c9UOO/a8yqwjLT/d0i6ZFcBjFmBUzjfBpenpmo+Wg+hATTZzY7y8DYkemX56lgUD1
 0fpwmDfJoBgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If writepage_delalloc() runs the first delalloc ranges of a folio and
then btrfs_run_delalloc_range() fails, the blocks that already got an
ordered extent are finished with an error through
btrfs_mark_ordered_io_finished(), but their dirty bits are left set. The
next writeback then submits blocks whose ordered extent is gone, or is
about to be completed a second time.

Fix by clearing the dirty bits and cycling the writeback state for those
blocks, as submit_write_sector() does for a block it fails to submit.

Fixes: 72dad8e377af ("btrfs: fix double accounting race when btrfs_run_delalloc_range() failed")
CC: stable@vger.kernel.org # 6.14+
Reviewed-by: Qu Wenruo <wqu@suse.com>
Reviewed-by: Filipe Manana <fdmanana@suse.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/extent_io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 5ff630630490..3283835ccb5e 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1746,6 +1746,16 @@ static noinline_for_stack int writepage_delalloc(struct btrfs_inode *inode,
 			u64 start = page_start + (start_bit << fs_info->sectorsize_bits);
 			u32 len = (end_bit - start_bit) << fs_info->sectorsize_bits;
 
+			/*
+			 * The blocks are not going to be submitted, so they
+			 * must not stay dirty. Otherwise they are written back
+			 * later without an ordered extent, or worse, with this
+			 * one if it is still around, and invalidating the folio
+			 * would account for them again.
+			 */
+			btrfs_folio_clear_dirty(fs_info, folio, start, len);
+			btrfs_folio_set_writeback(fs_info, folio, start, len);
+			btrfs_folio_clear_writeback(fs_info, folio, start, len);
 			btrfs_mark_ordered_io_finished(inode, start, len, false);
 		}
 		return ret;

-- 
2.55.0

