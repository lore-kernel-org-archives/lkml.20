Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283391;
	b=kTTdE8xirjr8ub0B/pBteqPgxWl18Z+APprlIFkw4zS9osBC7kiLCn8lV6qlfrKs9baT
	 QXobckjG6up0o0Qj1hlP/0i8vwptOrOBPG7RdrTOzlabbQLBfOeisvJO4QWFQ/M5PcABb
	 a1cDEjylyr2JWjLcZ5stJiPqV4szFBHsbj57cm2mQIgD824kScUbNP2oRmr41hJgodrOG
	 99nUX/MnGZScW0t/SKQYyTa+wSlWRh+FJCYw96kLdN5NXXUSF92ISVBrrEoptIRz5vnLX
	 rao4Rkz34Kq9/MEghZxgZT9Vv41gcuX9YZUWbZjV79XGltu8KjEveuBVTKmievafnMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
	b=YhvSw7u36DjFnIzkzlCOjtJoxAqDsJcHme1xBsH3NrmrzJsyk8sfMIBSU4tR8vvaq9YE
	 AfHQspIj9537WxC23AUjD0ojmAI7uknNpuhecx8xc+5dqNVccz5ttG9zSg4U5NmCOR4sT
	 aToHfi0DwK10qhSzL/20etEqExZnSfqck09tD5OLJFzD3e+PWKNpKXhfYqurWQYyiu/ot
	 b1Fp85/HVXDCKxkFjTQN5q96jNZnC01iAywpljD2XFBb/ry5rs3VPwcssLIi7kyPW6KGY
	 3jf4iSUlbxZ+MqG7CyDw9B+SVya5Mu44Txg6AOqWWmVe0wV4UUkB9lOKJE+EgqmM33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3GWWvW6;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E0B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3GWWvW6
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-537548b811aso18853321cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793283390; x=1793888190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=K3GWWvW6rB7cRoFkVogJ2KSZo/0Y/1HCDIRdHzAIwLoLDsyMicRGMjOseGev/J/xTf
         7GktCCuPItsgUn+ypTk60UX0aWoLaz29rDEd+7ry0VKQZgmxJu4rxk9u/82PZO0lHBoj
         a0rS4Qcv1UTo0qCGsLn097FMzPIIosJ6Sq/dM+Cpe88Ee5HToav+cCJFoWYUIenfBqwj
         BfXtQt8E5/J+XaBz+AzHqXbj9Vz+xQWJJQPIA+hvJei/SyQf96CW2nSLK1ee/Y9r1bUI
         sgaZ8c4K2r7GTls+1UpYG7HJCNHiY8m5qhHnc/SvL5F1gGTyDMBNiM4S9pBh3H/k7bQZ
         gG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283390; x=1793888190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=VMKDm0gAASdiPtFNhHZAsxmUzIByXQIbBlkedMTx8T4vu0I6z5v/etbZX24Z5ZjkyM
         HeS/lMibOTAvvbhC003OVr1CGLDv+BoEjGi66I27JQxq/gOIcU9290KvV08eLnLmvvnE
         YtkKkS/yjzMHa/hSTkpkwZCu7A2GesyRjqiV6EFHYUlp225Y2zNgTJ04QkTzfClg5Y1r
         WCopZCgT8U3kkZdsLsNqNsg2LUGa3EyZUWenpQ3Nlb2cHse/Q+jl4GmHoH+6Nj7GjDIo
         wSGcfKPkVuugZ8jZJc4s+hw+++ZG7dSe7R37cupXB8/zNRHpbYF9PUKsYksjoFvO7zY2
         dzug==
X-Forwarded-Encrypted: i=1; AKwUvBzVoYgXcF0mpxv0u3UjxR73ycZcFZv9DtFey8KmhKm/1Vd0Ms3kCfuQHMMaAXM26WZQZdD9D1Ih9asvejY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtD6cNkiNyf7uTH1hqhd8wJrcK22I7BmyVyeUe4HQ+e5A/1pNb
	6m8jYZLpof67f7Cr9sB1GX5tbCnqWaiKBJkI9+TQ8QSWi1GY6ttCm/wx5VOxhQPMHaA=
X-Gm-Gg: AYBFou2I0/JKXNI30cPObxt7reSKeWmaDEaf4xscTdDeP+0MMiZNGZujD6GPyBRjOq/
	w2BxI9gp/AVQdgDI7lmpKFahdkfTxr0MPArggDEcK8Ax3Mlcc4RodIhJIBlY1We2oY1IuTXhhLW
	M5jpvzRLVVTL2PnSLHXeFAzEjWA4N0YaKvbPuok3kSM5JDC9Z7203YP4cpk+2NkH5LPw4dFjqc2
	1CjTW8CuSZjbxvR6dWB01FzPsSGcyZFQSs7BO+vIzriHeoiVkyn1jbdDnMhgrzMX13NTcNtLztM
	fo4F+xN5tspTr3Rp9LjkkcAbqsRPnB8dmzplxjus763fLNSGaRAbQ51byLXggdLiahmm0pDEtuJ
	GS2Mg5Yn/ZK3zxpROBAROPaDCjn1KMiuFb6VhGqASiot9vOdZMtXO0WhSZirI0+7uBv1XW6MhAz
	HxnwhUdkWqE0LIjaOtfVju22U9DemVnmnJukbLr5BrTY8otRJ+Ur+AMxytsKhwA1ss3TNrsfOx8
	niYfnP2/l/P2ZXgjeSoaZERe4lg+88QblvX+zpN+TkBo4nn1yCYqwx0NgsSbhlTSeapa+BrPY70
	LE3M1BZ+sy+wGHoLT3o+oXOxoRAAOy8/vAMAW5hPHFqykm3cBE0vvh/OpxYWpL31+gFMqXfWZpH
	FaG6Mqy9K6YE=
X-Received: by 2002:a05:622a:5c14:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-53fcb20dda0mr85167991cf.20.1793283389957;
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c7f6ef1b7sm45505406d6.7.2026.10.29.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMQvb-0000000FihF-2QML;
	Thu, 29 Oct 2026 11:16:27 -0300
Date: Thu, 29 Oct 2026 11:16:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nikolay Borisov <nik.borisov@suse.com>
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
Message-ID: <20261029141627.GP1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>
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
In-Reply-To: <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>

On Thu, Oct 29, 2026 at 09:37:20AM +0200, Nikolay Borisov wrote:
> 
> 
> On 15.10.26 г. 17:50 ч., Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> > 
> > Linux has several attestation interfaces tied to individual technologies.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> > 
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent.
> 
> Wasn't config-tsm supposed to be this common attestation subsystem? Was this
> discussed when the initial config-tsm was proposed? Why is this coming now?

Maybe but it was far too narrowly scoped to do that. config-tsm
doesn't even include MRs, they were awkwardly pushed off into another
different spot. It just doesn't seem to meet the need, and it can't
sanely fit SPDM.

> > Attestation devices use CTLV, a schema-driven character-device TLV UAPI.
> > Compared with sysfs or configfs, CTLV executes one validated request
> > atomically instead of assembling a transaction through several files.
> > Compared with netlink, an opened device fd directly identifies authority
> > and lifetime, can be delegated normally, and owns its event queue. CTLV
> > also provides:
> 
> Assuming we want to go through the route of CTLV, do we really want an
> attestation-specific  interface, or most of this functionality can
> simply be

CTLV is not attestation specific..

> implemented as a specific genetlink protocol, utilising all the existing
> hardening that has gone into netlink's infrastructure to marshal messages
> from userspace to kernel space?

Been there, seems like a hard no:

https://lore.kernel.org/all/20260721182046.16219426@kernel.org/

And then later this:

https://lore.kernel.org/all/20260921131911.532d81f4@kernel.org/

Plus netlink being based around sockets and net namespaces is a very
poor fit for something that has nothing to do with net namespaces and
really wants a DAC security model.

> >   83 files changed, 18084 insertions(+), 28 deletions(-)
> 
> That's an awful lot of code to just move certain binary blobs around
> (Judging by what config-tsm is doing ATM).

Yeah, netlink is alot of code.

ctlv is trying to solve a bigger more general problem than just
config-tsm.

Attestation is simply the first user as it has some complicated data
structure that suits it well.

Jason
