Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AAF3876B3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500623; cv=none; b=ozco0na8Zlw1E1H+m3brYnk1ZPGgdJDS2oP/hHcofJ0VlGb/pDvySP62SpzzNQu9r6AmRe+oywA3dLt1vLJ/KvpjcZlyJs/Ff95pqpgYF59yhP6pV6DvvtjCVv5QkXoFFTvFxlDZAyuUCmEYf8OIQ3cu4N9VMBF63RMjijj0vAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500623; c=relaxed/simple;
	bh=87tW78USOIRu124aJptnXZ1ORwFWyuAoO45i3VE7Rzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRjRl4qPdFqVywjISlVp0zs17IlWEDKktSkYlJ0ADDdgdzD3cDdjM6Z21JpNUaRuCyQf1u8Xx9mcVnLChQID1pAFAuGKGAUiE5fEzqyotxcriN/gzoRprLK3/YPV2MyczsIvG83ms+yoiHSkuuwfVUj22A4iV95E4u4dWoBZSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSWx2XeQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSWx2XeQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so444808a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500621; x=1789105421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=MSWx2XeQ6YrKYuEm/m5Ku+TmLdgF3ADdeLrlhKjWuUYqYQsk7yysqySZ5F6SyNtK76
         eMAFuO+DBRnJvZ3w3JxHK5UB1g6mtzydM/mwbPM4GNNPVVTllQcKFMbDhAsZ1VzYs7kd
         9rir0tqJ43541t3lwj/+YOxuKm8DgoyrwP9ZFsZxm3Z64vEGHouWTDOTI8vQo1faapcD
         R+gO8HKSRtCVANqMSydPf5Y4iVfwVhxi1kfl9iXlaAecIMF/X2tGYwJ/QgEkWj3dSxdY
         96bHNVPa8OwG+jOZjx+XXNo6AX1S/x7cVET+dDm8PmEyGBD2UenaSmX33BP0hv+auRyg
         iS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500621; x=1789105421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=M0jXO75dOUr2Tp9tc9ugKCzASqIEOWcRsTdQfcFfWQoDBDPwYo1bp3eHr5VyYH5XqG
         +etNRS4DjZ5M84xxpCqTQIvtXsTnlI2pxSyNWA6C+IlThKebgrgRtHoWoT5j9nsDKOYn
         DXnA2eDUpjXBOwyA4RQmM4P0jrYITjWlTpJh/MMkWGRMiKUjd7nKZEqxGBHqVYaXE8xp
         9DZFaatpO3srcCJy6omWqkv6HuOygG8URfxasb7UWEsML/AyqsjmQzgT2CozS1ySwf11
         dG1GrYkBKfshNGcLM4pwskMn8qRzYweRdv6TYLppKv/VFW04uB5rXpC7YOureq7JMant
         mvyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4eIBXkqgEsbpT0m7j+EHwvSNHOditu7xK/9/tfmqgIeYrW5BdGLkgBWgPTreTLVUuaPSxy3wndiaUCU0=@vger.kernel.org
X-Gm-Message-State: AFuF++kDBleJ9pjIewcvb5X5KQv9kSxsYs3Ti7FTruysmg3FUfNiLV6D
	sgifuB4bkW0dIZwYIPOPAQ4HRp51+AEiqfgMCgSaaktIi78zvaML3iz4X+un3uMjFFo=
X-Gm-Gg: AYBFou3lEquPpAb8g8Nc6MT8IMl3umpCfu7dELwdHcYyurA+Wb1LisYicIQt4GsIkoB
	at3P52A/6rP2gc4DgXin/TusBhJ78TpF4VAFICIuacuYB1MGGYn0DvvHgYMY6q78gAacBkI7gL5
	dwq9YAYhbsXVLV0QsgLmHCVhGzXmKC6oP81w8plT4/+OM5zgzI4dFtPkfXgcppknxzvOpijCFD2
	jeRvoy/sxaguQT+QJaECOp1iWt5iG5lphckWpONXAsg8wMgMg3vLhIMd808pCjxciaxv+T7W9Jx
	mPNbQL7tik2YBiqtRE0x+m6wWyvnvvyWESfDVDuzLIXuKka2ajFNhJZxVDmmkSw52/Qygxd5x/H
	+NGGLIipp6qTsPYTlmO0cShP5a6D9q8Qqbw2VWy1Z+6mQg5vhunpCXSnKUqZFZNJLYeJgGiju/Y
	faLC92LzZNxY/SmsyG+7ddJGmX9fb8GQG6D507pb15ThOyXOeV6wyq/Uw/qMm98Js=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh
