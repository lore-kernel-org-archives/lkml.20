Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959874;
	b=s5JVgm//MsaDXpmYZX4oW/GDNQEu3Gnu5FcbpXTMi+VdajrOveO6BWdhkM/tN4OLyyko
	 2hKrH+qm4/av5DZsu9v2mOhFt0wUB0ov3TH5DP7WyS+FTRJoZnV9LN15o21gvyQjHty/F
	 PwfBXqumegOL74NxVtMxdb4k6Rjz5Rztt2nbT9yDjDpWEX4Iy61UXc4QmnXuDYD4Ij4wE
	 PvGeVDbuQYQLmDwwGIzO+1YGgEb0Mc93mTjxfrCHomTjvZuefU747hdbylgc5CrGGrtSg
	 +4AeSb6ZymPNCLDsXUBviyTdh26hmQRDBzKATXtMJNJhOPV8fCTqUQ9P3vEyCgVbVmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8gjNRWAbARHANMWwPBkUdQHILY3xbkqW7VhewL5SJQ=;
	b=cnTxocdmMZ07VZRuXfrTKC6dAVketcTFnZzb0fi0VHatt9zdy1NBxOL05NxdlcTZ95yz
	 2NRoESWF0ddfC+B1+hwC+F4gZpJkOFB9TWizm/iSTZADieZ3AOJl/4S1HHc+4UV+nvw/1
	 ELkj99hanOtIk0J5pOHeNiMG6beV2JyhVkj2nsFlOJcVBvixpYNNJe1tUgFmTE9HCiRY6
	 b5O2+SMEOq0VDqB4oRDNTKLGN7chv3GYnwmxpKYuFSxSt0wxrNhA6oHHhqLitU/hhZbBT
	 XQtq3sflVD9AqLTcFXfrFt+4hpPbMJyaQnuf4geO8L70QQGql+ICpWdZ2mUZWHqDp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIGJn1Vs;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11F5606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11F5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIGJn1Vs
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso265574a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959873; x=1794564673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8gjNRWAbARHANMWwPBkUdQHILY3xbkqW7VhewL5SJQ=;
        b=dIGJn1VsgS3n13DD6r07hsgkpmEQfTCTKqar9/65F3T2iR5Wo4xeB4hmFVBt0vPKlb
         Ivm4Ut3NGcYlZ5Ruo5cmymd34WQauyp7V+ZyRBYLI2HZf53LEz0r56TAK290ikd2D9GE
         U2s6RHnJVEKFn+T54BzaPTCKiv1E0e/Dmz1c17CAG1PkcF+O1HZZx39a4ttikA2FkGkp
         WUTAkxs2By2jU4PHixbbBBQxrgy6evL2YpKYrfGVxY9O2HsTMa+pFWb4CGXw7kQqzPVO
         g+rW7cC5BrGRy2Y9T/1mMfKsE+lrutkIB+1uZ5x+AvL4uUZwUUjeL97R9Ul2AdER+Pyj
         TT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959873; x=1794564673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8gjNRWAbARHANMWwPBkUdQHILY3xbkqW7VhewL5SJQ=;
        b=oqcEpdMsQkdf8VCJuhx0iTS//dWbl4wKTh2mXURLl4UNqREtl86T28AYR+0Cj50aDg
         GndAS3nUrrs9wz+0rSWb98XsxJiGYJb2VU+yDE1W3wTwedGOU2jlWDnxNjDHLZ/b40wy
         gaolXIeSBR9MMKGHU4cH5iEKu+T62eIWCXy76IGpl5b8S7hJv1q1mjiulJZasNU3ROul
         Lwdr9SfjQRe2Z2bfS6LhDotsVKyWv6aoPnyJUe2FO6EUy6bmKliccgabS7TRLzeGo0M9
         D+8a+SfmfLjGW9PiIi0taHK58KuLEDhEVia1qbxnyPg4RkJQDfLDAMOxDpglshTt4mhu
         BQfg==
X-Forwarded-Encrypted: i=1; AL+hErFo2kGF6MXpLPqRuFIRf9R79V+4kx7pi+6NVC5H5DPRtuXDmizqVWWdMl71XpoY4Gx1npZNSSKzoaiNcJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L/Yoz0QtlzdvpPrlBjxbFnvOZUDooqLEngComUBM9C1InDFlB
	t6XdDLu/4CWk+AedOv+I1lJeZlOtcor1N0DIDKt6TmQ5somSbe/6hYJ7
X-Gm-Gg: AYBFou1HolLY0Xee4shepsiGjkeXaNcUDesduSfsf2sZxZqtIjTj4stV0vfts6+rXhW
	7SQrt4hu0xPnU/qRWxatss8lpyrNADiAxiS5h0LRrxtn7ubq/v0wQSJrpJqsYWhxquQl1ZjHdi+
	5uNGDY0c4FoLz/xx5RRQOX2D7BxrGwCXYCRLZJee+S4tIhGp81x+QEYdDMnZGniHefiIoTag0ru
	pRkbf/UNrElvUsxQ+UiLFs+e3tA/cCDDHHlSX275SmggVrrs5fUcVF2Xy0jCSq7hRSnhM+AQQOx
	kBQdaHkPkE90EFzs+IRHOdCpduxw87+djU+0ilBnVLp1YnY2Fd5JqOSh8CQSSZdZZRo8WwvWFpS
	otDR9ICc5sfNy2uOEbyAB1/I30SwFvRngCT3e0UjJQSsMSA9YvPNef7b1JIVhKGWyj6wo/mwzer
	MR/Urtbqoj+zX7xls0j/ZJfUgarkUScTQgbyHYa6JDdMA9AnpqW7gn7AeTDOSC1tORAMphF/Otp
	YKKx8BbXeGepTEnUd/jqfNUU6YfjMQUeVgu+rwqNCYd9+DdGczGZ9sJMInw7l13rvcB10I2u977
	BhKSaBZQfjYjhCVW+pN2p47R/s/SODUmvmff4SC1fFsEHaxu
X-Received: by 2002:a17:90a:fc4b:b0:3b0:bc3c:3e7 with SMTP id 98e67ed59e1d1-3b0db6c9b44mr2066990a91.10.1793959873054;
        Fri, 06 Nov 2026 02:11:13 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c66881sm2736443a91.8.2026.11.06.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:11:12 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] jffs2: validate summary length before scanning the summary node
Date: Fri,  6 Nov 2026 19:11:00 +0900
Message-ID: <20261106101100.2421360-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106095108.2405364-1-hj351016@gmail.com>
References: <20261106095108.2405364-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

jffs2_scan_eraseblock() locates the summary node at the end of an
eraseblock and derives its length from an on-flash offset in the
summary marker:

	sumptr = buf + je32_to_cpu(sm->offset);
	sumlen = c->sector_size - je32_to_cpu(sm->offset);

On a crafted image the summary marker bytes at the end of the last
eraseblock are attacker-controlled, and two malformed values slip
through:

  - sm->offset > sector_size makes sumlen underflow to a huge value.
    The non-XIP branch rejects this with "sumlen > c->sector_size", but
    the XIP branch (whole device mtd_point()ed, e.g. an mtdram-backed
    MTD) has no such check.

  - sm->offset within the last few bytes of the eraseblock makes sumlen
    small (0 .. sizeof(struct jffs2_raw_summary) - 1); this passes the
    upper-bound check in both branches.

jffs2_sum_scan_sumnode() then dereferences the pointer as a
struct jffs2_raw_summary to read its fixed header and computes

	crc32(0, summary->sum, sumsize - sizeof(struct jffs2_raw_summary));

Without a lower bound the header read runs past the buffer (or past the
mtd_point() mapping in the XIP case), and for a too-small sumsize the
crc32 length underflows to ~4 GiB -> an out-of-bounds read of
attacker-controlled length (KASAN: vmalloc-out-of-bounds, or a general
protection fault on a real flash mapping). The summary header CRCs are
computed over the attacker-controlled flash and can be satisfied, so
they do not prevent the over-read.

jffs2_sum_scan_sumnode() is the sole consumer of this length (it is
only called from jffs2_scan_eraseblock()), so bound it there once -
covering both the XIP and non-XIP paths and both the underflow and the
too-small cases: reject a sumsize that cannot hold the fixed header or
that exceeds the eraseblock, and fall back to a full scan.

Reproduced under KASAN on 7.4-rc1 by mounting a crafted mtdram-backed
image whose summary marker sets sm->offset > sector_size (the XIP
path): KASAN reports a vmalloc-out-of-bounds read in the summary-node
crc32. The small-sumsize case is the same over-read and length
underflow in the same function.

Fixes: 9641b784ff82 ("[JFFS2] Optimise reading of eraseblock summary nodes")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Move the check into jffs2_sum_scan_sumnode() instead of only the XIP
   branch of jffs2_scan_eraseblock(), so both the XIP and non-XIP paths
   are covered in one place (per Sashiko AI review).
 - Also reject sumsize < sizeof(struct jffs2_raw_summary): a summary
   offset within the last few bytes of the eraseblock yields a small
   sumlen that passed the previous upper-bound-only check but still
   over-reads the header and underflows the crc32 length (per review).
 - Add Fixes: tag.

 fs/jffs2/summary.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -577,6 +577,19 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 	int ret, ofs;
 	uint32_t crc;

+	/*
+	 * sumsize comes from an on-flash offset in the summary marker and
+	 * is attacker-controlled on a crafted image.  It must be large
+	 * enough to hold the fixed summary header and must not exceed the
+	 * eraseblock; otherwise the header accesses below read past the
+	 * buffer (or the mtd_point() mapping in the XIP case) and the
+	 * "sumsize - sizeof(struct jffs2_raw_summary)" crc32 length
+	 * underflows.  Fall back to a full scan in that case.
+	 */
+	if (sumsize < sizeof(struct jffs2_raw_summary) ||
+	    sumsize > c->sector_size)
+		return 0;
+
 	ofs = c->sector_size - sumsize;

 	dbg_summary("summary found for 0x%08x at 0x%08x (0x%x bytes)\n",
