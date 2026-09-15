Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3B449B0C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500939; cv=pass; b=pMz/ni36tQ8WUImOeUSlAlClmPvAiL8M3K4Jc0D9phFHDgLOKB70DP4z3L/96NArG++//HAIFjJfSZKD6w4KCqj2zuoGGsudYdMz6aW2Op9W1jEP0qerPqadsPpVHELv1bXKe38i/K/h4ry7yPH778StpKhTuLrV5zj5/h5ygWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500939; c=relaxed/simple;
	bh=9iP5wCDaS9EpQ+gfjMA3+Yk2v+5OOuRQACmgXFd/pac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccx4Adf/b6VXIrEK6e81aqlybpD7WkFQDODaU1/5giRTkvrnBrqzXORJTE2GhduJC2eY80995cjdaQVb/b77qSFjAG8FQcTb862vyVKt5y5XbC3zF5+1UKApnCEKGL/Pzw2+EvyoL5JdHvf/nzpxFbmV1i3ccJCTwByk4nzs73k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YOJyBI/H; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YOJyBI/H"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso2303151fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500934; cv=none;
        d=google.com; s=arc-20260327;
        b=cGI0A5q1gFlZHnsjqI339BmITW41IORHg2XYpV004HPzfOoIeVDX9e/ZUeusBcE+y0
         n1Fmcb+FfvTh7WgS94iZPqL2E4aPfwPbWYr741yCDhsdi9Q6f1Y3GyunjzjAnjZE9ITD
         C6B0sOTO0/vLTbq05AfV6NcCk98PqMx03d3BMVEH5NejgdauGsYTngkZbSNVH3/GEoy9
         vuk+s/g0hckYVnkjZT9YidqrARYq+5omM/quaZdDql/EMGQAiGtv2T+EB0Udh0RPUrbq
         O4BEnrA67n28Nu+CT+0I9klVxYW43LEK+ituJVV69LzmVDvUWi3DXea/RQ/6zPrB9MN/
         LlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        fh=wKAHHY08Z3+T0bVDgGKGvXZ2AKJEB/PflVuFqhtThHA=;
        b=r9a73Yzy4X/bvCPBGS5gaRGIztXElhWmDkO9nrG6hz7250lWLMPGiKg/i1gr2yGSCb
         T4QzuMwioWOS7efdphn7r8tQh106o3Q1CAjkqcusIYUMAzw6qwkSZf88f4k4fVw5P3oD
         TnjYgs0gqXgPm06Om7DUYE4asDpOifBsZokELxma7SRaD7P49U4Fiw9lgwTEtMJfaK18
         YNqe8UIp2pHeBckuSa4ytMklC1OqnTBNLrTn8iswowTeaOaVEuras9XbrC7W2gLqnv4Y
         aQWUgoTGd3m4lpq1QtISGZJfptSE8iWOq00ZPj66G99/zlvGB7j0jWCRttXQbj9rEbL0
         FG2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500934; x=1790105734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=YOJyBI/Ht21acNqjF1TCgtq//JfEi8GDdXUUm6NH2onhf1B+QgxuPDme43/lT7bUDR
         fdHeZywLOkoLDp0I/BzWmRgK+fPga7xHN+NQb1KQxkyL0OYvZ8vEqpeCwnUs6zi7Ou0K
         I+bvymGQ0xY9/w3vHUy9UL0ttMRoeYKszjcZyuP8mRUFFtZvwaWoxgsr8jXIXsk+DcV2
         OkNpXbK6I5+0zzMSE/n1WU6ZrYaoEV/G+8fLBeiWRsFPdyPoJ4zDP5sxkYr5szzV7KqZ
         XX+aFc12ln2KgIZZD14o1DwTG5UHOdECn9yiNpj7mFUqyp7p7xZzm3HpScvWyq3yexrO
         aWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500934; x=1790105734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=QTWc0/QbskkQ0fMmaLjB41uE3v1/F4GQYNMxGQXw83cj7y9B2SD1UxLXogSPNiCEjF
         RsFLHRsLQy4PecwMavUQ3Hu4YcjmMK/jJ2gLCR/XMLYqegSSMH1JO6S6RIr4fr5X4EoA
         qirC13m0KgHXgWO47X+cPxrLDZM+esEl354NJ7zBkalh8s8jpXPsQhEZhlgwFBJ2WARn
         imZHg7/Xw08GjI9km1KfCA4svZ4ksmUlgw4W+SI+PNrl8RDKZp55xv2XfRjMWtB+YlsJ
         +eUy4PFBSvibZiVJ4Mi25R6o/URItbAl9ZEvHboTwZkEG+SciULKeAmzl+pgp8EFWsCJ
         qmMg==
X-Forwarded-Encrypted: i=1; AKwUvBw9lbp9cdFmoLmBYULAwtgHdROI46nsDkA3ImHiKB2yrKcq1pQOxqyoMiL8tpEHg2J9HeTb1Gyn1hVvTKk=@vger.kernel.org
X-Gm-Message-State: AFuF++kbdd+n4aFdBwhHFKyk9guVIeGmLNrsZ+B83vgWMcCdl1GBJdH/
	F1hR+skI6oNLgtSn1MlwBlIjXW7JIhr5GtMepp+FknM5wD6GUEJE5YlTrOIFSd4F/YUHZO7LrMO
	swzO9sFIcg8r/6jq+bcryJDEAZWqnA48yzjmLLp2PARDRrCZezAU7JQT90s8=
X-Gm-Gg: AYBFou0kE6Ci/xG+eQqVkpZ+z5Mv74d3y9u0xgvxqc9I5gKlMBWAkb/Ze8dE89ypaLJ
	Fy3rtS5MLwfKaoruWriLsChjDGYssYL3d2198Ouixlpv2n0vGCESYCdMWsYFbIv6SdI6B2ydgmv
	EEgxjnf2odpacn6aF0pL76jEoQL9AnQxc46OfhNhcoGMuBAGTjT7yKJ19zG0ZGt8l61GYVdBtsS
	gyT+uZOeoAb3X8JkkodWQdHGu3s8+wFsUD2WoCuCVAuFBRfCCQd7M6FDqB6sEsW2H4Tvz9bqq5I
	usOj7H8r4Hv/XDzrULhR0ZuwSPfJ/9hww/rfJQGU9LE84t376brhseQt84Ol0aAg
X-Received: by 2002:a05:651c:a114:20b0:3a4:9e46:235c with SMTP id
 38308e7fff4ca-3a5c89b031emr21060911fa.14.1789500933920; Tue, 15 Sep 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-8-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-8-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 15 Sep 2026 12:35:22 -0700
X-Gm-Features: AcwNN1VS3YvKKCCRg1vDnBVkoWj-7p2fofNqSox_wrQ014s5kEA5YUvjF8gr3LY
Message-ID: <CABpDEukTAc1m=g+rZRPPqaTwrvhUJPsFRWpFd0PxZsyWw5mR=Q@mail.gmail.com>
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +/**
> + * rmi_rtt_destroy() - Destroy an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: RTT level
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + * @out_top: Pointer to write the top IPA of non-live RTT entries, from =
entry
> + * at which the RTT walk terminated.
> + *
> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries i=
n the
> + * table are in ASSIGNED or TABLE state.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux erro=
r code.
> + */
> +static inline long rmi_rtt_destroy(unsigned long rd,
> +                                  unsigned long ipa,
> +                                  long level,
> +                                  unsigned long *out_rtt,
> +                                  unsigned long *out_top)
> +{
> +       struct arm_smccc_1_2_regs regs =3D {
> +               SMC_RMI_RTT_DESTROY, rd, ipa, level
> +       };
> +       long ret =3D rmi_sro_execute(&regs);
> +
> +       if (ret !=3D RMI_SUCCESS)
> +               return ret;
> +
> +       if (out_rtt)
> +               *out_rtt =3D regs.a1;
> +       if (out_top)
> +               *out_top =3D regs.a2;
> +
> +       return RMI_SUCCESS;
> +}

Doesn't out_top (regs.a2) need to be populated on RMI_ERROR_RTT as well?
realm_tear_down_rtt_level() checks next_addr > addr under case
RMI_ERROR_RTT: to determine whether the RTT is missing or has child tables
that need recursive teardown.

Thanks,
Alper
