Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792451805;
	b=ajznCXCPK308mNSbp3lxXGCevJj3Kt8lAVbI9rwpPzmnEWsrT+gBEpYSM4bt5ZIzRCVx
	 5wb2O+9mH5TAJMNv7PCbvhrCay4k44C8RTAEOKqgl2LbyFteJ+SaUGC08e9o8MOMvN0PT
	 p6dxqhuEIj1Dik5CSWkWbHaFIjaP7ycJyNVkBhCpuFcIU4q2Htq3G4p3K18Q34lKnY834
	 sY6McxTvrz5YankaLrsMss/TAiFelBb708UZMOi1GN9JGy+MZhYu5F2MhM81GumN/hsGB
	 BbbVZJ+jgFLbeaT4KLHyuhYXsArbLl/xWgiA7ZvuLDXWiU1MIWHpHnbzZXBiujTv0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=It+ck8nd35giJ9f/s5woVqaK2BP0dqpDizWPCzMcFLo=;
	b=XYDyVvKJrrjaROZUjq15/2X8Jr+N/YZfNHCm0w0IP0GPml1J8R1ZOynQIykqsV6VVzlK
	 awMrdS0qxe9Gcj28/wZOsA09RtGFenW+TSeCdkV4jQyh4MszoFA8cWkMllKa/CV9jFDXe
	 lmMsFAzMDfdL0LabMUqEzswo0HXgv2zmunko9haNVOIewbYaw7+M1IQ1vPfAGS6M/NJh8
	 zj2cakTwsKfkGfIFyOacT4Jl6R9XcoMbPAinj/5Epc+7tCDICHetfoZkXQb60FsmZi7Aj
	 CipvzMwVVfg4LuY3uVOaVyR/FGqEyll/U1DGGXteqVswfsK6xtMvW2NNcy33HvuGEMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVksGCyC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E92606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVksGCyC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so12777855e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451803; x=1793056603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=It+ck8nd35giJ9f/s5woVqaK2BP0dqpDizWPCzMcFLo=;
        b=AVksGCyCTJpVQwQYlBtACBlni6R/2km4VkXUbpuS5HMnMzcp2+QblpS8GSkwayTo+3
         eJsZ6LWx3b7vmNBbL6ce/E1nmRdP5R9GwAmwKaM7gT+LyKI8i79oZhamElbcYptEhqHW
         P1VBk2Z9OH38d1PiM8olJPEdexYY7psHF/TEIE8H5eQStvtD4EMRiyyN3Uw7Vh8lg7NO
         HLLNztMyK/T6nHsytQzKwZVWAaxFlW5NVGujK9CxHZGCbNu0LNlHcdcPGxg+xm6wQxoW
         Oe0klOUBEAIyXMSFxQjxVwYDsYKxT6647UpGyAUst2bYYbEPwZeOHYhQFKt8kP/4i6YE
         1m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451803; x=1793056603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=It+ck8nd35giJ9f/s5woVqaK2BP0dqpDizWPCzMcFLo=;
        b=1i04nV032cdXIVaowXwFFKi8r8EZfpm0sFuirjzQnpN32sGp9yt1Dxjm0nhwmtCxAz
         TZAQfq4oDwLWdFkMR4wBCY6fFh1s3dZLICY3kQUCDc2/nbWpMMONU2JLWpWb3jRziFkb
         MVL9ZufNJmu8Z5q60ZOyGXbAI4FLf1Zpw6Mqx1QH6IwXgK4FUCXoP/qO34Tv+77duD0v
         KKGaU5GhDs9mH1Y/sQbBtaHzo0+MJDnYp0bsHSAUi/tx4gBUiQe67smIrNXSw6btcd4/
         FHtRX7tZdF6khqQm6QJt3o1ynRLSP2i3EuoO1W/oI2Lq93fQLCicyYbEay1fu/cedHJl
         leog==
X-Forwarded-Encrypted: i=1; AKwUvBw96kzk435WjeK2/JFb87KEfXHM4ymOTPBx75QrwHOsDAg32Clc3bY7XqaSbe6PWVLCWpixPr5CPHXHz7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRARBy3YXVwK7jWQlhRPuznmIzc2Xwvk/YfRc8GD2e1I0JEnjS
	dluxPb2/iCCF0r1bf/H5v2OUpi4CJ9UrDDGKv8d6hLwWSClwe+wXIeWu
X-Gm-Gg: AYBFou2znPdhavscQdESkDPvJhbo75nFuImy9jswlBYvPdKxLbzRYqY+JFDTNPMRoU/
	SUxL8C6Diu4u38xMLzkuang8O+2nuYBG831qiigBNr23ugPJDHHoP7n51j4KRI3YQwd2BwBEZgh
	VstyUqFTaq52g0gudrpHDl65LZEFL4rlkRUrV7PoCoHPyeJznBv0Fv9CX/loYxS+eLPnqcrP1yD
	cNugR3suE4K5KqWdB9SIWbwzqRizugdnUKBxluuiAN6gQuoAYDqPJzZ07+zGU/355QoHlYnKx+J
	5TCLW2U/WjbHgUyPcp3Tdst31iRZ3UosIn3cdtWSCRI+PzgtpUOpPGYtlqt0Px6DwF1YsdvcWQu
	Y7q6RW/9BdZr1HON5fySJL7O9ASn8Jxn/mh15OGcd7q/C/eb5/T3EOHKOuyIxc31wv7CV9oGWes
	Kcua92MW5oFHTjrd/3medeeCEkRSwwUud8GQA2iAU+T2PDzW99PNvAQXhd8FZUGmmR/Xqmw4weI
	IgLM9M7TaykT+u3rOmU
X-Received: by 2002:a05:600c:6290:b0:4a1:6af4:c6be with SMTP id 5b1f17b1804b1-4a1d7622364mr193940515e9.34.1792451802906;
        Mon, 19 Oct 2026 16:16:42 -0700 (PDT)
Received: from gmail.com ([2a01:e0a:bc7:8550:7c78:34d9:2b13:9a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm31068045e9.0.2026.10.19.16.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:16:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:16:39 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next 3/3] bpf: Fix ksock build with BPF_LSM=y and
 SECURITY_NETWORK=n
Message-ID: <atak1wakfuKz3ZYi@gmail.com>
References: <20261019211006.2574350-1-sashal@kernel.org>
 <20261019211006.2574350-4-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019211006.2574350-4-sashal@kernel.org>

On Mon, Oct 19, 2026 at 05:10:06PM -0400, Sasha Levin wrote:
> bpf_ksock.c references bpf_lsm_socket_sendmsg() whenever
> CONFIG_BPF_LSM=y, but the socket LSM hooks, and with them the BPF LSM
> socket_sendmsg hook, only exist with CONFIG_SECURITY_NETWORK=y. Without
> it resolve_btfids warns:
> 
>   WARN: resolve_btfids: unresolved symbol bpf_lsm_socket_sendmsg
> 
> and since commit 201a454df948 ("resolve_btfids: Fix the --fatal_warnings
> exit status") that fails the build with CONFIG_WERROR=y.
> 
> Only reference the hook with CONFIG_SECURITY_NETWORK=y, and use
> BTF_ID_UNUSED otherwise. The ID stays zero, as it was when unresolved,
> so bpf_ksock_kfunc_filter() keeps allowing LSM programs: none can be
> attached to socket_sendmsg without CONFIG_SECURITY_NETWORK.
> 
> Fixes: 7ae4eb14c5f9 ("bpf: Add ksock kfuncs")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Mahe Tardy <mahe.tardy@gmail.com>

Makes sense, thanks for fixing this warning.

> ---
>  net/core/bpf_ksock.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/bpf_ksock.c b/net/core/bpf_ksock.c
> index 7bf796193ab61..48a2e2327acef 100644
> --- a/net/core/bpf_ksock.c
> +++ b/net/core/bpf_ksock.c
> @@ -258,7 +258,12 @@ BTF_ID_FLAGS(func, bpf_ksock_send, KF_SLEEPABLE)
>  BTF_KFUNCS_END(ksock_kfunc_btf_ids)
>  
>  #ifdef CONFIG_BPF_LSM
> -BTF_ID_LIST_SINGLE(bpf_lsm_socket_sendmsg_id, func, bpf_lsm_socket_sendmsg)
> +BTF_ID_LIST(bpf_lsm_socket_sendmsg_id)
> +#ifdef CONFIG_SECURITY_NETWORK
> +BTF_ID(func, bpf_lsm_socket_sendmsg)
> +#else
> +BTF_ID_UNUSED
> +#endif
>  #endif
>  
>  static int bpf_ksock_kfunc_filter(const struct bpf_prog *prog, u32 kfunc_id)
> -- 
> 2.53.0
> 
