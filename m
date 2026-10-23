Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792837;
	b=xHYOtBOINkNpYkMeaw1GeZbCV4rJ5uZJL+SAR2HVdn2ohgxyjtYpTF+Ii1NumHHbs3Vj
	 YWxJFIife/yVwA+bZ8L4O3S9//tMz4iPR3HPUvDlvgseFnWe1KQVjWKR6eQh2y742ZI5w
	 V50Zc9z4oCpB4he5hd6KeNEd3w+je47P7EM3gGfOudUho51KyNVGojJltOA/rNX8ZznOu
	 9rwc2x1AgGaqlDCnsjnwv0NiIL8qPmK8D3VF64phfwVR7TOHWH7sJNguRwSL8HgAd0B5B
	 ePWiy5SFTq5ZCTbpxOJerJPTqKfG6HwEaCB1a47mRkfNP/AEJ7Rdlnz/ZVxrXuD5gyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cEebfXd9IhliqLZGZPa/idiUUw956gBCSaHIyOjWMY4=;
	b=yxcAg0CNzMsSKgl1aqKMoJDKM2TSQOCirLjYygPC0FMCgpk4g4W6+z5mChzhDICKdkEk
	 xFEr34glYYUh47s4eKbsdR1jSyuf2cY4uwTY+2uatLU//m56E5LC7xKqNn8ZnLcCqqIn1
	 ruOEM6pz9/RD7fExAscrNboynfLRqMwXXkAwvY/+DJjHqX3+0U/dlCgNDi1u7jOkZ9Tlj
	 DjFD8LuGYetfGwou2tfiqGayOHFc45n5d1lKKteLJXa8v076lQTFEFo+2+0UwG5oX98mS
	 lMdIFclttK8HCx+I67DGquPdzpO4g6VwKCfA5+G9PZsWAmpWJOj1cKoNM5/hAt6sZzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DebmaaEh;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E8606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DebmaaEh
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f3c89594cso88842885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792792836; x=1793397636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEebfXd9IhliqLZGZPa/idiUUw956gBCSaHIyOjWMY4=;
        b=DebmaaEhn8gc7B/+10I4BtWRX84GcUFfvN5cW1HZ+OwUnRbsGGZ8GdvHKnd2CwBFva
         C6DIyAs+cWbC99C6G+CqQksKdNGMW6Qo46dAlCd6aGq29InEfhijtxEzi+W0MxMzxVvt
         srO914H0mQbUQi6/avNhXkcjH23PSbRWbZeZn7/nmwZHGsJ5xjklruBxszF/zdJpW/UN
         44Xu5CqG/W7hA5QRInFCu1F31XmZq7TSOiFYu+KJ+se9R55UXjNPASWET8+0phlYqY16
         FvK5vhjQPKKH2X+I7M8Qq2FtycaHtWvixnKOuplnLOELi+SjpB1kLXmD2vtJ3Q9S5UBA
         LhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792836; x=1793397636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEebfXd9IhliqLZGZPa/idiUUw956gBCSaHIyOjWMY4=;
        b=JVuap5Z40PE2SGQJC2T3oU/H0oeJXh565QzRZyuoVHHR+VJoejZrfHZAy7KAcJafIK
         m4v/jenlQSN1B4nObBqrx4DZPV2h0Z82YQeUqGtMfCQcpHAGE6FJSP/4XU0CrveRt3bG
         Qk0+40gf0ODsAzKvTlsG4z/3Gotm9psoMrRo1lepknGqLfKUpAvsVqW3yZd1zwqhWyZD
         D36GgyOkq9nAhTGPmTYTs5rjzeMQtkfOBcG8tLPK6wBBdxR2xMo1lJ8bwwmgDoaBwdA8
         BsTLsIxBBQUcRhh59uBYEQ68gezwOEhlsLGOBVS2DiuxPimxyGuFt9n5GIQjVNmxsTCZ
         orqw==
X-Forwarded-Encrypted: i=1; AKwUvBxiPHHZqgQXaxcEf9wIN81oeCDnmex2rXoNO2PHgcdvgwqwTtknrc5+jUIJt0eKARiCCtBf52QNLk75+b8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjBIvYFqZ7n75PLG2YJXGmHhjlfy0pYi+6+dxNxwr6lhiAYVFh
	OPxlzehGGz0aW/oRCa1mvRKYrC8Amk5CWKG/MiMBeT/yfDz6XjD8tKEek4wf+JekjrM=
X-Gm-Gg: AYBFou2tvdOs50LVP0NtJYie6M9xbLaaoUtlTRkFirsGhQ+0ClGwLKiB3lo8wBhE3OH
	fnjiymTocpHuP1yHDW8aafRsZ/iLp/r5JzSMjTM9bR32+w7DgbJVSFNTu2EMbblJ7hgwE23TS4B
	9DYFkKXfGpIVf/Bwzh9DIBG9g5BkKZWhaRqmJ/vLO7kcRV3vnmR0foOhr7qIE4QGr+SWJO9BobB
	J8VWUKuUEe2DJ2hkiiJg4hr5EG+Pe27IShb1Hd8SqihhTrzszc7X7cwk0/N4REQ3yI5fpqXI0aa
	haA5R/WVwP1Qonb6DdWZTn0fw1s34Yg2a1wy3ARNdI5U3T5OXQ7I3WyYU1JPC9mCRfIywUPImUM
	Es8XG0NuRy0ng2xf8fSmVRZv4OS/Ov5VySH0VZpUgYMGk2SFc4krR09+i1dnm6Ta4BMhrO0mTGk
	/KO9bRK/K69OeowR1aYHwaiefMws6HhjrbGb6w6Dv5d64UOdzpPF3IOt+Ed5Thx3JPNSOFBibB0
	mIVBkwGeZwSIcSwAN38/jw7TRw0+3JNcPUvKNg1M9nuFmlDzxqbnI7/QqumraH4021u+2yCm1bt
	ezLWi7++9RM90AXg1G7kva2nBrKBTUGsTHoS24/+xCteqVxs2Ia5/UdqrtkB
X-Received: by 2002:a05:620a:27d6:b0:93f:57a3:71ab with SMTP id af79cd13be357-940ef93d248mr49492685a.32.1792792832337;
        Fri, 23 Oct 2026 15:00:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a78c06sm17716585a.35.2026.10.23.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:00:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKNJO-0000000H7Rz-2dan;
	Fri, 23 Oct 2026 19:00:30 -0300
Date: Fri, 23 Oct 2026 19:00:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Fang, Peter" <peter.fang@intel.com>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"sameo@meta.com" <sameo@meta.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"kas@kernel.org" <kas@kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>, "aik@amd.com" <aik@amd.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261023220030.GM3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
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
In-Reply-To: <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>

On Fri, Oct 23, 2026 at 07:40:58PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2026-10-23 at 11:12 -0300, Jason Gunthorpe wrote:
> > I think in the way this stuff ended up being used the userspace isn't
> > actually aware. It just wants the VM's ROT to sign a challenge and
> > forward the resulting blobs to a remote verifier. The verifier needs
> > to be aware of the format, but the collection agent should not need
> > special knowledge.
> 
> So the verifier is a standardized endpoint of some kind...? That makes sense
> then. But I think we don't need the report in here then. Just the quote. More
> below...

There is a direction that the collection agent would be standardized,
systemd-report already exists now, and so the verifier would accept
the data blob defined by systemd-report and process it. I think how
the systemd-report output is convayed to the verifier is somewhat more
open.

> > ie from the perspective of systemd-report it doesn't make alot of
> > sense to have it know every single special configfs path and protocol
> > for each CC vendor just to get a 'sign my challenge' operation.
> > 
> > That's the general north star here. We'd like all the vendors to be
> > able to do collection without having to change systemd for every new
> > innovation. Again I'm looking at 5-10 ROTs in our platforms, it is not
> > desirable to go and teach systemd about each of them.
> > 
> > So broadly, this requires a challenge to go in, a signed blob to come
> > out, possibly some suppelmentary blob[s] (like certificates), and then
> > labels for what is inside each.
> > 
> > Userspace would collect all the blobs and the labels then ship them to
> > the verifier which has to understand how the data described by the
> > label is organized.
> > 
> > I don't know what "nonce transport blob" means in the future, nonce
> > without signature sounds like a strange thing.
> 
> Yea, it's strange.
> 
> The initial TDX attestation navigated some platform limitations. It involved an
> SGX enclave on the host. The enclave was the thing that did the signing, but it
> did not have any of the TD details. Only the TDX module did.
> 
> So the process to get a quote starts with getting a nonce from the remote
> attester. Then the TDX module took the nonce and formed it into a MACed "report"
> that included all the TD details it knows about. Then this report is shuffled
> out to host userspace, which gives it to the enclave. The enclave just checks it
> and does the signing. Then the resulting quote makes its way back to the guest.
> 
> In the new attestation, the signing happens through the TDX module instead of in
> an SGX enclave. Since the module already has the TD details, it can just add
> them itself to the quote. So all it needs is the nonce. For legacy reasons the
> original TD report is being used for the nonce delivery to host userspace. New
> TD details are not going to be in the report.

Sounds like stuff the kernel should be hiding right? Userspace gives a
nonce and gets back a report, it doesn't care about these details?

If there is a v1 and v2 report because of this then fine, they can be
labeled that way.

> So I'm still not following why we would provide the TD report through the
> standardized interface. Maybe we don't want it?

My biggest motivator is to get the measurement register stuff brought
together so we can multiplex it intside the kernel. In that world I
think it is pretty important that the signature covering the
measurements be clearly affiliated with the measurement registers
themselves so there is some hope of userspace figuring it all out.

attestation subsystem will describe it as one coherent whole, you get
a single TDX /dev/XX that can do extend and generate a signed quote of
those registers together. With the same interface as every other ROT.

IMHO it makes no sense to pull in measurement register and leave
behind the quote in configfs.

I grant you there will not be a huge amount of value in moving the
quote over besides this consistency and ease of use for userspace.

Though I am planning/hoping to have a sane admin tool here as we agree
to things, so admin can do like:

$ attest report
   TDX Report:
     Xyz 
     Abc
   TPM Report:
     124
     435

> > So from a TDX perspective, what would you want to have as labeled
> > blobs for this kind of operation, now and later and maybe someday with
> > DICE?
> 
> On the TDX side we would have to work through how to ask for a
> specific type of quote. In the initial set we have planned, the host
> will decide.

That's fine. Broadly the "default" report format should be set by the
VM's instance type, eg defined by the CSP. It should not change
launch to launch of the same VM.

If you also want to have a way to query specific types, like AMD's
guid thing, then that's fine too. But I think integrating into systemd
report might be a bit tricky so I'm not sure it is a great idea.

In all cases the format of the report is labled, passed to userspace
and given to the verifier. I see Intel already defined DICE format as
'larger than 8k'. We'd probably want to give that a dedicated label in
CTLV land.

Thus, if you boot instance type V1 you always get the same
systemd-report format and a stable ABI there for your verifier. When
you upgrade to instance type V2, the report format ABI can change and
you have to have a V2 aware verifier to process it. Since everything
is nicely labeled the error reporting should be better 'verifier
failed because Intel DICE not support' is way better than 'signature
failure'.

One of the things I'm quite adament about on the data labeling is that
if something sees Blob type A then it should at least be able to
verify the signature. Further format variation should be self
describing data within the signed payload. If it is so different that
you can't verify the signature then you have to give it a different
label too.

> Do we think there could ever be a usage for the coco guest to
> process the quote itself? If the only use is shuffling a blob to the
> verifier then maybe we don't need this either.

Probably not, but if you wanted to, then same process applies the
verifier, you get the label and the blobs and you do the math.

None of thes concepts are really changing from configfs-tsm-report, it
is just wrapped into CTLV instead of the creative use of configfs with
hopefully a bit more robustness on the data labeling.

Jason
