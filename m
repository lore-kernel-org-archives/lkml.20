Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667535;
	b=Q2ZcFUV/LD0v89kzBMCQH6IvLTDtyme5L6jYB5PPDk0ZtUj3Qap11Ttr6+7XsfGobPX2
	 Kpu4Kol9QRp7dLIO+Jv7hXWazrZaBV1aN4W6IR+Nwzazk4HDkIIIdumHX5o18yrMfoq57
	 HaxhZauTNwAcJRUqUgGrh4Tyc4NhftB0jICwIo58azkqVFm+EqBdMfqexLYLtnD7RrbDB
	 V1rHewfaKFLzF9qKpQzki22wtWjHJQJB54Pms+qhS218JVF2iJo5BI/xh/zrAqFxIk66U
	 3h7SiO1ohMWOPs+yVBrxVFn9urwhb6YdP+Ecj2LOfVEAHszqblQGMqIbGxBsDjSJ9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=QoYRJANCltXIHssksq3+ydkfr4I2KVxvqmMBU8nH1QA=;
	b=4hMh7yw6HNUMyFKHS/X+o40EfWb/T7HJdI48N+MEOv93kts/LEYh9PAVjTQrDSUhWkHu
	 a65akNib0HcZjD5ilXy9+YPw+ap0N5XFrr3jn3U/StbDnx8UAjQipLEk1cVpNlb2KopoD
	 sbZ6lTKtdc41veB2ST8Oioeq6xISKujE4mf+Ltx+0B1NhKcOW005abrZrdPh+QfZgxs2V
	 zV6Ya10pbIcj0QrvHIObxnMy4a1CJUFZInYWC+Eh7kaCQ0xOtidNkINfpe4s30Tk9PgKG
	 hfmnJc1zaxuvlo4yujH5Uq2e/CUYdEPHseYQeEbgxS7YpnLTtNlu2kupA3G2Mq29S/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H1zPRlIe;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED4F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED4F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H1zPRlIe
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53512cd2f85so49114081cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793667533; x=1794272333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoYRJANCltXIHssksq3+ydkfr4I2KVxvqmMBU8nH1QA=;
        b=H1zPRlIek7ds8M6NQOXwrD7lOc3bluGthhRv4XKpDgzkRsAQZQ9QpELH7lynxKitrC
         iAK3y/NLEfzWZg/zLhxLIfDoe3wG0Zi0g7uRxjIB5PHRUoAwVJYqdwPM5ma8QgTsDzzE
         A1YlDOQMCvdTjJvkcVq/n8F/g3cxTcOLvq0rFJUC7KCBYjJ3KGXhiwuXhH17l0Swl0ek
         aliTnEwJ2nESBRVL7qU/uR1nVs17I8sEP39YljjfAB04uP1vgKV3xHgqnt9dYYqWPGUi
         9LoVzZmGLFBycgB8TaF7d/PDBIFGxvyUNueK0pVkswaKoLaJV6OK4ikoFARC+YUNYP5F
         F/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667533; x=1794272333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QoYRJANCltXIHssksq3+ydkfr4I2KVxvqmMBU8nH1QA=;
        b=Ymmqk7lbE0JHbiQgso7iaDa6PiUVKar59ROuRSdNNFmk1tZ/fr5MxE8fH5lu62DCt1
         6/HYH3NOBXwf+rBau6ZAPZiPX0Mr0spBaGHpER9T2JFe9KROccHQW6F3oPXmTaJKujvU
         wM7iNRRYJETrLzSG17sGwXQp8uT8m+4tuJMza1ZjpWhZxgjCryS1fi6fOvSqnBgg6buo
         qkRqFIjiLAH6GRCx5s0eW2sEufH3PvHqnrDlUhWcrgqI1LemR40AHESBjrR3aHnEDvT4
         OpPEPZd8sw0rsOAFYCMcAa0vEfaUVlEFZR7GyTKn9cI1vTORqoIh+2hfKRuB1UIhLs/3
         Xzjg==
X-Forwarded-Encrypted: i=1; AKwUvBymVQh2Y6Jfi284CJ4hwoPRes109ac7kiXg2tNc2K8XiOx6kRYV99Q0adZWXh2xmYRaf7PwTp7rv5TF6ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgoc6ZquiylDj+OgWq6iFafr4VpPGitIz3WpL+bI6/0UPhhRFV
	/gwJjqlxuRRf4kUNX5wiMYLlcabepkTzoxjR70JfEV8nb1m/uB46pzqD6Bc1wYn9G+Q=
X-Gm-Gg: AYBFou0RXYwedQdmDi5vsl6rdb1lTDjTXjtqQlkL+nICdYeSStee+CT4W5c98Vi3O4M
	r/zRggxP/s+SllF4AWwf29Kfveo9iIedvuXuF87oXSTkbdaAf+HYFAPG1WMgwRuO8dC4u9ziINI
	WaeZbrhLZxokkAjy08uGAMbhjjNoj2P5Lg9PQdHv6jQPYv9ouxdnVHLK1iuKtrlfEmWzGVVvJn1
	Lknv7Dk7iSPMN270YIqfV5jdimWfkJbaDZQFHD+5ppoO+UsXZCxMOxtjhRL4Q/PiSUDitSfnSvn
	BGdOMN7qHkNmCwXJgvus/65qnMC9WEqXfFuwQYCUDR0bAf6JeHMc4H8RDiUVD0CsvSpCitnMgqg
	0VnrWmKwGgVusgl29DeVJq2B5ODlYmR69XZ2b7vDsS8q8anQuDWkoypeUdcuBxH0Nc75XGDqyQC
	zCoz7sjscT+QV81hAB6NQ91ZqfvBOr5EgRBP6HSQWohY+YEeTi5Li2pNgBYhLdHwSxsxLJB0yyR
	g7k9esxn1wDMcan0ofU3Mq+6kvK9YdsKCJ0Wss8f0zaW9XOJ7gICnIpbzGMxQl3ixJKO+bklDiF
	wRAknLfoiukalfZE44vslnw+2pRaXj0OGjkL8a3MbuWikF+qMGi2HIn+Bcc7TA8jx7yAyn1CekL
	esqd2p1/XmQ==
X-Received: by 2002:ac8:5f92:0:b0:533:a4a:8826 with SMTP id d75a77b69052e-542b6595288mr197108781cf.19.1793667533172;
        Mon, 02 Nov 2026 16:58:53 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498b49d8efsm12193441cf.7.2026.11.02.16.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:58:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xO2rT-0000000BHob-1A7Z;
	Mon, 02 Nov 2026 20:58:51 -0400
Date: Mon, 2 Nov 2026 20:58:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
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
	"Fang, Peter" <peter.fang@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261103005851.GH3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
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
In-Reply-To: <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>

On Mon, Nov 02, 2026 at 07:02:37PM +0000, Edgecombe, Rick P wrote:
> > Though I am planning/hoping to have a sane admin tool here as we agree
> > to things, so admin can do like:
> > 
> > $ attest report
> >    TDX Report:
> >      Xyz 
> >      Abc
> >    TPM Report:
> >      124
> >      435
> 
> Hmm. TPM report is a signed thing right? But "TDX report" is not. Or "TDX
> report" is really the TDX quote?

Yeah, the signed thing.

Sounds like in the TDX language it is TDX quote. ARM CCA calls their
signed thing report. systemd calls the entire aggregate bundle the
report. I think TPM called it quote. Isn't it nice everyone has their
own words?

Jiri, I suppose we should meditate on what word you use in the schema
to try to be clear.

> I still don't see the need to expose the TDX report (TDX definition
> of report) through a generic interface.

Great, let's not do that. Signed things only is what I was expecting,
because that is what systemd needs when it generates its aggregated
"report" to send to verification.

> Are you thinking about having any kind of community
> call for TSM? Maybe we could walk people through TDX attestation.

If we have to, but it is more inclusive if the mailing list has a
record of such things..

I was thinking of trying to organize some smallish summit type call of
a longer duration when this is more solidified and everyone has time
to digest it so we can go over *everything* and confirm people are
happy. This would be a 'come prepared' kind of call, instead of a
physical conference. Let's see

> > > On the TDX side we would have to work through how to ask for a
> > > specific type of quote. In the initial set we have planned, the host
> > > will decide.
> > 
> > That's fine. Broadly the "default" report format should be set by the
> > VM's instance type, eg defined by the CSP. It should not change
> > launch to launch of the same VM.
> 
> In the attestation space, it seems there are people who want many
> slightly different things. And it has been generating option
> complexity on top of the TDX legacy baggage.

Yeah, I am aware.. Above has been my view as the only logical position
for a CSP to take. If you change the format of the TDX quote from
launch to launch you risk ABI breakage with the customer's
verifier. You will have angry customers if one day their VMs boot and
they don't verify anymore.

> > If you also want to have a way to query specific types, like AMD's
> > guid thing, then that's fine too. But I think integrating into systemd
> > report might be a bit tricky so I'm not sure it is a great idea.
> > 
> > In all cases the format of the report is labled, passed to userspace
> > and given to the verifier. I see Intel already defined DICE format as
> > 'larger than 8k'.
> 
> I'll have to check (or maybe Peter can chime in) if there is some easy label to
> look at.
> 
> > We'd probably want to give that a dedicated label in
> > CTLV land.
> 
> Not following what you mean exactly. A CTLV format that contains the report? Or
> a user ABI way to request a certain format?

The CTVL output will always be something like {label, data blob}, for
everything so it is self described.

Since the DICE and non-DICE TDX quotes sound non-interoperable they
should have different labels.. I guess? I really don't know the
details of TDX enough to say.

> > One of the things I'm quite adament about on the data labeling is that
> > if something sees Blob type A then it should at least be able to
> > verify the signature. Further format variation should be self
> > describing data within the signed payload. If it is so different that
> > you can't verify the signature then you have to give it a different
> > label too.
> 
> I'll make sure this made it back to our attestation people. (probably someone
> already picked it up)

Yeah, I'm quite adament about this. I don't want this to turn into a
funnel for undefined binary blobs that nobody can understand. At a
minimum the signature has to parse, and at the maximum I'd love to
insist on a userspace implementation to dump the contents. We will
see.

This will naturally force people to use the right labels since they
won't be able to make a dumper if they don't.

Jason
