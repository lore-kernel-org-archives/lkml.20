Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711857;
	b=U0IwhhVXuUJ9cY330LlsSuresIrP0go6ipvluVORWUPyo2rw1q0arlyLsf+OHJD+vLBW
	 IHXmAWC43MEJM2VfOQNbAg6CeLEZdgF1cp1sE0rn78uSF+PyNE7b+ahDOITOqUsoHQvxo
	 PiBrXzj9/bMPUeKZny1apnfYke3TuUrHlUg3k0JgX0qQi3UMTWwPd1IovMhMC3mO85Tmg
	 UX15lmrclO5KVn96umOtF8KogHuZLDL6yFQ+CXTp797B0V6C01TwI+RNW2K/iU+I0K9l/
	 H+XxuUx5a40udt3y4iRerNti3V22bLtfLqxhGdpRJRxGQbwk6tDiNtCKjY7D7zUQMzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krGMqJXjl1D9Mmra3Z5byR4JKzxKLC6rxWf5tOUwhzY=;
	b=f2SsL6FcGrzwRAnVJZzYueu3YnaQf1CuN2gHJz8mVZogn5u8rajP2PU84MwuWHX5yDvk
	 vWTeEKeXUv0q+HcK30AkQSzjwenDczN4l8NX+moui5P9WSa8y+YYqvntofoiICnpUCsL1
	 01+/SJA6q/9IGIYZpAk7vTPJYYL0EGVmfTtNgHO93TrKP1v/Va9OLlFUUbgDN/8oDzweW
	 QUXW1D1LYqAxwZg4PUPTnCwt79krZTIZayBirnGrm5TDP5qtnzzebvGbToXSfiMOF8zR4
	 fIg+JZJMEH0SHknkxEZpqLnqBBBdfXqwwa21STaRF+Mtx3I5qn7Jc0MFwmDLiWWRiYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="lfXu/H9z";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XOuF3Hzx;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11F4606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lfXu/H9z;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XOuF3Hzx
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37M5mW693523
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=krGMqJXjl1D9Mmra3Z5byR4JKz
	xKLC6rxWf5tOUwhzY=; b=lfXu/H9zjyqkaIVUU0VXqVi/rKt7bWk2lXNuNWgHMR
	kfq+h7nTeHbUwoENtYJNJJ8Ekr8mogJhLCDbw725H72ZoEEsyNwcE3sxxZZWirO9
	O1hB93DZYhleGmo9Nywq/U6R4tNmPU0qtSB9oit13Vbj+XPvNHlsNzaC/ohvTwTT
	ot7W9OSfnjWiXufejJz+V7foDMoh0FglmCvGNh2U/rfCkI43CCecXJEVaGV3yZN0
	j4dQ5KOu+jkXYrieVPnr2sZjDHBpQrDq/XwUqtaU1qy48wx9FLlZ6gBWDZnkxz8N
	UYy+ar8N0+msWaUEVjmBpBo3M8zYxbpOOINovT5cvQLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3y8b5av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:34 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so539224385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711854; x=1794316654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=krGMqJXjl1D9Mmra3Z5byR4JKzxKLC6rxWf5tOUwhzY=;
        b=XOuF3HzxvftrvdQK+rv00mbnHTzwkDPk7OaUuk83XXrwcukZpRy/0uO0FWJHBQlypy
         CcZeNM0zZOKZFbpcSE1lv5K8j3+7gJiagaBJqXBzo8hW3GMektkVllwQXkUerSn9rdQZ
         Ihl6fwZMZpqRcAY7ktPYw2+JZRyJsgzHRAwpqX4LR0ybzjCB9pTBptcUtdPX+3NGL26o
         +wjTWT9cB0RPNzKwvnNSettt95jvsnSZftRpTpUygSBVnNzmGW+oFa/1VWMqjid5oy2J
         hOTcXoOORwXDT+SjCJw6TR/QDoolt4fvglx+mEzLSKlu6vqhvEDc2IJqrOIcgqiQRWlt
         CIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711854; x=1794316654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=krGMqJXjl1D9Mmra3Z5byR4JKzxKLC6rxWf5tOUwhzY=;
        b=lG7XQO43HZADEJGywmQCmB0AaSjfKLPpmKut5FSLRk1eAvlkasRP5WZxgvOFUJelSh
         ZNjeEUB8gdM50EAeTBTqSpptdtLMtfZ/pJ+MMcZ01U/GxVCbsvFtucltLwE/6Xugj0d7
         AeTZcAtKbG+INH+KjCVek86cNuymKvHohQoebDIakOZWBsaGoTsMRSKzpNou47vKSYoF
         9JgHn2tNPWFENxcsKmRIvyHY5S/W2o3Qx4/YzJGCnM2VfGVjbZHdJBIwBcjRi2BSa+hC
         N+5fAv/v/sOldrS67Qh7Wn4ivE+b4oq9IfqCj+PM1sv//PEAZqAeKWol/SL0n+zqXcE0
         A+QA==
X-Forwarded-Encrypted: i=1; AKwUvBxXAGyTShDNAy9Zk+HarNlaW17CNOIMluVf9kw0Bkk7p6ElX8YHm4RHFLRq+yXVRZ8UrTqbTHXL7KXEVec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w9RYraDoGEH/qFUazhEIgQaZ3XvtdaLdTmHKsOjOF0HXFnbOT
	B5t0R1keb/2mmIjbNykvhKXPZSu6nLlCquJNe4fWoSlwmrDvfWS8D8rYtDtrNKsLjQs5D9WLr6n
	Fz2sWC77LuWNLMy64FZAa4oz+8aDy0x/4C2mO89RzsHQch3c/+5SIqyfcexbDkg==
X-Gm-Gg: AYBFou20uwbOPxkwyP63+I7PJpPeggEIQT+4z6Af/FdVoBNpip5L0XWIQIzj0kewlJv
	JTdhV8WMHajA3hUDS/rfFxSoxScpCmBSvOLLNeAoCkaJjUrL35m9MmmUV8dRKxvtkfy0fqcIXKt
	ORLMXIyHQVBqksqsmoMnmDL7yDjeY+U38nLtwyzfZi8ruFgrsnWEETYb1JCxivddIUOi4UdPFOS
	fz3zFLBvJSjf0CKm/BdTIlJyeK211KXFSDieT0hF+g7EeoUhIP6O6BO+WgIbkPjCY0iJqeGZDP8
	C+RTxQWC5KAs69Znr/yMZsZNRPDvaTlqj6Kw7YiXBiSl1x6hnJf0Gb8R10Im5T2F/14qGuXuWy6
	gtN3Wyw2oeZvBg4TWhrNq/gU9HRwFg3H+z8Jja7ufillPg2QpZWK5QxDq2Dg=
X-Received: by 2002:a05:620a:2989:b0:939:de48:e41f with SMTP id af79cd13be357-9442167723amr2271885485a.31.1793711853676;
        Tue, 03 Nov 2026 05:17:33 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:939:de48:e41f with SMTP id af79cd13be357-9442167723amr2271879085a.31.1793711852988;
        Tue, 03 Nov 2026 05:17:32 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:31 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 00/16] squashfs: convert the read paths to folios
Date: Tue, 03 Nov 2026 08:16:58 -0500
Message-Id: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAMre6WoC/yXMwQ5FMBBA0V+RWWvSaYLwK2JBTRkRpYNIxL+/e
 pZnce8NQoFJoEpuCHSysF8iME3Aju0ykOI+Gow2OWo0SrajldGJcn5mrzLUZWaxdKbIIUZrIMf
 Xf1g3n+XoJrL7e4Hn+QFDG1KIcgAAAA==
X-Change-ID: 20261012-squashfs-folio-51095c19f276
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=3053;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Lq3LJENrUjegDb71lgLDYM552fD4afWLvC+uQdiwjaw=;
 b=6db4qgrCklzf7CZv25CyimYW5qpwTC8nJLH7rrUMnGK7GHCQ7Shz2WHhCHeYQ0DFW8U6SS6sr
 y1zLiaxlxo/BmekXXszUn/OjZlV2eL2NrJaWUC0Sw3wg4QiW8LOxdzg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX3Xyxaalrn+fK
 wm1vI8fzhoQDSjahsc6Vn2XdSpl8jYLHNrhBYYCMAwQFS9j24y48ZdrZbbh+7u4gJTFEZYgzv0f
 hZUbCPi471TmyJaOpwG0A+8+ZSF/wNEI15R84QJoNtwPaSdnj4/hkkVUCxExZdcM7j3eFbWeea8
 12n9s/e7YkGVnpEWrUb6mZ/hMZdLwK1mE6MHOd1+FIsmni5tsZTwEsLwGGsbHs9BL32tcMsjRSa
 4mvhjMajtCInz5NeQxC+q0T88q07S8fEb7gXdjUczKIDkUBR8bWs2wskTs0SRBWNjva2DJB8pzh
 GSdGD2gNjKYtMr6Dy/pgckYU40BuAPVKe2XMhZLq0luv8tuxOtjFx99EYpMdW0f+4sqkLzi/Ngi
 wqiHxssq2bbEbqgGL0pxhcxgqycr5DUJtCYk+lDwlT27aEZ4MIIkVgmYSXlZqWbeT8o+0P6wyA9
 IhWrYC9p+6RkP/Hao/Q==
X-Proofpoint-ORIG-GUID: r3Tstg8SNrDiAc2wilcDzvHXoVB-4fL3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX0NznePAsXBK3
 ieoxUHfJN28Sbbcf8CNc4CUqP46Zn1yn1XKNrbhWuSmoxSZO65uvSmu7+00JZG6VR20G6ShKNj+
 s3wcdJqKq24Wa6AyDpVkXan5JprdAoqrle6uPVg93OKqIxF/jROg
X-Proofpoint-GUID: r3Tstg8SNrDiAc2wilcDzvHXoVB-4fL3
X-Authority-Analysis: v=2.4 cv=TLrQ2Fla c=1 sm=1 tr=0 ts=6ae9deee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=LSP6vmwHhFFJrJolKBEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Convert squashfs's read paths to folios.

Patches 1-4 fix bugs found along the way. Patch 1 fixes a hang reading
past 8 TiB of a file through squashfs_copy_cache(). Patch 2 stops
readahead from reading an extra block when the window is already block
aligned. Patches 3 and 4 fix a locked page leak and a kmap leak on error
paths.

Patches 5-9 add a folio based page actor, convert the two users to it,
and remove the page based one. This removes some of the last callers
of grab_cache_page_nowait() and readahead_batch_length(), and a few
hidden compound_head() calls per folio.

Patches 10-13 make the actor, the tail zeroing, the readpage_block
lookups, and the cache copy step by folio size instead of PAGE_SIZE.
squashfs only uses order-0 folios, so nothing changes yet. This is a
step towards enabling large folios.

Patches 14 and 15 are small cleanups on the way.

Patch 16 fills the compressed data bio with folios. This removes one of
the last callers of find_get_page().

Tested in a KVM guest with KASAN, lockdep and kmemleak, with both
CONFIG_SQUASHFS_FILE_CACHE and CONFIG_SQUASHFS_FILE_DIRECT, by mounting
images built with every compressor at 4K, 128K and 1M block sizes and
checking the data through readahead, read_folio, mmap and concurrent
readers, with no failures or warnings. Each pre-existing bug was
reproduced on the base kernel and fixed with the series.

---
Tal Zussman (16):
      squashfs: don't truncate page cache indices in squashfs_copy_cache()
      squashfs: don't read an extra block when expanding readahead
      squashfs: release the grabbed pages if allocating the page actor fails
      squashfs: unmap the current page when a readahead fragment copy fails
      squashfs: add a folio based page actor
      squashfs: convert squashfs_readpage_block() to folios
      squashfs: convert squashfs_readahead() to folios
      squashfs: remove the page based page actor
      squashfs: give the folio page actor helpers their old names back
      squashfs: walk folios by offset in the page actor
      squashfs: zero the tail of the last folio up to folio_size()
      squashfs: step squashfs_readpage_block() lookups by folio
      squashfs: copy cache entries by folio size
      squashfs: use folio_pos() and squashfs_block_bytes() in squashfs_read_folio()
      squashfs: use folio_end_read() for cached folios in squashfs_bio_read_cached()
      squashfs: use folios to fill the bio in squashfs_bio_read()

 fs/squashfs/block.c          |  52 +++++------
 fs/squashfs/file.c           | 203 ++++++++++++++++++++++---------------------
 fs/squashfs/file_direct.c    | 104 +++++++++++-----------
 fs/squashfs/page_actor.c     |  67 ++++++++------
 fs/squashfs/page_actor.h     |  34 ++++++--
 fs/squashfs/squashfs_fs_sb.h |  24 +++++
 6 files changed, 271 insertions(+), 213 deletions(-)
---
base-commit: 4fab3abf085638e7fd2ebabf0aab8aa299486207
change-id: 20261012-squashfs-folio-51095c19f276

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

