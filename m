Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238367;
	b=i7izoycIt2PpOTBKIHWImVfgfU4pCPIBw9ZUp4wZwi0Y+9YL7GxXCPSlbgKafUfitQRt
	 Vb1e46QUO4JDhxdxBxTLpYL9jgdUYQjVTzipt6ZJ9DKG9ttuz1R+5hHtTOyOe5bn/O7c2
	 Fokp4rigfYugjs3h8jzIqhsO1e68btpJTHiyQEyo371BLdOqL2OxVvYP4z/PmiPFW5LQQ
	 XiDopypCg6Nkr61ZYpRSMm0cpRB45bl80J0bE6sAHa7d3za3bn2/SBuIwCBXihYAGzsBi
	 ANccgAFML1Njg3ePWWlFUgDPoP2IQLDS7gjYsBdKiy2vt4haiULWY7e5sIDtv8RVrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
	b=zXghOXVwmLpA/hATyIeOn1joMud3sSquW5tK7OQF9Iwg/2ylECHYlwEvwXvJhiCCk3Sh
	 R80qRC8tENtp4Xkz5vUntD+HZcQHxSGcE+yNg5JrbfkcO6q4YOEyr+sfTnUtwMn+WN5bd
	 6BZbxCCLVMhQw9MC99GfHkos5yIhr9F2w0sOTRryqPbh/+FMkpC+VszimUcKd3S0JuJ9D
	 82T/NkP7kTamfYZRaOBdRkHRoWzmwQpf1shpGfuiyfaC+MhR9m9TMuQfYOKDA2dlzjheU
	 Ql68sNJ44F/1OOZILwZ1k9BlG54DsrsbJ/Z6X/swyuoy8RYeRNdS9WpR7lz0a0CYN8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=baN5DaMG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B7606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587B7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=baN5DaMG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so724189a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238367; x=1794843167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=baN5DaMGiM6qHSdYHDSDoyHaIJOhVwf7Vg4GJegxyqtcXwtspqftwSfIh9oM3oo/ZX
         Qa0SRA2E9jlqw7hJb24zdbidMde+uXRfeH1b1ZN37+r6Z2DRQC10Qa/wR3n4Tlkefpw+
         nKHi38g9Ivlvpq1MdFCR9ACJD3Gy/80Nq8vUcutlAVjFzUCtucSoxeXY90hbJ2EdTaB1
         JQ0WqT547HRVbNWSXh7KTT7b0KL5ybEGVoWDdS4K54v0Ki5sKV5nTwfzc1aiOnfs5JCB
         8j+HnxD5sq+1t//BA5devnwABKBbQ6gU0Vp9rcEGDTk833oo6MLKSsEzYDIvFV+Pt3X3
         mGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238367; x=1794843167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=j+Nuaoj7tdo9db6j7Wa5rk10RYBVANksiKNsCaDh89JexNk8xDNQ6ewXhyGIac4bkc
         ng7jSg60Ak35o+fe7a1mJSsQ7kAhyV9t1/xuf0UWAVqHflfDufqcjaaYOBFRa3WjhKtM
         uJHyJjEglNiP1El5qauRmE8wdOJ8x+L8+1SOWuG2/TG0+qw/ayzN0Rt9Nl96Jifu9fhB
         QV9aXzj+Lupqd25vvU+Yn3HsMxm5XKkNG9dY6sYNRYktg1cUY2pDRSSDyBoDTb89TJQ3
         T5iFScXOPPKexCb6FHvRKy7PZMSc2CLgPpMKOy4/eLCxA+g8z708EJCg8jzfqGgreU56
         B1mw==
X-Forwarded-Encrypted: i=1; AL+hErHvDUfEmr2ZbNMV+wJbIIrCaKmkCaCHmm1O2ETT0uspgcvJ8rs+oc8tnt8YHKWFBz6QH7pwq6aUt08ZUwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vt1VNv5Ee5UQVPNZIszAXCqu/VAHc3vIxAhkXcgyf+QouRdo+
	7GNbVT6mD+aR8VWZ60khynz+nG3QKLIrkXpBhgVuZ1AuBN+pTQ2j5eBxs4vi8lyHot4=
X-Gm-Gg: AYBFou1rZSDQfxmczexVpdXZcOzK0OC0BoIUMIZBlkjM3NdflAHU036LjG15NEOzbHi
	ga/sgcZ9biSLn5DyREg0g07cLVy1QCCG+qiMl9iGuDIRUfyYidexW6arrzJFHE01yn4ZSrT5x6a
	IUXtWO3SYViU5oWJ3sgIOiXrpj3iZkthfZBbLhKkaa2tK+lUh/iLgoMM10TDzIM1qVgC6ew4/lT
	NJ21CUm2PIDsENY/mPAXv52wktoLisv6qy0rBfgHP/fnivuDoAzJjNiiomUjKNBqJ3NZxzud+2+
	S8Tz5+Ym6f91oJln/XT/IKu19esnaRbawE46Bcmb7X/KmWwetN6JzIg0mhqnvWoOhArIA+j5lo9
	7v1AuoqXRiyq2YTY0TedoVUhruEHrJJfOWggotQ67RjMMtWsVi26akMzBk0/Uo46Oj5gxTOyFpg
	eJ8/FQ+U81MOsoUvxScCg3Ncl9UuO3mAiGkkPz0nRk8jcrgc/SMjv8ThhS1aoInZtpZEoYpUo8G
	IkslvhaY3zyCTE8yBjjQjvLuQxfSVEb8fvjY948mog2oK0PenODdP01WawFWO2fFrIZvY7VEPUH
	P9ooJijrl6Q1KpW6NbDbrZw+6G1nc3nmIpdnAitoDRBIaUpputk=
X-Received: by 2002:a17:90b:5307:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3b12d51ee2emr4031188a91.65.1794238366553;
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd88e5fed3sm315273a12.8.2026.11.09.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:32:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: stm32_rproc: Do not request reset by index
Message-ID: <avHnnBUiH-kLOrCU@p14s>
References: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
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
In-Reply-To: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>

On Fri, Nov 06, 2026 at 04:46:15PM +0100, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a47e040c6db8..1443a4013d6c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -696,8 +696,8 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
>  	if (!ddata->rst) {
> -		/* Try legacy fallback method: get it by index */
> -		ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +		/* Try legacy fallback method: get the first reset */
> +		ddata->rst = devm_reset_control_get_exclusive(dev, NULL);
>  	}
>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261106-reset-deindex-rproc-3c1aa2e9325f
> 
> Best regards,
> --  
> Philipp Zabel <p.zabel@pengutronix.de>
> 
