Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229493ACEED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947359; cv=pass; b=ET7znVH9zWmDGDXxcnSWkuPXjhJwWCEUP8gwsXaUCaj0e9O9Bu1bfdtDZOeQ4+zakHL9qygHa4Rf+nmbvstK0AiFWBaM2s5buEdLdCknYNQxcHLd8wXAjDJo2V4Kv8uLB+YPsw5/QT0RNqtP1VpyOaqCJb4l02/dManvkPBp57o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947359; c=relaxed/simple;
	bh=UNzD/AxLjGFxfGGazPPzQZUu4rGnvyDIVYkhQgQITf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imTfsRwJS2UVHq6aqIEdFaU6wr+P9k1YCSz9w16hLmHDHoPnu82NfwAynMViNth/hRmtq/7A0UAkfXQ4iZunjJYI5tzbD2H17z/sVl8t0QMInMD2hjQZR2Tv5Ed1Z1EM4956NbieVO/1monVsYcsjw5FcLm5GrLK9lJAOIs77jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEZI13k7; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEZI13k7"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677aec6ddfcso3076492d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791947357; cv=none;
        d=google.com; s=arc-20260327;
        b=Yx51ISYRSwAyiS0hAXB7OTopsE6iyBKeS/qbedizdglZYd/qN/9d9RTGdd605ENWQO
         KAqEpB3uqX/+5cLMSPCxN+z7YPQO/nb8Y09VNHWTxD4PT0AHMrj29Co0v3gEOK/NQDuf
         XPwBl6DLnbR4kpCAtCQQVzv9dRkmMi7o32Al9CT2qC6W0iU2bgOKmqHMj3OtTTSWv8e9
         AW4b+20wTdKMUFFh7JUTbLXmPi0zzaaOCquOazIVyDEtyJzfXG7BACJ3TcCy7KPKqRZQ
         lBJFHGSFyE9+Dr9Ifk2cnx8a/i42nfpcmfqj28B5aH0VlQLw6UD79wgcdmVfH+84KfVw
         KunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DZxFoqnlOiUWhIXdGMf7+RiabdBM+98/BuYUZOMYxiQ=;
        fh=8WLoeHIBojadW/YE3A4Pcs4Q8/KAggKs+5xF+BRavRQ=;
        b=K1Fs5xwfGfRmIwwH7Bv12wV3OcW26EHwUSy6dRnJWSt/cOYzlITEzX97NgFL1B3VMJ
         MiQK7hVbIKVH4g7I8LlN7sNfzRkolY/PIiLXR4WoH+wwYlVsmISyacYVma57fjTzgIK7
         HMYtGpIRW/dNiIG2BeXouxSgc5N+2kVUyNvzIGVwP1lm43uD6yxqd53LdtSIQyG0OfXF
         hWU8/oOQ4ePs0jz8ESpz1xE9xdyUPZPBVpm+Y/F9P6Ehmro2NxAIegV9+/GRfnVMTHip
         SXU1EXV1PI7m8z9u3qe9qS6oBoWMrFKsoxPpTQ5X1hPYliL9E/GRLqFbFEGU/dYGBDIv
         Zkrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947357; x=1792552157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZxFoqnlOiUWhIXdGMf7+RiabdBM+98/BuYUZOMYxiQ=;
        b=qEZI13k7NC9P70Fjm9WImmKHlfni6bFYESVq2eg0z0iPN0Y8YcqU3ahaxWrB2Ye6Kb
         d9a4m1Nt7frmFghIYkLLtVP9rkmvEiYnReZl7tJ68i6bmwlohcbGoJkCLqimvmiQQgcv
         khTUR5qEdvYzmckMVc/wg5HmF4y5jTYN/h/ZT3slr8DAxWxY8uC+e8ajQiFsZo5AJlaH
         5gvGdnG0vOo9A0ExiLUUuZ4sRJMDr34phw16Wo2yonDRZ+G+DgdOFEuAVcMlmDBnXDZM
         BgUdEpCqQucPtFNO83HhoyJpm30qjPnIhQ9ZYAyhESEg1sZW8nw02QdToOpIB8fEghnP
         5uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947357; x=1792552157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZxFoqnlOiUWhIXdGMf7+RiabdBM+98/BuYUZOMYxiQ=;
        b=ZbO6kdy57G98rGZr9jDVAjjUCA+R5uZIfeNkiuE1EDu1JmYhz5obyhn4QuBTgGFLpK
         ZgHieCXFDGSe+bTdTYdTcfP8CkW+4CbIWENed3LKTk+V8Cp30nhKrnhTQrQK3Bm+ZxHW
         BniJmOJ8MAr5sBYBWEBu9EUYZTCJC0J1UO1o9hH+5Vtp42YsyFCfi3sRANJdpUlV1Uux
         ayE5MX9WXcU3Ydm6qZYHLvMFCqE05hZD20DSlY55aixoE3I5tFgaFdiySQRUQbk+LWeF
         G1ChM+2oTQdYFR/8CcP5qMve4Mo9g/XvotvE97boBiPscowjXBV0Ta76+iTcDlVPpoSF
         q/DA==
X-Forwarded-Encrypted: i=1; AKwUvByXA+Za0rLbCJD3bE0jzLvKq+jqgqsg3e5eyZ1RxF9Tl63YShncXDHeORdazb22kOxWxa+vnssS0xUJGBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLSxH9KLyFKhp1ShUrKwdxps5k4gn6qx3m4ApaiwXx48+8nRLH
	v0BScboHZaVeoqNSUoDWbK5P+tXpnJGjG0bbliyos5WzaAcnUuiMgbf8WA5DXw7HWGvIvx49hKN
	j2gW6SyhIUnruEgBBYBji2Bvfdgo1umk=
X-Gm-Gg: AYBFou0vhbh1hzjKYRqMMi2EgaTxpvMkNL4QGVuufjWX6aa0hDaAt5tqXDyJJZYSKq7
	gm2m/TarMF0XklnkTwjFX8mrc+WfVa+BD7EwniZkf48t8YdsbLyFkx4k6i97PiLAU4W6jf1XAiR
	z8jJeoigWZPjVmg2OL5gHFPSF15kzdgtOoJ9g4NCDQnMaR/rOzzpAPc7dssC1GVafo+cp/7wWyr
	20BAC8KIi16iqFw3Mpey14cOFc1YZh9FfgaA16/g3Zr9egWia95Z7vopywCASMUa+eFa4VVqkTd
	6OlQtVLxXXF41a82m85cnQa9Np6qUitqR9xTEXvm+OJEdPDkE5b8BX0P5ACPT7PDQ8WBtD2KI1b
	QFOUPwaF0+A==
X-Received: by 2002:a05:690e:1913:b0:676:e85e:5ec with SMTP id
 956f58d0204a3-67975b9e0fbmr1610555d50.139.1791947356910; Tue, 13 Oct 2026
 20:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <as5RFhW1Ch8ta5nZ@gourry-fedora-PF4VCD3F>
In-Reply-To: <as5RFhW1Ch8ta5nZ@gourry-fedora-PF4VCD3F>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 14 Oct 2026 11:08:40 +0800
X-Gm-Features: AclHuK-Cs4-tIw-JWscmzRL89aJpa2RhvKqogcNm_f37Lr6_J9191jM_ZK2WR2Y
Message-ID: <CALOAHbCOTSOPTzoSqKoBJZ56o0pfW_dGQ7ZM_e1jT9N16z3VPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] BPF-based per-cgroup NUMA balancing mode selection
To: Gregory Price <gourry@gourry.net>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:49=E2=80=AFPM Gregory Price <gourry@gourry.net> =
wrote:
>
> On Mon, Oct 12, 2026 at 08:04:35PM +0800, Yafang Shao wrote:
> > The Problem
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > In our large fleet of Kubernetes-managed servers, NUMA balancing has
> > been historically disabled globally on each server. With the increasing
> > deployment of multi-socket AMD EPYC servers, cross-NUMA access has
> > become a critical performance issue, which made us reconsider.
> >
> > Enabling NUMA balancing globally is still not acceptable: it increases
> > the overall system overhead and can introduce latency spikes for
> > latency-sensitive workloads. What we need is to choose per workload
> > whether NUMA balancing runs at all, and which mode it runs in. A
> > latency-sensitive service may want the scheduler's NUMA statistics
> > without tiering's promotion machinery, while a batch service wants its
> > PMEM-resident memory promoted when hot without paying for
> > scheduler-driven migration. No single global switch serves both.
>
> Have you tested with recent fixes?  NUMA balancing has been broken for a
> few years now (starvation issues causing VMAs to never be scanned,
> east-west filters causing south->north promotions to be skipped, shmem
> being entirely exempt, others).
>
> https://lore.kernel.org/linux-mm/20260629163337.1264881-1-hannes@cmpxchg.=
org/
> https://lore.kernel.org/linux-mm/20260930112206.205083-1-gourry@gourry.ne=
t/

Thanks for sharing these.

These look different from the latency spikes we've seen on our
production servers =E2=80=94 ours occurred with NUMA balancing in normal mo=
de
=E2=80=94 though I haven't yet figured out whether ours is shmem-related.
Given its problematic history, it's hard for us to re-enable it in
production globally. That said, I'll try to backport the fixes above
to our internal kernel.

>
> I also concur with Tejun that ops seems like overkill for this feature,
> this seems like something that can already be managed.

Tejun also suggested starting with a smaller kfunc rather than the
heavyweight struct_ops, in a separate mailing list thread. I agree
that this would be a good starting point.

>
> For example, why not add a new numa balancing mode bit that says
> "enabled but only for explicitly opted in tasks" and then ignore the
> global default mempolicy, e.g.:
>
>   if (numab_mode & NUMA_BALANCING_OPT_IN &&
>       mpol !=3D default &&
>       mpol.flags & MPOL_F_NUMA_BALANCING)
>       /* do balancing */

Another option would be to add a cgroup::numab_mode field (without
exposing a cgroupfs interface file for now) to implement per-cgroup
numab mode. I will think it over, considering both your suggestion and
Tejun's.


--
Regards
Yafang
