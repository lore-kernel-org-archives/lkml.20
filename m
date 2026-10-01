Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD1253B42
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871207; cv=pass; b=ddXzgrQ1VdOUPZkcCSnJ/SKQ9tuaz4NKAAMsI/zEQxRreWrGRvdFtXzrqRqClEhY6JNCYxj7+cL4NaVqJ+x9qvbnpQVirQLbqxfFNUWUFLQKYMEVPytucfL4FlYKwWBHzMlsP0GOzHMBYXtRbME3+JAnl7Lusve6CiunRX3k0xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871207; c=relaxed/simple;
	bh=x9I9aOoL1/2NAnpzbNOAH2ABr2CC/4+I6XtnnPsUt6I=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaPgYjWYoMLSc15xbUAj1cQbC4AkK67rmjAsPXI/Rz4J0yGdpIxKyNyuzfjLaoA9NrYjWimiI654x4R4R2kmYS08R7yg0eHvwupj4/5/RVPPKikPHe7pmSdySXMgBplh/sJxtn17MOS41/+VSQbd3sQXcL9j8BpaK+GkDSi+MbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U691EgXq; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U691EgXq"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768033d654so2071577d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790871204; cv=none;
        d=google.com; s=arc-20260327;
        b=c+8ZmU9EWE/DqgO/F5iQQY1bTH3KQPPBTpW3/9Od5Hc1yJjGZj8pnHQUU1pnebxezF
         pR4V2br0ND3ydTqgHXC0qS1LZfXwEXNUjXahC/r1kQEKS4D+Zjc7MfpHm2uPItN4lFVv
         UV92LJzYrYVk5SbAO9jCZTl4nxdqmNT+tf2xCbTUp2rzI69KFShWzhQts4MVGHQU9Ph+
         OUvY2dMKUdvyCFj753K9vBa9jTXfe/jU6g+ndT6w2Ydet+W80k74lHAHKFXcZXyPKcmF
         r80iD7lxTM2bwjrIfnhqWKdImCxF5HEcFzqT0VAY6owCLG8TI0Km6v5ZmAQZVFEjnGyC
         8RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=mkj1QEz4eOTrxkUvaS/0WQLkT3FSjhCvNcl2ZCYOE60=;
        fh=7Nvd4gQtq4zGRoVtkzda70mvuPYBdozVKwBcp4E0gnQ=;
        b=QVeLr0LiY9Pu+t6zItaSm1x4IpuVF832iZCcgCHZUSvr1CPFW1Pgl17KjyeofNZmf3
         GNprLVyoip9MDFeEgpIGdmqkSW8dmwkE70LQUAErxZL1bUFufcS9UkjdmgjY0T3mxrSu
         MK6NfORqu1pqg9Qb8jwjeDEx9MTV809DIt5WylGXRucH+BEwhNbaEVIpF7qNX6zBldXC
         sqErE1h8xe3ZCgJ/mqQsLzJdHq8MUR/wuGcj0x0KfCC7w8e0H+QFTLxxgAeArGdg1Gju
         XiPG48gb/XED9fVLW3OcmUv5N1vFWxACB1xwgqc6PK8P2g+4SD3Su9ZrZDvpD1D64geJ
         KLow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871204; x=1791476004; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkj1QEz4eOTrxkUvaS/0WQLkT3FSjhCvNcl2ZCYOE60=;
        b=U691EgXqVZGmkV3mxXo8IgVFfbuyThIgCjCekpLc1FI3XfZ5ZUJiSs+QPZJgUo7H36
         zC2r9gMjBoNWMEnbfXHvk4RAccQLFDb/cxsmc6SXptcD3yL/lVI7QYWh3iansVnF+I28
         MG+tQ/RW/ABLjJweT9SS3NsqpeJvjyA7NmLc73ZBzGMjbUzDmuFtvii3yXvWoOYNsTpx
         Dq4ZI7RHjNgBWS9A1xpmW9x741EbYXcnh8k9m6YGZ/dmuWxa/Rrrn0uMaBShYNkvWmcm
         ZiBOfUsJtluFIZkJBiRg28+fLywSUePMlseKgtVHZ6V0PiQZSuq2+EtSH/7js5ShCGVb
         kY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871204; x=1791476004;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkj1QEz4eOTrxkUvaS/0WQLkT3FSjhCvNcl2ZCYOE60=;
        b=voXnAqLE611WPXlDolxAAJkt9a3dzoDI+Kf7i3TmrozSJE0sK7t+Y2uVeD3ZzXoV6q
         Q2+NmHNjnfbSpu9WvdXkASHZYfLpFZ7AQ+Nd2FRFEDwwl5kWwOWCEW3u8DcCxy0+zjVv
         DdJ/HB90y/Uv2vDJnj5gw2OWG4LAQQ/HX5YML2uqRF6kF2K2ms3G84hS8Qq4ibRuJHcj
         AmjdwPVC5IaeYHYGnk+K4umlU8+0FWwTXWxxW6aGrhLfgZQFEWtPvhpW41Jb69dZo/tR
         FVRVQfWlDEwovuH742gp0tY+D2Qhq2Fgyu61dWgarU979iDjwAmlEpYiex52hyLJDvbC
         DPIw==
X-Forwarded-Encrypted: i=1; AKwUvByUILhowcwkQqUNpZjg6MyLL5w0Qe4YfG9qxJ54+YzNzslGaP8m7s23RO7dlYU+D9+SC9HH3Xah9o6gHYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1iB3Q4UckAyI+Glg168W/77838ruuYFYvcukWecQTGKsXUaij
	23F3XAzse5dbTF9gV9q9YdIO/KfCEOpKhMngyYuRyAPI70IWzgQqjti2/shhY9jWPgNIHW3t22C
	fO3gtiQItV3s5gvHFrckgSou5MqvjeXY=
X-Gm-Gg: AYBFou2g4NecNknmQyYK/Dq2Ofo6f3sBTOsszEfSPgIoslcQImzd0rPlyswaqN3LIea
	TtQ4Jc/Owv8cucEZPd+bgQuUMpf3AxVOqvIfK/uSlX8CZ+iko34/ZOgSXMGZTEzfO3m18bhZKXa
	ZRgzA6BqjZpBSkdFYirzMhSHPL9tyr6M246MvkWe6DOEEDhcZ44Sdc44wuaQTXx0NXPtKbGylE8
	UdGpPbIgsgNPCm6XKjJw9aSR1O+eN4BWcFDrudDIp8fDrNjYWPophVvEGKoscEtnNm0w7k7mDfZ
	nkSJXBsT3o07G8i3SWZzgAJKGvc0i2piE87OhQA3u2HQkuzgZ03Xx+NId9Jt6U6K+GDROSz1anC
	N1RR547x2IO5XlyQglb74kW9rTvonZSv1pFFYH+BW7OlTfPOUTi9V8D5lvJ10fqBaMffhUJXmRa
	zU1qDdtBRX8jfO7/h5ugA=
X-Received: by 2002:a05:690e:1186:b0:676:898e:1833 with SMTP id
 956f58d0204a3-676898e1d9dmr2665205d50.38.1790871204170; Thu, 01 Oct 2026
 09:13:24 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 09:13:21 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 1 Oct 2026 07:51:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: jasoncola1@gmail.com
In-Reply-To: <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org> <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
Date: Thu, 1 Oct 2026 09:13:21 -0700
X-Gm-Features: AclHuK81LtxH-6qx5fjTMj3L2H-5c6dwa5HslRRXb7ExNkI2i6ro5h_JILM3A7w
Message-ID: <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org, 
	valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f6e752065cc9b12e"

--000000000000f6e752065cc9b12e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah and all,

I tested the exact v7 patch with the host and client on two separate
x86_64 QEMU VMs, both running Linux 7.3.0-rc5, built from the official
v7.3-rc5 tag (72d3fcf802c45d00b300f25b848a93c3a2bd7c7e).

The host was 192.0.2.1 and the client 192.0.2.2. A QEMU USB mass-storage
device (46f4:0001, busid 2-1) was bound to usbip-host and exported by
the real usbipd on port 3240. Both client binaries were built from the
same 7.3-rc5 usbip-utils 2.0 sources; only the v7 change differs.

Before, on the client:
$ /opt/usbip-before/usbip list -p -r 192.0.2.1
Exportable USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 - 192.0.2.1
        2-1: QEMU : QEMU USB mass storage (46f4:0001)
           : /sys/devices/pci0000:00/0000:00:03.0/usb2/2-1
           : (Defined at Interface level) (00/00/00)
exit=3D0

After, on the same client against the same host:
$ /opt/usbip-after/usbip list -p -r 192.0.2.1
busid=3D2-1#usbid=3D46f4:0001#
exit=3D0

The output without -p was byte-identical before and after. The v7
client also attached the device at VHCI port 08, enumerated it as
/dev/sda, and read the full 1 MiB disk. Its SHA-256 matched the source:
87b755d14716cb3fd1622fae9c5dc5f7e2b758fb1b4c2575234839ba2f7d6b03
Detach succeeded and left no imported port. Unbinding on the host made
the parsable list exit 0 with zero bytes on stdout; rebinding restored
the record. All commands passed. The attached report records exact
commands, output, exit codes, source identifiers, and test limitations.

These were two VMs on one physical host, with emulated USB hardware,
not two physical machines. No code changes were made to v7; -p still
precedes -r. Codex assisted with test orchestration and this report.

Thanks,
Jason


On Thu, 01 Oct 2026 06:53:52 -0600, Shuah Khan
<skhan@linuxfoundation.org> wrote:
> On 10/1/26 06:49, Shuah Khan wrote:
> > On 9/26/26 22:00, Jason Colapietro wrote:
> >> Hi Shuah and all,
> >>
> >> The exact v7 patch has now been built and tested with a native Linux
> >> USB/IP stack.
> >>
> >> Test setup: Alpine Linux 3.23.4 on aarch64, kernel 6.18.53-0-lts,
> >> usbip-utils 2.0. A QEMU USB mass-storage device (46f4:0001, busid 2-1)
> >> was bound to usbip-host and exported by usbipd. The client connected
> >> to 127.0.0.1:3240.
> >>
> >> With the unpatched client, "usbip list -p -r 127.0.0.1" still printed
> >> the human-readable "Exportable USB devices" report, reproducing the
> >> bug. With the v7 client, the same command returned:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 busid=3D2-1#usbid=3D46f4:0001#
> >>
> >> "usbip list -r 127.0.0.1" retained its human-readable output,
> >> including the device path and interface details. After unbinding the
> >> device, the parsable command exited successfully with zero bytes on
> >> stdout; rebinding restored the record.
> >>
> >> I also attached busid 2-1 through the v7 client. "usbip port" showed
> >> it imported through vhci_hcd at port 08, and lsusb showed the device
> >> on both the original and virtual host buses. Detach succeeded, leaving
> >> no imported port. The build, list, attach, and detach commands all
> >> exited successfully.
> >>
> >> This was one Linux VM with an emulated USB device and TCP loopback. I
> >> have not tested physical USB hardware or two separate machines. The
> >> existing option-order behavior is unchanged: -p must precede -r.
> >
> > Please test this with two systems hots running on one and client on the
> > other. Send me before and after output that shows the bug and that it i=
s
> > fixed by your change.
>
> Another thing. This needs to be reproduced and tested on the latest kenel=
,
> Linux 7.3-rc5
>
> thanks,
> -- Shuah

--000000000000f6e752065cc9b12e
Content-Type: text/markdown; charset="UTF-8"; 
	name="Suede-Linux-USBIP-Two-System-Test-2026-10-01.md"
Content-Disposition: attachment; 
	filename="Suede-Linux-USBIP-Two-System-Test-2026-10-01.md"
Content-Transfer-Encoding: base64
X-Attachment-Id: d58559c2309dc334_0.1

IyBMaW51eCBVU0IvSVAgdjc6IHR3by1zeXN0ZW0gdmVyaWZpY2F0aW9uIOKAlCBPY3RvYmVyIDEs
IDIwMjYKCioqUmVzdWx0OiBQQVNTLioqIFRoZSBleGFjdCBzdWJtaXR0ZWQgdjcgcGF0Y2ggd2Fz
IHRlc3RlZCBhY3Jvc3MgdHdvIHNlcGFyYXRlIExpbnV4IDcuMy1yYzUgc3lzdGVtcy4gVGhlIG9y
aWdpbmFsIGNsaWVudCByZXByb2R1Y2VkIHRoZSBpZ25vcmVkIGAtcGAgZmxhZzsgdGhlIHBhdGNo
ZWQgY2xpZW50IHJldHVybmVkIHRoZSBwYXJzYWJsZSByZWNvcmQuIEFsbCAyNSBjYXB0dXJlZCBj
b21tYW5kIGdyb3VwcyBleGl0ZWQgMCBhbmQgYWxsIGhhcm5lc3MgYXNzZXJ0aW9ucyBwYXNzZWQu
CgojIyBFbnZpcm9ubWVudCBhbmQgcHJvdmVuYW5jZQoKLSBUd28gaW5kZXBlbmRlbnQgeDg2XzY0
IFFFTVUgOC4yLjIgZ3Vlc3RzLCB1c2luZyBUQ0cgYW5kIGEgcHJpdmF0ZSBFdGhlcm5ldCBsaW5r
LiBIb3N0IGAxOTIuMC4yLjEvMjRgOyBjbGllbnQgYDE5Mi4wLjIuMi8yNGAuIFVTQi9JUCB0cmFm
ZmljIHRyYXZlcnNlZCB0aGUgZ3Vlc3RzJyBUQ1Agc3RhY2tzOyBubyBsb29wYmFjayBvciBtb2Nr
IFVTQi9JUCBzZXJ2ZXIgd2FzIHVzZWQuCi0gT2ZmaWNpYWwgTGludXggdGFnIGB2Ny4zLXJjNWAs
IGNvbW1pdCBgNzJkM2ZjZjgwMmM0NWQwMGIzMDBmMjViODQ4YTkzYzNhMmJkN2M3ZWAuIEtlcm5l
bCBzb3VyY2VzIG1hdGNoZWQgdGhhdCBHaXQgdHJlZSB3aXRoIG5vIHRyYWNrZWQtZmlsZSBkaWZm
ZXJlbmNlcy4gQ3VzdG9tIGtlcm5lbCBjb25maWd1cmF0aW9uIGlzIGluY2x1ZGVkLgotIFJlYWwg
YHVzYmlwLWhvc3RgLCBgdXNiaXBkYCwgYW5kIGB2aGNpX2hjZGA7IHVzYmlwLXV0aWxzIDIuMCBi
dWlsdCB3aXRoIHJlYWwgbGlidWRldiwgd2l0aG91dCBUQ1Agd3JhcHBlcnMuIFRoZSBvcmlnaW5h
bCBhbmQgcGF0Y2hlZCBjbGllbnQgYnVpbGRzIHNoYXJlIHRoZSBzYW1lIHNvdXJjZSBiYXNlIGFu
ZCBjb25maWd1cmF0aW9uLiBPbmx5IGBzcmMvdXNiaXBfbGlzdC5jYCBkaWZmZXJzLCBieSB0aGUg
ZXhhY3QgU2VwdGVtYmVyIDcgdjcgZW1haWwgcGF0Y2guCi0gRGV2aWNlOiBRRU1VIFVTQiBtYXNz
LXN0b3JhZ2UgYDQ2ZjQ6MDAwMWAsIGJ1c2lkIGAyLTFgLCAxIE1pQiBiYWNraW5nIGRpc2suIFRo
ZSBVU0IgbmFtZXMgZmlsZSBjb250YWlucyBkZXNjcmlwdGl2ZSBsYWJlbHMgZm9yIHRoaXMgdGVz
dCBkZXZpY2U7IG51bWVyaWMgSURzIGFuZCBidXNpZCBjYW1lIGZyb20gcmVhbCBzeXNmcyBhbmQg
dGhlIFVTQi9JUCBwcm90b2NvbC4KLSBUaGUgcGF0Y2ggYXBwbGllZCB3aXRob3V0IGNvbmZsaWN0
cy4gYGNoZWNrcGF0Y2gucGwgLS1zdHJpY3RgOiAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBjaGVj
a3MuCgojIyBDYXB0dXJlZCBrZXJuZWwgdmVyc2lvbnMKCmBgYHRleHQKTGludXggdXNiaXAtaG9z
dCA3LjMuMC1yYzUgIzUgUFJFRU1QVCBUaHUgT2N0ICAxIDE2OjQ2OjUwIENFU1QgMjAyNiB4ODZf
NjQgR05VL0xpbnV4CnVzYmlwLWhvc3QKMjogZXRoMDogPEJST0FEQ0FTVCxNVUxUSUNBU1QsVVAs
TE9XRVJfVVA+IG10dSAxNTAwIHFkaXNjIHBmaWZvX2Zhc3QgcWxlbiAxMDAwCiAgICBsaW5rL2V0
aGVyIDUyOjU0OjAwOjEyOjM0OjAxIGJyZCBmZjpmZjpmZjpmZjpmZjpmZgogICAgaW5ldCAxOTIu
MC4yLjEvMjQgc2NvcGUgZ2xvYmFsIGV0aDAKICAgICAgIHZhbGlkX2xmdCBmb3JldmVyIHByZWZl
cnJlZF9sZnQgZm9yZXZlcgogICAgaW5ldDYgZmU4MDo6NTA1NDpmZjpmZTEyOjM0MDEvNjQgc2Nv
cGUgbGluayB0ZW50YXRpdmUgCiAgICAgICB2YWxpZF9sZnQgZm9yZXZlciBwcmVmZXJyZWRfbGZ0
IGZvcmV2ZXIKYGBgCgpgYGB0ZXh0CkxpbnV4IHVzYmlwLWNsaWVudCA3LjMuMC1yYzUgIzUgUFJF
RU1QVCBUaHUgT2N0ICAxIDE2OjQ2OjUwIENFU1QgMjAyNiB4ODZfNjQgR05VL0xpbnV4CnVzYmlw
LWNsaWVudAoyOiBldGgwOiA8QlJPQURDQVNULE1VTFRJQ0FTVCxVUCxMT1dFUl9VUD4gbXR1IDE1
MDAgcWRpc2MgcGZpZm9fZmFzdCBxbGVuIDEwMDAKICAgIGxpbmsvZXRoZXIgNTI6NTQ6MDA6MTI6
MzQ6MDIgYnJkIGZmOmZmOmZmOmZmOmZmOmZmCiAgICBpbmV0IDE5Mi4wLjIuMi8yNCBzY29wZSBn
bG9iYWwgZXRoMAogICAgICAgdmFsaWRfbGZ0IGZvcmV2ZXIgcHJlZmVycmVkX2xmdCBmb3JldmVy
CiAgICBpbmV0NiBmZTgwOjo1MDU0OmZmOmZlMTI6MzQwMi82NCBzY29wZSBsaW5rIHRlbnRhdGl2
ZSAKICAgICAgIHZhbGlkX2xmdCBmb3JldmVyIHByZWZlcnJlZF9sZnQgZm9yZXZlcgpgYGAKCiMj
IFJlcXVlc3RlZCBiZWZvcmUtYW5kLWFmdGVyIG91dHB1dAoKYGBgdGV4dAokIC9vcHQvdXNiaXAt
YmVmb3JlL3VzYmlwIGxpc3QgLXAgLXIgMTkyLjAuMi4xCkV4cG9ydGFibGUgVVNCIGRldmljZXMK
PT09PT09PT09PT09PT09PT09PT09PQogLSAxOTIuMC4yLjEKICAgICAgICAyLTE6IFFFTVUgOiBR
RU1VIFVTQiBtYXNzIHN0b3JhZ2UgKDQ2ZjQ6MDAwMSkKICAgICAgICAgICA6IC9zeXMvZGV2aWNl
cy9wY2kwMDAwOjAwLzAwMDA6MDA6MDMuMC91c2IyLzItMQogICAgICAgICAgIDogKERlZmluZWQg
YXQgSW50ZXJmYWNlIGxldmVsKSAoMDAvMDAvMDApCmV4aXQ9MApgYGAKCmBgYHRleHQKJCAvb3B0
L3VzYmlwLWFmdGVyL3VzYmlwIGxpc3QgLXAgLXIgMTkyLjAuMi4xCmJ1c2lkPTItMSN1c2JpZD00
NmY0OjAwMDEjCmV4aXQ9MApgYGAKCiMjIEFkZGl0aW9uYWwgdmVyaWZpY2F0aW9uCgp8IENoZWNr
IHwgVmVyaWZpZWQgcmVzdWx0IHwKfC0tLXwtLS18CnwgT3JpZ2luYWwgYGxpc3QgLXAgLXJgIHZl
cnN1cyBvcmlnaW5hbCBgbGlzdCAtcmAgfCBCeXRlLWlkZW50aWNhbCByYXcgb3V0cHV0LCBjb25m
aXJtaW5nIHRoZSBpZ25vcmVkIGZsYWcgfAp8IE9yaWdpbmFsIHZlcnN1cyBwYXRjaGVkIGBsaXN0
IC1yYCB8IEJ5dGUtaWRlbnRpY2FsIHJhdyBvdXRwdXQgfAp8IFBhdGNoZWQgcGFyc2FibGUgZm9y
bWF0IHwgRXhhY3RseSBvbmUgYGJ1c2lkPTItMSN1c2JpZD00NmY0OjAwMDEjYCByZWNvcmQgcGx1
cyBuZXdsaW5lIHwKfCBBdHRhY2ggfCBFeGl0IDA7IGltcG9ydGVkIGF0IFZIQ0kgcG9ydCAwOCBm
cm9tIGAxOTIuMC4yLjE6MzI0MGAgfAp8IEVudW1lcmF0aW9uIHwgQ2xpZW50IGAvZGV2L3NkYWAg
dW5kZXIgYHZoY2lfaGNkLjBgOyBzeXNmcyBJRHMgYDQ2ZjQ6MDAwMWAgfAp8IERhdGEgdHJhbnNm
ZXIgfCBGdWxsIDEgTWlCIGltcG9ydGVkIGRpc2sgU0hBLTI1NiBtYXRjaGVkIHRoZSBiYWNraW5n
IGltYWdlIHwKfCBEZXRhY2ggfCBFeGl0IDA7IG5vIGltcG9ydGVkIHBvcnQgYWZ0ZXJ3YXJkIHwK
fCBFbXB0eSBsaXN0IHwgRXhpdCAwOyBzdGRvdXQgZXhhY3RseSB6ZXJvIGJ5dGVzIGFmdGVyIGhv
c3QgdW5iaW5kIHwKfCBSZWJpbmQgfCBTYW1lIHBhcnNhYmxlIHJlY29yZCByZXR1cm5lZCBhZ2Fp
biB8CgpgYGB0ZXh0CiQgL29wdC91c2JpcC1hZnRlci91c2JpcCBwb3J0CkltcG9ydGVkIFVTQiBk
ZXZpY2VzCj09PT09PT09PT09PT09PT09PT09ClBvcnQgMDg6IDxQb3J0IGluIFVzZT4gYXQgU3Vw
ZXIgU3BlZWQoNTAwME1icHMpCiAgICAgICBRRU1VIDogUUVNVSBVU0IgbWFzcyBzdG9yYWdlICg0
NmY0OjAwMDEpCiAgICAgICAyLTEgLT4gdXNiaXA6Ly8xOTIuMC4yLjE6MzI0MC8yLTEKICAgICAg
ICAgICAtPiByZW1vdGUgYnVzL2RldiAwMDIvMDAyCmV4aXQ9MApgYGAKCmBgYHRleHQKJCBzaGEy
NTZzdW0gL2Rldi9zZGEKODdiNzU1ZDE0NzE2Y2IzZmQxNjIyZmFlOWM1ZGM1ZjdlMmI3NThmYjFi
NGMyNTc1MjM0ODM5YmEyZjdkNmIwMyAgL2Rldi9zZGEKZXhpdD0wCmBgYAoKYGBgdGV4dAokIHNs
ZWVwIDI7IC9vcHQvdXNiaXAtYWZ0ZXIvdXNiaXAgcG9ydApJbXBvcnRlZCBVU0IgZGV2aWNlcwo9
PT09PT09PT09PT09PT09PT09PQpleGl0PTAKYGBgCgpgYGB0ZXh0CiQgL29wdC91c2JpcC1hZnRl
ci91c2JpcCBsaXN0IC1wIC1yIDE5Mi4wLjIuMSA+IC90bXAvZW1wdHkuc3Rkb3V0IDI+L3RtcC9l
bXB0eS5zdGRlcnI7IHJjPSQ/OyB3YyAtYyAvdG1wL2VtcHR5LnN0ZG91dDsgY2F0IC90bXAvZW1w
dHkuc3RkZXJyOyBleGl0X2NvZGU9JHJjOyB0ZXN0ICIkZXhpdF9jb2RlIiAtZXEgMAowIC90bXAv
ZW1wdHkuc3Rkb3V0CnVzYmlwOiBpbmZvOiBubyBleHBvcnRhYmxlIGRldmljZXMgZm91bmQgb24g
MTkyLjAuMi4xCmV4aXQ9MApgYGAKCmBgYHRleHQKJCAvb3B0L3VzYmlwLWFmdGVyL3VzYmlwIGxp
c3QgLXAgLXIgMTkyLjAuMi4xCmJ1c2lkPTItMSN1c2JpZD00NmY0OjAwMDEjCmV4aXQ9MApgYGAK
CiMjIFNjb3BlIGFuZCBsaW1pdGF0aW9ucwoKVGhlc2UgYXJlIHR3byBzZXBhcmF0ZSBWTXMgb24g
b25lIHBoeXNpY2FsIGhvc3QsIHdpdGggZW11bGF0ZWQgVVNCIGhhcmR3YXJlLiBQaHlzaWNhbCBV
U0IgaGFyZHdhcmUsIHR3byBwaHlzaWNhbCBjb21wdXRlcnMsIGFuZCBhIFdBTiB3ZXJlIG5vdCB0
ZXN0ZWQuIFRoZSBrZXJuZWwgaXMgdGhlIHJlcXVlc3RlZCByZWxlYXNlIGNhbmRpZGF0ZSB3aXRo
IGEgY3VzdG9tIGNvbmZpZ3VyYXRpb24uIFRoZSBleGlzdGluZyBvcHRpb24tb3JkZXIgYmVoYXZp
b3IgaXMgcHJlc2VydmVkOiBgLXBgIHByZWNlZGVzIGAtcmAuCgpUaGUgZXhwb3J0ZWQgbWFzcy1z
dG9yYWdlIGRldmljZSBzdXBwbGllZCB6ZXJvIGludGVyZmFjZSByZWNvcmRzIGluIHRoZSBsaXN0
IHJlcGx5IGFmdGVyIGJpbmRpbmc7IHRoaXMgcnVuIGRvZXMgbm90IGV4ZXJjaXNlIGEgbm9uemVy
by1pbnRlcmZhY2UgbGlzdCBwYXlsb2FkLiBUaGUgZXhpc3RpbmcgdjcgcGF0Y2ggY29udGludWVz
IHRvIHJlY2VpdmUgaW50ZXJmYWNlIHJlY29yZHMsIGJ1dCBubyBuZXcgY2xhaW0gb2Ygc3VjaCBj
b3ZlcmFnZSBpcyBtYWRlIGhlcmUuCgpObyBuZXcgcGF0Y2ggcmV2aXNpb24gb3IgY29kZSBmaXgg
d2FzIG5lZWRlZC4gVGhpcyByZXBvcnQgc3VwcGxpZXMgdGhlIG1pc3NpbmcgcmVxdWVzdGVkIHZl
cmlmaWNhdGlvbjsgbWFpbnRhaW5lciBhY2NlcHRhbmNlIHJlbWFpbnMgcGVuZGluZy4gQ29kZXgg
YXNzaXN0ZWQgd2l0aCB0ZXN0IG9yY2hlc3RyYXRpb24gYW5kIHRoZSByZXBvcnQuCgojIyBFdmlk
ZW5jZSBwYWNrYWdlCgpUaGUgWklQIGluY2x1ZGVzIGZ1bGwgc2VyaWFsIHRyYW5zY3JpcHRzLCBz
dHJ1Y3R1cmVkIHJlc3VsdHMgd2l0aCB1bnRyaW1tZWQgb3V0cHV0LCBwZXItY29tbWFuZCBsb2dz
LCBrZXJuZWwgY29uZmlndXJhdGlvbiBhbmQgYnVpbGQgbG9nLCBleGFjdCB2NyBwYXRjaCwgb3Jp
Z2luYWwgZW1haWwsIGNsaWVudCBzb3VyY2VzIGFuZCBiaW5hcmllcywgdGhlIHRlc3RlZCBrZXJu
ZWwgYW5kIGluaXRyYW1mcywgYW5kIHRoZSB0ZXN0IGhhcm5lc3MuIFRvIHJlcnVuIHdpdGggUUVN
VSBpbnN0YWxsZWQ6IGBweXRob24zIHJ1bi10d28tdm1zLnB5YC4gYGJ1aWxkLXRlc3Qta2VybmVs
LnNoYCByZWJ1aWxkcyB0aGUga2VybmVsIGZyb20gdGhlIHBpbm5lZCBzb3VyY2UgYXJjaGl2ZSBh
bmQgaW5jbHVkZWQgY29uZmlndXJhdGlvbi4KCiMjIFNIQS0yNTYgaWRlbnRpdGllcwoKLSBgbGlu
dXgtY29kZWxvYWQudGFyLmd6YDogYDM4MmQ2YWE0ODY0MDM1MWRmN2RhNjMyMWUxNTZjMzkxNTVi
NGE5OWIwOTg1ZDQzNzBmN2U2MDg3Mjk5ODc0NTNgCi0gYHVzYmlwLXY3LnBhdGNoYDogYGRmYjE0
OTVmYzlkMDRiODNjMDhlODk2NjQ3ZThiNWM1OGZlOTExOThhYmFiMDA2ZTY1OWQ0M2U4NmMzOTg3
ZjFgCi0gYHVzYmlwLWJlZm9yZS9zcmMvdXNiaXBfbGlzdC5jYDogYDJlZDM3ZTk2OWQ0MmE1NjVi
YzRhMzE3YmU2ZmJlZTJhMDI0NDc0NWQ5NzMzYjAzNmE0NjIyNTUxMDc4ZWJmZWNgCi0gYHVzYmlw
LWFmdGVyL3NyYy91c2JpcF9saXN0LmNgOiBgOTQ3MmI4NjRiOTE3NTZiYjQ3NTMxNjlmNTRkZTNj
MTYzZjYxZjY1MWY4MWYxODljZTI4YzM5MzI3OThlOWNiZWAKLSBgdXNiaXAtYmVmb3JlL3NyYy91
c2JpcGA6IGAwN2ExOGZiOGZkOTk0Y2VjZTA3ODA0NzU5ZTMzNGUwZDMzMmViMDk4NGQ0MDUwZjcz
YWJhMTc4ZmJhODAwOTE1YAotIGB1c2JpcC1hZnRlci9zcmMvdXNiaXBgOiBgY2FlZGJkYzM1YTQ1
ODExNDhmNTEyYzFkZTE0N2E4NzE2ZDFiYzU4ODNlNzFlOGU1NDBlZjFkN2ZjMmVkMDkyZWAKLSBg
bGludXgtNy4zLXJjNS9hcmNoL3g4Ni9ib290L2J6SW1hZ2VgOiBgMDhkMzBhZmFmYzBmNDhlMWY4
OGZhYTUxMmYzNDQ1NTEwYTM2Y2JmYjQ5Y2EwY2RlZTc1NWFmOTI2OTY1NzBmY2AKLSBgZ3Vlc3Qt
aW5pdHJhbWZzLmNwaW8uZ3pgOiBgOTFkOWEwMGIxMmIyOTZhYmEzMDViZDlhNWU4ODA3MmUzOTJk
ODFiOWExNzM2ODVhZmQwZDc5NTNiNTU2MjFmMmAKLSBgdXNiLXRlc3QtZGlzay5pbWdgOiBgODdi
NzU1ZDE0NzE2Y2IzZmQxNjIyZmFlOWM1ZGM1ZjdlMmI3NThmYjFiNGMyNTc1MjM0ODM5YmEyZjdk
NmIwM2AK
--000000000000f6e752065cc9b12e--
