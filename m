Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331839A075
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977902; cv=pass; b=qXexCs2GH+L2RH7If1MfDxyCJzow26DzifWxVzCchwqZrlwXPMNmd5Rgjj2psintnrbP375qevBvabAHJRGefyRk9Vvrg5kSyjGBYOnGJl0IqrxFPhocX4HqItkLCviH+NpGv+WpXscyWfRlxVSxeHAGnTmf4dpHc4YDeRC7GuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977902; c=relaxed/simple;
	bh=+CDkEoDX2/LXNI3w0TZ8BPrSDg27dcd2Jkj3AIOFwBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGcrPWNyvHcG/4sRMVYrxkeyodjdTjTkShxMkbc9uXPSLIMB/mB+BJc9tTDvqi2VQydc3I1FhErJRxtBGBnaBFFM5U2Tg3oM17zEiyXUEj+U1BMWejfzSukPE9i2OzetBC3rwT/Tkcn4my8UeVwBQQfG6gU88TkUyTaRRvuKqXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=K786/Ugs; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="K786/Ugs"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66f883abfdcso6248074d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788977900; cv=none;
        d=google.com; s=arc-20260327;
        b=gtvBJ6vhMnR6TDUI2FhzUtGqZGWvQ75vhKtSikFZfn+JbMUZZU00AZUOei700f0a72
         X3tpcidXglm5HeCi9Mp8rdSFGzee30+wqj0hayM0Xt6T5OHDQAw0V3bXwfBqr0/Hqkhz
         RaIPeuV0Ty1vxKO4u0e7AQhz2B+SqtHgQbKrp3Pb7lsjsYN+vUIa8JIWSA4irB0vZ2Ao
         f7A+w5tgfAvES8vGkW+XsL6bUBQ1/Nj2bWoGOGqy0m5gudMzjpTeFgWqQXu4gT4490Je
         3TibGVMcvtlkMiFV+w3PaP6i3QvgoufQNwHrrDPMLyD5BP8Nnvn/GYSgFabB1O5mCnq7
         6DAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpB1R6y/CuTo27wSddyY+/GZ4xEhTTLFsyZFIbKl89M=;
        fh=GLq5+SZe5vLvBZTvHD9e0laRBzqrUHut3z8FvW1IBaw=;
        b=PfwlcUbsXY41EH84uchLKb14yyWShd5BpDYlv8wbi3Sxy5sfzrNGnGwCEIvB4RyWLM
         QjP7hSln/Fahc8XwuZ0utst0xMHQIoTp1xKQsLFxHtIX4HbcCJfrwr9NCfJVB2BL7vTR
         k3IFGTaEFT4yO/fSerf3+PjQHBCnLKWTcA88w9PHfcq5StFvzbpi/vtP9kZZEMddQTzU
         huJt/v1a/rnRa4j2QGB2ZlmAN41evb4TLeZPSal4b3Lv93iZsq4uJGZkuyVZezz5Oky7
         k+lTZroO88pDOUVzGm89vJ6N/M/dGuvIx9kvUHSGb9W3ZiR07PWXf+cG9VmbKMCGajD8
         +jQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788977900; x=1789582700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpB1R6y/CuTo27wSddyY+/GZ4xEhTTLFsyZFIbKl89M=;
        b=K786/UgsWJ13mRcFVosouCsAqsW6E3/kB3B568N2Cf80edSGyVZuDTDeiQwOOzPWUJ
         +ItaDTNfEihzO5M6PHu+v5IxS8xZR3B7+9YhBuQKcn+MdjtQr17l5FYNUgUdLSdZdbnA
         ScmCKjTF9yaAjUsdzD02XeKJenV/vSSQN8H7gRKpCCxyG3C6/Jvy86/EH+SfYAlKJIdI
         9LqxoMOEcMZQKfB+2dvrgoahLX7vtynmozey13NE5eRykP77De179uAmsNlJkUWGMfrO
         dg2benyomZnIWpR0K4fdcCEgkCU40WoG4zIPE9+t9tcqfuyaANvdXCt/JLK5pHjQe9Ra
         tM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977900; x=1789582700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpB1R6y/CuTo27wSddyY+/GZ4xEhTTLFsyZFIbKl89M=;
        b=SIpc6KkfE/mzRFCAPRdHdmeJ3rVok9wiS/YP6rqNtfuIeFifwSUHHx1r3Eo3p52vvi
         3wn1l8Lo4FKXtI0eyTx/riBFjSRH8GrNtL+DfpzU6Oma3VS9xizH8cnTYOSJCVZp9rmx
         fM+/Kd5gh/TAj57eoOGsTgLHW5vWaSPFMKMNtaywrgTmM2rQh3RLb8qn+waoKM7k7HAR
         ogDc9aIywZapWFieFesVBX570vzQuxu06n6K+g1JBVw4Pnm4Yz8ij3Kn7MJPYkaaVzDC
         j6LZTbzx6/HIvrFxpRR54rhpvd/yavyzeBIo+sA+G91Ly3CxdzhoIDkGhctQxUP+AcC6
         SBEA==
X-Forwarded-Encrypted: i=1; AKwUvBxVFWi9FhB0uuUfl6nnaYZIYjQ8BDKpZ5dqev282WVoBTBaZ9QYnIOsFH2Aw+1AYq44spClzGihNdBWBiw=@vger.kernel.org
X-Gm-Message-State: AFuF++mpRHWoLpT7dskE7IkjgzsFYonxtfLh262dxB2lVP4z0vTa9N3d
	ZYaFmV+XTQO+mGEkrhxZnC4dWVkNxdVQVHdy2SiecDFVDfFEo0Wzfjj56a96FrxgIsrSttOw/uK
	yuCZSg6hyQnlgJZ9MWwzTi7rAN9s4W71lFO5LI66htA==
X-Gm-Gg: AYBFou0qoNIL2BqlTjg/h21cmGlXNxPfh7+GzMG+YVWtsKbpgKiEpPnJo9ZQ/ddpvcS
	qcSnxUVjE233qhBKTDYk7qy1exokL4Nxz+aAMecNRVHQVgB2gkA98L5BSkPLWyjquPSBxR6kKlB
	D2V2KM2eySkCwMtuLGddgme1wo3Rwa/rExyD9JvDa5na1kv8OK/yzdjPnQS54Yse/2GpOj0FTSz
	Nyl5HVVZl27iAcxrNwly0/GC9tk/Gd5fV1dABg6uuIGyre5EPHdW9vOppvuVld22KHCsgkUoGDE
	F7AIY8M5CnvtR+cyVbZEN/pSIqcrWQnclwRD8DZJ6CyU++BFzKu7dOE=
X-Received: by 2002:a53:dd04:0:b0:66f:c1bc:4033 with SMTP id
 956f58d0204a3-66fc1bc4591mr8088674d50.96.1788977899985; Wed, 09 Sep 2026
 11:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907192129.557377-2-bestswngs@gmail.com> <20260909040807.3885815-2-bestswngs@gmail.com>
In-Reply-To: <20260909040807.3885815-2-bestswngs@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 14:18:08 -0400
X-Gm-Features: AcwNN1Vllz-TAro1yIo4gS9pQ0u90xlbBvVitrlvw4Rqq5UUb-P30JRI5SxUS38
Message-ID: <CABFh=a73wXKY--GSfTTp6X0xcKVUNr-iUnqnJO3rZXp7RLvKjQ@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf: disallow bpf_skb_pull_data() for LWT_SEG6LOCAL
To: Weiming Shi <bestswngs@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Lebrun <dlebrun@google.com>, 
	Mathieu Xhonneux <m.xhonneux@gmail.com>, co+adfca3e91be95776@bugs.sh, 
	Xiang Mei <xmei5@asu.edu>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:08=E2=80=AFAM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> An LWT_SEG6LOCAL program can invalidate its cached SRH with
> bpf_lwt_seg6_adjust_srh() and then call bpf_skb_pull_data(). The latter
> may reallocate skb->head, leaving the per-CPU SRH pointer dangling.
> Post-program SRH validation then writes through that pointer.
>
> Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL programs so the verifier
> rejects this unsafe helper combination. Other LWT program types continue
> to expose the helper through lwt_out_func_proto().
>
> Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
> Reported-by: co+adfca3e91be95776@bugs.sh
> Closes: https://lore.kernel.org/all/GCy0KRM2IcQGoJQTjJEU9D0maBxXzEDHuQpq@=
bugs.sh/
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Link: https://lore.kernel.org/bpf/DL9COXZQXX4V.1FN45QO2Q77ZH@gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:gpt-5
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> Changes in v2:
> - Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL instead of adding a
>   wrapper to refresh the cached SRH pointer, as suggested by Alexei.
>
>  net/core/filter.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 8513167a858a8..2a84f9d011314 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -9044,6 +9044,8 @@ static const struct bpf_func_proto *
>  lwt_seg6local_func_proto(enum bpf_func_id func_id, const struct bpf_prog=
 *prog)
>  {
>         switch (func_id) {
> +       case BPF_FUNC_skb_pull_data:
> +               return NULL;
>  #if IS_ENABLED(CONFIG_IPV6_SEG6_BPF)
>         case BPF_FUNC_lwt_seg6_store_bytes:
>                 return &bpf_lwt_seg6_store_bytes_proto;
> --
> 2.55.0
