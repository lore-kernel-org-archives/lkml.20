Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881978;
	b=Cixv5bX0R2MkwD/XWF3RoCK023dD0WoyZBkXy7onS19ad4UwK5lwrzg6c+tW82D3xTBY
	 F3IqhQ2uffDegGOL0CeohdUcdGDxYUHyYNyEuO3t5FO3QY2yb1sJOcwNqXBb2Pa1aPbtO
	 nNJf+WmhgVRIXHFWw0rKyB0owoo/yyt5rCojR13kbsYhIo10ziDEM18PFTlM30MTkGpwK
	 mIVOH3kJm0nJpLMeKEoCs+xTfXlVeDijSe9U/lwIxDqudyprSsNuLcpS5mb6tMHe3XLXQ
	 nw0vcz8RyLaBkvlAVTPFaNQE2NgtbXE+TmvZk27/b2OAxOaY5nTE6EHYHUJTCboM/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
	b=DEM2arsVGZmhqjkYcJq/RFRiIbf3RfrGUoRbdW8XCX7Cijw+Odqf5tRa6XMKpfmF35UA
	 lwSe3iwWQFn8z59aRO38X9k+I6NXrDMuQu699yfCiAYOzbwuXnMRgDxRxaQYFVJdSzt1M
	 GxsvftEupFnKx71cEc2fee72sRDc2+K6QoXIAl6TTi88OcOuDQsniiLBiB3oJC84cKVEH
	 kuNSQmnwgZEGTa3Z3MuyaUMrCj7oYRkndAXT8CynGK8YTBuzF+5F12vWiNa06s7rVunsP
	 W2Nu1ZPrlg82sPhG+RK/rI84yAqo4jamm7RzoU+ZkVuhz5UW9DdBSihPJrO735YfjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=cCtFJSjX;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7F606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D7F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=cCtFJSjX
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1402924e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793881975; x=1794486775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=cCtFJSjXtpRSezyNE06wb3mNCryoz4ZPMqTXXg9EyTCJZDz7c1Wwg43Xnz2iDZHF9h
         uoCWVLQ8jvnyNWaRYluSpDmCHcdouiOJqpYN9KBvHh7ma3RwL36T1cBdawdpqOMfO/a1
         D1maF55YHx7FUilZtWynmISNmN56ev+z3BACC8vviL7dY4cTVG/suNv+f41imfxIare+
         C+bWcbedtAvtUrVKoW0m4EHeVcV77/6F/wIkQEtfvtcI0MozKYY2HozTWAUqXlxvcYfr
         NNTPhbfo1Y4AwQsaGifksj17DoQg1AoaBDPOa/kjNoLrOyT0vE5GD0k95/0RPFy4NjWV
         +K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881975; x=1794486775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=yrVyhYJ1/8NI//q1F466sIlO0ZeUCQ0BfzBHwlJ3bSIowFuoOyc/HkWB+dyb/JS/eB
         z+fHAwjbimh/upcghARSHR3yrHn+tVt0kp3Vu3XdEVK6+c6nD2QrAyfyvdosyJoKNlDn
         DsvciMKBWhEAgEu6D5CyUBRkoDFFi+WoGi0jnujTmUc+2DWI+7rweMaDW5zmhfTgymph
         4+FjZETCoYf86SYVdLqiDYbxzbNJ/JwrWzNrlDG4y08ga6AFsctg4JGRLMeX+/VSVrkw
         lXTR8ZMyo++e0KXePW/yI78a3ggs7IFQsLJYot5xs4UkTXAsDjg15dUWSCHFp3fqosM1
         gRQg==
X-Forwarded-Encrypted: i=1; AKwUvBz2yc1xU9DJVWBLWEkFaEnjE5ZP5qOY59+BR3Sb1NHmjljPCoD7EiNw7nmyCTYl+hSfItvYFiF/jPlTu1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3DobaeCECtG0gMnRJ0uZVXsphrIrbduwLYYOwmd8+yy3NKSKj
	OPVjDGQyFWwI/A1rMInB8eOccohNiyC2VRhkrNYIhxV/vXV9Mjat9wkVHqaiU4+UNYs=
X-Gm-Gg: AYBFou3onmKsYfgc3uOgbj67IWi85m1HSwg67kqe1zTbNGzaoZSlCYzNF1OeczBVXhI
	/RmpxsxjVqOUFPNkKHc032oGqL9TXjfD+WQYBh3Dxw21Nq+gNAMuBhMZej0WhN3N3flPsbTzaCG
	2HQDw/5GUDML6ibp0DGyTW+Jjwg2O/Zu3CJvyl+Cksla5WSkNd6tDeQpHSckOJSvVDv7iod+YxA
	EmQkDCY5k//gdNg3eJRk0H3wveqzDIceJwilyOfjP5Teslcc1lxbBjTSBVVl2dT2l1rRsuQ7J0O
	+pDcYEEIZgkck8vpWXUXhd1aI4lQzwjgN0qCibix1ebH4oRce1QoVKv0pM/SyLrzm8TvFVoTfl+
	DUkPM9VY5QTPfMgG3Lpu1BZ92qKUawJtgSri+YU6gZC52QLoQZZHelpJON4OZCnTPvTU8ynkJOd
	IUm5ZbaWnOaXiU45rXCMicv6cwuJ64CQv63MDC4wmJ/P5B1bTuiAJg6MABI2u+hg+UT2VwdvsmS
	6EoXqm3c+TvZzkc41S8lb1ZC5r3njDt2RhNLkQwD75WQpSv9MDDmyI5D97T6ySLdo/LDmBDn2nf
	e6O7KvniTDplEl7DKILFgAGz0vdFcou/ew+1Tm8=
X-Received: by 2002:a05:6512:3056:b0:5bf:b96b:2c75 with SMTP id 2adb3069b0e04-5bfd957c416mr7135190e87.37.1793881975197;
        Thu, 05 Nov 2026 04:32:55 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab170sm875824e87.16.2026.11.05.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:32:54 -0800 (PST)
Date: Thu, 5 Nov 2026 13:32:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <aux01NUd85PabtZu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
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
In-Reply-To: <20261104194622.GC3889730@ziepe.ca>

Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> [..snip..]
>> 
>> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> > +					       const struct ctlv_cursor *request,
>> > +					       struct attestation_evidence_request *decoded,
>> > +					       struct attestation_evidence_object_request **objects)
>> > +{
>> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> > +	u32 challenge_length;
>> > +
>> > +	decoded->challenge =
>> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> > +	decoded->challenge_length = challenge_length;
>> > +	if (challenge_length < caps->min_challenge_length ||
>> > +	    challenge_length > caps->max_challenge_length)
>> 
>> Hmm, I'm not sure whether this check is required for
>> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> 
>> for example, if the provider provides two evidence:
>>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> 
>> might challenge is reuiqred for generating the token
>> and this would be marked at min/max_challenge_size in evidence_cap.
>> 
>> However, in case of eventlog, it wouldn't require challenge.
>> for example, TPM event log or CCEL event log.
>
>Right
>
>> Do we need some field on attestation_evidence_supported_object whether
>> it requires challenge or not and applies this sanity check per the object?
>> 
>> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> always.
>
>I wonder if we should have two interfaces here for signed and unsigned
>evidence? It would be clearer for userspace then when it needs to
>provide a challenge or not.

Isn't the challenge field provided/not-provided enough?

Currently on the introspection side, device-get op would provide
challenge-lengths array:

        evidence?:
          challenge-lengths[8]:
            length?: uint(..4096)
            min-length?: uint(..4096)
            max-length?: uint(..4096)
 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)

I think it would make sense to have challenge-lengths array per object:

 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)
            challenge-lengths[8]:
              length?: uint(..4096)
              min-length?: uint(..4096)
              max-length?: uint(..4096)

Then the unsigned object would just simply have challenge-lengths empty?
