Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886520;
	b=oNakaluLz3X0KarCxjcxE17cfOxh5D5XURqNH3gEM49RIDyfm1l/v/D+Gz1cg0mn/nBT
	 1J8tgQq+2PAK/GIDRaslRZeFGv8ztM8M3ewbNVs1TaFVoPtdJlxeqQeacrYIEFyd4bo+w
	 grqx81pjqcGQZAeBJZKtphOBao8c/mtEiUeLiR9l5LLpR61y2D0TlPyOaSTGF2rAPqmcg
	 co7mevGGgd1gHEzxLreuVvnAFR3YXcVq3Fu0us3nQqcpgHfGnlqriYjrUoYUbkqqDvVqL
	 xaIoGUg1lpZghI2LpV5BMgBSj0mX7L8jd+XpisPpHHWM0lMgtv4YzVxBuwC2LoybAtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886520;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:MIME-Version:In-Reply-To:
	 References:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bSrvcPshhqyzY63DpG1T4LwM+B6oD+Jzea0GYFeEVJQ=;
	b=nkmHFhgrIP2nbv7rVRyHq5eBudbCNFZU7b66xqfoKkY5Z8UJ6Z2r1NP2hj/sksGDQaqx
	 WWYIQZoNoXlqRdQAhajK0MJVu/UP8Fqrbh4UeS+qF1tz1TZj8nezZ5aMsGvcTI33phm/q
	 wlzTA0CA1m2E8EHx/GpAlN/Fu8Jzbeb85nJbnU0F32omQav8X17I2x2Hbd3aKRQkMHvOY
	 1dVBDCGs4PXKfJVy7u9zSDzdzxAObRJw1zJTOTruqAlzPD7FhKWCnUIlVbMqc9HRmZdXN
	 juG3Nsy+wsL5sfqZaxZO6zRz6s/yE6umSs2iH5KxgjJaXquE51dT8T92L97tncAhaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suedeai.ai;
	spf=pass smtp.mailfrom=fe-bounces.suedeai.ai;
	dkim=pass header.d=suedeai.ai header.i=@suedeai.ai header.a=rsa-sha256 header.s=fe-8b69f41da4 header.b=fq5PP47L;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=hbZv3LlQ;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37245606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37245606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=suedeai.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.suedeai.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suedeai.ai header.i=@suedeai.ai header.a=rsa-sha256 header.s=fe-8b69f41da4 header.b=fq5PP47L;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=hbZv3LlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suedeai.ai;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: References: In-Reply-To: MIME-Version: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=fe-8b69f41da4; t=1794886508;
 bh=bSrvcPshhqyzY63DpG1T4LwM+B6oD+Jzea0GYFeEVJQ=;
 b=fq5PP47LkALzuw9ib7pOkfy7tTbmVW2PwiegwGQNCyriBjnPbmYdkaydf8K7TmJFf5mLHL3M0
 1dDlBj4LO0+R0hssQC9mB6lOFC2tvi3IhEg4bMREPV9tl5sVOOuxSHlV7yHcmjKyj0CHlxNXGJY
 1T1StnPJ1/J8EgkoDnz1ltc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: References: In-Reply-To: MIME-Version: CFBL-Address:
 CFBL-Feedback-ID; q=dns/txt; s=default; t=1794886508;
 bh=bSrvcPshhqyzY63DpG1T4LwM+B6oD+Jzea0GYFeEVJQ=;
 b=hbZv3LlQATWeCcfii+aizP1ShWhaT6ugQu76zATogbgrdzjy1yzDdbw4wE/CFDXNHwJ6AOmvF
 fow+bPTrgu8Tlzlb/wO7ISvyZoIZ0JKdXIFGonDHJuEzWmVn2qGV77itQgkPw6sOw7L7eY3kidz
 1SGp/Yw3CvENn+iMpzl2vOE=
CFBL-Feedback-ID: 6afbcb697951c5ab94b1281f:0eb29117a4d1a52bd183f3f4027bf348
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afbcb697951c5ab94b1281f
X-Forward-Email-Sender: rfc822; jason@suedeai.ai, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.27
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677bc4704cbso4240298d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:35:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGpHbRd/RDKIM8kfvLcSLjlK8JoHUsfNDeiVQB1OYzbw68TbdXiYUnoJe+Br/wYy5KOgct19D0wz6GOe48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BqCEPY9JZFjoHWhEn0m8pyA5VojsZWWNfa7tlYxHZiqZTxtU2
	PBDeG2dOraep/yyxIM2phMzVUCYiLSHX0pLDV5DpH+9wBT0irLux19AKsEmjjQYMDZnXJmotYKn
	DITkYrHAtB68B+ScIP11+KaXaPsW89l4=
X-Received: by 2002:a05:690e:408a:b0:67d:b995:a5af with SMTP id
 956f58d0204a3-67db995d2d5mr2337286d50.116.1794886504481; Mon, 16 Nov 2026
 19:35:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 16 Nov 2026 21:35:04 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CA+Z0x2J7S+0d=ceG3tnpkcB5nfEtNNzUcNkhVvJmzy=yHPb06w@mail.gmail.com>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
 <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
 <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com> <CA+Z0x2J7S+0d=ceG3tnpkcB5nfEtNNzUcNkhVvJmzy=yHPb06w@mail.gmail.com>
From: Jason Colapietro <jason@suedeai.ai>
Date: Mon, 16 Nov 2026 21:35:04 -0600
X-Gmail-Original-Message-ID: <CA+Z0x2L9ho_Yq-BCSy2hBhQP6Yp9pmMaC741_YSk==0vS_gmeA@mail.gmail.com>
X-Gm-Features: Aa3M54pWIk4vBVIIpYP5M4-JpL9X6iaGNvji2qR2isQSMQyw6H0cdmze0nqWgHQ
Message-ID: <CA+Z0x2L9ho_Yq-BCSy2hBhQP6Yp9pmMaC741_YSk==0vS_gmeA@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: skhan@linuxfoundation.org, shuah@kernel.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah and all,

Checking back on v7 and the October 1 validation report. Is there
anything still needed from me before review can proceed, or does the
two-VM test setup and before/after output address your request?

Thanks for your time,
Jason

On Fri, 23 Oct 2026 21:07:03 -0700, jasoncola1@gmail.com wrote:
> Hi Shuah and all,
>
> Following up on the October 1 test report for v7. The host and client ran=
 in two separate x86_64 QEMU VMs on Linux 7.3-rc5, on one physical host. Th=
e report includes before/after remote-list output, unchanged human-readable=
 output, attach/detach checks, and matching transfer checksums.
>
> Could you let me know whether that addresses the requested validation, or=
 whether you need a different test setup before review can proceed?
>
> Thanks,
> Jason
>
> On Thu, 01 Oct 2026 09:13:21 -0700, jasoncola1@gmail.com wrote:
> > Hi Shuah and all,
> >
> > I tested the exact v7 patch with the host and client on two separate
> > x86_64 QEMU VMs, both running Linux 7.3.0-rc5, built from the official
> > v7.3-rc5 tag (72d3fcf802c45d00b300f25b848a93c3a2bd7c7e).
> >
> > The host was 192.0.2.1 and the client 192.0.2.2. A QEMU USB mass-storag=
e
> > device (46f4:0001, busid 2-1) was bound to usbip-host and exported by
> > the real usbipd on port 3240. Both client binaries were built from the
> > same 7.3-rc5 usbip-utils 2.0 sources; only the v7 change differs.
> >
> > Before, on the client:
> > $ /opt/usbip-before/usbip list -p -r 192.0.2.1
> > Exportable USB devices
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  - 192.0.2.1
> >         2-1: QEMU : QEMU USB mass storage (46f4:0001)
> >            : /sys/devices/pci0000:00/0000:00:03.0/usb2/2-1
> >            : (Defined at Interface level) (00/00/00)
> > exit=3D0
> >
> > After, on the same client against the same host:
> > $ /opt/usbip-after/usbip list -p -r 192.0.2.1
> > busid=3D2-1#usbid=3D46f4:0001#
> > exit=3D0
> >
> > The output without -p was byte-identical before and after. The v7
> > client also attached the device at VHCI port 08, enumerated it as
> > /dev/sda, and read the full 1 MiB disk. Its SHA-256 matched the source:
> > 87b755d14716cb3fd1622fae9c5dc5f7e2b758fb1b4c2575234839ba2f7d6b03
> > Detach succeeded and left no imported port. Unbinding on the host made
> > the parsable list exit 0 with zero bytes on stdout; rebinding restored
> > the record. All commands passed. The attached report records exact
> > commands, output, exit codes, source identifiers, and test limitations.
> >
> > These were two VMs on one physical host, with emulated USB hardware,
> > not two physical machines. No code changes were made to v7; -p still
> > precedes -r. Codex assisted with test orchestration and this report.
> >
> > Thanks,
> > Jason
> >
> >
> > On Thu, 01 Oct 2026 06:53:52 -0600, Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
> > > On 10/1/26 06:49, Shuah Khan wrote:
> > > > On 9/26/26 22:00, Jason Colapietro wrote:
> > > >> Hi Shuah and all,
> > > >>
> > > >> The exact v7 patch has now been built and tested with a native Lin=
ux
> > > >> USB/IP stack.
> > > >>
> > > >> Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
> > > >> usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid =
2-1)
> > > >> was bound to usbip-host and exported by usbipd. The client connect=
ed
> > > >> to 127.0.0.1:3240.
> > > >>
> > > >> With the unpatched client, "usbip list -p -r 127.0.0.1" still prin=
ted
> > > >> the human-readable "Exportable USB devices" report, reproducing th=
e
> > > >> bug. With the v7 client, the same command returned:
> > > >>
> > > >> =C2=A0=C2=A0=C2=A0=C2=A0 busid=3D2-1#usbid=3D46f4:0001#
> > > >>
> > > >> "usbip list -r 127.0.0.1" retained its human-readable output,
> > > >> including the device path and interface details. After unbinding t=
he
> > > >> device, the parsable command exited successfully with zero bytes o=
n
> > > >> stdout; rebinding restored the record.
> > > >>
> > > >> I also attached busid 2-1 through the v7 client. "usbip port" show=
ed
> > > >> it imported through vhci_hcd at port 08, and lsusb showed the devi=
ce
> > > >> on both the original and virtual host buses. Detach succeeded, lea=
ving
> > > >> no imported port. The build, list, attach, and detach commands all
> > > >> exited successfully.
> > > >>
> > > >> This was one Linux VM with an emulated USB device and TCP loopback=
. I
> > > >> have not tested physical USB hardware or two separate machines. Th=
e
> > > >> existing option-order behavior is unchanged: -p must precede -r.
> > > >
> > > > Please test this with two systems hots running on one and client on=
 the
> > > > other. Send me before and after output that shows the bug and that =
it is
> > > > fixed by your change.
> > >
> > > Another thing. This needs to be reproduced and tested on the latest k=
enel,
> > > Linux 7.3-rc5
> > >
> > > thanks,
> > > -- Shuah
