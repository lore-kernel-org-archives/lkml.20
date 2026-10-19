Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869504F7CB8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414136; cv=none; b=TwA6hnEZCYfiLSM53CZusrK+OMFU3acHvrGA+la17irlHOo7KTAq+L1sC5wwzK4OYqzymkD5h2PlvJVhZKyNjFfdDRGmJEbl4o57cHus24cCEO4wfAv/dhDrgbsabttMPrvg9O1UZhc2beBhJb2rihTGoE35KlUV1t2dvksW4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414136; c=relaxed/simple;
	bh=sAJ6i94PJtOldxxhMOOrYPRkX1IMkHwm0U8Q0od/RyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT8NnM+tZOK1IZlxoRo21bQTb0jNrScMLRLUgK/sqB+E7bB4WTjNsGI18wuY1uUQfnCnjZXLZU6hsH6sOm19fgELB5sA53roXfZ1Ez6Kr/HFVcUF/9It7YQsgc5JaOJvYIdSnpH+8rhRhXEOLD49lFJBk3Zg0fycFi/IGA2EnkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agxY1rn+; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agxY1rn+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35f036b17easo5412524eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414133; x=1793018933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cn0ZhmPVY7gAqZB4Dcd8F5JEGSmnEQH7CIRljs+xzu0=;
        b=agxY1rn+sC27hpHVueEY8fteily1lWsX/JFwb4vycbiA/gjW8xaJDgAu6OEooxawdW
         FT/d1n7/r3mYfFEtb+XX498PKZ/+rYjc91CgrO37up4hM/F0DyN3vPlS3STXmZmu8zk2
         O6jqdLkIqOYovQYiYfGBY0/62FL0Fz75Gucy6+qR+61vC359rK3P3EyL6KRD09Fp8J3I
         eArV/9Nec64Ve+KRs3v5zZHb4IL3N2cCwWPM3oroUxR647JQa7CJKliIKamhUS6SUL4Y
         yXV+7xTrWWbcooucynjNJdu9DTQP/T+s5C4e9QWJMfNCz9yneM5Xw06WFsimsypCUVdg
         bslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414133; x=1793018933;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cn0ZhmPVY7gAqZB4Dcd8F5JEGSmnEQH7CIRljs+xzu0=;
        b=FYqL4pyB8OyaqXH2SFBWVXJHUcgVeF0gCLCR80Bf8SpQfrOi+14DGks9+pImHjHsKC
         hzQv+Ijq9qyk+FzuTESTqtRAcuM/XKVG+tUt2xOFtlZi29Dd6z1eV7fSjYtTcyJfDry5
         5hheg+UTvhXrPNYe9xPFlUUPhNM7gWsEeckGqeaiMfTrzf6XbzeH2GvBJMnMLzZoxyk6
         WExVHKOjHDRaqwTXC8/YYRtdhy74HkGeyUN1YjHBAwGJdaWfE+V3fAy/YMlYH5D03165
         R6/9p82wfz2Xjr5iY5fVCz+O7Qiz439DsxFLOGybM+WWUpHZLmwom+sv+5YkzNgpFejQ
         eV5A==
X-Forwarded-Encrypted: i=1; AKwUvBxq2dZvgSCeidkYOB8/t8Z5xdnN+ohOOk7CYVOYyvS+scaaCs/IOotI7eje8oRWNmH17E4j1emY3uTXb4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAVezC7R0PZr6bIGhMwOh0/n54xVjb/d++XOmc/uFqrQCNrB9c
	nyG0TdwSe1Wf4/cc+GZdbytRRvnms4Gd84DYFiFhZOHanmgSZ7ktxSTOzWSkGw==
X-Gm-Gg: AYBFou1TFIdbQhMml/XxxYSEeKDWkESE/0RxemA8+cIRctCfi93vlXx4PJUYApCNWPk
	by+RMh7reRxY2HzpsE6+2tNKOo32bBHNr8hgAFeTzaJQr7+xkGsv84GXZXasWg61sYHYwQYxbOy
	qVvIeV8PHaZns4reRDWvtYqRzqh89GpcAejchDYExIXGsH/5EkCkZhuF0Ogl7r7mZ5GY3VtB3SG
	3UjNWKGBg54P89c2WgIDGqzrF4uqY4VGSq16WfkZq8HcVOcLgeF4TR4Gz4Wt7QE880uxUlJnBVg
	767ZN0dPxjHDxlMZRFK0ZyDb120beKk8Fg+DNPwPIMRLP7O5cUAme+/7Hza/GJCbEbHzaOOSbUv
	LggqVq2hiI1F8VNSdMOB3UQAzzp5U/Go3SE0FNOyxNIsOqRqzacen2KJdZad8zBjyupzJ+hIeCU
	ggozuqDNDNzvIsMLPx94nxdZvotHnISrgwGzcmUzmvPBsViWp7x11SOKHEu4EPCqeH7NwMYqPh8
	WjwZAqMbU1x7A==
X-Received: by 2002:a05:701b:4519:20b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1863f0cbe04mr9434353c88.5.1792414133401;
        Mon, 19 Oct 2026 05:48:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm21947868c88.19.2026.10.19.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:48:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 05:48:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (gigabyte_waterforce) reject short input
 reports
Message-ID: <f7f8b839-1e65-4bca-93cd-4f00953890e0@roeck-us.net>
References: <20260927084959.893708-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927084959.893708-1-yaojiale02@163.com>

On Sun, Sep 27, 2026 at 04:49:59PM +0800, Jiale Yao wrote:
> The HID raw_event callback runs before HID core validates the received
> report length. waterforce_raw_event() reads command bytes and then accesses
> fixed offsets for firmware or status data without any length checks. A
> truncated report can therefore cause out-of-bounds reads and update hwmon
> state with unrelated data.
> 
> Require every report to contain the firmware response fields, which also
> covers both command bytes. After identifying a status response, require
> the byte at the highest status offset before accessing its payload.
> 
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Applied.

Thanks,
Guenter
