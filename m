Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023838;
	b=x99M+X7XrOctaILiUF18yF0hosvNONCgUmEy+i3EvsrN3HNt3BUvbH9u7o8VbN9PrqXp
	 gIRXl2rpgtn/3EsCq8/A45ADZimFru52SapN+Pwk1TV0l6PUuKihUyy9KiggW86kYAk/j
	 JkJFHHxTa88NmIDI+gl8h3JV6PpWy1z13nBQOQ4rCuIryT1eciy5Uf/46J3iL7Go/UlnO
	 ulxXoYp5F7yFSKDD80t8Q/EnaNTT0xx6WC5dpfQU56RgrH9wx3UIZekGjSBHlH2VRMMo6
	 RlOAwGSlPDNAyEJSwCPcT9diJNsq0fmGuW/+wco/vB5vqxUU+fbgiBukh6Njaw6cLUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023838;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XLVhkBHtjhTfK6sBZOK38WJWePJ3NEikSwGcu9QP6Sk=;
	b=a+8spEjwN78RkESlbzSgk4n7a963lNCqoUOdZQuOifPHar5a0RhDOePIaAUclg08109L
	 SztlmW6P2rY8aqQ2BX6KWYCX+w64E532+vuxS/sbOCPmemMZVeOgHZJ51YPsNb1aPg+8l
	 YT5NYUOskNfG4HOh9v4NPd7l3lxS+x97XFXoTqm/SH7AboIUVf8SQhx3cl2kZzsL5d7gy
	 0gV3aKiD96+erD9RFjD2My05U27ST3ajizDSxGIsOCnubxCM2pw2hrdw0+J2iEOuni6Kj
	 2MEXDzPl3XvB/9+imcu47EfsfBTfxvJOPmJZgCc3EO3JHHf3MQAlZ5Xt3isawt53poA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=WQ2gdTci;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="ly/WNPEb";
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE59606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE59606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=WQ2gdTci;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ly/WNPEb
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6EF611D003C6
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 26 Oct 2026 10:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793023835;
	 x=1793110235; bh=XLVhkBHtjhTfK6sBZOK38WJWePJ3NEikSwGcu9QP6Sk=; b=
	WQ2gdTcimVXGXgAuw3V5g5ba6l/vd6QMmbdWc74KPXxfIDFV7sBJNvaGyXaZA7Ib
	fdR7n+UGpVavfoZKjnjvgObyJI17WLOGUPerNkcJnVmHXrbyv/cRK6J+I4gi+RMj
	o02XhHBvjxb3NhPbKV7Z1nX5GCWzvINaEJGDzU2BNtcU0EPVmb+J6Xk4UVI+BFcF
	uO9vjJXw5XzaflWEB6cIH2318csRFJkO1kgJlPj3OJd+lorLJlyzZKnYTTYwC8A+
	h2L1j4nq1LtEB6jqhyBXAVdV0gnfz7ITNnoqY0tctbyhYeFbXl7WS6sY/XGhmvtd
	VOrOocAVWvPi7EV7qjUltw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793023835; x=
	1793110235; bh=XLVhkBHtjhTfK6sBZOK38WJWePJ3NEikSwGcu9QP6Sk=; b=l
	y/WNPEb0LgOsIM3nozya9tCK1dYOmkOmJL6SVpbTHHQkAtNJhVuOBXMavqU9iulu
	qd9bdXy6hBs0Le4pc/RESaKD2lFfdFsABuJ1BaCyioCc1nfmbGhx2m6i1iS4h1xI
	lo7xfZ71bcLp3Fuxjq4raVTK9P/viLc2E97ft03GZCuTjROAjmq3lItNc+9Qbr+u
	keQTBiB7bBVCd8Lkm+X1t6iGC507c0Pcy3+3NXOPR+I2r4x3oszvAraUeVPAU6k4
	qtC4ZwC2U6He7llyFpND6w30DxKn5OuihCXUMyUnwKsqG6y8Yj6Ie+85Y+nCReUM
	a9AELYUgHDZ6NaOywFX7Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793023835; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:o+IftSt7kWTIu1BAQsXSnbG9LNIxTSG6fwY3erQCgF2sBWi
	gHD68p9DxImE0F8FbnkKT/m/O+ZYBZtdImj1prtgyjzdnFoG+XSeCdgDY4hAAx/l
	Q4U94gu08OOZlInRPLQ6wKtph6K/7EZ3pK+o+bpA+jE1DS0tiHesg7qSF4vt8jCG
	UBfgO7Ke1/XOnevuACQWw7ESSNYiXc4joOh6Z+lhzoGkB151a/GL7xHQA9dgj6lo
	qFDXa9sT44usnoiTXZwxKcSbHLjaLgOv2/Nazz/Q2jDSN+TZa7Gmpk+awwrAsyZG
	whartWjLfWkF8oXlKVZ0M5Od2IpWzsrcvKlWlhw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XzEcp+Ozae87qecEvYved3QC1QPxoGcgWPMqu2hG1g0=:zuFTg6IUMSKvZi2lLq70VQj5/NkNvPF1cpPXcpL8qEo=;
X-ME-Sender: <xms:W1_fasU6Bzh6pbyRKUl4jNodTNT26Xmt3VA0z0kN_qtm5rxSFkKfxQ>
    <xme:W1_fargirezP4LcAIpyNkhTiKk9TPl32TUqfvx3fjFLIasmdoPf18R2KgSlPRapa3
    n_a2GeN3aJsA2DHiocxrEtDa776PxIhL1LlZW2YctX8fXKF_Dcnpn4>
X-ME-Received: <xmr:W1_favaOkfKwDpODRAODM_vv-AcjK0Is_0Q8KiFS-FXbyTJ76OoQLLkLd4jBYIA1y9mFsEEsNrxV_Qs1CugJ6iSIe8G46P4>
X-ME-Proxy-Cause: dmFkZTGQT7/RXl7n6WAVNPPvAZx84vdlPRvmoGm/khRwDVvlfPsPgzzSNxg97AtOI52LtL
    0hi3K84iP0yq5S+RIdbLUHQSX17+naj0H8NTW8Xqmjv4J3Sq3s27F4Sqc3536brvgwiuBw
    0gAVwSTp5vqrTXqIAU5+U3indaTGlaIixws/doLTqQL3OLC8XWttg6UKOz/XZiyohHlqDc
    A2TddgWEZ3XZJcyqWK9rCRDPFhvomVwxETdCsHPFWWbGhqZCE48DDlLWrRl9ml7kYEUuIt
    /Hlt0hwH6GkyVnCARcbpxcMctZ55G8si8jVA+vyFH+IvqB/+Rj8kJzug+7M3i42KST8mGY
    EJi/s4QvlfCOvpS6cef2zYLmZO5ocQf6zmWZjEcfLrS892b0oBnJeP13ZfqrjN511Pun4r
    q0ch+Lzz9g0YNqqgAe9caomKxQ5HNTceYPasoAqHJMGwc7dLTObe2cCAXeGhnWJREXrIOF
    Knn5EAwnVku9kKG+DIsghbASTDUO8mkHHm4pte72iQOfQe3J+sBy64dgtRSbboN4IK8ejz
    Pkjp6//78zK5hsExguEMPBMm5LyPSeb3eybszBZcVJVuO+tjjjCO4bGRT2ztFO4Zs6vfGX
    uBGBW5sq71w5Tw5HwNnFpdx2veTF2ISa07A99t6Ilq2racBnAPgUKhKhOPFQ
X-ME-Proxy: <xmx:W1_fagrnACwRJGet0J46ncZVniP14pLA5jlXKt-PACUIv6c9s3ftEQ>
    <xmx:W1_fakM3cSDBDKjoA3DR04UESc_dh5zHbcd48J3df82DbHU_sJVdcw>
    <xmx:W1_faronTiLm6IYskszt5h_aTQoud7uZ4D-aq3pczX2gyfCiC0LrNw>
    <xmx:W1_fapfaJAZbDCJVk_Qz71ThS9Q0NeN7Y33GgksSQiUtpez56VNSTw>
    <xmx:W1_fahN_oREadKAOMUg4A1NmOX1Mu7qQoeHUrweJ-LVBcGBqG8FTdARc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 10:10:34 -0400 (EDT)
Date: Mon, 26 Oct 2026 15:10:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rppx1: wbmeas: Fix uapi documentation
Message-ID: <20261026141033.GC1959885@ragnatech.se>
References: <20261026140215.603906-1-barnabas.pocze+renesas@ideasonboard.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261026140215.603906-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your work.

On 2026-10-26 15:02:15 +0100, Barnabás Pőcze wrote:
> The format is Q4.12 as already mentioned earlier in the documentation.
> 
> Fixes: 884d6794a816 ("media: rppx1: wbmeas: Add support for white balance measurement")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Nice catch.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/uapi/linux/media/dreamchip/rppx1-config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 3507a9ab03dfd..f7c5a88922444 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -154,7 +154,7 @@ enum rppx1_wbmeas_mode {
>   *	   @ymax_cmp is set to enabled, 24 bits
>   * @max_csum: chrominance sum maximum value, 24 bits
>   * @min_c: chrominance minimum value, 24 bits
> - * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
> + * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.12
>   * @reserved2: padding
>   * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
>   * @reserved3: padding
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
