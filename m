Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019407;
	b=bANgVGhZXI9fIcLaqDYS7X4tPL7y7vrH2NoW1fr5AS5muEtlkHZaS+oVBnJnkJs+vqvJ
	 mowMV5KmN0PNfaRa1L/qGxLBplDv6o5PQ9ULk1tc2ahg08oc7x0D8E/zdGVSQkzYdj5N8
	 +V1WBFD/TNY2qxfZegzg8iPvPkjGd/QuQsGrV+PtQNvcNiQtbxG1nFP+6uFJg4AvLuCb6
	 NyNgyYBS8Qb08FiNv4JLUlLPhLSU93GSbAbqF0To8ljuGdoZZ1JJmySTagMADUW+gA1Jy
	 bNRvhtsMAi6WHxwCswS8EPoKc72JQID9Rgx7tgPZv2O6HdYDEAzi98bOM3UjFuhNcsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
	b=m9MlzYTQ3rhfJYbc6RgpMAFAuMmDgsvjNI9pVRmT4Be0+kIx6RvHkMNiBexRGMKEHV4U
	 TKZfkzu8U7xioSr8YY08AdjKoyqZcK9fReZUNT1zvb6tam4mgTjq8NMCKfcURa2fdioJg
	 CnfFtBDJNKyPr4LXQR9REGvNTMruhQJfmpqm26E7nZ+/fvFj8WRFQIClpuGBLAVky8Ryy
	 /NLTm+ijME/15aUuj/Yr6H66lYJNj6riM/iqwYjWtIxBZQLle3W0OLqMsKIMveE/TV1P4
	 uj76ZCOmxLrvBpR5Nutm6ffMkDuXjbscoh/VAV9dS6kQ5ORhllha+3lS1vKmqMQqAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c1a4SEFJ;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D34A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c1a4SEFJ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so1904232a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019405; x=1794624205; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=c1a4SEFJhd72ifaLfSe8pELjRW/kdD2b/TXz+iHDU4cOgo8KZh45C20QE2/7iODxxy
         4+WAmUg1BOtNHdXZoXdDIW1yYyMir69YfZSq1DkHzBTRjTLLaRSmTgb7Qvpw3VgpgXCq
         R8Wz5uif9vJ4af2OGeLchTxojvZQ7A5VR7VI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019405; x=1794624205;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=e1S+N3e++hq4Td49ED/G5jwtdO44oTqJsEjRO4YPjZZTG8FtJ/ItcgTIUrL+tBUpC1
         MzhQ4nHLVJfTxMO6J7nMOJYGB4hpM6pybdm1nt8lDPaQtmW0eX3AKyRl6vk5/xHO1XBQ
         Rd/rd8Dh4tgWGlNjKHEAbXRL+uCQ5KjUFZJIUWIgIjHOam1hZqSGVIQJc3o9UYx702nv
         REeJ8gp0VA5nxPc71n6nQixXeX4mIfxltvmcRKtqp3/CgdHgcWwbCVZ2USPWyjS/ssFF
         39+t+6DA3zDBRZtgq2x74yJqZNXxTvktE2CCdrE8fIKCVebWBXJLXqx6GuQfxlnWKIeu
         nnRA==
X-Forwarded-Encrypted: i=1; AL+hErEIWo3WeEi3igNojaqD9oP/CHjU8aktZlS9ZqZQbSN2yld7HiEA4FTXHV28Fi4WM8G3PMM31IWOO26qTK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2mbTwYJcbO2rK8z6BiaJabxm1fVQlmL6rtVMalZpiX1cFuhUR
	/IycwqsBIhDEpiBGbv4bhx/rOA5swRfVsdH7udWoyED2FcA1Jp0yrAMCCeh1ekrpE63QPahfT0c
	Ch1TBLMkT
X-Gm-Gg: AYBFou1GzWWCqhbbogcpN1qsYnYkww7isajIQR7WwFZopJMzYMGr6p4XCcQjQbtEvkP
	j1wGA6x4HXlC+Vq+JuVud3ZpLz9TkZOYQucxXLrQjX+LDTKAV6V44/ENecQaxu9gXR0c68JLy9R
	IF4Nv2pTg6fhCEEumsaDaVM9zbc+nnv2Bi9buY/hcIqZ/r2l15FBbWVTZRyrIRY2O47IDrfOPGb
	5jFEU1q74VXtIpLhSNJ2AjyRXNow4XotkMGOyaoXK8wJze9TILPj3A8dyUWr12LVX4CMztCR763
	fkJx9VISHOgXzZ/78enIFFxrwLNqfDIXjHkAEzimLZzAV4RJWdp7W+R0YzdEpbEmNGuSmxexNeE
	eUyKLHlXB/oBg7NZ2UYlgffQxo/KZxNNXicIv8sO9At8R4zdtGfgM5S6/HNUKX3zQtBGm1mhhv0
	aAiyF2Orn+EiTghio+DmeyDqLAc+InGVW433ZPliXSp0z8npaZdX6dAfe/BQS8ynUMlQrtQii04
	aUl9NXg7gq92r89zhDkDHV1B+qwtFmvrO3ztbvwnQLhVgweuGEyQ8SnhepU8Zmme6t/vZhBysqC
	vq+k3t410rsNt7qHIRbNKKMhie0DTVhUuAl7xyD26TsEiCH0QG6R8ALAZw+0eiSs8l8=
X-Received: by 2002:a05:6402:5d5:b0:6b4:16be:4fa with SMTP id 4fb4d7f45d1cf-6b5977dd943mr2985020a12.15.1794019405016;
        Fri, 06 Nov 2026 18:43:25 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2c1csm1265260a12.11.2026.11.06.18.43.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:24 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49134c8509fso1040357f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIlDea9YRzsMdpUqvG9V2OanyN+onE06dRblTSQuhJ/RYYwcUShu1s2SoNrOsNswjeKBcZCGhWyIXx8QM=@vger.kernel.org
X-Received: by 2002:a05:6000:1866:b0:48e:7b12:aca5 with SMTP id
 ffacd0b85a97d-492c3cd30demr8053898f8f.46.1794019403842; Fri, 06 Nov 2026
 18:43:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com> <aurMrnE3vD5eCEAV@gractus.seuss>
In-Reply-To: <aurMrnE3vD5eCEAV@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
X-Gm-Features: AclHuK_3CEM0gWgFJJsOTWsUfr9-4lxY43ohtI8iBZ2YI6Uk7KHCVe6SB4RhC7I
Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 4, 2026 at 4:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>
> > +class Property(bytes):
> > +    """Holds a device tree property name and value.
> ...
> > +    """
> > +    def __new__(cls, name, value=b''):
> > +        if not isinstance(value, (bytes, bytearray)):
> > +            raise TypeError(f"Expected bytes or bytearray, got {type(value).__name__}")
> > +        obj = super().__new__(cls, value)
> > +        obj.name = name
> > +        return obj
>
> Thanks!  I do wonder if we're doing this if we should update __eq_ and
> __hash__ methods to take into account the property name.

I don't think we can include `self.name` in `Property.__eq__` and
`Property.__hash__` without breaking `Property` comparisons against
plain `bytes`:

1. `fdt.getprop(node, name)` returns a `Property`, and existing callers
   (including 10 assertions in `tests/pylibfdt_tests.py`, such as
   `self.assertEqual(prop, b'test_tree1\0')`) compare `Property`
   directly with `bytes`. If `Property.__eq__` required `other` to be a
   `Property` with the same `.name`, `prop == b'...'` would evaluate to
   `False`.

2. If `Property.__eq__` only compared `self.name == other.name` when
   `isinstance(other, Property)` and still allowed `prop == b'...'` for
   plain `bytes`, then:
   - `==` would no longer be transitive (`Property('a', b'x') == b'x'`
     and `Property('b', b'x') == b'x'`, yet
     `Property('a', b'x') != Property('b', b'x')`).
   - Python's data model requires `a == b` to imply `hash(a) == hash(b)`,
     so `hash(Property('a', b'x'))` must equal `hash(b'x')` if
     `Property('a', b'x') == b'x'` is `True`.

In `DeviceTree`, properties are stored in `node.props` keyed by
`prop.name`, so `node1.props == node2.props` already compares both the
property names and the byte values.

What do you think?


-Doug
