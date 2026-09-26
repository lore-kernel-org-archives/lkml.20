Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766B3502A3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422668; cv=pass; b=FyQQdNOMKbdhsfI3iwI8/5EtobRciu7bzsCNn0jOM4HYbS+kbGtCJ8bDH4oKFa8aEQoJDqKiqaViyBWmz7VyFOJnsTYKHYLdPTyU3rZa2Glvq0RYX0JA2MBpMPgS0fKGbcDJrJTmVmFy/xz6JorApEj3mVpNWcjujpMtPyuWMUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422668; c=relaxed/simple;
	bh=68Wiv8wHJvbEk9mrCiLB3bM+Opz4jkFUN+0XWuQEkho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOxxm4AmE0rUCjpw3UGY2Lp8O6URysZPaPVJ/pZbuB17baLAmJw+Dl2pdVICl5KbF6DpAoBlRZT9NqoGnmn4jADjQH/7Ev/s1tLpRreVqQxCkCkilQ4PoSS7om69IiTYYqXiQZ2UPyKYrllLAnG75jfTiDeorXuw9xwjfQ/mULc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6dUDgkL; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6dUDgkL"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c9995ca60so1572979d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790422664; cv=none;
        d=google.com; s=arc-20260327;
        b=DgeFMI54kdfycGCvhZ4PstIPx2ITEod2CNHkC2O13bpgKAdF3PR1dgI3EW6XjQKWbp
         4ViiCs3bcgobj6xt2tn2SfRsaM32rHtZ5qcpXPT4GENKewI/VrG6BI5pHE7AA9VEDl2W
         cDYEUFLtu7gRkgXb37iuJi7AXWXatI/qYVKnEA72T4p7WRwWtZhrBJl9KKD1VORDKqGU
         IRfkg3vDVS6ngekevDlR9vmMXjqydLY064j86WvylDvYsoAXCQzHdCw1toLd58ilGHl3
         ghbA2QbhfPRa+vSkfsEKWWoJu/q4pHLgTwLRHbvjgunQ7Jx/QSvs6YBMyjYngYwh25po
         wAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        fh=Udg0qG/gApGbayYegPLOBXOqqIcOCTEbWc2O9/Dv7bc=;
        b=aJImXL7RHRsDnTewTJRr3G2ngBHi0bIWWyUEcdoQSlckcRJzAVeIQlQQ4dRm4EhTmz
         5tCM9OhJB+lPUOGt4PwINZcVU4ixDVNqhIiJIc0OS9S7Ir1yJWql9acaPgLQJQz0HjWr
         7zKC1dRNqvCpvuHB35VIayImlMTJPOReTx//nvNC3VWuJLqWXAWqFFEJdq3MR5U9JsKc
         A8O+9RdD1Bk6Q/aYzvOu5byiHe1XNqtDZJjYCnzAANYhsscz+bTLrOIsUmxCqHqKqIeU
         IR5Vxwn2C/zGeeUqZoObyuNgZaZMxrTnE1pdEu/RtEEVgyssYxSQfXht2lep8AIHJuJV
         uNWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790422664; x=1791027464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        b=O6dUDgkLbs8gBSCtrGBbMN8eQfqD33qFkzc6qU8qV8NO2jAMxl1CKvvZDRrN2Ns9eD
         OZxd27urD08qjgWAbrUmYV0qAGODMkiiUNhN1Qv8Ah/NfvWbNyoUMGwdyNuy58YFE9B5
         1QCZR1Xt2n77hiYpiwtubdSm8a3h68SURehjnVH/XUsFL7CG8Qxik3G7+cO37dcii4X2
         imSPbZf98ivtLaH3jJ7bNhi6d5J92ehVNeJrXsBCqMoyVD7/q9zZ6oZhOI6VPwOZCsNg
         Ea+RiW2AR2aqIEiBTdhzw8gZ/tQ3rIXmU+qKyI1EDRei77tvljD+O90Jom71jRexiNOA
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790422664; x=1791027464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        b=wU6JoZrygzs08a08GuTcquOZnJn4x110pLD9P5cefZ1FKF4+eqAfi0e6pHKMCwdfu8
         OTBtCLWOGqFmoFS5fvvjirdXWN9mdQd3NuU4RjK/Id9Ca7V1ubcmpNufI/1nFzmjSw2L
         ORD+4BupCjc9IPb+L1jzvavgllBql5b5yVXqyEsOXMLzcKfvfzXUyBURSq4RCZ1WgDgW
         5aiujwB/rj9zePTk/FCSHzBREZBGWMlH5puk8PNE7wZqkrmKekWox3VbAUuoX/WZ+7kj
         GwCqJuG/DRsW2X4bUmOdvQeS/LDxpEV/2L1qOGwW4YjJVuI0QoCQVewD54o5i2Qdgu7J
         mivw==
X-Forwarded-Encrypted: i=1; AKwUvBxCzNXg2HS50aEbYIMgTA5D1P5Ps6idH2rTkc+B8WvvZ/GXW54VGMRLlFKjx9sIteSQeYS4JlnAyIjoymY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZMHqD3Pnjm+e7PwKZ2sWlbxJZbwJO9XijGjmPrs7J+o1g3MYR
	LbvmhAg2NAvxQkHoQLAPs6saiM6BjMpLsPACYFY42EgsHfXhGGqltDIN8QVkceS6y20xs8pVVwY
	CwQSrNUKZwWpuS8FITF5KPpuaSqef3nU=
X-Gm-Gg: AYBFou3JrPZJADfmfLki8pKnLjJYWNq9bNPU8vdD1EbSDUy/ZGBKq98QgE7NCmsF2NN
	MRShOeUZao8DL74LYBpG+VJSYP2BrSKjlI5U5O4e/mtlFkEaa5wb+j/DkbM6YN+QLtDchKchUs/
	yhgWhy7YMdIRFUedNHdSh2QheMbpBqJ6CNyMdeq9vliG9VQhRlw7GD/sOrLNaJ11ZlY9j1bWM0m
	rz0++XEsLbt07AXIMxlYgGGramD64JqhWKt5qmTlarlsKLTUbHc3OteLhO+E7JxOoQRmcE3U1NY
	dBQ6+/CONkaHWewWrl1+skXmrD6pI4A5kFtQLjX9MWXkOSssdy9DQHREbztlzn/IHk9PN5UaMWl
	O07edZGad0BB7mxwiCtK80PMJaj2NypyPYnw4o8m4kcdpt1pqTMhkQYOGQP2G1O1b/h6qcRZ+3t
	2TQeJ+GrPiOn5v5r3d9MPbQ76OF7Pc9WBISJP4au8e4nCvQUyAI+k=
X-Received: by 2002:a05:690e:118a:b0:672:c99f:5f5a with SMTP id
 956f58d0204a3-672ed21a28amr3849007d50.8.1790422664082; Sat, 26 Sep 2026
 04:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE4bxw+ofDFVx0aTHqCrzns9oP1CRQDm_wzeyHPeMBYOhSpcuA@mail.gmail.com>
 <f322a3b2-71eb-45e7-aeaf-18ad87f938ce@leemhuis.info> <4f28488c-ff9e-46db-aa2a-687213c129d6@leemhuis.info>
In-Reply-To: <4f28488c-ff9e-46db-aa2a-687213c129d6@leemhuis.info>
From: Andy Tsvetinskiy <andrew.tsvetinskiy@gmail.com>
Date: Sat, 26 Sep 2026 14:37:15 +0300
X-Gm-Features: AclHuK-LM3582XP4q5xJzcz82yrDpld4vWvmDeYDwN8GMT1tFWaBbiulwNqUc7c
Message-ID: <CAE4bxwJEPJ26LMPstWkE26pxuC+CpM7y_0odYCdp1i=3XA=H9g@mail.gmail.com>
Subject: Re: [REGRESSION] RTL8761BU 0bda:a728: removing BROKEN_EXT_SCAN fixes
 0x200c timeout
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	Kamil Serwus <kserwus@gmail.com>, Junjie Cao <junjie.cao@intel.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	LKML <linux-kernel@vger.kernel.org>, Alexej Sidorenko <alexej@sidorenko.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

7.3-rc4 checked, issue still exists

=D0=BF=D1=82, 25 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 12:0=
5, Thorsten Leemhuis <regressions@leemhuis.info>:
>
> On 9/18/26 15:37, Thorsten Leemhuis wrote:
> > Lo!
> > On 9/18/26 11:21, Andy Tsvetinskiy wrote:
> >>
> >>    This report concerns USB ID 0bda:a728, not 0bda:8771.
> >>
> >>    I have a Realtek RTL8761BUV USB Bluetooth adapter:
> >>
> >>    - USB ID: 0bda:a728
> >>    - Product: Bluetooth 5.4 Radio
> >>    - Firmware: rtl_bt/rtl8761bu_fw.bin
> >>    - Firmware version: 0xdfc6d922
> >>    - Running kernel: 6.18.51-1-lts
> >>    - Distribution: Arch Linux
> >>
> >>    With the stock btusb driver, Bluetooth repeatedly failed with:
> >>
> >>        Bluetooth: hci0: command 0x200c tx timeout
> >>        Bluetooth: hci0: Opcode 0x200c failed: -110
> >>        Bluetooth: hci0: Unable to disable scanning: -110
> >>        Bluetooth: hci0: Resetting usb device.
> >>        usb 1-2.2: reset full-speed USB device
> >>        Bluetooth: hci0: unexpected event for opcode 0x200c
> >
> > Thx for the report. Just replying to bring a few people into the loop
> > that can help handling this: the Blutooth maintainers and developers
> > which were involved in ca0583c2466174 ("Bluetooth: btusb: limit RTL8761=
B
> > BROKEN_EXT_SCAN quirk to 0bda:a728") [v7.3-rc1] and 5ead2063611ae5
> > ("Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan")
> > [v7.2-rc1]. Ciao, Thorsten
>
> Hmm, seems nobody cares, so we need to go the next step: can you please
> test if latest mainline (7.3-rc4 or later) is affected to rule out that
> it's something specific to the stable series in question?
>
> Ciao, Thorsten
> >>    The firmware was loaded successfully:
> >>
> >>        Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
> >>        Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
> >>        Bluetooth: hci0: RTL: fw version 0xdfc6d922
> >>
> >>    The USB autosuspend setting was not the cause:
> >>
> >>        /sys/bus/usb/devices/1-2.2/power/autosuspend: -1
> >>
> >>    The current upstream fix ca0583c24661
> >>    ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a7=
28")
> >>    is already present in my kernel. It sets BTUSB_BROKEN_EXT_SCAN for =
0bda:a728.
> >>
> >>    I tested the opposite change locally in drivers/bluetooth/btusb.c:
> >>
> >>        - { USB_DEVICE(0x0bda, 0xa728), .driver_info =3D BTUSB_REALTEK =
|
> >>        -                    BTUSB_BROKEN_EXT_SCAN },
> >>        + { USB_DEVICE(0x0bda, 0xa728), .driver_info =3D BTUSB_REALTEK =
},
> >>
> >>    After rebuilding and reloading the btusb module:
> >>
> >>        systemctl stop bluetooth
> >>        modprobe -r btusb
> >>        modprobe btusb
> >>        systemctl start bluetooth
> >>
> >>    Bluetooth scanning worked normally. A 20-second scan completed with=
:
> >>
> >>        Discovery started
> >>        Discovering: yes
> >>
> >>    After loading the patched module, no new occurrences of the
> >> following messages appeared:
> >>
> >>        Opcode 0x200c failed: -110
> >>        Opcode 0x2042 failed
> >>        command tx timeout
> >>        Unable to disable scanning
> >>        Resetting usb device
> >>
> >>    The patched driver is currently loaded and Bluetooth remains operat=
ional.
> >>
> >>    This suggests that different RTL8761BUV devices or firmware
> >> revisions using USB ID 0bda:a728 may require different scan quirks. On
> >> my device, keeping BTUSB_BROKEN_EXT_SCAN causes the legacy 0x200c
> >> command to
> >>  time out, while removing the quirk fixes the issue.
> >>
> >>    Relevant upstream reports:
> >>
> >>    https://linux-regtracking.leemhuis.info/regzbot/regression/lore/202=
60822141115.58815-1-kserwus@gmail.com/
> >>
> >>    https://bugzilla.redhat.com/show_bug.cgi?id=3D2521504
> >>
> >>    https://lkml.iu.edu/2608.2/12212.html
> >>
> >>    Please let me know if more logs, a full patch, or additional
> >> testing is needed.
> >>
> >
>


--=20
-- follow your dream...
