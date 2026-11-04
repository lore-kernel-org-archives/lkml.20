Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765778;
	b=T0hpz5YBhNBn+jC75S/czmUi8rUUBs356HP8EhIq4aqBZPeShbGiIj8fXsNXNladIJj9
	 A031ZhEdrqDw3waSgpEc2NxxWHDRYj3r3MkzLJNpKExASbfSD+TuijDFpebCdNPYJiv+7
	 htvScTJ254uUyHSoQfyA28NDSmGjyfdhjZK3vuVX689hG/YGKdOrf2wyA11Us7u+Pz5gc
	 0T4dUSe92HwfdXKMKAcc0apvvFivDH1T6NaaHDsmCmz/RpDyscMk1qhdPpwrSrm+T8VBW
	 lU4BSrOws4/tX3WMccJxRS/bo5VQU4jmcSo54ubcfuDo1ic7WT/8LZTRqaH3LpQsZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K/cIC+iFmdevIAI+I2RKVd6I0g7XOiCzAkoSeW4/ahA=;
	b=yhTkBgudz3ajctH65aPkPAI/X78a6N4onQa0sOlTPm3Rc1WeBS9/0wVAbIxf7pUo7pyY
	 /VaU8GTfi4tgzAZ5ByoBAP5Z9NiKXywuWgiM8bCkKGG4lF6MJTrhyxCKnkKWoaegEUMoA
	 WHW0CekX059N0xeV4OWa+JgN7qWGeMQdBXcUReFYeh3iZkbULZ4WrXTUxMYhHJXXYQ6Oj
	 d+ZdEZn7IQah2qi+r3OWX50YIKrZW0crWJxm/jS1k4euzFL8VUJYx4iH/kT8gxgKBuSxg
	 pUA8fZremYmp95RcV4Oszq7h34GCFQjbaFbAlYwve4+efKlSuRK7fzRUdsA6cOYO9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNUU7qPI;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAFD606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNUU7qPI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vOi5qQ0/DXnG4QFkyblinf0P8GKtrfv4uQiJ8Uvnh54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793765775; v=1; x=1794370575;
 b=LNUU7qPISHeNMf+Xt94WOcs4HzuuX08Byn+sE4A23zPN8pio7vBsgKedPtE2fJR080h2pZrg
 CREfyOw0Jve4CfA60hcS4+/2C4mxuPMtI0cgjn96+03bQtqefVXJLMo4cy7RISLWetbqf4TC5fc
 iQkZBa0TIRuGd/dhvSGu3xjs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5164afd9a38a0a63;
	Wed, 04 Nov 2026 04:16:14 +0000
X-Mizu-Trace-ID: 5164afd9a38a0a63
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb64096f-2c73-428b-ac74-881227539a2f@linux.dev>
Date: Wed, 4 Nov 2026 12:15:51 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
To: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david.laight.linux@gmail.com, kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/3/26 7:01 PM, Breno Leitao wrote:
> sockopt_expand_out() grows the output iterator up to INT_MAX, but the
> MCAST_MSFILTER getters converted by the next two patches rewind it with
> iov_iter_revert() once they know the real reply size. iov_iter_revert()
> refuses to unroll past MAX_RW_COUNT:
>
> 	if (WARN_ON(unroll > MAX_RW_COUNT))
> 		return;
>
> MAX_RW_COUNT is INT_MAX rounded down to a page boundary, so a caller
> that expands into the (MAX_RW_COUNT, INT_MAX] range and then reverts
> hits that WARN_ON, and the iterator is left where it was instead of
> rewound. So does a caller whose optlen already covers such a size.
>
> Cap the size at MAX_RW_COUNT instead, before the early return for an
> optlen that already covers it, so a size that could never be reverted
> later is rejected up front.
>
> Sashiko found this while reviewing the conversions.
>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
>  include/linux/net.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/net.h b/include/linux/net.h
> index e2a866fbcfa5ea..de56f89d475ee2 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -80,16 +80,21 @@ static inline int sockopt_init_user(sockopt_t *opt, char __user *optval,
>   *
>   * Call it before writing through opt->iter_out: it re-anchors the iterator at
>   * the head of optval. Only a user buffer can be longer than the optlen the
> - * caller declared, so a kernel-backed optval is refused with -EINVAL.
> + * caller declared, so a kernel-backed optval is refused with -EINVAL. So is a
> + * @size above MAX_RW_COUNT, which iov_iter_revert() could not unroll.
>   */
>  static inline int sockopt_expand_out(sockopt_t *opt, size_t size)
>  {
> +	/* iov_iter_revert() refuses to unroll past MAX_RW_COUNT, so a size
> +	 * beyond that could never be reverted back to the fixed part later,
> +	 * even when optlen already covers it.
> +	 */
> +	if (size > MAX_RW_COUNT)
> +		return -EINVAL;
> +
>  	if (size <= (size_t)opt->optlen)
>  		return 0;
>  
> -	if (size > INT_MAX)
> -		return -EINVAL;
> -
>  	/* Re-anchoring reads iter_out.ubuf, so the iterator has to be a user
>  	 * buffer that nothing has written through yet.
>  	 */
>
