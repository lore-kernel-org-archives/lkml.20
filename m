Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84874336897
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559594; cv=none; b=NJlBqZxfgBJzucUNhPYdSRVeghKa/VKMd2zLclBHBlhVXN7gwceLLbiTVlsfKAdE3s6ZUNLmvk4uAWfcS7UC3gvoVyewWUfKQc3vuRFYu28yfTgRwaldOgo8vYbe8nKuip99H58Ek7EBF83OwDauxmc9A2RTU0mSp3Pwz/DCBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559594; c=relaxed/simple;
	bh=UWkm7cFORa8mURaCMX5JnqWElh5FP+tDwq5XS8obKmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBiMRDt49CK6MIcin9PNtdBUwaGsmqa7wqQ4hY0XPVeo4yxvxuNSPH7uLpRfkf6Vf0atTbD6+e26d5RCSnJtodHcaEFpmffWz7gJaMk6LxX+IsaflQ6wPPzI7Q7RfJHHwCPX5gyBsQM7xaCwk82AfSspDE/0Hym+N1cpZ1ML8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q29NrTtM; arc=none smtp.client-ip=91.218.175.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q29NrTtM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UWkm7cFORa8mURaCMX5JnqWElh5FP+tDwq5XS8obKmM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790559590; v=1; x=1791164390;
 b=Q29NrTtM+UJF28Wbx0p9HoSQnv39PR5f9n//2KMP1boGI0x3aXQr/w9IV9WBXEcWgCeuuxPn
 5XiLNEn9VwqN+odbufevjumJvTkZCCBnnRCVgJBjzWhcjo3iadXQb9LnoXllQKHFLfuBz+/M43q
 rQEZ35pgSEOsI2n3FQ499Tno=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3b473abf9002e32f;
	Mon, 28 Sep 2026 01:39:49 +0000
X-Mizu-Trace-ID: 3b473abf9002e32f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 09:39:38 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: =?iso-8859-1?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <ast@fiberby.net>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Danielle Ratson <danieller@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH net-next v2 5/9] netlink: specs: ethtool: re-align
 c33-pse-ext-state
Message-ID: <arnFWpqnlZMKtbnE@fedora>
References: <20260925213918.204767-1-ast@fiberby.net>
 <20260925213918.204767-6-ast@fiberby.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925213918.204767-6-ast@fiberby.net>

On Fri, Sep 25, 2026 at 09:39:08PM +0000, Asbjørn Sloth Tønnesen wrote:
> enum ethtool_c33_pse_ext_state is misaligned with YNL:
> 
> - ETHTOOL_C33_PSE_EXT_STATE_OVLD_DETECTED is 6.
> - ETHTOOL_C33_PSE_EXT_STATE_PD_DLL_POWER_TYPE is 7 (not in YNL).
> - ETHTOOL_C33_PSE_EXT_STATE_POWER_NOT_AVAILABLE is 8, not 7.
> - ETHTOOL_C33_PSE_EXT_STATE_SHORT_DETECTED is 9, not 8.
> 
> In commit c8149739af86 ("netlink: specs: Expand the PSE netlink command
> with C33 new features") the PD_DLL_POWER_TYPE enum member was skipped,
> leading incorrect values for power-not-available and short-detected.
> 
> As PD_DLL_POWER_TYPE is not used, then skip it, but set the value for
> power-not-available to 8.
> 
> CC: Andrew Lunn <andrew@lunn.ch>
> CC: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
> ---
> Note for Sashiko/Clashiko: Targeting net-next, so no "Fixes" tag.
> 
>  Documentation/netlink/specs/ethtool.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/netlink/specs/ethtool.yaml b/Documentation/netlink/specs/ethtool.yaml
> index 5dd4d1b5d94b..439bf24e7c33 100644
> --- a/Documentation/netlink/specs/ethtool.yaml
> +++ b/Documentation/netlink/specs/ethtool.yaml
> @@ -89,6 +89,7 @@ definitions:
>        -
>          name: power-not-available
>          doc: Group of power_not_available states
> +        value: 8
>        -
>          name: short-detected
>          doc: Group of short_detected states
> -- 
> 2.55.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
