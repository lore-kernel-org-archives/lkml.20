Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244359;
	b=KbvJkucN0SqTGHoUXj0mPt2BgFm8yUoZIc30gV1uRMeE+cFFoJ+fLMu55H6TFiwYK2y7
	 AsoD5NF6qzOjyx6pmCHp0bDCI0AIGwlgKhAw0zE4lnzO92i2RlCEmAYOwG0iiTkU8Xdga
	 xTz3BHSAtSxbtRPqmjnY08K+kSmrh0ESFgb+AKCkEpd1yB+sETcpz/kqw6ZGIDi6jkNqA
	 rKKOfyC0W6OBuRmiRuBmnoIbGZhePNpwH4n5nP9yqasDW23wl2i3PV/lVmNTD6/QztA8X
	 vI06UEiWTkQr+4zmguSWL62GAL+Y3pvwPuifz2xCrpuE+XvKDNICBEiiP+jYq9bHp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
	b=QaRZ0irmZjb4bE/D7w0cxEyxr5JdXeYuzwuKqN74Pk7JWAGRIAiOgob6jrxlT92xDdKx
	 UnYVZGyubywraXwu8nqCC00PRcj+8UwIGh4OuaYKQmbxbuUqabNZLM6FisAWWENcbt092
	 f5hPOi9hP4uBY387iT3mRVtWtTOmHy2LPKs0I9gtspPwTiwObSobLB57esiBLUIH69oME
	 xiS32shGlFxyLj4qdisxtLEZTMST39MZE8OM4HVNw1iH5/yLoV/WiXf96Ao+NO0itpj3z
	 X9bmEhq/mSAgYe6ohYUr4oRuJoRSdKWlQyeAoymVnVSpQvRwZ0Y05TXWbw0XOUSM5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yl4Em7oV;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3B606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Yl4Em7oV
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-945ae2daa3eso124034185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794244358; x=1794849158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=Yl4Em7oVwrZZg0i63RkmLtgR+ZRN9euPgyMkxxN1Ob152+zGGnL2fm2jvTYJo4LVnF
         vMEovACZqMWqSZBQO8MwjFgjN/VfTU1Hb0gUOSD50ReMsbb4x2PsB8Vqznx9hxIVJ9P/
         ktueRojchyU0OBQAvs4hpd+FT+5Nl5MGAaSYHa1Vg/86pPRlmOn28BDAbJB366nQmarU
         C7enZgKp8KEKbUHK1eQuucK6wGkqEYMXhjguAz7je3g8iMjLQyATGWC6+GeMkRPjj6b5
         YcfHQWnHrd67gsof5g39Wok+gfkBlOMw1fVpw6g/CmgVLoFrpX+x7ke/8IMcGiq6ZU6J
         xcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244358; x=1794849158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=ReMcdeQXes1F2GxHYQUC6DVMzCkpIeJICNJ0aZdSzkSjCmvJpbyM0sBG16gR1U8o2B
         aj/snCZOrhMG/sYR5ceiodwk/JURj1HxIHchTZD6do08FAKHwCwO7xAVghaZuzglpV5q
         bdcXvGG1vkt5MJLuxq4sDUo7glqSqmd7Cz2+CrpRXlEwBiU14e31OhbnSq9jj46O7zwR
         IdDlH0BWgB0aro4qhEMFPgzvDzimmf4TENZPJ2Vl1dYaPFKzMWYk0QtQu6zlF5VUaYZL
         Qvfyfgbbc+jMZeG9iounV0iJizyEtQ2aaiupd8D2OsixVGlEVcWecDPf35FL4pJshs09
         bmkw==
X-Forwarded-Encrypted: i=1; AL+hErHIExH8nOZR7lAwV+MuNBnOd62ym6zlfNGO9er2bJPLxQLAJIX1ttQjAdmwfpCLaec6+mAiamWM1hWN5Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+grsbzdrrzK2BjSylvb0P0OV715hE8G9DyTQAbmrZEiONkvTDh
	3KsNXHEv0YrOfOhDS2dgxEAa3A9Iv308PCBUlPFQWcxAfe0ZeyNF4YjJZR/LN41KvY8=
X-Gm-Gg: AYBFou239F08QvbeU+OQjMml4MfrMDN+wuKD5LY0rhJCrprA11hFe2k/UT/j5eXwHSQ
	o81uiMML9GIjJO5PyY94kyBrfSquHFccuUZBMKc+CbSVNd+a2ZAQ25nMGORTHcKvo7aqeEb+AKf
	QRwZaWSd+7+p3tTDhVUrvVOISR2B0rafEXsrRY4GESif7Sp9I990aryVeQxddWJ2b/6uEpQ1MdJ
	0vya5h8Ty4eGxVpYZY5T8dk3uOMjxBhnX0zFERAKZVuxU2f2NvwHWPbQhddPAl2AW2AO74sThnL
	35kMpdVXIG2288ka+JxqOBqmbutj6soeHxTvgbVZJqFkpeOvemqQ0YFarxmHZYgSXEMwEPs3Fdk
	SWZLc9Wr9xP/lpXZQ+aXy1QuJcXGtmFjbUAT+avDS1mUb03zArKUA8QUKrV9NyMJyRYU3kTpoUW
	v/5TjKFPJ76lQ0pWxPp+20/tcXDczIqlj7H2WS7W6+jSxvp6fPVyQjD7u9LLYtxP3RuziZ01sKh
	oOTYZokOMdBqUTLcYHiECo09Nj78VPjTaExfo63hQHsvqnRZLKXTHylybJ9pdZKLYu95Gxf55Jy
	ECjdKH8RDjRo8YJ3dGTCayxtQ1rT30jNtEXLkYOnoKWP6y/Jaa3Tu+QnMDaGfAkTF0f13b5/DuQ
	ioJKbzrO/wA==
X-Received: by 2002:a05:620a:4625:b0:946:26a:22c4 with SMTP id af79cd13be357-9479f415545mr8700585a.73.1794244358097;
        Mon, 09 Nov 2026 09:12:38 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm277806d6.41.2026.11.09.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:12:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQSv6-00000001ryf-1fz6;
	Mon, 09 Nov 2026 13:12:36 -0400
Date: Mon, 9 Nov 2026 13:12:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Fang <peter.fang@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261109171236.GP663069@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
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
In-Reply-To: <au5LCE1jau0yDo5S@intel.com>

On Fri, Nov 06, 2026 at 01:47:52PM -0800, Peter Fang wrote:

> For TDX, the direction so far has been to keep the guest as simple as
> possible in the attestation process. So the "quote type" knowledge is
> pushed into the TDX module and the remote verifier. The host kernel is
> mostly tasked with transporting the quote blob from the TDX module back
> to the guest. In other words, TDX doesn't have any quote type knowledge
> outside of the module itself. And as far as I know, parsing these blobs
> is sort of a pain.
> 
> The TDX DICE blobs are actually self-describing, meaning the verifier
> can follow a schema, parse the blob straight away, and know what's
> inside, including how to verify the signature. They're also
> distinguishable from the legacy quotes. A launched guest is guaranteed
> to have a stable format for its quotes. So this makes me wonder how the
> labeling should be done. Do you think it makes sense to just have a
> "primary raw TDX quote" label and let the TDX quote blob describe
> itself? Also, I think currently there are no plans to add
> secondary/supplementary blobs alongside the quote itself.

I would be very happy if Intel came with some plan, documented in the
ABI comments around their labels down the road.

What I would like is that given a specific label any userspace can do
a verification and full dump of that data, including signature
validation, without need of any further external information.

Ie it is entirely self describing under that label.

So if someone has to say externally 'oh this was a legacy VM' to make
parsing work then that needs to go in the label.

Think of it this way, you should be able to run a command, lets imagine:

$ attestctl dump report0
   intel TDX A:
     - Field 1
     - Field 2
   Signature VALID
   Certificate chain
      A
      B
      C

It must not be something like:

$ attestctl dump report0 --kind tdx_legacy
$ attestctl dump report0 --kind tdx_dice

Does it make sense?

Whatever labeling you choose has to follow these goals, and there is
some trade off between making thing self describing forever into the
future and exposing protocol details into the guest kernel driver.

The future scares me so I would always design to include a description
of the blob from TDX module to the guest driver :)

Jason
