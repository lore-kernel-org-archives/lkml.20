Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D643F4A3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400051; cv=none; b=F3l+Yyh+19ZdJ+hgcklNMi+Zz5tCiCFjCIuQeEPZjuxTW1BKyWu4YBPAjrKucoOEIstrlS51Bhnl1c0EvNRYYOgwrbPwkoW9mG2dM19MziKG/rlL8TtDZ+yVTtWncnq+yQ93h3/nc4Neoqpx8B5ioScVNbmYBTcrsanHplLgBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400051; c=relaxed/simple;
	bh=73+u3x/n1YfpiE8SSLEI/w9n2zZJ9GrkZIhTNXSFHP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3SSKMn2xeS79diaDO2fwnVP2zA/ACJovpaTAWNCHJyZ/YAOP9efA3X0V+lysP+Dt06zVnrDa2qVoWT6zn82KjzIDd8+tyjERJ67B1atv6MSPdQ+ERhVi5oJppynnKqE36xAlfI156sW/jxMWwsYDzDf9QCE/2pXomElaNnG4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJZIQ5VY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJZIQ5VY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1789600f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789400048; x=1790004848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+kCrOYTrT0PBR6fmrHzTjMR9TWO6j/pXIvsh9ilVI8=;
        b=aJZIQ5VY7WRzyyDd/vZTwCJqg3wVhoFLLhU69s2CYBQtkchAJaehOE9JB0HLSiJeLD
         J2UHv/x5hsW/Rik8IMLuu4ePHxKyWFHAduCO3W68AnD3fWMF2ZWm8gfiWJyV7hnbhlHe
         SDeGWQNl4ZJMTcrtaVOYo9kWrbOaDN9x1/sifGQQ5fQpdLeQdAU0aySOuMuzeHZ1UogS
         xGFhAFZpDKTnUxKb9QgMxUfLXdP1qe5j6U7t02UlQGvavBAalNORDwlIwttYo3pBjVy2
         dcpobYqIRSs+aT6HJJkhM3oDWcigPNN/p0yxqrVavxqz81Hwl6DxbEaQUf0wHcorlaJs
         hUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789400048; x=1790004848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+kCrOYTrT0PBR6fmrHzTjMR9TWO6j/pXIvsh9ilVI8=;
        b=CKhBOfnwGAR78ZSYg56aDLZdU5GzAMXxlWPAYygxROPAxkbdC49IUM1hVqDdg6AYmE
         Gbcrh7mm1AFq1iS9anGFmf0lFuTTbc2FjfDV8xjxg0LGck5Ldvx7FXQjgr/5tOMslBsN
         ZSvQlpAwGNKZu2DVjh1Jh8yyjjSlIaUHGC42hqdpBq1dx7EMzqk7M8Zd+M0x7LFs3PJE
         0EFknK1tQPaKgOB9A3TGJRiV8vSODUh+NBUJCvmiE9UhdfccWm8n/nkRJwzrEU95QlMF
         sMqcz/fVHEmun6BAF2yci0RQFD7zp1Zqucxt9tdmI4OlHUdWnS0wlzG1+2XB6Nok5pI8
         +WDA==
X-Forwarded-Encrypted: i=1; AKwUvBwCPzu55sVJ5P1ugCzR4OLw/EswwAQjkOe/imARpjC6uWBn6/8Gmzk1PuImisgXeqJvUhUYiYZlNlyuCxE=@vger.kernel.org
X-Gm-Message-State: AFuF++m1x76+Ol/ak5ww8bh6pDjGl21xC7o2ze8NLrf+y+rGdFuNw7Ci
	yQfiBB6p7eqqIHR0gL1ND9/cFPJnUTNrnNsprsr6skm6H05KKLU7RCZM
X-Gm-Gg: AYBFou2e8zw316x22yRqI7ERN8n7OI+T8bkHhtz96di9Bkj8D+jqLcZSNn4Yf+4h/dF
	OLYZ1st9OoPMZGniI+z6PkKsxMXr9LloDZ7waA/zKcVZeF6aRErAwLMBNBB41I/B3xkjCH71QxL
	MCI+c3TZXkwTy8K8/4bhtg7cecAvHjJMJIykXgcUlFCr2HBF+daqEyvJCg49liRQvkpIj0lUyXw
	FuNFefUkQ6HqDY2J6WVUU9L5KtOHAN4PZnsMN8czOCgOHRrkbAWfjtH0rb+BCXaf9AxgHNVrqdF
	xqU7Xb4XN/49Uof0eeXxKvE03SY0UCvjRzpAQ0/25vkgyBSl1yon9AJTxlYU5gQ7eMauOVhe09K
	dA8VFMkGOsgZDYIMsADUh3bpbrFDdwDRDH9RqQItXYBl77JkUceA+aOFB2SxnBL1WFuF7JWgU28
	gksFBku6uOxvHr6qGTnHAPRprchM7AELrWPX+HxqJWqe67OhsH+O1iPmlzRnLgONYV8IyUcBGO0
	OuvmYdi7YbUYmebxhJ0GQ==
X-Received: by 2002:a05:6000:2685:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-48702b1d3f6mr9417456f8f.21.1789400048017;
        Mon, 14 Sep 2026 08:34:08 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e8d1sm28140259f8f.11.2026.09.14.08.34.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Sep 2026 08:34:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:34:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Selvarasu Ganesan
 <selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260914173403.05d1bca1.michal.pecio@gmail.com>
In-Reply-To: <9d326c6e-f033-495c-a5e1-dacb46ea7b73@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
	<9d326c6e-f033-495c-a5e1-dacb46ea7b73@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 17:06:35 +0300, Mathias Nyman wrote:
> > Selvarasu Ganesan pointed out that xhci 'core' in fact doesn't
> > include xhci-sideband.h yet. If possible I'd like to keep it that
> > way.
> > 
> > Setting xhci->sideband->vdev to NULL, or calling a callback here
> > changes this and is the first time we then intertwine xhci core
> > with sideband. 
> 
> Disregard the above, I forgot about the
> xhci_sideband_notify_ep_ring_free() call in
> xhci_discover_or_reset_device().

You aren't entirely wrong, xhci_sideband_notify_ep_ring_free() isn't
useful to sideband clients so it could be declared in "xhci.h" instead
of <xhci-sideband.h>. Then xhci.c won't need the public API header.

This function is also exported unnecessarily. Another unused export is
xhci_stop_endpoint_sync(), because sideband hasn't become new module.

Regards,
Michal
