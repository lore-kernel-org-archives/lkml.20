Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484554;
	b=NnkJSpwhE2Yh9ZMZciZ4j9OVBA1wwjFtPAwOUK8EXv0g/oZSoGYD+h10rsN0EENe9TgP
	 YIVtXKbVY+X/yjXD9a6Crqwk5+A67Ga2tf+REsqUXnUXwrYYFGZtolb1kT8P/TDDB2RSg
	 8OlPDn3SIKJ0gPJ+CgNARV8O5ArcOk56TFL5yPzwew7Sv7XZk5UX7O18oUjIeQLYb1/Wl
	 ORkNYvfKtDNiFh0WvmmAzgQYAFcuVlPg2Om2aAOMErZPjzoSyuZRqPeNMVCrQ4sYfqI3S
	 93Jaen9EqukWrSwJHaBptwx6wdj1SSb0FSjt4W+lGdiphQb7LYkbbNC6lLUR8oETuVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e4jp3dxFAzyLqjrHv50Jg9sR4jM2Bn9qOTXiixdLDnA=;
	b=Vam46PQ/VkA8nyvpvR8zShp/sjuJnCIvJ5tX0Ywgi0zgCWqq3YHoHWpG+3srRVQchEmL
	 Pq13BIuPS8v1sXXHiy2j2R3aQ1KG6pRzIqw4MXVeOhohCiGKJuYP09iZhIp+JfAq8Y3fM
	 K3vZNqsTYYvonplX/yFvxqB5ESeX8wVOJ6sr+HbJPS2878lYr47VRPwZt71dGy1jFkeZC
	 0ub6/8DH1judNiwbucmgqqVAlXyTZZC6usx1O3qSDWV19xbGQW3ZTCoHOpWz2Scfrf7Qz
	 7gNP2gElJDXdQx48aS3h9xk+GUvc/u6ahgeK7aINujzuXz79+/HR/Ea3+WVwz3Badhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pxpT/Knn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pxpT/Knn
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso362780166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792484552; cv=none;
        d=google.com; s=arc-20260327;
        b=WepxrqkHIUec84a/kat2A0YCjLPgDGPpDcuWVCHqElZbfQBCSgyGcPjd20yth/qhhg
         TBqdZgQEkFTYsO9oA0LOag6PI5Rx5jqgUvTQ9KiTc6KUoNNnRLY1MU33TZEqlgrCMVGR
         af5BfYZjQfUkXVMBxJpv7YJV5nk900FQWaFwvnoGIvWer8JTUotQY16uDdUMr0lc5dqI
         WV6CvWDG0sVVHFVJHW7I//eHiap7oBZGghCDXzRtAXKmSAX7nEWvH/VewY9X10FlQcF/
         l0q0Lj9zHcMi1+qGdbPOySSWJstVRzx2awfACIBV74XZ+WViELM7XbpAoZBbz+ig4y1Q
         W41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4jp3dxFAzyLqjrHv50Jg9sR4jM2Bn9qOTXiixdLDnA=;
        fh=92bqaZCAWDoPranPLILCOB8Dm7YxFAupUv3vp7vmY30=;
        b=ZE1fRZorqRSOEENUIb1MH0Ol06MHJVV8u8CTJJ/Jx8hFSqk/kkSocL6BqtWU90hCLi
         KEB7ouNpPFt419h8tC+JOg4MT1FvzJHdSKcwiDGm7hQ4GuNrCzrsMgqHXJqie4Jb9G2/
         xO8N6xnNWCDbD9THsH1g5RpvxGdBMzyCZkZkF+QYFaAZmNJBUzm/Yf7g+vD7tkbIQb2R
         NI/4Q3wC0FluTBj7tkKyjf0C+otBwShnXi+3EcCVes+ogl0+p2y88/MjLBHWf9qCb2J3
         kYCffPLfNuPZnhGsPKfXgWOO80jEFrHGzdHxYbTe1CCMLfjGEXngNOZCPobj8xnXtDPo
         Fguw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792484552; x=1793089352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e4jp3dxFAzyLqjrHv50Jg9sR4jM2Bn9qOTXiixdLDnA=;
        b=pxpT/Knntx6a7fRRhJjbqUiVkW9bnIj8njUhS5SKnaNhco2KmoSZoS1jXGuPb/5TdE
         KGjnrASUtwLENHn1VzYUchdM+9ojVsCOB5fQWwr29oqErglTn0yBBHSgm+Z9L7mdIdY4
         WJcPzTNK2vDogZBdeS4JWm+dZYmcyoGVi1fjDqMqpz3ImR9m9ueHe+8TpcvSCxvRaT+c
         gEDoMElpXKxQE8x9UFZZJAc/twGFMRwaHafWyHRDZwjoMWAutOBAQrw1T4F0/264S1b1
         vL+y9NkoejucedCB6j/QrQnCBEZYkDpa6nz+7b8i2Nx1Lp1zLAMg9jJN5X9rOYZNcvHo
         YDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484552; x=1793089352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4jp3dxFAzyLqjrHv50Jg9sR4jM2Bn9qOTXiixdLDnA=;
        b=0YhIxvNQS4D7I8JTlu2nd+6c1mUbFa9Y/8OwJoR/9t79k/T+sFgi2s9XjqThhsiMJn
         tDnMLSBkNI7vCeKFfotOvSjYK7QTujFvktlXo1YxWWucjJeBbdjKm4aeexVk8wQ2MEDV
         jCLyHyAGw9BN1aiEFOMEAVt7K5VizIA4Zlt1kanD1Wce73jj0dcxrlgOjUCJFCoMenEo
         J6168bLDU24pCyOKCWe0a5s1xI1DN43G/ujx6ZqUqnr1re9w2KXVnWF39OuHw5w9zoDT
         rRQbw62QQlI6FNz74Vu3oGnA4J03D74Iha0FVKsoJHfb4oxYQCyUbxKD8sw3yv3FEy5d
         uVpA==
X-Forwarded-Encrypted: i=1; AKwUvBzRL3wJXPf/awPA7uC7j6QAAdPO/z+r3vr+U5UxX1eAYrivaivRhXnpGqu/u0j6BCERnK8oz30KmjdkmxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOiFYzvoQyPcQ8UUIcbBWG7Ba7AoyR68FfTTox9Vruwvs0z/4m
	/w6SqhCXiaOQQxciP+90mn/+mlQSPbmOajahsG60wRqdNBmiavOlOERGPQ+0Sg5N9DugoDhmVKE
	Tn/SVd66xC59Ks3yYlFhUw4+PaNtozkI=
X-Gm-Gg: AYBFou0A63Ol7M+cGm+Qbnvtg3hyl7npw2i0uLjVP6PfbDhoIjvL8CllXtLnuHuFS/t
	jAAS85qTLfwl1OXlrXVmWJzRDbKgGMtvUZ+KkT4APveoP2dw+p0XhWAJOtsbDfDEvyQPqcsGZNQ
	O9voZSmOEYnhL1fosbx/lhF4makq7fKMq4rm/elKWZCgJUT7SfjwFFTHrOZcanahXxn1wXpioFS
	n8ilJN2rUbf1TmRdRFfX2DQsCeb3bMKNLXPLsGx6i9DGsczWzg++F7b5mB2oxArxxiccSW69FI1
	v0UmIBu3LZBKoZf4hD/LoslCmpHz7ZmB9y8TXv177SQxjozlv5j5494Rrvn5QwYKH1jQfvUU9Z4
	ljVtDih2rdEcx
X-Received: by 2002:a17:907:5c1:b0:c3f:8c92:3b4a with SMTP id
 a640c23a62f3a-c419df3e37emr689197466b.8.1792484551834; Tue, 20 Oct 2026
 01:22:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
 <CAGsJ_4wnuQhyCkMq1Dub8HgB+uYAjy+LkgBxCRJG_kZiwAxA8w@mail.gmail.com> <a3d410eb-e7ac-43e3-bdb7-d00445cdc7d6@linux.dev>
In-Reply-To: <a3d410eb-e7ac-43e3-bdb7-d00445cdc7d6@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 20 Oct 2026 16:21:53 +0800
X-Gm-Features: AclHuK82qZWD01jLYGYlE1KkBrPsLWu_FaSyfHwoBsRgP3V8VjafyDQseh67aSk
Message-ID: <CAMgjq7BEC8zs6St1QCXfjONypUWu4yqKK8O65bzuLcNnAvghhQ@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Barry Song <baohua@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:28=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
> On 10/20/2026 1:43 PM, Barry Song wrote:
> > On Tue, Oct 20, 2026 at 10:36=E2=80=AFAM Ridong Chen <ridong.chen@linux=
.dev> wrote:
> >>
> >> From: Ridong Chen <chenridong@xiaomi.com>
> >>
> >> lru_gen_folio_seq() computes how many generations below max_seq a
> >> folio should be added to, but stores it in a variable named "gen".
> >> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> >> seq % MAX_NR_GENS, so reusing the name for a relative offset is
> >> confusing.
> >>
> >> The comment table above the code also no longer matches it. It only
> >> covers the PG_active and the final branch, leaving out the reclaiming
> >> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> >> although lru_gen_folio_seq() never looks at it.
> >>
> >> Rename the local variable to "age", redraw the table so that each
> >> branch maps to the age and seq it produces, and note that the result
> >> is clamped to min_seq[type].
> >>
> >> No functional change.
> >>
> >> Assisted-by: LLM
> >> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> >> ---
> >
> > Hi Ridong,
> >
> > The cleanup might be right, but this part is changing rapidly
> > with Kairui's MGLRU-FG series. Maybe we should wait until
> > that series lands and then see if this cleanup is still needed?
> >
> Sure, I'm fine to wait. Looking at MGLRU-FG v4, though, only [4/17]
> touches this function, and it mostly adapts the workingset checks to
> LRU refs. The local is still called "gen" and the table still leaves
> out the reclaiming and "can't evict yet" branches, so the function
> stays just as confusing after the series.
>
> Or=EF=BC=8CKairui, do you think this is worth cleaning up? If so, would y=
ou
> mind adding a patch to MGLRU-FG to clean it up, so it doesn't
> conflict with your changes?

Sure, I can rebase or add this patch in next FG series, BTW for the
comment part I left some review reply, I think we better keep that
part simpler as the if branches ain't too complex to follow, repeating
it again in the comment seems not helpful. How do you think?
