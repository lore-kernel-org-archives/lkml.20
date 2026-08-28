Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A6360EF9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931306; cv=none; b=V433017IAwyQipuTIcgEjw0JLkK2N+Y2WtSs3gM1R35bZE29OGX1cDadUXKs2OLw6rbTRwlJH9SjN2X9eBm6m74TH9CnUsJ0ivdFLP774CiLimzoUNlIs/rgz6UBm6JnAUnViXGYNhtwAlSa8jARGxATHXKA21lDiq9moO+/2Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931306; c=relaxed/simple;
	bh=c/t9wvTrRm3cNtaiF1yv0aTmAvMyzHTd2ks5sPAyh+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Km7tNYsvLezXMv1eshagC2hMGOuHg4rcszU2vw3rECbcuQu7aaFtLhwpxZMdTM0okIuuhmuO+Z0cwMIrZLmVoU9T+/eHrSKiRb2oxyYund8V1gZDEjoDTlwdnYXODytYUHnZGwSKby6aNq3o1koLVZ/Ot4OjnTKnneZrUVqkBgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPiENSN4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPiENSN4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4815bce4652so878007f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931303; x=1788536103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qLyJXx3vDV6RKEzodqCE4zKvUZXhtE2BMX7guEURaQ=;
        b=jPiENSN4GoR5xzo5GAvIeeKAc7FTcAvSjwrqcKLQ8zhuJwTPBqzaRx53Brshn2MDqo
         piVDJH5QOYvSEhfo3Zn2M5yhndEPBFBd49ZGCOaCt1qzxtnDxN3R8ldCt53YQku5waQo
         sJq5VBwbD9adLJ0SMjq0v2hTUTjFqkcMQ0kJ68+CVBiX8CT8sHk1N3rDgIzWRGLqYejK
         4mtEKHoJYKHaB+28Dx4BKSyWuY06IKELnL4Oy1Zolwnzco922fxIxiujL8oj5xtgOBGp
         SII1bTufyk1+XmHaNhHolJU5ZDt+9CuEkH3FTJV7lh11iIVAYYypJKMNc0+REP/GfH8O
         +IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931303; x=1788536103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qLyJXx3vDV6RKEzodqCE4zKvUZXhtE2BMX7guEURaQ=;
        b=KEHamRLtsxn2FHB7cSzjLkx5Ee+SmA/iMnNAbMJ8VYm1kxu5FE5dSHzx20KWAyZk1X
         j4HpDgSD7gIQRqlaqrVXSNJ2Q2YSNIDxxp39bplJyw39bJAMaHhllhoH8ZYCtkLePAuu
         vz/VwZc/SF2OAw5r8bjupkYbvVA3cbAyXWaQnNtJ7T644atudmFJD8s+q1QOuNju4vSa
         42/7VOiWsrXuws85N+6c9NLdkgqfs7S2sj9mPErqFTcQxSn0bg72AwoxBN3KDI9joM52
         LlMy7rgjtW1SopzNolZ2xXbrwarmkAUq6Y4lxkcgYdqvbVCrzz26bFxCjeJao+4Wt1Ma
         rEMw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4R4Uytjb33C5RYHJlYAAI91FAmH3hwbh8+GAUyB9oQgfCASE5nATr/dhzNIazeEU9iaeBW/HlHxyortk=@vger.kernel.org
X-Gm-Message-State: AFuF++mmtf9lFx5fqKdJxC/+TSmtJjkaZFq7Sddkcn6fsV8eINWGAd1J
	8SaOZas2CHaxtWxW5mUGx/71twds0ph7sX+Qr1KByLcGjivyG03IoTaa
X-Gm-Gg: AR+sD10jHAzLAh0cuz8almGoYf0mycHr92zDnjY22rquE/NhS69c5+fjrggAyvhqawg
	eFL2P+W6nydZxSQ3uADN2rJOTf+PMVSx+mz5ObIQWE8js09MacqC5WQcvNQI2vJdspoSnuFh0m5
	nXxz1cP9Twj40t/VPDqdEKVbvAweALspmfa+xkpmcqQzMvpZcqdlHjLBXzybb3F3AzWRpXqfXTl
	1WG6pwAN0Es9jKqiw/lprOiVWncC+VqC/0mo73rLkFp44bTi53GX8Lhj6FcPwiZu3ZOxjs3f4fR
	buCZPR8Worw/P0eS7rtSHPzMe1hbmg720zoTF4ssvJ5udEyfDOfzXXEfH7ctwgOKi1Oz17PWlPm
	mDRUdezs7XawaP0LJsOAKBY4dPQwiXCtlJU3f8rZrCphmAuw4X0u2tXB3e+McIlLfMmpiZ85l5P
	R8/2Nssgkq4STRYBz5/tisqTe+S6C+II0HdoKJEjjLU9mu5nLbzQteWDrES/syXh3u0q0lRMqEI
	oksutuUH5JSl8yRQUaOCWlkiZiGOyxdmQoEuFu4IfsvcDhs0xqhwe2wQJNdVzAJ98rVvkcc6o9d
	SsC8h7YBxDbjN0I=
X-Received: by 2002:a05:6000:4705:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-482f7988875mr13087444f8f.1.1787931303054;
        Fri, 28 Aug 2026 08:35:03 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm4453038f8f.5.2026.08.28.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:01 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Fri, 28 Aug 2026 17:34:58 +0200
Message-ID: <20260828153500.31556-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apGbnVqQczMrzoUg@kekkonen.localdomain>
References: <20260826072002.14357-1-robertbozik@gmail.com> <20260826072002.14357-3-robertbozik@gmail.com> <apGbnVqQczMrzoUg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for the review - that is a lot of detail for a 2800 line
driver and I am grateful for it.

One note first: v2 crossed with your mail. It only carries Conor's
binding comments, two fixes the Sashiko bot found (pm_ptr() instead of
pm_sleep_ptr(), and the control handler freed on the probe error path)
and a trailer reorder. Nothing below is addressed there; it all goes
into v3.

> Nearly all of this belongs to the cover letter -- here you're expected to
> say just what the patch does [...]

Will do. The commit message will say what the patch adds, and the
measurement detail moves to the cover letter, along with the long
provenance comments in the file that you flagged further down.

> Is this needed? The DT bindings suggest otherwise. :-)

No. Dropping the ACPI dependency.

> Please calculate this instead of adding a comment.

Will do.

> This macro name suggests it's a register address, not value. The register
> address should have a macro associated with it, with a human-readable name.

Will rename it, and add macros for the timing register addresses,
including the ones behind the fields in struct ov32c4_mode.

> This isn't really specific to the sensor, is it? It'd be nice to know what
> this required write is really about but it sounds like there's another
> device there that needs its own driver. Is it found in the system as a
> device (see what's under /sys/bus/i2c/devices)?

It is, but as the wrong device, and I think there is a problem in
ipu-bridge underneath this.

ipu-bridge takes the VCM model from ACPI and does not verify it:

	sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];

Here SSDB.vcmtype is 2, so it instantiates a "dw9714" client on _CRS
resource 1, which is the same address my driver writes to (0x3e). dw9714
has no identification register, so its driver binds unconditionally and
cannot notice.

The chip at that address is not a dw9714. With the sensor powered and
the dw9714 driver unbound:

	w2@0x3e 0x10 0x01  r1@0x3e   ->  0x04   (what my driver wrote)
	w2@0x3e 0x10 0x00  r8@0x3e   ->  00 04 00 00 00 00 00 00
	w2@0x3e 0x00 0x00 r32@0x3e   ->  all zeroes

repeatably. So it has a 16-bit addressed register file and retains what
is written to it, which a dw9714 - a write-only DAC with no register
addressing at all - does not. Its lens subdev has zero pads and zero
links.

I could not identify the chip. Only a sparse block around 0x1000 and
0x1010-0x1018 reads back non-zero, and I found no ID register. It has no
ACPI device of its own; the only other unbound I2C node on this machine
is TXNW3643 at \_SB.FLM1, which is the flash module.

Without the write the sensor NACKs everything at 0x36, so it does gate
it somehow. The Windows driver issues the same write from its sensor
driver, so there is no separate driver for it there either.

So I agree this does not belong in the sensor driver. What I do not know
is what shape you would prefer instead: a regulator provider consumed as
dvdd-supply would mean writing a driver for a chip I cannot name, and
something would have to stop ipu-bridge from claiming the address as a
VCM first. Guidance welcome.

> These belong to the int3472 driver or the ipu-bridge.

Agreed. They go away with whatever the answer to the above turns out to
be.

> These are 0 and 5 ms, respectiely.

I am not sure I follow - could you say what you would like here? The
values in the patch are 5 ms after the supply and 20 ms after reset,
arrived at during bring-up rather than from a datasheet, as there is
none.

> Is this required?

I will test without the retries and drop them if the power-up sequence
is enough on its own.

> That's not right, these are in pixels in terms of the value of the
> PIXEL_RATE control, that reflects timing on the sensor's pixel array.

Thank you - I will correct the comment and re-check the arithmetic
against that definition.

> There's (typically) no need for get_frame_desc() op if you have a single
> stream.

That was my assumption too, but it measured otherwise here: without the
op the call returns -ENOIOCTLCMD, the receiver is configured from the
media bus code alone, and the IPU7 then reports one oversized packet per
frame. I will re-test that for v3 in case something else I changed since
has made it moot; if it still holds I would rather explain why the op is
there than drop it silently.

> No need to check for errors here -- v4l2_fwnode_endpoint_alloc_parse()
> already does.

You are right - __v4l2_fwnode_endpoint_parse() returns -EPROBE_DEFER for
a NULL fwnode, and the comment there names the IPU bridge case
explicitly. Dropping the check.

Everything else - pm_runtime_get_if_active(), setting the control flags
after the handler error check, v4l2_fwnode_device_parse() moved up, the
error checks on __v4l2_ctrl_modify_range() and in disable_streams(), the
definitions from mipi-csi2.h, unsigned int for the loop variable, and the
debug prints and redundant comments - will be as you say in v3.

Thanks,
Robert
