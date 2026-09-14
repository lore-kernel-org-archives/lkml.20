Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A5475320
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394767; cv=none; b=X5u+EkHd9ZzOT+dxiO2c845mvIYtO4OZtZ7BhZrTNMcMP2oYoYN1D6CjCencta1B+/3JJsrodw6kVaRxeBtPPlTmhMZosxCx4WYIAM+o9RNMDFzwC10Gkzrp7efSplI7NzuV8Sy9jhz4c5dAssQ/CdvkJF2bNCymHaSLyBcQTTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394767; c=relaxed/simple;
	bh=ntRH/yJFT8bnr3NA7fpl1u0UWwgPQd1nw1mxGnJ3x0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWkNhVDuZBQ5BTs07tHj82fLwDo8yuI6BTZS74z04bwIdTBqLRZg/HD44lU7VjVk6gs8RJxPD9yZOZkbyqbVSpWa+e0v/bPW+ro8f9r6X7cUZfdf6n0Cpijs4u3Cg298U3fR9PDrYYUCDsPy9KDOgp5XEPZINpbDBWjazqMnH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5LpRl7f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7DZlitN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5LpRl7f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7DZlitN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789394761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
	b=S5LpRl7f7638xXAMrD7Ef1/RnI/eoZwKcWqosBwe/7vmqOQZOKVbFTR58VFSgsw6q+GTLl
	QYEhRuw5fASUgutg/YETlluVJaD/AMfei2mQ6udNPNtH0/Vyh+Gbxng6n3O6kJeY4gs7KD
	B/7/i5C2POUAFa5gQVBHS1KUnG6agUc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Edou5225OSmcLOMZbSAJlA-1; Mon, 14 Sep 2026 10:05:59 -0400
X-MC-Unique: Edou5225OSmcLOMZbSAJlA-1
X-Mimecast-MFC-AGG-ID: Edou5225OSmcLOMZbSAJlA_1789394758
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so629655985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789394758; x=1789999558; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=D7DZlitN6frSkTx5Fw9svg0AC/DZ4eijMsFnuj1VRu9YhrSifzJh19FSlbooCf7u1F
         +baduFVexaf+2cocwWo90s/9iDkeSLujgj6xSanXmiAOgoZO2Q+C/EapDke0jNFbavIK
         Iz1tCIbnDqtGxUU8ClCBeVeF7vAaFaFu5Vfu8eL8yvfAYnqGYG3xK3fZGt6ec7pQGdnC
         ZaA1nKwi/FyQQw0q8wGwmlBGGqS2ZYgMH1z9SXflgQFtYSArH6iDigTM5lIZlHwLskoq
         RQy8FpTKTHMuQjUv8d15IjUWcC8QfGXuETbZcbagn+laDMK0YEXxwmVmmm7dFB3AACrQ
         ZlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394758; x=1789999558;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=Iq2MeZq+hrOJlQyS0aeMRcpPqJJoUtunxAJMJx8jd7s3KW9fkmRMxfohYn89RYtmmH
         BiKRxeMrWre6RqJG2IlsfS+HGyn9wVWg6LZZBGmlMBmh63dhIkGXpXzJVsr6vW5e0Rh9
         vdgWWueuLXmfvZ4D6L/8T7l/JWAO6JsCU5EQa2Oq11ddh9jwQgvBOTGBW4VWxk54aUz2
         8z63K29uOMVjDHH4CGjorrSiDwv6Ee67tO5ycDTsJ5OU7pUTKeJw42bDaV4zWDUXoU2U
         VxwgZ4zKGex76gpTVGCuJYPw9a+dAUDcWLHsbF7R3vXKxffII2qIxwU0VsD8NdGoqCY2
         85/A==
X-Forwarded-Encrypted: i=1; AKwUvBy+rE4KRDMU4uz2hutZP5XTmfEp6yGeHC/Je748oxbDzkKiOwXB1J+KHk9otP92pny04YNR7sKI/RNZH7E=@vger.kernel.org
X-Gm-Message-State: AFuF++lI38230KSPY875zPQq06oLmFXrppfy4OZ+eDzJgqV1riPJxns5
	8OUHC2UYG1gNYOT5jb4rdfT961Twy9L0ye0zCdyi7O449wVahjgYYa6TvjoeGyRXtgE1VUlB4ON
	N30feXZPNPD4GCc+UHkAl488LUa5fbqMRKblqhxUmi10sq7TJQ9S+6CkyIpisvJw6lg==
X-Gm-Gg: AYBFou2H4xAauKmtdNW7vbfuqsIPQ49RoCnTzyVgybdCq2SkWUVJ9aPmfVzFq7BpxGu
	VwPPj58ALXpdAuNalk603JUrLBikfej9A/tjW9aap0p50a9The4aVAho1NXfyFmXpagDzxOLC0u
	qJui31KXbcxJ2pXlj9DwDx6P5+N0nbm8VakhUfi1dO/CmlzlvIsenx/frJZwXAidwgWgsz2XwPB
	8EJZfFvYZiKN/3L5uqlXdBw/O4xDJ3+StOmcMgwqP3ZL7Gnceh4f2xIrZ8RtNu0+FgkwPX3zkSk
	Lq6XoBttyqHAnNX73BdxcKp3+mTeo9rtyzObVemvYiWEKvBo1IT3ljSWJ3CiHGtTvCcyMLqCn+0
	54mrGjcIV6SaaFc8Gk0i7nZ5bZ/jBx5TLLEQ=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389784485a.16.1789394758162;
        Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389765885a.16.1789394756851;
        Mon, 14 Sep 2026 07:05:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm906151985a.43.2026.09.14.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:05:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf_QZpOIj-170Am@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
 <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Mon, Sep 14, 2026 at 03:48:20PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:44, Brian Masney wrote:
> > On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> > > On 7/30/26 20:22, Brian Masney wrote:
> > > > Should there be a new MAINTAINERS entry added? There's currently 221
> > > > files under drivers/clk/mediatek/ and there's currently only one
> > > > mediatek maintainer entry:
> > > > 
> > > >       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > > > 
> > > > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > > > subsystem maintainer similar to what the other SoC vendors do? Help with
> > > > reviews, send in pulls, etc?
> > > > 
> > > 
> > > I may be able to step in, but I have to check if it's feasible, time-wise, on
> > > my side.
> > > 
> > > Though, that won't happen until mid-September... because, well, I'm about to go
> > > on holiday (in a few days from now).
> > 
> > I'm checking in to see if you would be willing to be clk submaintainer
> > for the MediaTek clk drivers?
> > 
> > Brian
> 
> Time is lacking

I can relate...

> , but I get that one hour from me is more than zero, which is
> a good thing.
> 
> Let's do it.

Thank you. Please send a patch for MAINTAINERS when you get a
chance.

Thanks,

Brian

