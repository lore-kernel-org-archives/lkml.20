Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734403;
	b=BswGi08yDViE234Ud8m3qF8QSHRPAb73seggj6RfJ/Ia4tkG1FBXsJU7djSNwncW+oC2
	 xIHl8DPU7nn5p+xM1ICTppxqlrWzJvtectGLrEar4RSFbIdhK6GeapsWUK6FLkkY826fQ
	 w+7ftUw2CU9fZu2K7eMJt2r0sLdslN8N2/oPCU1Vuvr0KU+tqPF+U0b+OnJyekINeBN9K
	 8qCmBI71JivT9XyURcnNzOl6GfZQ4uglwjJSsTIxpgns6bi37cKS1+eSAT2eAAUbvW+Wy
	 3yDZyPW3M/PyMZI7TOqORHlJGmIEt5XLBXE6jRP1WKFns4e6Ogi3vwRnJfiyxZX2chQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
	b=reX8GrO0BAjphQc9Uj/WaeMDTERddNCDbvbDf9d0HeJ7rl0ykWl/Q1NaQRwuXXWICV0T
	 sEhaw5k20riEMXnbK9tkmO2XgoCEhIiTCVo0d1qv0JkTbMO1Yn6tR6rUeSz/wONxbq/3G
	 XResSyFkvsgPmVmHiv7pGSJWn1kBa2D+1tEcIaZq++CBY826EOa4hFRiPeqM2t6Q5Lx+T
	 0QvTtAc4O3yozPnnT0C/mr/kFtpG9LbOdccvJEtcPaR4NlxoKZplh46m6RPhXZ1cPWlpo
	 9i+23puWoX5UZaiC3PeUuwF/rbrCTUad0t8Xxx3Nr2drEGZIl5OhGmI8bb57h1Vabsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLOlwJ3e;
	arc=none smtp.remote-ip=74.125.82.195
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B0606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247B0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLOlwJ3e
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-35829219da8so1188144eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734402; x=1794339202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
        b=RLOlwJ3eELPPVZT985+ArtXPGXIAXSmgMhCqBjHZxWtFb81U4qfxqdHKO7E/nNFVxw
         +dWZuJUojEVNTMMSr5KEdRvo7Cu9/yOSG6ezN/5Mux3zoIBZJRn7HuQhmQO8cjEWuFcn
         7B+dr0mHGcivIrJbc2TbAHxL6fnVSWKdiqpw3dR1Ai+Z00xelMsZB+8oiopozrvxY48s
         NxMmo6tT1bUUPZsnVT3DXrh3kOutM6RWm/fJDNUWJLQl4zWtaRmAEs7cYVFHP1j6QNIw
         2TF9jiU4d9i/1vFgoS5Bbd1I/kcGnNAvVjYWdmt006xBeclMmbCc/J5GiG579Fx7M1wQ
         BcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734402; x=1794339202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+IILrbOopOCnLme60t9BvjxsRF8IeSCPeaXgfCLpA=;
        b=NJU57G9MkEgbSNs109LoUbFrzLvF+8Vk5ZhZiG5IGpNWaRcLgJRf80vJgU5a76XYfF
         RpjFQuJAVlFIEghjz4sJNWqKud7ebAkS4H9MjvSWrGYvH3dqpAWuJnZ9sKnrtYO6tXk3
         IKig4O6BcYWKG6HI2291boJhZnRAuyR5PVAwETSxZEnLOkwn29kcea/5HE8H0ya531zD
         RR+SFEFv0i4E0Q5iEhIrjhGFKzNQ45/7YAYdkazJiKj+G7fGAWh6UEBYaDul19fxGIaV
         POJWC1y/IKNlX6PNp4UgH6r8ic3zjhKSwiiH4xHM9E3wmmVXHkC/LM28FcTjfl3ny3UC
         oNuw==
X-Forwarded-Encrypted: i=1; AKwUvBz54tAdtLzPudeG8k23oNocV2cZ42VleXE2oN7dQy4buGHUIHgPsFoI/Z4NoI14sb4WVfXIlDYcQ4kbSAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sWPr0TWN3Qoi9ubml4y5RLtS8CcqfdlzNm62kZHiH5M4x58I8
	bEw1KpycXV6v6cTl3AQV0m91EfLUfgXEMkkxiZzR+JUg/bwLThw3shPu
X-Gm-Gg: AYBFou23kMxbmFvGG0QWLlxdkKQPjoKfzfBgibuGk7xQ+YcyOuEyLjEGebSgobIMz0U
	8i3inVpAbUux6VML2cb0HbbmPqGN2FtIW0km5tD3+J8kKkqoj31XCg6gCYIijQxY/r/t30fu4kg
	HCa3l+2Gmy8zCS+dgFpjnqlWhd+VNjzt2VYJxu1vfZ7hYqQDz3Q+Lwutay+TIE3R7xPv6dQqLKX
	I0EhtT/XPuZaZuxt3kNZHRsbWu+vJl7K4c2h9NrNSkpwreTxKszAnBBqEUmdpAs6fZBVrygYbTi
	tuWrhWLnx3YrQThctYALJ18QzE8sCk9ORRqMA0uGlOkgWOc4wO510Jg5YLhtBNlLReJYgzAcPQZ
	PTJCFmOvT218JmaHJA7BOwZ4/aPh5GNQINqNShGJ8qGNk3wCzXRL9V8OV0PGIJdoxcqfJxS3zQ+
	6tTSOXvTSpKYZgnKkzpyEXBlreC9zJ+8BdVCwGXjkLCbqLkbge/xNXOx7MnCO+lxXHo5p4b7TA/
	UD32xSm/xj9g3WFWjXjec7oawRJEAXx/vmoizxJp4bP4g9Vlj0PKRzNaiJxXzcM87ipiksirS18
	Asds6zsaQfLXvem1GfvNfA==
X-Received: by 2002:a05:7300:f293:b0:361:a195:c46e with SMTP id 5a478bee46e88-36a2fd4c964mr24744916eec.1.1793734402208;
        Tue, 03 Nov 2026 11:33:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm238153eec.9.2026.11.03.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:33:21 -0800 (PST)
Date: Tue, 3 Nov 2026 11:32:10 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
Message-ID: <auo2s-G1DHiLK-hH@devvm16445.scu0.facebook.com>
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>

On 11/03, Breno Leitao wrote:
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

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
