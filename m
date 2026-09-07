Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B04FDE4F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796692; cv=pass; b=DaF2cGQ+Qs5PdmE2ViSCDzN9zpZEJvq5Pp6RCRbytM4RIZLI9cSM8tln2x5XEsSkiX7GdMYRAAnuyoTWP38owBZJP6it45aofN/A/88BO82h2E9nTL1XCEMUdwzB8n1ATRIjmNrRqRG+5pleL7Z9KEbrP4K546IpZtJhvxe0rJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796692; c=relaxed/simple;
	bh=Rs8D6euDZzTcW61TMY/tcjJU4GeLI7rZpkYbKx565Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1ovnPDTn/GLYNQQgG1AglhK7uL+zP51NvedPTW3ECCmJsjdap1isjqHcFXEC1ryVWNLjxpejp3ZcGcp7/fqOaa29XcrSu770STJYfGl1lJE9canjmMUx1L6tfdE6sDLUYrF1hywJ/+qn07wDh4JFV2D06Hk8dbPMQJozq4yOnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BE7wg4P6; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BE7wg4P6"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-86fbd1a23ebso26385187b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788796689; cv=none;
        d=google.com; s=arc-20260327;
        b=JID4HyrldJB8hvuq2dCUxcDqlHbcVnrVvzM0LX8ibTHa66z69Z1qk7gXoCYdhbA3Tr
         1CVxvbygfceDLCBSEfmwS7UGBSFr0QDRzPBJcbz+9nMfe86jxiYITtTD0GU3S/GBi0C1
         wXhCOaiGQkqG05Tsf82CJ2oNdsZKQklslM8mBUdAwtVHjAPdGnxnGKunoQNJtEXFzAuW
         +i14oTgyIGnC11QTlM0baGDcDTQILEJOqqp8prt0++L/aMpssV0yqOdNbtn7v3iIa3/J
         6OMGKKytrWvgt8zwVQh/hiFY7RPX2FHOP1BhJnyChIwkZnjASn8wToVkdWjJmOBrDKs8
         LEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nopJoLIJVNXWQLeDX2Hcvbg342jeNYWKWWtajWtfO0w=;
        fh=h5bTZdTXy05fX1r+rO/IKJX6WK4N+rpY4RRJ2mvkDEw=;
        b=eILkdLMc+ib5NNDtUl7MkVv0nyUPQEwLsTgiGHvOi8LMMOynRvjTVYkxVGE1H657sd
         uXjpr1Ry9GScSz57mtCKmiRdjGl5ZXsNsMUnLP6TpnBKrNjpgFy+cWEStHBb4V9SXQr+
         U9co3rQbZg1/sMDbP1PWxLjFUUzo0LBzOW96hiw+4qyJXi4+HsePII5rphqp85miFqi+
         MPD5Dmdvo2RpmvywXTZsHIxM9np3ByrjUByBWpKrIwr0v3TmUxIm71OdZYMbGgr6Qfxw
         YOBroziLuSDcVN85rZL2y0WAddeLJB9b7VwFN4h/DKK0ZeZNw2Kzvp444B+J6gLfmtnt
         O1Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788796689; x=1789401489; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nopJoLIJVNXWQLeDX2Hcvbg342jeNYWKWWtajWtfO0w=;
        b=BE7wg4P61rtRrpCjhDri5gKeyy1+PPBfaD/r5HnTWSDgOOk0DN4wYIoUD5kKYJ/hk4
         Xfi5FP4m4hZ2AYI951XlqruwSGLAGanWCzEA2J3mGutidrhKUh4SQNqybOY667ZbepVh
         sv9RaVlDLBm1mu/M6lfoEl0Uo41D97cqSGkPkrBo7ynSK20jcFT9W1cmvjy/57UzdKmM
         thAlOiEBseHUUcH35thUKacDDqv102mZUvOajUbx/K4H2UM3JFgRHGETOaXU43mbLONV
         2g5Li4Rb8bqwGK+lrmfio6QbJeZP6I8RYBT7KFYztAMgE7q/MOpvtmOUtrDjWezSDXUz
         Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796689; x=1789401489;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nopJoLIJVNXWQLeDX2Hcvbg342jeNYWKWWtajWtfO0w=;
        b=nL/Q7j5A6J5q20ekBloH8Ne+1nk0reiNNZkJ9n9JGSFJAhi2feCSdnT7H0YUK8kj7o
         ggB4wC3oONel6CKVvvW3V1ZakUeocgnbQzW4BOYKrIswVfoscb1xOjlao0Hy93lxds6Z
         tOZlnVtX/iQKoi1jpiYUiP2JOSyMfr6X2x/8Rzyw3iNyO6xMQdWMYDlJPqXDEIi7VhPi
         fcDUBeHnt4MQ0ie2TujOCcMQMkC52Rp4w9D+1cQmyCY3qp7Ud9q7Mvsz6gsh3uZMChye
         qjlhJ9GjY/+FlFZqt/ZDIktBk5EtZfwR6d//DfcAXjwt0gHQCkNTtNvd39+V1ZeDz8jN
         PjQA==
X-Forwarded-Encrypted: i=1; AKwUvBzCzMlkHn51nnWWn4aKEPMO0s9HQVGW16xz8gW+/IdTg6raYCzNZAG2IbAFBkslAxzZre3E1tyUfNiJs9A=@vger.kernel.org
X-Gm-Message-State: AFuF++nyPOKTtCvlzloyNbpjZM363jiD4ArhO8C08BWsjQgFLF1N6rIJ
	9G0m73pZktU0icRfrls1niTE8HLrpRpj1sF6l0HYQy9ee6d9uIg5PvlZJegRcEL051bgvsnrlkA
	QEg5WhVYdqr2enjzFJq5VjUiHhUlXhFtw61SntplAoA==
X-Gm-Gg: AYBFou1VX+asB42uPtpavrQQMYRKyouCP++wiZzJOfJRI70bjcCwKkOJgge7posOdAx
	P3+8Tlp6RanjT+aRvz7Ld3wz/fEGLG8eiHLLD5DiAtjrwX209g73kxndqgLDNZDUMIGikctTjD9
	+7u/Gk8L82gx6OU+V5JaxefJZr3DNVJ8xxdj9RZtXj09lO9fU4FGkl86M7dwCk8bvEkZdD+OeSu
	nJT+a6ADgBcxRzl3UGy6XZ6T2xkIGVc7m8PUE1t0TAQvgQ6nHJKtkL6rKVwX1DyjZIkiq/esy+5
	M4Qb2CKjxG+oWXeIOwiYWnhuRSj8H8FV+5bZilxIKr+/MgDQgiD95eWV3nhPAWKN1HzM0jnR7jh
	v0OMudjPEvUv4TWIt+j/8Gk7Hx7pETBRt0RRCWC31WoSqF+Grbd5ne1X+6F3bQhHoLj0UYBaQQk
	9vo1MGmsBnb4YZRJ/3/BTJZAwF80GfdtCDCPwyYdAdXhZIHEwm01kq7JAJhXFsM6jPByFSNlqu7
	B5ZzY0N/pXXduAiL5F2vzt9nMaAz6u25zOYvvswqtaTYbMnR01R6VdPaEq/X5Ub9LzO9q7obXmr
	HCDIfaNIwa7ibjz6jBpj/xPCiflC8mIwh+hd82LE3NEtj1uhBeT2gg8gDMKl67bDCsnqZQbxvEM
	Cyce/mZk5bQrBwfG8QNZ8KGVEeFOnFU7t1hPWwwQY5Fw=
X-Received: by 2002:a05:690c:f06:b0:81f:e7c5:f420 with SMTP id
 00721157ae682-87128eb5216mr102573537b3.20.1788796689408; Mon, 07 Sep 2026
 08:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788259938.git.jasmeet.bhatia.us@gmail.com>
 <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com> <DL6NCV1KQ9F9.6K6XZQCS4AF3@gmail.com>
 <c3ca811b-a6eb-4f4d-bbb2-4feef02e3db2@app.fastmail.com>
In-Reply-To: <c3ca811b-a6eb-4f4d-bbb2-4feef02e3db2@app.fastmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 7 Sep 2026 18:57:33 +0300
X-Gm-Features: AcwNN1X5lVzY-VVghdr231z6GdYRJyb_3-BGRdPWok47tN8y6tOFHleN_U7rMRw
Message-ID: <CAC_iWjL9jDsRaU7kEemYfwk292Nxa49cK0Rq=81pC=FWNRDhvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] efi/tpm: Preserve event log without changing x86 E820
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ard,

On Fri, 4 Sept 2026 at 19:39, Ard Biesheuvel <ardb@kernel.org> wrote:
>
>
>
> On Fri, 4 Sep 2026, at 17:45, Jasmeet (Jazz) Bhatia wrote:
> > On Thu Sep 3, 2026 at 7:18 AM PDT, Ard Biesheuvel wrote:
> >> Hi Jazz,
> >>
> >> On Tue, 1 Sep 2026, at 13:34, Jasmeet (Jazz) Bhatia wrote:
> >>> The EFI stub currently allocates the TPM event log as
> >>> EFI_ACPI_RECLAIM_MEMORY. On x86, this becomes an ACPI data entry
> >>> in the E820 map.
> >>>
> >>> On a Framework Laptop 16 (AMD Ryzen AI 300 Series), the EFI allocator
> >>> can place this allocation at different physical addresses across boots.
> >>> Since x86 hibernation validates architecture-specific data from
> >>> the firmware E820 map, this causes an otherwise valid hibernation image
> >>> to be rejected on resume with the following error:
> >>>
> >>>   Hibernate inconsistent memory map detected!
> >>>   PM: hibernation: Image mismatch: architecture specific data
> >>>
> >>> Allocating the event log as EFI_LOADER_DATA avoids changing the E820
> >>> map, but doing that alone would regress the kexec corruption issue fixed
> >>> by commit 77d48d39e991 ("efistub/tpm: Use ACPI reclaim memory for event
> >>> log to avoid corruption").
> >>>
> >>
> >> As I replied in the other thread, I am not convinced preserving the TPM
> >> event log across a kexec makes sense to begin with. This is the firmware's
> >> view of the state of the TPM PCRs when it handed over the system to the
> >> first OS.

It doesn't make sense imho. The only thing you prove is that you
kexeced from a 'previous good OS', but without knowledge of what that
OS did before kexecing.

> >>
> >> If the first OS boots, loads a kexec kernel and then boots it without
> >> measuring any of that into the TPM, the TPM event log will match the
> >> TPM state, but this is meaningless because of the missing measurements,
> >> and the attestation chain is broken.
> >>
> >> If the first OS does perform TPM measurements, it would need to record
> >> them into a log and pass that on to the kexec'ed in some implementation
> >> specific way - it cannot use the existing TPM event log for that.

Hrmm, that might be problematic. The EventLog needs to illustrate the
state of the TPM PCRs. IOW replaying the EventLog in memory should
match the current TPM PCRs. But that also means we'll have to teach
kexec how to properly extend the PCRs and update the EventLog.

> >>
> >> TL;DR perhaps we should just discard the TPM event log reference from
> >> the EFI config tables after consuming it. Or add a special case to the
> >> kexec code to disregard it.

I can't decide what's best here. IIRC we don't expose the final event
log config table in systab right? So we won't break any user-space app
that depends on it.  We just copy it in
/sys/kernel/security/tpm0/binary_bios_measurements. In that case
getting rid of it would work.

Cheers
/Ilias

> > Ok, honestly that makes a lot of sense I see what you are saying and I
> > tend to agree. I'm treating the copied event log at something that
> > survives kexec in this patch because of the corruption fix so I'll look
> > at dropping that LINUX_EFI_TPM_EVENT_LOG_GUID reference and rewrite this
> > patch. Hopefully, that will avoid that x86 E820 instability as well.
> >
> > Appreciate the guidance!
>
> Please don't send any patches yet - I'd like to get some input from other
> folks as well.
>
