Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215732;
	b=E/WMTknVzkpVMnoRgFp9yzSV1RO8fBP6VkFT+5mPr03534ZJ6CU3pYIZKuTMqnnw2QD9
	 /UgDy0kjXa45iYqfob94dxuqzV47vn0uJCUGMO1e9lz542d90XvusQajEkLVnw11wynwL
	 KMbfSvUJtPZForZVfAOtEJDK6f8qORwiperOuh00Hm0MTfDDKdL0iYxAHASJgdMxIHKjR
	 xEtMCoIuzh4do2rsXYEphhipMTiuze646EigtulmNzS32LS4U436nDXqKQHMspId7HdVx
	 JwBY0z543sQrsekahya7t7DkXkBgy2uRGU1fMIf5YZG66CsZza/ZF3bC1P/XwXqbfgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
	b=iBzEOi1UPw5OlHz3DTR95anUae3++7hRqnzu3KpCvlMiyqQJruHo4YScNXxkyOk1NFof
	 BRILoJjzSCtnm7WepfA+ZwGlPPhRHX+23lLcuTUkMPxtYKUOLzPsj4djobmUn0yDLkPE7
	 S5QedlL4XqtMcWJVvdEmwTKTJjl+gtbbWYqhswesMyhpVkHqIirqXNAKnWHR7rK8HrOwT
	 2flZb4hY14Vk6NjaeFnWDtDGPWG/+bm+ZDtFgf+IWuPoHZofOrMocDETP6lQ8/neHpHRi
	 x6qyW2zdIMhce8uWgziKDYmP3Vsmy+FeQgfZnpRLinjJv+Af2kEfk7LJo4U1tNSuCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EumOcsGU;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC1606EEA9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAC1606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EumOcsGU
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so740806c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215731; x=1794820531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
        b=EumOcsGUVgvV6f4EIH+ss1Yo0OuOX2Lpnk3VvwxNMWYoLWsAbpCyFZAEUxaiJGfm+c
         34QwvxyCf+23hcUVfaIHJDmgVm0XoqZiNbgTZ5TUn/mLejXnDp1MO+SgBB66yCsEUVKu
         96+aPOeNGOaR0Nn/W7Xzr1BvqfFtScUfIhDfa0P673LMDBqZ84oLuk1jSwSeDSwPQ7D3
         NC/jq2knesGuifhSLeY7+1mEf335ndDq28JT8tcAcHVCjf7hXuBq/547XOl502ngw1Cs
         W/FXfsvSERSAIeHHrTGkDnsbbVywHUyVCTv+57PhzoRpgj4x6/vHXC7xMJFkK5ROj0HX
         xQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215731; x=1794820531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
        b=eKJFl1i7MVy/RwWoeTF7Bn7NkIaboePrrjE5DnVZFmLfqtVF89F3zZOo7/HzS8VK+R
         xapOI7k4k7842vM3iVge4ihvylPonLbahe6EWqJliN/jnZUsF+SGInq3oMY3TwFNWEq1
         /ZnT0vsUkKxxaDHABrgDecSQenLch0HtyXlQLmdRtSUeJ64sJ3yHNIBv7PyD13SrUs+p
         7W8AbCxjkhkCjYAOzrO6i/q7PsrMrlXoRezgw2yEQSGF6RO+oPw/HldI7Rv9RkQAQLbT
         eU6WoTJ5CsNqabT5LkjgoPGzL8ARDTAohlDh2zLxMyjbKq98oVGsV9KCr1v6rHefJ4xg
         u0Vg==
X-Forwarded-Encrypted: i=1; AL+hErHdRAQlSoKkdjtlEg9xaeh4OVwNL9LDfcVetm+p0+Mtt4etbtaGBE/6Jjt07rm6R2tqdF+4rrQl/whu3yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/zwEpsYA131diQRRNDaj/g8Dgi2Oi/a49H68dN2fm1Gp/Rid/
	YyouMpQoVK9172MRiVL9uE+QVWnxMly5o3lgy1Wayi4c8zcOvYRP4Iuu
X-Gm-Gg: AYBFou3xSatSHT0qpiEuCphWctP+ZUT2q03vd/s3ECS5VqUwl6REVZxs/fhnR6HPSiD
	qv6FOGXJITSyVQ8JK1VU5a2r9+FF6A+WsNyQg7/EWTac1vLNdIZic6Zz41vtloVA/jhAplpLHvJ
	8s+NT0ryBC58GyW6cFxsVAnW2Xiuu/3vYRF734InioeY6CuQrE8cT4lRwgnXCrUaMMaeoD7Q0vZ
	MwsX2eKNL1KY4u4EZCbt4ctVgcs0rFOxbFa7/bm14eyQe/VBv0ESGJprm0Bv5mNYs0pmVzNd/xQ
	iPul3yaSDCm3qkyzOSy3nfsATj4ouIp7oQoxRN8eQMu+asOX9A5sitZVZPtQNrdeTLfFNEREYWV
	wJeiM2rQETAR4JCldEtdtN5F33w3ZmMNJlFLpJqU+vs0xpFt4UkbFGQBDbTn6w7ludmaPzVFfyL
	pGW1N2l9B1Vgh5Bj9svGPyu+xg65ooJ3xr0yK7FVwEXv4X7Omeo5u8MgFx6JO870UKakhljlJbY
	53wZrX+8q439z7UiGgYOuZC6Ywnnk379ziX0cQBLPC321Xm3JfjBjlGYw/06C0cKXGa+WiulmkU
	vsORI3QDYHjwkuokLfHNLkB+kbuvwMbMYa8aYFl/CKwl+80Y0ewpX0ZXURsY//wWkA==
X-Received: by 2002:a05:7022:e803:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b39fefb9e8mr5783381c88.38.1794215730818;
        Mon, 09 Nov 2026 01:15:30 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.106.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm14379505c88.10.2026.11.09.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:15:30 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	jack@suse.cz
Cc: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	Trace <tracekotae@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Mon,  9 Nov 2026 09:14:44 +0000
Message-ID: <20261109091444.128521-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105192517.228523-1-tracekotae@gmail.com>
References: <20261105192517.228523-1-tracekotae@gmail.com>
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

Since commit 9b0fcac3cfe7 ("mm/filemap: do not count FAULT_FLAG_TRIED
retries as mmap hits"), about a hundred sparse mmap faults push
mmap_miss over MMAP_LOTSAMISS and turn off mmap read-around, as
intended. But mmap_miss only comes down on hits on pages that
read-around brought in, and with read-around off there are none. A file
that is then read sequentially gets a synchronous single-page read for
every page until it is opened again.

When a miss above the limit is on the page right after the previous
miss, start readahead the way a sequential read() miss does, with
page_cache_sync_ra(), and keep mmap_miss at its cap so that hits on
that small first window do not bring back full read-around for random
access.

Tested in a KVM guest (x86_64, 2 vCPUs, 3 GiB) with ext4 on virtio-blk.
"base" is mm-hotfixes-unstable. "95b8e" is commit 95b8e432265f ("mm: use
zone lock guard in __offline_isolated_pages()"), the last one before the
series of 9b0fcac3cfe7. Commit 0b9c0aeba938 ("mm/filemap: count only the
faulting address as a mmap hit"), the first of that series, gives the
same results as 95b8e for the reproducer.

Reproducer from the report, read_ahead_kb 128, major faults:

                                         95b8e    base  patched
  sequential only                            1       1        1
  sparse pass, then sequential               1   16384        2
  sparse, MADV_SEQUENTIAL, sequential      512     512      512
  sparse, close and reopen, sequential       1       1        1

Touching 1% of the pages of a cold 20 GiB file, larger than memory,
MiB read from disk:

                       read_ahead_kb 128        read_ahead_kb 8192
                      95b8e  base patched     95b8e   base patched
  random               5656   215     215    344731   1032    1032
  stride 2053 pages    6545   216     216    419003    992     992
  random 2-page runs   2992   215     528    173093   1099    2248
  random 4-page runs   1570   216     594     86797   1266    2301

After the sparse pass, reading 32 regions of 2 MiB in turn takes 512
major faults per region on base and 2 with this patch.

Not tested: NFS, the GPU workload from the report, and other
architectures and page sizes.

An AI assistant (Claude) helped with the analysis and the approach, and
wrote the test programs and drafts of the comment and this changelog.
I reviewed, implemented, built and tested the change.

Fixes: 9b0fcac3cfe7 ("mm/filemap: do not count FAULT_FLAG_TRIED retries as mmap hits")
Reported-by: Trace <tracekotae@gmail.com>
Closes: https://lore.kernel.org/all/20261105192517.228523-1-tracekotae@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Gopal Malaviya <gopalmalaviya53@gmail.com>
---
Notes, not for the changelog:

- Keeping mmap_miss at its cap is the least obvious part. Without it,
  hits on each small window keep mmap_miss near the limit: random 4-page
  runs at read_ahead_kb 8192 read 25896 MiB instead of 2301. A cap of
  MMAP_LOTSAMISS * 2 gave the same results as the full cap in all tests,
  since each new run sets it again. The cost: a reader that jumps
  between sequential runs stays at 2 faults per region, where without
  the cap it is back to 1 after 16 regions.
- A full read-around on the adjacent miss instead of page_cache_sync_ra()
  also fixes the report, but random 2-page runs on a 2600 MiB file at
  read_ahead_kb 128 read 379 MiB instead of 76 (38 on base).
- At read_ahead_kb 8192, this guest's default, the reproducer shows 1
  fault for "sparse pass, then sequential" even on base: the 8 MiB
  windows reach the next sparse pages.
- Patched results matched within 1% over two runs (the 32-region test
  ran once). checkpatch is clean; mm/filemap.o builds without warnings
  with W=1 for x86_64 and i386.
- I can send the test programs if useful.

 mm/filemap.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 371a4bbd06..1548021472 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3398,9 +3398,27 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 		/*
 		 * Do we miss much more than hit in this file? If so,
 		 * stop bothering with read-ahead. It will only hurt.
+		 *
+		 * But without read-around no hits are left to bring
+		 * mmap_miss down again, so a file that turns sequential
+		 * would stay without read-ahead. Remember where we missed,
+		 * and treat a miss on the next page like a sequential
+		 * read() miss: page_cache_sync_ra() starts with a small
+		 * window and only grows it while access stays sequential.
+		 * Keep mmap_miss at its limit, so that hits on that window
+		 * do not bring back full read-around for random access.
 		 */
-		if (mmap_miss > MMAP_LOTSAMISS)
+		if (mmap_miss > MMAP_LOTSAMISS) {
+			pgoff_t prev_index = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
+
+			ra->prev_pos = (loff_t)vmf->pgoff << PAGE_SHIFT;
+			if (vmf->pgoff - prev_index != 1)
+				return fpin;
+			WRITE_ONCE(ra->mmap_miss, MMAP_LOTSAMISS * 10);
+			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
+			page_cache_sync_ra(&ractl, 1);
 			return fpin;
+		}
 	}
 
 	if (force_thp_readahead) {

base-commit: 09f140d2cb078edfcd08a40a23ead0bdceea30a4
-- 
2.43.0

