Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E515346ACE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362949; cv=none; b=C3u94Ifc87vQ0E+y1gKcacLqBaEwyOaiWZqpxp9k8F6yUSaFYuyZYC7bb6KU0y7gReUsSS8VXKstqQjXmmCz7mwWMDmgGTR4w03PW+caGnbxGiNOagozc2KKAUUaESlXDdf1QLhHEU/v5XEV76VtD3Sn6nbrHMJOV/vgRJf9y1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362949; c=relaxed/simple;
	bh=miYvRcEGFmsRj3R3StAtd5ze/ExutceELLrIDIigKYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppXtjEaKcp5YqPSzT6HDstP990218bnvnzmj/9nEECb4XVV/nF05NiBiiGVHizIrrrTX++59oT+/xWViSJ5UHJWBr+4GPVxQHmKccBCJgw6MbtvFlvIeJd5cqAkw18qQUOOGMnoqtT0A+0YvWdLwrC1eO9agxrcgasiav3ub5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4Z0c5iH; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4Z0c5iH"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-39e501442e2so652918a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790362948; x=1790967748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZbHzbG6KX4HjmnobdQp+43LfGiR+GIwDBr6SWkkO9VU=;
        b=N4Z0c5iHeZIAOdlqnWJXQD9W9KmfOn82z65vrzTrFjRMYKFNe2K+RB7I1B2bRudVim
         8J6V49/+ciBaFeJIQUBEP34DY8m7hTw/2tGjHH69ZtZB5CVEcBRh316lyqs4BCOv1u/7
         QP0qFDo/+Vlz1nJQe5NrIrOMKMCZL4SWCXcSR3tbvbo8H21RD7A0X5TPUVm+VvIOe31w
         emjqMwaRZFugSNIPyez1xgN3otfi9u7ZvdnOQ31Wl3gS0wPKtWFBzmJg3jIy+javRALB
         wj6STZ0SJTZa3Pjpgcj40D7W0/NrWe5mrr4Yq3erZtERx8Z6oGVFIUy+cVwtM6dnyc9c
         36Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362948; x=1790967748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbHzbG6KX4HjmnobdQp+43LfGiR+GIwDBr6SWkkO9VU=;
        b=SDRgJ4vTC26Ub/4f6UIADcyzomZTG87z5G2KYo1dz/zNO3J2A2sU53SxJ+jKEuf+L0
         jdsaqqRgZEgqvtmAe5lmReUWKc1D28vEoP/gFhg3MlXKxfihPS9QZr6X5TCSp7O8RNpc
         tXcTJWvldzVqwjZelbBMm9J1E2XAhM5EYAVdnqxZMfH8bpR6OQWFL71tEHpOU8GbAvAU
         xjZ5qcYheSbRUT5qLS0NToRBbaMe5Ct0+ftMNGtZmYjpXhdk306rpIYD0dWhFfPRyg5K
         i/WoEa4jDkI+wKCV1DsQv1UCGvoS8DqePXnhdd4qYP+6foq6U6DpgoS0z/+Ty1Q4Fc3r
         avgg==
X-Forwarded-Encrypted: i=1; AKwUvBzI7SzYzCCQqnph0sCPlNGWIJBtXLXNvT5iAHUSSIZN9ZYQEco8h5St3RodMvGKwd5qgPJ6AkzDI0kDgHs=@vger.kernel.org
X-Gm-Message-State: AFuF++ltemVgCt0rxb3dEsNB86Uzb24p/zPYJJfCHMVUwGoPX6Vbie3/
	OdJCdH3pEL3rIC2Qb8H1pNchUE29P/4W6mliUp2qq65ENOqD020hEOMr
X-Gm-Gg: AYBFou0QvyobM6ZJC2Kdv8sc23u8Wj+43AJpM2lqzrYqeqW/45QllwaCGyTTWmST2nD
	b6KzL6H3rjLCLNs+lVrxTNLdlMQnLt2RLuAfQ+WBvVzhx6Z9I5EJLKDNLXlBnDAsTMHyJC+hgJV
	x8q3fw+D+orQWxm+M151IChzOzBPuwWtfp2uXEk+bhwmtn4Ub5j49u/PLkI0Sk5ebMd9iwu9oxB
	rmvQOGPqbORs2bqexadO4FK0Ooe3HYhTOK8SPu4FSUwLMZbpu81Sn2djRfAFZ4LKWCVCIKLtZb6
	0VHpaIQQi1Pgp0io2R/kOeMNufgBUBdr1vNpiAIqQHN8P7hWSaRiYWn/N5gCx1G7BtV/WVaPABM
	zrrrqLy5NxH7EQVVaqK0FGCkgka/cIk6SXBwqjA2WgTSD4SYZwDkMrtiEf7m6MkZyiiiG6t91LX
	6hsn166NIS9+Je4MJ5eQCYdTI1dA5ffvZV54EAsJUvbV2Rhu5bO/rZ6fRBrtzdvlTd
X-Received: by 2002:a17:90b:1dcd:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a0bb55308cmr2493435a91.5.1790362947509;
        Fri, 25 Sep 2026 12:02:27 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm12331068a91.12.2026.09.25.12.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:02:26 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:02:22 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	david.laight.linux@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/6] ipv6: reject a negative optlen in
 do_ipv6_getsockopt()
Message-ID: <arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
References: <20260925-sockopt_expand_out_v2-v1-0-c3ef2e3bb5c0@debian.org>
 <20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>

On 09/25, Breno Leitao wrote:
> IPv4's do_ip_getsockopt() rejects a negative optlen right after reading
> it. do_ipv6_getsockopt() never has, and nothing downstream treats it as
> an error either: len is an int, but every consumer compares it unsigned,
> so -1 behaves as a huge value and each site clamps to its own reply
> size.
> 
> 	len = min_t(unsigned int, sizeof(int), len);
> 
> So getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> answers 4 bytes and reports 4, rather than failing.
> 
> This is a bug ready to bite us in the near future, let's get this fixed.
> 
> I've found this because testing the rest of the patch was returning
> inconsistency when optlen = -1.

If I can do getsockopt with len=-1 today and get 4 bytes back, isn't
that a uapi and we are gonna break someone?
