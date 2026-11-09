Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267781;
	b=aWZAcK7ZpXYOpI3jhSKgnn2vI+Su7SITUgXj6Bd+kS3ubBqPBYc/9ddRCl2j71vu//HR
	 oHgH7/7CDwwuy1/UfGxKf/hb1XKdbUwmgneGCqCqaphLV21MR3AUQnCG6jmsT8dUBmS8F
	 uVLFtqgc3vxlLwWRxRfwR0hHR6bgVb3wCsf/oi0UpMALLCph8BFH0q7dRaV2CaAprGcYw
	 lyfzPM/xVzVuZcM/bExfwcnsTlijttYLP/FDeoWYnM3RjhXmYh7p2mQ4PcHgqyRbW03rn
	 d9PBc8Tx/QD/nA8xpAQ/VrU49UUqjIDG8QIEZYkREfd0asErHeDPq2BvJuAGBKvt+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
	b=3oZZwpD3/Lrnyy/rWf+3iii05+NfOSpeb8CVut5vNYMioNnJmr5eTOM/lLKiddMj75+f
	 dum4GrbnUqhroavgudYbP9TWvNV0zxc+7uu5LrkOvVSSwusEf3GRFlkROTpj5SnZSlqS1
	 070jqrCdm7uRrex54xc95+NdEXNxpBpoL+ZfMvrgQNERpSknYAE8cY5S0R9CnAjJhCKKd
	 jlTHfYlE4JzovNT6ZOSiAlU97KwibTlQSHyNfQLW8BA9on/UEGD5sDif8qWeZwS7TclXv
	 fK5LRtPPJ/EhfTtKfVmHaJpIrQfvkUlQL4YfzBBFyV6WwDice+bnrM1YVGS1WfHbNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e635220b4so130689385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794267774; x=1794872574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
        b=eyKmq1RFBX1cY34faaTMzv+/jmqnlovGkEDQpCZQqhyzSEO/Mh4Ah+2/XemgZcilwx
         r7QXK4z9UnKSByvGCN92EOz4EBespGnJaamquIv7w1SsCgShVQQfMrfnlYV1tEgeK6HV
         2B5o8kdrBIYe6QPc5lyMukLOCQdNn6gBE55kDgEvfddkM7zX4OUho5lEDRsvrmLP0Q1i
         PpB05POLoChpg3yyFe9/zbzhb6mjvSg4kazE7vfNzIkd3uTssiSXOj0qE/K00STYbiNd
         x+UX5n2+IWg0I+ugcD6ZhpacgkAm95jl9HqxBcjjLp/HHNC4nBc2R1vdlwOg2DeM5YRn
         58bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267774; x=1794872574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
        b=FbC+t5QDHgQ5gri35FQC08HzBN8hIqljaoXdihrdftDzNGJuT5EtpJOFxru6XqTEW0
         53Tb7/FejiXFXXkLn8Cy0cVdP6kUVwOYqBWY+wLPhvlQwdR2Ecgme13HUQwzwbKKWjrH
         tpcr4cOrSnH4melDjxpdpmytkGiYaoo/9QiTK5kMlSJdv2siQsEMa66NO7glmVgfn9YE
         Wmyk4lQhb+EsbbNbuJ/Ws/aF4xf7wrwneatJ2RlZBHn5SYiZuebELe4ldr5VNQHIofP4
         +OT+D5oBE3ZSPpUwZZRj0hOtO8RStw4IVQcqCxeWDkOUWr1vkB8vPAg3AMMhVA0xaAJB
         dUVw==
X-Forwarded-Encrypted: i=1; AL+hErFAi4ajDQoFMa8NbIewrmz7EGmuzSMh/SbPO2c9lYKK5hp58NEmDh2Df2skAmmeNuz5lAo9GlcfYIlh8a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y2B5X1jyf4kJuf6zG9jX32WfsiKbL4cSwwigdqQTtNsSA7w5U
	3Iwa8WZmi4n1s8wp27T9bM9salw5TVpSlfxMSC/W99S88msnljMfFVWJkUXEuxkfAi8=
X-Gm-Gg: AYBFou1juu9MEb/IUbyr24ImO7dZxAIbGiR1x9gZNVdYjTSBzX7A10WN5sxwbrMjufz
	1S18WNLm5Rm+vuN/JlCrqXrATgrFk9M2PlFs/WKd0NgkH0gnlhOxYAyRLbxJM26JUl/4jI9bmeK
	y5ar9LV9u6SZCmGhgQNQHDjkSmoJSosbQCwX3Q/2hnvuSU4WahLP9tM6mwqZTXZfqnP5G53ZR8X
	+7SoBZlXCW4p5gXbmO4ItDuYdMbW/gQH+wsqNn3dGyP4a0Oyai56kWxLdYv0Fax1JywNdY7pStY
	itVJ3tShSad680D2AIUaBPL5xP4dtM3CTKjHEVkaL7EX7pBXo53E0NH/U9guFwycBwz6m0T4Si9
	fmQt9yU3arUGZTIBUWI08AwBlY5QM7sHl01Fyf2gojx1F2JZR+eJOXVPVFD1N3zH45D+OKrxd4f
	LytN09zCANuPsxfGCU6xRTVGS6EXzhSjC99iqNJzip0J065XGZArcEOv2NGpwzm+7o8CvwMXali
	DB0oWygOLFwNkkr+gEIQfmX4qVhdK/SMzTsdO7R3dF06mZchBKZSNyFJX6rH6nYO8yoFGNyqcGo
	8t9kwHbi6et6tRVIbPcxSropJDu1FgTcT5JBkMSkqx3U0oJL6MaOXHAhX5+IJ8QzRA2CY4EHZZc
	YshT/2tOJKA==
X-Received: by 2002:a05:620a:2725:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-9479f2fa688mr176463985a.26.1794267774479;
        Mon, 09 Nov 2026 15:42:54 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784b90sm91815285a.22.2026.11.09.15.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:42:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQZ0m-000000033Ka-0GQE;
	Mon, 09 Nov 2026 19:42:52 -0400
Date: Mon, 9 Nov 2026 19:42:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Fang, Peter" <peter.fang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"kas@kernel.org" <kas@kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"qinkun@google.com" <qinkun@google.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261109234252.GR663069@ziepe.ca>
References: <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>

On Mon, Nov 09, 2026 at 11:20:22PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-11-09 at 13:12 -0400, Jason Gunthorpe wrote:
> > I would be very happy if Intel came with some plan, documented in the
> > ABI comments around their labels down the road.
> > 
> > What I would like is that given a specific label any userspace can do
> > a verification and full dump of that data, including signature
> > validation, without need of any further external information.
> > 
> > Ie it is entirely self describing under that label.
> > 
> > So if someone has to say externally 'oh this was a legacy VM' to make
> > parsing work then that needs to go in the label.
> > 
> > Think of it this way, you should be able to run a command, lets imagine:
> > 
> > $ attestctl dump report0
> >    intel TDX A:
> >      - Field 1
> >      - Field 2
> >    Signature VALID
> >    Certificate chain
> >       A
> >       B
> >       C
> > 
> > It must not be something like:
> > 
> > $ attestctl dump report0 --kind tdx_legacy
> > $ attestctl dump report0 --kind tdx_dice
> > 
> > Does it make sense?
> > 
> > Whatever labeling you choose has to follow these goals, and there is
> > some trade off between making thing self describing forever into the
> > future and exposing protocol details into the guest kernel driver.
> > 
> > The future scares me so I would always design to include a description
> > of the blob from TDX module to the guest driver :)
> 
> So we have this SGX based quote format that is fixed because it already exists
> in the wild. Going forward we are moving to DICE, but that is a standard format.
> So also somewhat fixed. I guess the question is: is there some combo of bits in
> each blob we could check that could deterministically distinguish between the
> two? To do this we would need to analyze the quote formats.

You guys really didn't make it discoverable when you added DICE? :( :(

> If there isn't, I'm not sure what we could do at this point. There is a library
> Intel publishes (right Peter?) that can verify the quotes. I'd guess it must
> have some way to distinguish between the two. Can you check how it does it
> Peter?

See this is exactly what I'm talking about, I don't want to repeatedly
get into this situation down the road over the next decade.

> Another option would be to teach the whole stack to request specific
> quotes types from the guest. Then this new component could only
> request DICE and never be surprised by SGX quotes.

Is that an existing option? It seems OK?

Jason
