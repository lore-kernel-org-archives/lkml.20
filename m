Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415869;
	b=IcewiFNAQXXVQFAytS4AP8PVkLvUOS7fBreyUlZrK+JgrfhoOGbPdBNqhWdcNYKETJxY
	 eKYPTuM9AWcFLN+RiGC8YEXvyPO7Pntxqo2KDdyETzFuNRNFZImpaQ17pvdaPBQCodA1b
	 zazjxjK6OVZYqvoOkyWARGr3eD1YXHd8jf60Y7yDDeUYlrIXlUigmTGlSxMRWyxtzFBb6
	 57XUTgaGKOh0Mf1wBngtJ+qKHBy4r9NJicv3wSFuQF6KVo+avQ0Hml+b/VxMSGYlqN/Er
	 lqdg3cSw0DhGxM0rcpb/4PPQdYvu+oly9PgZl7casGvkZTraMMDcmVP7Oelvx1CjV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gg3re7vfdE1PsPwfbeOVGKGJ4XbC0yjKrXDhwXuaVP4=;
	b=Ns6vJenW78SnUaLV6TyCa0sQCdWDJE2UvCKixpgkcaVbS3ZDnAmuCOzISZzNje3YcFYM
	 1bM7qQQGhNuzvY2xT2Tq0eU1XCXDchsCwaavxtUgBkF3c9PXMD383eH0jYmH8nSsa0OKw
	 x1TAwHuaAi70Ty5ZUgp+uBsTUBXs81GDWj55WtLKlX3s2mX0lzdznlPaWKuQQfqgyl8Z1
	 GQ/3BpmQ3Kwe2BoP4UQA7zDE+EKQp30C02xsfrHedngmX43THoOcZzb51+LJMfRCliYUF
	 eZ2E4JSfNNfuCOdIfaxMUFUOgJQbTSFzowvek482Fa/8BMNl3ZJmzI5l11FdqwXhhTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DpFIQAw4;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E4606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DpFIQAw4
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso1218652a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415869; x=1795020669; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg3re7vfdE1PsPwfbeOVGKGJ4XbC0yjKrXDhwXuaVP4=;
        b=DpFIQAw4llDvNG5hev7PFtpFHBY0O0Gx1r2iMDRF3rDzmMVzBttMpdTyEIIC/a817f
         kPw3q+yaFWD6wKP92abhdMfT1k1wfhjBi4n8FLvonfw/Rova2XV8BU8A1L2PI5CrRVSe
         YMFYI82jrSpje3YIjTWlAQkiwI0Cl7gQy5LX3P5D60tSbDgRPcuqdbDgQk35QBohd0Kf
         gjCps2EGCxVFY5zFSr6AsqnFy1pAxoglo4mWLkw8CbCXpbG2Yxg0MxIj2sjiNceSnzUe
         xSfAIS1MEtVqQ7rHC8C1ZluanraXLIGOsbeX46MD/MWVd54NkgnGBgIOKOQ/DuXMKJ5s
         gb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415869; x=1795020669;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg3re7vfdE1PsPwfbeOVGKGJ4XbC0yjKrXDhwXuaVP4=;
        b=et0Y63LxYh93K5AcHrcKE/8t2ZR4ajLdZyXPD2eeLx0BQqIQR/c6qq5TwFh8kYYEcW
         yOed3SnH+l6ecUhKwk45kePHyBUEpzmCfKqN5HHuZtvM56m9CHsfwGL0dCouf/BL0QkI
         GzmXG/ES74gD2EGRPXE7LJ7sbt01k1YxA9F36XpDPwIWFXaUMwfwn+byOEiVUt4Vtc6q
         AeFISi8nmjF55tKgd57wfF4OTTwYpyzT0hLoMEtYxZdwgutkh4ADd1KRkgEC1rhbM2Sk
         9ylWiAHZtU3oKD9aymCgpZhLxogTH3LoIMrBtbFjwetDpLXZElO75vzjA00EbSg2npav
         4InA==
X-Forwarded-Encrypted: i=1; AL+hErED7BVg0ECgmxq6vhgLdDeJtuTzsXJPr5xg+ZV3cJnKWKmq9srqyU4QiHD2P/Zm12+CcW4zVfqnPOOJ3Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AxZwEsUetcJNw1dN8vQV4lQQWVou0uw+WamB32iPwPz9MUZ/D
	PXVqWCfnAZUn/tDWIkiTPy5IK5Hz4LlZ1YWWQUJwoxvBoOl9YAihdlgkB3033KnFcYlWPCfu5LW
	t9gVy5Q==
X-Received: from pjbev6.prod.google.com ([2002:a17:90a:eac6:b0:3b0:e553:8f2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1647:b0:3a8:c0cd:57f9
 with SMTP id 98e67ed59e1d1-3b182f26a0emr3165414a91.25.1794415868591; Wed, 11
 Nov 2026 08:51:08 -0800 (PST)
Date: Wed, 11 Nov 2026 08:51:07 -0800
In-Reply-To: <20261106051726.3964374-1-jrhilke@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106051726.3964374-1-jrhilke@google.com>
Message-ID: <avSc-7J5JpEamGGl@seanjc-mac.roam.internal>
Subject: Re: [PATCH v7] vfio: selftests: Find devices that have VFIO selftest drivers
From: Sean Christopherson <seanjc@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 06, 2026, Josh Hilke wrote:
> Add a new script, list_supported_devices.sh, which prints out the
> segment:bus:device.function (SBDF) numbers and names of devices on a
> machine that have a VFIO selftest driver. This makes it easier to
> determine if the system is capable of running VFIO selftests.
> 
> Some of these devices are on the vfio-pci denylist, so vfio-pci refuses
> to bind them unless vfio_pci.disable_denylist=Y. The script marks such
> devices as DENYLISTED and prints how to enable them, so the user is not
> left wondering why the selftests cannot use a "supported" device.
> 
> Includes a -q (quiet) argument which prints just the SBDFs of devices
> that vfio-pci can bind, so that the output can be passed directly to
> tools/testing/selftests/vfio/scripts/setup.sh. Does not print the SBDF
> of a device on the denylist.
> 
> Examples on a host with eight Intel DSA devices:
> 
> $ cat /sys/module/vfio_pci/parameters/disable_denylist
> N
> 
> $ ./list_supported_devices.sh
> 0000:6a:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
> 0000:6f:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
> ...
> vfio-pci does not bind DENYLISTED devices while
> vfio_pci.disable_denylist=N. To use them, reload vfio-pci:
>   modprobe -r vfio-pci
>   modprobe vfio-pci disable_denylist=1
> If vfio-pci is built into the kernel, boot with
> vfio_pci.disable_denylist=1 instead.
> 
> With vfio_pci.disable_denylist=Y, the script lists the same devices with
> "(DENYLISTED, but vfio_pci.disable_denylist=Y)", prints no hint, and
> includes them in the -q output:

Sorry for dragging this on, but I still find the output painful to read.

To me, this does not make it obvious that the devices are usable/available:

  # ./list_supported_devices.sh
  0000:6a:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:6f:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:74:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:79:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:e7:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:ec:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:f1:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)
  0000:f6:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED, but vfio_pci.disable_denylist=Y)

Especially if I glance at the output of the "bad" state:

  # ./list_supported_devices.sh
  0000:6a:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:6f:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:74:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:79:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:e7:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:ec:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:f1:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  0000:f6:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
  vfio-pci does not bind DENYLISTED devices while
  vfio_pci.disable_denylist=N. To use them, reload vfio-pci:
    modprobe -r vfio-pci
    modprobe vfio-pci disable_denylist=1
  If vfio-pci is built into the kernel, boot with
  vfio_pci.disable_denylist=1 instead.

IMO, the blurb at the end is also unnecessarily noisy.  I don't think we need to
tell the user how to manage kernel modules.  I realize I'm setting a double
standard with respect to assumed knowledge, but IMO knowing how to load kernel
modules is table stakes for anyone running this script.

The blurb (and strictly speaking, the scirpt as a whole) is also somewhat
misleading because it doesn't actually verify that vfio-pci is loaded.

Rather than squish everything into a the per-device output, what if we organize
the devices so that it's more obvious what is what, and so that the output isn't
as noisy/redundant.  E.g. something like the below.  And for the -q output, it
probably makes sense to also provide a flag to show/hide unusable devices.  Probably
to show?  i.e. have -q output show only fully supported devices by default?  And
maybe fail -q outright if vfio-pci isn't loaded?  Dunno about that last one, not
sure what would be the least confusing.

If vfio-pci is loaded with disable_denylist=1 and there are both allowed and
denied-by-default devices (ignore that they're all the same device):

# ./list_supported_devices.sh
Supported
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

Supported (on denylist, but denylist disabled)
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

Versus if vfio-pci is loaded with disable_denylist=0:

# ./list_supported_devices.sh
Supported
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

Unusable (available, but denylisted by the kernel):
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

  To use denylisted devices, load vfio-pci with disable_denylist=1
  (or boot the kernel with vfio_pci.disable_denylist=1).

Versus if vfio-pci isn't loaded at all:

# ./list_supported_devices.sh
Unusable (available, but vfio-pci not loaded)
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

Unusable (available, but vfio-pci not loaded, and denylisted by the kernel):
  0000:6a:01.0 - Intel DSA SPR [8086:0b25]
  0000:6f:01.0 - Intel DSA SPR [8086:0b25]
  0000:74:01.0 - Intel DSA SPR [8086:0b25]
  0000:79:01.0 - Intel DSA SPR [8086:0b25]
  0000:e7:01.0 - Intel DSA SPR [8086:0b25]
  0000:ec:01.0 - Intel DSA SPR [8086:0b25]
  0000:f1:01.0 - Intel DSA SPR [8086:0b25]
  0000:f6:01.0 - Intel DSA SPR [8086:0b25]

  To use denylisted devices, load vfio-pci with disable_denylist=1
  (or boot the kernel with vfio_pci.disable_denylist=1).
