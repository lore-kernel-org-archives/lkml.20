Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C638429004
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527346; cv=pass; b=rjmf12CKLgtvhhMn2vtEH7tCFHtj27VR9yokNFABM1qR2gkruSt8mkL7MWjBbpHbjmJr6m8B73S8llTMhBCcDL2fYrZEbiA0kxBXzNpsve7wIBMqFR90t0MX8P8G47sj+fpAznrGYh8xxFlRZiPQ9GWZCu7MfxP+bjBdPm/EFQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527346; c=relaxed/simple;
	bh=Y5NCAAj+S8CVX/AK6zeAmzUsBUrcPbh6f/6GokfhsQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgnkMNqjBQVT5w4fsWVmR8fskH9/3CRj/ycf6ACLVXGb3CuuIHe9DcUnM6bX+v+xnAGQ6T50ogSmUpd/GNoCsa0utGDA5MxVoPiA9s7y57ZfZNxmEXu3BTj1lmwc14/qTk9yJ8ljOcMacugppfZsMCCI9MQb4P5n3nPWvtruC8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFB9ma93; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFB9ma93"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1701294d0so1193689a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791527343; cv=none;
        d=google.com; s=arc-20260327;
        b=sf67J7tnjfzyIWzFc11DeacPIi83bmOgo/G+8vcI2oFaLdBV+Ut//3QnGUJlqa6MCi
         FRROxiK9IAHAXsShLULYnsL8rFZ2SSI54L4NXvT8U10mVkS5loK1zkLp1SJXb4lxa18a
         PcRQkTbXmngnEGRZbUT7g2qMhUG44CVGhBrVG7hVoWzKDF6BSJD8DuhvThTxt1xv41PZ
         +J0RIWKII8tRD2p1rrz7cUjScKET4Iyr+4KTPY8EWqsgToQUPmCuI6DiiY9W47ia5n4P
         rxhAF4OV8Itv9UjkNRPJS74A0D4571W60WMVbJBC00aI04TKcCALKBgXufzc1Kp2tfBd
         RTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U1VUoDa7q17rAeqnY7bbHsgshGRs6k3XUU7zBz6pXTY=;
        fh=SgCCGooLyIoMy+BjQ7hx11aJ0RxayceDC9Xp8zdGROU=;
        b=tCjz8UuMV2qo97QwQxxJiYwWzMMlspQP0N2SEXyNCpFkD/kuNZFTBJGfZrK0LBT2rd
         dR0H1KTYejbTbmDqGXeiVc4X+Bmi+KMlGYPCyAB1oVqDBUk8XbxeC7+bRd6ewanjSj3Y
         /2JsspOI6ki8J5nZP7lvSCuVFKHyG6C272bLK0CREI9DngqdSZ373OhKoMTO/1Db1d3I
         zNaQss+dksTPKqShpmWYmEUmylyi6LVveaHcBLbUaD9xtiCDZd2SJTz/yl+oNWtpunPR
         hD0+FIAZrcB3sTXqcvNsWGL0UHvQZxenBkeXQndUBW4KjPtR2Zhrl42b32BcyWZLAfjT
         sskA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791527343; x=1792132143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1VUoDa7q17rAeqnY7bbHsgshGRs6k3XUU7zBz6pXTY=;
        b=WFB9ma93JZ3Nl1BNB3eZkXfmHvUmBSt2pU5rbVClkK9djK3bnXDrFrGVfa71uw5j9r
         bso5qwjiFI9JVSoYThINt2nTUnJzeJS/I9eRmPtI/JZJLbKsGvZ/cm9IjjcQJ3V/ugy5
         l8jD+oE8aZ/S+iTPpYw29e5dyjcKPnUr7xsIzT/liKjKFNfSyOK6Y3b0JjV/tUojU+NJ
         hrBCo3BsdHtDTJZYYcYgQHbUaRdK5sLU3oTtl7zhHSHXSZn6noIo3Cbiq5Do9AGj2f2A
         NHVGjmmKksg2WcAQlRyyRreXCDvAVbJgKW0HlTGm+Wf/CE70A4TnNcxDq9WXfhgh4BE8
         55TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527343; x=1792132143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1VUoDa7q17rAeqnY7bbHsgshGRs6k3XUU7zBz6pXTY=;
        b=dJMy8PuQU6SzJBxEuu5aSkSOypLq47YZijHE2tOaMoq4KG768AArZhxDcDAJErbl8X
         m4fo3dfs6AtXri30ZBkNfD6OaqF/PBiS9R6OG2DIgy703y60gBjmM/u/BEUJ7dM5F4hU
         2hlYUnuKqEpCexz0uqyoixfuhO6PwP5mP7Ah+sJ+qO9Pya7d6ptguioh002+VPIZVecI
         B2xGGobVAl3KkumamcE6Y/J91rwqrts+NPm7yPcTOI5Iy5ZiNdjaEARNCVrvEI2h9P75
         /RnhbOaIls0FOqY+wz0ROv5ejPZPyXHKTXIUPLnwldKhzJBhIjNCFskS6+TCqq2ArFCp
         r2LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg9RL9Lx7bR40gS0O//YqQTPfYzGYg1dDxcTpYsCpL9ajCziSO6HDRiFUtIFYwgah5gAxA2wvPfHvuOfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdtJu7RhVdsd5Gtc0c+YlfEhVjKVFpzsUAfIdFBlUIijr72EZg
	97OBPtLiI5AxPBcJxWS1x+Qi/6xBPMfl2FrD0QqyxNOxhhAW38lipiUrSCx3WmXXJTlB8nkO4L0
	w64Irz/mkR+16Ud0Sv6pWnz+w5vXhHkk=
X-Gm-Gg: AYBFou0nWAML9euJQs7XU0ik0mlAuo+2KuFovfJA/iNK6LRuWjoXp/cZ41v6BHZqlaq
	rt7u8MG9Haj9E6gBkFyEOsNci10Iebe1c31YbLpcEpQnavK2cVe6T2wPdOmsbcru++VUL6pYjXv
	SKL3SFjsXM3ewoUihOdOwPN0b3wbbllZTJ3GZh7oc0pFPN+NWV9PKrnQv7YEpT60sXqYk1J790a
	xhslK/TneeiBJVk6xyFQXb1iC89VaNLXfKHoDlGXLn4xeusjM2NQE2O7DX32qvXjpD+Tud87H+d
	7ymOtr+YmapL8PNwtXDogSByczBD1ln5V6UOMAqtIZlEWVJ7h4+nycB2HaRCEtK7W0Th1UsAvBv
	uAmAmVaeRjY1HCk0AOBsAZCMlxnxs8Yx7eCVy8Epgqg==
X-Received: by 2002:a05:6402:450e:b0:6ac:9a44:d409 with SMTP id
 4fb4d7f45d1cf-6b17c1dec0cmr625458a12.4.1791527343140; Thu, 08 Oct 2026
 23:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008220433.965791-1-linmag7@gmail.com> <038bffb2-e40d-44bb-b7ce-53e9de32e50d@lunn.ch>
In-Reply-To: <038bffb2-e40d-44bb-b7ce-53e9de32e50d@lunn.ch>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 08:28:51 +0200
X-Gm-Features: AclHuK-JpJJ8BWVdNGK7pt4HrpIyJkAQKyqnfpnG3fkPyd0w-Sx8RYMtjvqDjms
Message-ID: <CA+=Fv5QvhYd7EqVBYKWVgvf92SLE=FjE8EYcZvUQ7HKdx2kc3Q@mail.gmail.com>
Subject: Re: [PATCH net-next] tg3: normalize inherited M3000 register byte order
To: andrew@lunn.ch
Cc: pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Oct 9, 2026 at 3:13=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Oct 09, 2026 at 12:04:03AM +0200, Magnus Lindholm wrote:
> > M3000 firmware can leave BCM5718 vendor registers byte-swapped while
> > standard PCI fields retain normal byte order. Match the Fujitsu 10cf:16=
5a
> > subsystem, IKKAKU model and swapped revision/product signature before
> > restoring host control; reject failed PCI accesses or register readback=
s.
> >
> > Keep this in probe so failures can abort initialization; SPARC firmware
> > enumeration skips PCI_FIXUP_EARLY. Normal rebinds and other platforms
> > retain their existing path.
> >
> > Use tg3.h's MISC_HOST_CTRL_BYTE_SWAP and TG3PCI_GEN2_PRODID_ASICREV;
> > the inherited state was observed on M3000 hardware.
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
>
> > +/* M3000 firmware can leave the on-board BCM5718 registers byte-swappe=
d. */
> > +static bool tg3_is_m3000(struct pci_dev *pdev)
> > +{
> > +     struct device_node *root;
> > +     const char *model;
> > +     bool match;
> > +
> > +     if (pdev->vendor !=3D PCI_VENDOR_ID_BROADCOM ||
> > +         pdev->device !=3D TG3PCI_DEVICE_TIGON3_5718 ||
> > +         pdev->subsystem_vendor !=3D 0x10cf ||
> > +         pdev->subsystem_device !=3D 0x165a)
> > +             return false;
> > +
> > +     root =3D of_find_node_by_path("/");
> > +     match =3D !of_property_read_string(root, "model", &model) &&
> > +             !strcmp(model, "IKKAKU");
>
> The DT Maintainers generally don't like this.
>
> Is there a legitimate reason you would want the bytes are swapped?
>
> Can you not just probe the registers, and if they are swapped undo it?
> Does it really need to be conditional on the machine?
>

Thanks for the suggestion. I've tested a revised approach without
the machine-model or subsystem checks. It checks the BCM5718 register
state, leaving a normal revision signature untouched and requiring
the swapped revision, byte-swap bit and product ID before correcting
the byte order. Both register readbacks are checked afterward.

On the M3000, all four ports normalized at boot, with no additional
normalization on driver rebind. Link cycling and bidirectional
file-transfer checks also passed.

I'll send v2 shortly.

Thanks,
Magnus
