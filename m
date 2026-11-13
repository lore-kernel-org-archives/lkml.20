Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574970;
	b=xPm3ru2r4mvjqLFH95qjguWrThNodT6Hsva32HSDIgtbkxtVUY9j1wlNxjeIxG8H/su0
	 V8iBIxvNIDp/fW2kjRGA5dGgTdpR73sesQ+5ts+iQgmSYZl3+hPJFJpavzLbfelWy6z4B
	 poOpeVbm/Xf5R9XqBz653JXumabgVKTh9wSt7kO+aOhLFkmWysKOnbYv3X1z+fMjQGMRf
	 Tdyt/jS2dla9bROzWtyGALmyNaSmZBtj6BIGItac51xnMACU33J5wHrDqEpCJHvoNEbIE
	 w4kbj14TBkdQLFwAYE6UcbAqGYqmRAiEUKDsRXiAphBU4hdR4vilc56RPUSqyw2P1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574970;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
	b=jgctlRkDKEHL/kUhKnIPyNRyB76iMySjMR7jEZAfoZHQ8g4LZmuIsECB4H7b+ynNfGS0
	 0oe3zfsF0LS/iMmFgMlK8sk4iSETphFAR6HHJB2xYGEvgtlWnM27qKhGpNLzQebl8goHO
	 XdKPcL7pXxkYEuUxLO16I778Q4c+eaKrMyWXibF1Q/CPBUplsaNFF2Qdrt547Zsyi28QG
	 rz5DdDMh0O8TIooUpt4SQ9Ha6eKL8ztZfoBny83kEIzBwC4jcaycjjJP61j4UD13qSmdQ
	 rrVD+OXXWIbWxhwDqwWTMQ2ckiCAnjFPpbhK9mQnrP4v5P6fOY9+bbDgh3ZRKS9dqnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T23wgP85;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0hrBIkg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T23wgP85;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0hrBIkg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794574969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
	b=T23wgP8505Iae/ZLI0D2sfJeLiCnKyE3Shz8VWo4dy2syfVbjM7hfMDl/70jSzbysD0aZg
	nUYDnHfeo6opIdsasKrB1d8oO+8Wr7xMznb9ANlwOtE7EyQHKiJKK6q7QWDhCe5tNayn1E
	M3Mmc0MjkXUXvETrHzb8OV+7ASIqg+E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-gh1G5LdMMiyDRTJ9KjCrFw-1; Fri, 13 Nov 2026 08:02:47 -0500
X-MC-Unique: gh1G5LdMMiyDRTJ9KjCrFw-1
X-Mimecast-MFC-AGG-ID: gh1G5LdMMiyDRTJ9KjCrFw_1794574966
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c40bbd26f74so84092966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794574966; x=1795179766; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
        b=o0hrBIkgicwuWvPInNgVkgwCNjBmMxIMYNhunoB5f1q1kxSrTokco2KY2WWL9l1alC
         /+2xx0UgyBTRyEUMhy9G5YTyLyjj/F2GGzFz6+FF2fymwVv7bKVEhFQUwP4YunLY8j5E
         v3PiNcdqk8qY6mchQEdRh1Jq+udbS7P00ZsQxxtDRhdPdxbshuGD8H3yQUONw5D2purH
         q/NPhMSbgfRUU1Ozm3GrHiRDFvQYQ1gAybudb6DbdYQXoU1zx6G/rW95yJ6tvhBv9o2c
         Q8QMg2Aspi9sulSh5TEFm7eThufzpVSPLH5qj2uzAh9KN12ABMaEUULf4P2ql6JO9PPs
         zekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574966; x=1795179766;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
        b=cVh4VBYPGoVm+JLOhXfc+kHTi8Pm8et72ZA9ESQft0tcwx0kitV38r+JoRTH5xKsR5
         0FblyV56HFSip3+6D4B1gBquYcTkld47lkUMFiYoW5OWIeUBWEheu/NfJSvuUSF1KbrV
         Jug7GHP62A2jhpvVkzarLzCFFNplkZAd2BrcRxVCFenFnZ9esHrRySFS3NzBprS8x6jc
         m8cwQyFXES5h2lXOYuT2A//qzhm5ieJVzLib8M1VRz2BE53Bgb2tbEKwN+HUvt46yFCP
         ViuJg8GLlgU1OBHPuQhHcpa06wxDGUc6ziey3bpWsRZcGK7wG7VDryT3Cns4usTyUM0s
         7FzA==
X-Forwarded-Encrypted: i=1; AL+hErHRAH/7CuwETdhwfiU50WuPZ1VJhzujaEqHK8XCVOVfNbJSpluRTvWGeeW8OH4JfgzN3syTbqhmufZFTcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4ueIrstrMdPqpGCIvcgb44dTaMS6s7WCO5yTInITZVYbzNh5
	rdBzhsLXLVfJIf39wOvknwiniyNlYwfXaryluyM6wmaujtkqP2r5X8/sX9JxxPtQA71/NY1pxBt
	MrQFVMxJOgdTLI9e5Dbc/7iiDU9usKOw1yjxF3iEyLG2wcppzYZzf9wR8HjAy6MZG1w==
X-Gm-Gg: AYBFou3NVDpvywKNCLdA6GN3G27sDGXKrBe/D+xbiV+79doKCbg4gnO3ZnitfthCSpR
	jK1VjFklggfPH4fQ4EQCfPStL0/cNuR00dJdOpir8l7ukrE2TGlYhZyWlzKlL18uCXwBSgZtV6f
	GYqVLnhxSwH0rMjN1PMUit8TfnwR5cswwPej3nmebuErUObPFyB7vAV0iVx1b/H/m/kP9zltbIT
	peah5D++VkJY36ay3w2acyMmijJg83C2l6uYOQuThiRBR1rd6VRgvauJBrg6S35QBv99R9cba8f
	QhW5wNmt+J3bUjEdogT74Stk90YBimzwawb1yF+rCXGbLENuTojsY/4wwe65xNBEWlICi//0KIN
	ii1Z95klUntQGDm7pUA97K2/B7LxpKcLIk+GU+S9i2dhuUIFd36oiEHVSMrdJW7V4kHw6xuP9LY
	kn51PF9T27wGOTsVdQMR/1ckuZLdSKs+u5nfrJzKE=
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr207751966b.38.1794574966246;
        Fri, 13 Nov 2026 05:02:46 -0800 (PST)
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr207744866b.38.1794574965555;
        Fri, 13 Nov 2026 05:02:45 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm4784229f8f.34.2026.11.13.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:02:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Piparo <holofermes@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Amit Barzilai <amit.barzilai22@gmail.com>, Mario
 Limonciello <mario.limonciello@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add
 col-offset and dclk properties for the SSD1322
In-Reply-To: <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
References: <20261029205751.3513474-1-holofermes@gmail.com>
 <20261029205751.3513474-2-holofermes@gmail.com>
 <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
 <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
Date: Fri, 13 Nov 2026 14:02:43 +0100
Message-ID: <xlv1wlqgsx3g.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Fabio Piparo <holofermes@gmail.com> writes:

> On Fri, Oct 30, 2026 at 8:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Thu, Oct 29, 2026 at 04:57:50PM -0400, Fabio Piparo wrote:
>> > +  solomon,dclk-div:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
>> > +    default: 2
>> > +    description:
>> > +      Clock divisor.
>>
>> Why this cannot be deduced from clock frequency?
>
> On this module the SSD1322 runs from its internal oscillator, and the
> external clock pin is not on the ribbon. These two values only set how
> often the panel redraws.
>

Yeah, the property name is misleading. Note that properies Fabio is adding
are from Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml,
which is for another family of controllers supported by the same driver.

The ssd132x, ssd133x and ssd135x families don't make use of them. That's
why they are not defined in the DT binding schemas of these controllers.

>> > +  solomon,dclk-frq:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Use either existing properties or - if there aren't such - existing unit
>> suffixes.
>>

Again Fabio just took what currently exists in solomon,ssd1307fb.yaml, I
agree with Krzysztof though that these properties are not nice and don't
really describe the hardware...

The ssd1307fb is pretty old and was originally for a fbdev driver, then
a DRM driver was written based on that for ssd130x, and finally the DRM
driver extended to support othere families, which had newer DT bindings.

>> > +    minimum: 0
>> > +    maximum: 15
>> > +    default: 9
>> > +    description:
>> > +      Clock frequency, higher value means higher frequency.
>>
>> Why would the frequency be fixed/static?
>
> Right, it doesn't need to be, and I'll drop both properties in v2.
>
> I still need the redraw rate to be adjustable. I drive this panel at
> about 200 FPS, and at the default clock it redraws at about
> 115 times a second. One way would be to offer the 256x64 mode
> at a few refresh rates and set the clock divider from the mode
> userspace picks, the way panel-newvision-nv3051d offers
> 640x480 at 60, 100 and 120 Hz. The rates would be approximate
> since the panel's oscillator is not exact, is this a good way to do it
> here?
>

Fabio, I suggest to just drop this patch and as a first step just
set a default_dclk_{div,freq} in the SSD1322 struct deviceinfo.

That way, your driver changes won't be blocked by the DT binding
schema changes. Later, once your driver changes land, we can figure
out what to do to make all this configurable from DT.

But Krzysztof is correct here that these properties don't seem the
correct way to do it. They are just exposing raw register values
in the DT, which is not the proper approach.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

