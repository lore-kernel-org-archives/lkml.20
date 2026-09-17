Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5F1A9F91
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623614; cv=pass; b=MNyzpj+U+w4uLdXSDqabQUmW7croZSg17wBlFvCel55u8sidQ/eCgZxFPZwLi5jbDXfFOL/9fgN05/WXiHG8TPlKRDA13UDwzgru9vXIU+yk33YpGLY69bug86Xp0vcnryh5uuPYp0M8t5IYnfYfp2gEzwkX+2++EOaSiwO9kEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623614; c=relaxed/simple;
	bh=w9aSaSGwGY3G8SVKndL632FMAih7vNH9/9jp+iWyrT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siKATL0RK6Cvqf8ABKJishMv47T6F9/5+tv1pGA0W0chpZUOa6s+WNGL72ZCjWf1HNWJsAO2JacjG52o0fvqfReRdoPvPmHclIAqElalkCWlaJdO0uNAifLBD6CcBfXKF3HSuZpXZyCkRo1OHoDkKxdkBD/JW/QOelLHWs74zTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyBYcToJ; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyBYcToJ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34907so512209b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789623612; cv=none;
        d=google.com; s=arc-20260327;
        b=S3JeN04e/nXfTP0riEfFbchhNYytc1Wyrtm9/mTSgQK061WCxyVVs/UvP1xwRsuCo6
         pxoCchNkAkVrX7lCVLmihOBFiGiG20eBW+zq213RvtXE6LdgTJw1ljLPbfZp9VO6EIOd
         Dc0u+BEmd3w5KvS6nJ9dfjZfIYeqN6LySVF5yHyM5/wctytpXNx1qCnPzmdVl+eQqF2s
         XmiyqVPk30st85gC8Z6bKfej2KrNFdmPjwTex9lPI9DXvTffK4NLr7RuYeE0wusKiNBN
         h+byZUkXpxYvM3oemfArw01eEjrgLvKH5V7SGshtkjsTuXNE8sZRbP/pXBd1ai6Np0eR
         ZXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        fh=y3wemt287od7a6vmQBgQBAJQqSQsZ6ZPbOdTEAJbNhY=;
        b=mfE70ODVkol5d38d4Z/h8TgMW1JbC5wrR3lZsFfrXynTp7MNyUEYxrF05Lr8u61v2H
         vOeZYNPf6nlGaweBnP4xygiV9RkHZLf72JX4EzIu8JLedOE3X0oMUBqVg5mGIRoA1Hr7
         Cphuh2xRVMAbgg/zghZXEv31I51bFpvr9fRLhCgRpcLgYPd5Nc2uTjh8tA+oLtOowyZU
         CYPg8gcXlw1JxY/oSjyTC1nsZH9USF6osXt+VLzXX6ArRbwtFeG4w3mh9krkLk928bY2
         anJekycSu3TDw4ZgYnV7dOnm8W2oWKs77f7+VKrGLKfITHtCWWbEifpsJEeJIsqttwJj
         L5Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623612; x=1790228412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        b=XyBYcToJKRyG4SodLOL0BvFw1pdbaRqYR+kXPVDHi9kOEyFMS74DGwed6sNPEEG2+X
         YPuPjKNsIevX6Y/lni8BdkL1T1AzGXv4/t7LOkzmNUPYQT4scVdWUOAjwijvKAZaTQW2
         XKyfFMv2Ak5ZLUGQSPes/KZ4s+ie1Ki/xFuBKKn7TcKYLBONNyIlAgkQ44NMGJmk1iOh
         gCx9OHrkfIsSFCEYwaf1pU8KyZdFix2nP9pAgmz0krlRcJM1SyRdlm9tgw0O4pGRbTwB
         YZtU+/nmiqC/+CrhmwSSEUQfLDlcvv4YDSHJ7MdxMbRn3+9WcSyW5vEOk0d6Oxq+rZId
         OADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623612; x=1790228412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dRVSkTsx0i3rWvPyUmqwcUQ+HYyR1vrgtIB8BQv6fdU=;
        b=eXSvPSpJaWPebypHh5otrw0Ydanrqt0btEQ5U8jPEDgXhIVaqWlOBFxgkysUgq3uLK
         yAQzH41m56PVaE7jPfTm67ddnVdNHJ7Y73eLlxCDX0DJITHE+0TkbeMMi5PXvexUv8yN
         bk7kAAWlwXNifLa290ZcJ5ueXYqxW1Ast/eN/nHa9MORslhsiu9HLAAR31c/Yxequn1+
         9m+3ImhbRYk7nl9rhIrLyPRMu0jgh/UZsbpm/M8mYCfYoWuhrGzlsv21wMFdU1fNEZTo
         GmPAyuXh4ixwBHNDymUZgxlXaoTHNCUXIn22qzNHMV68jCCjSsLIzbF7k23JXiDiKLA6
         B3cw==
X-Forwarded-Encrypted: i=1; AKwUvBzYp/eEDJ/SkMfpmnpBGqf4Tfy/ZDM87TZkbvykf8ET2Pc33iRVy2+reqm2DRtlZx/KHeC8crXLvR89aJI=@vger.kernel.org
X-Gm-Message-State: AFuF++lDZUmTF0+sa9N2oDMi+pzd5aUOzmW+h0amPaUcmpMbjt35EilA
	ChNJD5LVoN8SXKHwU/jsXHQcXGNw7+gb7HhB7YGY8Pt8WVFoSCl7NJmQ7zzzTW99U1MmmPo7KqA
	x6n4bV4MDo8WGwWIk3ynChLP/0NDIFUM=
X-Gm-Gg: AYBFou0t8jiQgmIkonrj6RCf8HkXxO/BDOc4T2pBmBPe7CX0BwCc3tdv3FE5ruOKlg9
	8MrcDeMpEn23c9XNkINWOrFt6Iqu864NyqWheNt1VZSWek0ZmGXigfIAgXKxFKZepkzEr7i9o1u
	mXvcZpudJ5G+1Q4OLtJJeIcdHahn92ZLMNN0vlpg9C55tLHInD2QZuWn7VJ1U93w89KlpGESG0N
	oHwFl7oUg81JK6GarfE+9bllmyupjT8V149uw90kPm/YDfctj+CFWr13pOyBQFtJFH2zu3Mi3p0
	0YLiG36ge3yoDFuYr843Ln5/YxA0u/pyjStN1PbPqMJAszzlamBwboymBxP/vs71AwmKjyxjcFF
	E8RB4ksUQt7ZG2TcuaHu6QqWv9V8zVz8pcSQrqO6Dt1/NAwY=
X-Received: by 2002:a05:6a00:409b:b0:871:eea6:95f4 with SMTP id
 d2e1a72fcca58-8723cc3aa6cmr11213709b3a.19.1789623612257; Wed, 16 Sep 2026
 22:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAsRjRmur6jr6mOt4ifSc7DA3k7z31qZ5AWwoJ2qK8qV26eqpg@mail.gmail.com>
 <20260916200110.GA979975@bhelgaas>
In-Reply-To: <20260916200110.GA979975@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 17 Sep 2026 08:40:00 +0300
X-Gm-Features: AcwNN1X0y2YkcHZ7xCn81vOGhjIWs635iTXuJ_dZikcVuf3mTmvFXFqWo8jhClY
Message-ID: <CAAsRjR=1iL+Nw0+0erVH2t8igpobXBfcqijz4vzMO7cW=ryHPw@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com, 
	arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2026 at 03:01:10PM -0500, Bjorn Helgaas wrote:
> If bcma finds both of these devices via EROM, why do they need a
> "brcm,iproc-pcie" compatible?  If we omitted that compatible, what
> would break?

bcma does not need it. pcie-iproc-platform does.

bcma attaches a child node to a core by comparing the node's reg with
the core's base address, in bcma_of_find_child_device(), and the only
compatible it looks at is the bus's own "brcm,bus-axi". The PCI
devices below then find their nodes by devfn under the core's node,
through pci_set_bus_of_node() and of_pci_find_child_device(). The wifi
nodes in bcm4709-netgear-r8000.dts go back to 5d1f2d2c2530 ("ARM: dts:
BCM5301X: Set 5 GHz wireless frequency limits on Netgear R8000") in
2017, which added pcie0 and pcie1 to the dtsi with reg and nothing
else. The core IRQs have come from the axi node's interrupt-map since
1f80de6863ca ("ARM: BCM5301X: add IRQ numbers for PCIe controller") in
2015.

The only code that matches the compatible is the pcie-iproc-platform
match table. The compatible is also what makes
of_platform_default_populate() create a platform device for the node.
Without one the node would be skipped and the platform driver would
never bind it. That driver reads the ranges, bus-range and the pcie
node's own interrupt-map, through devm_pci_alloc_host_bridge() and
of_irq_parse_and_map_pci(). The BCMA driver does not depend on any of
them. It has taken its window from the EROM since it was added,
552aa843e4c5 made it drop the DT one, and its interrupt comes from
bcma. With the follow-up it reads ranges only to compare them with the
EROM window.

What would break is a build with PCIE_IPROC_PLATFORM and without
PCIE_IPROC_BCMA. No in-tree defconfig sets either symbol. Both default
to y under ARCH_BCM_5301X, so multi_v7_defconfig builds both and would
still get PCIe through bcma. OpenWrt builds only the BCMA one.

The dtbs_check warnings in 767012397976's log would not come back. The
schema behind them, pci-bus.yaml in that log and pci-bus-common.yaml
in current dtschema, is selected by the node name, "^pcie?@", and
requires device_type, ranges and the cell sizes, not a compatible. I
checked with dt-validate from dtschema 2026.6: a pcie@12000 node with
reg and the cell sizes only gives the same two warnings, and the same
node with device_type and ranges added and still no compatible gives
none.

> Sorry to be dense, I'm probably asking dumb questions because I'm not
> a DT expert.  I just imagine DT as being a substitute for native
> enumeration protocols (e.g., PCI, ACPI, EROM), and as specific to a
> piece of hardware, so this single DT that describes enumerable devices
> with incompatible addresses doesn't fit my simple mental model.

The bcma binding reads the same way. bindings/bus/brcm,bus-axi.txt
says the cores are detected by bcma with the memory ranges they use.
The child nodes are there for what cannot be detected, IRQ numbers in
particular, and for cores that do extra things, such as ChipCommon and
its GPIO chip. Under that binding a pcie node is attached to a core
the EROM found, by reg.

Best regards,
Semih
