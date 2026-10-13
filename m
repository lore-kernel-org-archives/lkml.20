Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA153EC81F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857831; cv=pass; b=E2WTP3ZIicgHdtV3ZTMCVodCVK8yyHYpJTBkYyybAG4eUeW+59woSPOdruJCmeaCUcGmZ9EqBWAFhQtaunnPz8t2aBGidb5VKeZmhEDwPf3m1KA0dliAvKeipJebE4yiV5ZiWseNiCWKRMzu9NjMrvQ4RSZ6YMEVlm+77jiGdN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857831; c=relaxed/simple;
	bh=1e6icdFjU8+9G13mCMkJbMOIoeURTDtn24Q/J9qsd24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGN7B+45AXOnuPDb8juVdr2Tc1Dp7A3ZimswvObxbvFiJ/cVH5AdP3zzPPXFkXt7TCt7GPsrDmHqD1tm0cXdJ6e1SkSU1dAjoC1UXSEE9mSxqi4J1ay495G3HHnuso7V/wh8GsGWqYbJtDrEPQHcZ56TQB8kiMF+sD51QpZJgR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBl0jKAC; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBl0jKAC"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677ad9083feso1724265d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791857829; cv=none;
        d=google.com; s=arc-20260327;
        b=f5b/658tuxDQRHDZi8j3fsaAwrrq+Fr9JevTOndgBuGxZSDdK7wjIntJIoOiBcQn+z
         D7QJ930YjNmkNPKw38hBAv/ZdJiIKK3uOOyNiWyl9A/BaG8bNQcjE6SySDaJOEDzYY40
         KUCCMsKau6M4XyixCKLmT56MzdVByT7XtH3w71M1O6H0HtRGi0SGe7k8bPF/bZpqJgDM
         P7MVDAD1S+BlZ6zX6edHjYcO6E0Sf4o1Y+v3xraZHoG0ornmKLYHnXNbJ3QMJL9o7PM7
         IJaKEt9xHhGCYsss8kVNtIKV52rcY3nchLdayGDvy/VHcpjF8QCtmU65iYP0btKp0XpK
         koVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIn2x59SlJfeG2aH0jkfT5zU4fOVP6oTpHe5FuJew3U=;
        fh=ENqykUIlw+EXv5GavpBOXIrlkb2goxgnZdetOYLC3hs=;
        b=SbOApC+KRSz2pmTGgQOfPUNHN+aNbc0/2ElnkbDZS7dFQ6+Z4jYryu+SwP3ddG2Ggi
         Yt74O6/pM5cXAuEIrLvv4vxwuWyOoVduh4FMWu9+lPEOUh5q60/hmBBi9ZjgFo/el5Li
         RUa92ECYL+vbb1RWbNK6l3PyX0dfb80pSRMYWI3+glBYMNpiwnLjYOLUQ46NZ7bxmjcJ
         QdbMTh5o9tFH/GkdtIipaQ0JcSwfRX0MtBYAlwCypzr4BIdZ2bF+oWJ3rHRN/Ed+x4hZ
         bo+oi/JoFh6cuxLMPm14QXPQilwfTa7KbUwaTs7RBeCpxwbFZzdgZUEUl8DYJ2uqP5hl
         RIrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791857829; x=1792462629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIn2x59SlJfeG2aH0jkfT5zU4fOVP6oTpHe5FuJew3U=;
        b=cBl0jKACTBpEhNhNf1f+qVqVSynQf2sZqtgWXf/qEjOzsMjBj512ETrV538exeXIBl
         qCm9/UpB9Stfx9Jvg37Cop4DDoi5zHoHhfECy1lsvQ2EThZ1H2/JtdI8gFpu57g1aKvB
         U9OS8ayivO+MKQuhfdTuXe9rdJ5F4o8P7PMhuVsO/Gq+KAWzaa1kiu4zlqPekPnn7ee0
         2K+EfHmXySJNZEz8OSDNSPvj8Xasm2kybS/Fnz0M50FWWrpSqwir37vlM//eB7vdn+lp
         mxD66mIjqkzq+YtNjhYF7t4N9fkfKWCFtUkgJYjJw/iv0dvxJ2sGrdBE1bwZlnadn8n9
         BCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791857829; x=1792462629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIn2x59SlJfeG2aH0jkfT5zU4fOVP6oTpHe5FuJew3U=;
        b=I/YqiCBvsj+q8r6xlVYFTafIDIWyW/O/Cxh52NyQgQpM7DcOVwzCrOHeuQE2PxkkW0
         gEOycr+ivFS/8voAXucAvVnmnWu+4h6mM2LDu/7VwKOOPlDoZ2sT4B4qP9pq7VlpXYWq
         XRFLqtHHK4UROOKeC1WoC6hE5qfHXQ4F56IYr6Jq+wkIaikiRRvHK+DddgqdUBqEhdk8
         bUarVHB+M7+H6ejBfdYgDJQS1auOFWdOSYGIvbRfbrBVDZhHxPdAuR6tlqhd2Vw5iIAc
         Z/U9adgJpgNcuuHEC3y7nM9p0sd9G1FpekX5onuBvSZkPnJ2iYoSKBYW9SsU5b7rFCMP
         trQw==
X-Forwarded-Encrypted: i=1; AKwUvBzV8Q5nE128yh8hv35caPatkv1T9sY6N//gMS4RrfedVeoQH/D/tafj69oyKLbGdspDhLZ1jEkkTSa8dqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoZyqQunw+vBVFNUxiDsxHBNTW0hpcVATx4f0fsqPV8tPvjA1Z
	/F8wjAsj5akWxL59tzG59Ms/hRtoSx0WrHSYO9MMNduFsdvEOitudp/p+F5tlCilf7EGp4fwpwC
	bqDtRz52QT+XQz/As5pgc6h+VZWMc68A=
X-Gm-Gg: AYBFou3aMxVinjDZswUQ+iH+It6HSXqU+yysfU++OvCd3hmlAksN3CAjrEk6v7mkiqc
	XuLp595GgcHn7Pi1n/45O9o2JQ9CIj66zsVNpKxzAaQCsTWG5nwIFoIj9LTtfyuH2QaN3GN5ave
	e0AT57Qb6ySokGSNdqFFUPuotGwMHgqX4p/MqrFRA4vMQV6k+Pho3huCoIiuecEOr7JMyji00iH
	z7T9btNihg7gqjyM85E/V7GJGqbrFiaRB1wPcW+Si1gGKM+eFxKNggeS8cOWfEXr655u/tZK8ig
	55Eg9rhALJUVWDzAD//X6e6fTFLHxgACtiR57JB78xQvozE3ikOoFSDRBiMwQmm9kMWe4TtSnu1
	W19ngS9B10w==
X-Received: by 2002:a05:690e:1383:b0:671:7e90:70f4 with SMTP id
 956f58d0204a3-6793678d44dmr3771206d50.10.1791857828879; Mon, 12 Oct 2026
 19:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <d9a3367a1852158f60cc2e89677fb12f@kernel.org>
In-Reply-To: <d9a3367a1852158f60cc2e89677fb12f@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 13 Oct 2026 10:16:32 +0800
X-Gm-Features: AclHuK-uH2UB1rAnuK0zhwCfF8NmZTYihTg9_NG0CYh1qo0sK-2XTafwZpGcmUQ
Message-ID: <CALOAHbBE_1ssK_26c-UY7N6WxhkVNpB6v9WACVGaOiWZ5zchCA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] BPF-based per-cgroup NUMA balancing mode selection
To: Tejun Heo <tj@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 1:51=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Mon, Oct 12, 2026 at 08:04:35PM +0800, Yafang Shao wrote:
> > This series adds a bpf_numab_ops struct_ops which attaches to a
> > cgroup. The kernel consults the policies of the matching cgroup and of
> > every ancestor and combines what they return.
>
> The op doesn't compute anything. It returns a fixed mode per cgroup and
> that's all the series uses it for. BPF is unnecessary here. This is a
> prctl() feature, not a struct_ops one.

Part of the consults are keyed on struct folio rather than struct
task_struct: the folio surface answers from the folio's memcg, the
owner's request, not the touching task's. I don't see how to key
these callsites to a per-task setting.  Please correct me if I'm
wrong.

prctl() is also a stable uAPI rather than a kernel-internal
interface: a new option is frozen the day it merges, which is a
poor fit for a feature whose semantics are still moving.  The
struct_ops/kfunc surface is explicitly exempt from the uAPI
stability rules, which is what lets us experiment with the kernel
feature rapidly.

--=20
Regards
Yafang
