Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853036;
	b=IjPF+NI1PtZtqoKnUqR+E/BS1aY+Y14/U2gm+hrA3ey4olGUsKcPFGT2uUDeQNb4z38e
	 QspFhp+6HhqNzFdYv6bZitxR/ccO4kKnPavOISmnW8n54BpXqneM1LdnA8IKaoBc1/BoV
	 v1uvCGnFf43HDSCj0DxYIQmNKsUWHnMGv96jzb5I3zZJo0zHG7Sxq/igGtFrsBpKVYnif
	 KeYUJAiTBMJRgh5WvX064i8JGb+RWYgCamTcy2qzjIhAgb/PKNrrDoBL1eSjvMOEOT5Cc
	 6Sl19EFmyTYl9To1gV4rqX5ehuhZP6iYEstJ8Om2Oq4opJmeg/vKuRfor0YwHAVqGxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
	b=S396+3rrthYFVXczcclLL7NFzv3LzwYK7mbBXP8NF5OqWupDruKhApmjVW9lKgf/ZhEW
	 K+dv1PJqyWYiJxQtcjUL7DFE0SuhJEgFtBRZnzhqAG2pX2MO3Wq1jyYJkTwu112qHP2CZ
	 k99uT/GEERlCzpaho++SWoE0ZjIJWCMd8ayEZT0OTG5OuFhZ3A5vvsX/DURmWCs20rUZC
	 NF9dmPW9I7lOMikWoXNjq2aGJSZQJMsb3p69t4QWF56vPJTbH4rdQ4x0ppkziMHPJjTCg
	 svj1rntKjVGdSCrGowhnm3iIlvoJ8HjvYun+ExmDkvd4TT8hkHdocvYri6i3frUihSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QPwa4qTd;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA67606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA67606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QPwa4qTd
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso1162371a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853035; x=1795457835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=QPwa4qTdBndNoy/kjQcLNLm2Tb2ZEHmWraYHzX5ptvkL3AR2doTSDC+bf6oxQxJuWe
         oPGCuTjz3UUBxYytQuSu3dXROL3dQ6hS56GF2BJJ9arvRdG3/d0shpVlzcsWJRe/xstA
         C+oWJ+LydTHrxLpHS/dJNSH38vr29x+4o34q9Y/zbxPr3f/93pS+KJqp9U8VvCGKQsDo
         IwfYo/3l6Hg9c1oBlBp2t6OvdNsU8AkbEHgJiBgRc/9eNInfiLw0Aj6rughSxTxNmifg
         0Feq77hUK6aA9AQo2F2uYbQKungLiSsJL3c76iaHzxk47Owv5BoXPqtZ6OZYUjI91V+G
         lA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853035; x=1795457835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=hJU28R3IMFP1C0ZE7qbFsyGz7tYJ2ihxp+T2C0pRmqiLFIwCUJalY9NJAOKLKnnzm4
         4DYEN0zheggY2Ng4hVLogTlTmyTvl91e7MDhjMRcDFj3sLIchh/seYIEBNdZn7D+z638
         vB+7/+N9fwm+Ew3il1d7Z5X1kUSGVjZK8Ik/te1f30VSSOgTicHl7HaZHMZUCWfPlLJe
         OdoL7yzJnjLfrMVJ+jna6RFSv71eEyS1YnmSX5SeCU3MI5o7xHK/DZwcTj+JfWZortnq
         w9wDGNW7YUqMzslP5TeCwwvC7SspCEVJSc4/CNUuI8ok6bKKvHgFZmjdKlmGoA5667bV
         psHQ==
X-Forwarded-Encrypted: i=1; AL+hErFMzuwBaVbetrhgiTMiy+LPljW26yf45UbXBp+zuuAVgOkTmOJ8A5fzJwY9DKUkY/deVw7BbK5BJK+CUkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GvwbsZWiMn/ozW5nAlyPyJhPlrwVDmDCIOD6VBDmJLZMG2SrY
	Zoa7A77n2wkmJlRhj+oIghLQYd3CXvsBPHo4S0UbHUSV4rAelFVC7UfpGkRVORPG/g==
X-Gm-Gg: AZFdTZe2a8EcuUpyE+q2Ft/ZKmAiHvo6toCc3YjlQATAgNTLoMeO8Yt3H/4Yr4aOgnz
	2/ZThH60Xr9yWuFEMmVnEhw9qG7czrP+s/19JMRaH3fvOFWBp2r8jG+W2u9IpMRQSRbgepAaXXS
	OPibYgao095XDWQXmw1Vl2KVwvq/WStUExQu2tnQdIgPiJA10GV+r2FFkQCNtX3aSRG9e4Kv0qB
	YA/oM6dv7Z/b9tDKIQIWeOl3fVjdx7zBfIQEt07w88kSpv9C/azjYDgTwf/P5jdTokJBI5kHX7C
	N17bfp1qaG91xQ6a0g9RfkyIb3rnUUgyzRqIEKwCFUUYFHXETugy67RjWT/giOi+CS+7+AtqLrr
	7JULYa18UFh5BihxPVMZf2JSQgDKI9kDzF/2+wfHbX0PzEOPolt7SfjfnFRS2RbgbLHR+NZvOSM
	Y9c7SPAcQu6n3pfi4B5o4fnUo1xtp4ugrlIU73UEiGFqJPkg4Q8fh4K9dGoxGl9utOxcDBjLEqi
	XGFrBcmnhZhROAYaUELgt0UnOkF7rQBocCx1xNhO2Zi98twMr9AvHIIvXPX8KCHXaXY5P+zmvDJ
	UTXYZNgawEkR7tLdc7xWPTsFPwavmWQyUDpNWP4AB/Dh5JMem3IuZHKqIqL3Qrgv+u54KxroqqM
	4XEa55yLsdfWVIQcbt3T1WVK/9BGk64pbvAs9wMNlMmGzPVNE8s1HXi6qu+VR+Eo0PpfT4gdruJ
	IRC3ZrB3XN3oZSD8A8KyHAQipUaPQz5ZFK3EauOZcYNIfB3vgYu0rKvzA=
X-Received: by 2002:a17:90b:28cf:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b1b0b47416mr9375279a91.47.1794853034181;
        Mon, 16 Nov 2026 10:17:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2e87:6:9050:473d:cdf:7c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm272890a91.17.2026.11.16.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:12 -0800 (PST)
Date: Mon, 16 Nov 2026 10:17:07 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net v2] qca_spi: Avoid unsequenced accesses to jiffies in
 qcaspi_netdev_tx_timeout()
Message-ID: <avtIOfLOG3x0TRey@google.com>
References: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>
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
In-Reply-To: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>

On Sun, Nov 15, 2026 at 09:45:22PM -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in
> qcaspi_netdev_tx_timeout(), which can break the build with
> CONFIG_WERROR=y / W=e:
> 
>   drivers/net/ethernet/qualcomm/qca_spi.c:805:16: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     805 |                     jiffies, jiffies - dev_trans_start(dev));
>         |                     ~~~~~~~  ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
> 
> Printing jiffies on its own is not that useful for debugging transmit
> timeouts, so get rid of it to clear up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 291ab06ecf67 ("net: qualcomm: new Ethernet over SPI driver for QCA7000")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2197

Just hit a handful of these last week; thanks for getting issues filed
per (I thought it was just one instance; having one issue per makes its
clearer this is flagging a few more cases. Thanks for sending fixes for
these, too).

> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Changes in v2:
> - Eliminate printing jiffies entirely rather than using a local variable
>   (Stefan)
> - Link to v1: https://patch.msgid.link/20261114-qca_spi-wunsequenced-v1-1-6b219b906db7@kernel.org
> ---
>  drivers/net/ethernet/qualcomm/qca_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/qca_spi.c b/drivers/net/ethernet/qualcomm/qca_spi.c
> index 38a779f4b866..249b4b549a12 100644
> --- a/drivers/net/ethernet/qualcomm/qca_spi.c
> +++ b/drivers/net/ethernet/qualcomm/qca_spi.c
> @@ -801,8 +801,8 @@ qcaspi_netdev_tx_timeout(struct net_device *dev, unsigned int txqueue)
>  {
>  	struct qcaspi *qca = netdev_priv(dev);
>  
> -	netdev_info(qca->net_dev, "Transmit timeout at %ld, latency %ld\n",
> -		    jiffies, jiffies - dev_trans_start(dev));
> +	netdev_info(qca->net_dev, "Transmit timeout, latency %ld\n",
> +		    jiffies - dev_trans_start(dev));
>  	qca->net_dev->stats.tx_errors++;
>  	/* Trigger tx queue flush and QCA7000 reset */
>  	set_bit(SPI_RESET, &qca->flags);
> 
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261114-qca_spi-wunsequenced-a81e54616844
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
