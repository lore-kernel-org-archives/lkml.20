Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED338F62A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341088; cv=none; b=qq2hP56mNsw/dmCX5sw0jzdzHgbP4VWEsPEW5I0aSC9Rn80pQqHXLkixc9RDkhJCOhk8xstz9AVnpJD1sDTNKj22H2vglVtIQJ4qOYsC+pSiXyrv9rUnI+RBxr5bY3bN6UJ8h8H8EBis+M8koFA9FuzEhqaVexyF6J3Q4szCqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341088; c=relaxed/simple;
	bh=au8Gvd6+WEU8zV/daAfKj+L+yF0iVWqrpQqPfGml9hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQVMEEPjm39Npysy6UE7V1624qBgi26bup6J6yOV4xAtpqVyc0NkrEaky43NJsQxV1xVuIihxZ9WRwiLPyZxVJ/vQDAWat/PsfLyzBeFNJBaCE/nU8Vd9+FUMzev3AGlVlqM2sl3SBocY12bQA2omf1/LKjyS5mzUfTbKCfDIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K68T5dXo; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K68T5dXo"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso818225a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341087; x=1792945887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=K68T5dXoYJ4LB0dffdYrHGl8E09ixEURtKBRxGfRCzYSoQHua7ORO28K/S7uhmvK+R
         zNBDpAe2SaEqzJLKwXS1qlnBmKARmCMW5Epw3uBTrErM31vIYbnArkeqyuV4ntlBzenA
         mog7uzYm1Ua39+NUkd6QDzxNowI3ZC0r64gNMqKA1cCuqFb/k/BUlxvuauCULT/7h4mM
         DKs/bs5jpJ/A6rsrr6x6mTcvjmFU/LvddoxIH7aZkY5DYRsNqtDtfO0JlsSz1kFkNGIn
         P5bFPR9ZGWHdUAuR+jpw6OjE4987B9USltJeCtJlmWMQCz3pybLkKBrCfqzdUE93wkvC
         2Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341087; x=1792945887;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=zDN5AyWjoeXw4qxKnSa5bJCUKPXRxmmtU6CGa9wpjYo1DKzFNai4IGraPcJ895gWEP
         gGYNqUEuCbSV6+S+cgvC5z+DQPFUtnYGfGbKmewR5pc1+g38VgjIkSZw8hYq8QLPxHQz
         rplFeDbSCYT8Yw+lYdqMpkMzEeUkwXT3CP2gXxXjBTUobd8Y/48C1LISUZe4KZjpYxR0
         rNikJSktz03otvJdW43IcvgkqwDNyGBW7PYIPspb9RQccqZvgnTpyKP9p9tRx+jKSUjl
         xZux+bC+aToevD9zJZRQfrWuZemoM3xcfWHiBcsHEB5ESD8FNJEufGIa8DnOYLrUqAry
         yUwg==
X-Forwarded-Encrypted: i=1; AKwUvByGstNSHiBv7derW/XqwEW4sHXgp3Rfke1Dl/nd6MIwC7OMfHJEupUdRTxfmI/y4aOnFks3nVci8enGwCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUNbi5eBzQpvzRO7irP56MWmbFGOtC+Q2y+HMVeDo89u4BV4H7
	7zy4EIp3iSXnZfd7o9XEp9jJfhoz3yRxC+dFN2A+Hn8iUV7R2+jM0EE5
X-Gm-Gg: AYBFou11shRUNyqPZ5Ynv2/UgD+MDmCdI3FjkJQuSRZRQ8K/uDrb7obd8OVC0vnD7Eq
	fx/UiHO8ZHIz9x3un7usBUgwHfvGltijQalBkJ/OX2EoixsuM5N48OD5HZ85O3py5RRy07tRAOj
	0QM9ioT8S37n6ygHXG+c+l3eH0LevjqRzu/UtacvYdxcIBsmLQx2qSb9DJsPn+9isANQr0CzwcA
	RDDr7s15FxbqIRyAfb04dhKTtzIRktrR5nuXvHbyxZg4FzOQgiKzkd1M5tl4dxGJ9EMbry6j6M5
	E+Ck2Iv+WqgczVpW3mu8raraYTepa3yuWT647iJwoiHIwZNjla0vXWP1lZufijW4c03KUM6d5Sv
	0rSoZGNF5WcXGtu8vbdGPPJgWmdUtB6/ODczx9Laz1PL/Nfqm3o/bzLLjiSVekwF3KBphL6eaSq
	Qrdd+ApRLUrfT++o3SF2XFzamOEU9NUEeVaPXrk5Y2GYJ94ulLAC+mNbePqV+4hlUZtPd0DAkaH
	SdgM+4qXk8g3JsMy2ZbBcY=
X-Received: by 2002:a05:6a20:43ac:b0:3de:7f6c:b871 with SMTP id adf61e73a8af0-3e22607ded2mr3605547637.36.1792341086646;
        Sun, 18 Oct 2026 09:31:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fd2737d20sm2611477b3a.35.2026.10.18.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:31:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:31:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qian Xiao <heyheyco@gmail.com>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Message-ID: <08bd0bd3-a80f-41bd-a057-208da8e823cd@roeck-us.net>
References: <20261016163509.249020-1-heyheyco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016163509.249020-1-heyheyco@gmail.com>

On Fri, Oct 16, 2026 at 09:35:08AM -0700, Qian Xiao wrote:
> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
> 
> Instead, suggest that upgrading to a more recent BIOS version might
> help. While at it, fix a typo in the preceding sentence.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>

Applied.

Thanks,
Guenter
