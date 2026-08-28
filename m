Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80F3E6381
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906230; cv=none; b=pJiIC4kVFNq9UNIRlfFtcNYDzFJ4LtMhjIC0JGLOmN0tzHwF4XbxchgYUiN99pnzZ+xPzCrHfoLgopqXG4EZnrQ9Y04JQ54fEUbfRnpp+iceIuJ1ebaRmISPQDfUfGVhD7WIVH6lojvYRtmcVJlyNdienRa7AgritjiKOrweGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906230; c=relaxed/simple;
	bh=JjimoRVScCSqsPgCSM4g4WWACozV9xBIYZan/cGHbEA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTORQoNKj9vdn8KV98/ovdEcW08GtCYw4goMqySwhex7HRGY9LuUdGohpugso2CaTI3lrHYbFMc2yIFY2XpTW+v06qy13qnvLjE2BBC1KGzuYfJTXQfrI+Kn5jC3pd5Mm96+QoMM4/vsTjy5iKjd2YfR1E4AqCleGTuI2izpeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9kJhNEO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9kJhNEO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so6393795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906228; x=1788511028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xY6rbTR5zEzizwjLS/TmjAP1rgdrCTsmvdQtVQtF9P0=;
        b=T9kJhNEOsj1kF51Bmky2hbGcUeL2Rtto0QRtEp7USCaEljuIUpOtwCceoM3TAbbpmH
         917IxUrp0WKArqLNfqYyvEzamcl+JKi5zwRSQxVP+JgSKy16AiME70ZVsfQscHMpGz3n
         74BlXyysTu3Gv5KwUZNQ/QjHdz5YdQvJSMBUiyGdF8h9N/JvZrlu+Jfcb2505RsK0CzA
         gkSPZMa4STlTxQ7ua6Iy9MCvrrSC0D/dCOJr9neu+1IsjBCrF4kQG0NRDIP3BfHxrDVm
         85ETEUw0Kzj5TW0TjlEPNFrxHJ1yOqYCXgGubANkBQMgPFW6n+1I6naBoNOPkoKb25MW
         YLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906228; x=1788511028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY6rbTR5zEzizwjLS/TmjAP1rgdrCTsmvdQtVQtF9P0=;
        b=swe05bh5HG6Jl8NCbA/6fYlInqzrXQ/l97wmhpCJLnhOON4A4U2pSARB7+72e2nLnK
         sgAVmvNHHGVTqvFm06RHm7h7w9MCnWmBnlejEcb7vyUYXCDHYHa3usxX1dyc3JJyHXiZ
         Dp6guPxTO1lLPqzjMYcuF+gEfbQlkn3oBLU1dVRBS5leqlseL9k31mRhqk6cEHYZlhAA
         cNJ0FhYXrUjUAVvBzEfq6Vh8NqI3TIpIySNEAy52mQ6ButhKp+X5a/gyGDWG7wf+sSzq
         OnM1/qE2ILiNZSmyHcDXkpAVZagt7oRCFKFzm2b61rx2I4qnrB8UM03bjXGV9+eugMUK
         KOtw==
X-Forwarded-Encrypted: i=1; AHgh+RoQI1UhuwAwPoDzNMlxSlHekfnqrZZ5gcHGitiQoU1crN9FREpiYDQ2aSfpzNCUi2hJI95/gE7+6BLPsdM=@vger.kernel.org
X-Gm-Message-State: AFuF++kHP2sb3KqKG6xXl3OYsRkas+kGgHLohsfhT9m9fqw2Rn1Gm3R2
	ZFZ7W+OaV6RrXS/iaBlxyAS9NbnlkqltDGtH20thKtUU0/12H1oihwzv
X-Gm-Gg: AR+sD11F911sxdYSI6B6tzYltAPUYlT5P8YA1c3rACkLcFiYd/h+Wc/as7//xn3aF0V
	pTFZHm9bDs5NWlSIdeT8hfUp7Il82p8GGGtscne0u54gAQc8zHbLM9iM+kcEWnkPdNEvmkrrv5j
	CaJkZPt5mJVEPsbAm6fYsQKjuAhsC3F6kQbwP4CiyH+bqH/SG1rXuuCCK28V6rN5WPVY13NuAAy
	QLIoy/69CTHMpkQ3sSpT0ys1IRLbHwkj0+e7iWz4vt+2E/xMmZ/2sRpriqjovbYOoEg7/ukE42y
	GmPVm0TMArshRjbrqrRnSE90X1Ae5r4kM30rMw/jJBjV6m7XtKsGdc93S8bOks74B60rpyusjd3
	bZ8Th/o4HC/3yAg9HReDtiJXU5Bpnk+Gt/kE0qLFaXmdWudXMSsr4I2vQ6O06kSwZsFa8LhFmw5
	qR4VJIuAQb1TgaQRn6fl6t3FHelftHRt9Bt26UNiVu+qmejAT1Tyzgom5blyJHEwOyLxwXMu/lF
	c95vuXHm9ZVnZAHDBshUbNgrQ==
X-Received: by 2002:a05:600c:3f0b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49b91c30753mr77538815e9.8.1787906227824;
        Fri, 28 Aug 2026 01:37:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm121431165e9.6.2026.08.28.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:37:07 -0700 (PDT)
Date: Fri, 28 Aug 2026 09:37:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, =?UTF-8?B?VGjDqW8=?= Lebrun
 <theo.lebrun@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Bell
 <jonathan@raspberrypi.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: macb: exclude software FCS from TX byte
 statistics
Message-ID: <20260828093706.3419d646@pumpkin>
In-Reply-To: <20260827115601.6bf0b18a@kernel.org>
References: <20260824134703.766708-1-nb@tipi-net.de>
	<20260824134703.766708-2-nb@tipi-net.de>
	<20260827115601.6bf0b18a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 11:56:01 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 24 Aug 2026 15:47:02 +0200 Nicolai Buchwitz wrote:
> > + * @skb_len: skb->len as handed over by the stack, before padding and
> > + *           software FCS, only set for the last buffer of the frame  
> 
> counting pad bytes to ETH_ZLEN as sent is perfectly legit,
> it's a driver preference. Some don't because HW pads and
> the driver doesn't want to bother adding a conditional.
> But it's best if the driver bytes match wire bytes IMO.
> 
> Either way, you only need u8 or even a flag for this,
> not a full u32?
> 

You could save a count to be subtracted from skb->len.
But isn't that also unrelated to the UDP checksum issue?

Note that the receiver will treat an IPv4 checksum of zero as valid.
For IPv6 it is a protocol error.

David
