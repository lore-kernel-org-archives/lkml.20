Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11797502555
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687670; cv=pass; b=LK8rdgWLS4z67CigP65yjpSz84D1XogySoNwKz1s8tv61AO8W5AZJCneh5cxlnfNs7xju2Brj9WK9aNrxISGcxtnZYFTsW8oQO5eqKWus/hMlR1efn1F/Wy/LYmSREfzbIMjSymri77ZJsmncGh63SWEbr6erSQc06HcLXzjym0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687670; c=relaxed/simple;
	bh=mc9ZngTcAoluBbUuX2lmbdpcrwmnX9oPwgK3aLjWg04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qk8pLfE8o8pa6rHnXtCu7DNICaH0IAPcLithjpd3lE5yCc6tp6BcNAtmAjCIkxNeXLZxIjMMPKauzW0jWaB7Q4rUkdxkdk6CXHJy/VZPeAZQEgyhUgUR+P3MCAgajYLBghYjkHnolqyQY/Xh2jBBK13qGoci7CdbnNW64rlgHrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCg4rfp1; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCg4rfp1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so23705425e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687667; cv=none;
        d=google.com; s=arc-20260327;
        b=o/3eDGyd55/ww4tDUMRL9TNUcUGmX59Ohk1fewu3tBkZLxpnoS8M0B4in3xUEEEWjU
         EKFvxjzcq+uJY0d/Uo+vkO2OxVXEipmcxZQlEZ2P8jyWPb5L/Z73fNDauF6PnlIFFby1
         vH/UyZoV2F+GtDNeybu10Ycrx//AAaU7dH9gvtflgtEmiZ0Uxt0XZj26IlFQYHuDYNOk
         /2OSZtAsqnmgUsm/i4x9lqPmoT8xqzecClbS2/Bk9QM3FbntVWZKMmLHYPqSUBbOuWe3
         4SRlYaHk7SwyCEnpAMxZpVgF5/ZF6kJdDgysVaSIaUOBTuKLNSvzR5PJwAcrZeMH8HyO
         hNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYRpRMxccbtbpG1laeX3wfTBykfDUuE+jqqX7h3vEZ0=;
        fh=ilfzWWfWoq80/+2O3C3UwkXvoYKLHtbbHh5wWWnF/jY=;
        b=JmV7pmtxZM1mRFCyObrntlIhOth91rzKYZ3AUnzE3+FzpQR+nqLEE9ZlofHEMfdL7I
         q7lT6tisRqGHzUASdBi3q1AHFuu7shR6iMM1a28wp25BrcoezCiQON/+HcP9beZhoqBJ
         sKBhicMIbuVKHk5e1ONzDRIqsUVq+I7FzmypAco/NKipBtrE+BNPvLZVOgXpbcOP0At6
         F6o0JCiN8RYhe/BI2junXeFjyKC5h1qlmSIN0Knhu9UmRvhBMlDqJW36dXbDDWNFAFG2
         TixJhLs4ioHP+WYrI8KGWCZopi39JxQVSSvX/0/VW4erA/cnS6t3pI0giF1wrgIMCCJS
         nFZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687667; x=1791292467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYRpRMxccbtbpG1laeX3wfTBykfDUuE+jqqX7h3vEZ0=;
        b=iCg4rfp14eSuBBOibIB2qwEDqX7qD8s2MEzh1y2AaasArYmYpvIeJXGhXNRMYFmkb2
         zuMGGQb4SGdrYm7nI4bg4/0ILMs/+6qhTny2PiYw+Gie0KPZWt9QtXLLRtlf5Hk0uA41
         T/Y1M4g7dLbSk5wVWRqxrTGC0hia7y2DBuFGbdzRrWWIeHFvXfR6XgP+/rojWvSpuI8+
         cVnTEMvUbJp8zYOUiVrMbC0cB8jMw7X+Q3bquNiYLmUIefX43lG9i/VsyuTCFPgU8Uw/
         kgqO4u+ZkZSsXWN6n8w3pw1Wo2ejmrwPDpkVTTZL8A0IyhYaFho+gZaDWO30x69a5ux0
         PFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687667; x=1791292467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYRpRMxccbtbpG1laeX3wfTBykfDUuE+jqqX7h3vEZ0=;
        b=Q9YgceS/KJqruBSRnp/eNjO5tHyXsGPGKPGsCKJjOKxz7AS5kyVXtRnFAZiFaPSnyy
         TlCiSI+ClDBKZ46+gIwe759l0sx+cYbjtDLtwhCcDkZC1UkcGYYiE8e71Wf0V2OI6ZwD
         E42rxqf+cOy8tYHQlyElysIEBUjXNpalxqPXCf/vGiqxTQICDIUJtRSlD48akVNeZAMT
         GYBVrRmVYugAQWnPz4+6rmZqoGFqb1SlIf+M6XT90ns6K/4BWg1t7owjAifrhuaLVJDx
         3HByNoUQ6ARXtSw6JTRgmSTKp2eKGOLngA20SB/cPuDKznF3i1gfX5dCIK0zrPsQn4/W
         /62g==
X-Forwarded-Encrypted: i=1; AKwUvBy9s6InVp/3fyFTNmk1MvWi/VRu00iREOOn4VCFi6HzGptiJq/YgHns5z/H+cvDFtmM0ojOglvprwuOKNE=@vger.kernel.org
X-Gm-Message-State: AFuF++kEd2ap1WHNwAUzEvr3eY0s6rMQ9LERE6w35msDmTfOEqjuM+rz
	RMQ3XdYi6XyxTZyBnNYB2zTper8GcZofjPw36oN3fOi/1crUlYtmYlETDlS4GoAzhlNY6IGKzAp
	Q801KfPwyJ3bbb7eVOZ9dXfvG534yps8=
X-Gm-Gg: AYBFou0Bo3XkOJoNiclqkfsotpcq6Kj+1ztkdu+9IGzghpRXunNUZoOcyq1RCCBrXMv
	JFdd5rKHu1zPFM7Mw/OlMaStr+tBi9SDePlTwVvLq4b3FssluiCCkQfqvuDSa4YTTxNgUy2560a
	Yg3yjIbIDiUqi5wpd8Xq/m9/peO5EZdjaY9kmCULfnUXPQS4rtDc5r9x4gVULd27vL4YMeBAoGy
	XM28jszmijaEFWGrESxKdo4IHlzyGZj/tW3HVbFFLfbvXRjC6mvGYmpTwIKO4OUQJ5eLcvt2SRZ
	EtI1tHeRaagIJvE+kNbRNpP2lMHmf2kAMKLiWUvRE26awz69DmIpsNuGtnfYbOIXgZcLvRHiGmf
	vAObXK7PlBN/3nQHFH5MpfsWI6L0=
X-Received: by 2002:a05:600c:310b:b0:49c:ee20:e787 with SMTP id
 5b1f17b1804b1-49fe66c8959mr264819315e9.1.1790687666921; Tue, 29 Sep 2026
 06:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928081900.4187482-1-alex@ghiti.fr>
In-Reply-To: <20260928081900.4187482-1-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 29 Sep 2026 14:14:13 +0100
X-Gm-Features: AclHuK-gHF1dvlctEtmdSR2RHiaD0wcMX6yQUH1GuqMtNTGrIvszFdFCGGkiTPs
Message-ID: <CAKEwX=MzVBTF46m6qBedUtpSgZFksRNonG6Gkw0kEMaCF17SBA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/zswap: make shrinker writeback work with iocost
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:19=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> We want to enable the zswap shrinker on our fleet, which runs iocost,
> but with it on, a large production workload is slower than with it
> off. Two reasons:
>
> 1. zswap writeback is REQ_SWAP, so the IO controllers issue it as root
>    and charge it to the cgroup afterwards, as debt. The workload pays it
>    back: its swapin and page cache reads wait, and iocost eventually
>    stalls its allocations, which in turn stalls the application.
>    Patches 1-3 let zswap writeback be throttled instead, by marking it
>    REQ_BACKGROUND.
>
> 2. A throttled write sleeps in its submitter, which for the shrinker is
>    whoever entered reclaim, often an application thread in a page fault.
>    Patch 4 moves that writeback to a per-lruvec kworker.

Yeah that tracks with an older experiment of mine, where I add some
manual throttling to zswap shrinker to reduce latency :) So I think
this problem is real - thanks for root-causing this, Alex!

I'm a bit nervous about adding multiple kworker threads though, hmmm.
Per-lruvec sounds like a lot of threads... Do we have to scale this by
lruvec? Why not per-cpu, or just a global thread? Is there any data to
support this autoscaling?

And do we have any concerns with work (CPU) accounting, from a cgroup
perspective...?
