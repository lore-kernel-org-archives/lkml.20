Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794347442;
	b=SbadH3nMBpQwRPCIAM7YU882ilkFBJk/HQbWV/YfXLFs0/+mylvAJRpbkOx32oShOvsM
	 d+nGbooZn5waoDf7f4KAAdx36OFnT2wzXuOlFq9GMk3rCr4uWRW4HHfcyGNKcadLvvF1g
	 m7gIa4bsV5UNi2EJEDIRB02yKx0W3VSK7e4DwbrfyvzrS7gYm6Ipcpb8oMJOjuwOlDtjl
	 JHRWSzmHb/uiI4hsM4a6ozWSoAhmmoM5kHpU2p4LTFZ5pYqVJABKIskvIuW249ON7Kyqi
	 87sxNYyhb75CY42GPjxsW4G0D2i8sM5V2LSKu1ZGk3xrYP1abg0Z/WyKWcYPTibgcZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
	b=NBhw2lSNWbmB1JGvQbbyBHcMmldlA8yFiZvNF5XD5PXrggPJ6/YJjTmlUVrPkUDOL6/L
	 OSOTGdR3qHdMj059tlBxh0jf75UaRUwLi3Vjf8yOLGGFwkhQqPlkc26Bup2b1yTZa/t1o
	 /ZYUO72x7v7FWLASo+n97pKWxnD307EeVndlgwcWGrMvJT4MyBE6UWBJTcD9SOUCRY127
	 kf2EQRuF0Zi8FbrwAS1JdFDxCwEulJWgL9V0+17Cmk6rmm81GP2BvQITlgagm8DAf2Kr1
	 GAn+ijgEXDvJvc8QFCWAaUVMAUZvEJdzXfo2jWq7f4/03YaPvEwiSk2Xn3OegTw1/Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jEvknfzn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jEvknfzn
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c504bfd7393so195836466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347440; cv=none;
        d=google.com; s=arc-20260327;
        b=ebdOfoTzMIlBVV/leFrUyuYkymXmKuwha8VmDEQSJ/eNXcLbwQJLfB7/IyO+vYF0kT
         9XGAX5DjG5n6RWRdZKWu18auO/CJqFc6FhF7ecIC3kGLQmcoISu0YxNNSPULBafcPTxU
         dNYL2u2PpHxwLG6xCUFVLMYqFKGglpu49CengsCj+aoOr6ktECoStkI3tCD/AB7bSJ15
         jd7p8vo8e/n/M7NWT9VSQy/vnQDVwemiySy0jzvAL166QFExHGuV7vhjqmrj9g6ahk4p
         svS2ySlKhNA7DcrTPioKeRFgC4DWrF+GJJ+zIqEAKF/fy2nTts4hMeiiIGbe+y5DTA+S
         7gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        fh=HYHuV+YrNFq4xCVtFxHqyymtxb8mQSkjqFNErG+ucB8=;
        b=VwYPMbKbRIJRToizuE7St4W/YyUXWKPHfc/Gt/uyI7Jr9dADSd1UVwZFniWGD45oFa
         Ei7uC/T92h5aAjpNyMlwhQe/zXOcFIAgR7RglrVQYijsWJ63SmZU9eS01srm2qAQ5C1x
         MTZVG3Mw9E5ixmdBA2cJmgV3jyrT1qITyGx426sJzDrWnMjLlD+FeuW/w463e2pAVpxE
         hndiG2VwC/AWYSvqJM1tEhZafHUrrCPirDwcck+CsiRCEUNlihLQvU1sVBaJ+yAFInWP
         vHdO2yGPMLKyX7ckpwDbAwoofM1mHt5SZ8gSbbzniR4UkKxCtZj37UZQhgq7QAbXY9ni
         fbNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794347440; x=1794952240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        b=jEvknfznPxh969Fm0jRMgqcsr/CgHnAE1mRCqsijfDuOq4IDEnZ55OqI/ecZ4qmuQ4
         J/O7X0oYuZKhUXmU+KLQNdPuRyxDQB9x0UBbgZn2dJd406CFqsh4QnUtQbwEZTM5xKif
         euMeLSLaaZ+B32wrhrmQLh4sj9G0jSyDpLeZyqgXFJEYv4xVL6ZbbMWtZhajzjwnQnS2
         99/rGIa2p9EKIXMhrq15WVYbMOAKQUFwgNrPbJTr2/vbwXG3YuU44fKglWtQf7OxBMis
         PXG6SjUK2ocI3rg6hV59YEcA0MRsdbRwDjpVibQmWOaV2n0K8donDMwUVPTdQ5fU46Jg
         vvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347440; x=1794952240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3u20IW39Ayj138ZJ7povoBycZBaxSeSoBrzGBgSB34=;
        b=UwqFdmXqvibzaRuOcQ0JB57PvHK7GKDoqKDGG8bJcJC1+Ggq5yUutJRD1hJAYCapF7
         u6SyEM9R1CVKSAvZhKkmDdLHX5eNP9BIOSnSh2WFujbYH6NvUSSBjeNkagwTjEBt6C9W
         RzodUE6ROFV5gfqYMFkJjls94OwnNeHrZrwE58F8vvaCgcoYCXFqwJ2RTheurS8Bg54w
         Qjt1iqfxkYdY6EPvsJBMgVnBFIUwjfubEolPBVBjXuXjFZ0zqlZNIz5TS88fyOJdr41M
         T9/yey/e62mb9uhkbdGo3L0G8kOlw9ZuZgqgZfHP1XGe5oKAdpMcH+B/NVuuvOC/nejJ
         giPw==
X-Forwarded-Encrypted: i=1; AL+hErEf21Qdmby3M9Dp3maTpfYvGWPp2KPAm5QykigGXa8CRc8BXn7Um6tgXQr/dEFWsMZ6NCjEAJaMqjHGCtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q0uBlqxORqwtfyUMr+tMyVxhyKnNYTITlr/uYlHNDvWRgUDYQ
	RFsG5/SZrKXmcehSRsBrU8ydroIO1O+sEqQPPvw1CCkLXfF8kMhrIGEGcSnFMzaF4JPIm0otAHz
	E/uuLVGFC/5Fa5EO/Y6LA8oZ7I0AL4MZf7GfZ72g0
X-Gm-Gg: AYBFou1MhPTC2+SH8/rZEv2U/jNz1I6CFo/aj1xbKeFKyGFtsyXpEY0CoJcWyly0B3N
	Q3ryPGAid2iuBvyjH/hJIK5Gc+epJ1V8RkTWoBnPcXxm6cAWrv3ktDfxsVefvr/oJOxkuLhAebS
	O8EA/5vc7gB4WDAiwSqqlPMPvojRfMVxxcyCMC+c9lFZJvkHRSt52RQ++77mxBS40Lj/0VvCcfF
	v6kf22CdbpkEKjAch/jSz2chUSncD2FLIpI/Eglf7melctmf4f60In/uGWpjnYhk36PNKk+8+4T
	EdKpK7V6pyuMxj9KJRc7uaAt80tRfb28ORA1BQkGAXknlbkEkKNvhH08ofhOCvzMHx/yrC467Mo
	TpHRupMQkErMsq9XfP/1It5pEdZm5O/Tt02CU/q9hSqU4bVWs8g1kWb1S48bs3nv91rnC/ksivs
	ydc7k1vNbzmPgo3J3AocJkywVXqI89XJU+zq8PZeEpPmpO+xFxlzYNUHke/H8zLU+M/TAMrLSzD
	jFmexwxg4jKXEnv8ybgkz3F5PUYSw==
X-Received: by 2002:a17:907:a805:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c5066d6ae19mr29991866b.40.1794347439526; Tue, 10 Nov 2026
 13:50:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-8-jthoughton@google.com> <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
In-Reply-To: <2122761A-45AD-4AEC-AE88-B51E92E2CA40@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 13:50:00 -0800
X-Gm-Features: AclHuK_v1agZ1dKpXc45zZ0c0gP5C_c2fyQg4NGg-Zs5GxvQBSCvkFuzEUTM21I
Message-ID: <CADrL8HWOPP6PLUVvL+v0-UA6YMG-o4p7dY6UmWif1aDCDgscoA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch
 doesn't support HVO
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:02=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
> > architecture lacks support. This serves only to avoid confusion for
> > users.
> >
> > arm64 support for HVO is conditional on certain hardware features being
> > enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
> > all secondary CPUs will have started, and the system feature set will
> > have stabilized, including HVO-through-BBM, which
> > arch_hugetlb_vmemmap_optimization_supported() checks for.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb_vmemmap.c | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 8596a462fee6..817ce39d4cf3 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
> >       /* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct page=
s */
> >       BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
> >
> > +     /*
> > +      * Architectures that need to probe CPU support for HVO have done
> > +      * such probing now. arch_hugetlb_vmemmap_optimization_supported(=
)
> > +      * will return the correct value.
> > +      */
> > +     if (!arch_hugetlb_vmemmap_optimization_supported()) {
>
> I'm wondering if we could put this architectural check into hugetlb_vmemm=
ap_optimizable(),
>
>
> > +             if (vmemmap_optimize_enabled)
> > +                     pr_info("vmemmap optimization not supported by ha=
rdware\n");
>
> then, we do not need those code. If the current kernel does not support H=
VO,
> then the sysctl does not exist. It's already a common case when the size =
of
> struct page is not power of two. If users really want to know whether HVO
> is enabled, they can check via this sysctl file. Therefore, we don't need=
 to
> print a log line.

Yeah, I can put arch_hugetlb_vmemmap_optimization_supported() into
hugetlb_vmemmap_optimizable(), that will make the diffs slightly
smaller. And yeah I can remove the print. I put it there mostly
because it can be confusing. A command line that gets you HVO on one
arm64 host might not give you HVO on another arm64 host, and the print
would give a user a clue as to why.
