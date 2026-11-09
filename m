Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794204725;
	b=AlWi7CYAFv2lzxhdYYdGK8x4Bmfg+t5dt37ifPo0+rs7fCOvidABVTeOU68ammoWufzz
	 OqTbZebvzZpRyFPgN1dbugI6q+Fb7K55Oydb5mPp4JWqoryHlmhpjCcF6TvpJVTY/vh0e
	 CWZMdYozXWa6jTQCat3uEvqbv5q/Jcg830WxX/1nR4F8LhKrANIubOUTfUud9yw61ont+
	 pjzXQQ8ZV/9J+9SFVG2LF7ahOKNPxi2JexIgcySmC8Mdg7x4lJEu2dt0PwY1+OKOP3nU/
	 2bEMwYvZjq8WezMnMI/AGpNhLhtarubPkgZ1lgk90XnvarkfoTfNqcwcuu/FpoAEFMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
	b=1yHtwNSE2wJFuImGuTGC78Fxoc47znEnPrRn46F7zrifIoB2JI1UyDWk0kVNVfeSii8q
	 nx1dGywTRYH7WHSZhz+wkxQe77hxitLoq7RaHmtRjcqcqgAIGZb4hbSOGKldJl8OmGzLK
	 mRzBwfaSfeYgiiVbeBo8S84ithxMNnXy3bttDHh3m2jhHBZo2l7Pem4O3ljI3cJ0M5sEk
	 IibFLHQ38xv4BUuVUfuXNCyJ1/+vOIQcznHJwIa8xcH4ngpH9aJbnYS/Nj7Rw7b7h1B11
	 s0u52GNWf4Vwh3a4T1/D8pBvXLhyCo90N96wAgcgsMP/X5JVojkInviT3iprWse3JgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKnGex+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E8606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641E8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKnGex+G
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b305e10ac7so3826587b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204724; cv=none;
        d=google.com; s=arc-20260327;
        b=cwhKKgwvOGFynpg9i0mJui5UcDELZ8LecDh8CO3so835qbpJ9zx+jQ0U33U+eXQo1W
         BD5LD5Y6eLe+sxkSsi2NneBRJg9FDNdmcN2AC4KZGH+G1OhOFy3X8eluk+zDvvBLEde2
         xI8mRHZy/zA1Lyhhvz93sTpsZVP47y38YpzRMCDD7wU4LJJRvyLtFYmyqTSvww4PLl4g
         +yv9NeFT914BOCKlXqTtDndpElNnCXnfOn2cDhEO/F/K2lcmYG2fCeG08EbAqI+6Q8wD
         V7JqYW2rK56WlQdsQHVRS/+XATJoj/Y02Fy/LpjEsnAiQXj2lPxjKyHMDzphqucqAoyH
         xzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        fh=u3+AeTedvAmxx+MMku2OFUQIxjyK48P4PpOtiQxVNj0=;
        b=st8zsITvmo/qQ1b79aqatDZqlU15VI6/FCnOPdcN9ypCdAV2/EydTzmBEiUBhCZ2oF
         6k6/dE9beFZylVZ1OAiGyhMtvzGUQQJ86YLy9bKZwy7Cr5ZL65fygXnvoSR7swP8T+M7
         HNB1XdCDAqAhjNacbaLVkKp/y6IsOmyenGMUqTF/fkumYJZDPSsRHw1/NSX/Nv3tZv8g
         3gwM2T2UM+XmNrpx8Culqrd4VlFBJZvVBt2dyO0AMNnjtu8e1zfAQ5ECt5oJOdAY8B+d
         KYfEDxa5Q0+DlpVQaY9OKo8FO/Nzvwk2xvaBDRR4dl9WssN46+q8Um9TMoe3pv9MeTi6
         bAYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794204724; x=1794809524; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        b=WKnGex+G/cKP6A1NhDl3NmCiSVw/c/Sp/CUxgKtnQInebXpNWsaOFFZZiGY0dqX2ns
         u3XfjfPTFslNel+2LfEaC1xyddnwoXnwC5tOXybzLx0rUT5JF2jtTtSidKzdfoucQEKp
         SJDhyPX4PGQVduRhMIyp6wmZdnt/3ox6Ajmyt61ruDps/AL8GtSzYQEC9WddYqNh4+9d
         LgDtAYJNhyKJgAmq5alHdBrVH5//6JH2F4EDLNHnzrI4hkFfSMKFbReBAkcxuLuu3My2
         p/Vi88SBuUGt98Yfy4JkHbBFJPPaKaoCCCFqFlvA4j6U5AoDXhaTn8PZn7UAZxaSc26O
         NCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204724; x=1794809524;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        b=wQk10fEEowlA4cRPQC6l74HufhKEnM8299i75GAOSscx7qw3LJy9kcWX77hnzGdMG0
         JBLh22oDbackWSEuBnaWUpuiYa4IvWKqp+8Kyv6cd9jW5l6T5475bFRDm7qey8sNr96f
         K6ItW8t8RhDHjcFdRrW/K7qhD+hf7lgF+pLI13peszH5MylnRSLUXGul1c0MNxXAqTRA
         jlVqCQ1J/FbZM2K24tyCYdf0goaC7hHuPiEmi88iNja9fw0Jpgz0+LIoI5wmU3uASpfF
         XFt0veG21UJ59xu/gUrqvNE1ADkjzSsLLmPT9pqW4MerbaEiQcJq38oLrjJzbd2+S3j1
         gDoQ==
X-Forwarded-Encrypted: i=1; AL+hErEuAtq0daLW7DLb3EAWmeGdEqrpmLUEi36cAqQBhrp1LB7L61BSHLHm37NieaiwFqTUKeo36C12ZgtXfKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AKE5wjnpeqicW88vGscYERRJVpUvpZHbZ07e8uAdWabvvMVdu
	f70X8wza56I960+xDO3gRl7hru2Rfnp3WRhZSKtmO4oYaPIBwCFCh3aQHNDrT3sBjQIzR1OTRjL
	CxvTZg8hiCvAuD6RKgoe9A+w8eO++JgCAng0MLBP5
X-Gm-Gg: AYBFou2sGIAYsI8uuDpjO452lWUxTZs1+a5/RC53iNF7nrLEU7lwIfzu4tYHMZqipO/
	1//WepOxRd/FP8clzIQG/DDy2aZDWSZnJ05+sYkYiuqKw54noEsi+/Zo8JG+sNPCHjtN15LMTwZ
	kwE6qvFGN/sHF0S8bTBmd41orkX5NLX8Pw1vJKW2MvOr3HWyf9NGWGPzgApAXpcW7OLjmC2CYjW
	jGvTw04UT7stkUGNC7eki83e6HsviMX7NxOS/RsjUZCr6jgOnvj2oYz6JIJw/tGtS3WNfR4SBEF
	XqoJyGJRd+rtl/2kIN/2pqtKPG8UrQebtJP/hmIodHzimKqRxk7RDWSvIsATA7IIBek4DiHF4oT
	ULHP9LGUTqxgxyS/GhvqldWCMKjL+05+plCSHyxvSh2sPLfROoR2NZ1P+x5ZT+b/qGQ0=
X-Received: by 2002:a05:690c:800e:10b0:8b3:2eb4:1429 with SMTP id
 00721157ae682-8b36cc69bfcmr13058457b3.65.1794204723670; Sun, 08 Nov 2026
 22:12:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <arZTphXbVF5wagy2@shikoro> <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com> <at8xuIWvvqLoicTg@ashevche-desk.local>
In-Reply-To: <at8xuIWvvqLoicTg@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Sun, 8 Nov 2026 22:11:52 -0800
X-Gm-Features: AclHuK8twAQYbIjqqABuLJ8N8Enju4jqOkg-3e7B0XPw1E2pL1zthrnIjVf8EtY
Message-ID: <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > [...] production BMC firmware update
> > and recovery daemons running in OpenBMC server fleets (managing Caliptra
> > Root-of-Trust and SoC recovery targets over I3C), as well as production
> > server accelerator management daemons.
>
> Okay, but they are not (obviously) use the upstream solutions for that.

Right, they run on vendor kernels carrying out-of-tree i3cdev patches
based on an earlier version of this series, so there is no upstream ABI
to stay compatible with. This series already departs from that ABI
and v6 will change it further based on the review in this thread.

> But it's still unclear to me why this can't be moved to the kernel space?
> There is no user space that communicates with upstream kernel in the way
> you described, they should have used a custom (out-of-tree) solutions, right?

It could be, and the closest in kernel fit would be an OCP recovery
i3c_driver exposing fw_upload. But pushing an image is only one part of
the spec, and an in kernel driver would have to cover all of it, not
just the subset one recovery agent happens to use:

- status and identity: PROT_CAP, DEVICE_ID, DEVICE_STATUS (with
  recovery reason codes), RECOVERY_STATUS and HW_STATUS
- reset and boot control: DEVICE_RESET with forced recovery and
  flashless boot, and multi-stage activation through RECOVERY_CTRL
- memory spaces: code, critical logging and vendor-defined CMS
  regions, through either the indirect window or the FIFO interface
- the VENDOR command and vendor-specific status, which differ per
  SoC vendor

Which of these an agent uses, when to trigger recovery, and which image
goes with each stage all vary by platform, and the BMC's userspace
already makes those decisions.

An in-kernel driver would need new sysfs ABI for this, and that ABI
would have to grow as the spec evolves: v1.1 alone added multi-stage
activation, flashless boot and the indirect FIFO interface. With a
target-scoped transfer interface, none of that needs kernel changes.
fw_upload and lib/pldmfw fit well where a kernel driver already owns
the device; here the only consumer is the BMC's management stack.

The kernel already splits things this way on I3C for MCTP: mctp-i3c
binds by DCR and provides the transport, while PLDM firmware update
runs in userspace. i3cdev could be made to bind the same way, by the
OCP recovery DCR, instead of binding to every unbound target. Outside
I3C it is the same pattern: nvme-cli does NVMe firmware download/commit
through the passthrough ioctls, and fwupd updates devices over hidraw,
usbfs and drm_dp_aux_dev.

So the kernel side stays a small mechanism consisting of target-scoped
transfers to explicitly bound devices, and the recovery policy stays
in userspace, where it can follow new spec revisions without new kernel
ABI.

> > If you mean electrical bus recovery, i3cdev doesn't perform
> > bus-level electrical recovery. It only submits normal target-addressed
> > transfers via i3c_device_do_xfers().
>
> But how it will do if the i2c device blocks the i3c bus in mixed mode?
> I mean, how will it affect the i3c transfers on the wire?

Electrically speaking, SDA and SCL are shared, so an I2C target that
holds SDA low blocks every transfer on that bus, I3C and I2C alike,
regardless of which driver issued it. The controller reports the failure
as a NACK, arbitration loss or timeout, depending on the controller.
i3c_device_do_xfers() returns the error, and i3cdev passes it back to
userspace from the ioctl.

So i3cdev behaves the same as any in kernel I3C driver on that bus
since it uses the same transfer path. Getting a stuck bus released is
up to the controller driver rather than i3cdev. For what it's worth,
section 8.4.1 of the OCP recovery spec recommends a pure I3C bus for
critical recovery paths, and for mixed buses requires validating that
I2C targets have spike filters and considering isolating or
disabling the ones that can't. I2C devices on a mixed bus are also not
allowed to stretch the clock.

> > On a mixed bus, the Linux I3C core already
> > configures the bus mode/SCL rate according to the I2C targets' LVR
> > spike-filter capabilities and serializes both paths via
> > i3c_bus_normaluse_lock(&master->bus).
>
> Good to know, thanks!

One correction to my previous statements: i3c_bus_normaluse_lock() is
a shared lock that only excludes maintenance operations such as DAA.
The I2C and I3C transfers themselves are serialized by the master
driver's own locking, which is what keeps them from being interleaved
on the wire.


Thanks,
Sam
