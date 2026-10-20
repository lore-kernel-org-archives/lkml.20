Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481475;
	b=Miy7px9PJVIfnlZ7ogQ32r6f9Cpkj3kOTIGSJttiSkxwGcKWa+yCrpuI9USAcUoZiM9U
	 22KrrLaVSft6Po1mFZ8UzApmH9GUiVpfyX7+rv9uOXmyHv/g5XyXrabDQfImRGWLSpxWK
	 OYq666nOHgPjpQqlStCBKLBATz576FH3rDxi0ImfPRHuQkkVCyQpCINKdHzwoxTwgUAQs
	 p7+cFON0/PEUBmwNvm3fWGNMvhbsEFPopeIFeCmwbKbH0CZZcpo0jLHnoS1ivYNZm23jU
	 FS8Lk/6dL2fFMWwR6CXW1w6GLLlEFOrvvXl4/pqrr/jhi08oqAoE2Z0rJI2YgI24KLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
	b=I3CA1PNSqAlqdJ9Aa2aVu+hooKVD5mUBNCgSIriBiNBErPeoFN5fn0WtLxPxLckOgDQh
	 sF1iJspVhIt5Y5KN4fVy3n+5HoHqbUA0PAt/jx4GPcJjWq0YdRSsvYYmH3gPgKb2maVn9
	 5AW3+N0ETbpPafGJ6lNKkdYAcMe2jODFwR+0o/Jkn73z8F7J6ZRbKUmX8Dngrxd8WHztu
	 sPHC6JGeLWDl+DBnjcGSP4kpQCjylZc12IplYRqniNX/4apl/btugt8FRQUq4tFb1HUvl
	 EjHuTj4PecMK3WPpHteab6CEJbATBeFro3lMH1fsoTAkuSfc0bz0Fk0jxMJW0Eu+jqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=fKzmQ+wr;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=fKzmQ+wr
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-17bc533fda3so3416892c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792481474; x=1793086274; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
        b=fKzmQ+wr0iHs17XveY4mXkajGBGI1YSvWf6kd9PPtzThe5D+aBCdFVWtMShsP3Gqra
         jKTDqQ9VeI2iwsS6AmcU0C4F7+Dn1v8uywxGAxmq5Ee/3jxeUJsbwUzp1JCIiTNKc7f1
         hIJXVhEY9efZoYUbxGTkrhE2M4jAx2oaXzOeFedPfGWqoiFoIrXr32nrCTrx8bNYXhV8
         3ykJHwUuksj4bIX0grzS6rgExvKmZJYMl/eltoSEyJlDdbPBHrF6mjEPAA0tZES3dFEM
         bRR+/7RzCIpY9Op9GPtst4qj9xvh8LAJbwsEShgGjEpeEwXr7B2vaxyFuSl9Q+rUgmhb
         UXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481474; x=1793086274;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
        b=T0nUGOWPfXmYQynJ+tvOQv3+SgQj942DdEbfz6aTSwAAGemRESaWTyyfTLSdhU8kvA
         4ZxNGTY/inkt3fpwT5dbysB4HitPuHbrBXVuF4ACASPbD1mnaBVl+JjDtDNmEDoa/wXP
         +xII1c5Lrm6KxK65i2TVtIrRZ1EthGQr6rIW0Xn+xp+pP7/6P5jIZlOxtbA0MDYzc4hV
         xvq0gte7FzN9sRnGBBIy1pYDBA3XBQ6LHFyl092ZfSudysw1YEWHCekHR4dIj8fjnCFh
         xjSqD2iVIv7pAVeYKqYlbc5dMSQ+3KmAJjvfZlbO8G9K+ueEHgFzihP0AtaHS+PRUsah
         G2gQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1W43Z1mqNDmF/HYsMGHRCG9//wG3UVI3oGzz2MRVkm5aW+eqANvldD+7n8b8bj3VIHlzASAkW11YrvZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdcXgP7s5m9VJo+k9MJljnhlm6BKL/bvCqzzjjpBEQiHaEcxu3
	NU7ZSWthVFBlYc2Z/MlwSY2q19IhaidB7SiZ8XL/g9dKOjX8iy9DzKFrHQ0LkNbaV/U=
X-Gm-Gg: AYBFou2qaf4JFEaQHoBw+6lXNcPL5tki+09niLlnEdgvlQy2hYC89XWLyYq/oPx0JC7
	TUxL/N+LUEkw0TgacCO8wmMQzPVp4ao2jBxw+U3JuUQgRtHWemYu94yuSfmB5qy421UW1e1Ho06
	G64Jm73++61R6cJEobEiiZ/r/hnXP+nUCHRf9pOkO5Rubk99z5gUfQsd8mVTKGHfA7YWaeKX2CG
	7IXvB2V+CJPcZ1q6Zd50Va9JNzzEP/rLlgwQIsI+BlaXGvBMEPX1UHYN6cDwEOqixStZ0d6iwtp
	KTSyJionGd5kN93FvQPJExGrvBFgHmNhuIgSogJfw4UGWjLsjot1xcruk9Z7g2zbYcq9z2+oTSm
	TfdrYEHWVSi64Cixvp638erv7rfDMPVwNX6qLCpUlQNwVAEDqATsa3+o98B6LuPRcEF4WkQmFm3
	RYp3QymEoSbJr58zATJs1cSIqN1TeRNfIK4HLDpEd6fUDKTsANPLTQA5kDbDQr0QkJ2K+U1nY=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr15634892c88.20.1792481473844;
        Tue, 20 Oct 2026 00:31:13 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm35059153c88.9.2026.10.20.00.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:31:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 00:31:11 -0700
Message-Id: <DM9HNFZ26I2H.348U7TRUKBLST@nexthop.ai>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
 <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>
In-Reply-To: <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>

On Mon Oct 19, 2026 at 1:25 PM PDT, Guenter Roeck wrote:
> This implementation is wrong. Support for relative mode should instead
> be added to the PMBus core. Or, rather, this driver should be tested with
> https://patchwork.kernel.org/project/linux-hwmon/patch/20240315151855.377=
627-2-lars.petter.mostad@appear.net/
> in place (with appropriate fixes for that patch if necessary), and the
> patches should be applied together.

Thanks! That is exactly what I was looking for, but my search for
fs1412 on lore didn't turn it up anything.

v2 will carry Lars' patch (Cc'd), rebased, with the driver reduced to
the MFR_ID check and hiding OT_WARN_LIMIT. v2 also adds the FS1525, a
25A part from the same family that is relative-only as well, so the
core change has two users. Fixes on top of Lars' version:

 - check VOUT_MODE for 0xff before testing the relative bit; as posted,
   a chip that does not support VOUT_MODE (reads 0xff) is marked
   relative and gets a bogus exponent
 - signed division, and clamp the user value before scaling it
 - fail probe if VOUT_COMMAND reads 0 rather than divide by it later
 - only update the cached VOUT_COMMAND after the write succeeded

We have a board with four FS1412 and one FS1525, so I could test both
parts with these patches on 7.2.10. Since your concerns in the 2024
thread were about how these parts actually behave, here is what they
do:

VOUT_MODE is read-only and relative-only. Both datasheets mark it
read-only. FS1412 returns 0x98 (exponent -8), FS1525 returns 0x96
(exponent -10). Writing 0x18 to VOUT_MODE on all four FS1412 is NACKed,
STATUS_CML reports invalid data (0x40), and VOUT_MODE stays 0x98.

Which commands are relative. The FS1525 command table marks
VOUT_MARGIN_HIGH/LOW, VOUT_OV_FAULT_LIMIT, VOUT_OV_WARN_LIMIT,
VOUT_UV_WARN_LIMIT, VOUT_UV_FAULT_LIMIT and POWER_GOOD_ON as "L16, 1.3
relative format". VOUT_COMMAND, VOUT_MAX and READ_VOUT are absolute.
That matches the list in Lars' patch; POWER_GOOD_ON is relative too,
but the core does not use it. The FS1412 datasheet says the same for
the limits it describes. Raw defaults, as a fraction of VOUT_COMMAND:

                     FS1412 (0x98)   FS1525 (0x96)
  VOUT_COMMAND       0x009a  0.602V  0x0266  0.600V
  VOUT_OV_FAULT      0x0133  1.199   0x04cc  1.199
  VOUT_OV_WARN       0x0126  1.148   0x1000  4.000
  VOUT_UV_WARN       0x00d9  0.848   0x0366  0.850
  VOUT_UV_FAULT      0x00cc  0.797   0x0333  0.800
  POWER_GOOD_ON      0x00e6  0.898   0x0365  0.849
  VOUT_MARGIN_HIGH   0x0119  1.098   0x0466  1.100
  VOUT_MARGIN_LOW    0x00e6  0.898   0x0399  0.899

With the patches the FS1412 reports in2_crit/max/min/lcrit as
721/690/509/478 mV against an in2_input of ~560-580 mV. Writing
in2_max and in2_min stores 0x012e / 0x00d0 and reads back within one
1/256 step. On the FS1525, writing 600 to in2_min stores 0x0402 and
writing 509 restores the original 0x0366. I did not exercise the
regulator path; the driver does not register a regulator.

Paging. Neither part implements PAGE. A PAGE read is NACKed and sets
STATUS_CML INVALID_CMD (0x80), so on these parts relative mode can only
be per chip. The patch tracks it per page, which also covers a
multi-page chip that sets the bit on every page.

Vendors getting it wrong. You were right to worry. Some things I ran
into:

 - The OV fault limit is rounded internally to one of four settings
   (105-120% in 5% steps on the FS1525), so only some values written
   to it take effect.
 - The parts are only partly consistent with their own command tables:
   OT_WARN_LIMIT and READ_IOUT are not listed for the FS1412, but both
   answer without a CML error, and OT_WARNING sets at room temperature.
 - The factory programming varies between parts on the same board: one
   FS1412 has VOUT_MAX 0xa500 and VOUT_MARGIN_HIGH 0xa400, the others
   0x0300 and 0x0119; another has VOUT_MARGIN_LOW 0x0000. The core does
   not touch these for hwmon.
 - The VOUT domain differs between the two parts. FS1412 reports
   READ_VOUT at the feedback pin, so it is in the same domain as
   VOUT_COMMAND and the converted limits. TDK told us that the FS1525
   reports READ_VOUT as the actual output regardless of an external
   divider. On our board that is 1.094V against a VOUT_COMMAND of 0.600V
   (a divider for a 1.1V rail).

   I checked what the FS1525 compares READ_VOUT against. Setting
   VOUT_OV_WARN_LIMIT to 1.5 sets VOUT_OV_WARNING; setting
   VOUT_UV_WARN_LIMIT to 1.5 does not. So the part compares the
   output-domain READ_VOUT against limit * VOUT_COMMAND (0.9V), which
   is exactly the value the core reports. That is presumably why this
   board's OV warn limit defaults to 400%.

One question before v2. The FS1525 over-voltage fault is the exception:
the datasheet says it is an analog comparison at the FB pin, at the
VOUT_OV_FAULT_LIMIT fraction of VOUT_COMMAND. So on a board with an
external divider in2_crit is in feedback-pin volts while in2_input is
the rail. On our board's FS1525 that is in2_crit 718 mV against
in2_input 1093 mV, with no alarm, and the actual trip point is about
1.31V on the rail. The chip has no way to report the divider. Which
would you prefer?

 a) Hide VOUT_OV_FAULT_LIMIT on the FS1525, so there is no in2_crit.
    Nothing misleading, but boards without a divider lose a correct
    in2_crit too.
 b) Scale in2_crit by READ_VOUT / VOUT_COMMAND measured at probe.
    Right while the rail regulates, wrong if it is off, ramping or
    margined at probe time.
 c) Describe the divider in DT and scale in2_crit by it. The FS1525
    would then need its own binding instead of a trivial-devices entry.

I lean towards a).

For other parts with relative mode I only know of the NCP3286 you
mentioned.

Thanks,
Abdurrahman

