Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257942;
	b=yiqyTTI69tLbWWDrtycD+++HjWaNVEGF3b2ZFI0pqqMTS+/o8Rj1IwVCz3tK+GxV/Hax
	 PZy5YWM4zEJNocHmT3ZoWt7SKvEIlL31SN1j5B90KQSupl5db3y4Oe3oRE2p4Toyg9pDN
	 f5E7LosK4DK5h1nBQY5aeKNpEfe81oNj1ITIFT8rHh6jukje3YG6QN3lFAn+sn3BD0RGY
	 ig2iAuNVwBGoE75Kq0bO9hgRuW561Dc2K/7goNwPZit698dynPubSFQthBrTxJH9lYAPx
	 B4UFCbqVf3rXLIYLKIAkL9yQWKKHEl0z/DJ6XS7G3060yYFgdwlzjHXjqRYw3LiaL2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=q3Nd7r/hqjSFpCyfHdGuJldUGtTV8w8XJqRuLAQWCn8=;
	b=qDO5yBTT1yP75L6NI80LWyATkqdFX5RC7Gqre3WMxsnPLMjvb6gFqnCZ3VdLFOf2AzpJ
	 ysreq9PFIc1okTc3eQfyZWvo65N3+LnaLqWhGIs2bEnH16/76TxE+YzW5UvciP3lMcCJI
	 apFr4n3AozgAB7KKJS4k2zvILu+uqcnIzmEQV/CXKEYJhl+au/vzr0QzGlPY2NqYHxlDq
	 JAPz5pn+CAS+TewP0V5sXnFyx552AJjF1XyKFWDrlTB5fK6mqRyI6k8UqFQ6GA8phi/Vp
	 LKX7JhoqPTyrS9Xk19zVcdIjBSfco23I7evQfA144iu7/CM3XwAD7jX/9l55le8jl6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvVcgnyn;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9292E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvVcgnyn
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd69954c755so1282301a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257937; x=1793862737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3Nd7r/hqjSFpCyfHdGuJldUGtTV8w8XJqRuLAQWCn8=;
        b=GvVcgnyngqdsNPwyskdRKlVlUbkrSTdOPrGYxMZAS2S/XScGHofnWSOhMduYvMis+3
         VnB8W3g3vQn3VyeOVMepuFtITdcQ0uLQLVxEaHLRiXoeIAN0lkeaEI4LdzO/n0ObRIPy
         jHiTgJmGBlFTpi83NHQUadPadCGf/3gn8/nP1ks4Cz5XhAr9jrIlEOeykUzqjAHmHwKH
         TF2FSgb58GssGgItd5ZVpR6I0Iq9PBa4r4PRtme0OOL0cvmUJpn3DjVGMefnCYvwTGaX
         elytMhXW2ATkL1coiHEU2gM3PcMzyzxvY9GkCcaO54+XqIwuiK5ySZqRqyxeCuFurkRf
         jIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257937; x=1793862737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3Nd7r/hqjSFpCyfHdGuJldUGtTV8w8XJqRuLAQWCn8=;
        b=UN5eDLVb/xgn3Sanxc01VhRq5XtIvsse5/rCxUhSHitfgCvoC0SrTatIPH1h354U4O
         Mq67xKGV9HsC9nojyByokVNwSZRh5gRbZxT9QenezoUPkDpuucitu9UHsaATX0rCNn5J
         ipHswvyIVMmeUbG70ZT4ql3LlZMjNRILQV9a82zgYpgIWIsMX6axFs11N6sVQYNu9gct
         n9dASxHthQA8crDYY0m/rM6kMn0enOsweFH4tXP2uQpBNlNWF0Bw/XodrHNB+O9kIUv2
         RjMzHPWQ5JUh2nImFXWw8U/z03+2VljUFA69mIZXiABfml59EuwH/bh95VlIO/UAJna9
         xFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiW7TodSKeuykPMIZKzQQETbi+xyJSDMUGVrzR1kJvffdfMHvnQxQ3hhzOJP2h8eQjQM1YgvYNm13Q+Nk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLNR4EzawQh/67zhOxx5fZz+zGnFNyCWrc5tifmLYRwOxtf0tp
	br00kGQa9HjvVIn0QzFSBFoWKM/eNfNS29u15D/8G4I5dmhqmsIDVfIu
X-Gm-Gg: AYBFou3U0uZZy5PQ5GAioMFJONHELN4/5a+LQf3B8Ru9yQdMTVMEDUszUnClkNSOjKh
	c6ljxb0VC2FO0X0GVAzjzqi72Dp096p91YGogGxFmdKKBnaanShMa9yKeuV7ZNraejtOmqakEGh
	z9UjIR6l1kNuunMr6xTaPaie+ks5ZiRXsNZPNi2YggJdJbYUIRvezWFlXqF5iXTfTiFxqlfqTrr
	/cu3wjnPfKnLleYhp9idCBk4yx+fbPeATpoBIGFTmKTgpDzyDDMmjI7+J9ru/Tu9b7TG5WGDtH2
	nT8HrYZqyHoBsWHVn6mAuwfJFiNkzSU7uU2hxjutcVRelMCjt/nvk3mAH0cz/sUIq9QF6Fg1Q3E
	zFT3YuoYscRxMC5OQXOi5Xv5i5XUJfPbAPz41eUFeRGSrCAnQFPD4j2n007gfrw4SS/VoOorQQ2
	M1EVRFkcFu5uEmJ5C1c8KN/NR6t4F30BBnKrt3NF3hoXIynF0HhpGp1EOhqcARQ93rtb0B6c7pP
	FNyfAGo9V/lFFlJrtkzYYRjTr2M1InMQ/z36UITi/LiX6Cnpaozz2/fQWaQzKCSPDwY/+3Qp1Km
	obKGzG88QzIqyxhhMHLj4d/eUTJoj53oAcEK1EA827Mda1V4acmR2g==
X-Received: by 2002:a17:90b:3c8c:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ae5819e58emr3799149a91.18.1793257936864;
        Thu, 29 Oct 2026 00:12:16 -0700 (PDT)
Received: from localhost.localdomain ([101.44.96.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6f01e8a5sm1180018a91.0.2026.10.29.00.12.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:12:16 -0700 (PDT)
Sender: Yilei Zheng <trilithzheng@gmail.com>
From: Yilei Zheng <trilith.zheng@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 3/4] mm: add shared read-only vmemmap support for FS-DAX
Date: Thu, 29 Oct 2026 15:12:06 +0800
Message-Id: <20261029071206.19059-1-trilith.zheng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2E5C10CF-F3E0-4694-965C-B0E432A1A962@linux.dev>
References: <20260903122128.12264-1-songmuchun@bytedance.com> <20260903122128.12264-4-songmuchun@bytedance.com> <20261027065723.66564-1-trilith.zheng@gmail.com> <4c9741cf-ac62-41d4-9c7a-7d5ceea4a8e1@linux.dev> <20261029030511.12004-1-trilith.zheng@gmail.com> <2E5C10CF-F3E0-4694-965C-B0E432A1A962@linux.dev>
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

I forgot to mention the tool execution case in my last mail. Those
microVMs start, run a small task, and exit. DAX is there to save
memory, but the vmemmap is allocated for the whole image. A 2 GiB
image pays 32 MiB of vmemmap even if a microVM only reads a few MB, so
for those microVMs the DAX setup can use more memory than the same
image on virtio-blk. That is also a case this series fixes for us.
