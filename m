Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB81D5174
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387202; cv=none; b=WxQQSlvZXDVlVv5iighPjcazSfJde3VHQRj+ddo+Wy8InZAhTxGVR/gw4UR7EMtTVQRks0Tkn45iQRcNeXTwh0AdDZzdF4TlTlPpz7w2faI2xCgYzOhBbbqFwgthGt6G+PYC7mU4/jYzP9NX1K8N04hJyoI9JqScndHcoIOj/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387202; c=relaxed/simple;
	bh=vwkqmE/L1SbBbgG7jkKKCIufo+UrUWTVHRbxZ9VQ6cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkAuyDAA29knY7YD1M4FpshMwforBMbITrjVxawW2jzOi8FSbgRc9x+V3cI861TS1RQ4A/lqtBzQGtRWJXjIhuaIa9yIB5BhQASXWkjWTniCPzUAO3f9yh118fBDQLWVASDF1ESY5khWNAqwrCjPHc6HINTc5mXXDgzjlzj24VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of053agu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of053agu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so9057095ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790387200; x=1790992000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NI/57maa8yM41Ln8iNyKbscX6tBjZSqd1TFGGzH5ius=;
        b=of053aguhFI71MJxd8gWFiK7K5/WJ4h88aBU++86+I/9JIy3dWFLWPNhcp2NTnmCbw
         WLCgiraNVLkRfzidgnH+OP3cBFR9FOphKFK+7N7NKNRx2h3owaT9YyK1320O+W40ra9d
         h7z5Nnn/CXA/zaSm+D8om85/Wt6z8fuO5m8V5U39e92ERT6vI41N+ElUTdy8wiMVHGex
         lQ1/LQ8bHlfZvSbiZyxmstyAu8EZOKRz0ZbrMkh3dneNFIlCUGXuwaF4/DFM/dxRE++F
         jMhDiQsvXKp9BcFu4OjDKYGAKibDrE3Vbdf1/uSE945mHfKsBYV5WKINz/xlGAoISDsq
         SuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790387200; x=1790992000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NI/57maa8yM41Ln8iNyKbscX6tBjZSqd1TFGGzH5ius=;
        b=WP+711RmAUPA5CNxIvW7L8ULiePEMGO8hY8hzhWYy2H67rwYWGW/sQ9tZ3JptTtQx6
         68bhRNDChjQwtxCdenEeXPhgYl7O49Jm4pPrrtFV+S9MEX6UKcwwE5kVeWKTOEja5kQU
         YX4bKNQM7JiOQ5KDOFbfM+i8fPdYqneaafe9CeCVxwnpgNt6Axlg66cOi7tWHPUfvjfE
         34CfdvggQUnMhYEwqIXeC8xUiWoeYCO3NvWCLNxh4ulHVGFWvEXIUIH2+iBSzmevgAZk
         /Pw4ysL0dUwy+ypYQa/wH7azJMGgFTX9+xeym6vBdBLlKXOeKBgg/FB+bP32+73QbNFg
         xdpg==
X-Forwarded-Encrypted: i=1; AKwUvBybxJNxQX8vwRmJe42GwTE3JAbBCyhQ9H8jfQx9kQpvVzwm1ekD57F4SxgkM3Ra3cpLWwbC3//zTLeTIbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mn1foO+3z2X1/5tVzeaK2Y3f2p9AWQHi8NJQIs0mR8gdZAnit8
	JVYUZvuQEeacqiOLvW7SS8mVcE0IWhURO3MH5QhaC9VDIn8+tBLSpuL2W+6JN/W6
X-Gm-Gg: AYBFou0jsza5l1q/orrfait6vJNPs1GtLRB3fv9x7hTNi21CAHx74bA8Wtvzqe2hYtC
	3oNHhz6dP+dFFEOz45HQDGrAVs5Ghu9XOpHcSfZFjq68+5KvTGAf/flTzb+sofshaMW5eLbA5IL
	xn0MAhnla1JJ6qCuBVTy7UjlY8lMTVCyrNo6vAt4RCJmFdYF2jIFuNjE+vf/U60wOKpeCcXs2mn
	JCJH1KZ4ECxupA04m0Gj/ozsNDScHMtH5A0wc/vpv8l813umr4wwSvblCEK+F+5XChIeK+5uRjs
	d0tkDtPR0ssJMjCZ8AZLd9LIsHL0MQ6tMEJvxRjRQgjEFRFC8KkYHfqwXvb8/qGcZZ83Z25s8yI
	zLYxkzyxFHoq/+fmUxzLxnFXsteMXU+6ajKomS00qE0JmRCVzbJukzzDyFlYoQAMxLigvymlBTu
	nTTnYcyd4vGipkutT/EdkLbW90j8aKn9yYD/g12ysSkUeUzUwAE8LIModxVcppZpTThqI9rFx5W
	O3M8yRY6ZAsYVXPQF2daX8=
X-Received: by 2002:a17:902:ebd1:b0:2dd:c100:9434 with SMTP id d9443c01a7336-2df94c1bc03mr31488365ad.50.1790387199777;
        Fri, 25 Sep 2026 18:46:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e030dsm17439105ad.16.2026.09.25.18.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:46:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 18:46:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: alexei.solcanu@pm.me
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH] hwmon: (gpd-fan) Reset both fans to automatic on duo
 boards
Message-ID: <78883f5d-e9b7-4fc4-a15a-d5ece6c9c8c3@roeck-us.net>
References: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>

On Fri, Sep 25, 2026 at 08:13:26PM -0400, Alexei Solcanu via B4 Relay wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
> 
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
> 
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> ---
> Both fans were set to full speed (pwm1_enable=1, pwm1=255), then
> switched to automatic (pwm1_enable=2). Values read from the EC 15
> seconds later:
> 
>                  0x047A  0x047B  fan 1     fan 2
>   without patch  0x00    0xf4    2542 rpm  6379 rpm
>   with patch     0x00    0x00    2545 rpm  2560 rpm
> 
> Fan 2's RPM, found by probing, is at EC 0x0476/0x0477.

If this system has two fans, why does it register only one 
fan and pwm channel ? This seems conceptually wrong.

Guenter

> ---
>  drivers/hwmon/gpd-fan.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index ed212615b2f..b3b75f99f58 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>  		break;
>  	case AUTOMATIC:
>  		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> +		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
>  		break;
>  	}
>  }
> 
> ---
> base-commit: 3cbb5f15e464583e59c8501a7085ec12b53e23ac
> change-id: 20260925-gpd-fan-duo-auto-871de9e006dc
> 
> Best regards,
> --  
> Alexei Solcanu <alexei.solcanu@pm.me>
> 
> 
> 
