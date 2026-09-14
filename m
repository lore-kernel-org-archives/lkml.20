Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FA4A207B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399394; cv=none; b=FLTTQIsLjInWT777Q0XHaBbsf9HDeKV0WnGoFma3rVx8ysVoHcVk6mCq0dca5lg6LpOqJikX3EqfXqXgED9gmS2wGoZ0SV3QjN3d3HcXjmPe6ouffZInqSjjnLL9u3SrIhkmH/VEImi8T60dATIj16T7UyjRy8snYju4xmXO4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399394; c=relaxed/simple;
	bh=mGj/Stj8K3Ly3kqIusqXMbha7ae3v/sekGPhJYB4iro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2F/XalLQzxOhZ0XofRBCn8JTVHQZ3CTJ72crBjP5Gzi52RETO48cSm6O2Jc0skhuuPAWuHE679ktQbkUE/rqvqzIA/ss5QLXxP43f1iKZri8nARYwJgzHD5W29Ik11loVQybC8q/iHVz2j4Kd8GxaZBdT9bt6oH3HysIHPdrzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEcCvUhy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEcCvUhy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so766740a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399392; x=1790004192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ztuGSF+PDwQIAlTtGQea9d1yEzizsRF7saPQJxLq9mM=;
        b=jEcCvUhyjSFEwYFKdX12WSyztXAubvqy7nLzNmneeLglUcE+zOmrWjcekuOh8KhgZO
         RmQ1tM0ejA62CPbIhl44JnhuOzhoJOSSxt1E9WyPW6VIo5+56MnQfeN7tHqDJJE6qAHR
         LvCTm2/TOd/PJxJBq/tXdQYRdCVOHX+g2sQRjwxIc4pCtNWYweSqPLe8r9/Fl5dicXfn
         3CCycS4bOmQdpuvSGHJmP1N3pSgY6bfgerpMhVuTqbTVXEKptgqMgK+0Voplshx9n34t
         crpk6KSAwQHRqOVktBhYYEzLOW5En5gVc79EBaJAL3e9uJM2Kdnuo7YSazJ7Vd1F1YCV
         9J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399392; x=1790004192;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztuGSF+PDwQIAlTtGQea9d1yEzizsRF7saPQJxLq9mM=;
        b=hEujlcDO6Mwog492mWWI9nvqSlTBRjniotQ8tFYtGICAQ/rUlN+rvMx1Od7qFbwE2i
         KLtkg5prMnS06KegAHfsXnmHeEbFc2VDgatMI0WyukxesJxhTIpXVPBNGCd7MSDWR4wW
         5iVNTpolfcpFZWD965xiOHqavfPybyP/1pm/RpObNt1UaqQPomSlHybQlOHn94WotMzW
         ZaOZN6HMK3NZmyUtxuxfHQyluR6I2OsUo5bac/kK68gJDEU10yOFX61jN22THVw+oVLo
         qviLSCeBAi0x7NtfnAJ9FEbqzAQBVeRT32mBqDxz1fkoXzauWUZLCAY5hu2gMGwx6Nez
         h5Qw==
X-Forwarded-Encrypted: i=1; AKwUvByITObiMrVScgDS5/Kkk9jt4WbirqV5V8Y4M3vJwXEajrNUIsLNbXXfy6aJZbtyyuVyMUlrGeJC3O9/e80=@vger.kernel.org
X-Gm-Message-State: AFuF++lSI5WjuyUtg+VOoP109rhAHJN3mtvm8CICPsxoBnfIZR2GP6vn
	z2LikNPPyoTuFMHI7GoDfWmCGMlJlZNYndgptU5QaOOqgUIZm7j8sG50
X-Gm-Gg: AYBFou1OFg56GzOV+KrRUurnPp4IJ0YUyG9ZwggQGt+drgfK9RGLnnEkJQXaKQ+HChL
	+zo+RiheMmZPh7g/t3oDR24gNmIh59KPFkhBXnTESmmjy7JmTVQrJxEpt4VE2WDJAlbjl3ZMtep
	TN6Go5n8mshwnh1wADBflykuVEtGcVrUSdmCYZvE7KdsioQ4y7qKUtjP1J/spJfTlzBZ1+WHmKh
	vRMYi5kGq1avgTuNdMj8aoapf9fEmIiCkEJWi2n43euSWcSYSjVGZyQMaSSWpS3kCzrvCNaiwNs
	+QxV0fJAIDE0aKoHt9FYt9JYrqyOfEnF8cMWMTLjYOtxWTr1GxWEMBXerzuW33yDYzrTwVsHGh/
	IvUyYDczmt5t3nw21bjI31Excq2wZpWw4qjoW5eLMZcazvuOsh/dOQdZQUv2hYcxuSAWUHvKlGj
	Wj9ZupvUCBvCuzM85gsfFjMB05QcoPmVfJoL6TjPa4uAxbb4u5XsO46AEngebS3aoLnLrk0nE8d
	h5yZQPIJbh9
X-Received: by 2002:a17:90b:57c4:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39dec375390mr3341232a91.2.1789399391514;
        Mon, 14 Sep 2026 08:23:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm24274448a91.9.2026.09.14.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:23:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: tze.yee.ng@altera.com
Cc: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (socfpga) add Agilex 5 channel mapping
Message-ID: <0cac6379-d89c-4ca4-bb8f-9fcfc6086f9d@roeck-us.net>
References: <41bb317cbfb6f4e2711581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41bb317cbfb6f4e2711581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com>

On Mon, Sep 14, 2026 at 05:13:35PM +0800, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add temperature channel mapping for Agilex 5 and bind it to the
> "intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
> Agilex 5 omits temperature channel 2 (top-left corner) because that
> sensor is not present; remaining sensors keep Agilex channel numbers.
> 
> The "intel,agilex5-svc" compatible is added to the stratix10-svc match
> table by a separate patch [1]. Without that change the service layer does
> not bind on Agilex 5, so the socfpga-hwmon device is never created; this
> patch depends on it.
> 
> Update the socfpga-hwmon documentation to list Agilex 5, the matching
> compatible string, and the SDM temperature/voltage channel tables.
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> Link: https://lore.kernel.org/all/20260907082203.2639395-4-adrian.ho.yin.ng@altera.com/ [1]

Applied.

Thanks,
Guenter
