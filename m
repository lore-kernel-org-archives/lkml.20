Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144832;
	b=qVSNYPTyD7jUa9GKhZbFzWtBy0n/LUX78hwHyV5RCt6WfDNzadDLh3JfJjOCRT9e0MbA
	 QPd8YBPTH5XVVxsXgYDyLJwhqT5WNIK19e3GC4KeDxsrEFi6icPXD7AaY6gSoOXMua1k9
	 IAjJvXqVXG6HtMRodg7n/ZwjUqSOXp31dStIvfJQY1HaIuWSRmuZ0DZGTTFXDZ0eFtTJZ
	 3TQ6h5tq5dN7LYZTkEZTB63dxkKb6MX+2/PnjHteOzog/AOBQMgiz4tazuvirJ+oOekfd
	 436wQWoAQCaKegRaqMvkUWJyJa3IeBIHm+pB5ehdvpzQ2O7fq9mmKLtu0MvY6U+Xakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
	b=j4jEzh22q5831OJXBLX3Z+k40oeCyw/Ggo2sWf4Pqka0o/Zcp8L/ClRgOyTCvnnEdrSx
	 PbXpC9afTtaDMQljTw24rfyuHMP+/yIRpWbEXBon3PV2l50ACB8F+Oc+hbgJB1iz6w2Vo
	 8Cw3ODZhn9XmzTZ9YLjDNExXZP4WkOKINNhvMybsOYuLtWrJckt6uQjtifKWKrGTsvEMS
	 f7JJHFAtYdw/NuFbq2R8wC/+y8fLT5zVxPHKdaa4jYWO2hVaoH6H31sbqkubIEZfWJyps
	 wNlv5o8LaKJgGvfQ6n99bxCY+TvX4YdRNctr9534dVfmVhD2zuZXIC97p/MCfHM2zog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AA0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53c4b82919fso7135991cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793144821; x=1793749621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=MAMauGjcQC5I4fdPuZtoQnkUL42Ja4RAOKAONT1AHTrTUlXxWwqX6qYADXfsEAR3/j
         hUis6BLTdqxH9lpDGbebIZ+F0qhK+3Gw5A5H3+z2NBgRxi4MH2CtjOQEt/4ZNf155hzB
         oTs4TdzanpcZpR/2BlKJXYZ5ayq9dCJ9KnWTYXDxPIGzp3UbV1x+jJ+RSlif0GRL/dJH
         j0OePIYXBil1ld6ZPKFMsFzi6F38i35BXCm6Zqet5zyQslJePMeaHITZMn+3CDTRQJk4
         QD6tYVzQJvCV1jaXUHg5KQO0GvIXtoG0gYWydzGqJE616loH3WeEVB2M4YGyBB7u1Jus
         n4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144821; x=1793749621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=2La4Run/vLRtDP62LMWv5eA/PaqoiGyP3/hMMh2y2daIzKWJv9XdrK/Q9XD6yn07Wz
         UkNG0QiQGmk25t8aWo0fVwhfJA6r8NNshSoxmxh7odQ4PZwIdZNTNr6g7y7ySDASm46e
         WCwupb+/r4/QApFwZsK7W/ZmoGeaJKIFAaqTAMpwjQDl/oTWUhbo6SReuwMweY6o4Dmc
         Ms6CTraUDaEQ/q4zColiMlsoSkjbx7rz61DqkgOG3AOiKWIOyzzUEaL9Jd6UjPAmb3wh
         tlRvg6yhNkalwKGD55e6cJlN0jBqnQM+ph0TpJgJXGoAo8X1ct43C8cR9LpYw319q7D+
         +ZTQ==
X-Forwarded-Encrypted: i=1; AKwUvByaZtJDP5bg86hMkLVvtD1rGpab6l7UHqXYtywwLKOlqRbmfalxOBr6eE8nrlRDvcPTKbYVxqOGCpawvNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt1t+KGTh7wXMwsdwovCowVQB/7nmIQ37ufVcm98LX5jCscHpu
	oobGNP3l4sgyZudTPIa53iKZEhcXGI0EJzFVVa/kIzNFb/kO6iLB4Lic49UZ3xTyGC0=
X-Gm-Gg: AYBFou3ImQHiISfOEncWRtm0ivVDX01bjrimxni6sgaGRaDk6HCbr16vaszPRgVdJvL
	2c2N6eFiJ0Kc3Mt8zJNnm18O3O7syuY+YEgseVoX9pNOi+Zd4/yvakH208lEBS+afGV4+sulf1e
	LxMMggXxVs9AM7hglJdpGRF/qz4mC7N+HeQZ+iSsPDpyh1nGmPK78zI1zLb8CjKrLXs1SP33nsg
	ofYiwvJQUDUcoZtAl/TX560G6dkG9sZOtvvEHkvV7kemYymi16T3DgTZxFUoCqfn5R6gI3p4QcJ
	Wttg7NkF5WX7rAhiufMhUfxYpr0B9sA09xQaV+ObfNjCHpir0Pnr8YVccpB051C2k4P2Sn1KbiS
	/TsjSiWsAWzL1S1s+4vddyYLeIrc69Uk2dhYa7kD1kAG5hao9riTTIPidGglShQLKrGC7KZ/vLf
	VSD5bdB3QRShhu3mM6pGBX2WGqN7xPhSctS9ioZ+C7xHnIJU7Wy0Oh2J7Ysd5mCYnm2C1CBN7fn
	tj9hvwaXLL+epXUUALcRmR/xcrOpwAsSoynnJfdt/X4QchHbGIJQPn0pv5V86Bu7+nylagPOi5J
	+9gCCR9Wn+oubOn/QfQ0QXKlQjTy/LEV3q+W224yES5Vb4PUxGqh7giT25LllmUd1dFHr/+03FQ
	+Z69DTeIlcEg=
X-Received: by 2002:a05:622a:342:b0:532:8ed7:534 with SMTP id d75a77b69052e-53fcb7f9e76mr15856551cf.37.1793144820933;
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a69129sm114200426d6.4.2026.10.27.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLqsc-0000000BHke-3ly0;
	Tue, 27 Oct 2026 20:46:58 -0300
Date: Tue, 27 Oct 2026 20:46:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261027234658.GL1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:

> There are two issues for TDX Connect. One, the device info is collected at
> SPDM connect (TDH.SPDM.CONNECT), not at lock. TDH.TDI.BIND only returns the
> interface report. So the measurements a TD sees at lock can be from well
> before the lock. To get measurements taken after the bind, the TD has to
> ask the VMM for a recollection with its own nonce.

IMHO measurements taken before lock must never be made visible through
this interface, it defeats the security property of evidence within
the locked session. I would expect the guest kernel TDX driver to
prevent this.
 
> Second, a device may take a runtime firmware update of equal or higher SVN
> while its TDIs stay locked, unless the lock sets NO_FW_UPDATE. The
> TD isn't

Sure, any of the live update things are not really relevant, the
evidence can change asynchronously and without notification, so we can
just ignore the issue. If the guest opts into live update then it can
only rely on things like min svn.

> > I'm a bit puzzled by this optional challenge concept, I haven't tried
> > to read SPDM spec yet, but it really has a way to omit the challenge
> > from the reply? It doesn't just replace it with 0 or something?
> 
> SPDM puts the requester's nonce in the GET_MEASUREMENTS request, and only when
> the request asks for a signature. The MEASUREMENTS response always carries the
> responder's own nonce, and the signature covers the request too. An unsigned
> request has no nonce and gets an unsigned response.

Returning an unsigned collection seems like an interesting use case,
but why would you want to do that in the first place?

> The empty challenge in my provider means something else though: don't
> recollect, return the evidence collected earlier. So it's less "omit the
> nonce" and more "no new collection". Maybe that's better as an explicit flag
> than an empty challenge?

I'm not sure 'no new collection' is an especially useful thing. Since
the kernel won't be validating the signature you still need to pass
the expected nonce from the prior collection back to userspace so it
can check it.

Is there some specific use case for this?

> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
> >>    directly, which gives 3. In a real TDX guest it fails with
> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
> > 
> > I would have naively guessed this should inherent from some SPDM family?
> 
> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
> directly, so I think the test's 4 is what's stale. Jiri would know for sure.

I think TDX report/quote/rtmrs should be a different familiy from TDX device
assignment SPDM. They are completely different things.

Jason
