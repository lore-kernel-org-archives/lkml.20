Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07371FF7C5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319657; cv=pass; b=a7E5Q+SWU59ruZPV6kHqNxeeD01LU3BwETpkqTe5gtq12iXANvdNNsCbC4R7pEqfTJAQM4k7Xq1UQ+IXrKPt9Uq2AX8kENN9Z/ac107VkU8+Uwy+u3fYJRgXXIfZ6fZt+aM4f8xKhZMMyeWMeIdQWHZiIIuCKeP32fUSzkBMIdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319657; c=relaxed/simple;
	bh=yW1j8DeY8ApZV6Ko2dzi4EzUT0F1I7IAr6qbeR25e4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcWQ4viHNphXXMOJO1inpGJmdaEukc4nhexsH8B6g4By7YAvGfLmUCBW5AOqP1vA/jtuEkQcIPH7K5o2IDee5lyTKK/Bc36IMdtsG/FJmhmab9Y6ERjOcLCBYF8kaVGFEOsfL2GtTZC67h+SZUsAa5EtyaqFKYQI2shYh1d87Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjQGvKro; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjQGvKro"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a3ed715so463524b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790319654; cv=none;
        d=google.com; s=arc-20260327;
        b=QUseihm7KlBHaMXmfYxLPMBw1y2qPHq4CWRb8tXZ/lgeGDX2xm6vAAIbfjW3QNT1jV
         1FleznS/plgy1Lm8piFjgOPte6h8xsCjByA2ssgZ7KZy4oSDBmSDHfp5LZVlBomu4Ymj
         JLxW06SDM2vigyGfhDRh7MsBAKEgU60igl5jhEF0hFYWkh7EktTUfl3/r4GqdasXO3Iy
         pahm18IcqjMOK1XYoc+qhuxknmSEczrFPfC6iAn562mKIZnqkjSbCDz22Ec175E/RhO8
         hrpgJ3NjwQzDgaHIkjlxz2Y/RQqcTYVG/U3s+Nf90gJ9tPcoIxuXYulyJ7Fw7y/Q1DYY
         7Paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1fXxaoehIopV1PeW/nrL+gXG87cQGpcsm5CRZuB4kM=;
        fh=2Bw2rAIooDEhxViiezmFQI8qdOLGuXiUgEt6Gl3ieY4=;
        b=PZ97RUe1aOEpVF8CdMv0Q+2E0Ck3qw92XeDpQ5Bd/cojmNeze5AsXXme5uypgZ0t4P
         f2p7Ltit6olcCjztZU+E9PRwI9cAo0KJC7RBfUaBkLgzeNnr6FFZ5w2fIQ16+1QZ6ih+
         5uXoIkVoHvzDO3Cf8ONojhXCK1ai6Q2Jo+goMfOcIBIj1hvYUdgYwffaDb+nObcp8m/b
         LOEL1EdefOlEXb3JCQ2fn6Fp1FpD4E5GW0SJLvfzumo/BBo0jQGeaZ2IY9g0iUEinRWP
         YUseOmPMNU8J+rABNwPZF7aOg49B/DCCjDZAtClsrLNMPdK0iPY+tNfDPJCDAx0N/hi4
         lZfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319654; x=1790924454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1fXxaoehIopV1PeW/nrL+gXG87cQGpcsm5CRZuB4kM=;
        b=DjQGvKroGER4zTPaCXicv/a04cOxxx0hHV/QVmta6kTNX//vJoWdZt1+TRO1bY4jMD
         63OoOlP9Clca1Nm8aTNMlEcB98LFBSLvlO+M54vMlbK0s1HOWMo9nDjI5q9KYbvIW9fF
         dB7J4VAGNI/pxuseLs2aCjZ8erPdsRq8Ehy3VahvZPSt8hIXKk+HnWrDPcE9Aq2+rOcb
         Es6ZftgeiQiO34B97IyT7x+re4YmCC/vmwWwRuOkXP/zuYYmranlsWFkqI9bwa+5crrv
         0z1ZsFkA6l9hg6dQbz11gt5gYCP3tHV7PvuyepdhzG35gH7z6KS1Y0l6oMbYIL7/rhAL
         PqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319654; x=1790924454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1fXxaoehIopV1PeW/nrL+gXG87cQGpcsm5CRZuB4kM=;
        b=JUVEJeKpeqpAQd0eAhBoFsmkfN4QMhwT+FvDAHDes24FNEf0ATI2rcU4iGNH4NWWqI
         2vTFMLon6xvww19bQBy3cHRI7avRjWom5Y0LhJi/BR+3fJCufuVCvLRC5BKIsjdYjYDG
         mN7r1Rnuiy2VVgqGI/zotM4eiresQDp/vefdMJq+mHSZeoSLWHzsmxbc1MsqIy0ClpVW
         JCvlCulIS7vyS1Nejvkm2B+JwH5u+r7X8KWDYCr6c8ADQ0DD2ZMrfYCAWP6JOf8vtyug
         nBBRPalUMoB0KGD7qAUtuIXS5wfEnFLlPZnghHs2JW2jNRPGcmFOklQU5kRLH0Ns12SJ
         lvtg==
X-Forwarded-Encrypted: i=1; AKwUvBxASWKE5MuZ7FXJ8BNtJ66MprtemJve6HafFVQtnGfbshbk13Iu0nHcL9T0KoIYTjo65bKv971EkBS4Bww=@vger.kernel.org
X-Gm-Message-State: AFuF++ls6En18BIS1iJgL97ohLqz7rZxABIOhkOOiCwpDeEbwzxtRudR
	IgdzxfIfNtk0rl/o82Lo17mUxkgeyPMEdxyf5/PaOK8KFTcw+vR2azPofSPCKZcUc7Tj749Yv5o
	bkJfXaWszQele+4elE3XKGjmzjOaXVjw=
X-Gm-Gg: AYBFou20igAwoAEawo3X33IG36+0vhkt/Ug6DGFK6xdNSj3WEQmxgm345VYO3XdpGd0
	osWwFKq4zYVJBOc0+rxCPkT+PADTzz+ppLgBhPBPcH7NjRUnfJ6ofr4ayvuks/XngykA4YKKs8r
	2rHCKiylrmlbMd3wu0BVRfgQ1rYcWOGZ0ekFMgJMgYKZYYkeUVTCDhBLcWXO3ICSqgjTSZ1IJ9E
	x2n7QH4K3GcYu+vaHuGgqe0NNEsPIUHnouxRa4sKWcMccb/XFsK0O2+aBlVJxFfWnw3CWWjUXyz
	+yu7JVl7Pd5aLpuKfHRosms8Nhs0XPiE0CqxVnEF+s/PrCzfUbkLPyVNNh/dYAEoAG4XJB08WeO
	Lbl/gBNCY8lzMoJXAo5dxcA==
X-Received: by 2002:a05:6808:159b:b0:4b9:a829:f01c with SMTP id
 5614622812f47-4d72e16431dmr5142881b6e.40.1790319654501; Fri, 25 Sep 2026
 00:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924053121.17703-1-yupeng0921@gmail.com> <arS-38fE5r638g4Z@slm.duckdns.org>
In-Reply-To: <arS-38fE5r638g4Z@slm.duckdns.org>
From: peng yu <yupeng0921@gmail.com>
Date: Fri, 25 Sep 2026 00:00:43 -0700
X-Gm-Features: AclHuK80rKmiL3-JKRQwzW_6XT8TAtbFUe0xI3YnKDyMTZWe3I0aCFGT4xVZq5g
Message-ID: <CAG3TDc0DZs5+E1tEBCn7uQyWJwZOY-brXBKTx8fBCy3HJqaqiQ@mail.gmail.com>
Subject: Re: [PATCH v4] nvmet: add cgroup_path to charge namespace I/O to a cgroup
To: Tejun Heo <tj@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Maurizio Lombardi <mlombard@arkamax.eu>, cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:10=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Sep 23, 2026 at 10:31:21PM -0700, Peng Yu wrote:
> ...
> > +#ifdef CONFIG_BLK_CGROUP
> > +static int nvmet_blkcg_ns_enable(struct nvmet_ns *ns)
> > +{
> ...
> > +     cgrp =3D cgroup_get_from_id(ns->cgroup_id);
> > +     if (IS_ERR(cgrp)) {
> > +             pr_err("failed to resolve cgroup id %llu: %ld\n",
> > +                    ns->cgroup_id, PTR_ERR(cgrp));
> > +             return PTR_ERR(cgrp);
> > +     }
> > +
> > +     css =3D cgroup_get_e_css(cgrp, &io_cgrp_subsys);
> > +     if (!css || css->cgroup !=3D cgrp) {
> > +             pr_err("the io controller is not enabled in cgroup %llu\n=
",
> > +                    ns->cgroup_id);
> > +             if (css)
> > +                     css_put(css);
> > +             cgroup_put(cgrp);
> > +             return -EINVAL;
> > +     }
> > +     ns->blkcg_css =3D css;
>
> This is really odd from interface POV. The user specified "associate IOs =
to
> this cgroup" and that can fail if blkcg is not enabled on the cgroup. Eve=
n
> if it succeeds, if blkcg gets disabled and re-enabled on the cgroup, the
> device is still going to be issuing IOs as the old draining blkcg.
>
> What the user can express is the target cgroup and the IOs should follow
> whatever IO control that specified cgroup is under at the time of each IO
> issue. Currently, cgroup_e_css() has to walk up the tree to find the
> effective css for a given subsystem but updating cgroup code to add e_css=
[]
> array on each cgroup to avoid the overhead shouldn't be too difficult.
>
> Thanks.
>
> --
> tejun

How about this:
1. Add a one line change in the cgroup code: export the cgroup_e_css
2. The nvmet invokes the cgroup_e_css for each bio and under
    the rcu protection.

I think we don't need to add an e_css[] array on each cgroup. At least in
my case I don't expect to have a very deep cgroup hierarchy, so we won't
spend too much time on the cgroup_e_css.
