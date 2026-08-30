Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AD3839B4;
	Sun, 30 Aug 2026 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788097315; cv=none; b=VPsYKS7gA7jLYBw88N34qp+xZQjeZ2fMVLFju8BfNskvZzGA83sgjXC4bj6WzrDgz+/2BTvm5lUrdVTeNsDOBqZlzY15rYlxJHKZVWrLA853BbFPb1pxC6RMyOyYmCeOu7oOyZJIwlDoZPyYBSZDeYmCSBwBk2Vg7lYeWkvx/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788097315; c=relaxed/simple;
	bh=7dtriMKxRXX4Lsk/DomV1/ym2FQvXMsrZJDsf7xb2VQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fx/KVC1cYnApnBf4umyqiY+MLDTm8Z4oOCkQZpc0MxICehcIra1+XIIhYIltlaKHAAPj8PhOB2PaWuX1l2FemoVKtdhK/bsgWwlQXvP48K1BGfN8vzziu7OaDVgfW+pfngxRvJveqrdlbMPi2SG1SX5N1nI9SS4dSFVMZRNF4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FnHSzToo; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FnHSzToo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788097305; x=1788356505;
	bh=4lIQR+SxrGdvqWHtdhnkczAZ8UQBOyST39cxsDbCjaw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FnHSzTookIYA2htOfLviaM5/EB6Z+cHuVNadlA8mSDgyQbP38J/Y1s0d5eDN+N258
	 4hzMHluCas5mDxdF6YkzWnlAA55PGFkp2/WEjvJw2UkwF82sbaWmSGyAjtlkymMx/4
	 RaLRf5ody78VHGbzXLTD6rPpizUEQ8RqDJfH46zIiIfSH7DkKOUY/uQzAWbgjd9X3j
	 YBmGKzCNoMqiDGsEqBkA+gbm75Wimd8xb8rkIm78JS2fBFMtEWSsy7HQVATd4DpwhD
	 ZSr/DewoO1RcdhRGDBRJ+w45UsKtqtI+9y+nNg5MSIY8usER0iWfVPo9r5nV0TFS3P
	 gDlcIqOcAuUpw==
Date: Sun, 30 Aug 2026 13:41:40 +0000
To: Jakob Berg Jespersen <dev@berg.pm>, Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
Message-ID: <20260830134126.70277-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 2805229cf4eaa51c9f2979770813899d7a9fd005
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hans pointed me at this from a report I sent this morning about the same
GPIO type on a Surface Pro 11 - thank you, and sorry for the duplicate
question. I have now tested this patch on that machine, which is a third
model and, more usefully, a different sensor. Result below, with the part
that is still missing for this sensor family.

Tested-by: Sergey Lebedev <lsa.uz@pm.me>   # Surface Pro 11, INT3472 side

What the patch fixes here
-------------------------

Built on 7.0.0-30 (Ubuntu 26.04). The warning is gone and the rail is
mapped:

  before: int3472-discrete INT3472:00: GPIO type 0x08 unknown;
                                       the sensor may not work
  after : no int3472 messages at all

  /sys/class/regulator:
    regulator.1  INT3472:00-avdd
    regulator.2  INT3472:00-dvdd     <- new, from this patch
    regulator.3  INT3472:01-avdd
    regulator.4  INT3472:01-dovdd
    regulator.5  INT3472:02-avdd

Nothing else regressed: audio, Secure Boot and module signing unaffected,
no failed units.

What it does not fix, and why that is not this patch's fault
------------------------------------------------------------

The camera is exactly as dead as before:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5
  every regulator: num_users=3D0, state=3Ddisabled
  /dev/media0: 0 entities

The rear sensor here is an OV13858, and the in-tree ov13858 driver requests
no regulators and touches no GPIOs at all - zero `regulator` and zero
`gpiod` references in drivers/media/i2c/ov13858.c. So INT3472:00-dvdd is
registered and then never claimed by anyone, and the sensor is still held
in reset because nothing releases it.

That is exactly the difference between your machine and this one. ov8865
asks for "dvdd", "dovdd" and "avdd" by name, so mapping POWER1 to "dvdd"
completes the picture for the Surface Pro 7+. ov13858 asks for nothing.

The same conclusion was reached independently on the Surface Pro 10, which
carries the same OV13858:

  https://github.com/linux-surface/linux-surface/issues/2153

There they had to add reset-GPIO handling to ov13858_probe() and force the
regulators on, and describe the latter as too broad for upstream.

So: this patch is correct and necessary, and for the OV13858 machines it is
not sufficient. The remaining work is in the sensor driver rather than in
int3472, which seems worth stating explicitly so nobody expects the Pro 10
or Pro 11 rear camera to start working when this lands.

If it would help, I am happy to test a patch teaching ov13858 to request
its supplies and release reset - it is the same shape as what ov8865
already does. The machine is here and I can build and boot kernels on it.

One note for anyone reproducing this out-of-tree: the module build uses
/usr/src/linux-headers-<ver>/include/, not the patched source tree, so
patching only the tree gives 'INT3472_GPIO_TYPE_POWER1' undeclared. The
installed header has to be patched too.

Thanks,
Sergey

