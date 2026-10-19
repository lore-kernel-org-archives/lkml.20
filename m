Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF984E4C47
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411693; cv=none; b=dP4OhOswYU24HSA5KqmkfTD5c1YyAuBsrrObWGvaM3ToO5juKiPJzKKFfFAk+r541ojt/hByTQC8nYrg01MMfmmmOtlNauLXNsoT3AXHfjdgUx1PtGPb5iVvE5BHCXGbJH6KP+0AI3dklflwR8v56sPIC/cl500f/8gYwiJS8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411693; c=relaxed/simple;
	bh=lrlyL6vmEK4W0Oo36GTGq9ry1moJ2FBuftbR3bKAPV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTkiSiXY9lA4WxPR8hsdl0W4cCeq6Uk2H0Y0yBi5at4ZNW4q6VtDBbBsCIGj9XYlMucuXY6+Pjpmvzw3i/PPxAGYn6uI3AEOlnU9f61Pj3VvUKjSHH6woPE7qVaoO/OeRYTYMoir1ACUOMex38vWStCpGplDy6XfBXZr88y4ck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=kopJjVl5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="kopJjVl5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0728so510628f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792411688; x=1793016488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrlyL6vmEK4W0Oo36GTGq9ry1moJ2FBuftbR3bKAPV8=;
        b=kopJjVl5aZly9Ykv/gYPMdYYgXVznPqrhGePz6BRclx6P1X3KQqhYjjAMPIYVQDrca
         +pkrHvLDePiQNpfAgsbkumkBNUS08Vk6zTQAtIdMBeTiLyOJr/lidOX2YacfLvRfpIr3
         LLKVXmiOjpw/LQcqsSg073S1zritUqgswJQDUXgO1faFL154oAbBpjNPpbQ9Yh09UPqL
         4lKUFhKyhXKw24UTvkvUPKVjDcUsxVM7RUbzWVaV96Wv0EeLFOM7wt30FgU858eOceGg
         Y8xSByuOyHgNcGhFBqjEnDYq9bfQZw/brR5bvcL31GVuhSkjsatX4DZxuhi7vVK+NJ8s
         dHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411688; x=1793016488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrlyL6vmEK4W0Oo36GTGq9ry1moJ2FBuftbR3bKAPV8=;
        b=wPiWD0pwPWkhrnMmdpDRQ8gpFBP55KU86oG30QPcGYk322GJIuruP8Q1MQkIs+2k5H
         JzwfuTX/aDz2fz8G3XyJXELJ/a3TOa+jijxutrd4uMEqzPVT++BRNVHtjI0cInTZX6s4
         X+tXHi5tQ+Vhq/shE/q7mh3zmSwmPfzi5aFAbgBW7jtH7UUhggXvZ9LZ6hBR0uwUDSlU
         a2V07rt1V1CgEBBa1W93g0yhaQjP7JOWzGYZp4C/L5mNJmN3tQ0X93GxlLzbuBjl2uuW
         8UZC8uITzByzttA7vgg8LhRoZ8lm+XzajbtSPEwcoUQxlP24dRaXgIctz1zGrDbIuRGf
         TSJQ==
X-Forwarded-Encrypted: i=1; AKwUvBye3EYXFrFtBUbeRSukImh/Odz1s25bZRcTBBQgTZLeTP9U2r6tgurzOrjZeUMQPK5L8UZ0+t8dNOSmDUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiyF/d9558n7v6xMuF0ptfIp2s8NRU1FGMhsZwT5FmITNCz7Cf
	KXa5Cea0m9SncgHmEkL5LEobB3jt2idA5TrK/ePJG8CtF30B5pAFBZfD9z2RLnYDCak=
X-Gm-Gg: AYBFou1zFONVxLf0aVX7u8FQF7yQZegvy5CC/pJZmqLFhP5MO+DUbckxQdvVWbjDeLG
	HjPakiaTJcTNpTyk2CBrAowP1zhdnDvRPElkt6i642yW5fMl0kI6V+2ZTOuxuavCO0dWVF8vYz9
	g0hyOfUO3VDRp/5RPVcoM3+N0APij0vsk2nok6k/+f93exrmMDOGfyFyjsSEO6M1VTy/Q3QMghw
	XJyjOSlJDOvXEoBm3vQ5JRx1/HmJhFhvQ+z5NkY/cJpCGKfa0Y6cX+xvF/I4jifsD63JMNTPtG/
	AVkx8MXymbFPUHNt/hfs38eVxVepWh03lIMDpSz0wFYikqU+rpDnfM1PuaSuNbM/HPAsqlmSXGf
	AxSuq8EORudkXNUWhCwPYew1hXMOAs99Jqp+9He245BXFUoLcvhJXmZxvOklB3jHZoWW74HQgB1
	9UHo4GF3jTcr3chpiYgj4Q2mtF1SS4OrqaRMsn7fnlZ2qSSgChmB4gCBzE7CSoXox7nG58PPwtd
	FWLc90VCQ==
X-Received: by 2002:a5d:5d0b:0:b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e0d78a05cmr12472484f8f.48.1792411687431;
        Mon, 19 Oct 2026 05:08:07 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm23537729f8f.47.2026.10.19.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:08:06 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:08:01 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Dionna Glaze <drdeeglaze@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atX9fugGUsI0hGcA@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>

Mon, Oct 19, 2026 at 01:53:28AM +0200, drdeeglaze@gmail.com wrote:
>> On Sat, Oct 17, 2026 at 11:55:05PM +0300, Jarkko Sakkinen wrote:
>> > I wish I had a better picture what is going on.
>
>Me too. I've spent my Sunday with Claude trying to build some
>understanding of all this stuff, and put together a static site about
>this series.
>
>https://deeglaze.github.io/scratch/ctlv-site/index.html
>
>It includes a review that I've personally walked through to ensure it
>wasn't off base, but of course we're all fallible here.
>I haven't decided to email the review comments to the list yet because
>it's pretty thorough for something posted here as an RFC.
>
>I think something to be really careful about with this series is how
>it's managing kernel memory.
>
>* https://deeglaze.github.io/scratch/ctlv-site/review-02.html#reply-7
>* https://deeglaze.github.io/scratch/ctlv-site/review-04.html#reply-27
>* https://deeglaze.github.io/scratch/ctlv-site/review-07.html#reply-7
>* https://deeglaze.github.io/scratch/ctlv-site/review-11.html#reply-8
>* https://deeglaze.github.io/scratch/ctlv-site/review-16.html#reply-30
>* https://deeglaze.github.io/scratch/ctlv-site/review-18.html#reply-19
>
>Something I and some others dislike about IMA is the unbounded log. I
>don't know how many stalled proposals there have been so far to permit
>some model of "snapshot/endorse and truncate" to allow a remote
>attestation verification service to store existing logs in object
>storage, measure the reference and/or trusted signature that the log
>was "good", and then drop everything in the log prior to the
>pointer/endorsement event, but we have a chance to start with the
>right model here. I liked Tushar's talk in 2024
>https://www.youtube.com/watch?v=5cXDrIx8Qgo

Yeah, I was thinking about this and went back and forth. In the end, the
only reason for leaving it unbounded is to allow multiple independent
users of the same register. For example, IMA and systemd could share a
TDX RTMR. The systemd side would read the journal through the
attestation device and the IMA side through securityfs, but both are
views of the same journal. If one side truncated it, the other could no
longer replay the RTMR. Isn't this the valid usecase? Do you see how to
resolve this?



>IMA carries its log through kexec and this log doesn't, which is a
>hazard to later attestations that don't have some other out of band
>protocol to associate its boot instance with some off-box cache of the
>rest of the log.

kexec carry over is implemented in follow-up patches:

https://github.com/jpirko/linux_mlxsw/commit/66fd9cb5c9ad47d1797eb10eefe646d28f52ee11
attestation: Add journal kexec handover

Preserve journal entries, live MR properties and terminal values across an
orderly kexec. Restore only a matching provider and backing device without
re-extending native registers.


https://github.com/jpirko/linux_mlxsw/commit/13cee30a523533cce00da650ae594faaa7b0b892
ima: Integrate attestation journal kexec handover

Carry the selector, target identity, journal boundary and violation
count through orderly kexec. Keep selector storage alive for handover and
rebuild IMA deduplication after restore.


>
>>
>> Currently we don't have an intention to flow TPM command packets
>> through this. Anything would be a high level operation like 'extend'
>>
>
>If you're not intercepting all extends through other interfaces to the
>registers (e.g., /dev/tpmrm0), then it needs to be clearer in the
>documentation that users not using the interface will break users of
>the interface when they both target overlapping sets of registers.

Agreed. This needs to be documented explicitly.


