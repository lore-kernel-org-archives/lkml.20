Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912167;
	b=AAkc3ryePai4O2qFXxyygqt+plj7i3HpkYqaVOykTXMdXbzuAZsTqS7M0LXsgMc+g6Hl
	 74J2vsAz7TloF04PT8odN1tHVTpv642/kuG35jX+M/x/8sbJEQwuwGKaF9ruOaKhuaBcX
	 ZujzNOvXkeTZ9SUSRA4uzC3vlozWwtn4Y+AzT8riRIO7YrDHPDuPWKWndLN9RGV3Hdz6w
	 94W7dzsk83ERaZC9msfjZ8Ai//tFs5NBWv0131u5R+U0QHCExa5iI3xkuPnZgSoaJrf/N
	 goKsEZ18VsP6Z0D0gSAjCIJxaHc9XOj5P4Vcn8bfLkcONLXKNagJlzGI7JRHrFEaFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
	b=Sd7OQHkRV5NnVZ0kwMwpzVDj39tH7EW4aX30Ef9QaL7pBTWnjMIl1oPLfi1xA+CNyzar
	 MXGhKSdPDHyDFJdcunUb+hdtB/nsGwCDmumY6hhfY7xQtMdjOPsO2sCxUculCol2aVM+x
	 UOt3o0W+z6FymThyYAKgseqHiZOuGMiI3Y3sH2DxGZX5f08HWBcoYgsFusxVxqhuy6nPM
	 pWuydq0VIeKADzi7W7fdceyjhKra7Gu4H+v6E46qPaxLMvc/FXewDNsH6QKpwCoOxWlzL
	 8JPM52LHHrYAonXlfMJHiD5V0NKw9enJ51LHw7e+dRh0SN1Nejp+Tt6lJ/OfL93YNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="JTOno/V/";
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DF606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6DF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=JTOno/V/
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53c4b82919fso28691681cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793912165; x=1794516965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
        b=JTOno/V/J4fyCfD/dlUURr4B1Ge4nZhUE5euQEnOZXxCFtc9XIFg5jdfX9mNxJ1UCM
         7RyGZtYDpZdyipozmwk+zrC8ffAEzT9wJMKq7gQ/NZg4h+zsOpsCAJgRd4MdMKnngVJk
         1VEDzbu2K3BsMaqdJbYgjo0ZLk9OJmVfSywAoXgnDaDW7bcujk6sgzhRoNUdObLeZySg
         kiPahA3k73nTvvchjg1yZPwfp7jsna8pZQPOh0DOLt+B5m8DknHz2vQdrgafFs+kIcIN
         sFfXnjD+YnVxoH6WY+jhbTGbTSWvMP9w1D4uCufkaSdo7opJbvJl8WLzVLlZ2U/WdqsN
         DUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912165; x=1794516965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAqnihyWjT0W1/XYLws/8ecxSlSEuqqsnuR+rSxLUM=;
        b=1OCgo7yd7Yj8aZVgmuhBxPa8AxL1aJkGO1tjInDkVg6ofmLLdkJt5ZQnoY2BuaIK7V
         6a2SqTevkKyOg3YhdG4SvGcgDoRBso4HkZO90GvXUAm5P3dyTe1OwiGLvUC49S/t4NR9
         6KOuq5fLlfS0PqCgShr/xltmqw5KemrS+jBrJkG6pkZkyLVex/0it/5YjweZ2LwYtAdz
         QzJOY/K7jxbZV9rWHGeHfNBP9uXuUmxxHYj7AN3QlYRgAzPl5pOefF4Ny7orc3Dcb6/P
         Wc1uGtznMwbpfdDG5x9WM0UgW04IgJg7pl4G2afZ8EItVi69+tL8B2hyrUef8ujzVQFR
         sNig==
X-Forwarded-Encrypted: i=1; AKwUvBzey+MqN4D0v9OwItfhzisrS8rCZmkDEi91O4apjxHsECsYxDoW+AT1pzUGTPDjXrHN0zbg3UYHUC9qELw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c+mk/EdessXIoCmYsBYE2OCFMTFSsDsGbJc3ae8SmyB3viFig
	aqietSx4Nhn9HLDb3QJhmr9TGeiwPwCfDIM3SuxvryqCmQCcRlc9RE8nyGVa1+LsLQ==
X-Gm-Gg: AYBFou0F6Ky7eQdzn001kN5EKU1FCwauYjPvkIagfhXoMStQBW2pA7+mZOHcM1k6lJB
	CGv4Y3N2YZaFyJV5Agimsp3qONPTGcR7AfAZ8JCXyo6vBD1ZHAtXXX5aCt9WiuVlXgU0TVrC3tT
	GOpD//G8ObFRh9Z74DeD1iJrY+kcfSvomOVVFFTQ7E52h1yj3N+OU4vZwU4hgcAi7+TWdO1mruG
	XypHnDAMoMXDXWefomftxhzScaPyBifKBaeJSLy6Ye4mrxTiv388MXZbHjyNFoytfm6gR6A07sb
	miLt06jL1fd2ghcV8MGjwzn9m8QOgd9VfuUrAZPsQ3Hw9H76EyyH7YanbEfZdK9cp5mHhEKeTEs
	N1YQ9DU0AR6iSU44KLLv+2NEVhX9g+FQyOXtLrJXzbsCf8qJ99VEzoa2BVIlKWVXmiceIb8RWi+
	ZcB7vJ3dNaMVo199dcWT2bPFsEZLXI76oeBIuqZ8/pdWbJxygZCV2jEHGTdk1cPUgiBC8iu3ZMR
	soMd3RDNeMetyyaNl4OvKsQei2Dw66p8G+KlwX82zgkNMT1zhokNleS1G8Qu8P6qzB9kX3iobZ0
	Y3C8dtf7igvahjytiFcD1RMSGloz
X-Received: by 2002:a05:622a:428f:b0:537:d4b4:3617 with SMTP id d75a77b69052e-54e102eff8fmr9205801cf.6.1793912165435;
        Thu, 05 Nov 2026 12:56:05 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e230dabcdsm2890661cf.1.2026.11.05.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:56:04 -0800 (PST)
Date: Thu, 5 Nov 2026 15:56:01 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Cho, Yu-Chen" <acho@novell.com>, Josef Bacik <josef@toxicpanda.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [usb-storage] [PATCH 0/7] usb: storage: some llm-found patches
Message-ID: <b6f819ba-2c7a-41a6-9b82-28d09f851126@rowland.harvard.edu>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:40:43PM +0100, Greg Kroah-Hartman wrote:
> Here are some small llm-found patches for the odd usb-storage drivers
> that were sent to me.
> 
> None of them have been tested, but they seem semi-sane so I thought I'd
> submit them for others to see and Sashiko to give a second pass at.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

They all look reasonable to me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> ---
> Josef Bacik (7):
>       usb: storage: ene_ub6250: fail MS init on card errors
>       usb: storage: ene_ub6250: report boot block errors
>       usb: storage: ene_ub6250: fix write to unmapped MS block
>       usb: storage: ene_ub6250: bound the disabled block walk
>       usb: storage: sddr09: bound the unused PBA search
>       usb: storage: shuttle_usbat: fix READ CD divide by zero
>       usb: storage: shuttle_usbat: bound the READ chunk size
> 
>  drivers/usb/storage/ene_ub6250.c    | 18 +++++++++---------
>  drivers/usb/storage/sddr09.c        |  2 +-
>  drivers/usb/storage/shuttle_usbat.c |  9 +++++++--
>  3 files changed, 17 insertions(+), 12 deletions(-)
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261027-llm-usb-storage-6d3bfec890ee
> 
> Best regards,
> --  
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> You received this message because you are subscribed to the Google Groups "USB Mass Storage on Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to usb-storage+unsubscribe@lists.one-eyed-alien.net.
> To view this discussion visit https://groups.google.com/a/lists.one-eyed-alien.net/d/msgid/usb-storage/20261027-llm-usb-storage-v1-0-d1655e94ed10%40linuxfoundation.org.
