Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793667720;
	b=wxwrbnd1is6O8zSw6IS4mEVHpWCVcwPGcjV+XpUFMzGBOCLIqJKcG50thLE+CPrI4maq
	 XbD5ulfa8lKQGy/o1hlYtvo/D43bReCiGYGLA1wnANqd4AOysx0qL04QnREGvdIbR8MI8
	 y4yVWfYlR8gV1yDH95+S8Tg5gedPWvQ0+UZ9J1LlV4TqVXeoiUwDa0dKNRVk4zw/ec5OY
	 azVv0/F7CJ7vP2f6q9flUKFBKvlEdXUYCxQeE4NlfprkRwBUCNR+zmGBMii/YMZUBqZI4
	 nsUSz9L4KG6i9hQgEOTNabamJ/x+GstdSZR/4lWTjJ1acwvVydFKqMJ8Qg9S9pfRe3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
	b=NtcPRDMAdfZ399K17hcZqr/yq4Rh5Ir2leKy8LrUxiViAtd6wbCqvboSePKriUv+a1n3
	 FV0yDJebaPfBhkvuX+TW8aSD+KT0h6hgdYww6lA8EZLecMnSIQVpoG8XlrvOdIb7BlHSx
	 ND0FKf0VpBS5B1EmGDBcDY7zvrwLkbxZYYcks0wpjp341BD6fL8Q8xFrxKsd4COG9GHyF
	 zVSMVT/85Lv4kIWMgk0ETYzl663kncUqlf4+AsVFAr0UDtzyp/1DA3nKJE+i5iILbhOU8
	 6jjby6hxfYDe5JALJYLR0UitSDae2rRe5z9BHQ4oAVrKw/4RnrY1kY/y2ongrUS9BPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2ghYiae;
	arc=fail smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96FE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2ghYiae
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dd7070699eso2950631eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793667718; cv=none;
        d=google.com; s=arc-20260327;
        b=p2vDRfjMlkoOw1yy1dwjl1NwldvUn69lFOcoBU9xjT6Ttna5YgUBpjfgrg0srFyB8Y
         mduOh+kWY3A7CcfS6hK49DqSpwIAkrWmxMbwZTZ5+lmS3mlkAZV8ZTzDwSa6peWdgKJs
         ywz+Nwv39+Cs3eoQAcs5wVuTBxTwHk5X1y2KoB/XhS8CCP7nVm9aG7hD2yyOCUOvwoPC
         dkqgyXd0a/bnU+OoFJ+FQvsLhvtDsB24BE1Cz4t7usobmLSARfhTcdkWh2/tV1vwh89f
         QIYqEeTZp18WEdgK6v075ZAhBhgTSwlO3/rempYxqitXv6CQENQM4AUN4QKJujPJRafS
         6L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        fh=7nxCGiihqRw9nKX0oFuMWo2VqkvpRDgB3Y4EyBffuN4=;
        b=g8xEkjYz/pAwAvPJjI30UC9b6LnnpGuUHwoZbHOxtS96PySiTjdu94EatMji1oCNZn
         ANz5+7+eWTj42UUm9XqTEqd2E3EGexJe410Stlvxc9sKr9gE5bjsF3ch5+GEaLH5Kons
         77QzzpSYuz841GHrg24y+GtJhrrmGvZNBwYsIG+0rOQqT08R5jl2s7afruGhwzX4XZca
         7HxJVEa/V9U7P5Q7BgtJXFAXKfuOmw5y4roD+y8ZPh75N5u+ka2Kx2r3AAAnNXVvVe0m
         rsfqqBIMdS125p+SyS2Ma6Fp0z/6yWP6EiS9C2CMJbOSjv5wduGw9ld5PM/rRpP/Zoym
         ZrIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793667718; x=1794272518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        b=m2ghYiaeZZaMOOXGFGLv8cJAz95xd/jtLWKvKhmp2NzuLKy5GXqlZiwZFTzgFUsjGp
         cA9cEL4wDE1OMvrJwm2JdLXkNPPUBSYhAgrWyRg73Ruzulxh76JaiIyhm1cYMGMhPDe1
         cw0IYK8oHfqqTmBCPnovVamse3KgVZAk8iT10Rt2sskYg2I2A4fggC0h15/w3f2W8BAr
         XB1YEG5GIfTC8QXKMDC5OSV77LQrJdpCrdyxpNkA2uuV3cLFmx5vTmaig83pYiPD38W9
         QXhUqA0OcoTgv+1hVmqco9pP+mjP3EPgrDxsIzuqcLgALyuAvgXozZAqHx0r0feykh6l
         wtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667718; x=1794272518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1x1ruSwiF5lANv4OCFfUqhUuuyFdIXIOI8sj0wwYcQ=;
        b=ApEjQRI6U60rPixwY7anm056IuwWldPA6PsLjy1q57H8VAE4aPLnVrjdE89mXJVPGW
         LXKB/JrFmk0pstzd6z3/Fr7HFYE2ahmnuwJGEcxHFmzOmTjrDkfIYJvgpLE8kDiFksUN
         BWoDWBl+qHbD0VVxL81u5YFECMlAnXUFl3iguzouk+onJ6S2NrMA8l9YCoda+Xpg7VPF
         0UPeKbbfkxiS75jXwwqxJhzAuWaDVSfEWOhTbElvXZvM2W9YOWn2WFGh/QzIQzY73S08
         uU9yyhR7bF3QJR82h4S0vgjtxKCcrxuyZ4UuCLAzo9SvzpLh1vzzMOuTywH9iPMJdQCj
         khtw==
X-Forwarded-Encrypted: i=1; AKwUvBxAhHer5G04+9lvWvkaabc9SaB2YPXSkz695Vccc9SL7nTeLJWLqcBR4DsPW8VQrJ3VZUDLdpI38juBZ3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV77ng7W7LGBgHV6vqpJHS4Cf2GTdmBECwEeEFiaWQ5GF5p5Sf
	pYimVKAeznbxoFnNd1935VF9Bw8brXjnPimILh+0ESxoGIwt6whCEMljs736qkaf6RPuHBuuxq9
	fosuh0Dn9Yf6XITVqPa47iwzIDvUqjVCMFUJ8
X-Gm-Gg: AYBFou29YBFJPIzr76rOTa11UsMnUDhvCkSZGMCloT4z0nP8JjB1vQDXvIKja4ZjIZY
	n6D2MThwgTAuvJWkXvDg9L8tWpvEQmF5uJWouoAA0rKxARbl2IPpTso5xSW9r+lYOqSJiheCT6t
	ANTYQagqCMGEfs+UrAY7LXGhIxUmiztHgrOtEPxsKdpkzA3D+MLSiPV1380/NARVuZv7O+MWqGW
	te3m7MN1qIT7h9z+TrkfyGYbkA195jOAyA3nkgHSNUd/7/sBjw+qb9Yg84KsiLlVMCl2jUHDg+z
	g4S27+PSBjkZJV47g5f2AznBoU66gKvArflVb0QXqJzK6hBrz7BkTWUBWeAO2uNfDXrIuZNFTJ8
	MGYp6HRPPOtXmT8fXhM25d/4+fqpIOOb5EsanyDA=
X-Received: by 2002:a05:6820:7097:20b0:6b7:83c5:fde8 with SMTP id
 006d021491bc7-714f240aab7mr4196354eaf.41.1793667718501; Mon, 02 Nov 2026
 17:01:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
 <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com> <20261029060335.3ed1fbcf.michal.pecio@gmail.com>
In-Reply-To: <20261029060335.3ed1fbcf.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:01:50 +0800
X-Gm-Features: AclHuK9ObPtg70y5AAcvbpqJBQRzPYrnt5a9FzX5tZ2SdVerRcvdG5dD7M2HEZI
Message-ID: <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your feedback.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:03=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, 29 Oct 2026 10:25:17 +0800, Kuangyi Chiang wrote:
> > We did some more testing.
> >
> > We don't see this issue during device enumeration.
> >
> > We also found that the timeout is not limited to UVC control
> > transfers. In one failure case, the first timeout was observed in
> > a UAC control transfer, followed by UVC control transfer timeouts:
> >
> > [  961.127402] usb 2-3: 5:2: failed to get current value for ch 0 (-110=
)
> > [  971.367443] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> > 2 on unit 2: -110 (exp. 2).
> > [  976.487473] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> > 3 on unit 2: -110 (exp. 2).
>
> But that's the same device and the same control pipe, right?

Yes, that's correct. Both UAC and UVC share EP0.

>
> So it just failed and we don't know why or whether it was the host or
> the device. And this is all during UVC/UAC probe, before any userspace
> begins using the device? Or could userspace be involved?

We launch a camera application during testing, so userspace
could be involved.

>
> The UVC driver has some aggressive PM; for every userspace ioctl, it
> calls usb_autopm_get_interface(), submits an interrupt URB which almost
> never completes and unlinks the URB before usb_autopm_put_interface().
> Repeated periodic unlinks is a known problem case for many xHCI chips.
>
> FYI, I found that 7c0c31c66a7f9 in v7.3 reduced occurrences of periodic
> unlink failures on other junk HW like ASMedia and VIA. Some of those
> failures, on ASMedia, resulted in control transfer breakage too.
>
> Have you tried 7.3 yet?

Not yet. Our tests were based on kernel 7.2.4.
Thanks for pointing out commit 7c0c31c66a7f9.

> Do you see any interrupt URBs there, using usbmon for example?

We haven't checked interrupt URBs with usbmon yet.

However, we captured USB traces using a protocol analyzer and
observed different behavior between the failing and successful
cases.

In the failing case, the device ACKed the DATA stage but kept
NAKing the STATUS stage until the transfer timed out.

In the successful case, the device initially NAKed the DATA stage,
then ACKed it, and the STATUS stage completed successfully.

We haven't determined the root cause yet.

In our tests, adding a 1 ms delay to both the UAC and UVC
control request paths prevented the timeouts.

When the delay was added to only one driver, we still observed
control transfer timeouts (-110) in the other driver.

>
> > So far, we have reproduced the issue with these xHCI hosts:
> >
> > ASMedia ASM1142 (1b21:1242)
> > Etron EJ168 (1b6f:7023)
> > Etron EJ188 (1b6f:7052)
> > Intel xHCI (8086:8d31)
>
> I don't know that Intel chip, but the others are quite buggy.
>
> Have you tried other HCs? Any successes?
> IME, chips from NEC, Fresco, Renesas are more reliable.

In our recent tests without the delay patches, we did not
observe any timeouts on the following HCs:

AMD EHCI (1002:4396)
AMD xHCI (1022:149c)
ASMedia ASM1042A (1b21:1142)
NEC xHCI (1033:0194)

Regards,
Kuangyi

>
> > The camera works with the EHCI host we tested without any additional
> > delay.
>
> That's a little suspicious, it may still be an xHCI bug.
>
> Regards,
> Michal
