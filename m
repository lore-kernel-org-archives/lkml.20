Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957394;
	b=P7DYYlnN6BAX3OuHrM+pkTsoA2XFJT73hKr1MKCpmmr4DpEsowtNqCwzy5iXQ83Oz9nA
	 wPai8T/BayO+gKecbzzy6EzGZeEwG0xcQuzirJkGfzTI4JATV61jZOValFIVv/DU+imiW
	 IWAaCRrw8sboCRSl926N8qfR2+EIS9zM317DSotb7UVzUD2g+FmrxCefKm9b4lu65YjBr
	 dL6/W0BJ4VOAUglO2kdbitJFLOsgEi18ox1e1zyHUgZ0uVwi1GlJL7QuTBh1Yb/wWr0dN
	 JyTCGlFtB9Aaq1PNfyAmWPvlK942VJFsEbkyx2DZo9rgDE6zu4QqLz/wgr8idP40VsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=waJSczF0G97CDukNHhtkD5XBmdR6Pv681qHRenWC8Ck=;
	b=pMqr12PlvL0IUn5PRE5egr4Q4+elWxaTIjLfD8Bni8nYxg6QQF0m4UdbUzO1LW3al8Tb
	 +UBDP+9FT3qszdIPZ8u+fuqq4iPWLtwmpapjF/PlvJo7bx02TC6YVBX1FOpvQ3RXI5X5a
	 ehW0h5uBv0GGlKOn+f16Ae+gg9HuxlG2KN0lFQPUWBcW3WxZHAd0DaRbd99I86aOZ/LTw
	 vyeuec4LCZYczlwYphr61lZP5H+n4QnomHND4Vk9hIOayYZijVHck+5ma2TMu/iA3TUSC
	 ATlMSktZ/mMJG3KJPZyAFpZX9cmPJD/j9f/C6CcqQIgM/rh/BX4CSl20OYqZmpWWxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXo5hDR4;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4227606D804
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4227606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXo5hDR4
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso191709a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793957393; x=1794562193; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waJSczF0G97CDukNHhtkD5XBmdR6Pv681qHRenWC8Ck=;
        b=jXo5hDR43HMdxei7dy6TjafOhVMrClrJlaQnEKMGohZdCsVMFrj6HbyqPaaRG+2Qay
         AA3LcQ75Q27BrlMJoqFarISC6mD5CUJG+wPworJLOBpqM+2cAHnpq+8+2llXXX+O8zcH
         JiYOdjiuN/mbnJV/a4QB8nCkTnvWc3njxlRYpyn4DXx2QkBLCSp2mAO/vJe7u9URwslH
         saThYc5nGG191WRFghjQkRkm/XHTd62XSqIxpufB1Pzi264oGxizYoVTmJNptN3UPvMA
         IuQ/ED3VnJvcUQRZcRIC91BsMFoE7O3hy55+30wYyitUcVAHPPopertPmZdeEyvilDej
         D5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957393; x=1794562193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waJSczF0G97CDukNHhtkD5XBmdR6Pv681qHRenWC8Ck=;
        b=DfQufXHio2E2pM0gEBU9DqguhzlT/Twrpv+Tcsqn+N2jwMRf4yeInL7+DiU6VcMrJv
         OI45tOKchr3ADetXvoZGrEObFTzkUxxt/nLTtn3aXkiVxdmBvyQAv7OlHrGxEE3SyPHh
         PJ9FdQz7Z5d/N64JFVA5GqiPoyKHFOl5VWdwC6TIUB0IQGr5WGJotglXInkCRbHjEiTa
         JzYICBpI78tWV/epnDWULdCFgdOX93N2kN3xJ9obiILJGasQdS6E4WWh8Bs30POLo5rC
         sGo0WR9GebC6LSJz653YAKTkZW9OzojJ/fMCmmE4W+LxXYSL1lDjmSAFdTUyK7gbOHp2
         n1fA==
X-Forwarded-Encrypted: i=1; AL+hErFwwXboP89K3GGVysyc48/I/KnRwBg94p3RJQguo4LWF+u0I4RVr3EmUzrJmDlaryojiVTt20TbA6JwoOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vn2W6guFIcFVl4UIenGKqVvI/xkZabJLxgzPY6b3oAaLJc/bJ
	nxo2Agcn7I8vpKpbeu57XKvgnEAJ4uP+Aa/8GbHs89rH5D/S9D3RaZux
X-Gm-Gg: AYBFou3ykSPF95P2w346+qP7QA+gWU0vpQSTaxtKtZeMddoW5VY1eJzB4MzqlMRbmgS
	GsERGD8x3FR+jnmxA+w57AvzvURec7Syy1g6NpN0VwwwSUz5j27L0g04OT77E5yGQOCMbb6PUfk
	BqaQgkUzW/JDCxvJPlfMeyrgAHm8NmNlue4WoH3KDnneb86GaknZxFHMO7pR79Xl13tzNTSrLsj
	xSKPt8vsZxKHW8GvKZaMTYsf9TzhhSlOu/VKsnAomVwLdECYl+lXXloCNWArzw7moy479L0bDmW
	FdxJy9RwxQftCPCF6T3icapSiufHyu108QA29MQ02qgo0ipz24N5/tdD5hFeq2ksLh3yauiGQVb
	L3n8j4qG0K17fsWczDarAkorpOCDQP0fWTgoPMj/vvYbWdyP+7iVjhtDAhoKeYJTSw9Vj2Xb1NQ
	LCH67AiVVyXaSY3DjoYhkQbIp0nJgMSjDnto+sOsJHqffcJB1kF/2bMR0qsnTqaqHWPPLpQ7mRs
	srEHjObBNnWu9VXaYTLv9LjmeuUGZrKXMCViwv4pkypKXauJ3ClEb/dVovw+fzj5PVe0k+4zzMr
	bvoUVqhFBZgb3H/X3Zb+nCA1fRU8xFjqCsDWXQ1j+RIVjoD5pnDXGduYbXweZTW7
X-Received: by 2002:a17:90b:2c8f:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b0db713f11mr1803189a91.59.1793957393089;
        Fri, 06 Nov 2026 01:29:53 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm7043845a91.8.2026.11.06.01.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:29:52 -0800 (PST)
Date: Fri, 6 Nov 2026 17:29:45 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <b48e1b6d-0286-489c-a688-cf751fb74fe6@gmail.com>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <257ab860-b408-4897-838b-e7b68f981d6c@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <257ab860-b408-4897-838b-e7b68f981d6c@gmail.com>

On Fri, Nov 06, 2026 at 10:12:46AM +0800, Vernon Yang wrote:
> On Thu, Nov 05, 2026 at 08:57:24PM +0000, Lorenzo Stoakes (ARM) wrote:
> >  		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
> > -			/* Unable to collapse, skip to the next candidate. */
> > -			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > +			const unsigned long next =
> > +				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > +
> >  			cc->progress++;
> > +			/* Check for overflow. */
> > +			if (unlikely(next < vma->vm_end)) {
>
> I think you want it to be like that.
>
> 			if (unlikely(next >= vma->vm_end)) {
> 					  ^^

Don’t read this comment please. Your code is right.

The VMA at the top of mm, after aligning the end values according to the
PMD, may overflow to 0.

It might be easier to understand if this coding is used.

			if (unlikely(next == 0)) {

--
Cheers,
Vernon
