Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533549;
	b=SWRRGwfFlCTblX0OBQthSjtEmQtorTxU1IHzpq3GZKcMmdvMMZKEGzNFTg7xzsNQcPVn
	 dC4y1ib4MDm40SCOZ50efQoV0YoEBSZTH8pKxg7lAhQtTGP2Do91lKnI5pF1UMglPX/mF
	 aBddgkz0Er91p0scT0xXUw2wEdhyQwmMDTabhnZeVwqYD+QB4Y4KqmXATVeXZBGyRXEPo
	 reDeBviy5NH23oTMiZU/fp9hkJHGKyEttdLrgF86UKSZF7q7Ox93Fy1ulJLL77eR7lS5V
	 dGSW4ZKhaHNmLBt5oGXtKEMl/W6xFDi6HZKNcadiL4zH8PTpO4EF9cbiLFYgEVJNOLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OFRf0ceigKCMfSem0YJiHH5DCGenKyglDuxNlTimA90=;
	b=u84kx/ALFWXLpJukbBfs+mZ7kBKC5A6nh+nDQqQb2sebZ1yHzP82l61yAYRerGognoe5
	 CU+0OglRuERNuLW14EkjRzPeUEXEnXSoFinFfi4H69BMnrmWl5jToRDkb7r7GH1tZW7oP
	 Yf8FovGL1TUVJw7dYd4i5LZDDPdYZEPNAGwulrp+lxf6Wgl1vXkYtqKiNVjT9RJCXawMq
	 Pl4uiPtglAiAIdmCi5GvNzFQuRRpxC1U1LvrEPUJ2w5ZZ+rhWKjYYnhRb1cnGixWv8Ip2
	 yoPFjHaWQSTpuQAkj8N54Mq5pMyGsxG2pKMfsK59VSPXYA1WtsS6wf8Fsgyy+bnSusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I+BHn+Xq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24637606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24637606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I+BHn+Xq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so593775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792533547; x=1793138347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFRf0ceigKCMfSem0YJiHH5DCGenKyglDuxNlTimA90=;
        b=I+BHn+XqQ9eQyTyJTSf9be+goHH54CA/u8sthwgc8PYOryJTEmeLCHXJp8UiiQDkuF
         2bZCdyIpbisgqT10hnlN3K9N0dsQMSGwZxPzQJLWMxSeLgk7OuOc+whZXF5WSu+HgvNN
         NT2v76pQoZcZka1GP5jh+pnfcwUWPZAk8a0yA/ipYAZakhz/pgN1BP1Mre+cqvhzRKBw
         otRiKNjzFMSHvfMMng17olqamENMvvnY5AaRoXGgJnB6J1kz+2nzdXlGQhTK7GYN8IaR
         NuA18p8yjc940Fqv0/SKztrPHIytdFbM5+petY4vl90LEv8v880By42TKLqSqmjBQbls
         0c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533547; x=1793138347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFRf0ceigKCMfSem0YJiHH5DCGenKyglDuxNlTimA90=;
        b=yMDZFkWd+usROAoeCzdkNk2LGHYVqPv4kQR8x/vviCruvRiu15CElWfaPSkc7Hp+LL
         5agJfQ5SG51TH7d5whE5MlDbummCl15ygd7Dm4rvubRlxB6BIiL9kOt49VvK9OT3qnds
         UR2PzKwvBiWQ/MdGujki5qTAsZgsQ/TRlOdM6HmNo4Fj1lhIbs9Vc821ZDujr0i8iEHl
         EsmnKCVsdkJVAmsmjUxmkNAq3SkCxWpJquCAtspg1LCfIycUCw5//UpqFDybXrUff388
         l2cUgAWnGNSZRjFJffIloqaP5KCaphzdb03P2lB6ZNzpeI0Dj2ygYxXOYxqAihmI8Tw5
         fySQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjtqy185ITV029ICwAaZSd5Go+Uw5Oz4h0yiSka0qLDBJUtL5t70L/73mFvJq5d/OxIMO1GMVwzcJEa4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhdWH1gFCZsM28lGMvlFWGft3JuRBab3/HzzOPmZRrHJhj9tU1
	JXXdjKmqzP8BN8MeBMves1/36/ZXTKQ50AHFM6tuRgvqO7Gtlf74jbo=
X-Gm-Gg: AYBFou3PFpir/ya4pc7a9aLn2/IEDovilak5l7ZrjmXD3SXtgfmNaT9gkCLYscG+ctN
	30YWxtXuI+ATk8DAEmTVsqQPletKuJrUYMxV24OVGzAUP7E+4mPfh2UVjtaQc1ecQKElrJCQ3Ek
	05Wgkx7+pJxZzmy8+/9aWV58TJAZabQlCmB5JbOPOYc+EeO8vlHhdgGeC/uI5AAvDqlRLDfUoHH
	0wFjc0tUbOOpyS3jOyUn9Q1uubccRmPEx+TzKSuwSuLrd49l5Jim0MzXr9/AXFRVWYhi/9EaGap
	ojHby1AagNfwgIL+QHnNrmwFUm1UXFeOJD3xdkr4kCBuCe8jDoj6o70kVP7O/87wOPHpvPRlqcF
	tEGFFKehhtmkgJFgdsgHNzcWD8sSSmtfvhqCuONx38ezF/rqrzWGMNJEBdf2O14fGMqOXBeyCvA
	DQPryZJoNR14aSMRllkZdMv225MuWJF1E9pVMiqA9Md1WQO/Sh/iZU6Oiaj4njRH9SbGBOpyQ12
	Ir/2LWg5pllA+GMkfg9jsFfhc1FyjPpDcrD7T7ghZwqjZaGhTLQXXhiR4dfZymbIC0AAXhY97eQ
	EwRv7o+EOUQyCi6AIg==
X-Received: by 2002:a05:600d:82c6:b0:4a1:96a5:366e with SMTP id 5b1f17b1804b1-4a1fdb1d212mr726455e9.7.1792533547325;
        Tue, 20 Oct 2026 14:59:07 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm1095988f8f.22.2026.10.20.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:59:06 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: lance.yang@linux.dev
Cc: david@kernel.org,
	samarth.colleges@gmail.com,
	akpm@linux-foundation.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	peterx@redhat.com,
	kas@kernel.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/ksm: keep soft-dirty and uffd-wp when merging a page
Date: Tue, 20 Oct 2026 23:58:49 +0200
Message-ID: <20261020215849.730615-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020055518.36087-1-lance.yang@linux.dev>
References: <20261020055518.36087-1-lance.yang@linux.dev>
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

This works for me, on b306deee4cba (mm-testing), x86_64,
CONFIG_KSM=y, CONFIG_USERFAULTFD=y, CONFIG_DEBUG_VM=y, KASAN enabled,
THP disabled.

Reproducer: merge 64 identical anon pages via KSM, arm synchronous
userfaultfd-wp on one page, then MADV_UNMERGEABLE it without touching
it. The page should come out private with WP semantics intact.

On the same commit, before applying your wp_page_copy()/handle_pte_fault()
fix:

  UNMERGE ret=0 errno=0
  AFTER_UNMERGE target_pfn=1153393 peer_pfn=1153393 target_KPF_KSM=1
  FAIL: MADV_UNMERGEABLE returned success but target remains shared/KSM

and every run also hits this in dmesg:

  FAULT_FLAG_ALLOW_RETRY missing c80
  Call Trace:
   handle_userfault.cold+0x30/0x3f
   __handle_mm_fault+0xde9/0x1c30
   handle_mm_fault+0x13b/0x440
   break_ksm+0x8a/0x100
   ksm_madvise+0x467/0x780
   madvise_vma_behavior+0x1d1/0x1e40
   madvise_do_behavior+0x431/0x14b0
   do_madvise+0x162/0x210

break_ksm()'s internal fault-in to unshare the page is landing in the
uffd-wp fault handler, which isn't expecting it. 8/8 runs across two
boots, same trace every time.

After applying the fix:

  AFTER_UNMERGE target_pfn=1063999 peer_pfn=1064929 target_KPF_KSM=0
  PASS: target is private and no longer KSM-backed
  FAULT event=18 flags=0x8 address=0x7f3dcb727000
  PASS: read generated RWP fault and remained blocked

No warnings or call traces in dmesg. 8/8 runs across two boots.

Tested-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
