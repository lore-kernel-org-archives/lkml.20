Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F6481B1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048296; cv=none; b=TekcDnI/Vj5YJcgYiXafLmWtJH1fkZBvF6poA4/zLaHOQz3GeJGvMO5rWQP7p7iAHgnqIeIHxc8UQU7wG/a15cixLq3ZpQIeOzN21rD4IwSHcrVWWpeF1azbhZEn06yepEXs9NmObkrG2/1xAB1cyAYQaLke1r8HFtZvd2DaZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048296; c=relaxed/simple;
	bh=EQ7LXX8hrRjV5kynGgEIzz4GK/6e5K4uNEKumNr0MNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX3jqO8p6bTZnHSVty7R/UOwMMjjJYlVBtICSUfPG57RAqNDZVQJ6nozGQPiQ0zXe61LfOaD9Is4r3By2wSQ0a4Rg+k1NZeDFvnrma35BwsAisc5+F5zy9P4k5KzKq/vY3aamET2denVN0VNYex/j2otPdn9oj7A9UPaQVk+Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0QZxGKS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0QZxGKS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7195706f1so22484285ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048295; x=1788653095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zdv1lueu1WcoCfunmUpcqS9uvGF8oyTuiM8llhtDUjw=;
        b=r0QZxGKSq87Q38NMLc6wDWfqrpWmhC3xiIs+VydSF2ExoezK9fL4HZjg68rKPT+slE
         Wb7Wp+8/szk0xivbOZuyExSlJLWkWGsk2Vx8xe+HiobRmKKK3YwJjl1XR1cRw1+2S+SD
         oT8oAOBxXCTgNF/EiCjRhAa4mcaNk8RByQ1EH2olLZiCDKmfNI09w0X5HZBthgZ/6qQ+
         bkJW1MP8Az8SiYUY7Qui3ZN70m+8Fhlq+6zo2nM/ef6Fit5UBIIA3uf8dQkB4Tr/ViSh
         Z4sp7T+Y9EB7jxHvJkQ2R0SFbi/7A4djczqo11xDWn6i2CR1BwhC0IXKAaq7aNkDaoSb
         nIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048295; x=1788653095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zdv1lueu1WcoCfunmUpcqS9uvGF8oyTuiM8llhtDUjw=;
        b=q7nDIKBiWP6+q8t310L5wyxRMDc1WU1wWnVXVZgZEwqC6e0Bgw6ImiFuuP4x0BKpcb
         Iw+Wa3SJWfVdBULF4NiiZNd6vKzSyMc2Ru2YHHj7KcHGxBUPdteS9hiCspcLit/oEh0S
         0MalwVCOBWMzHnLZyYNBAO+l7GXT8ewCoDTQcmslb1G3E0alvrJyTIll8pLQGlfEE3eW
         iOQ2lNGxsQzS2s5Ng0vvFLZ5wh/wb1fJc2vU1+ZfSxzJtbYLpkz6DAhUuQJWDPjmCiro
         ESfInd8fZulEZdxofV7Z2p5yu5dwyRuFGopx7XPeH0FE++LT/PBHL7Qd5G9nRO9QwZ4x
         EnRg==
X-Forwarded-Encrypted: i=1; AKwUvBxmXVlqfZpX+ImO+UaoZJG5WFMkCfC8RJu0rySA8M/8jGqtqfobFslrRyc5lJTHZAtwZ6quIo63tNjaApU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnhStsfVhbrqz80hWUz8jFBM6x1zHAjr3/m7850r/z5S1q6BWq
	KuYlZ3ZfE6O5xPfbD5XqNKBFdv5BYuIkbJTm4SFuBFNI2X4H1Y12KBQt
X-Gm-Gg: AYBFou3SqTt8H6tqf48Gc3cwFL4pI+u+uzDOhuq3ku/+hz+flYYjaxw4CDElGL0xmcf
	CwbcKhBXBjSdUBdP4o8zEKRZNH3v4udKHhHTHLegOIT8H2g9Q23ckAPqb+mWEZUNy7asr0Yq4ya
	z/itc/rj4ljtPVYTrpRf51grY0bItJagvrI/yY4vpg9NBD1hQVIB8r+sdgpTyfgUWBizJ6PM4hB
	PS6ih/s7h5sQ5CyOiJK46hf7niCn1vKQmeIo3EPEvsm3Xdik5KjQI+HSM4nLPGjQ9olAKkoKVRP
	n3xDuSC1CLST5idyYmroAQ/5ukREZU5aVVo3JNWVdG5mUmWH35Tx2nLFAY00YT2aa5Q9HwxKkfQ
	fergexS18puazlfgSVyqvqZCHbPhvhmn4tbIcLe0Q3DgKAYdYceZ2L0Lj1y5mlPGzxW4DdyGRSV
	IC4KfnuwSAb9B5y5z60LvHSE4XSsCuWgqJuVSIpIvDltxNfq9CUELTWOPHJIvH0AfaxZ21h2VUx
	A==
X-Received: by 2002:a17:903:1843:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d74df513b3mr214268425ad.12.1788048294660;
        Sat, 29 Aug 2026 17:04:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d911a9651csm793615ad.21.2026.08.29.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:04:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:04:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel
 constraints for temperature offset
Message-ID: <6ca05f29-b0ed-4175-9047-2e16953d7d0e@roeck-us.net>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-2-flaviu.nistor@gmail.com>

On Wed, Aug 26, 2026 at 09:47:48PM +0300, Flaviu Nistor wrote:
> Limit temperature-offset-millicelsius to remote channels only, since
> channel 0 is local and this property does not apply to it.
> Channel 2 is only valid on devices with two remote sensors, so reject
> channel 2 for compatibles that do not support a second remote channel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
