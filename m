Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8221535FAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072592; cv=none; b=OZnxhDSQgtT8l/ge1EaHbWEPj5YmHGjCSwVSh/3rW0euoF26tpsEJuepmOefoE+/sVHS2XLcAxHkSC+c38erPJg2rFYnECrxrulrIeosm9roJWT39lGldVXs6HC6jfqod58bNdd85fCFoKCn9Hg/jAvFtvYX8/GvsW/jAKv/xpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072592; c=relaxed/simple;
	bh=q/ZtJSAeXkKY8cNGSGgRsE9cZAfPexEkd7ZIvSgC8ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jsx04sted4Um0SaIsZaHnP+brU1xb3H+83AqTYnPHxj5bWXhbCxzkhhbUTJptJB05Scvtkl7mff+E+57Pb+jRyKDbiTdNI2G7hn2NRN03FFmbZx1zpk/VpCayTANWUMkpBnuNPXU+f4okJ0L8YAoeRyvpMDdWz8rck+2fF0TmTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocZ3HmTr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocZ3HmTr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so2132981f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072584; x=1790677384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wznDZnYyXxoiahFqDu0EcYXg1rerGnqVJ/o+12P92BU=;
        b=ocZ3HmTrvtT93NyOTGsHzYqMtPRe/AIBUtvNtv6bkHUi122MFHr+50+L0RoNYZvRwb
         Gw33mfeLjldPOwovaFmSlqwXBTmQFm0H0BxNT6dTHp5B2L1W2TbYwhSpfoTLr3mLrr+7
         EUBqRyZfDhSxnLszmwfh6OYKC2H5/7RmwFjVcMlZwVtC07s1v5sVT0HurW4P0aP1NtpT
         gM8aRuUDcbSlJ+c79Asm/MhfN4Cd0NXQ7kpa3eHVxeWxko4FLC4ysTMgD+HE262uxj4i
         kxKOSxUJt13kIvVVOCSRCdwYEW/6CIk53Km5Iy2fFeEG7zKbuK20acbOUwWXKa47+6DE
         P+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072584; x=1790677384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wznDZnYyXxoiahFqDu0EcYXg1rerGnqVJ/o+12P92BU=;
        b=Ryo8/qkzwK3C1hJJccBRQAZjcbyq4Bg/s3BjWRTu7xvdr7bcsT6BR7+3MQIenhrsJn
         7bDmyFhHIwKpI7lOPMGIdqg0YTqA7vGUniYpmq/W2Krn1hq6AZOEayRozXZBaKDc0UzN
         sseTTduEaAERPJqycCzhQNsEgveWCrhNnq0u8UA8X3PDwYOnFJa/6jwwhWO2mCBMZvcE
         5bhKW8tSc79AVvCBIPtV41lsRdWRBSTxsxTjwfivHE2xltU5AdHZLq6DTSsXb5EfLht+
         QkZJOgbX+vc+ynJfWvjyk/GJHuOmhUu2HVCflnZaUa6lA2/iZ5v55Y+s6mvzqtPXX5wc
         rHdA==
X-Forwarded-Encrypted: i=1; AKwUvBxLBftekyGsU3ys6+QKVFRL5jHzXCo6RBqSU5gV1TNXuUWYXF6ZWYEzGgUgs/UTA5iy+0O594ChTxpS4cQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nViO3LqE9KcR5LcXsZIDh2SdBGnEs3T0/Rvyl/nObWb9Q9TNoL
	yc70I0CQuAiDHmZS2DXSTtQoP4G8N16RhoBgnfWQ8qt/euVTBdEdYpfA
X-Gm-Gg: AYBFou3pCO92tm7ORWuojdSXQwXeYUEIXkK41+chkT6/WjDAtDRIpd8EWL9KXDooPlT
	eTKeDEe4prVk8hG7AzBkp3rNJm9jepXHAw1FwFz5otCu/wk6AyLOqwUYegp7/QWp0a4bFmb4u1k
	HgQxe7oFzbbYcuGQdHi+HTgbwYSDX6wvNRwE+U5HuMYxLsPLaLw52UJUGKjnRwJ3hpTSIkfrHIp
	8pMD+Im3kJKokPZK9edb3Z9XdJPpsXBtIiK9OoiXIHvzmZPiKrwJwANjq5BB39quo+Cq9+d4Bjt
	4A7ey58/5W7On7ZltT64PNTRCbLqW0o8dHyeQZVSYH1x3AaO7wD5Uaixe1rJCa7gIEpf8GFl08Z
	A75HzikYsl3xDggzrocKL+mnnJOdMiK2JLEVQgEm3TZoqRAOOIfWe5mDa4aD7ZQfyK5YG6JG3ym
	4/R2nz8JSghVN7ka7aGsZw6M7ukJlSLxa2h364DTl5Eac+Da5KY81mGArHLKPo3KUwPA0=
X-Received: by 2002:a05:600c:1da8:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fdc71e72cmr8878355e9.20.1790072583857;
        Tue, 22 Sep 2026 03:23:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm81291145e9.1.2026.09.22.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:23:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:22:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arJXA7q5a40jcASB@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
 <20260921165527.1379-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921165527.1379-1-itsadi2409@gmail.com>

On Mon, Sep 21, 2026 at 04:55:27PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() only verifies
> that bssinf_len (ie_length + header size) does not exceed
> MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
> (768) bytes. This allows ie_length values up to ~976 bytes to pass
> the check while a subsequent memcpy() from network.ies still reads
> only 768 valid bytes, and other paths that write to network.ies
> consistently cap ie_length to MAX_IE_SZ.
> 
> Add an explicit check against MAX_IE_SZ so the bound matches the
> actual size of network.ies.
> 
> Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")

Really do some more checking to see if we can use a more sensible
limit instead of MAX_BSSINFO_LEN.  Also try figure out where
pnetwork->network.ie_length is set and verify that it can be out
out bounds.

regards,
dan carpenter

