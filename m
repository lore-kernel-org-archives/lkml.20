Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F753BA246
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147525; cv=none; b=Oc2wxrjoMc0dl2RYtyzX0VDhBkj4OeSHIpChbjwbM6xEjmyPeXcpGO6PUz1PBPfc7QByh4Wla80oydJhPAvve7PT3QzhHDsjkW2K8WQjuIbZFquRQBI+3FJspT+IPI/eNk3OoadUFUPHjvNYXzLI3OQE0d5Zagl387y8NzvxgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147525; c=relaxed/simple;
	bh=JfQhqAVrAGb7QD/nEHGgxs1D9L6nrbUSTxK+DVMj8gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ra/ZYIGkAXzMMy2kzXDALAKsD3o2HLpCB3lD7K7KSqO9EszhIg9DxxwAAp8Xhq63GIwg1X8NMpDqtcFY0xX5w1j6EpQl1Qzf50yv2nFP39JjrLVTaPomRH1ICoIxw96Skicv1qBPm3mWEuYOWJqkg84cYAfSQZ4OmOFIrU7BSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhZzGaAX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhZzGaAX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so19747995e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788147511; x=1788752311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=DhZzGaAXDCMaoQ1TiL8dyFDkveH/vyGzu8yg54mwUzIV04kyxk/ivU8/8Hx99lSb/C
         gO+FiTzdi0poO+oqv4hc2qctdhTrN19jp3jGeLFhcFeTuthQvxnbj8dW6LI+Jr/SKRIf
         sGBCp7qCJxpms+FsflXxMDFgRL/sKkPP+2PgsixHLHxdKrBP64jhD05zmngbnhjJWWDe
         smhWAvjfwvxC5dvt9akz4gkTtpqXcvohhUr5a6iDMGhuA6pjz73h/DjY2lLlGcotw625
         PecRy+ryQvydG6LWZ4vRxlpCddMIXhRNH/hdVdUA6zzIojz27YN/VCx5Ep1odh2kHWiB
         Vv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788147511; x=1788752311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=Qm46KVl2xUQcGLQqHecbmb/4/Yoow6kvPE1yOrTdDJKLr0xghFdoOTY5qkBLopzJRl
         sAQok2Ii+Kz17Jmbvovo/pD/Aa4vMn+K6Vp/6DfwQXhOnwfurhCxOvWG9VuS1AB+EGc8
         K7KaYjnnFs8HYX6ZfFKQc5ykASMKur76D9KAVH9MzCUGlFhyifIvpYCvoRL08q1+8WYz
         g+zvrcmiQbkqbHXcxsL7CEqY/jiOSAz04mTttl9ElWCa1Q7sIzaf69/YZClpJzZngDFB
         Ueu64DzZtLR2LXP+7dQnH6TJgIBW2kXcs6/EDSzUOQ112Z7m/GRUvKWDJJtBkNi5F4m+
         +fKA==
X-Forwarded-Encrypted: i=1; AHgh+RqSLPaw+73yYvo8X5mZPEX1MRQYEQTXWx9B5aERcuHZJLWjfpGftTTRtYOniCFFSAaRqqS3ru4etJFBS2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kKTuUD8JTPDcGacAUoeI6YHL3cSchtb1c3wa6VctfxM4fkB2LI
	plgYmZkj+Qvn0ybpm+r9D5NTqOQg0hemydkIKIv+lN0P+hdt10ltrThl
X-Gm-Gg: AR+sD114a30rDV4f2TskxVCABA76S9BDYI7F1a9JycnBRsVt86fRX2AyEwoaRJwDMxI
	ekFXBag4tJQie2NsueL2nZ7Dq4tg2EFlqbrqlXzoUitSWwsbohBp5AWiDm/Ghe2WIFM7jZk3PGo
	PanGR//z0vop/tMnHnU/WgT1dvLO6oPa4nsgKwxkdYSMu/i2tKcOFo71dKYNm6SzyKpRCjrPTpt
	QOpeT3gsfQdWKCiPBde3pKjZ4qbbe01WvS3rBoDFUey8E/eaZiMqittsRu4/Sw8pJSv+4cw6eIb
	a8T6ctiCPeL1ZI2aPuAaxxBYa755RpVyNavx/CXAA1RcLDJFIi1RlOhWrzzfDGlDh8Qz1x+SC6w
	Yd+cIly/VEapWDgftLNL9JaGDRc6EZVt+GlG+cZdW+u02cX7iAgkLIBPk1MBPO4KAOi7wzEOZ9d
	+iqAgfuKQDsd1HmVnLT2YZEyj1lpLWTLWmnCEte3hK1O+vGoAUOhYVHZptStqOIG7ps9Q=
X-Received: by 2002:a05:600c:c178:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-49b91c21b86mr308435895e9.6.1788147511021;
        Sun, 30 Aug 2026 20:38:31 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab5a2csm17624175f8f.4.2026.08.30.20.38.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 20:38:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 05:38:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Matt Eaton <linux@divinehawk.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Message-ID: <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
	<20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
	<20260830165934.34e5b82f.michal.pecio@gmail.com>
	<CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> the issue:
> 
> commit e3d757dc9257
> commit 042aad8d0db6
> commit 7e0ef4332ed9
> 
> There does not appear to be a need to apply this patchset now. Thanks!

Great. Did you try disconnecting from external hubs? This code can't
detect that, but maybe it's not a problem case. It wasn't on Renesas.

Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
Disconnecting one device or a hub with devices behind it?

Another interesting thing about Renesas was that the command only got
stuck when all root hub ports were disconnected, and it would suddenly
complete if the same or other device was connected back to the same or
any other port before the 5 second timeout expired. This gave us hope
that the problem really is limited to disconnections.

Regards,
Michal
