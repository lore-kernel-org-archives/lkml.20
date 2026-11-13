Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546107;
	b=0ATVsL7+FF7Fa7s15ojiDIiUj72jrAcAkrLHFB+U8wLJ4H5DL82V+Go0T0phlj9vZ5NP
	 LP7CvKGWW59TchV57LIE7K0bfG17PAyKXYFtL5iLsFuJxHosep7xJOuNatDiNg3vLeqyO
	 CF01uiIhF54gdwIUPol2JOV/H5Pbt0lUEdDo4Y2CSj7dz+8gTcSthWz/J/5dN3RR0bi7h
	 Ro5Tbb17r3/J4Py1h7MvKxEX5nyPmXeRN2sCH6XXxlajxrw0gDCNWo917cwEI5ripX6YT
	 hvtARL80jTEOadIyMqzy+F69zHfklAimZanwixmcMvpgqrGwte3FGrUAXq6VVn1FrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546107;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9AW9CjsrWOUjN/UAvPMW3aqbxmgaglM7A1wQ9TO+c4w=;
	b=Src0KuQDsBypv86jfucvQPUN0qpkw9hhkr5A8cyvUq9pzMCdhh2ILBeu5/JGcIVvgoJs
	 ibI/B6aag8t8yfPseiv6pDVKVJct1cLzE++5AuAYOfK2KjXIbupyVlExKgP9jMS1XNdka
	 CdOI97Hu25D9Bi4VvH+iUjUouBH00oue7oNZHlNhXBwsEklx0yUekKGpx4jVCScr3wJAB
	 GJQPy2KIfzSh/UyCJjbGtU6AftFYSh7nmss9akzNIiGMEPOb9kfyyvrVyS8j14C8Rk4fH
	 azaE6x6o06TdW1oOh6wYLli8j7Ri2Up+Sv+grKqdxmO1AFFgw0Zst7lPyGzxuce/S4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPl6cncC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPl6cncC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985491F000D0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794546106;
	bh=9AW9CjsrWOUjN/UAvPMW3aqbxmgaglM7A1wQ9TO+c4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jPl6cncCx4PXs8iU+t7ZVtchhZkYOtmMuTjAD+cAubn9jIf2CF3giYVgp8+H2N3z1
	 Fli14Cp4kTr5cA2XRNs25VeNNisaEsbSBjiDY9EgA0BAIQ+20AksXrQT0qhTiS3LK6
	 moG8hP5OCl32TUDVHp4P0N6SAIhb1zJXq8HyM3mINwukfQzuQJQPATqeBsZUAkPRv8
	 ZUSjKMgrg27trBFQ8/sKK1kDbTOATfT/+7tLzNbP3mK1G2EEg6+acJqB832r0L3Eoo
	 YticRoSc5dgIYp1Pff3CD+Qom5ik5mQ1APsCCm2vt2Gl9q4ltUWNgkTS04w/TAAx9L
	 tvewe9MBFaLpA==
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ec2d42231so11957746d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:01:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjzN67/KZPo6yjoOo5MTKf77b+u11KwV9kQV70XZGtejocx0ClJxEzVn7U0nJa23WmZPkNTxvLAyiNxhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EqPuep83kdQFrpALu4VMXpChj63LZrsX3yqUoSF8vgyvU3n/d
	vdvxYUANbXp4ss4G1cJPOwNYsOQBcPyAYMTwR9dQkwGV6fDIlcXmI9YLYBsEkF31tl3LvMAHEwZ
	H5ztr+cKqdM1aSi8Mt1S1Ny98+peU29o=
X-Received: by 2002:a05:620a:2903:b0:944:1f6b:37e1 with SMTP id
 af79cd13be357-9494bad0b65mr255979885a.33.1794546105743; Thu, 12 Nov 2026
 21:01:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 13 Nov 2026 13:01:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y82CKoLx=HC8zUpHz+qwT8sNHjqT0bbrfLuCRYrWR1iQ@mail.gmail.com>
X-Gm-Features: AclHuK8HdvCcqCC5av5V-jbmYvBsxzAXNNzsR_76rBkzpQcdIzOCeoFv-Xbo6SY
Message-ID: <CAGsJ_4y82CKoLx=HC8zUpHz+qwT8sNHjqT0bbrfLuCRYrWR1iQ@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: use pte_table_clamped_end() helper to
 calculate the end
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, hannes@cmpxchg.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, mhocko@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:13=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Use pte_table_clamped_end() to clamp the range to the PTE table and VMA
> boundaries when batch-checking young flags, making the code more readable=
.
>
> No functional changes intended.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Based on mm/core.git for-next branch.
>
> Note that this was found while reviewing David's series:
> https://lore.kernel.org/all/c31cc8a0-c098-4784-a843-f13f51914094@linux.al=
ibaba.com/
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 5495d9be90e8..804d4188e7b4 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4470,7 +4470,7 @@ bool lru_gen_look_around(struct page_vma_mapped_wal=
k *pvmw, unsigned int nr)
>         walk =3D current->reclaim_state ? current->reclaim_state->mm_walk=
 : NULL;
>
>         start =3D max(addr & PMD_MASK, vma->vm_start);
> -       end =3D min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
> +       end =3D pte_table_clamped_end(addr, vma->vm_end);


We don't have pte_table_clamped_end() in Andrew's tree yet;
it's part of David's patch:

https://lore.kernel.org/all/20261111-pte_table_clamped_end-v1-1-2dbe339c487=
a@kernel.org/

So we're not going through Andrew's tree for this patch, right?

>
>         if (end - start =3D=3D PAGE_SIZE)
>                 return true;
> --
> 2.47.3
>

Thanks,
Barry
