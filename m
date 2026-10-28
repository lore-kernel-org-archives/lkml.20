Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793148953;
	b=QwR7arnbrRh9xx2Ox7a0dAFznvZO38rTMRywpj1Yr3MhiRsPzVplWDfw6KzQueoEIPQo
	 m9F+li/WE7+gqzxIH4mhC+ajSHxmItaIOqb2xbOy8gTlUsB19Gws/r93w3ZYP9EHsWtn8
	 Zqz55q7H3M9zjtq1mTJvBFL7Q3CVSGcQhV5DRe1RbRfWDV8LHn5DPkt1BPqwHn2cPllRi
	 CoNvLB7otAgVGk7oEtoAu+1iE0qqbgZI4i14R908Choca0ZReEl+j3vqsQCldT0ucUKx+
	 4nHoDQvr1/jBPhoZmLaMB9R/JtKwQb5DpZ1DtbLz7SauYKhdG2/aEoJC66YnkvIFF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793148953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=;
	b=rVsXegp3TApgS8zisxQfCM8OORUFAdoZNBrFzzBrghQxgD7Cvj+gaJOWVy4Lf2mtpZUH
	 Y/zstpyAOp+k/OjrtywFkavazPiv6oWt2YsZNT//2QBFdVLO71BnU13Uu08myHUUCRwzp
	 jE1bEarpTKpzgmjxqDF+/kQmNZr+dGnunlfzHfBEMa96FM+nYD566xhrSdO5PK1WlBSmb
	 bcfka1E1orRjacu0527HmiAsem3P/JAg5/uOjdTONdGv3y+V7QhY3+L3NM+5j/4Pmer0h
	 0qtY7j5rIDc7QIWMnqaltSyZWx33/AqPMYBWaN1XljfHtjn64ZT9A4lkccAGZTbVspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BmF++g;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC22606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BmF++g
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so4958785e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793148952; x=1793753752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=;
        b=f0BmF++gIrsae/Hwij3CebxuoKhvrOBcBTXvCW+7m0+oSZrjytHilILdtPW5mHckP2
         WJvkHYZMRkfSoBZnikgve/4H89OlmdjltI3qdNzVGdNvhqo9G9p98Klk9RLildbUad3y
         wF/rFPODp2pGcnK3OCisBYNUREk0IiRPrCwe6BssXbdD0f5504jWthwc2aqLRN6K6PcY
         /U/b9127bd3JyvSz5p9LrwMY3qcXxLiYMM2a0TR/vFMcqf4g5WPXZCCxnbzG7StN8kl0
         EQ3N6iJ9s78Jwyw/8+h1VaEzVX2V/jvSIoAmU/4dMqxNE+OS6S5bo7hNrJmBdqcSQCNh
         Tb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793148952; x=1793753752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=;
        b=pZZXZH6pqh9WgdrjQFxD+EU2ZLpCZNYlpo/Nz2/QfO0BOD1cWM8EoDedxty2fWpjSz
         Ulbd/joUHeysahq+djWY4augru0AA4IzvZe2k2ZtO3hHfh04v6k17H0gUIl1lK5/VhH8
         bCV6/68eD7QP3zBOLgwjN0v2ShLBH+MwrY0cUwgXTlvpDrR43O8A8VOcXs4hF+MBEAIr
         SKURtrGujsFur0eAFbcotiUU5v9X8aQKTgRg/Q+eu1hCP8lCAWDgLOHQeLcA8FrAjJbo
         tLroGjZXj4H/MOSDn3R4D0lB/OdUqEnZKFX5A2c20n/ZqYjLBABN+EtFeKfevc5MqoFA
         XBzw==
X-Forwarded-Encrypted: i=1; AKwUvBxpHfOPhN58zzPIr5pNnuN2RlplQ48JWtmN0qtKScK+w6u2fo04nuLs9G9HH6EmRcnZOB5uG0BA8K4gk+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7ONAkowU1I43FIjsHR3xoXzcVTjejJGXjt74407dltoNc1FcW
	Ge7MglxMbdJhKbgFzCSrQJffmxzk5CTD+tVgVfz9AGp2d3QI7XiIdNoD
X-Gm-Gg: AYBFou1MRBiBosqwcr8Nitz62oq23wN9skOMn29Ge9BIkuEDlMdxCZhNPMgfTYkUiIr
	Y06C2JgY/S9PKRIoSsO6OBq7mOkVLbhzwPyDj8IP1l59iFCyTgyoPYeZzb9vgmRrGemTrkC+5mt
	zlUYrU3YEb8YLAJLHIvRteyRyJxN7V0GOp0LXDyr8k3BaqRUzRcVC87uC5fYPOLfTISE/lQw+Wa
	6nW/VipFPoUXe2NawTGls+hjOzGe9q4Hk9opMNdWI68u9fRehu57B9Eg4XWanavqFTSyY3uqtC2
	KvWBaJYHaQyogMbAym/XaOBKyNlpylblYDYGfmhyvIJjoxK7nqSLoaVJWYCYPFn2LfaolQIkFLh
	cQsJO77VtDyImxxTSuQ5DmAl0+TZT8St+E7HnTTf3MW7USiVS5x5Cjh5IbQurZAXiK5Fk3Z3nlR
	jbriehPbJmXhxLRDsBxYYKN4f+ZFBMV8qAh+VObb5eTCVTXGfzD1yhoF3whfpIEIe+uP4yvdVrB
	JWTUCz8ZrxMDajcCinB+zLbFZZPLjp/eCLUAqCE1Sae7u1Y1UtvI+7lIVcLjWblYlGFo9rmS3NY
	rlPsP+720LWwuhI0UVsuFs/Rj/Bw74Sb4OQeEM4k6eGt6NOxiSmSsWuDS4IA4DBlZhWyKiFjdlK
	1jclSVfyY5jOT8oakGMeeqFFiWf0lsul/0kGcmeEc7Ij5TQ==
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr14042925e9.15.1793148951455;
        Tue, 27 Oct 2026 17:55:51 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm25111999f8f.50.2026.10.27.17.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:55:50 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: iav@iav.lv
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Wed, 28 Oct 2026 00:55:48 +0000
Message-ID: <20261028005548.2399155-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-h64-pcie-resume-tpvperl@iav.lv>
References: <20260911211559.207990-1-ehbello@gmail.com> <179196286749.38040.5597453767131590054.b4-reply@b4> <20261016-h64-pcie-resume-tpvperl@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 16 Oct 2026 01:21 +0300, Igor Velkov wrote:
> A data point from a Kobol Helios64 (RK3399, JMB585 on pcie0, ep-gpios as in
> the mainline DTS):
> - Enumeration at boot works with and without this patch.

Thank you -- this is the most useful thing anyone could have sent. It says
that on a second RK3399 board with the same endpoint chip the patch causes
no boot regression, and that your board does not have the failure I am
chasing. Both halves matter: the first is the thing I could not test, and
the second says the failure is not simply "RK3399 plus JMB585".

The boards differ in ways that could matter here: ROCK Pi 4 has
vpcie3v3-supply = <&vcc3v3_pcie>, which is regulator-always-on, and no 12V
supply; Helios64 drives pcie_power from a GPIO and feeds vpcie12v from
vcc12v_dcin. On your board the endpoint's rails may genuinely come up with
the probe rather than seconds earlier, which would make the sleep do what it
was written to do.

That distinction now has measurements behind it. I instrumented the driver
with two module parameters, one sleeping before the gpiod acquisition and
one in place of the existing msleep, plus a ktime delta across the two
gpiod_set_value() calls, so the PERST# pulse the endpoint sees can be set
and read on one kernel. On ROCK Pi 4C the pulse is 1 ms without the sleep
and 108 ms with it, and what decides enumeration is the pulse width alone:
delaying the assertion by 200 ms changes nothing, while 100 ms inside the
assertion fails every time (0 of 5). Since vcc3v3_pcie here is
regulator-always-on, Tpvperl is met in the failing configurations too, so it
cannot be the discriminator -- the wait being redundant is only why it is
safe to skip.

If your board genuinely powers the slot at probe, you would expect no
pulse-width sensitivity at all, which is consistent with it enumerating
either way. If you ever want to check that directly, the two-knob patch is
throwaway but small, and I am happy to send it off-list.

> - Resume from s2idle fails in rockchip_pcie_resume_noirq. On plain v7.3-rc7
>   with the mainline DTB, 13 cycles pass and the 14th fails [...]
>   On an Armbian kernel with this patch [...] the first resume ends in a
>   synchronous external abort in rockchip_pcie_rd_conf from pci_power_up.

Two things, one agreeing with you and one asking for more.

Agreeing: the failure happens on plain v7.3-rc7 without the patch, so it is
a pre-existing resume bug and not something this patch introduces. Your
conclusion that it does not depend on the Tpvperl wait is supported by your
own first measurement.

Asking: the with-patch run is on an Armbian kernel and the without-patch run
is on mainline v7.3-rc7, so the comparison is between two kernels, not
between two values of one condition. "First resume aborts" versus "13 cycles
pass" is a big enough difference that I do not want to attribute it to
either kernel without a same-kernel A/B. If you are willing, the cheapest
version is one kernel with the patch applied and the resume hunk neutered,
i.e. in rockchip_pcie_resume_noirq() replace

	rockchip->supplies_pre_enabled = rockchip_pcie_supplies_enabled(rockchip);

with

	rockchip->supplies_pre_enabled = false;

so the full wait is always performed on resume and only the probe path
differs. If your first resume then survives, the resume hunk is the problem
and I will drop it: the failure this patch is about is at probe, and the
resume re-evaluation came out of an automated review of v1 rather than out
of any measurement of mine. I would rather ship the narrow change that was
measured.

> - Plain v7.3-rc7 also hit an asynchronous SError during the bus scan at probe
>   in 1 of 4 boots.

That one I recognise. On ROCK Pi 4 a config read that gets no usable
completion comes back as an external abort rather than as all-ones, which is
why a non-responding endpoint takes the machine down instead of just failing
enumeration. Yours is during the bus scan on an unpatched kernel, so it
looks like the same root-port behaviour showing up independently of this
patch. If you have the log with the faulting address I would be interested,
but it belongs in its own thread rather than this one.
