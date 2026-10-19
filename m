Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426778;
	b=CJpch+waHaZcvvnMZu++g6wDpWNV1B0ohiqx+lOFvU4Y1UBJ131+vvniZZr7yP/LBf83
	 be+A8XTlVeu0pDO0zW/B0yLgYvS8SDlxBPqiVhrRzi6JXB0VRefeVJNme1dBzztG2fqXG
	 UECaU4UYxQ5RwTtSfsvf9UgckZlndbtPIZrKzkqjYooWoSe1ot+W3HUoCuMmqJ4Lcrwl2
	 yXeRuVGwndKk3/iRWHrk1qjZw5pjF/D33X6h3AoZ1StUK6SKuntIK0RUSnacY3Gr4HORw
	 SXvalvCorFxcNGI0SVelO7i44bjGdquc0QvOyxN+XBnSl0NMSc1C11VHQDtYJD+zoVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PJJTCalwhybaV0YnpikxX4f4T6RunQfv+DiHrJ4+ZBU=;
	b=vN5X9bjm3e0mtkMln+VIuk1yWmVkxLZjwnrDH26Xdyussk7CmwSUVlGnKvb7aiMeHoKd
	 Oaka7ITnAfC/fxKfL0pQC2xMD7F8Ev587GS3r0+YfJfWGlx3Hbso3Sw151ZV7/XSolLer
	 yeX6gfIjem6r5DnEIYNJ6XFrCi6rfmIKlfiVxo0o2Qo5381/+QBTPOj+JEmTp5X1KJn7b
	 88hF0hxYeWdw/gK7d67yvoCYjOtE3N5RNlms0ce8Sy0sfokVlZtOkgVTZNFjqV+6w7C5C
	 Zwayn4GWDiQQUmQBDYwmeSW1K9iKH+lpxIVJ1VDcd87Kj2xBPKUwGePZxrj2ej2NQgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgwJuMuA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C201E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgwJuMuA
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1315651a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426777; cv=none;
        d=google.com; s=arc-20260327;
        b=jC/bxYmRwvsrt35SF0F17bv6AG1jQoqsTYFnJxEtQThsDsVnxcXUuJG1SZLsxA9yfo
         bSGc9Bp2vNkRr/PeydkWCiB9g6EJoyoyXRKbLjxaDIx3UkgKEvdw5TBB3U6ssQi5zaps
         Hg55ITI80TiHg9dvzx7lo/zHB62LSqpj62mWs6ZRWvzS8rsmgMwakdmdeIOjVQwV1z2m
         EYD+aGNbbWxsaAmlxkQ4i3epxfYV38tEhNnZQt8CwlFkXGBQQyfyhpyZHBx0P7UVKybo
         gGDDXF0HoOZjNBqdojRQEQLknkWc0q7jLtw1RE0CTZbq3ru2vCUqy3tUOFISI3swAFOw
         o7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJJTCalwhybaV0YnpikxX4f4T6RunQfv+DiHrJ4+ZBU=;
        fh=Qurr0Ilg1OZAUtkvWOz15EM645WFPlqi8UWwsvy80v4=;
        b=WkWsUWxiUBKJah8XsxC+3AYDAxE2D7duN7BmMA2gJ3YLDx2/RnvhB3R2t3DaA/U0Q4
         75tSMYyu2qvgx7CyXR2TK8Vj3qilOFwreq7aG62fXdfOCspbIuboQlZEPp6Ct92iKVo1
         nZ0OFByp0olSpqqjy00T/8VYLbvhog65p7YbqI0dytnjAJ26zaKmE7b3MQZEWM0lKI08
         ng56zpDQ7RUpX/Kd6mQvSEQ2PF8tLFEwhZUZFpZrDsWe8vBHhydriOXjVY1W+PX/R23z
         +SLOQtRnye34Z9EzeJP2+TNiaRE+r2jHqbizkQzgnqU+QunN81BDocjxMmdQs0JfLhR1
         UB5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426777; x=1793031577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJJTCalwhybaV0YnpikxX4f4T6RunQfv+DiHrJ4+ZBU=;
        b=YgwJuMuAifhbXhFvTbAh+dNiezCsh9FgcumUZrh352cjGXc8dhxc22/r+1vsKEOuiQ
         HI+tgssG66wVWXA7yKPHd3X5X6Q5QZ5mZwhGEYYbQXYg6Kq+0nvp041dArpWfh/mx8ua
         TyO9l499UZOY5/RAJWULy4fgrZsKNt7jsbpNZ/BNReGeZuqFlzfNEYsd+DMPtfJqExz9
         Vik7WLiQIqegUicm2kQGtEq00UvxPYgsHeTv0jZhLAGzEcmcWV7VtTrLue18I6Doo6sO
         jZCTYgSwxAePX8YXHxdyU79eSW4V6uMV5ZCh4bym9h9rB+EgP5w9/RKcc06llIDuDCAN
         dfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426777; x=1793031577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJJTCalwhybaV0YnpikxX4f4T6RunQfv+DiHrJ4+ZBU=;
        b=RUc+hyHwtQ60ccPyE9lTnv1upSN3kOfBxeQCFs3EgU6VDIsKccrSoW1jYX3bfPlg77
         yrxmcqPTtbSjr8Vop1j8tsYugJB8Hf+L4gQakJkdzeuYb7cHHAZCyYoPG1IPy2FdDItC
         qrnzlreCjF/8iqgcLUqEZnVpVvsuhnIbxvdKVKP5Bu7iyYcf7iqbjjCdB7Lgfba0AiTe
         CO61sEEvbvGVlcvvW1i6PhSQ1081qhCuq8bW4YD/CZ69cWxFnWHjJ+FcvG2liz/DoGbL
         lU2+J8W6dy4mjQTliVuk2fdA3o3TAO7cSVnAXD7L5/lZt8TEqhpUkHGMtKPJ/WGBjED+
         sApg==
X-Forwarded-Encrypted: i=1; AKwUvBwitq0Zgzy7ErMjenG2Nch2dcZIL1zQACfPAarl2YKui+ou/1MMK5pIYQYNzthmp2V+6tvehjUimgC3uOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL+lLy1RFEAAc20D/itqfiLk/S6Yy5X6Zzdl8PhOrwzeutI05v
	sqaFdThrqT7hUGJyqHkVd5FALT0zu4T7zNHPPp7zTsCLZcopEZnYY5V2qq3hdYEPPGvEBf7ivRD
	QW8QfERh/5vPKEGmahCexzwnGP1TwT9Q=
X-Gm-Gg: AYBFou3jESP2+ii9PWpZkrl4uty1yCc8DoMUAdWsouaNlblM9bJvBI8WJ7TK5g1G/qW
	tU/FaNPNaVyG268ge++yxw3fhS+2Tm99lkqgU7dmsN77Nr3pJcJaLUXboa5Wtk94gR3sDGarbAi
	TX2RAVmcsspftmbXn3PfOsCXMSUyKxWqPHwDer4gJwYCfa4QBXo5nE+06yHx2QkQ9jeAXvOG2HR
	Oi2zcJmopeP0s2rxtmpbaJ9fewxkkDUV9P/iFalnUIQmpd5Czx5pEgBoXm2fcqJtJAEZbJESVsV
	YFgK+ov/DB+62Di5nIJRw6ou4bHP3stxV+lv3YjrWGMlWjh6vYXXXV2MpV7qE8EhbyAH+z/vaAU
	lvkUuPoyCPmEMSLNS+7FQxxcjdXgN1b0Bii2dzhJ0sqfyNuKOHtCDIDiMWa+VH4Q=
X-Received: by 2002:a17:90b:3889:b0:3ac:17c:6e85 with SMTP id
 98e67ed59e1d1-3acef0ffa0fmr6944547a91.47.1792426777044; Mon, 19 Oct 2026
 09:19:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010224902.1232178-1-arighi@nvidia.com> <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com>
 <CAEf4BzZZRrD86ZswsB2r-swqNi7D1p52Vs=fQ9MXSgGATN31Jg@mail.gmail.com> <DM7JXB4PREVH.1BHG31CCNRXF1@gmail.com>
In-Reply-To: <DM7JXB4PREVH.1BHG31CCNRXF1@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 19 Oct 2026 09:19:24 -0700
X-Gm-Features: AclHuK-HFgyrtXdEf6EddMbv0AqemeagPcniTwi6V4E_qoHT91-FJu0HS9ZwBfw
Message-ID: <CAEf4BzaeXxoPqtcV6E1x8zh-Uv_C1cfNjzUYLKDWwod=k2ttLQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/5] bpf: Expose pinned arenas as sized bpffs files
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrea Righi <arighi@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Don <joshdon@google.com>, 
	Vineeth Pillai <vineethrp@google.com>, Balbir Singh <balbirs@nvidia.com>, 
	Shameer Kolothum <skolothumtho@nvidia.com>, 
	Himadri Chhaya-Shailesh <himadrics@protonmail.com>, NchangRoy <royfru44@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 5:52=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Oct 16, 2026 at 12:52 PM Andrii Nakryiko <andrii.nakryiko@gmail.c=
om> wrote:
> > kernel to do that. But once we have the ability to create ARRAY from a
> > bunch of pre-existing memory (e.g., from memfd), this can be used both
> > in a guest and in the host, and both models, guest allocates or host
> > allocates, could be supported with the same model.
>
> I don't think it will work for their use case.
> With array of maps scx needs two lookups and two NULL checks
> on every access, and the result cannot be kept in the task ctx
> which is in arena today, since ptr_to_map_value becomes scalar.

fair enough

> unless everything is converted to magically bounded array, but...
>
> > annoying, but what if we teach verifier to just automatically add
> > bounds limiting sequence (e.g., masking if value size is power of two,
> > slightly slower sequence for non-power-of-two, of course)
>
> while working on arena ~year back I tried to add runtime masking to
> ptr_to_map_value and couldn't figure it out.
> then in ~april I tried again with llm-s and failed again.
> the main issue is that ptr_to_map_value is a pointer,
> and progs keep adding random stuff to it.
> There is no way to split it into 'base + offset'
> and apply mask on 'offset'.

yeah, good point, some food for thought, I haven't thought much about
this, will keep it on backburner for now

> I tried alignment tricks, like align each ptr_to_map_value's base
> to 64k or such, but still failed. Something needs to remember
> upper bits to see when math overflows.
> That's why Barret was using explicit mask in C on every array access
> (when he implemented all kinds of complex data structs on top of arrays).
> Every access in C was base + mask(offset).
>
> Array from memfd is a separate topic. So far I'm failing to see
> a use case, but if it's not a lot of code, then why not.

Yeah, there are just so many cases where we have some memory that is
special in some way (e.g., huge page-backed memory, or some IOMMU,
e.g., that doorbell stuff, which, if I understand correctly, is done
though writes to specially set up memory ranges), and we can't shove
all this into BPF_MAP_CREATE interface if we want to have BPF program
accessing that memory. So having a generic way to just bolt ARRAY on
top of already created memory seems like a useful primitive.

So we'll give it a try and see how it looks.
