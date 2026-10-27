Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129799;
	b=em/vwbeHxCohYam8ad6KLWLVQlbg3BS4K9W+knlfHprCPnynJ6IG6QvJQkvGspUwtWXG
	 2DV00Dp5ERIGKHVx0xaFsLXW/Y9WN3g2uv1Pr/3LpUOZP8H6EV+2z3kdoUIuseL2L1dDP
	 GL2DzofGkBC/gUskOymT2UkUEPw6Inm/caJBY4KPBOpKa7yMwIqmQzvIjGtxj1iSDQJgI
	 lC5+ee2gCxfX0CRILrrNk2IN01fUA5z70pJPODO9ONoNKV26UhJa3g5jl9kPenrIEkYiY
	 WXt2KmPVxnVSdR4GojutMJzgufRmkLPsF4wBf6gn4LBs1G9Hn6CchSS6Wo0bkV7hxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wsbrsmt/p01OP4rmJRzk8Y2oM9M62JnRW05OxgVh8zg=;
	b=NdK0jf+RObfRBXa4E19NroVI2/c4fzKPTLGUJFLXhT2QtpqFnIKmw9eq2duIPE/ITu8w
	 t12UZocLj33sHr1IdLNkNsPcJpimO5dKTwTqP5xXMk/J72M5Yb5ziRCjzUf+emvrVN8M/
	 +q1lSUaQdg3KfczTf7rzfI9PYjUrLbo7v1KNB0dSckOP4m26ivd1qsA1DynphiSbnYqlS
	 cIEeIaOKFdUaid//d+EFkw+D+2ONEqQ3RJvVJfeRbR0Z4SsHKhgjYybx9SGq9rj8B3RiP
	 4FjOJABbfBEYXAtqMuNaxyRwKLrfOIeDfXQactCjx7GGaVpo7zIoG+rjOA3E9puQ6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C02606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cbc3ab2fdso6810185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793129792; x=1793734592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wsbrsmt/p01OP4rmJRzk8Y2oM9M62JnRW05OxgVh8zg=;
        b=CctuFb+At8yRLMvEteDohm5fTYOu7XI/YnvyI26BqasYsewnJ197vg8vC4/LzMRA10
         9tQrYkCIDE9cjrYI0q62nqxDMxKBkvk/twsBqcuNoGc5bKSQGKmxJdmcFnaKGFm2YN93
         FrN2vyKNG6Zy0TCORLsgo5633764j0kwO1fWlfuzB5tsHIZs8LhTjgaaNlD7at+C/bGr
         dFet+4kqC0y3XR5FxtW9a0cVt2rohm7O+syQHeC3gg+zTKxJ9ZYyiwmTghgPCjrDpdoC
         NGVk5MC8dyeiIfgmlX6AJbfdwKBn/fmqxTi5NNYT28LG8UgWT+mwTKOB50hEWYmi3vcG
         NhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793129792; x=1793734592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsbrsmt/p01OP4rmJRzk8Y2oM9M62JnRW05OxgVh8zg=;
        b=RJ/n3a734/lDQNOWbP/HcTwXj9BH2Vd+arQv6jDeFq6x/0m5ah9pbUFfocpyqulOGk
         ixKwY3PxXRW+VemIX2Xv031ipWtDV62pK8fAFQ7TFkF4nrAoZcFSyK4q9h22JgJmjMlq
         C6ZD2IfGZzauwXmN7yB/7ubm47Gv893DtPBtN5U+26jmob5vNvBGwwaMbrGUqx7ujOwz
         jcvMzsuDTtHIuCaPY7RHCSr3ei9Vk8zkDyCOx9BH3d6O+s/1Drhh+Arc4vhTosKUvmGd
         ZjEbP2KXGIzQOuKbgBM2ah9bvR3nsMDs6gxUtesx/agY/K2HRadHR8tDVA9RRTU5NTkB
         UUZw==
X-Forwarded-Encrypted: i=1; AKwUvByl7bu7/qw+xx3DhApLP0W3jkE3sTlC+hShvaL0UHSwRkfJIjRrzNeOgpXcE0HZ0eoXqZ5hN1X14e2UQWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGBoIGso/HT5NeazanZZQUHcSVNUJjzqnSBlJiBcu0JdxEG6gB
	sTyrvY+YUWiOAGr7BArUu7c27S3Ow2M8Dy3aqGyko0LMsLERx+gZIKWJt4uoNKFptco=
X-Gm-Gg: AYBFou21xCvDCP5lqN/8FLEr524LFfyJcTk/jTfGSsTq6hDMWf4iQLmTC8Kr+jSJUjH
	z1UitJ98YazmN88Jo+rOAoHaE/lkzSv2cR0/rM3NMk4NdsS3rIo+ISPLH9a4JfbiE0EJZhp9RWR
	+QnhABTljv7C/0w8MPFJPcpA68vS/sh0KEnXvpm3ZrkuslmQfI+5hxNVAxisG9BUhldoVicbCvW
	E7KHodaJCZDpriE9UiXlMON1ZPOIZcPcRLJJu12ssJIZ/R5Xp+hbBGt+6t5I3t5LuSmR8UC40cY
	W6EwpccwT0nVMZU883acIbBzHiSO0+xzXa71e4gcJIdQRIC1kWW6b3ns9GdJ7qG8N+ByHdmrVnI
	/iPPTHHTX9sYeRTbSXXxk7m/Sl+wTvJY3Ml1l2lJbuB12ivONCll3tfHTDanqaZTAwnKc4n0Gyu
	SxgV924MBSR/ZTw6xZpQ/+7TXwuFTEQVzSP4bJ6w3nWk/bO/RBQ72HvgQw3ZzJPpJeZEpPeJf+6
	t68PUGnpJbYL48ywFjuk4gmB/f2gQLLvB7nMekRAg2CGi3zIugY1AzA5T5tviUelSbtTTooKeu0
	1gxZEx0KLz+GNIt2Bu8MnBrtRIje0VMipNmr3w==
X-Received: by 2002:a05:620a:4728:b0:93f:2236:a61 with SMTP id af79cd13be357-940ef996db1mr1690589085a.61.1793129792026;
        Tue, 27 Oct 2026 12:36:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067e97csm1064928585a.21.2026.10.27.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:36:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLmyD-0000000AobX-1vC7;
	Tue, 27 Oct 2026 16:36:29 -0300
Date: Tue, 27 Oct 2026 16:36:29 -0300
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
Message-ID: <20261027193629.GK1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
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
In-Reply-To: <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>

On Tue, Oct 27, 2026 at 11:43:04AM -0700, Dave Jiang wrote:

> I built a proof of concept on your wip_attestation_all_1 branch with help of LLM
> for TDX Connect device attestation to see how it holds up, and wanted to share
> what I found.

Nice!

> What I built:
> 
> - A ctlv-attestation-spdm family. As you proposed, the sysfs lock creates the
>   assigned-TDI attestation instance; in my version unlock removes it.
>   EVIDENCE_GET, EVIDENCE_ACCEPT, DEVSEC_STATE_GET and DEVSEC_RUN all go through
>   your ops.

> - A provider (a 'struct attestation_provider') that sits on top of PCI/TSM, so
>   any backend can use it. It serves the evidence PCI/TSM already publishes, and
>   asks the backend for a refresh when EVIDENCE_GET carries a challenge.
> 
> I ran it in QEMU with the devsec sample TSM, and in a TDX Connect guest on real
> hardware with a real device. Both worked: lock, EVIDENCE_GET, DEVSEC_RUN
> refusing a device without a verdict, RUN, and unlock. My tree has out of tree
> code for TDX Connect to get things working.
> 
> The model works well for device attestation. A few things came up that I think
> worth a look.
> 
> 1. EVIDENCE_ACCEPT and DEVSEC_RUN take any evidence generation since the last
>    device change (attestation_evidence_validate()). Ranges would narrow that,
>    but they need measurement registers (attestation_ranges_required()), and a
>    device has none. So a verdict survives a refresh. In QEMU with the devsec
>    sample:
> 
>      EVIDENCE_GET, empty challenge   -> evidence generation 1
>      EVIDENCE_GET, challenge c1      -> generation 2, measurements changed
>      EVIDENCE_ACCEPT generation 1    -> ok
>      EVIDENCE_GET, challenge c2      -> generation 3, measurements changed
>      DEVSEC_RUN generation 1         -> ok, device in RUN
> 
>    Any process that can issue EVIDENCE_GET can do this between the appraisal and
>    DEVSEC_RUN, and the device runs on evidence nobody looked at.

We don't care about freshness of measurements. What we care about is
that the device has remained continuously locked while we are doing
this.

Generation should not have anything to do with the # of evidence
collected, it should be tied to the lock event. We do a lock and we
get a generation number. That number remains fixed and could be passed
into run as a minor sanity check.

However the real security work is in the kernel driver which is
required to actively detect/prevent any host tampering with LOCKED.

RMM does this with a trio of sequences counters maintained by the
kernel driver: lock_seq, meas_seq, report_seq

If the host tampers with things then the sequences computed by the
driver will not match those computed by the RMM and it will fail.

So, I don't care if we lock the device and then collect three
evidences for some reason. It is not the APIs problem to make sure
they are all the same, or that the one used for attestation is
"freshest". 

While locked the device is not supposed to change its measurements,
allowing that turns locked into complete security nonsense. How do you
know when the measurements stop changing to actually measure it?

The only point here is to collect some evidence that represents the
start time of a continuous period of exclusive guest control.

Have I got this wrong somehow?

> 2. TDX Connect (maybe others) does not raise an event when a device drops out of
>    RUN. The provider only finds out when it asks, and on TDX even that answer
>    can lag. The guest reads the state the TDX Module last saw in a TDISP
>    response. A function level reset, for example, moves a locked TDI to ERROR,
>    but the guest keeps reading CONFIG_LOCKED until the TDX Module sees another
>    TDISP response, such as when the host asks the device for its state.

Yeah, I bet this is common.

>    Could the core add a version of attestation_state_changed() that a provider
>    can call while the op already holds the lock? Or let the provider flag the
>    change, and have the core send the notification once the op drops the lock?

Sounds right to me
 
> 3. Jason asked on 14/20 whether anyone needs a variable-length challenge. I
>    don't think devices need a range. A plain read sends an empty challenge, and
>    an SPDM GET_MEASUREMENTS nonce is "NL = 32 or 0". Your TDX provider always
>    takes 64 (attestation_tdx_evidence_caps).

>    A device needs exactly two lengths: 0 for a plain read and 32 for a refresh.
>    struct attestation_evidence_caps only holds a single min/max range. It's
>    checked on every request in attestation_evidence_request_decode(), and any
>    range that allows both 0 and 32 also allows everything in between.
> 
>    To work around that, my provider declares 0-64 and PCI/TSM rejects any length
>    other than the backend's nonce size, 32 for both backends I ran. Could the
>    caps give one exact challenge length instead of a range, plus a flag that
>    also allows an empty challenge? A device provider would set 32 with the flag,
>    and your TDX provider 64 without it.

I'd expect to be able to learn the exact nonce sice that the challenge
can support. It should probably be a list not a range, then you could
include 0 for SPDM..

And maybe other lens if we do crypto agility here or something.

The challenge is formed into the returned token so it is a kind of
ABI and we don't want things like transparent 0 pad or something, so
userspace does have to know..

> 4. EVIDENCE_GET rejects any buffer smaller than max_length
>    (attestation_evidence_decode_objects()), so userspace has to allocate for the
>    worst case. Aneesh's provider declares 16M per certificate chain, so every
>    read needs a 16M buffer. Could EVIDENCE_GET take a smaller buffer and return
>    the length it needs, or offer a way to ask for the size?

Makes sense, this is also where someday having the memfd as an option
might be nice since it could be dynamicaly sized by the kernel
 
> 5. evidence.challenge is a required attr of evidence-request, so a plain read
>    has to send an empty one ("hex:" in Aneesh's example). Could it be optional?

I'm a bit puzzled by this optional challenge concept, I haven't tried
to read SPDM spec yet, but it really has a way to omit the challenge
from the reply? It doesn't just replace it with 0 or something?
 
> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>    directly, which gives 3. In a real TDX guest it fails with
>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".

I would have naively guessed this should inherent from some SPDM family?

Jaon
