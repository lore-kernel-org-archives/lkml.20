Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F9344D88
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367852; cv=none; b=hUFBlRKOkngduQ8d3iZCY0x4Vnhn4pvr358mkkjZMJv4KgNq+0Bxn31O1jXrAl4UGkHgfQ8cLiB4HlnhYopTzzaX9S+3JtinKmi1zMn1cYc6svwFEEeZ3RGuSR427vHmwCVWBddMUsH2sx6u2gfkR2s5cXlLxn/HcSVMprYLd7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367852; c=relaxed/simple;
	bh=k5rRICqrRTgGgXTc3CHRsg0Ro1RiUscjPIEybIB//jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k61mLkz6coYcXe2GzDFmvNsACwbRqMhPp9FfUc/xtAqs+Usq5IK8ZJRdO8B2525SqV1+Z5TP+rTdQ2Ejm/98/OccOzMfb61mKqhxEbzACRHSrxdaIoct3KosZMGRTksgqob8tGPpfLnW+5h8/SPuRDYNVDDfgiMtYX3JXUV/SZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEqzZQMc; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEqzZQMc"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso1155452a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788367851; x=1788972651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=YEqzZQMc8jd+4hkdFfpRzucoHFSAhnlu2z0N7je+l6HjjbVhDRGJKLnqNN3DjiijsO
         N+T6JFLBEUVsA6Knb1EoOynl/pAq9i+GO4REhFd3CnILzvzf2gXtjlGWDWLU8YGRrlgw
         zyMvKp/+k72AaI/+8NjgYyv4VyOQn9qff//T83qaDie7cNTFQ91HSB/7hvyqGLVTBwpY
         VGgMmwp1Vw7dGUny0GKdt1vwvnOp3wb6gFwpMn5oESYOnspXZjlyG5NJbSdmY1DFaplR
         v0NpMVzX2z6HGgQcTrBylEUMMU680bzH7YaI1MoN72IoXkVI5SMPAWXIxd+pYby1Asj/
         aI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367851; x=1788972651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=VU7EkmwBMm19zpOQFTPl3D7J5HJV9yR+Vx0EopVF7T95j6Y3qePlTzUZZF+fZEVVsR
         0/ZnQF/f4HZJG9BQeB3ZdKMGRbRQpODZF2WW56EXOvzttWtxeD+iOYxmHUoV1O/lNkB6
         paeWWl7NhtE2gutG/HUmmLsRJEOmHNDlWJeOJ3SSZH1o1rwnye1BlIq35jdBGfQ4OCoG
         joQNtdqtYlJs3DwEK2GAlL0oyQRPTWBbe6O6/CcpBycjmEzETl6DBNCcaVgrqPK9a0oA
         Q6YgyKv/DSpn1A/bNudm7IH4SnSVT77aetM0ClkiepmVCCPhAuGDCcI7lz0yny9/rQg6
         i5Ow==
X-Forwarded-Encrypted: i=1; AKwUvBytWPGzoAuiRytKIvZCLk6JXQFixYO55soB2QGwudIU2RH03zE7vRqg7DHOm3svYgsazBZAqo2TFzfx+LE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAZ0fQK5zCOE8kYpFlJkPqans2iRjYXIlsRmrQb6MFlwOShTLM
	HvuztLRw9R2UNVLMpNFrstH32UuJfP6xHQy8gOEHkQj0CNBXAEIjb/e3rGKNhivwAGK/LTUPU3f
	ksInp
X-Gm-Gg: AYBFou3ix4fweaYR+Wsf4cktUBCqbbw6YWGWXZyAHJxAZtsl34aJqFr3SBcyutmXFQc
	MPo5q56ABWoXV48loYvBAea+RV61FUQTuqO9flXctQfSWjRi0Jn+8FY4w6SLyrutU3siIVNCSOc
	beGRwQ41vPLLGXGcDfxDvpaoi2//klLAEM26dizERaIxDQvb3YGQRsFDsXBmPYCAiApZO7JzO2J
	B6O3LdDmJ/LwzCmt2P0YMtCRlLG/PjnESzGjFf1wP1H17LxtFbobvCc2Kes3GeON+2N1W/adA8t
	3Uc2cQN0ROGeo0obdzHNNWkxUDjzJspxXZJexo5PoDeDcpRCR4dEonVR4CU9YpsGBD1hhATgDgF
	zafb1Ui8/jHdU3xLagYJ7+sOksWm8i2q1sgCOV3ufzM5nKxEGI6hTLCKCSbDxlyQnv61OB8Pwfn
	OMpruyGZNJOTLgVbO9svJjgkxa6CrfXp+Ip0XefN2n4VEZAOgMxQlsj1JpBC/80R4y
X-Received: by 2002:a17:90a:d604:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39aee16a169mr9561954a91.24.1788367850624;
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm341938a91.0.2026.09.02.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:50:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding
 carveouts
Message-ID: <aphT5wHTNcGvbkjq@p14s>
References: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830133310.6926-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 09:33:10PM +0800, Pengpeng Hou wrote:
> The prepare callback publishes DSP carveouts before acquiring the
> runtime-PM reference that establishes required clocks and mailbox state.
> A PM failure therefore leaves the prepare transaction partially
> published.
> 
> Acquire runtime PM first and drop that reference if carveout
> construction fails, so a failed prepare does not add resources before
> its hardware prerequisite.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fd60c67ba8a9f..96d619daf3f5b 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = imx_dsp_rproc_add_carveout(priv);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> +		pm_runtime_put_sync(dev);
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -

Applied.

Thanks,
Mathieu

>  	return 0;
>  }
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> -- 
> 2.50.1
> 
