Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CF2E7386
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720206; cv=pass; b=lGyrk5ZoMgVew+wtiWf1TqY+hhlJS0QAKb/uSEA3Ko2svHAb8LcGsKnqN94mhcy2jZMxr2CCcKYoh3ptIogSX7xKtGJ/qMZg872MuAlIwfhQ/WwqFqSqRExWqrzvt/l0g7Tn1dz+VKzRu9PTxdlZD2NLae3MNRfeH+rvojpC3qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720206; c=relaxed/simple;
	bh=WbnawmQyDpkbaTjWoYue2BZ58MDCbSdSqHChLN8rpps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZag0Hz5r3BGqK/CLEwXbKsgLrH9Dxx3EC/4ws1SJ8nBnADahQmCM/sftGrlTokuEcD7QB47nEs6keBXKVjhi7IO1m4bDPVGsHI9K7g19XqYElSX48zENrLUdPtQ6U7SGe906ZiD4yt5lKlE8Z9ExYz6zl4goh/Lco5TM3QFgHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp5fE2i1; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp5fE2i1"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35601so293813b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789720204; cv=none;
        d=google.com; s=arc-20260327;
        b=O6h/jv3v6qNFB7XaSrokii0PIUyE+J96yPU+YAxjfASk4WYnHfSqpA4k3jDeot1APP
         Z2XY7VsBzVydyoO+Ddj7lWDalBXLBuIxR4SaVwSqsnMuP+mE6l6/K4ki9EeNqqQPOTSS
         HBlaI+vqLpHtlej8KQKAWlpL8iUiuU/PPLTKxmJHFY8AfU5ldgyeQv7ggtuTZluse9SA
         HPc2+cLsS4AwDamY15n3MvBNeYNzY22m5cPZEUbbPTHQ7mwXYUaAIa+M2siwTczAgfw5
         VozA6Y1XdxIL/q5DXMdjKan3aAlniMX8m4oaNJZbXRF5RIpz5KGZvx8LKhV+/G7wKkKF
         6/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        fh=cUqPFelcnJ/0jNie1J/J+SN/HiZyDTFKnrUXPkWkxPg=;
        b=pkoOo0LBFXPuxdLmiVKqxn/DlzGSHInMao5XRBoTkr5SjGTiX9ofF2My2FgZ/ORNUT
         C0K6kO6E7Udjo2l/hfhMZ43NRtDLtCllT0OPJl8QN+6siL/tiRx9r3H6BToku+3vU2ZX
         i74DF06sR6YcTGMvtybGvz7xUCPNeLXbQ3sI+2LwUYl75WaqOv1kSUSE6saMme7/qBF/
         U2knaIqaQrEHPjTw73tBp0TQOdPkiG0Oap9IogW8Z9l3X742S2wPy9VuxHxQ/azHJ6+p
         oS1ua0cK9U24mDx4EZX/csu2BxA1R5fQrMvkS4IoGMnrJkGZdvXajadWxdVea+soH25b
         WySw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720204; x=1790325004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        b=Bp5fE2i1/p2Tqw+5tdmX69eGrfFyCBrWbE8baJI7ceEjEZPRoBZTUI1/Mz+qIac5/G
         IoZuPhVrGvnHXS6SJrG04L2gwEQMgbs3OtT2Y70iZAfaDSvGxpfuvJDScRRLSms1umAt
         FLFkL1igU6RfWWKSqYIZBoRG11uqyK6TaSotIqsCvcO1wlCCY7AjApsG8dDiSXZJ6JD+
         +mp7vF6iLM1Gic/tk2IxYyVXy7fRSlYa1ebvIPS58q0nKElT1rS7/8K1TWxkZiIk0T8I
         cP0eF8iy7nt+1wdGHwFMgupAZeB3wv3X4Kx8SQ8lgp9jnD9OOE5cW5yLv8TQbhLT26N0
         dbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720204; x=1790325004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48Dk3iwNBX2jdzyXIh2OB09+BWpkuBMXHAxnmCdSn4s=;
        b=tPLl5iWfNMHGhflgFuOsNwW5DnZ5CL8KknZGkK2P8Xnw+qwS+MWrQlO79Z6bYXGfed
         IvkmX3L2sipN/liJNIJQ0L45bHr1C0ytJTuyZRumhe1TDtOTcwPgGi71BOWCS+qUPRVQ
         SqtdA8CeEVWPs4kzJqbrVfaHWo7vkbNqQ1oExlI7czdW6gcll61eyKQA+7wh/7oIlqQa
         gF/yLJotvsEiEJTgw0zqYBNBTcNHYpKNejeAaxXB1TBoPj3gmF7fIFMQ3xwJLYEeBYaF
         zpCbsIGrCVhl+oWJ2W6nzhHbok/2N7XIhh3JEqbJYmFX4dZgqvvH2Pg1fjWwKj+e9ad6
         0gCw==
X-Forwarded-Encrypted: i=1; AKwUvBwrHiQ9+x7gWk3VxKuPIx7Lu/qhI6rlM3nd3AD1+OI0KKwISiAVMdDOq2uggR3y8VqQs8Sz/kH5Km2PyGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfjazirvB5ccJTY0FyG1NfuX892KSMFeLEMCuT9/zPbl8HS6Hz
	qqEhgAb9pszOGBZMqZVLAsKCwWOeWNoo6gMOoNq36SnmHrosD2gwSzSbYXkPU1RjK6IdMsEeufy
	kL8rucxiD0nVN96IrDVbQSAZGJNzDcIM=
X-Gm-Gg: AYBFou11MLflisdEIVjpW9se2tOGTqNd4ExoHSDRcfaZXKeOI1Of548sRHbrqw+3gbb
	r7X8oHJf9WC1sTN8AzEyM6t/PsCmYy82ZL6nrGBV7mUoQ1/CeRc0hezrbc8/uVbIUnSP+mm9HyQ
	xlDeGFrVQUQmPPR1qIHyXF4jKWmE1N7tuwGYgPWqxRhBIprix50M95a/dDs1zS7nFWS2fiBcL/F
	i72UDj1HfrV9u7LFrXb2AXc+cgoSzS6m/uRF2HU8U2L4VYPwOhqMuqCO6DZaJY6xBz55vQ1KZZn
	FxInJ7H99esmXzNuWG8+Latj8mwxP6yP7gY5YZ7dN1WGkcTxP+VKPAwWYHlexZckQKxfZRVW7vS
	Qy97xcmmxubYG4JaspL7QeiFKOHEVPQMjaVw=
X-Received: by 2002:a05:6a00:1f06:b0:857:73e2:9108 with SMTP id
 d2e1a72fcca58-874ddbffd9bmr3487891b3a.24.1789720204444; Fri, 18 Sep 2026
 01:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
In-Reply-To: <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 18 Sep 2026 11:29:53 +0300
X-Gm-Features: AcwNN1Vmx2igfjBEkpa8Vuj31sAw9NZLYiN87fYoRwyCYEORDw-WFA-KB1pOT20
Message-ID: <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, bhelgaas@google.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rosen Penev <rosenp@gmail.com>, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:27:54PM +0200, Arnd Bergmann wrote:
> Would it be help to change the probe order so the bcma driver
> always comes before the platform driver?

Only where the DT window matches the EROM one, because that is where
the platform driver backs out.

In the tree as it is, the platform driver binds first.
bcma_bus_register() populates the axi node's children before it
registers the cores (drivers/bcma/main.c), and with both drivers built
in the two PCIe drivers are already registered by then (both are
device_initcall and drivers/pci links before drivers/bcma), so the pcie
platform devices are bound as soon as they are created. The order of the
two objects in drivers/pci/controller/Makefile does not change that.

I tried both orders on an RT-N18U (BCM47081, revision 0x01) with both
drivers built in, on an OpenWrt 6.18 kernel with pcie-iproc-bcma.c as
in this patch and no wifi driver built.

With the platform driver first, the board did not come up, on two
flashes. The same tree built with only the BCMA driver boots it.

With of_platform_default_populate() moved after
bcma_register_devices() as a test, it boots. pcie-iproc-bcma takes the
first controller and enumerates the BCM4360 as before. The platform
driver then probes the same node and fails in
devm_pci_alloc_host_bridge(), which it reports as -ENOMEM:

  iproc-pcie 18012000.pcie: resource collision: [mem
0x08000000-0x0fffffff] conflicts with PCIe MEM space [mem
0x08000000-0x0fffffff]

On the second and third controllers the DT window is
0x20000000/0x28000000 and the EROM one 0x40000000/0x48000000, so the
platform driver's request goes through and its probe carries on with
the DT window until the link check, which fails because nothing is
connected to those two on this board. That is as far as this board can
show.

On the first controller the DT window and the EROM one are the same,
so the window plays no part in the no-boot. With PCIE_IPROC_BCMA not
set at all the board did not come up either. Clearing
has_apb_err_disable for IPROC_PCIE_PAXB, one line, makes that
platform-only kernel boot and enumerate the BCM4360; nothing else
differs between the two builds. The flag makes the driver read and
write APB_ERR_EN (0xf40) around every config access to bus 1 and
above (538928fd6ce8). In the bcma-first build the platform driver
never reached bus 1. The PAXB_BCMA register table has no such
register, and 404349c5c806 ("PCI: iproc: Add BCMA type") describes
the BCMA-based NS as a legacy PAXB with some registers missing. On
Rafa=C5=82's BCM47094 (revision 0x07) the platform driver as shipped
enumerates both BCM4366s. I could not see what the access to 0xf40
does on revision 0x01, only that the board comes up without it.

Best regards,
Semih
