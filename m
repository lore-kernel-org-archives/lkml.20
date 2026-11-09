Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185821;
	b=Xgvbd5UyaVm2X+I9mtd4t1BOafsRSaNyW/TKd1GxGQAlJT8j7b6Z3r5xAom79UcCaGWz
	 VjrtHtEfM51j7Ev3FLtsD80DgYq9y0Zx0ugEmmBr4HHGf8qtnjqp0LEUR0ybAoyXsvkpL
	 F2AbqQVegQqn01Xm5NL2/cPWb3AZ8W28wQ1VMkvWCnoDi+jbs+SLH8hcrJgpLhrpff6Mi
	 vsLylW34/A9vEPDeEvTBkpjdCL0n3ihqJpyN/9AloVhdPvJ0WCWAfXkvddaYbp0iH5NPy
	 dBGW/YH1UUkLC8TbJUx4WvS83u9EXcqBk8ZJsUhIkMUmBmTkyi84eLNL7U86UhjUNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185821;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vTOI75BFrAph/w738L52QukFiaVP1gQS2I9yBx6tGqE=;
	b=vNeo86bkKCpqdrGA/y7SgMH5Z82PApkurjL9710sLNXWvXC2dXme5Y1f4nj2IL+vBnPg
	 zn38CU+KRhKTiHaN8oAEnhM0bKS6VIkqzZAtr0D8sog0GUdVJDNeBFw8NchbEVr989+v1
	 4rG8yjFXxdCySi0vEzeAXU4UHvyjAfKQ1mm/KSeYKgMbMsmDqm0J2BB+9GRVNg6WlXPUu
	 OkWGqdcSkCJQKDmMQ3m7VcHNVlrwqBHuZp0ETraKZyNVTWOlon/YiIVdozrO7KlGJqSOx
	 xKWM8qEARxVh0170BF3ircBCfg0/Ph3o5sQJTPQVGMS2wCgir9viV+ZUsUMhDXVX9JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rObXoNHP;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE268606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE268606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rObXoNHP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WLnjSDdFf2j7CWL26ddLuuNb98YQV5N7sHCyH+3jHrY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794185817; v=1; x=1794790617;
 b=rObXoNHPifnj7ZeOHu29Bx2LwStgzqkw3l7WAJEet2lTCR+RRvtz5EyG8cimFB5lZp4SyArX
 FGSew/rQKSrVoCUrB5bit7F+Oy1LI6iRl0i3Y/vrYo0d4tbj8xytrJ2QkBV5ibB+/DWImFQQZoR
 ZvamjEm3LwrwQ4btT0sx3x3Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7fed51d2fabc6117;
	Mon, 09 Nov 2026 00:56:57 +0000
X-Mizu-Trace-ID: 7fed51d2fabc6117
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 08:56:48 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Gopal Malaviya <gopalmalaviya53@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] docs: net: fix outdated default values of four
 sysctls
Message-ID: <avEZlo0YVa5v3hu-@fedora>
References: <20261108061746.32090-1-gopalmalaviya53@gmail.com>
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
In-Reply-To: <20261108061746.32090-1-gopalmalaviya53@gmail.com>

On Sun, Nov 08, 2026 at 06:17:46AM +0000, Gopal Malaviya wrote:
> The defaults documented in ip-sysctl.rst for four sysctls differ from
> the values the kernel actually uses:
> 
>   sysctl                  documented  actual
>   cipso_rbm_strictvalid   0           1
>   flowlabel_state_ranges  1           0
>   router_solicitations    3           -1
>   regen_max_retry         5           3
> 
> Each one went stale when the code changed and the documentation was not
> updated, or was wrong from the start:
> 
> - cipso_v4_rbm_strictvalid has been initialised to 1 since CIPSO was
>   merged, while the documentation added with it said 0.
> - Commit be26849bfb6f ("ipv6: Disable flowlabel state ranges by
>   default") changed the default of flowlabel_state_ranges to 0.
> - Commit bd11f0741fa5 ("ipv6 addrconf: implement RFC7559 router
>   solicitation backoff") changed MAX_RTR_SOLICITATIONS from 3 to -1,
>   meaning that router solicitations are sent without a limit. The
>   documentation was not updated and never mentioned -1.
> - Commit 76f793e3a471 ("ipv6: updates to privacy addresses per RFC
>   4941.") changed REGEN_MAX_RETRY from 5 to 3.
> 
> Update the four defaults and note that -1 means no limit for
> router_solicitations.
> 
> The mismatches were found with the help of an AI assistant (Claude),
> which compared the defaults documented in ip-sysctl.rst with the values
> under /proc/sys/net on a running kernel and with the initial values in
> the source. I confirmed each value with sysctl on a running kernel and
> against the net-next source and the commits below. The commit message
> was drafted with the same assistance.
> 
> Tested by building the networking documentation with
> "make SPHINXDIRS=networking htmldocs": the change adds no warnings and
> the four defaults render as updated.
> 
> Fixes: 8802f616f6de ("[NetLabel]: documentation")
> Fixes: be26849bfb6f ("ipv6: Disable flowlabel state ranges by default")
> Fixes: bd11f0741fa5 ("ipv6 addrconf: implement RFC7559 router solicitation backoff")
> Fixes: 76f793e3a471 ("ipv6: updates to privacy addresses per RFC 4941.")
> Signed-off-by: Gopal Malaviya <gopalmalaviya53@gmail.com>
> ---
>  Documentation/networking/ip-sysctl.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index bc22400b53..0b7bfbd98a 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -1587,7 +1587,7 @@ cipso_rbm_strictvalid - BOOLEAN
>  	- 0 (disabled)
>  	- 1 (enabled)
>  
> -	Default: 0 (disabled)
> +	Default: 1 (enabled)
>  
>  IP Variables
>  ============
> @@ -2418,7 +2418,7 @@ flowlabel_state_ranges - BOOLEAN
>  	- 0 (disabled)
>  	- 1 (enabled)
>  
> -	Default: 1 (enabled)
> +	Default: 0 (disabled)
>  
>  
>  flowlabel_reflect - INTEGER
> @@ -2956,9 +2956,9 @@ router_solicitation_interval - INTEGER
>  
>  router_solicitations - INTEGER
>  	Number of Router Solicitations to send until assuming no
> -	routers are present.
> +	routers are present. A value of -1 means no limit.
>  
> -	Default: 3
> +	Default: -1
>  
>  use_oif_addrs_only - BOOLEAN
>  	When enabled, the candidate source addresses for destinations
> @@ -3034,7 +3034,7 @@ regen_max_retry - INTEGER
>  	Number of attempts before give up attempting to generate
>  	valid temporary addresses.
>  
> -	Default: 5
> +	Default: 3
>  
>  max_addresses - INTEGER
>  	Maximum number of autoconfigured addresses per interface.  Setting
> 
> base-commit: fa5196392691051963726787944db872420dfa75
> -- 
> 2.43.0
> 

Checked with the source and sysctl output, all works good to me.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
