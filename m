Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853B2EEE86
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560046; cv=none; b=uMZcZa09od5dQnQvUXnMglMLQQXhHSl1R2+YBFfVIzL695L1nh6IHyB/49/qMJMbKnitWGyMvP3bu8CTzDxarHUOIjgfh1yc3DSRFkwMdS/BqgOd/+Yo5fjkfw3YeDPYvNX2JQmGGq6+RhLWDcz2NPMV+BtI68tDshhKHR7GxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560046; c=relaxed/simple;
	bh=OPHNT5QR+g9htiNQFjR9soOoMID34mRRR4uMOIYCX+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqv4sv+MhTgWWxy9wFO/YtzmHXnOQ8Kk1i8Cejcg23VXyLi2TTKGfiH+F++yT6FTFq1XkF4j3RdGVfSeNggUL//3AbJNudyL1642N3hN6y57B5Ow/7NQaL1KCXzC9x8LIpRx5kEhMBunvEV3w2bkjR/NyH3FwMmYpKe6hyRcA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Demf1ltK; arc=none smtp.client-ip=95.215.58.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Demf1ltK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OPHNT5QR+g9htiNQFjR9soOoMID34mRRR4uMOIYCX+g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790560042; v=1; x=1791164842;
 b=Demf1ltK2RA+Adh9iqydfE6pVr52koo4duoEjrjVWrkPqB6Fjapm9u1jYryC0Qv0wuOVTCy9
 GOBtnU0vb/Uj600LCb4aomLW4P90kHs1UQH/03gz0JGoe2jhwX3dUxx73BpD/B/hXVrlRqXbDXy
 JC9ta8QJyQILS1gqX4Oi+nCs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2ffe07d1375ca06c;
	Mon, 28 Sep 2026 01:47:22 +0000
X-Mizu-Trace-ID: 2ffe07d1375ca06c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 09:47:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: =?iso-8859-1?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <ast@fiberby.net>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Danielle Ratson <danieller@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Subject: Re: [PATCH net-next v2 7/9] netlink: specs: nl80211: fix naming of
 enum members
Message-ID: <arnHGuMt4iaa_GQi@fedora>
References: <20260925213918.204767-1-ast@fiberby.net>
 <20260925213918.204767-8-ast@fiberby.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925213918.204767-8-ast@fiberby.net>

On Fri, Sep 25, 2026 at 09:39:10PM +0000, Asbjørn Sloth Tønnesen wrote:
> Use the correct naming for enum members:
> 
> - In feature-flags, it's NL80211_FEATURE_ND_RANDOM_MAC_ADDR,
>   so "nd-random-mac-addr", not "no-random-mac-addr".
> 
> - In commands, it's NL80211_CMD_UNEXPECTED_4ADDR_FRAME,
>   so "unexpected-4addr-frame", not "unexpected-4-addr-frame".
> 
> CC: Joe Damato <joe@dama.to>
> CC: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
> ---
> Note for Sashiko/Clashiko: Targeting net-next, so no "Fixes" tag.
> 
>  Documentation/netlink/specs/nl80211.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/netlink/specs/nl80211.yaml b/Documentation/netlink/specs/nl80211.yaml
> index d9fdd66b497e..efc783fb8fdf 100644
> --- a/Documentation/netlink/specs/nl80211.yaml
> +++ b/Documentation/netlink/specs/nl80211.yaml
> @@ -97,7 +97,7 @@ definitions:
>        - unexpected-frame
>        - probe-client
>        - register-beacons
> -      - unexpected-4-addr-frame
> +      - unexpected-4addr-frame
>        - set-noack-map
>        - ch-switch-notify
>        - start-p2p-device
> @@ -202,7 +202,7 @@ definitions:
>        - tdls-channel-switch
>        - scan-random-mac-addr
>        - sched-scan-random-mac-addr
> -      - no-random-mac-addr
> +      - nd-random-mac-addr
>    -
>      name: channel-type
>      type: enum
> -- 
> 2.55.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
