Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ADD2E62A9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769461; cv=none; b=ejfakEgzCjCogfvYlMKs7qTjpF2sKYPyjniXvfF5VSFBQ72h8Td1yyRW8TZqkDEx5p1htQYy2qCSKgmMSHEGY5UbJJLqcBfIKyc3PMkegPyE6RsO+QtnICi6WwIMwPlmRWHtG3tKrYi5oiHVp8phOvAMywb9lEUY/c7V+4Ali1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769461; c=relaxed/simple;
	bh=3BOXORGhjvKc95XHAynr/FfzhVGUWPu4pKKPBTwa/a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBoozpDARJOiW4OBXUIYAtoE36JIxQXxsyDCDaeIcdT+sxdvlMu0Zrpv3LnOOrmwn8gS5MacRv3ku96cW7KdGpYgPGe+mTYZcEe5+USMSZP1ED5+ygM7+N5UoDRoVkUQoXe2wR0xnUM28H8iUGC5aqfzW8eWFFo8v2IZ4CBoiF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfyJ67x1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfbaNuJb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfyJ67x1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfbaNuJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789769458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
	b=KfyJ67x1t5JCFrmdBE0fFLWzHMUhaOevQtrmohCiq/y7ovkN+krph0cQn6C8SC91jyu81g
	VevInWgYWubjEGBFekkguJx+t3/PsZmVIoU5a1ZnRfHkQOT9JUbXRPAzDeWatCKY4hDzQ4
	91ziufpSFoNlmbYqJdUwfGIrrw9zmwc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-OjIcGLJxMCiqUSuAQ1kY7A-1; Fri, 18 Sep 2026 18:10:57 -0400
X-MC-Unique: OjIcGLJxMCiqUSuAQ1kY7A-1
X-Mimecast-MFC-AGG-ID: OjIcGLJxMCiqUSuAQ1kY7A_1789769457
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9123c523d0cso16259446d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789769457; x=1790374257; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
        b=CfbaNuJbRrpwpupg5bCF5v/Qy+nK3ps0GnCyWBvWwQ9W/IfcrbF+ydG7gbDy+GvK2E
         nlwe4nvayHr3VJR8MFg5NuF0qlPxvSpnaMYPURvP8jtE882wVuHtGRYHg7JAcHV1xv1X
         dSIZuKfM4BqNcXjjMxT0F7+avmuOuz+XN8bHFxg7qZWfXjhjGy2mYdCVbeT+M5SJPwY4
         ZDcJnva5EE2AMwpfg/xHoJUfMq/HeSwRYn69LCutdHTy24+pMAM2odavMn8XdegDgDLV
         iR5mLnlm2OxcjMXgJ0tBl776/rKu2lKrgPuYrZDXER1A8vJn/nRmrpU1oKaQGn/55cyS
         xFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769457; x=1790374257;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
        b=dOXs7uhdhug9icad0K0k7Ldkr/BAvJCUFq8vFqaE+4/WEn0r3dubtNYFntw15pMdXu
         SGCFAFB5lNAqvxhO3wTthZjrVnxVn7rTd2RDQ1cjFR6mkwj+WkDIJufJ52VOhlJmXGz8
         AsFW210loT25OF8w8JicaYdbw8y05psqzvajelZRM3g/exNhbp8Lv96g+2W/JPlvO+0r
         K4q68lSWyAR/iKmW5aHaYEWcDccEXlz2O+qbv7GGoQqV87tGBJfYzK9kVbrscf+gMXBc
         MVeBbTdU3Y/po5NigTl28VO5VFNeVcr66bEirWyNFMWq4XNjIwq1fIUy2NMY6FdT3wlI
         qwTA==
X-Forwarded-Encrypted: i=1; AKwUvBzl9az8qem1QypRPEzTTqb88p9VAVr8JmnvxmmJxGmP9aT8hiVmgDzkaTE5VqjuvFejs3qMTiQF2/GVkf8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWJvi9qLZ8WSPA8wAyEmanLJ0o03aAuh8u/ZbOaDrmhvbRMPDT
	8pQF7q5hmlJKPKW8isowET5Pe4rk/SQ0g2qpy4DoEdRWlWMWjgEUP1pxHQBeEyVEIe95+0iGwCn
	x6fJ7Dstbznfo8mluLoyDGD56k2BWORLxQSAaQWfG5Qxh6LSciVYSlXwnNIdbszF4yA==
X-Gm-Gg: AYBFou1Nmqjx30879abRcHolv3hyGOi3EPbNj1XmrhzIyTiy0Gj+c2OEYJATe54FL1Z
	uCQ9BfW/HCF7omOQ/DRp6W/XJ+8hGhvwmWRRSU/Rq87s+Z4FBLEUs9k5iZMGpQ1JVSmTErnN8Uh
	C7SQbqIYNTfIw+0ADeugwlJzW8nuTxdM1yGR0cWncrZob5GODWWMVsa2eq4hlk7fA3Gy3m18ktW
	4aVwCgEhLfRZb9ZQBB6+04ugvM2tO/pH2fhIlEvI1cbYrXiT9lvTZsh4R+DdVDKy/2MQdUq2GPL
	ObLEZHGrNezwUxclj6Mh0sjdkpyMYQeUgKAo2zA1hkyUnv1HObcOHQ6mZ5w/eklAh4AaI18=
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091786d6.5.1789769456748;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091386d6.5.1789769456370;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260967307sm6178666d6.6.2026.09.18.15.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:10:54 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:10:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, mcanal@igalia.com,
	wahrenst@gmx.net, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Message-ID: <aq227UOtx6XMa2My@redhat.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Sep 18, 2026 at 11:41:30AM +0700, Triet Hoang wrote:
> Check the return value of platform_device_register_data() when
> registering the raspberrypi-cpufreq device and propagate the error
> if registration fails.
> 
> This prevents the clock driver from reporting a successful probe
> when the cpufreq device could not be registered.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Fixes: e2bb18347c8e5 ("clk: raspberrypi: register platform device for raspberrypi-cpufreq")

