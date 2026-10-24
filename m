Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792814825;
	b=DrPTCLarJMRhCMLJbANW687fB2iuTMjJyV1vULfxvOee2L+DW5akTgULxvs2yvIqAB74
	 7rOjhLTjam3oIRxH3IbStt3W3Cd5BqUXdaM+VXX0mTEGeSXs5IcLYmx8t+gl0HxZtyO/T
	 EuTXgkZxlOtBDx7dpZ3UXjG9JSBiR6C3EvbL5DspZIyqt+4oko6qf3ItpSvzqWElnsINr
	 0IlhEUge1VNfW+DNiltFKnqZPBwcdBUzCZ0IgOZ2q6LUYc++8zfMEzS4wjqlP39YQvAaX
	 sL5alzVv9UMC8TtI4vpFk8TyjgS7ofag4gzSz1lyoIKYEwrLz7s8aFlqFDUkcdtsFtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792814825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yxq3k5lb/PIhkkeUn/DDn0j2OBlo64L70mfCLiiYuig=;
	b=RD1GroTANrebIihyZk9A2Lbhh3i4DFeVu0CJS+I1W9Y1zi8Hv4fol1wbYHMT2f1IDEgf
	 SIaunRyVj/WvpECKpQT7dCP9dxpCQHp7pq9FG0h3yPp0FuE7oLvTe80Bx4LVCyxGgZy2f
	 fXt6s34Cvz8rJfEs7MhC0s//Yf5DkzsGALVu2h8Ta8nW7PkNPwXilraX8ERMTZOBL313Y
	 U8+VdOJv3hljDnGhQaZEC+rxT0dz9oyNpvGnG5zgrIB9ijklJPo0BzxsBnOIweL81S4jQ
	 pzLR0qujxaeKDa8LSQy2ODbcYdzQ1J8EqY6v80wGjN4AE3r1uyk5UhDQOhVPKFNQDFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qjQa7O3z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05128606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05128606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qjQa7O3z
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ac525c1f05so13160087b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792814824; cv=none;
        d=google.com; s=arc-20260327;
        b=ha0ujIjRiQK1G2g1xKCw5NdKX7Ymg3KvKAp7Gl7MmBk959oHid4Qvlgqi4HS4n1stJ
         mVK231h8q6z958eThP0cnzTqdDT2z0XE0qRNYrMNZOwG7prC2DT4fu2XFxzjORfVwxzO
         4JYO+B+BUpeHjy5Jd8E3KPx/mxJQ9bdjcrow5JcYjrvxsLLEUgULsBLrUHDoMIFkbUiM
         GCIt5hF/FJM5FPoW6aLAQpbRQF+L6HuAuafQZFy2SgT2/9wzVdxS+qNqhpsYkNd4+flW
         maWwABamtnBPP2r7pBG8gircUp/eNSZ8vlv4XreqZZ4i/YkkKOBDQSRSG4O8u4EjAF2G
         B+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=yxq3k5lb/PIhkkeUn/DDn0j2OBlo64L70mfCLiiYuig=;
        fh=XuQodlwkl+hkhEzaz3AZbDgpw70/t5dMX4YC1AU2xKQ=;
        b=DOz/QWWM75C2X35feNj2ReNYpE7Y+D/HX861m25gLCdr2xcLDqRDXu/Kgp6kM3ztW0
         AF+YbPL6I6dEBxAxhVVXAbPTrR1qMeL64QXES2CDZqcSaJAvTV9nVV1iqigW5hIMQiPj
         BoUn1FmBovceKqSewcNHwtOCoBYdRCYLbT0PJQUokCyEB6jnycHDKzRQCVFlfaFySFWy
         6FLl0LCSlYHKk2U1jolbb4qLi75+sQb4ywTL7praKDYLQWgkoJHPQ/RLtdR+TbnAhy0a
         wK0vd17i8ryp5ZWIEXgIJehZWK2dxKhc2+6oS6ijGIdT4XwpTlVPpIbtjTfb/Ciuq698
         O3kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792814824; x=1793419624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxq3k5lb/PIhkkeUn/DDn0j2OBlo64L70mfCLiiYuig=;
        b=qjQa7O3zaWF+PEls/J63S6iEfyVsKgZoceKakxi9G9TaCXEjiex3QBzjE0PMbRy02S
         zn6J2833JO2BGz+tPrtkBIs4wJvbYPh6GYBYNYHJNuXSA/T6QaVjAMMbk4FzkKzTg9tL
         Mvai+cgKg7JjmJSSYxygafZhbm2KglXy3Xsz+hGeocoGb2mCcj5S4+cBAofjf6ORtifG
         CVmmh/jBuU7YEuEe0/7Nk+DErsSMhT3vRkfi/bFfHcUtotLtHaIXi4PB44CNLmjKYE3M
         mnswZzpOFf+F59I77hrEoln3L63Hx2h1NVr4YqT0ySTyFiZ3hTOtJrO6/v5rXjlsACKY
         SSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792814824; x=1793419624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxq3k5lb/PIhkkeUn/DDn0j2OBlo64L70mfCLiiYuig=;
        b=mED83zlKftWCjHEHA+9ayW/yqKABP6/3WZMIGoOgaeXC290swu2gWI1yP17Wux97UB
         n6oTn4aGy4RKhEyW7L8q7hRTS8b6qJiJqSe8sLRlZOUceJnP/2LA/VkbpmmWLBjeGVQ9
         JgXw/fWMASbab6DieSc1Sm+BPreIC/QVRPy8GQkQsjqbTW7xSG7/QkqS1jQYD5opRiTj
         yDiPNuwUVPNh6yg8NdJ6l+d+13xqpKrxG7CY9wjFWkSjJH3ewYfoHk29QAXynfRG/hKk
         8fRMqWvPi72syXL8PJ4nRiIUW2/J8rnWzZYj43+CXLro5D++XIiW+27/fQok92f9HNzD
         LKPg==
X-Forwarded-Encrypted: i=1; AKwUvBx9GTlHz6CVtRQNaE6GHNJT6Zg8+zgoLA7X49btcbwv67z8HE/wW2pKzMM5l3eeyvQKxAe8Mjw8WSzqATQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJky+qBJ++Hj/vmwG5QJEGZ8FmiGfd6jIkvlMd4uA1HFiw/cZIQ
	PLXlVfNv8qIIvyxsBoECX80+fMYGb6GrFwPi80hEcK86qqmori4kH8zsZlVNrmYG4c/ALsK7DmF
	vcRqQqibOiy1Mz7MOxJ4i1WV5SD4UfKY=
X-Gm-Gg: AYBFou0ZVEFV3xwwlbhoRoy7bYG4P5eKs1gX3mM9cyQrZVeqXi+gNmBxQXr6mL/minX
	MbBPz/XNgOl6bHXat7OPA3ohGo9qcnyV5U+nO5OQ9K2mNa/DmIBks5xFUIq6FGrm48nOuix7Mmh
	h5Ojav+tBrZRb8NWQ+zGA/qPjCLQJoSHw8iVrkW/2IFNrunPjJzRYEiJ3KP5vMgKYCQxWhVCLyJ
	s/sx1xalm9EOC3wv3h5RYiL0+PdZjuWZNwvRbGPvyiBb+US7Xwm7sHKurJyAHzvtWmEk5cutsjz
	TscMb3se15zgTmKkMsbCEKPKcr9uPSn3wLWzVww4KuXeXuu3zhII6OCwABLggJlQ9HHV4llgMYH
	05G68XMmBNBOAb45ORBqOLmhV6/fjR62ovZlXOrmXEHRffYrNqI+3mV+81m4RRCPOUqndKG7KsN
	fI4TnWJOLYDlnp1Vx5hqo3doS3xSfACHt3PFoAKGr+CA+4okijfMXcIE+dzpBURuoQ0HotFYpIo
	rR60vhgw3XHu7IX4ujbCs6wDSZv/yZKCTFzWy/sEHMBU2PBlUUm0NBY2kI=
X-Received: by 2002:a05:690c:d86:b0:8b1:46a1:2893 with SMTP id
 00721157ae682-8b1669cde2bmr10334037b3.6.1792814823786; Fri, 23 Oct 2026
 21:07:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 23 Oct 2026 21:07:03 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 23 Oct 2026 21:07:03 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: jasoncola1@gmail.com
In-Reply-To: <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
 <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org> <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com>
Date: Fri, 23 Oct 2026 21:07:03 -0700
X-Gm-Features: AclHuK_u9nLDrXqdUG8b22Wwv09sxpX3QDfcMlGG6_4cdfkBzkbb2TlmQNzB-as
Message-ID: <CA+Z0x2J7S+0d=ceG3tnpkcB5nfEtNNzUcNkhVvJmzy=yHPb06w@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: skhan@linuxfoundation.org, shuah@kernel.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah and all,

Following up on the October 1 test report for v7. The host and client
ran in two separate x86_64 QEMU VMs on Linux 7.3-rc5, on one physical
host. The report includes before/after remote-list output, unchanged
human-readable output, attach/detach checks, and matching transfer
checksums.

Could you let me know whether that addresses the requested validation,
or whether you need a different test setup before review can proceed?

Thanks,
Jason

On Thu, 01 Oct 2026 09:13:21 -0700, jasoncola1@gmail.com wrote:
> Hi Shuah and all,
>
> I tested the exact v7 patch with the host and client on two separate
> x86_64 QEMU VMs, both running Linux 7.3.0-rc5, built from the official
> v7.3-rc5 tag (72d3fcf802c45d00b300f25b848a93c3a2bd7c7e).
>
> The host was 192.0.2.1 and the client 192.0.2.2. A QEMU USB mass-storage
> device (46f4:0001, busid 2-1) was bound to usbip-host and exported by
> the real usbipd on port 3240. Both client binaries were built from the
> same 7.3-rc5 usbip-utils 2.0 sources; only the v7 change differs.
>
> Before, on the client:
> $ /opt/usbip-before/usbip list -p -r 192.0.2.1
> Exportable USB devices
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  - 192.0.2.1
>         2-1: QEMU : QEMU USB mass storage (46f4:0001)
>            : /sys/devices/pci0000:00/0000:00:03.0/usb2/2-1
>            : (Defined at Interface level) (00/00/00)
> exit=3D0
>
> After, on the same client against the same host:
> $ /opt/usbip-after/usbip list -p -r 192.0.2.1
> busid=3D2-1#usbid=3D46f4:0001#
> exit=3D0
>
> The output without -p was byte-identical before and after. The v7
> client also attached the device at VHCI port 08, enumerated it as
> /dev/sda, and read the full 1 MiB disk. Its SHA-256 matched the source:
> 87b755d14716cb3fd1622fae9c5dc5f7e2b758fb1b4c2575234839ba2f7d6b03
> Detach succeeded and left no imported port. Unbinding on the host made
> the parsable list exit 0 with zero bytes on stdout; rebinding restored
> the record. All commands passed. The attached report records exact
> commands, output, exit codes, source identifiers, and test limitations.
>
> These were two VMs on one physical host, with emulated USB hardware,
> not two physical machines. No code changes were made to v7; -p still
> precedes -r. Codex assisted with test orchestration and this report.
>
> Thanks,
> Jason
>
>
> On Thu, 01 Oct 2026 06:53:52 -0600, Shuah Khan <skhan@linuxfoundation.org=
> wrote:
> > On 10/1/26 06:49, Shuah Khan wrote:
> > > On 9/26/26 22:00, Jason Colapietro wrote:
> > >> Hi Shuah and all,
> > >>
> > >> The exact v7 patch has now been built and tested with a native Linux
> > >> USB/IP stack.
> > >>
> > >> Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
> > >> usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-=
1)
> > >> was bound to usbip-host and exported by usbipd. The client connected
> > >> to 127.0.0.1:3240.
> > >>
> > >> With the unpatched client, "usbip list -p -r 127.0.0.1" still printe=
d
> > >> the human-readable "Exportable USB devices" report, reproducing the
> > >> bug. With the v7 client, the same command returned:
> > >>
> > >> =C2=A0=C2=A0=C2=A0=C2=A0 busid=3D2-1#usbid=3D46f4:0001#
> > >>
> > >> "usbip list -r 127.0.0.1" retained its human-readable output,
> > >> including the device path and interface details. After unbinding the
> > >> device, the parsable command exited successfully with zero bytes on
> > >> stdout; rebinding restored the record.
> > >>
> > >> I also attached busid 2-1 through the v7 client. "usbip port" showed
> > >> it imported through vhci_hcd at port 08, and lsusb showed the device
> > >> on both the original and virtual host buses. Detach succeeded, leavi=
ng
> > >> no imported port. The build, list, attach, and detach commands all
> > >> exited successfully.
> > >>
> > >> This was one Linux VM with an emulated USB device and TCP loopback. =
I
> > >> have not tested physical USB hardware or two separate machines. The
> > >> existing option-order behavior is unchanged: -p must precede -r.
> > >
> > > Please test this with two systems hots running on one and client on t=
he
> > > other. Send me before and after output that shows the bug and that it=
 is
> > > fixed by your change.
> >
> > Another thing. This needs to be reproduced and tested on the latest ken=
el,
> > Linux 7.3-rc5
> >
> > thanks,
> > -- Shuah
