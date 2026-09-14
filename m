Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A361371D05
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373959; cv=none; b=PpjGoZghTW4jcxqtiRFrnL2UmuoDNsGZtc1Y/UKKk0DV4qGOG4aJS9s6HX5WkaQwawtNsmB7Vsw5VHtX2/BUolop2OiBcgUFt05YXSdpzVbNu2LLVGYnFssILFb7ERfK9oNcdFqTcuyzkDjsvF2B8IIxf94ZUfxW85XEXQ0DPgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373959; c=relaxed/simple;
	bh=hCAZBJhhRP2u77lOKxQO5T4yhqsaUjMYlivSY9/HGgE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSsB36sn9ZhDzMkvSgjyFrzpq80dAvkq0yynXxzrHUn5in+klKJmFBhZzyuWEqGz56CMhKWwDvPiwNoGPsMMNInSg0KreCQX9E4O5qzzt+bh2NFnAkts/FmLy4OZOVZJyadM0FCER14danuk1l6ria5J5G86EK8QZ5Z2KCL8ryc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMIrVYTq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMIrVYTq"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1786993a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373957; x=1789978757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLvHDynvrNxOy0DrTZpZJULh7McezOs0yqokhrkRfvE=;
        b=FMIrVYTqYyz3hw4XyA/9JYPeEWYX5i9RFH3WCQhE+QJNpjm4gUDCq9aqtbtq46mTEl
         cl11K4l4DLmyVbZlHcSgYbHvkn8wqRk4UtdL1Eo5sJQdKPS+dd2876YHFfw2MKXhmeBB
         3ksM/i8JLmViS2B8jD7ZLJk8fAXXTP7BkRFww3koIqbPnkfa7HxiK8mumgpbpQqUEKAD
         yxODbQpfIi5MPFgA73vpIkFd8tgZdTqFoTuoghJ14NbTFCE5QpsYkNUWT8PlxY1mm2Sk
         Y3Y99onfzipP/yfQ//sUcZjMD7uZmqUrSVBQwwOmcPOJxtQqrLK3vLEM4JcSVxxsrQ/Y
         85uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373957; x=1789978757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLvHDynvrNxOy0DrTZpZJULh7McezOs0yqokhrkRfvE=;
        b=et6gEpUtzyH78jBeGn21F88pr8dUcKRusLIYsIfC+/ki3VbMRgkCumXrDwZt3bS9RZ
         olkeEi5SCf1BtQomaBqvGG3vBM9NmARHHlaNEXGemLyYp68qYDX90JsWK6xv5oWyXXx0
         Tx6aC5sQyX2h4QByuV8v8VJ/wQj2am+b9RGT5fHSHaC9bsp638vVlRyqExxTuZLa3+A4
         nGeek6VTzDWbqT1/j8ubWk8SKnsanykA9c1daVzV8K1FzG1SxbpTujD8tR6Gg+Cbrp+J
         1DrmNCncsOISutuuveuZXWkjzZj03NL8BPnBokP+5KXDKulfvt3S+hNoXYMjs4e1r2qE
         0Iqw==
X-Forwarded-Encrypted: i=1; AKwUvBxohwAX7VUIG0GGcLqHoUkCIymLShVLTiZKgTbVFFoQm4b4pXezuMc6gfzWo0rPaZQDX1/0D1S1cU1vp+s=@vger.kernel.org
X-Gm-Message-State: AFuF++lTm7xAkXXN1BGzbNQneQNTJQq83PmOzm6l4bi4if1sYNWZUH2e
	JFv2U1vveqFtNUqZ34jARhWk0R2hSsoLAWVBnT4PoeZK3LAWzdBHaExj
X-Gm-Gg: AYBFou1w89BvVyFjFz5qXckojJEkS8FtZlBMwcIiO3z9yG5LnpQRJVVAHwhiujj5VcK
	kLNrl9+JQhymwKMB58f4RpaGCE9HLljfsXak6uL/CkSovF7oEf7ErVn28CSydLx5ZCcw6KNAcIk
	HF5FoJSaKYoyOKqByterQ1Mj/mn6YPcqMpjeN2KO64KwNqBj3YweZr/uNv8x897dzzkgMReG4eM
	jKcbWjkviPsgTSeDVrR6T3/RLR3OwRDKRf+ijucsqMYXWjh3XVsud+ml/BNiIkHDbR/adkSfrUD
	bKSOymIDY1zpPaOEZ1DZk3HD4ztrpS5jz2ceL276bKNxfp1Mxfg3H2Acs3wG6a+R/1Z7v2LsPBK
	dB91W0copQRCyQ3WoCvqZR+Fs/qVWEKlEePznZXy/IQIg75r9SZITx5cuqgLd3x0IndwNGZZWLt
	X4zZbWxNVkQ9kNu4jhRJ1t9CfNGZ0wuPKwfiRoIrBqYp8cToS4BGCGrUThAa8c556IcxK8+G7b4
	PeyPIqleIY0vKR0phYYGzOQMcTDpQnnAp2A2lLRqiCoX4vzv/Y/7ZNJxfASJG8eZpjedNxsbCgo
X-Received: by 2002:a17:90a:1c8f:b0:39d:ec24:5ffe with SMTP id 98e67ed59e1d1-39dec2460a2mr2310184a91.9.1789373957212;
        Mon, 14 Sep 2026 01:19:17 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (61-228-235-216.dynamic-ip.hinet.net. [61.228.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95092c06sm19955341a91.4.2026.09.14.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:19:16 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Mon, 14 Sep 2026 16:19:10 +0800
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: Johannes Berg <johannes@sipsolutions.net>, chunfan.chen@gmail.com,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next v2] wifi: nxpwifi: validate variable IE
 lengths in beacon parser
Message-ID: <aqet/hLbBlBpj3Xa@nxpwireless-Inspiron-14-Plus-7440>
References: <AS8P251MB00010E2945A1BE91EB5415F7C8BD2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P251MB00010E2945A1BE91EB5415F7C8BD2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>

On Sat, Sep 12, 2026 at 05:20:31 PM +0100, Aamir Ahmed wrote:
>  		case WLAN_EID_OPMODE_NOTIF:
> +			if (total_ie_len < sizeof(*bss_entry->oper_mode))
> +				return -EINVAL;
>  			bss_entry->oper_mode = (void *)current_ptr;
>  			bss_entry->oper_mode_offset =
>  				(u16)(current_ptr - bss_entry->beacon_buf);

Any reason to use total_ie_len here instead of element_len?
Since we only access oper_mode->oper_mode later, would
	element_len < sizeof(bss_entry->oper_mode->oper_mode)
also work here?

The current check looks fine to me.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
