Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510049;
	b=t/ZBHiIeg9NDTjD/rzc1n8xWqPIzulheEySH6dHxDLTib69m1Vg1t8waUxqM/kmvHEaY
	 NwlWcZcWRc7wyI/QsQGSuEMQXswn6tqQTl9Swmg2Re+cYBjDMMRSHCTk9QNK7fH7APMcb
	 iMsvwfM3b/hB3KqqmpSI+PAooa7TcYAvS1JIIUB+8IdUFcm+mPfRDICVaowTrRbENHFcf
	 OG5Hn4SFicuMpHQkQJqspBTbs8gzVYg5pj8lfqpVNBFYGWG3n783ImVyzz/6+noFgYNx0
	 ddHzfUiLue/7VAa5VQyEK1aCJE3rFRRtHki2OM/R3zByH6Cjj9M4IlSR1OFgK02acEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PCcv4OBN0VPh1W63f9TMAAgG+ReJR6ejwfKM3zkBC4c=;
	b=joNVmMIbgqgl5SbVv+SVS6K1BRz/d7ca1xdvmt7TEMKIRpzScgg1oob7XKPhYuCt/Pxj
	 ROPGEp73SfyvXysl6mSp/sMx/IeMnb2JRG6FesRPP9wV6QTdbPxp0hvNx9AWLx8BOFpK9
	 avN6ytLe04C2S/gVvFz9IbdYo7Bz3v5+Znn3jYR45kVlB3vckUAKp7yV3dxd8l7P6xZgf
	 rYgkSfeTYo0q9BmtvwWrBV7bSazoCBNlB2KNuh80wMRrEF8pqGSNnKyFd2fUNzll3cL3j
	 lNUz7U3q97h/xa/iOAJRPGCNdzQoxINe6Y+vaken2wscHAj77cR9HmWjj0ZIC8I7OXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eau4oVYG;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69712606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69712606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eau4oVYG
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so9089071eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510048; x=1793114848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCcv4OBN0VPh1W63f9TMAAgG+ReJR6ejwfKM3zkBC4c=;
        b=eau4oVYGuhZ5lRwDnrXyWr27q9OM46W4f1Djd6/Od6qA7AlIeZfXtwpRhsDzfFk5Di
         Mr9BDhRf9/l/asfO2WWs75Yz9pm9o2MMHlFs4+cxKwKG7QSMKPcfJuO6y6SmskwxcwrK
         xHrQ0Je4mrLjAhsdCRlnXje2omZ2yhAUvMNdBIunacihg3uBZOkZBMZpxTtk35W3qzwE
         lkN/rcYPfIJZsYrm0onZw9XVmzOw9oVFcp3FO1pGUo2LyLkln9J/0JHu4kbxrlSn6HvJ
         2YN7WwFcoDbnN7dxGvrOZZUOlDyM2DYhUOnyYgLjQ/NymaZeStaT5tsZI2YCruYLF/77
         TeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510048; x=1793114848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCcv4OBN0VPh1W63f9TMAAgG+ReJR6ejwfKM3zkBC4c=;
        b=voj0yDZR+okpTcCLbB+GCn120IjqYeSIvdkF1BBbR3jap3/DIQ5BmVPV9kjoD+RCrP
         WnpgG4LiisiORkkBgPgjD+AWb92xRdsZCrVm3+zV9w+HRAY1Ts5xKCMm2QkWCrZwwleu
         gJj1h98zU5+rzZHUU3+iBHyW5jMBh8vW3NAQGqPyFz2WyBUA9L3BHz+7iBmXPcbWI4/L
         MxyP9U1GxTkdSUs/PxAwXWO7auSJYiV5RCQuCpfdM6umlCmWTK9qhXLJo+KJKQJr0RDZ
         zWC5DNfd4knZVl4zuCXUKhA+L0JRW93P7+tURzDlbVjn/yGKXgGdALKZTLcvTY0VNhks
         9kbA==
X-Forwarded-Encrypted: i=1; AKwUvBzJq9iwhaSD5L7ahj5L5DnQgqWmbmkYuIgchjvap6TPtdhbVI9bDR53YU0dBPNs58F3GMXzLU3/SwSJyk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCbUUw2xUl/cAdyFLOPMqXFlhn25tPc/wMVD8F8pod9Z7S8Kwa
	XG0JsXf2vTa9/R5DP+CUtJaA/HbGKQgPd323QD4jMm9VZJVC/ZfXvKwn
X-Gm-Gg: AYBFou1du+gM21HSHuv053ovzo6lEu8a2LHq7lOFaqWNHb4DxY0NoABCi3niB5dCVEb
	1qj2UOlC+mKmIGOCVhfZkdwM/mX6JMAYWpy9F6W6MGeCa6+s7kfIHegmzAVkxY0seE8d6EDPMHk
	3ocjuZqgkD/jxi6mdXDOy277lYzPVLcAWPBjK8r8olzK7pTtZrwxHpX2OLHuw6ovzlCi6zqgEKl
	JzLhPcDQqKY+XGSSNElO69PIN6UzF7MogcRD45s2YrDiBdeBauRksgB+Jl5bCYpm+MkoRQ6dOK+
	9rZGt7L4TZONbdYlC+WLae4xGgaNyTzuGtPUbwq2U/nrKsNJ87IhLz7I5iauKqQhxKpe80na7ti
	1ofP6y5/WUIGB0SndfgMrbXTTn7CBMO3UesjKa3noCWR44tERPc9t2XuTgacewOFAJQbn8AdXI9
	SAq6J4yElZCxmd9wCOpMLopxDcNTgEd7fYE+HG5OIzNuoK2ey+ariME+kE8s4nVBRkYbdPwWIEc
	bXoIgFVIT13
X-Received: by 2002:a05:693c:6395:10b0:35e:60ca:81e9 with SMTP id 5a478bee46e88-361a1f53a9emr17584684eec.21.1792510048243;
        Tue, 20 Oct 2026 08:27:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm41307392eec.14.2026.10.20.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:27:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 20 Oct 2026 08:27:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
Message-ID: <04519e94-3616-48c5-9db0-dceb90f3fd56@roeck-us.net>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
 <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>
 <DM9HNFZ26I2H.348U7TRUKBLST@nexthop.ai>
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
In-Reply-To: <DM9HNFZ26I2H.348U7TRUKBLST@nexthop.ai>

On Tue, Oct 20, 2026 at 12:31:11AM -0700, Abdurrahman Hussain wrote:
> On Mon Oct 19, 2026 at 1:25 PM PDT, Guenter Roeck wrote:
> > This implementation is wrong. Support for relative mode should instead
> > be added to the PMBus core. Or, rather, this driver should be tested with
> > https://patchwork.kernel.org/project/linux-hwmon/patch/20240315151855.377627-2-lars.petter.mostad@appear.net/
> > in place (with appropriate fixes for that patch if necessary), and the
> > patches should be applied together.
> 
> Thanks! That is exactly what I was looking for, but my search for
> fs1412 on lore didn't turn it up anything.
> 
> v2 will carry Lars' patch (Cc'd), rebased, with the driver reduced to
> the MFR_ID check and hiding OT_WARN_LIMIT. v2 also adds the FS1525, a
> 25A part from the same family that is relative-only as well, so the
> core change has two users. Fixes on top of Lars' version:
> 
>  - check VOUT_MODE for 0xff before testing the relative bit; as posted,
>    a chip that does not support VOUT_MODE (reads 0xff) is marked
>    relative and gets a bogus exponent
>  - signed division, and clamp the user value before scaling it
>  - fail probe if VOUT_COMMAND reads 0 rather than divide by it later
>  - only update the cached VOUT_COMMAND after the write succeeded
> 
> We have a board with four FS1412 and one FS1525, so I could test both
> parts with these patches on 7.2.10. Since your concerns in the 2024
> thread were about how these parts actually behave, here is what they

Not that I recall that ;-)

> do:
> 
> VOUT_MODE is read-only and relative-only. Both datasheets mark it
> read-only. FS1412 returns 0x98 (exponent -8), FS1525 returns 0x96
> (exponent -10). Writing 0x18 to VOUT_MODE on all four FS1412 is NACKed,
> STATUS_CML reports invalid data (0x40), and VOUT_MODE stays 0x98.
> 
> Which commands are relative. The FS1525 command table marks
> VOUT_MARGIN_HIGH/LOW, VOUT_OV_FAULT_LIMIT, VOUT_OV_WARN_LIMIT,
> VOUT_UV_WARN_LIMIT, VOUT_UV_FAULT_LIMIT and POWER_GOOD_ON as "L16, 1.3
> relative format". VOUT_COMMAND, VOUT_MAX and READ_VOUT are absolute.
> That matches the list in Lars' patch; POWER_GOOD_ON is relative too,
> but the core does not use it. The FS1412 datasheet says the same for
> the limits it describes. Raw defaults, as a fraction of VOUT_COMMAND:
> 
>                      FS1412 (0x98)   FS1525 (0x96)
>   VOUT_COMMAND       0x009a  0.602V  0x0266  0.600V
>   VOUT_OV_FAULT      0x0133  1.199   0x04cc  1.199
>   VOUT_OV_WARN       0x0126  1.148   0x1000  4.000
>   VOUT_UV_WARN       0x00d9  0.848   0x0366  0.850
>   VOUT_UV_FAULT      0x00cc  0.797   0x0333  0.800
>   POWER_GOOD_ON      0x00e6  0.898   0x0365  0.849
>   VOUT_MARGIN_HIGH   0x0119  1.098   0x0466  1.100
>   VOUT_MARGIN_LOW    0x00e6  0.898   0x0399  0.899
> 
> With the patches the FS1412 reports in2_crit/max/min/lcrit as
> 721/690/509/478 mV against an in2_input of ~560-580 mV. Writing
> in2_max and in2_min stores 0x012e / 0x00d0 and reads back within one
> 1/256 step. On the FS1525, writing 600 to in2_min stores 0x0402 and
> writing 509 restores the original 0x0366. I did not exercise the
> regulator path; the driver does not register a regulator.
> 
> Paging. Neither part implements PAGE. A PAGE read is NACKed and sets
> STATUS_CML INVALID_CMD (0x80), so on these parts relative mode can only
> be per chip. The patch tracks it per page, which also covers a
> multi-page chip that sets the bit on every page.
> 
> Vendors getting it wrong. You were right to worry. Some things I ran
> into:
> 
>  - The OV fault limit is rounded internally to one of four settings
>    (105-120% in 5% steps on the FS1525), so only some values written
>    to it take effect.
>  - The parts are only partly consistent with their own command tables:
>    OT_WARN_LIMIT and READ_IOUT are not listed for the FS1412, but both
>    answer without a CML error, and OT_WARNING sets at room temperature.
>  - The factory programming varies between parts on the same board: one
>    FS1412 has VOUT_MAX 0xa500 and VOUT_MARGIN_HIGH 0xa400, the others
>    0x0300 and 0x0119; another has VOUT_MARGIN_LOW 0x0000. The core does
>    not touch these for hwmon.
>  - The VOUT domain differs between the two parts. FS1412 reports
>    READ_VOUT at the feedback pin, so it is in the same domain as
>    VOUT_COMMAND and the converted limits. TDK told us that the FS1525
>    reports READ_VOUT as the actual output regardless of an external
>    divider. On our board that is 1.094V against a VOUT_COMMAND of 0.600V
>    (a divider for a 1.1V rail).
> 
>    I checked what the FS1525 compares READ_VOUT against. Setting
>    VOUT_OV_WARN_LIMIT to 1.5 sets VOUT_OV_WARNING; setting
>    VOUT_UV_WARN_LIMIT to 1.5 does not. So the part compares the
>    output-domain READ_VOUT against limit * VOUT_COMMAND (0.9V), which
>    is exactly the value the core reports. That is presumably why this
>    board's OV warn limit defaults to 400%.
> 
> One question before v2. The FS1525 over-voltage fault is the exception:
> the datasheet says it is an analog comparison at the FB pin, at the
> VOUT_OV_FAULT_LIMIT fraction of VOUT_COMMAND. So on a board with an
> external divider in2_crit is in feedback-pin volts while in2_input is
> the rail. On our board's FS1525 that is in2_crit 718 mV against
> in2_input 1093 mV, with no alarm, and the actual trip point is about
> 1.31V on the rail. The chip has no way to report the divider. Which
> would you prefer?
> 
>  a) Hide VOUT_OV_FAULT_LIMIT on the FS1525, so there is no in2_crit.
>     Nothing misleading, but boards without a divider lose a correct
>     in2_crit too.
>  b) Scale in2_crit by READ_VOUT / VOUT_COMMAND measured at probe.
>     Right while the rail regulates, wrong if it is off, ramping or
>     margined at probe time.
>  c) Describe the divider in DT and scale in2_crit by it. The FS1525
>     would then need its own binding instead of a trivial-devices entry.
> 
> I lean towards a).
> 
Either a) or c), your call. We already have a vout-voltage-divider
property, but it looks like that won't work here (it sounds like only
the limit is affected ?), so something new/similar would be required.

Thanks,
Guenter
