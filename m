Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA223CF21F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874201; cv=none; b=YeWIJT0O7B5N65GVRmpZi7TbwV4ucDCnVL/c2hm+i9VchvCsH0d5Vnh5zp2VMqTr+HO0tducVO9RoXXQnbMbG4m5MIWz1TwkOizxRWXgT25nKmYKk4U2JwXZ53JzEhb2DcIb3mfoN9GpgEOm927VNvdUTQE6ZGOGd9r8jTYl4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874201; c=relaxed/simple;
	bh=AATMWNx/td8CMo3aSPUQaxRxKv0aYs/TyeFme5JpK98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/TXpZkyaFxHR8EDwMsQwKBgOFR7GuEGY3B3ETvAD4zkr1S4zpXOwgG/6oNTYFMuEcHZn7sHFtx23G342hsfWQl+QI9B+8kJCi3BW6BSXJBcyIAPbImmlJEtgiY8jDJDkNN80EqO3xfvhdX/rbzlBvqxj+VhDlwtu7o8p5RpAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I/2f1hek; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I/2f1hek"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so2958923d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790874188; x=1791478988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=I/2f1hekePyFtYnvGMr9IHKlMXMuCJJttYQUcdlFSyZlZB62LXqMzCEBsE19Kk15h6
         Pijl7aYTHgK9TAdXtRLloMPjiLOauS6jziBF+VCDHMNFGlnI/aaFJ1Zcoa9WRkZwGwEh
         XRrJCDp8syfwkiTU1NFCNp6uVP0hXTKHGsw15wPofFCvdyl/jkoe8eT7va8X3BunoybB
         zcYiLl3nND/gAQuERNlBU68u2HDrrEeYhzaFJNXgpnHOxPwrApA/4KfzYFvh1NzPd/5Z
         Ok0X4tB17+YKx4hW8dEIVyReiRf7P5fYjZbRfD/eg5/2GFZUg7e/dxrLQpEQgx4WNCSY
         sEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874188; x=1791478988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=a4oT40YKSEO49RH4/1oaS8Jo6DLv58jv5q4coF5Hl5FdT9i9OWISV/jynVomZfWcvQ
         IFQSkSOLNuJi7Yd5hj5+t/fBoDzzgq5fjJYWMgdUANnsowQhiyF//eDt0EMuj2InEpy6
         4DhR6bIGE4TtQq36JI66O+wjR+XKAhSSEvrW5Pweabt0YVkanEwUR/BXabyOkeofgieY
         dvv6TmXajatUIvHjDiPLzrm5sYsD8V+0ZEI6TqgPgNCfqKb/wYYbNfdI0CC7d0+gZoZZ
         ggtRerww1qvOvXH80MDkMHOv79PjC5cVfHY8luq2NwUkflWUp2fHRcIrycBDPMlisMAo
         z9Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxa1gZ+mcvTdmFFKk+5LHw9IyG1HVUwp3euGSMENs0eVFXVA+GB8WmBOxgPyNWu/4XRENRXfps3KpubAe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfxt0kCPNj/NQK4+SnAmR1w3aMLE7I6UXk75s6GtCG5TpNBagr
	mtYESyNVPuLVGLRh5SCuubKUfWc6CRbiokAmbxBwPEhrwJbPKgqGqiy8SMmxv5XP94s=
X-Gm-Gg: AYBFou1Tw3ktgotDGx1TDHkX+sNiShXCWcmiC8t8XLLz3weCmvk0dFmpxnw6LR5WDLC
	xw3dDGuO2uDWb3Dk79fIFqGC9coggbv4iGqA6qAn4NLgHMhB3QcA5A6a6dYeXpb9ckjpIx7Xz7c
	Tb2R02fR7Bi2WUeQkfqBdsZI1rwNidAtk4j2SusRC/z8+x7JezOUD1qU273Ub67UzOQKN8TskyC
	q5KiopFCVf+itSUk39MEyBkvXlBDlpPKQfLPR3TH2z01mo0yEHW3y/T2j6jytJWkY5TaRK0wRDs
	1jNPBQB0ThxhZH5w1CqKbUHNuNlOyOEEd97ubsZhjcxvMhQG8TbQzhtrvkkQyBhopznqUEPce3h
	kL5XBvJoPIuamX6ZtSFz7ysY5XFi36uQOQR0mYiayDLhB8J74295N1rM2pP41qPu+OApzdzaox7
	BT8kH79qfelYju+FSckrn040/sx53HvQZTQc3F/wx1kboLhnKSVqKAK97wOsKeu6mDsPM4BIX36
	/j368aG2I30OCw9ddIc5/0F2nlzomHK
X-Received: by 2002:a05:690e:480b:b0:675:67be:3251 with SMTP id 956f58d0204a3-6768349058bmr1756658d50.62.1790874187795;
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677abafb2easm26948d50.4.2026.10.01.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:03:01 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6R5Df_uliYg1l6@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
 <ar6E4bQAKonCW3st@hiagonb>
 <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>

On Thu, Oct 01, 2026 at 06:57:08PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> On 01.10.26 18:08, Hiago De Franco wrote:
> > Hi Andrei,
> > 
> > On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> >> Hi Hiago,
> >>
> >> Please take a look at the patch [1] and the discussion.
> > 
> > Thanks for letting me know, I missed this patch. Do you happen to know
> > if any overlay was sent? I was not able to find one.
> 
> I haven't seen it, so I guess no.

Ok, I will sent this patch as an overlay.

Please, forget about this patch. I will soon send another one.

Thanks.

> 
> > If none was sent, I am happy to send one. Sorry for all the noise here.
> >>>> Thank you!
> >>
> >> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> >>
> >> Best regards,
> >> Andrei Lalaev
> > 
> > Best regards,
> 
> 
> -- 
> Best regards,
> Andrei Lalaev
-- 
Best regards,
Hiago
