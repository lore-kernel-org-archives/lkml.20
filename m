Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F814ED1A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666530; cv=none; b=Mkc9ado7bEMl/BaVrDedkmaxogsY/ZL0jLqx6qUV8TAKFvqFAhM4VR7Ja9tgdtFPlInuldLroYNCf/3xAjjWx4w7vFazPIuiF9bxEedFgFfdi+db6ROlyAXq1i0IcoUsB3Cx+RrWPvBtMYDTiB+8durtL0oHXUm1nk4FWcIyb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666530; c=relaxed/simple;
	bh=Abs6oQjspUnZRtcLJSQo3YNVs75W8jWlv0aKIw5nibs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr0mVDYmemhA/iYPyHNxAtJrQw1rYu/wGwgTSGPTmE3VyIJS+dN/LXWVlfyoGINwrsEaLj9zW7I09FJTgAzjEWQFdrYaOEAIDz6EjgmsWHgMF3OlxJSCzVQT53yz90TH/U66PF6jCrUNWXUdt1LgT4AAFFOc847Y4esshLe7Vds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGrXpwNI; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGrXpwNI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so180245366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789666527; x=1790271327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzKZKOCuf/le1CjYXA1cH8J+uVC2s8tuoEzu3P186r4=;
        b=BGrXpwNIkqOjG4G2VZR/xyioRxFGmDTBuK9nNTxTv1mh4vAnbU/BrITxpJl3LH/C22
         YUkuYoadr5c1/oePgo2mC7dCEoWHkIsDQXTir2zL0d5uq7U6ujIb2WD/rqe25X98P4Qk
         nzyQCT/uzF/6/IdflETtkTKCW/n8HOIktJFdGSEiSMPTYPYUWniMrrNFV3mwBOP+JjTs
         Ok5tYiZA3/yuwQY0Jp36MQ4A5qoYTgclbcyvXlEs4FmH8wVya0J5Tkl9TGI3qWvjMsme
         IO7cdmiUG8tMYfMppFQqQN2vjjYN/3RgXXvWT4SCdrkDy0Wb90Fifs086qmFOMfXWToE
         AErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666527; x=1790271327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzKZKOCuf/le1CjYXA1cH8J+uVC2s8tuoEzu3P186r4=;
        b=Acii9UPlFEVnhvGIxHhz32VwcJw0iJiB+aOqh3Sz9gMsUSepxBvyeXDnkcPnj+T7qE
         Rt1nqIZet1/VoGLbkh2tJzkPfLKnaJiLt+B9rg3oytqQJqQehGUEUDgl4fSVibVN6ZhE
         r83l0+QOHV9YhQTlKCJY08hmzEJb/ujSRgRHjeT2y8bg8NZBisz1+rHiicmXPqneXaf0
         QWvslhgKSqvBWy0BK4YVuL2pBljkOqsf5wxLWHmEKGw4wNETH8cFnHG/skxwNgj1QGw7
         b51cqdt8L2QGdfKqUnnEsH4Cr9DQ4zwC70pa+2qoMZmpF8MHMfNdVpvJl7BV02dm2UU+
         ILbw==
X-Forwarded-Encrypted: i=1; AKwUvBwSL4Tzl58OtzpdYlEbS/dlN6IF++M7HqbnDo7fnNOp83ukV3v+Der37n1hSFp1mHWvYe78/AU7ZJNl0Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9I8fMN0cqXzLbM7fIOfGSLmuKAcE/y7XtmqGf/yH3Bu6SkL4G
	veFQNnVds6C1IxHqXaKXXKRvoFcikFw9fFfbh3WPG50kjkY5hOysJdX7
X-Gm-Gg: AYBFou0XOiZ/l2AJO/ntAlnavydpoyJplUBu1mGPiAO4sgEfg6cYZ+LuSQq9cAOIoJn
	hmbCWg5Dw/9BloBBlFpyuTHQAqC3TIVhieufGncMoAbjZ7mpT6SS+tKbGTh0tED2rFQfMgTx7a/
	lxUWJHj+Jsc7uDW1lWufTPfKZWxHmogkLyLNZ2nnTDF6WSi6X1RFgFQ+RhPyTOauP5rEt9D3wdZ
	VAXLOTjh8EytppprKkqUYFSFKxCBaWXvZF7KioW5ocL7ASkSs+MwcUhydkaECY9l9+KJsyG4m6U
	TM1F7v2ANe2FzAwU3MReV6y/DznFEyteTPSgwa3bWMdOQC/ksOnxdPvFoN6pGr6fCz6RoN8OoqH
	FTmN2UOQDVe/jR0nBiljHia8NvYNzxoDynWHHOslaygDQTTDscn/NLQMq6Ey/3UY3g4Ba0hZJ8p
	NdNQ1Y4u1PLM9oPjUVp7exqjLHXAODwlPQaxoAM09dPS5xh7ki/uzYBoHPmuCnanV6DFr17C68S
	+0=
X-Received: by 2002:a17:906:f5a9:b0:c29:45ad:7af7 with SMTP id a640c23a62f3a-c29e53088acmr526598166b.30.1789666526807;
        Thu, 17 Sep 2026 10:35:26 -0700 (PDT)
Received: from google.com ([37.228.200.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63bfd0sm311629166b.52.2026.09.17.10.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:35:26 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:35:24 +0100
From: Fabio Baltieri <fabio.baltieri@gmail.com>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B850
 Steel Legend WiFi
Message-ID: <aqwk3JIvOLD3rB_T@google.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-6-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825092546.669450-6-jdahlin@gmail.com>

Hi,

On Tue, Aug 25, 2026 at 11:25:46AM +0200, Johan Dahlin wrote:
> Fan control has been measured on this board: with a fan in manual mode the
> applied pwm value tracks what is written, and the fan responds
> proportionally from 337 RPM at pwm 60 to 933 RPM at pwm 255.
> 
> Allow pwm writes on this board.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
> ---
>  drivers/hwmon/nct6683.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 6825e6c3af34..df28055b1a1c 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -972,7 +972,8 @@ SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
>   */
>  static bool nct6683_has_fan_control(struct nct6683_data *data)
>  {
> -	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC;
> +	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC ||
> +	       data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
>  }
>  
>  /*

Thanks for the patches, I tried this on an ASRock BC-250, also NCT6686D,
and it works fine there as well. The board id is
NCT6683_CUSTOMER_ID_AMD and all it needed was:

-              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
+              data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
+              data->customer_id == NCT6683_CUSTOMER_ID_AMD;

Maybe you can add that as well once you send the v2 of this? (and a
Tested-by: Fabio Baltieri <fabio.baltieri@gmail.com>). Or I'm happy to
send a followup myself once this gets merged, whatever you prefer.

Either way I feel like this list is going to grow, maybe a

switch (data->customer_id) {
...

would work out better long term here.

Thanks,
Fabio
