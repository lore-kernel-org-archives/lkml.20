Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62E547042
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800218; cv=pass; b=rZbX1c9Brp3dhS2AhtZujKckMHMdoQnzTm2LpqiszQj8YFW6xVqt9waj10zLcZ54+uDIYTe6p1SwzgbOJp2U5Mb0luH0DBFr7tgVYMUvai65/r4nnCCsw2aahfec41sNjNXO/qIf+nNxwCJi2IXyuWwXSrxs3/nXIOlH8F6xKDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800218; c=relaxed/simple;
	bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDLWdiNOoDfOSu+0oXM3jXeDgyHwUK87Uv5CiuKFbemGarFF0fMKcXgP5Hwxl+A2ZUI7CF7v6CHTRqNgXytKbTF2m0pVQ+gXFysv0dFcxXnMhfeMTBLR6EWidBxjhUKaUbzwAgqNnSnuz1LX9MaqiHQHIT6b4eQJ+iZTT7bEdOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJVbrciE; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJVbrciE"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso1875134b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789800217; cv=none;
        d=google.com; s=arc-20260327;
        b=F92Kue1xsiWo5JD7xhLBEc7aUyohUrhwHtZIKwbYuoxRew42GbZ095+rjCXk1HPiE6
         RRPYaj0FEhp//T7/N/kWI6p71h3DvAsS8zIv834A4ejiMZ7avlnMu3Bwj0fP35pjk14W
         nLt+rqR/XA2lI/FTyIrSWM/nqsWtqf3CZL3DUVmACbcnDaJ/Qfb1K4VA0IhM9Qg8gXth
         z8M5Zn+ukVIKKvg74MmYIdaurHqcCrK63yqW4ANpAr83/wF7QYFm8J7h6aYtRbG5Lwzg
         PG0bi4RXukLdEi2Pudjm5Ir8fYCmNQ8YhVi127O9vdMY4dVE3/PdUEHU2i3AlCIFPyAL
         BiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        fh=xvk7EEVptk2R/1J7XOBzszdcejjTtE8ymuehSOdMYdQ=;
        b=QCyqdB9mY64+JiwrqzcV1yoHeyi4kgQzglQlbounf/ld/sAvqQKXjPiwCtujGg+XEV
         dgfi/7H+cH10n5nB3zdJa5yi0t89W3mvcIfS0Mi2Suv4t1sWl35zQNNEEEor+sOIFMsE
         tGjwJWUqCkEEagELUHUk5ScsBeTCsX8owwN8JP9CCN9P6myaupIYteacBZtpV1o55u9k
         pdTadAQhAInyNtfRaHzRf3tvR4MxHhTS1TfJdYKwWZa7S6hn5dPpPC//ml38qZGl4hQ/
         MDYmln9MVSucJl4xrMArUkQRkewjZCyRE68+nx/Sx/FX3NN2D5blAEp8vtkfVn2cS93M
         UKCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800217; x=1790405017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        b=lJVbrciE5wg33y4l2KDvRTCI2ejM0owbWjKVvc9cGzbygoU5OqKduZuNw3JUb1fOBJ
         8oi1zMo6CiIy/6rMKMbwEkJeP5Dzf4zU2cm//RUH4DvxxXnc3TC+TkP78vM/tt/Cfjew
         VkWB6YmcViK4YmNKbwLeA3CIXFMTwApnZ1nX4sddBfAcyTvSRQOc7nrTyaZcH3j9+caz
         68uZV0G5pR9PLN0w7xptjCF55bUSWZEa2ThqDGg7Ahg/nBlKjmDj5abDxQvQ7N7Mwpny
         9mBplkJ0uKbuGxD1iyd6CZ4/7XxlFtZbQJO20oFe8R9uoZSG8s5uiWsqpjAHoEaCoeJw
         7lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800217; x=1790405017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UGhfY29435ZdNQDSOmq5JQmZERPFQeG+eHwDnrvLMxQ=;
        b=GZaoYn/0p9tOl5UFJo+LoWbBr+ktEV9pzHfeTvgPqbHUPj5ECN9Tf8yYO7Q9c61UKl
         OoYgezylA+d0LGKa8npfKGF8HStdLwncbTsORLno3upvTLU6XxlHNy2+9pOiYzQmXE6D
         olPG+h34vNB3R/5MwnepQO9rFr7U9Q33hDX+1G387kLI7Oeb37S2HknQ7inDuunMvO3K
         NTguP6O9pZxTJU8VRQSjWeAxtWS827fIdSfAUjptuklebL97EFmwan7kESHR/ZR4eC93
         v98VmY2Jo7kyoXWXBZC0+5pAuJ4Ky/ujxBQQf7JEMmKd2YPMk6epKwKfOEb6MnpGJQGu
         7e2Q==
X-Forwarded-Encrypted: i=1; AKwUvByB1WeYBbpHvjTcNo+QhQBUGXU/aMF1jdrULg3eGlf30FkAs8ZjPJcaTNGbIj+H7YJ37EFxpVt1mA/SJb0=@vger.kernel.org
X-Gm-Message-State: AFuF++m483U9FxMBx6wblYT04FrF8LCDqVQNsdb5ycjPWgmnFBTbeNng
	d7iTjgU56I4zQdTA0A5RRxlv9jiEUGlKHCHRQmTf01Cq3zE55Z201Ak+H7D9Ix8QDVoNpMj4Pon
	Bjc53eZu0P3XpIDCmG/gbivPIm+BfsNk=
X-Gm-Gg: AYBFou0i6WyhrZt+NJrW3MQbxVN7Aw8F6933/YeCs3E+FBMd84MPhUVkNIUbXa7gWst
	jT2PAg4C4BHoC02q41nyPsPHGY3oCEL8hbH146lBVtjUY8T+hJO3wiCl0Dlux6ZKIk++sRfJ5ev
	qUISr7Tovbgkb1TnmPExqtT5msNhsr0cPYuKGLtmpCVqG5a2fskQTGvmLS8pR0sYIJJXCcfzcNX
	b8q/v26Ck07yQ+TH7yR3wxWsd6jgxlIQpOGUfk+zXJe8e8X8LsuWuEDDFklgNwFTbFFK3Bkdird
	TZaZVleR+JQ6gKaE67RMyobkcW5C6g7vwvpr1rZKBbVzVgkCzQSNWrpw6WKu5uqxX1PEI5N4ONh
	E43RUytKqvRb6dcQu2gwWIXxCTHlfG/4xbWM=
X-Received: by 2002:a05:6a00:2e84:b0:878:3783:8a88 with SMTP id
 d2e1a72fcca58-87837839369mr597351b3a.52.1789800216631; Fri, 18 Sep 2026
 23:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
 <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com>
 <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com> <CAAsRjR=sHgZMgXuTid+D7Vst=N_GBUZUrduZ4YZax5rbotHNMg@mail.gmail.com>
 <95e4b5ed-2f72-4bfe-85d8-9cd7b45a5fa7@app.fastmail.com>
In-Reply-To: <95e4b5ed-2f72-4bfe-85d8-9cd7b45a5fa7@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Sat, 19 Sep 2026 09:43:25 +0300
X-Gm-Features: AcwNN1U_0lkg8y2XnHbhWP-8wPtV3LWjYNH5bn8KemEcXAz8Qk2UF5fs0iHq3zA
Message-ID: <CAAsRjRn=Kmft8-wBk5xYdSet2hSF094+f1WLDwRsbFpy5YB3Vg@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 07:46:42PM +0200, Arnd Bergmann wrote:
> Ah, interesting. So if the problem with the platform driver
> is that the outbound windows are mismatched between the register
> settings and the ranges property, wouldn't it make sense to always
> set "brcm,pcie-ob" for boards that are known to have more than
> one possible setting in their firmware?
> That way I would hope the platform driver can just work in the cases
> that currently fail.

On the RT-N18U the window is not what the board fails on. The device is
on the first controller, where ranges and the EROM agree (0x08000000 on
both revisions), and the board still does not come up with
pcie-iproc-platform on it. Clearing has_apb_err_disable for
IPROC_PCIE_PAXB, one line, so the driver never touches APB_ERR_EN
(0xf40), makes the same platform-only kernel boot and enumerate the
BCM4360. The flag is set for that type whether or not "brcm,pcie-ob" is
present, and with the property the driver would program OARR in
iproc_pcie_setup() before the enumeration that touches APB_ERR_EN.

The base follows the core revision rather than the firmware. On
revision 0x01 the EROM window of the second and third controller is
0x40000000 and 0x48000000, and Broadcom's driver picks its OMAP/OARR
values by core revision the same way. With "brcm,pcie-ob" the
platform driver would write the ranges value into OARR, which in
bcm-ns.dtsi is the revision 0x07 one for every SoC. Whether a
revision 0x01 core decodes 0x20000000 once OARR says so I have not
tried. In the tree only ns2.dtsi sets the property.

Best regards,
Semih
