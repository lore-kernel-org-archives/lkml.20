Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF2265CB2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306489; cv=none; b=e+Q7c1VzZHajtE3dsE1uciED8VuE5W4IOmNhEbeyvrnxIDWZgVFlmkXc1sYbNUqdearfgkqWJwXY2jsbBBgERB9w9qdlhgrK5Uuox/kYQRBiwOED2OM41giChBsVKVywDXJmu5oqgBSCpHRgmGZegWrvYSAU6dKkCFQ7y6Dbw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306489; c=relaxed/simple;
	bh=Q4tSKD6D0XahfnZunTxmsWN7BQKMuMqFBs3yEe/WlRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmhOZhAYBRjUZmpQ7S8TmPUTI3urcO73O6uDQOwqA38Vuzg/m9QUkatjhAiac6CxrnkhOJHSFAoMnOlI3IsRoUeycCTIfiuHovSd5wZSdxKETgp49IIUt50Qq4uKGkTX9qMEdil287/xF/p8BrUzYeBQ1mexHpQqnRCF/ub/2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g0443Vf2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e5nWGSSl; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g0443Vf2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e5nWGSSl"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C7E841D000D0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:54:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 18 Oct 2026 02:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792306485;
	 x=1792392885; bh=lN1dyBvzq08m1ZlZfsFoTFeonmBGcGXcOhyZa0SwwO8=; b=
	g0443Vf2hiJDLQrZolj18knSr7laXlvXXZ9sdrDR/TcF0JMH3vBqX5fNXhbxsLp2
	yroCrngFLqNpKDXHEXoFaihq6PREYH864CGroliX3ZDVZ2xWVctiMPJrqfe/SEEr
	gTWf4PpPlv08PvZX7Fwd94qvXS/okyvrYNggc2PzUUxzM/FSmb3nxoo10Bjdf/rD
	KGbj4R9gYrTFKr54tgjRR1Pk0BollC8byGOXvBLh8EEvHu/Ii8QBwUdxxrXCE0KA
	0wY68MMDrL7d/hGCQ9jbX4QEaXgtgQakKFmscBGOQR+qPjLzVYoO7xlQLpoS9Die
	uAJ0uXmBQcx+V5hP0ZjjbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792306485; x=
	1792392885; bh=lN1dyBvzq08m1ZlZfsFoTFeonmBGcGXcOhyZa0SwwO8=; b=e
	5nWGSSlga1yoXMyFtCX49gd7m8DD0uKOH5au4by9jUkzAJDD0Dav7ESJfMuQAaJK
	WdhKjvFFNx1kkG38VyjwIUfjeLCOfY73spPoQgn0I3pKKVNtTfFGfmi5LfrfFYul
	l8/lUjml6wZ+Osun3Em6HvQNejM3Fztf6IYACn+sZQDAMtClRZu5CmH48wk4cpWZ
	uHNGcjUUSbBWG/iR54W74HcCn1XtsSYDzIQttVdKSPYZEHuY4uCMQf7FQOTKG9ba
	5y2OWwYtxyPK3bpwofQQ9Diw/LUdaLC0FE6uLJW44T8wLOkOxWNllMJGV3dPg1CN
	a/XkWqn0WeYjTVFl7sL6A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792306485; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:MODpQrfxXwimAmwNFwcq2UnrZZmLH7vB7EPn0UTKymvWa2V
	BJ8pvDFOK6x01epaels1srMoeBlOii1tpK/EBbP80frA3pLVuHNDRcEXpV9kK/ql
	60c5zDYEJ4QOYEAqGl03CrKESqep4+zchQdiN6vzNRT1f9sZEfMUsh0LbyO8kxzk
	Dt9K4nTtHIIg8EPvi7C0q8typLM7SDmCm14Yc2rRkGK24EcceI+5U5H76COiPpHG
	83zyo80rPNCTx8ZwpzHLai1q22224EuiyZHdfTMZnD3lWtxj2hT43xFG4gzfnCwz
	hPUYRnzDroNf/0ZSGo/IX3KITpL1CEH+j6O5R6Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:H5P+nTOwYAqJeHBaea3z4tPxD16JsjYqMzGwLayu4Y0=:Q4tSKD6D0XahfnZunTxmsWN7BQKMuMqFBs3yEe/WlRA=;
X-ME-Sender: <xms:NW3UahzZVwn8GfOYRiAvxQyHmflcF3ouaDspQfT1qie1T2SGRf1X5g>
    <xme:NW3UapepuBeXyjWBf9ffSnGh-15CTg1xSxu1Y5vIsybeZFzCH3vsQiL2kJUN4CVFD
    9Rg3D3034fvhOvvMwTPKmxRhlNkBADbxXqRloInsBcYvbnkVuzvXg>
X-ME-Received: <xmr:NW3Uam6hrNTceO2UBS-XBJoarwlKHfwgrKVIag6c2Ee8Y2rVrdqv7hjGHa3vVT5TKhMExgZUT3SKpbqNLMwHy934HXl1qAI>
X-ME-Proxy-Cause: dmFkZTGxwGwEgFqOp5XevDFdj3EQQVCsVex7OvjhbSxN2DGdZ9JwfumXz2YEZNnQ4R9ey9
    vqyFnBRJFpWCfGoSJZ3UeTPdbSOuwGtEn4LcKYYkUF5Y8PbMhOypToaU8zA/pJWAgtTQQE
    NBvBNmPLqElfV/kuD0G0TefIqYn7X3vSlKSebrWRObxHsgBKh3fUxDJcAwKoEwBDC0y7So
    qK9d+wvK7TgoCIR8jvcGfHx2KtsJa8ne0rS5wiZNZ6DquHfyZIyGU2YxjEOBW/tG7C9q50
    /tHrv9ygwHMlBdYtbshjqJ9mml9CUmPXob7IFLqyUxjq3SzMWmmEiGoSHWfE5BmkwfbNMs
    Zk//DdMvvNaB4UsK0J9Rov763eW6v5ttnTSRuIk5XAsXHlLTtgxyM1u5p04ACstwA7VjJ6
    S33UmR6udSbdrugfSBV5Wlg6TV1ULZSbBgeWudtm45FqFd3DdCTi3uRCS9bj3J9I7oeRPD
    D5AhTghVIfojZzr8Kce/IaIs5n+cn6gkcCmm4TP0XFknRmhfyC16KB/ekcYv9OCUoqlcrl
    2z28a4UeDRizLbbCt/Yp17akRvTW0vZe5/ujU3ZDcyJ7phLPVIEFYe6g6GJ0CH7OM90cz9
    NJv7CLS0bDpOpu3G7kmBfoMDUWzJbrzmg3F69NBgaLxuG1NsKUvYCOG5wLjw
X-ME-Proxy: <xmx:NW3UauIVaj40-XgDUwfA2oOOXr7eY4_dd_-qTnkb_o137CNbq7QTlQ>
    <xmx:NW3UauygegLKQXz7NZoR4IezXdZQeU2mupfwxzYAh1h2u8JXoH3Byw>
    <xmx:NW3UamJfPzNS6Watz2jhLc6R_e_y7eTYiIcvRbm4T9MCDx6_GUN5VA>
    <xmx:NW3UatXD0HtVBijKSGw9cqs__4wd1I6LS3tjn2gVuNdSPtUeryjkvw>
    <xmx:NW3UagbXkR7rq1ggw2hjOB4id2PMRVSpUZ4ft2PmkIITMIyofXLoefHr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 02:54:44 -0400 (EDT)
Date: Sun, 18 Oct 2026 08:54:42 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from
 registration failures
Message-ID: <20261018065442.GC3577260@ragnatech.se>
References: <20261018024654.3913088-1-mhun512@gmail.com>
 <20261018024654.3913088-2-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018024654.3913088-2-mhun512@gmail.com>

On 2026-10-17 22:46:53 -0400, Myeonghun Pak wrote:
> risp_probe() interprets -ENODEV from risp_core_probe() as an absent
> optional core and continues with the channel selector. Keep that result
> for the existing resource-setup fallback, but distinguish it from a
> failure after core resources have been initialized.
> 
> The following patch moves the core IRQ request after RPPX1 and the
> registration state have been initialized.

No it doesn't.

> If that request returns
> -ENODEV, its error path releases RPPX1 and the VSPX device reference.
> Passing -ENODEV back unchanged would make the parent continue probing,
> although core->base still indicates a core whose resources have already
> been released.
> 
> Translate -ENODEV to -ENXIO at the registration error exit, after the
> existing cleanup. The parent can then handle the failure using only the
> return value, without inspecting core->base. Leave all resource-setup
> results unchanged, including the existing fallback when VSPX information
> is absent.
> 
> This prepares the error handling for the IRQ lifetime fix in the next
> patch; it does not depend on an existing -ENODEV return from the V4L2
> registration helpers.
> 
> This issue was identified during our ongoing research while reviewing
> kernel code.
> 
> Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v3:
> - Express the distinction in the return value, as suggested by Niklas,
>   instead of checking core->base in the caller.
> - Translate -ENODEV only after resource setup has succeeded, keeping
>   existing resource-setup and channel-selector fallback behavior.
> - Describe this patch as a prerequisite for the IRQ registration move.
> 
> Changes in v2:
> - Split the error-handling change out of the IRQ lifetime fix.
> 
> v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.com
> v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com
> 
> Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.
> 
>  drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 586a5adbedfa8..373d9ca9374fe 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>  err_destroy_rpp:
>  	rppx1_destroy(core->rpp);
>  	put_device(core->vspx.dev);
> -	return ret;
> +	/* Do not report a registration failure as an absent core. */
> +	return ret == -ENODEV ? -ENXIO : ret;

This completely misses the error code from risp_core_probe_resources() 
which, as I understand it, is the one you initially wanted to 
differentiate on? This change still propagates the return code from it 
and just chnages -ENODEV to -ENXIO if it happens to be returned from 
v4l2_device_register() or risp_core_create_subdev().

Please stop using an LLM to throw spaghetti at the wall and if you want 
to have this change read, understand and change the code by hand.

Nacked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  }
>  
>  void risp_core_remove(struct rcar_isp_core *core)

-- 
Kind Regards,
Niklas Söderlund
