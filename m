Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3F41D228;
	Tue,  8 Sep 2026 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858505; cv=none; b=uWhfSRTdTf68/cv0CcrLbCuoABz6gFdSMGsooD/QXjZNa8+WnH1T4Oc5QYIEYBzPZH+T2fVBDsjr3jM461BMePSV8692+eobZjBT4OJpxRUIMBTzSQC7sKHZzW69Y+47+EH0xhPhjqzybEiHM+u6OHx+db0qZf3QNPQEruHlzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858505; c=relaxed/simple;
	bh=Ry7E4jTeAiKPsE6pTAOh7cyG7/yHT/4ZkukID9i1Vno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=icW8jrytV0VK+q3sRyRe6gx68QRq10jRZ170TnNfTBmAHLTzs36P2qqoVP/15nkdILlXqrnRLqpSzGalKik/Z/gEgWextm7AOtG/d0Ocicz6chAOlwbQaJ5kilUdsY4qslfG61l/aq/KNS2aVFosu/9zDsOr95AmMNxorBy9ZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0SEO8Er; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0SEO8Er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91E61F00A3D;
	Tue,  8 Sep 2026 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858503;
	bh=fhxWT3q2nnsM5certN31wi1a7jSzvdrawbF+V70q7I8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=V0SEO8Erd/XHiUKs3vL2wOic/ptUiZYY3WADhJLTgUzEEPW+tKMHvZEnqB9/gmnx1
	 Djm+oWxHFE1rHvCUjPkKk6+O5fn7T1AYuXTgJCWv+Nx3+EFQ0dzWIuKV3IwhyYhLJc
	 1fX6lVeSrX8QZItSHFOfBU7x29aQCqsD/7nr5BtiG4WGliNi2OSFuko6Yl0TnnKHI+
	 EzWmFna+ALgZc/SHVYcgIckVA05y0/2O4RuSMaH69tCUdZVTaCEtHG84RoOybaBUcp
	 Zw+COf9VkYLbuAcVk1NSZbEXlZs86pZYi+gvYiltUhdc8MC0oxhrMHVnBdrETUZmz+
	 lu8C7aXGwEB9g==
Message-ID: <507ae44b-1e1c-4ce8-a6d2-69d64d160eaf@kernel.org>
Date: Tue, 8 Sep 2026 11:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: adv748x: Fix endpoint reference leaks on probe
 failure
To: Ruoyu Wang <ruoyuw560@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260814134106.1387486-1-ruoyuw560@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260814134106.1387486-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 15:41, Ruoyu Wang wrote:
> adv748x_parse_dt() takes an extra reference for every endpoint saved in
> state->endpoints. If parsing later fails, adv748x_probe() skips
> adv748x_dt_cleanup(), so the saved references remain held. A CSI-2 lane
> parsing error also returns from for_each_endpoint_of_node() without
> dropping the iterator's reference.
> 
> Drop the iterator reference before returning a lane parsing error and
> route all parse failures through the endpoint cleanup path. This balances
> both reference classes while retaining the endpoints for a successful
> probe.
> 
> This issue was found by a static analysis checker and confirmed by
> manual source review.
> 
> Fixes: 6a18865da8e3 ("media: i2c: adv748x: store number of CSI-2 lanes described in device tree")
> Fixes: eccf442ce156 ("media: i2c: adv748x: Support probing a single output")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 3eb6d5e8f0826..010a4c55b4002 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -689,8 +689,10 @@ static int adv748x_parse_dt(struct adv748x_state *state)
>  
>  		/* Store number of CSI-2 lanes used for TXA and TXB. */
>  		ret = adv748x_parse_csi2_lanes(state, ep.port, ep_np);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(ep_np);

Shouldn't this set state->endpoints[ep.port] to NULL as well? Otherwise it will
be put again in adv748x_dt_cleanup(). Or better, wait with setting state->endpoints[ep.port]
until after this check.

Regards,

	Hans

>  			return ret;
> +		}
>  	}
>  
>  	return in_found && out_found ? 0 : -ENODEV;
> @@ -739,7 +741,7 @@ static int adv748x_probe(struct i2c_client *client)
>  	ret = adv748x_parse_dt(state);
>  	if (ret) {
>  		adv_err(state, "Failed to parse device tree");
> -		goto err_free_mutex;
> +		goto err_cleanup_dt;
>  	}
>  
>  	/* Configure IO Regmap region */
> @@ -809,7 +811,6 @@ static int adv748x_probe(struct i2c_client *client)
>  	adv748x_unregister_clients(state);
>  err_cleanup_dt:
>  	adv748x_dt_cleanup(state);
> -err_free_mutex:
>  	mutex_destroy(&state->mutex);
>  
>  	return ret;

