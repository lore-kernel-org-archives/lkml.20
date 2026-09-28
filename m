Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10618AE3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558390; cv=none; b=Zu5gpNBYvbQrR3l8tasvGKsbEkC1cNNYs+QZgCjOXK3VDhVo4jTtjURbst2TMdWKf5p4W/9eP70F8711PaZtnfKRDpwLMZeTUH5GCOEHXvROmpOcglzcKtxFMXvxhqf2Z4JE+PXH2oh87XLwEWlEQswgI3lsjdWD/KlpjpiEoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558390; c=relaxed/simple;
	bh=T1Q1qBSqnVJIk94dr55GCcw/GkY9e40DE3AqaXVAM/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n71WOedXNsTVqGkdkNoad/sf3y5/LZc1FYqHUdYXmFGlxohp/TkEEBEoR6oGEDjlRBTVKBxxclneIcflV0PFXSAS7WC2W67ZuKBppp+QgBjdv96VyRrtefBIK+GuaNSJOuEWCLDbQqdIw2vu0VRD5mObPrxRUpupV8OTQM1a5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oYnkGplt; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oYnkGplt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T1Q1qBSqnVJIk94dr55GCcw/GkY9e40DE3AqaXVAM/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790558386; v=1; x=1791163186;
 b=oYnkGpltQxL+7pHHJyvGcbGKdissNQrbXVlZnAzlv9ffsWQ80FBuzPbv7vhmoyC84PQId3bE
 h2alrPU3qWm8eEhHnuU1qaOIFf/mQHTqVii2TdSTooX4rb9Iqq/K0bO+Jz6JvAs8q9HBj52HVJF
 clWaBvLUD8ZncF1Xl7jI/XV0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 46b8d1b57dee1be2;
	Mon, 28 Sep 2026 01:19:36 +0000
X-Mizu-Trace-ID: 46b8d1b57dee1be2
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 09:19:25 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: =?iso-8859-1?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <ast@fiberby.net>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Danielle Ratson <danieller@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/9] netlink: specs: rt-link: re-align IPv4
 devconf
Message-ID: <arnAnUVFHJZ8eroW@fedora>
References: <20260925213918.204767-1-ast@fiberby.net>
 <20260925213918.204767-2-ast@fiberby.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925213918.204767-2-ast@fiberby.net>

On Fri, Sep 25, 2026 at 09:39:04PM +0000, Asbjørn Sloth Tønnesen wrote:
> The YNL "ipv4-devconf" enum is misaligned with the IPV4_DEVCONF_* enum.
> 
> IPV4_DEVCONF_* starts at 1, ipv4-devconf starts at 0.
> 
> $ git grep -B3 -A1 IPV4_DEVCONF_FORWARDING include/
> inc../uapi/linux/ip.h-/* index values for the variables in ipv4_devconf */
> inc../uapi/linux/ip.h-enum
> inc../uapi/linux/ip.h-{
> inc../uapi/linux/ip.h:        IPV4_DEVCONF_FORWARDING=1,
> inc../uapi/linux/ip.h-        IPV4_DEVCONF_MC_FORWARDING,
> 
> Re-align the YNL spec by explicitly setting the first value to 1.
> 
> This misalignment has been present since the spec was added in
> commit b2f63d904e72 ("doc/netlink: Add spec for rt link messages").
> 
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
> ---
> Note for Sashiko/Clashiko: Targeting net-next, so no "Fixes" tag.
> 
>  Documentation/netlink/specs/rt-link.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
> index 7a72cd1b7e1e..8d63933f9910 100644
> --- a/Documentation/netlink/specs/rt-link.yaml
> +++ b/Documentation/netlink/specs/rt-link.yaml
> @@ -309,6 +309,7 @@ definitions:
>      entries:
>        -
>          name: forwarding
> +        value: 1
>        -
>          name: mc-forwarding
>        -
> -- 
> 2.55.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
