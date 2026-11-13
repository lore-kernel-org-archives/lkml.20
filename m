Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589919;
	b=H1aYVmYi1LGaouxTIAng0OnUY/pvdSXYY+OalfUdeAQx0i6gcXEBYv4BpA46xQzFR0GD
	 kvWE2O6JOtktgwgFc9xWGAB00U6LUfFsEVD8YLlOzyzjRjEPDSQIkoVmaBy6H9UPqSlyn
	 Ib9P3Yqg6ol/BZAZvxgdmOWYDsmf94MLJMCUHOpz5EFWGWqn6CbiMnv3dJYFPiSzaw8dc
	 O+Ra2QHBKZuuLhaZ9I0pBHgNQOe7rcF/f3s3DUiEayHfaCjazFRr3WnmmDLAfALytUAA7
	 SGVimXgzoOO6tp9UVshDjb4yY5ZJxJmJT69bhIKTAFFByGytuIjbwvHoH5J6Mu21HbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V4LsAq7DB5D+COJ4bQL/G858UvTmKQbRXPHjpExqCZg=;
	b=RAsE8VtbO647t4wYzRcAQ61NED4S1LusKJKXeRXAh+C+UcU51YtacSUaPTBUrf83o/B2
	 tbswkc8auFOPBHL4Q9xjbvVwS7ekky+ZvpEz8xujB4S7YuChACFD1wVrGVC5CPZL6ZUW6
	 fDFYZuy0ul1gWVaejczWJBbyFJ97FRdeelPNKCCoNeEYkgZEAT1p3J6CA8vKTxovWuZ0n
	 2um2w6O2m2wrX4Mcq/2ko1Oe6SJA4Zfab43gCGSoup2+Ya3LUWWj0MHay32UtCnZ42r2B
	 /EhXyZlC8+ALLH8FFbEIqYBL02VsXDob1yOJUWhhjxSdWzu1BwXcM4Okbv+SLOHWIDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKMK0KZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C66606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C66606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKMK0KZH
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1557814eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589917; cv=none;
        d=google.com; s=arc-20260327;
        b=MKuaeODTH64vTuHjHObALEfg2rje//AkzU4YY2qdbcs5QJZG2adJXG7y0b02zGBi7j
         PMWzErh/FnJMuremp/BZgG16I9wJ7XwvNPIsAyOvimOk8N9TZ0y+7qkllMi3Pk+B/+OD
         dtn01txzL7hdMO1jIk7hYJQAdqQb1od5gZk8M9NBm8AQXL0TYzaCm9EWZmyOhvgSyEjL
         71ug12r0GAhLwL36YezMyfgj8/uS9hMbpJVOEQ/0iCqUkGZJgVFj0AWRrdqNqNouUryw
         Hfrv24LqDl+96F9ZMEHcmlDxKn/dJlgKaSBP8SNQHhJGAQIK65jvOI9mH+pVu+wbX4Tq
         mXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4LsAq7DB5D+COJ4bQL/G858UvTmKQbRXPHjpExqCZg=;
        fh=mCTPyLhB2IOiN42dq3IH3uDnGBZ9HIVSWQMlDc9+E+E=;
        b=eXuH7ZxNYjJvOQFwO5YKOWRplZjYaMfbquicm5UwGwPTOLhmwR3NohBZs7GdoIVXOz
         doveLoR46LfNgzNxnbOOFll4IrGWTvoHVCauPWIzioYgctTOpVnnn7h7gv9n3WK+ogKx
         PQG6HE9vvL3d4WgkDDK+W4VURLs8PGljrDW6jsmnC9Qpyf/A9j5ZnjeXM37yHHvocUFV
         aIy1M9cL5kLF0d5Yh41QCzaxy5i96l/2aiwt3NeN3+mH1KxbeG7CKnrISGCvZecPLI1O
         iYFM7jKapiwZ/QaUouPoly5TEZs59fXfiflTsVIi0tR9hO97dgsJdJMJgc3JWTAr+loa
         30bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589917; x=1795194717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4LsAq7DB5D+COJ4bQL/G858UvTmKQbRXPHjpExqCZg=;
        b=BKMK0KZHW40/xANMJhU06GwcU6etbuyihKhRyBvi0ST3A8FuQivvgdkodfiBKcBOdV
         aMCGMMTE5m12VtsXoFl5J98xuKOy/qUFuZdNldWNAqBLhjWCZEiJZs8BHwkI8iHqoo9q
         gR03Ozblb3tiuLmNzMmZgDS+XGmTdMY0CNIayn7+tYVZEcjPlMumRTEoAVu/JqYmT4cj
         RVUEddBEbOrcUaoPhFb87pmNDCRHjLvwFLUCL4loYnY8mSY3euX/Zh7epYqE0poECM5Y
         UQE/a+QU6/80+vW2xQio/J87Zx2mcrURhG5tVx38FWMUMYa0VV/dq0hvSn30ahSOmfYu
         C61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589917; x=1795194717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4LsAq7DB5D+COJ4bQL/G858UvTmKQbRXPHjpExqCZg=;
        b=rg9RuQs2nrGY7kACwyYoOVUsEQxHVYkyV9B/RUYzQlZl72+XaH0G1J1cSu7Q3ZU/GG
         ModsAN/rJSjv0Sq5NL4xfcnHU5nyTyKbG1+MMXkK+utv5x5oM6JOOwEmkN2oZfWGECbI
         GyAN67OxfExPsL9nq6BcaNses/drbJrll2HWOe4yy9D/vkrJZRtK8hQHf2FyrDFCI2Hw
         GMF4PlolcXh21dHWzgbjfWzD0PmQnxpRIh2hvEe131sCYfVsttbp/YZ34s9btc9L0OoK
         9D13UDUFHA2sAY3UHiBzOx3LSjhfPDjOaavmRNFW22mwJ6vHwRCcoWH7c5yT8q3LYN4u
         Hpzw==
X-Forwarded-Encrypted: i=1; AL+hErGeiUhccnPqcbfFsl0vem0Wydyzjyxlp4+0H8YXq8pTSgnXDwOnlpeMzidxZMLiSFSrWdTDDpv86y3JGOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UVtte2s+Sz763jx3OKZdeHU+FRLs8+MdqeAtA90bSFcVLKxol
	BJdQgrU6ivC8tPtVq+oGf/3CpKZiynvZBf3+kn3KAfryC0bmjsfajFqcHHKwkkxU4acVxKRxs9I
	xymukyj2HTdald39smg4ufbYI4VE7bjY=
X-Gm-Gg: AYBFou0W+hxbzVv9MNGhD++4TwskEFVhmge0oy+yBVhbV9u28UQ9qy3ABZ5to0tFsTd
	A86jXMkDJGEYAq5Y/r6LEWMjh7Od7s8k8dQ8kjgFkOGbXYm4KGESEAbyGSQONHj+VyD1pdSzl/n
	C/MYl7XVPkalmnWa3dFviwAykrQQUlFztxrNOKtr0dlz/ABMM8w6QH/T7843Q0xwsFNTIpU0WzK
	0qJ3GcWcczDW8XBSKPx6kNmTsHf7APx5x9oF97EOv0KY+nXEdK1m5VFg7oL1YjRWPZRg1Gx1jVs
	R/5LgMKbMkW14Dm7DXnKlDHAUPpGVdnghZxaBHB45wSg+m2OZma7SPmyq3Q1LZYtpdy/ctjUN4X
	6mlvpIdkS6LOPHQk3TYsbvDvzb0ya7j9kmx/C3+2eoMqm2By8ZPOQCEbapBA+rH2dnAk=
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id
 5a478bee46e88-379684ae78cmr2588635eec.38.1794589917373; Fri, 13 Nov 2026
 09:11:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112214738.3002458-1-joshua.hahnjy@gmail.com> <ba5dd85a-20a3-4f76-a929-4fc2df8fecf0@kernel.org>
In-Reply-To: <ba5dd85a-20a3-4f76-a929-4fc2df8fecf0@kernel.org>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 13 Nov 2026 09:11:45 -0800
X-Gm-Features: AclHuK9fy_F2qf_MxokR_kjguv7xtRDWNK8DAsF7IEyYQ9lXs95btzddWkzOKuY
Message-ID: <CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com>
Subject: Re: [PATCH v3] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Gregory Price <gourry@gourry.net>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>, Daniel Hodges <hodgesd@meta.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFAM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> On 11/12/26 22:47, Joshua Hahn wrote:
> > Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> > NUMA restrictions") makes get_page_from_freelist() skip any node with
> > kswapd running to avoid piling on already-pressured nodes.
> >
> > This assumes that kswapd was woken to create free space, although kswap=
d
> > can be woken up for other reasons, like higher order allocation
> > failures. Thus, fragmented nodes with failed high order allocations wil=
l
> > always wake up kswapd and direct order-0 allocations to the fallback
> > path, even when there is free space.
> >
> > This behavior was observed on 2-NUMA Meta production workloads where
> > faults would pile on already pressured remote nodes while stranding
> > memory on the relatively empty local node, causing unnecessary pressure=
.
> >
> > Only skip nodes with kswapd running if the node is under the relevant
> > low-memory watermark.
> >
> > On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=3Dalw=
ays
> > and defrag=3Ddefer, I ran a process that prefers allocating on node0.
> > With a fragmented node0:
> > - Before the patch, 66% of faults were served from node0
> > - After the patch, 100% of faults were served from node0
> >
> > Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUM=
A restrictions")
> > Suggested-by: Daniel Hodges <hodgesd@meta.com>
> > Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> > v2 --> v3:
> > - Shortening cover letter, suggested by Gregory and Johannes
> > - Collect signatures
> >
> > v1 --> v2:
> > - Added a Fixes tag and separated this from the other cleanup patches
> > - Check zone_watermark_fast with no flag to match the call in
> >   pgdat_balanced().
> > - Calculates mark outside the zone_watermark_fast check to match the
> >   style for the other zone checks.
> > - Wordsmithing commit message to explain the unaddressed gap.
> > - Yes, this is ugly. I have another series to clean this code up but
> >   I wanted this to be a feature-minimal patch so that it could be
> >   easily backported. Things will be much prettier once those are landed=
.
>
> Easily backported, but there's no Cc stable. So I'm adding it as it seems
> useful enough for LTS kernels. But at the same time not urgent for rcX ho=
tfix.

Ah sorry about that Vlastimil, yes, there should be a Cc stable. Thank
you for your help!
Joshua

> Applied to page_alloc/for-next, thanks.

: -)
