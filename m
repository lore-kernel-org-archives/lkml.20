Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213C50129D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668157; cv=pass; b=I4r40E+uwdQ9zJ/aQTdVXYskP9HfRKo9S7iPrKzo0IR8IQMKolbNXXir9ATms7QlITMDuDmJ8h7t7873X9DX8cyuDoUomVfZSDVJMClbhLoyQeQdI7uM3wByM6equrrZZsJvVO+hJ9wIW7EJpk2Yj+y9pucI8yILwRnuIK2SZW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668157; c=relaxed/simple;
	bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMWPO9ylHRIC9qNrCUA2j13u2gy3hhfMnRqMxzxvUU142aR0xN8/FUYYaTwKgjVdXJOtSplab+gADWsn6QZX/YLj4x1LEG5otYo0MDDUT5ZuLT7On15mDdj05XYJIdH6Sc4H0uXmwqhG4qLE0iSOy8tlvvwuEz6XSMpaMAAVOUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlFaUimK; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlFaUimK"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso10653405ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789668155; cv=none;
        d=google.com; s=arc-20260327;
        b=AaYDxwOfqO+LSNIRFQiGaTI/+jvs5NkTDYdvV23gGzzz/bt+Pkcn8Rzmb55Yhm/DA6
         2w9wKWLkMI90Qwvn1cJgYGc2Sm86ChF16y78GcrYqwnJpQ7CbhEhwViUkjIbI3e/wQIc
         arbgZP2JQRUt8/TmV8QLZsEeFl2x6+mZOOq7x3OU0lpng+FXTimXkj0gFidtXXAoRmIp
         CnMhdRt+Y9FsAvPxW1h/kTuQVixzX+4Mym7jrQD8MGFoAgAXxt+TfWe7wCUbKbjEUW1z
         0XSsKhd1QgUJhr9NXWfTREqsNvJ6BNJykV1/ZJdRDbuVBeYSiOYox6XICLFeJ433vxpN
         gVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        fh=FkImZ7BguSQTFVdWao3hYMA6Jl/VZaJUXjMofVXDk70=;
        b=j87Sj3DWt2h3gUeASKh62GNpffQDx0eEhgpkeL6Um/hmS59dc3LzZOAabRMpjM2ZSK
         Hu0MCHecuDtTNl7E3XnYWfxve6GvBChb1OZfuWxLOexNAt7iOevap+7m3X3BNMLobDz2
         Hz/H35tQlthnC/zF+LYsHsjwIv5oKduyj93kr30x/u/yUCf2c1+TKprxTwE629DA0Aul
         Ulwbm/HPic9UuYufq+d2UEfxeNr0c5CZob8xZB2X/hsi6f3hArVdX9gPeX2vI6kSJceJ
         LsHTqhcCeRVFJbxnVVmUuzlPHT323jOz1rvHID5RjkA2sGlr9s5k9gLTOL576AE1fkt4
         8X+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668155; x=1790272955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        b=BlFaUimKgEMiwJjvnh+MIlGCw8cRY/xzAVpoJT/XjQemq4kvLFSuujj9G4trL9QpdZ
         zU9PnHetcCm9+7Wp5oSP41fQ/ZNP4AxGCZTKxjugPqQMrZ2KHM9B0A67VLotIhIa/p7R
         bjMdNF3/eAROzbNi+wbQL22aqhAXVqm2ErWodY0KM11WqjcCEXLCjw/AzTWRX0nlx5JR
         jqCrz9ocPDwzetP7g5/4kknPikr/+Iz7cwzd0ku/D6Zsv4LO4raSctzJKCCAnenWU0gO
         9SfCe7kr26AEOLyZ1PvU7UN8qNK77mxpqh4dU14ezbWsCewx2+z7Q/RHr5nIrFeKKEaO
         lezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668155; x=1790272955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        b=naogLcioOnKOtwTfyF+MGMr1NEAhkJtjCdpZoxGA/SxqLCNl9nBWHRWCirVV9EEpNm
         6UTK8msIEy4JD9Hr/RbxDWDvy+0PRm9r29bHvHRv7+HQtFmUHIfEDWY07bozD5xbImzY
         oLboSHwgV63wsemKXQQwl18sBkJZarUZ208f+zqNdjYJ7Fy+dsnpuvd2svXzM4NioMt3
         nmrDmE7I+iUGQvPKypQFRgf8d4AlZBKHmLbszOuY78gsMDbiiuEz327f4SSCJMC9uwAv
         aFwUJyl7N9Q9oKgHOhc8rdHipVFKkJrnLtUKRhpcL+pa5zz7OtPjP7jpnUdwQHeg9Oo/
         K87g==
X-Forwarded-Encrypted: i=1; AKwUvBxt+4QpuaoV8m8VpGNMS7a8gSLCmcG9uWk8F3UHCH+7ac4Bs7NKkFzkFjT8hCibJSmxsc6Z+P5pVVe1Ml0=@vger.kernel.org
X-Gm-Message-State: AFuF++nsE26D8x4gxMA2S76piFyBfNj5PEIjcpG0Arpj5/GyUJwzINxz
	XFinYnvQMaucx3LUDbMIK2/1M2hzmiPEeIXpP8E528qZAQEYgk8QWnsh1X4rMH3XlpMXMQGdYK1
	D+rskzGbEKpCtx2xrdVplTgCZ7gZ6JhA=
X-Gm-Gg: AYBFou1RBxZPPvTYciXECZgvlyxtJuW0rTNNHYjgJBcL+kNCYITNNkgNDwIlF6RuGkH
	gveuFCCm3Gwa0xlmdimBRKBnIx8S7dLCprO3NKDsQd0H/nhlibn6+wEWaWsiS/8qREuMeU3PB8+
	3kP7kbEgW5lzaXJPZRjQITiNSpJMnaTYpNbho3yKCVWs7Jvnz+dmJ7NTexT5nR2uluAuMC2Oubm
	l5MmsDkydhd+UL8nhln1nh5VRGlljLgOSJ1qvt8n/xKKQthtEJCNlTllziyFRiH5P+F/5mopVFC
	9b+C2KInNL5OVCPXr7yhOwauxgfpcH3IAEttEqN0a1elzBhSL61KHH9eWj4K0cD3upGI+l1cl2W
	sNGYCV6MytJ1ja+osFnwNdeGQqwYB299D6d8=
X-Received: by 2002:a17:903:2007:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2ddb1ae16a9mr141875ad.11.1789668154804; Thu, 17 Sep 2026
 11:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAsRjR=1iL+Nw0+0erVH2t8igpobXBfcqijz4vzMO7cW=ryHPw@mail.gmail.com>
 <20260917155929.GA1023894@bhelgaas>
In-Reply-To: <20260917155929.GA1023894@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 17 Sep 2026 21:02:23 +0300
X-Gm-Features: AcwNN1WnIP6FLPzSZ9jqUd4tiuCtAEofHa6BPB6t-cxgjZWjftKahJr7LIWgfdk
Message-ID: <CAAsRjRmmPanAjpquZ4VnDDw9jqRkxPkLsu+KjrpwsOMj8-TE-Q@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:59:29AM -0500, Bjorn Helgaas wrote:
> And why do we need pcie-iproc-platform, since pcie-iproc-bcma.c will
> claim them?

I do not see anything on Northstar that needs it. I think
pcie-iproc-platform is the front end for the iProc SoCs that have no
bcma bus.

> Is there a requirement that pcie-iproc-platform must be able to claim
> the PCI host bridge if CONFIG_PCIE_IPROC_BCMA is not enabled?

None that I can find. Neither symbol depends on the other, no in-tree
defconfig sets either one, and multi_v7_defconfig gets both from their
defaults. OpenWrt builds only the BCMA one. The one use of the
platform driver on Northstar I know of is Rafa=C5=82's: 767012397976 says
it was tested with it on BCM47094, and his test in the thread on the
axi ranges ran both drivers on his board. The platform driver
enumerated the two BCM4366 devices on its own:
https://lore.kernel.org/all/93ee7456-4179-4d78-b980-1df0b7e0278a@gmail.com/
I have not looked outside the tree.

Best regards,
Semih
