Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687384;
	b=ypsg8cr+PwdOfUPcLokkTeSvKZn3wUtAoFCDQuZEJbf1D+VD/yjFqHGwW96YjXiVuaFz
	 upRSeDaP/ftYwzMPOq6hjtJaQ6hj2QPUQvb5GwJwl2GOVkYUZKP69P+Oc5Zp91qdr80Gw
	 EjGjd/kpd/AnKYNtfuo4lzr8NiMBavS5U9fC0cU0YNp/Goj8a044Knl1M6QZ6R1Ucb7zt
	 fxSMXtwu0rWwjJp9lkW4sRTeVGI8ykUfAjdiC2TrWOVwTycDqK9Yjzo/aETbOJhH9nma5
	 m+MpzT3yFOUKw1bCurBtrHj+5l94BdqCkSzhv6z1lmrD8I6o/e7zLoMWx4FzmAwOg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
	b=E/TwYznG9gGwYOcSgt7q4wHN5dOO8+Ngs30AXxYd1OPILrVtpa1+ZLQnwfRmaQ8dn5Gd
	 BhAWMVbrYRic2i/K5fUGKHW3mwd4Z0fcCFaK73WNQbu1nBCton9UCtGreuELMwIeDc7gf
	 exyQtQBYc4h8Mtp1xGiK6zX8AoMXSTaxz63YlHyGB2lKKbgCcjPAse5372leYOUL5UGyw
	 UhhKnH3wHmjTUo+WOpMSvJ9KCXGjY8ePLUKZ0Oi4gcRdu77NdqT9vEfBvVNO6C0s0sPG/
	 4JhA0vuOgzqDx2ofzPGU36bTfiXczSUwQHXzXjvuA/VYCQ/lPZIqA0k4gAmfUDoGfWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA85606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917bab38b14so697646d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792687378; x=1793292178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=XHbnFoHbaZMsVLw6MWmIqP2d7qgOxfCHBEepcjJ8Id9E0Eb+q5QzJCpkTQIX9gPT+R
         86fXPk5bXM8iK9x0dOBj1/E2JEn3tDHeoJ6AMdVbgJ1k1N3E3ICq/Q2MPhf+rIAxcnIF
         4+YWBGgJRMzlwe44a5LXp5z+24tXHKxJBq9xrY2xG4eX+Fk5gs/erZ8cIQv0oixJAix3
         455u4iWnpKjwepSQH8FuUSOS67fCspG4I/LkwbzlBZQUxBu3+wbUk5fmbVx/4k9mofae
         MlLjnMWqo8lm6PHNvrktYdzNb19ERFmaMkW8ZJFpc/nZn6Cvx+irDmyLf02/GTWvFBrZ
         RPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687378; x=1793292178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=y71YsapFj0RcKPt+nNb1jYylJSQRM82hIC/1D6fdcqqXmRcR+mz/B9ByMRW1bQ1ozq
         WixurN6iCeoXrRPoyTprDgeS9D8Bhiz0lGwRqBXvxMgS5d5F36GM/esir27xonpO3lA6
         ZdmajJ/ogWwQ+tELZ0zgWs82/1XU1li5AH9hwFqi7iWVUYi7Y9F1xo5xgtON6o6WK06S
         0DmCaqDto2UKQ6ip9FofbO4NoPLcVtdLIqEuZxox0W6GEyQEdo1kvD4KiqMiI3RPcBQ+
         tjDlOqEsJPgCHccqOYAzqyoOwXe82NDZYAF1qFci9kEC2LAishwq6mKtJfu0CPVsKQgF
         VpBA==
X-Forwarded-Encrypted: i=1; AKwUvBwPJhPgt0SWTeMIMpucH3o0kCybxV1jkqtQgckNNRw6QNthUkuJKL8vDoIaKJl57qqDStdWWI4U/5pITvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmFmb5J4s75XhfMH+aPyxSUfc5G5f2Xdzw12E+Oa1iT1AMKyPW
	V+ks9kpSY6gCjJybo9d0YJBUgSJWU7eoZO0zxnmVdWvNVRAbDOCdJyA3d+N3Gdg0AwI=
X-Gm-Gg: AYBFou1CoW3OclSUs2D/jFV/smQh9FjrCoBg7h5B87oYdYmHlN1D3MbNUscy5z0ku2+
	z9zILUMKvxTfOL6TrjMC0lpnGQbnfxCgOdxdwGFWrPg8DDefGNUn9zZhUqltC7s3UoE6qQeM+o5
	QJOqjfyW6VZD5s5iOd7c9lA/CbmvyFagYGJcbnic/Rbc0H0sXkXDftck94wQSA6IscGjNwjw6mT
	xBA0VcQQ1TZqnQgnfXbKVk4gGAYuPFeicUQXmqhjKs14aET7kv6nkTncIRE7dTe2miVTJHrYtEC
	yNcIBUZMfcid8QMnR4tkwXneiOQkJ+JlDbGpv3txJ8ivOlHGQevxTqYK66ECSzp3c4rqgcCn5r4
	x9y/YIe2jGanT06ZU4TrV4G6IFA9DSPNnKzUcwGwVhOgtjkGTyHzn25qPYCi3Kufr2iN1ktU9fJ
	XpkhseeUM6F3QawfNVOWAbSF1FMKDcgKPfiRKr6RDZ5rp22nGW3xq/lNJPh4xGPnmyQghiV4KOd
	MxuCe96SD0qXCD1MwItaPLAQ/nZdtfG3Ofwji1QUb+cfdi2/EoTG5WRSVTx1Pywu0q7/u1TpvcW
	AkLWQtklUAXfOy0iQEfes4+7b3nq/1HCWlGGsw==
X-Received: by 2002:a05:6214:6017:b0:91c:3632:fdc3 with SMTP id 6a1803df08f44-91c3632fe59mr9119646d6.3.1792687377918;
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm1460126d6.24.2026.10.22.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJvsW-0000000FUPr-2EHZ;
	Thu, 22 Oct 2026 13:42:56 -0300
Date: Thu, 22 Oct 2026 13:42:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261022164256.GB3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
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
In-Reply-To: <atooh7uO2RauUTfY@FV6GYCPJ69>

On Thu, Oct 22, 2026 at 05:38:22PM +0200, Jiri Pirko wrote:
> >I am using this to understand what the IDE setup flow would look like,
> >but it is unclear whether the connect flow belongs in an attestation
> >framework. I understand the desire to pass the certificate slot number
> >as part of connect, and sysfs is probably not a suitable interface for
> >that. However, is CTLV the interface we want to use for connect?
> 
> I was thinking about this and "connect" really does not belong in the
> attestation CTLV (same applies to "lock"). I was thinking about some
> parallel PCITSM CTLV instance, but that does not really click as well.
> 
> Currently I'm thinking we can maintain existing "connect" in sysfs and
> extend it with "lock" sysfs knob for Realm side. Both would create
> ctlv-attestation-spdm instance. The same spdm instance may be created
> for other non-PCI-backed device.
> 
> The proposed host flow is:
> 
>     sysfs connect: select tsmN and prepare the connection
>         -> negotiate SPDM and discover certificates
>         -> register ctlv-attestation-spdm instance in DISCOVERED state
>
>     SPDM_GET
>         -> populated certificate slots and digests
> 
>     EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
>         -> retrieve candidate certificate chain for appraisal
> 
>     SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
>         -> authenticate the selected chain
>         -> complete backend-required session and IDE setup
> 
>     sysfs disconnect
>         -> remove the attestation instance
>         -> destroy the native connection

This made sense to me, I haven't reached all the details of SPDM, but
this is like what we discussed at LPC.

I don't know how much SPDM stuff is done at 'sysfs connect' time vs
how much is done at the first request. None of that leaks to UAPI so
it doesn't matter.

This changes things so IDE does not setup until SPDM_AUTHENTICATE,
which seems reasonable to me given all the constraints.

> The slot is therefore selected after discovery, rather than supplied to
> connect. The attestation instance represents the prepared connection; it
> does not exist beforehand as a controller for a disconnected PCI function.
> 
> This requires a staged native backend. It is not how existing automatic
> sysfs connect behaves today, and those backends would retain their
> existing behavior.

I don't know what we do with the half completed sev stuff. I would
prefer everything align to the same flow, obviously.

> ># ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 connect pci.generation=0 pci.tsm-id=0

It is pretty cool you could just make some edits to the schema and
then use them through this general tool, kinda like sysfs, but not
like sysfs.

Jason
