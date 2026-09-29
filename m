Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F6513569
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689129; cv=none; b=fqYp0rqh36vkKlcqU6TBevaIwS7Gq/G6EtfFEtPivs42CT/1h38j0cASPtIclmH7Hgmf9TiTojbKHQe7eSdyAYZRIIEDk3NQlJsWCiSYa4HfYwGHLidWcdgD7XT3vHlw4M/eMsB5zFmbU4BYNKmcfuUaCBtgp71ef/RFXDgIAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689129; c=relaxed/simple;
	bh=JIiCjYom2uefj08ZzhPJxrCGUg8WLQNHRokiNENLBt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm1r0VdIL4upVikwNYSWMPjK+hM3D2R8dxBxbugvs6oCRqGfWzxjIGR2Cw772SJ+Rh//MrHJYRRKo1vnpNGXnrffFLJN3LrHreZYwHLX1LX0LDVCcZYIJf8hqfeODXPQm12AI8Rr+HHaNYsT2aBEf6P3c1PImfm2Gg5b8Fx/sgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=h++Kc8Z9; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="h++Kc8Z9"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf688ebb0so4970326a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689127; x=1791293927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKEdloBXg0GteUPySA69WxM1r/24FRYU1/WWsji16GE=;
        b=h++Kc8Z9D96BFiGGK6WpXvXyYE26gaqmrV8cBAtgMsD9Yjq28ufVddK9mAUQHL67+w
         J4W1Ka+MMLUHwHjjb3WdnelQ+azEt7qNimTGS4X6Qixx2q96iqu7VexduSX83dLs1gu2
         famg+IKQOrY/mgEoObJ6M0ys6tD1aroWWg/5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689127; x=1791293927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKEdloBXg0GteUPySA69WxM1r/24FRYU1/WWsji16GE=;
        b=FcNZrAOwvS8ClEDs/rw7tgzGEkd7ih1ejygN/QCnLS5w6dmeZccJMqW1nfR54VDNEG
         rT3O+4mRFB4ZFswrs8me8P1orNOsmA2L3U8F5sMnqNVeOo+h534FXccJFLZ6vUmxanAs
         f3Jqaw5GAVGOfsz1nb12f+NYI9CQkPYMnfgTz7sYf0vkZcjfiam/y9RECHpUhmy/3rh6
         Wbwh1iJlaSmpRu6oU0u0USFv8HDwZnGkVzIH/SvWJlO+fwVGDONh9mjiR741X1yQc0Hx
         aZgw4OLIZaUTCWHqkW4uJYWE8V8URrcFKDCQifeD0aEkQFf02rs5n+OrQ062Gx3royWj
         oorA==
X-Gm-Message-State: AFuF++mvkPP1qcOiXY/tI8q/HkbLEG7SBsSP+RTb1K7la2JB9Wz/2MR+
	pob6p1LglB4o6nftfCdHD9IIdSrjCOZ6V8rWnDoUQU1azmuW0/ik9i8YAHgBKsK7gkg=
X-Gm-Gg: AYBFou2RUlDsOljSLGEZJ0J3BCo6UQWWQj1VbrzEf5pAqNnvGZxPyvfZhu0nH3AVoKM
	BXNg7RmeMNIfXuJFZIpTfM5cjQ5vyTokp6THOn+KOeuO6C22WEiAJkIlrJkv16m4HMoMp7y0oFY
	XF8NiCvuvpZVsVsThRjoTQ+PGTFCN03fL13bFiE1FmzG7II76jhbEU54jtGXVzdoNYD7akhl3M5
	tyqbzvHnqSSMHYShQ7aBq9KNZLOx6OJE9cA6935+96vpTHZ5n+rwewMNErcgzA3+d0nRybfTNsR
	I9pKz3mbcSmD12CipWgehvsvh52RuvRPekQC9k4UanfiJWGI5zKGwEjD7SC0l7Bl8igYIVsab/L
	S8GABBKoqhfHsgKHBBxpGTdqI7t9pnT53WcrgzY7omyMbnCAAmaVEJZAHpV27q4hoomnVwFCIgX
	MrLIt5FHM/nsEvwOhvmpnzpOzunBdOvHHxFG5I1qYAHkyBcMR8p3JiXpzGzppAm+c4O77KcFNed
	Ns5c3E58pbgnjuKST7ZnNvQULuF3oA9ROU=
X-Received: by 2002:a17:907:e107:b0:c2d:d702:364f with SMTP id a640c23a62f3a-c2dd7027971mr376425666b.3.1790689126737;
        Tue, 29 Sep 2026 06:38:46 -0700 (PDT)
Received: from carbon.k.g (90-154-213-116.ip.btc-net.bg. [90.154.213.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2b0f2f4f53sm531974466b.47.2026.09.29.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:38:46 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:38:44 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260929133844.GF10296@carbon.k.g>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
 <20260921090735.3174292-4-petko.manolov@konsulko.com>
 <ff085338-6310-42ac-8023-bdf6d48ad103@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff085338-6310-42ac-8023-bdf6d48ad103@kernel.org>

On 26-09-28 09:18:03, Dinh Nguyen wrote:
> 
> According to all my documentations, the Cyclone5 SoCFPGA has 3 GPIO ports, and
> those are already mapped in the DTSI. The address space that you have
> specified here is for FPGA bridge. Which leads me to believe that this GPIO is
> in the FPGA.

You are correct.  These bindigs are some sort of leftover and Draeger folks
confirmed that they should be removed.

Sending out new patch series...


		Petko
