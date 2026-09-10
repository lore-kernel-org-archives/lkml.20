Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230941D652
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059756; cv=pass; b=QiLpzde+Ss+7uGT4BvEgU64iha6dx6OvgA51HrF9D3osWHz0x+J6h+POopuKho7P64HFfNJtLIlmlfStJsaHBxB5nbmCXNl5HIr+qxifKDQfvH7TWeZVskTsVMwGy8no6ENQXqmnQiM3/1UvtraSYq0p4Sy0qWMPlExHCa4vO9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059756; c=relaxed/simple;
	bh=P+DLIY6UxOqANj9LNama4Ax3pwH1auByUeIWevB5eqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INXeGm1WGBBpeheZz5A+puQ/nzTJROBiI45oDUtzzO9GvQ+lpFid+82RMAj3eHUtlob1byupm9KeNCX8aCBCbWqQHtI/eYv8Ph8bwqX2cQZk4EmvXW7kD6HFM8vqYZ4vI9iimkjJgUaMNNP07UOK/VPPRFamp7lDoBDbmKzu0Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRYVyIwA; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRYVyIwA"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso358821cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059733; cv=none;
        d=google.com; s=arc-20260327;
        b=joZOpNgC7/D+77ufvawjIrbNE2CLYF5ZRI3wz/gRX1tNgGathtlfoAhSWypG2RLfgm
         nuWJMac5hQs01IlRHB0iwenS7Bp/epMpV4jC8SzGY+fiSpBXG+e2Wcu3LyCBGYPuAzlp
         Zw+ZQYEdAAwEmsMJhFBTKO3iuZz6HqQYo4qEVzP+14QnMc84tcpNtL5+wjbpvu/4pNY+
         hnqfDOHPowSAVeSLr1v8/0GcCzC0SCBYHL7Ojf8jowyvrbE432sFqELL+MSbNmuHK07O
         VKnug7hQDMyppigHXqApd/AYXLYoaxlpH1RDPFPGxZNvb55Rub2UB/b8oGxp/76Armey
         VVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P+DLIY6UxOqANj9LNama4Ax3pwH1auByUeIWevB5eqk=;
        fh=Y1ZpU2IK5n4dV5le5hh+6te5XmzVzljsM4dghZGs35E=;
        b=SGosByjSexZdB9ZY4f+Cc2lhv3VYl22IBHeL3ENgisnuiEMfoWkoTarB/JzUn0j6ur
         yPNt72hHqQz+YLLhf0nX71ILZfkNB3CmNmBcO4aYoW1LNtt/KJCECyuNtu9UyKBo0wSe
         wtJh40dmhVFHMOKKeR1ms2vxOyAiqXeqgBQdnpa1RvM6AgledQAppz2hy0u/thMOev4b
         KLevMhlKt2XirNg0TTBjVogoYSNX6bjUDZaJgHjxK38bmIJCMLeUceEosV6hYEsZgMsA
         CjdmI7DCuMamQwVBCdDlxgNxUSajFZkL1J+whykCV9Wo6zLKmQ9k7gqSj7o720AGOjc+
         5XZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789059733; x=1789664533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+DLIY6UxOqANj9LNama4Ax3pwH1auByUeIWevB5eqk=;
        b=dRYVyIwAVyu339djamiEiFX4SAIXxUXgS0xgDqPFc9GDmLwPm2fdxSsw5yF2LmTSfi
         +w7kQDvYxPrZLK/kJZ2ViksLmSK5vXi6f/SZTX+u/SZuOru6XbR9puXrIC1vLL3W9wAb
         BbtBvy+rC0pdB0R5mRELbzL5BAriG9Z0nmuIPpkAsqbtmZlB2nkoPvXqgvO86lAtBQCl
         HKQ7ZSi0tW/HgKzUTEm6cvevMfp6nsXggQaYaisjKqPA7FCo9QWKupc96/KLb128NvRd
         BirQbKKuVgi7a9lBmnrVjBTb0KHfWiaJO6ZHRqjUDO++nAyNmR+/DMslHsyCMd1nRRTp
         K+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059733; x=1789664533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+DLIY6UxOqANj9LNama4Ax3pwH1auByUeIWevB5eqk=;
        b=HpnnxRHZLzOwIGZ3gWbiF3Km5VwWvbe6Sa66DigC3dLaN2ZYWcBk+u5WHlJ9cKto4K
         M/6MmKAK339WHXPE8nQBPbeB6GYAm/o+UlH4Ks/paJTR7ARRXDlUUReIY0FZjSA0hYfl
         +xn5Ue4AcC7mKoZmlrZoRc1gvgD4JAuPWDuYsn3FB+T2YxTEsnmyaMiLbmpXNctmDSA0
         5Ehp7L9VFxcrr1N98z+uc8jCy+u9Qf1ONWeKTPjhdA8bj8XYGfgRG8JbvDk1fjs/1ukV
         FO1mxwSZhuknYRJy6on5RrLmlBuwwdk+cx2ikIwmSuDmm+byRG05Ulb2bu9qkQqBWpoN
         6y4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBOK6nUO2SL5NJnoJlU+YuktCSnhFgZ8SVIPs2YxaKRxs1Wukjw8gMGSghaARrc3CTQjMNbLiPcHYzZBU=@vger.kernel.org
X-Gm-Message-State: AFuF++nDYx+/4nJ0GHrJd0yGS3kMw6zRXXCc77+UmmuSMWTy/ZVlOv2G
	5pWWuG9QxD/6U3TQZ9EqjMFBoPpqhBCcHrQzcQjRtSlpXjijFeJ6HQvt3KqXNH5qJXOWDxcLdi3
	qTaQ1Ig8dC3kyc9jFYjfcVsBi3RXTazA2FLO0Yv4K
X-Gm-Gg: AYBFou27sBdKij4maCu+33dJOORkH0/Ig4FHrGrZgzXwWcT4q+8lDeiCIhGBGy2Flph
	9cYZYZ4kCbywQ9PlAKcpWHwd9h7buhX9HALLgmKb0zKVuOapz/2mWyN4kVlk9IRCv1Dyoheaxpo
	RoyrSTzoB4h6iJfJ54Wy8ns3Sg0hFIxeqvSiECoK7CVQTOZJgUYglYLBliMRC7TaLGcOkAopHIV
	uOBRIsRFBTRUW4TRmtTIGsU8w5oO0hFAALGK5xSezG/65Wvpu2A/tSlt3o4k4XQrnYbRSGOzN2S
	tVFPBU4KIp/t54nTSgf/ByyuvDk+r8InTIAQnq812+FEtkdOIJDPYl1F3WPdEMKAvUv7yis76Dw
	mzWLXGFrGcw==
X-Received: by 2002:ac8:5750:0:b0:52b:806e:2633 with SMTP id
 d75a77b69052e-530b601f181mr19081821cf.1.1789059732422; Thu, 10 Sep 2026
 10:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org> <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
 <8e643f51-a47f-428e-9443-678326288fa6@kernel.org> <CAJuCfpEYdj=u0wczKRrsB8uDkbSzPy+hrsCo9TW9-3J3r3p0xQ@mail.gmail.com>
 <2336140f-c993-467a-b2eb-e99dc9427a59@kernel.org> <CAJuCfpEL40p+vk6-km6_BBuE3+YY0WqkpbvQnQGFEo_73MAomQ@mail.gmail.com>
 <9e48cf7b-1700-4a85-af83-8883789ba87b@kernel.org> <CAJuCfpE9_1VYqHp6bctUEihSW35TaTw_LZuOGP2UAnF7SA_UAw@mail.gmail.com>
 <CAJuCfpGvi10sibu_=cE76h2O14WA4KNOd1vARu0r1CYmAiCMEA@mail.gmail.com> <dd134a0a-8fe8-4990-85f2-7b524754b451@kernel.org>
In-Reply-To: <dd134a0a-8fe8-4990-85f2-7b524754b451@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 10:02:00 -0700
X-Gm-Features: AcwNN1XzTzo0tLArJpTqgDsm55TNkm9hrEOzHQgtAQph4QFYlsjRry6cHR3SJSA
Message-ID: <CAJuCfpEN-CWLh__rpzOHaSOpb24ikR5_y=yC_Aqyo3BScq=_RA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:33=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 18:21, Suren Baghdasaryan wrote:
> > On Thu, Sep 10, 2026 at 9:09=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> >>
> >> On Thu, Sep 10, 2026 at 9:01=E2=80=AFAM David Hildenbrand (Arm)
> >> <david@kernel.org> wrote:
> >>>
> >>>
> >>> I meant as part of this series of course.
> >>
> >> I understand but this particular patch cleans up smap_gather_stats()
> >> function, so if would be weird if I move the comment change in that
> >> function into some other patch. Unless I completely misunderstood your
> >> suggestion... Maybe you are suggesting to split this condition and
> >> comment change into a separate patch and making this one a pure
> >> special-casing elimination?
> >
> > Ok, after re-reading I think that's what you meant. My first
> > impression was that you wanted this part to be in one of the previous
> > cleanup patches. I'll split this into a separate cleanup patch.
>
> Just to clarify: I'd put all COW mapping changes (using the cow_mapping h=
elper
> and rewriting the comment) in one cleanup patch that can argue why it is =
a
> correct cleanup and doesn't introduce a functional change.

Got it. Working on it.

>
> --
> Cheers,
>
> David
