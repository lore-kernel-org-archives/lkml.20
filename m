Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616446C83F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464590; cv=pass; b=Aw40DZLgjW19IaQ4qDzOhp7qG0eU7emBhanzjC6vsaTe0JcmAXAud9LS4/XQkHU8ICNa/1GIdgHXSvj6WUHhbJE2/aJfbneKHCMS+AFktDr2jCXxQ3XLlYbo3b52akpKQx9ofSdSp/9K1xXasjWBdNFlRZ8b7JOdGwD3Digcy7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464590; c=relaxed/simple;
	bh=zbj+RaISY9qEBJ+o2V/HJBoiBS/Q0644xws79i/6cIE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COwgrD1Rl1nsddjhrX1kZClPEG9evJrv8MSKNe6bmdCPmbqkJc6o65j5CywIbIZXwznNVEm8U3d+nSp3gto6vy5eHCDjxcdL/voDJtD3z7seZ3AA5hP8iuvLRN2L6ZBghxinOBo7WkR0RM25Q4kNN2KO3kNWiGzfFbLlZrKcEXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjCMyWvz; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjCMyWvz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2788937a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791464589; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUT0tbJf8PEHr+ih29ANa3hluQJ8px3x8OCh1SVPQ1gMb1OFpub9dPYano7XGbd866
         NG9ukmKg6xH5NwF/qHAlwo8yYme/65efwT15atJ0fKWxirPk6Py+abZvkKb6xOxqSfoV
         5T4yLOkZAb5hCj5SBtDMwTzVTsS2FT0cTJVU4pDb4YTz79uszq2u3EgHvVNYrqUHxFk0
         YNj9WVGumK8Lyr/ZC9QAGSfzgASMb4mbSlx4NL5Kkmvh0wb5gt8umML2Eunf4hNLkG0X
         OP8GKdOw8zAKGIe2uFv79BMxW2caV4r6svNuw3KoQBTHrH2B5uzAx5xAz6W/dWfyOehF
         iYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        fh=yr73PMFmE5xr5arWpavwHAPnhKsZQo6a9nSmsAZ0XkM=;
        b=LNl5lJEPFfwNcFRUWpguYkdPfM+hLDyp4rJUyVsp/RLSTWYDhml5AM5Ebgwa10aoxy
         vy4pIiA3q6gP5/qBkoFNrq41e7a4QQbktv4aeiWLmJe7AygaourKN+2uo6RZ+byOrvCR
         ZErEouoMP9yTGb7Fyn4PMMgGNPLTRaab9L8NgpQUfjxj8qXph+XxU+6D53WL8Gp6rQOZ
         CaeGp7h7fFT1dzZdtPMat7qGe+bgQzfWtRRHPsaIXyNvwYO4awC1wODYwj0TXw8bY5it
         s3idDczr/1d1+HDo09u2Oq6i8XQBc/umfIp2oQXfPVLhulDX51rVtY8MybPutQ4ruN/D
         IvXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791464589; x=1792069389; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        b=RjCMyWvza4XPw3qj5JYeGGdkQEu1yZu93F/Pk2c7G/w29DUHIYmdNplV4Ilm+LFbsW
         JluWoEQD0fJECaGtsXe0ijwk6oCjaAeczNFOycUPKl6+g/Pc0cEsRG3InkxnN79SzcS8
         rmmH4PT4Qcay3M8OHq9/TqJOuE/mNmV1CHtbGhoTU+NNB3X67IslJZxQHguS3pf687k+
         cBmrLX/0Ch9C1pnvGo+I9YIBTCpRA9LswqR8amNGT3ZVAuM6y/9lyo2x/RaOG2XixR+1
         c/uhRfY2MDmNKWBfRYNzfTpPk4mB2j1gFLNhC4n6+l1xWagp+5QPMZKfMtTvOUtrHruG
         TDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464589; x=1792069389;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        b=wm0IkeV6BBLxLsQUjAplWuhRJAbV5ek4O9FWV04tQCVODg23wli+CMILhZOJ6wh7vB
         kyaoshOqwMHf7WchnHbZxSfHa9Zbwr/0TFBk7gDXhwmFyFaawoemU/IteoTgAEARk8TT
         HOoKyoNqLkEVtLIylCOgyAgLri1XOkHkL15ffZ4IwtpZUy1S9y7+ncHjn7zi/GylREzM
         PaZKKUpyBtLhCf+R3bQ6zjidpWx2TIFynVcF7vEVpw+t1jqcsEp/zcvXlWZYFnGUbdlq
         sIpG7CU2J77yBjpDe6V7JYNCL2hvcZpPJs1n/u/Dmu+j8/Ks/7eoiybnVmfjoU9A59MC
         sPew==
X-Forwarded-Encrypted: i=1; AKwUvBxVcZvg5ntAnyfNC9BgPS0lOHxlyWGRsrpeC5gi/5MUWFtWqGE8nw5fsZ0f5OEKrPGzu/aKOQva1oLqgLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUAFoiYbB553fApSEUZZFl9DORt89B8/H2ZTJh376xn+pxumpB
	Xid7Jcs/fuEDm/gL/xdxDMB2LpZ8zm3pSaLOc9ZP2ZXNsvwI8ueWS+XZjJx8tTg5yVj/PT9hIhZ
	FM8zApEocOV/CZGcIf/8vK7RIPllVqXs=
X-Gm-Gg: AYBFou07068p/rVzebdGznuoP4fszcyPbhW6JCN6IcFzuYFi0/fxRnCdOwkx0JLpNsC
	rH7nZFU1rsdCIkS/qdKtwcC0RuApXmHvPy6OFiHWogCG/IAsrrEUFYndeFIynC+xYTHeATs20Y3
	icvS+9fE2W8znvatGl16YWwtaoi6FBTEpCb86m9n25Fkm0QRUCBt6QvilJzvXS8vbfP3f2w+zcw
	EefBkQpKsfBUAK2vgiTf7oDKK6CSD/2JGNk2XJ9JmrvmvCUKibbWloACKbLe1nf3aGdOiKQ+yHo
	4w5T8C+aE+9sTS2qg6mtjh5C66WI+YsKelTKNnZc3SYaoQcUG5gloaUM2TXftDLt
X-Received: by 2002:a17:90a:da87:b0:3a8:80f4:98a7 with SMTP id
 98e67ed59e1d1-3a8a1bd661fmr4380072a91.24.1791464587670; Thu, 08 Oct 2026
 06:03:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 8 Oct 2026 08:03:06 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 8 Oct 2026 08:03:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261007224115.755ce40d.michal.pecio@gmail.com>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
 <20261007191130.8652-1-ooonea@gmail.com> <20261007224115.755ce40d.michal.pecio@gmail.com>
From: Giuseppe Piscitelli <ooonea@gmail.com>
Date: Thu, 8 Oct 2026 08:03:06 -0500
X-Gm-Features: AclHuK8d94ZlAMXeaDvgj2EgcSP4fxLFqo6_9tmG2H2aomtW-IKcOXCsjiFQUrU
Message-ID: <CACmoRBboPM3jNnfnOv5FXAJt1avBGwH2W47Pcq7RaVL+oBFt4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, I switched to that approach: blacklisted the charging driver,
dropped the device-modalias backport, and booted the stock nixpkgs kernel.

I tested an existing libusb utility that does not claim interfaces [1].
Its optional charging request succeeded, and iLoader continued working.
I have not measured the actual charging current. The command remains
manual, rather than running on device arrival.

[1] https://github.com/FD-/usb_charge/blob/e957bcfc47262f8a47d652d7d417723578560b23/usb_charge.c#L42

Assisted-by: OpenAI Codex


On Wed, 07 Oct 2026 22:41:15 +0200, Michal Pecio <michal.pecio@gmail.com> wrote:
> On Wed,  7 Oct 2026 21:11:30 +0200, Giuseppe Piscitelli wrote:
> > On the first insertion of an iPhone (05ac:12a8) after boot, an already
> > running usbmuxd can select USB configuration 4 before the charging driver
> > apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> > to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> > driver that enables their higher charging current.
> >
> > USB device uevents have no MODALIAS. The charging module instead loads
> > from an interface uevent. Its registration reprobes the device, unbinds
> > the generic driver and calls usb_set_configuration(udev, -1), tearing down
> > the interfaces and interrupting usbmuxd's transfers.
>
> What is actually the appeal of apple-mfi-fastcharge?
>
> It seems to just issues some control requests to the device when
> commanded by userspace. Userspace could do the same with libusb,
> apparently without unbinding drivers, changing configurations or
> even claiming USB interfaces. I just tried a simple program that
> queries GET_CONFIGURATION, with no disruption to kernel drivers
> or other libusb applications using the same device concurrently.
>
> Then simply blacklist the kernel module and all its problems are
> gone forever without one line of kernel code?
>
> Regards,
> Michal
