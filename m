Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BFE483BD5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782789; cv=none; b=jB+jXhtsUPntgGAqnUXywQf1VTyQYXpmCCjEcHkFKqNes7FpcApw8kV89rx1pymmxKzNtclwYUh1voZT6QsgDUiMhHBA9PzL0zRj5n1RE7dfbPNhIvS64wk5ZztEJ9xkVnjABH4qitCat3n5csU/Sl5QT7r9ydKbDfP/BdWWdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782789; c=relaxed/simple;
	bh=S9tHVz0KUWoQgg2OMR1yUXRyftZyF9ufT6cdmiqBYRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKWLNkfsAbRY3whS/FY6p75f1OucaefhkeaTDdwRy8s7mAS+PEwuErv72eSpAEjbFn9VpwmhcTOH/gd3e0AVBbya5jJNOXzk7Wn4pvW+CoIGhDQivpT4tmK+4HYgCelD6+oN8W/Aw0psGtvUuGHiv9Ou9yugFuINPB8cVECi93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaQ61reh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaQ61reh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbee846deecso4260333a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782787; x=1789387587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jalcXwT2Yf1NbQPCnMUl/zDvl6z8nL40vYt7Jj9wsrg=;
        b=YaQ61rehHsytr2H3reuwCfBAQiDwnzQj2byfOTxV/JKfo6TlckGSimkw2t+vHFFoAb
         EvVeazF1oLGQNGvqB2pEy4P4WnXsGEAHWtZsrWyRdh2qmIH8DxRXI48Fz5gYgr5V3ctx
         /JLBqMIOSON5w6MvVFB7UxiX1YWQQtlWBa+WwuGuBtcdaRyQDNi46P9gYCHpePsAU//S
         Jj1T8DolWeRpcXte8ENc6AaO74YCSCKA2ebA8IYuoaV0Pw2+QoVhY5LrbYsjiJbRBiW6
         Or6UOcNSnR/LfSYWtbIGcJCLV1BU6WnvYnNaQNLmB46srK1nIf/jA1zS25Sh+NMUvpCI
         lxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782787; x=1789387587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jalcXwT2Yf1NbQPCnMUl/zDvl6z8nL40vYt7Jj9wsrg=;
        b=at3KZ1QSnmdKWEM0Cld1y/y/PjcOmpTz6JLVOCPWBJDpWPEDUygDBuPEAu64C6sDD9
         RpkYrM2WhJzbcKaectzH0UnxQzun+ModewQdjzS4ndgu4sKcFDcUdhbI8Z+5GXjF/ue3
         fRbv9DExTorqI2BkH2bk+ZiA4rEZ9d5AHYf24ugECHwZJSCJInP6iE88wyIvkpWZsteI
         yAyWIueBGJIiLF+jK6bX33GC3q9Cesk8jqz7rvhQ6ru74dzZ0azqPfUi6Q5SPG1C8opI
         tKtkD558EsAFpZzhAiSoPMBYzCmkjy3gNJLwrBSF0S7Si5xlV08xbT7afn09HAyukaaA
         MedQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/EEctZ9JPds7GW0Uqi9COd23Grutnpi3IIrAymVG5YmhG5wE/mda77r07dl231dmVGV4GyuVigFgc7tY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJuLZvzbhdStCPoh8+PEWZYLccZ4QGDF4UKzKR7tvrM+jcQRrr
	F84f0dkXk8E/2/gxw1EnZesSoK6dWxEqqyumhYUEhzXefFqg5YeKgQKh
X-Gm-Gg: AYBFou35dP13BKRCc/AAVJmkzDxtwNXYxBeGeIY350NtLUPn+BDFShyzqgxYVvCCK3S
	6kNYgSAfYx7R0GKKfRfnC5CcVSbB5pBePDdv8Dvk6Rzui+5luxFQZVwyqBF1//ptZT7tbKdyg/x
	quoJIMBojk4ooGwZj2uQ91PmgFpLqyvsX9WRgRfAiMef87C3/SI6My+/TCYjH3rxZXKN/ZU1ako
	M48UCqzGZPu1sgh7wAX1G62AW14wKNdrbOvKufVj3FP4ckolOh6+KxYAa/lTaz1xuwPaau+G0Zq
	ukdpAM76wvEnbwkEPnu6jUaTfVfEuBlpjyUd/SrJzmwVS0xyZZUWiviv2KbOkt0Qq/jzTqsvBZ8
	HmGHiRgSdjL3sRqe6epeIkDFPC5nLpTrqN+dJ/0zvj8Da8sTBxHGg6VzMeqvdfDHfuUrMJ7xTd/
	rJ8RzRz4dTKgMLNs1QvhV0edL33yNviHKIVr/osLbjlVLgitL9DA1660g0WuM=
X-Received: by 2002:a05:6a20:430f:b0:3d1:9166:5c68 with SMTP id adf61e73a8af0-3da39ee15fdmr29716602637.8.1788782787245;
        Mon, 07 Sep 2026 05:06:27 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abb12sm3818124a12.16.2026.09.07.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:06:26 -0700 (PDT)
Date: Mon, 7 Sep 2026 20:05:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <ap6ngAxlztCAFSH0@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260907102849.w7yn43x6m3f2rnuj@skbuf>
 <ap6fcP7Oct109dkY@inochi.infowork>
 <20260907115712.dg5pw4ajvrtdipey@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907115712.dg5pw4ajvrtdipey@skbuf>

On Mon, Sep 07, 2026 at 02:57:12PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 07, 2026 at 07:29:49PM +0800, Inochi Amaoto wrote:
> > Yes, I have one for it. This is the spacemit pcie driver.
> > https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
> > 
> > But it only uses a few of these helpers. So should I remove all the
> > things that are not directly used, and let others add these if they
> > need?
> 
> How many functions would go away, and how difficult would they be to
> reconstruct, if we only were to add them on an "as-needed" basis?
> 
> If the answer is "many", I suppose you could also leave a note in
> phy.rst that links to v2 and mentions unimplemented functions because
> they lack a user.
> 

In fact I think it is happy. This PCIe driver only use three APIs:
- devm_of_phy_bulk_get_all
- phy_bulk_init
- phy_bulk_exit

So most of them will be removed as only a few are on the path.
I will follow you suggestion. Thanks.

Regards,
Inochi
