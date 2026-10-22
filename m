Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677654;
	b=C6l7DfV1zyclm/9lbQxcVFCQ/Y1TiPjmjL6lr0jXQA0UFak2E5J76HZnZZze4uSUA7Kk
	 Vy05Errgjg9Wvnai+B6xEM1ooDqox3r60TCI9sxiPJzP/pNWDgD8HN/r6X/yt917//R3y
	 8b8fMnJZ7MHV0o4A9va/nu8Aqv4TXH5f/YQ9q8h1dk6jWAZhahUMKaCxyGfhKnHwquu+c
	 QRIPPlPerZLMrvIAzoBMVJaPtS7M5hcdu13zmvb+cLQpUnS6sLUB8RxkOXpH0bR5sYG6m
	 yfjO/WqAIdFJ+0GopEU5oiWbqqif1R6A+AtdII0A6sP/c0qpNiiCI0jAvOqY31ZT1Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5nTTF7dA0IAOUfaSQMNPTIUPCOpXWwbqh0S96Be5ADE=;
	b=38VwBihIPZUoYHMNRvrejekI3XmsIDCginuyy0L5PkspeKNo/072P/LYbK8qgG+USQHx
	 fZ6MpzhQhInd6t/O9ipDTayDmPYD3WMRiLQAbccuqisiv2EQ7mqrdbdvuwvYa29k+zQwV
	 qs7+OpPciZwgdAuKcgujc46CG3zq1rjQg1OyZ0blgGTEDEkFOem5DT57BPE+2INWud2cY
	 gkqefWIa3eu9+11cQnUNbKdRVsJ5eQAGzPbQeuRakfthz84M6a/psSbbwOmMjim+asGUn
	 1Wic9Fpngy3wOdfSilqIse5AS7gxLm9qQPP6MaSOReHya2zlSLuER1EBdvK7baoKRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5r4vf3B;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0864D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5r4vf3B
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36661f953e4so3353667eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677653; x=1793282453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nTTF7dA0IAOUfaSQMNPTIUPCOpXWwbqh0S96Be5ADE=;
        b=n5r4vf3Br2FEj4nvbE04yCzR6V1e1+bf9RvbCud/o0q1uAHYLQ5vEAyEcJCtj2RUBr
         +kAulUTU7H5ccJmRvmN67OMintaANL9jFFXlHuCeqm0d1+7br+kOi9lATIIbtb+W66oA
         NPDjYJh3aeeaGzSwLUYot9e/YFgY1XoyAK+V/zK4GqvVWjAEFWW0Uy4Fr3wuNaC1HCbz
         ltAFgW/IzHhzDXXLUCKT1WqVyXMV24hyyGBq3oY3EdcY/nD1PcsOiv3LMrRmA+3xPgT8
         8l7TAmccowAAT2YJjw5AImxSbtTzTN8nXFYQu0l2tGZkPLdPEQNxHoK95Q3yzQQhAmyY
         yRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677653; x=1793282453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nTTF7dA0IAOUfaSQMNPTIUPCOpXWwbqh0S96Be5ADE=;
        b=QqABotJtvlSJ/+2xGO3s5hhI2WEVcAhL+eIfpe1iMeN/Kxi9dZS/Tom4N8/zY5Ms7Z
         nJEbWNEe8XkfUHcS5wwH6hFQwSwdOoylESXVUMtB+Z2B5Po42suzLSFjQkMDWt0RzRBe
         ZcRhX+uvYY8X+dMYFCktQ5Lex5o1mLpILfh5/Y2QJhQ4fyzznWKP71OO2hW9ZmYaBxf6
         rFeuLrkiQLXq6NqFVxvpfjmoNzhjZGLu0Dk8fk9UQ0FB7W8S2DNEifyG+ZfrTce4Wlf1
         OKUMxInuMgG2bablagV1u7eaZn6IoFsbXbpJ/gBvif6Ude4FJuE5/JNFyfMJNysNo4s4
         LXqA==
X-Forwarded-Encrypted: i=1; AKwUvBzWhWamrFHs7o8MixEZVgQrk1E7XBn6aQWk2dqkYr9hVs/4lmWKEeUbn5tbBkZclNf6qe7ao9ckQy+I2hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkknwX0rxXVjSWwP2EP1EdHu5w4cpW2jiwXS4ntYYXOupKgjmw
	dBZzBRHS2STIx1Zm/gnSVlL66Xtf/zGhYcwDQKjqmSB+A2j7j3JAnM0Y
X-Gm-Gg: AYBFou3K9EVfOql9ie3oZbRnw/VEzADPo9PmwmpZ+v9m1eMG3EdIfuGhIDx+8yWJnhV
	fiJY4ofrjDoowOOpLwDIGbyb9DqgqAQYB6Cg2LfQxnc7PQGjRAb2gHdAeWwPNs28IzB87Bu1hUb
	E210OnoaxEaxqucn97hy9yP5UHv5aGAEv8Io2AdZF6D79IvzyezXEFEMRbOYdSof+LQ896SeDcv
	KOM4fFYaLZs7URnwyxsxUkatODz4kDib3cV0RrunTl9a1vU70pe/cMh+hUQ/8PVxmBdrMA/nPhP
	7Sknm+wLDPhBRCcZHn0DBH2FVZR6ABUgA5FNY4UvpbZN0GIx37TqXSqXN+SqHEwiMji8grNcNQL
	6V/2DNDT3rW5TzW8JUg1E3rmsS+DSh3hFq4JlbU0W5l5jlJTEJe3IKmYkp8EHCBUoZRPM9E4XYd
	gllsT3LXE/WqoVVZr8w+QEPHNG8gRokcCz76raYrw4DDDXqX57XPf6imWEri4WTKpI7Znspd7yN
	Zdupcffn00RGwcNOR1xY9JDjerOcETI3KvJ+QXRBPlYymSrO+MfLRpJRMGFxN8PM/6gz2jV
X-Received: by 2002:a05:693c:41c9:10b0:35f:ef9e:f846 with SMTP id 5a478bee46e88-3674b531987mr7142175eec.3.1792677652558;
        Thu, 22 Oct 2026 07:00:52 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm29420342eec.2.2026.10.22.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:00:52 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 22:00:37 +0800
Subject: [PATCH 2/2] mm/filemap: extend VM_SEQ_READ readahead below
 descending faults
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
Message-Id: <20261022-bug-mm-mmap-readahead-descending-v1-2-6d08b34862f2@gmail.com>
References: <20261022-bug-mm-mmap-readahead-descending-v1-0-6d08b34862f2@gmail.com>
In-Reply-To: <20261022-bug-mm-mmap-readahead-descending-v1-0-6d08b34862f2@gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Vishal Moola <vishal.moola@gmail.com>, fujunjie <fujunjie1@qq.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

On a VM_SEQ_READ mapping, a synchronous fault reads ahead from the
faulting page towards higher offsets through page_cache_sync_ra().

A reader that moves towards lower offsets, such as memmove() copying
backwards out of a mapping, finds the pages above the fault already
cached, so each of its faults reads a single new page.
page_cache_sync_ra() also looks for a stream only below the fault and
takes it for a small random read.

When the page above the fault is already cached, read the window of
ra_pages that ends at the faulting page instead, without a readahead
mark.

Reading one byte from each page of a 2 GiB file, last page first, in a
MADV_SEQUENTIAL mapping with a cold page cache, read_ahead_kb 8192:

                   before       after
  time            50.28 s      0.76 s
  major faults     524291         260

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/filemap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 8a7d1238ae75d..62d507f96f22b 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3384,7 +3384,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 
 		if (vm_flags & VM_SEQ_READ) {
 			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
-			page_cache_sync_ra(&ractl, ra->ra_pages);
+			if (!filemap_descending(mapping, vmf->pgoff, 1)) {
+				page_cache_sync_ra(&ractl, ra->ra_pages);
+				return fpin;
+			}
+			/* Read the window that ends at the faulting page */
+			ra->start = vmf->pgoff + 1 -
+				    min_t(unsigned long, ra->ra_pages,
+					  vmf->pgoff + 1);
+			ra->size = vmf->pgoff + 1 - ra->start;
+			ra->async_size = 0;
+			ra->order = 0;
+			ractl._index = ra->start;
+			page_cache_ra_order(&ractl, ra);
 			return fpin;
 		}
 	}

-- 
2.43.0

