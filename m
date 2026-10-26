Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033077;
	b=RGuuM4tzO/tJUnc2yq1m6AefGrtRrOyDe3CB3S+imXLUb7CRMEvRuBdX740dgyti8rBz
	 ywnvO2VMBn/Br1iDkHr3Q8HUJkFiMAdX7IMx2AZgEBGcDKn+SiiOwQdAPGknSW8qr7IpN
	 QbnvzU3Pj2XI0tzrSKqeykx5XD1Gy0ntHfBksywnXrUpW4hG4lKp71MH/mXkcSgaYhQeC
	 SADkY8gHlDljaWBt9PICCgXEF3hsbEZtphrMYvoSjrAx6iwl9gXMJaIW/ROEGoEeKAWJY
	 iAqi9nqKlIddpqKZK00QXhXKTluwdLggj7pR/SYE2VA0hlM71tfH9+cF+xM6zWkFuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033077;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=AFQJdAiGgN3fW1Ct+HsLIsRUW5WmUGGeAmWhxML3ipc=;
	b=A8nFZBzH2iM31/Jb4pKkfR9fqBHsGHJ27taG7L9cGMcI7h6of7zrEqkoV/bAlWhjqlpr
	 RXdW0Q6aDAmHY8v7kZbbPixal9pKDd/hh5o++eK9d6gSlJjRCpSl40gvK2EsG1+4y+3ey
	 fW9tM/r0vrN3Cru2qCN+C7SBXEd0dN37L8G9pUwuywt76ks41o43Ukd7ZKxHpCnJrVXyV
	 O8o+a6EJ89tGPrhDHGdac7WksjNqerWmlpSVthX7BaOcvLccHPr1AVW2Hf0hudV3JFUKq
	 lPCUIZALMR/ilCt+fSLvX/+d6aF0jf/2GJlMdK8cIcldGyJjQPfwpjNboAP7Y+CeREw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=T+B8WLiS;
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B057F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B057F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=T+B8WLiS
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 90333BC52E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:44:28 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 1127FBC613
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:44:28 +0200 (EET)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DF9931FEB7B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:44:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793033067;
	bh=AFQJdAiGgN3fW1Ct+HsLIsRUW5WmUGGeAmWhxML3ipc=;
	h=Received:From:Subject:To;
	b=T+B8WLiSP/NoyCRfN3R3Hd1SVRHUJM0krrUX10Q8GHrWCjBX0b3H1kCc6ppAMH8h6
	 foeGjozo6bQd3LrYDq4kLLd5n+TPT+MnaOHVtDedxhhSRrMKwOMRkmHalPLcCg8tPp
	 EGMSbvLZqSvdUm9oEyKROx8Gk7HZlcQzxhx/mmHnGdtAaeJlSF+tdSibajiBcxmSAB
	 jCVpY045nGiZZqpA2hC/VjNa5QI1od7jWOjK7z9O/RKU9xLG8wBhSqcHPba6NN2dwT
	 5N4hWFHjERt208jYKzhxh1RiM4vM76LS7gN5ZrFO9gdFswnXRk1tfmfjkjCDR6DH5d
	 B3ZGubpW78O4w==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ea7987517aso18255935ad.0
        for <linux-kernel@vger.kernel.org>;
 Mon, 26 Oct 2026 09:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzAXfovq+EKfxp0x4fdfn/C40FbJKs5vfBzAVyzyymvySAPsgj+ztq4ZuaXPacLCWpzN21mutACzLu14eU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXk9ZiQekyaFVHEFuSXTmBGZIVwjh4Hixfv4O7/2IbT8MJs6oF
	F1/4v9kxWq+Ln9p6LuE321YIiBvdxWVHRu0MThX0B4EN77S4fAD/2skV27/cbZ2ALZWOmMVc8R0
	sCtuiSBNCOLH+9Bpe4La620HcBynuqgo=
X-Received: by 2002:a17:903:3250:b0:2dd:b795:9cb6 with SMTP id
 d9443c01a7336-2ea9c63d703mr60076695ad.21.1793033065583; Mon, 26 Oct 2026
 09:44:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
 <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
 <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
In-Reply-To: <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 26 Oct 2026 17:44:13 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
X-Gm-Features: AclHuK9dGUF3PYf3eMe7nI2U44d9425QaJilwQrMRy5o1E9SAE9mLWiMo4Hv_n8
Message-ID: 
 <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179303306727.3339636.6109393179504495035@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

<snip>
> > SimpleDeckyTDP uses a combination of RyzenAdj for AMD and RAPL for
> > Intel. When set to 7W, users report 25W power consumption when using
> > the kernel driver and 15W when using simpledeckytdp on A8. 15W is the
> > correct value for a 7W envelope on an X840u APU.
> >
> > STAPM should not be required to use or deviate from STT. Both of them
> > should have equivalent behavior and match ryzenadj as the underlying
> > DPTC hooks are the same, ryzenadj just accesses the mailbox directly.
> > Using STAPM is a workaround for buggy vendor firmware that does not
> > control boost values correctly (SPPT/FPPT) and is what the first
> > generation Lenovo Legion Go did as well before they fixed it.
> >
> > STAPM as a workaround works because it uses timers to control boost
> > values, so they decay after 2-3 minutes to the steady state TDP set by
> > the firmware. STT boosts for as long as the device thermal envelope
> > allows. STAPM is deprecated by AMD, only STT should be used going
> > forward. +CC Mario
>
> It's up to the OEM to decide whether they have programmed their firmware
> to to use STT or STAPM.  They should not be used at the same time.

On BIOS configuration, not on runtime! The patches here based on RE
configure STAPM on custom mode on demand. I did not even know this was
possible.

The purpose is to make the "custom slider" behave. Lenovo did the same
thing on the original Legion Go because they were not setting boost
values, and STAPM decays to the correct value eventually. Should we
bake this in the driver?

> If their BIOS/EC is using one and reverse engineered software is using
> the other, you will expect problems.

Correctly implemented ACPI should 1-1 match both modes, so we do not
care what the manufacturer did. Caring means their boost values are
not being properly set.

Antheas

> >
> > This points to a BIOS firmware issue. You should consider getting in
> > touch with your MSI contact for feedback and to plan a fix. I do not
> > have an MSI contact. And yes, I am not happy my users have to rely on
> > third party unvetted plugins for basic power controls.
> >

