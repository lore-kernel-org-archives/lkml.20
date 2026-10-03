Received: from mail-pz2-f3.google.com (mail-pz2-f3.google.com [74.125.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1200379C5F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021878; cv=none; b=tn2aNi9sbYEqRnOqqHKZ3s/x3VU0eEPYM/g546XsYKNszdvsXeBX8r2+vWBdfifFtTQeMkooG00Yi1+GcNwGHbpGRPg183kNNPES82/gIjvc8h78LOxzWY1fCSqw66yZsSDt29C7T5O3sVG4rzLSXOs6g5Bx0bOW1oX3JxWK2k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021878; c=relaxed/simple;
	bh=O4fhyAKEtLoyIjrYd1doUUUlI2ZyKNVlzH5Eu6cpoZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyEIsrRmWdiBsTmxbUOoH3LjnfagSABilRArnFcnFgrq71VzNx80l+SzBFSyJ5Db7RQFyG1hlxdmAzPrjsuBjuYr3BVghe1mtYOr1Ql88vxXaT0cEPmiojJCPKbJdj4tIii9K99TOKEtlqdfBE2Ta74ZXEz8uV9a4FGqo6D184E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mP5aWTLn; arc=none smtp.client-ip=74.125.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mP5aWTLn"
Received: by mail-pz2-f3.google.com with SMTP id 41be03b00d2f7-cc78c03d45cso34345a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021876; x=1791626676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHYEahD+HEjWATdVIsFuXWmcHH7Pn8DgotCON/mJvLc=;
        b=mP5aWTLnUR4giJM0Wv+HQ7BDprXNG94S/a7TP4df6Ec8WVyp9GUIpGtgoAnev18yKL
         CxRLIO6PfLMhDMRZDEsB4WwBNnrYRIbs5TUJ3oE/6clu8IqGxqM3vInJ0aQUi8UwYOUy
         uq0zzijuUJOTk4LjTreBroCMX6a+IKLrLrYawIreVhwLrGRBjdNO8GPtXz2hOfUKZxGD
         nFnmtjDdEJoo1R4VUHEHTon6TEjyLC3Bsvc6oCBxYyuYnRLBXU/DswcPaZtpf4cz+6Qd
         xubFuHv7O9u/PDDSn/afKff+Kkfpp6Rrr2bshC0V7shtGU8DCBMUvLfCbo4V2mnXAxDK
         afZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021876; x=1791626676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHYEahD+HEjWATdVIsFuXWmcHH7Pn8DgotCON/mJvLc=;
        b=ijgCv+tTLavpIn9Zxb448hXe2Cm2MkK2dGJQ6aXxKjaA5D1+CXaAsgm5pmfY5LRbJ1
         l6oyXdFLz2Rapt8ZrkRXUgB9wvriPZEjWptMfDd5zUODsAFZRHlXjHwC/3YmZwl86k8B
         Zumn5XqlGSkD47sLdn61TX1gGQYRnhb/lNG9qi2k9PU2EQElvON00BiFY9yhuzG6U2Pu
         MKOs0KNPlOb4bSrR23gEgzWe/XKP0GxxlMnMUJ3mQv6Fp2QTKIY6DzR1IIJDDJvUDGgU
         KAe0da0wXIsjL5kR2CUy2YwBrS1x3xbJFoD9vOvzm7EzBxEaOseiedkmEA5mEnWT7Vk7
         c5rA==
X-Forwarded-Encrypted: i=1; AKwUvBxZwHVddVdv37zEf0M7ZZK4jmhaxq4LeaqjZrcb2QnNDpDRzQyTHncC5uvPXB+4WQKxalzRsTXZMFtvMaA=@vger.kernel.org
X-Gm-Message-State: AFuF++nXDnGhxIJV9/BVqTJfhbv85naXwKnDC8uYxl5WTE9w905IE6Lu
	zVrWFOCERgMVJ9U3No6njYhOjUF48Y9skUNKXct0lkujb9eBCDNlkM5o
X-Gm-Gg: AYBFou1zkZrp8LM7a10sDzCjehGiz/meW0fgO/2gQFi30Q6Q5+XzuJmjwu468IQDN0b
	+dKyOuUCgD/7IS8E9VhSDZhm9T1UeTX3Qec2KMnmPztfdhJQD1Nla6tCLvC6aNMu9zMJsWj75qv
	4ULyWYxgndavk5fkmsS0igAmQPbQ7nzPKB6O+6ufk2Xon3OM+fIUWn0Fky+kukzwnHHATyM4Emf
	3m058BowrPtAKoRZ9gQ3J+pcZhO6CHqG9jzymd55NVh0e0ZN8DJ5EW7xKFIyiaE42GRh3KNOCmy
	f8NYmuTJP/IuhjFeuwmeuCuNPVhH6fAUAk6UgTPSPX14TTZ3636YNqh/MHEmpUk/fY617TUG+SA
	q+cJ7cQjwoxARsRa+fDI5CJpjVIYM5megmvWu5OBntXjfiQs0jz8OE7sbOOOt+F7pEx4TWi5PdB
	t6gS4DnyYzNpM/seAzbOn1FnoY9b9CKcLCe0crLJp56yceZ+q2PrATgB0fV8H7yeou2zAHhYhov
	hA=
X-Received: by 2002:a05:6a00:b50:b0:874:708d:b62f with SMTP id d2e1a72fcca58-88c628f240bmr1630063b3a.27.1791021875942;
        Sat, 03 Oct 2026 03:04:35 -0700 (PDT)
Received: from ThinkPad ([240e:46d:7b20:7df:1ddc:2f29:f17a:97e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88caf6b0bfdsm376019b3a.29.2026.10.03.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:04:35 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:04:05 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-media@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH v2 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST
 VD55G1 on Intel IPU7
Message-ID: <asDSmOu2NMD_SFnr@ThinkPad>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>

Hi Ruslan,

I did some more testing and checked the saved logs from my original
next-20260928 tests. The VD55G1 failure appears to be intermittent.

Today I managed to boot the original next-20260928 + v1 patches 1-3
kernel into a state where the VD55G1 probed successfully again.
`cam -l` showed both cameras:

  1: Internal front camera (\_SB_.LNK0)
  2: Internal front camera (\_SB_.LNK1)

I then ran the libcamera test you provided:

  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

The camera was configured as 804x704 R8, but when capture started the
same I2C failure appeared:

  i2c_designware i2c_designware.1:
    i2c_dw_handle_tx_abort: lost arbitration
  i2c_designware i2c_designware.1: controller timed out
  vd55g1 i2c-TBE20A1:00: Sensor reset failed -110

The IPU6 ISYS path then reported stream stop/close timeouts and failed
to start Intel IPU6 CSI2 2 with -110.

I also checked my saved logs from the original testing. They contain
both successful and failed boots of the same kernel build and command
line.

In successful boots, the media graph contained:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

and /dev/video16 advertised GREY, Y10 and Y10P.

In failed boots, the sensor failed during probe with the same sequence:

  i2c_designware i2c_designware.1:
    i2c_dw_handle_tx_abort: lost arbitration
  i2c_designware i2c_designware.1: controller timed out
  vd55g1 i2c-TBE20A1:00: Sensor reset failed -110
  vd55g1 i2c-TBE20A1:00:
    probe with driver vd55g1 failed with error -110

This seems to explain my earlier results: sometimes the I2C failure
happens during probe, so LNK1 never appears; sometimes probe succeeds
and the media graph is created, but the same failure can occur later
when streaming starts.

I checked the basic sensor power sequence during failing probes:

  - INT3472:01-vana is enabled during probe
  - the active-low VD55G1 reset GPIO is deasserted
  - INT3472:01-clk is prepared/enabled at 19.2 MHz

The "Sensor reset failed" message above is reached while
vd55g1_wait_state() is polling the sensor over I2C after reset has
already been deasserted.

I also tried forcing i2c_designware.1 runtime PM to "on". In another
test I prevented vd55g1 from probing at boot, waited until the system
had been up for more than 10 seconds, and then loaded the module
manually. Neither changed the failure.

I rebuilt the saved next-20260928 + v1 patches 1-3 source tree and can
reproduce the problem there. I also see the same probe failure on
next-20261002 with the v2 changes already present in linux-next. So at
this point this does not look like a v1/v2 or
next-20260928/next-20261002 regression.

For completeness, I also ran into a separate intermittent boot hang in
thinkpad_acpi hotkey polling while doing these tests. Disabling
CONFIG_THINKPAD_ACPI_HOTKEY_POLL makes boot reliable, but does not fix
the VD55G1 I2C failure, so I currently believe the two issues are
unrelated.

Have you seen this intermittent arbitration loss on your X1 Carbon Gen
14, either during probe or when starting the VD55G1 stream? Is there
anything about the BIOS/firmware or I2C setup on your test machine that
would be useful for me to compare?

I have complete kernel logs from successful-probe, failed-probe, and
successful-probe/failed-stream boots, as well as the saved media
topology, if useful.

Thanks,
Qiling Zhu
