Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA53C3F51
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355338; cv=pass; b=gUKtm89hkGiPAEUIWkY+U4gd9zt86gqNQd0xOj6DF/8eV/q6PKTUQMvbe9HIE4EHNwJys5Hl333XGZ6mYRoqYPhL8T6nYupPFgpB+WBsz39I2gBWN4Uecj0eP/igKGhXY6y+wS/DtnANy7nWZPs3Fd2O49na0Fh4wG5nvrwePz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355338; c=relaxed/simple;
	bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YncRBCljOoyFyu6WfRxG2D056mQarl1NIx97cqSmnST4ul7Ra2atYwqgvcqcgKvlqxuUfIJUeOwwxY8QXjaGv0f9zly2GnyUrB23QttqmGogLR9Czleuw30PFzAMi5Uqbojy/jhhXI178T5/hyqtF9vlrRnUYmm4y8i8wLzDnAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R16xhDgz; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R16xhDgz"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679a420b5afso1297450d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792355336; cv=none;
        d=google.com; s=arc-20260327;
        b=KdHXnejZ0r5ca+yeaLYFkVDDjXCfsKowdKVA0Lb77LgVLLhC9wQvV/W1haT3wEYZMR
         9jrXW2dih5BDZZbWW/MtlcPAzzOhayo1ltynNjAnG8HaL7Dg+xy0Zboc8SCHyD4dzbY3
         KCdpwAzWIALnkfZCI5sHVJbW+kQCOE1cEQF0W9ZgpwGJhB61zW8BtuhX3DokO+c6o51M
         dW69h78I90FOKwHXA3tFg5GoGI01Ycum9PlTJb+9DSnHQp0PrTU3D9TQbM6PnIMIaZCG
         xN554J3yJuoRaogmaQM5qR3rj3KV/2MFoWSSqDEUAC2Xq7dm/F14wYiYeyYeQH3N5qoj
         O0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        fh=mZtKAPeS3c8lJlYea7c2kmXqdEqIuwGQy7dunX0cMQE=;
        b=Py/RgWx9QynTtw1JZ0iRV0lOUgfVwWDGjmq9ZlXdmtl7cT80HlIq9BF0swzpOkDv2O
         r9kOvbNDVGmlUq+dunDSqzDaQVGJ52H7ZAArUDglzKd5qFWGM6LpxvV86POvtpnKNxPk
         op0E9rN4mI5jfo/Ssm6jGyYehDVyN/8Hk903JhwAMQJkHYqRa2+Qa/qoKtyJrcUq75BA
         59aGLsFV0f4vTXte8UlYd96WGyFltw23kmKtoX1bc8ttivLWlRuCmmquciJI9AWoFa2d
         yBTA+clFDdmCLDYzr6P7I2JshPe5drStCsNAXq+s4lxFxm1o8Y8+0cRcJvm/MG3DmUfA
         EYag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792355336; x=1792960136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        b=R16xhDgzK+nSm377ST9a48JvX4CIduKKkz+G5EmPfXavYrxOdYumc8hwIyGhz9OMEq
         oVB9prRIH3ymilGBOq6R6B/xIi9Y/9VNUIpm00RsEaglG1bm5c5CW1/JTNeSLAt6Ynxz
         9FEx9uyWM3JXZxdBdGiONY3yYIpQapM4jratMJK+H/pkRi0rs2pZ+xzPPnRBtF45cJPr
         FXVULnmqYYBt04sWoB+aWG77hPmayrm+POKrtF4ntGuWMV1WGvhf1qiWImuiqdcNbmxY
         XW1ZxJM6pib1vET2JHdJfg5zdpbsUX5KVjNbgN3W5xHCJvsJmxDEnZ4qFgKOMPxc7hbO
         pYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792355336; x=1792960136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        b=omig9Qa80Xs9TZcRAhGFiYvduyF3zksIQ3p1BjFBeDiO9vjn7N/kuhrMXTfd2LmhW9
         K4Yv76G5wzXwuiWwqI3DKoQlMA9EADX9N9XzGvt+TE9EZTjP3k1FwAkXlZMl8bLZDgfq
         mhsK1seRolaDGknQUm4KVjy1zSyFfSrrIA39TZbNJQqmoGOTylKqz2zPua4uuFag8nXT
         G0Y9q1h4LLVOxiM338Y9vmEQHki0mGJ2LiJnhpfMFQbYnfOYNHTt1URj7j3ViLeDdOrr
         HsCkx1xfwNNkbQaG78y0JBooHthOyIEZoRZlUf6py09hxPqhqCoXDQZ3dVnl8emv16DS
         4knA==
X-Forwarded-Encrypted: i=1; AKwUvBxA6vu1bT4emtnbEVLD6trbHx5j5G1cH/874+ob4Uva7q38HNoubhBl/bHWBPpKBw1TZNQx1knHv2W6uyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2vqa4r522aTEEqlUJTY+1EItQcHO61s8T1joGgR9PdyWRSz3K
	WXJRfqW+u+/iHzNGIy5zoAm9dSYbSbQNj8+l+TO86CapsdhSbqQ+G2Z2HlIx9QpoGNG2+y9OnFq
	eDY5yG7q4gA/wBmcFEmycpuyxqw/RceWFtcLBLIn6
X-Gm-Gg: AYBFou3WhGL51SN6x4e0DGqIliuXRtdm+IFXCAGZam3Y6diskrzEodbBpKGlKmvWnFc
	j/1U7Cuh7IjZicEoncoIHBtjtpAahQbjWnKZGTJ3Z79zWOAzuECiaMx81M2XqelY7iCIkUu5uEA
	Dd5gjt9jwKch9EblpcOwHvhCj4fUbtydUQM3aP0Utk+ddx8mcQZnOmGuUPA3TYORBseJ/a/j5OO
	61ZWRN2R0p/3kF9QDa4EE988XqPXK6tu9r/BxWhpUf7sDEwfxEf2YDd/F3t/cW6WvU7yUUOTt5Y
	2S97kJiJfBFHUXdVxrLIaCYOUDxXMCXRz/sT+d6DIY3yGc/OixSOH4veeH3koLqU0V6GbVfwzBm
	q8+etjmXmkw==
X-Received: by 2002:a05:690e:118e:b0:679:2a5f:52d3 with SMTP id
 956f58d0204a3-679ca95a0c8mr1537687d50.161.1792355335893; Sun, 18 Oct 2026
 13:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com> <as487H8-0Gc77mXI@ashevche-desk.local>
In-Reply-To: <as487H8-0Gc77mXI@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Sun, 18 Oct 2026 13:28:44 -0700
X-Gm-Features: AclHuK8PXQM2VfsIRVEDKyHaajGYEQ3CpfznmQSW3MY9pGrSxyVsVdcPzi-iqk4
Message-ID: <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Yes and more as this bus (i3c) is still non-discoverable (am I mistaken?)=
.

I3C is a dynamically discoverable bus. During DAA each I3C target reports a
Provisioned ID (PID), Bus Characteristic Register (BCR), and Device
Characteristic
Register (DCR), and is assigned a dynamic address by the controller.

> This makes even less usefulness in my eyes. Immediate Q: if 4 already hav=
e the
> proper driver in the kernel, what's wrong to make it for the fifth one?

1. The original use case was hardware bring-up, silicon validation, and deb=
ug
(i3ctransfer): Just like spidev, engineers need a debug interface
to issue ad-hoc SDR/HDR transfers during bring-up or hardware validation be=
fore
a driver exists.

2. Userspace firmware recovery / update tools (OCP Secure Firmware
Recovery, Caliptra RoT):
The recovery protocol is purely a polled request/response transport
(no IBIs allowed per spec)
used by userspace update tooling (fwupd / BMC recovery daemons) to
parse signed firmware
manifests, stream recovery image chunks to INDIRECT_FIFO_DATA, and
poll RECOVERY_STATUS=E2=80=94similar
to how userspace firmware updaters operate over spidev, hidraw, or
USB/NVMe ioctls rather than
putting firmware image parsing and update policy inside the kernel. In
my response to
Wolfram above I discussed this some more.

> What if the device needs more? Or if this is a multi-functional device th=
at
> may have driver for only one part?

If a device needs more than basic transfers (such as IBIs,
hot-join handling, or integration with a subsystem like hwmon/iio/mctp),
it should use a dedicated kernel driver.

For multi-function devices, if the functions are exposed as MIPI I3C
Targets (e.g. a device exposing both an mctp-i3c interface and
an OCP recovery interface), each virtual target is assigned its own
dynamic address and DCR during ENTDAA and is enumerated as a distinct
i3c_device instance on the bus. Conversely, if multiple functions share
a single I3C target address and register map, i3cdev intentionally does
not allow userspace to access a target while a kernel driver is bound
to it (avoiding the I2C_SLAVE_FORCE problem where userspace can race
with a bound driver), so that case should be handled by an in-kernel
MFD driver - but that is not the use case being targeted here with OCP
recovery.



> What to do with the i2c devices connected to i3c bus in the compatible mo=
de?

I3C master controllers register an i2c adapter for i2c devices running on a=
n
i3c mixed mode bus - they are identified as i2c_bus_type, not i3c.

Thanks,
Sam
