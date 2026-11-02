Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640324;
	b=RV5cTssh6qLSu0TRO56DM1ZVZsHFkVE7vPvdOVlLLYdYLyu5CcQQazCCtTMxe188c9do
	 rbsPieN7fwuoDUub7JUTxuD32zGzz/yQY83jmLwzgtf1sefl3JPkB4vf9x/lKhzRPhqjU
	 LInePAu0WOWiJrQDUT+5klLNO7fYAt6Rz6MeB1pLRzCBPuytTfdB1aDw0htae83SQebBY
	 d6xgWjxotQRxjey4anOCTGGd60eE2Abb7xoHnigA/PrCLdK+GUHRch42cHksLLo/Ccm14
	 KJAqo2jdk+PXdtnDl0yQrmZ6L4JXP7brWQmEO07AAOwwdPLILVoYwiFon/vdLl2zg3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fgYIVopVoDWfARhrYsF8sqmL6eDPeBwFthOsJmxG8Xc=;
	b=rjAscm0hOiGjtmKnlLNaJK6b5zPUMfdtI3GIXnJrH2j0BaAyWjlt2fzVPzkyUGaVfRpi
	 buIE38HdYNzv1/rB6mwkfbmOPoSDfzu1eW5jcHCEa+yql/O14BzFBmJHCtVW0RxEQMI8y
	 rpWEGNlaMEJ596ttbakIjaaaNSH5ACi5sGkdZT+dgNZII2XyncRsf7E/A/PobKLjMyT1O
	 m/n7MMgbaOQ71FHNKS3AQQETvz2a4BBeh1CGhk0tMejavcYHL6GLEXwoQ6wJmnmBdCnnU
	 3KyLbSUnpczLnQsrMLjrbRLRqQ4B01gGAC+ixziFKH2KFVPA5GjoGSjnjBp21BVkp6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz0dSh0Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5C606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B5C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz0dSh0Y
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab43af5e97so36363327b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640323; cv=none;
        d=google.com; s=arc-20260327;
        b=XWwBpQe31Q3IxLa3rx31Jxp2FI82CV1O6i3xoL99mPJ9WuD6MxZZx27WkBz3vH3Oag
         wU8VvBHGwOavOcAXNHnuVDR++CWwNQMUwu6sQiKA1fJte747nAUIYmTQ0Pc8cPcRbgJM
         poMKe/9Pli7ZXSrTNZDxRrEF8YmXf+V+ymP0W9eSACZKcKzL/dVdWqY+9VEGW35VuTMu
         Ccn6YFUdO4xydtc/4xtxlvc0kSP5fy28TlpTyHAdudVMpDoCZq2Q0bTBlR2hS7G9KUkc
         s24ATzWI2tbiZLm33TQOR1K3AFeJZkVkh4Bk7JtnqWjbhP/pRLW3/V5vDmwTDuSP7nww
         AwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fgYIVopVoDWfARhrYsF8sqmL6eDPeBwFthOsJmxG8Xc=;
        fh=wQZpTxONofIHlEeZgnlYFAWhyRE6y5fdyGYCUwxRwCo=;
        b=hk/l97E7gtD2uwkf4LjMBYECUY4roj0fWVyzmyfD715FX7Epcg9rpC7Z+mJJvEA/ln
         JNaJR++NT8QBnX01AE8t3UrORaYVokMVp+HsektnQp1rSz3sIOUuj40MKaWFAfIGA+kA
         EPxaKoTUv5TK3D7vEfviXcVHY0VZmaqm1pGlCnIuQJieGnxlk9yXkuvWIcFQhgu7QqMg
         rDfJG+j4Y8vVN4/Tz9kD3dRyD0eLQA94cdzN3uuagjC1+z4n7fHGQN8OXeaNbDXAkx+M
         9wQQ3VnRKYrSWjqWXNVmSETf8WJLiIKCyISRV3WjR/b1NAkseaPs4ydjiVuI4qat/CTV
         lCow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640323; x=1794245123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgYIVopVoDWfARhrYsF8sqmL6eDPeBwFthOsJmxG8Xc=;
        b=hz0dSh0YXS29gz3fjNnfzrv6ocoO54lPhzCyj4NEZbZ4IYQrWmk5PBXOtUvHrhHZGe
         SiTYHyCh6E5LUPDnO56nOMlj3RWbeac9Xdo9altwNo3+WJf+n++Wx7m8P0EY/4noorsR
         Qk7KWypgh8tNzWvMx3FBRJReSNs9lSq5OESJ01zwzwiTAQgIWfk0IfJsrL4kp/IHCb6M
         4QDh5JEBI5MgQ6Wm5SBSHBm2ZYVZewvxBS4A2DYqj7lovsJK6f4fHAFMC7gfLsYXY4B2
         TWIBjtV701u6dZgDzGio1+XTCm5DryhveSy1ULRQKnLgxYl6N/BhxLrqWhFdMUc4/Uqs
         lgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640323; x=1794245123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgYIVopVoDWfARhrYsF8sqmL6eDPeBwFthOsJmxG8Xc=;
        b=v24S07QMatUSFdPCYr8eT/PXjA1sCFV8doSQ+mPg6u31aifzwnidj0p7M/gl0TcWO8
         DjVNG2Bd3smjIXw+LNHWr3NPqJtZcLiIToJCLdaLy4bxtwfvMVn0yKTVNv1MQAo6QBFu
         uaHdZ6KTox+IJoFZ0v9MHXIxLrxU4yUj1DgIpRBp4P7dzRcCdbDyC4F82kNsDaJt7e3/
         FpKnK5hftf7I9UMEXEYR1T4q+0e1dwVgOtm90wODGKjXwbW7cezkWP6LMbZ285W+Bvew
         qGydBlUq/LH4kMnSqFJbDyE74+nw+SR8UEmY1ZrR5KP7txO6gAneYHKp25kiJDw2ItB+
         6M3w==
X-Forwarded-Encrypted: i=1; AKwUvBwMix33DTEzF8lwvr9Bmc/fzHlXo2YIe0la3q3rVv+1SS7fdsLEpRMUcildVng5Qx40fhYDNEuUe2e4mX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mpdSo/5f5GU7g7rhFb/Gw+vpUl+DnzP4FcV9fIGs7RCPKmUYU
	8g7jmDk+p8jIHyApyNg8rCugw+9nkonxRUCsjuqk5o5IMUmbbqUuS7xuCSICHaOsskD56YrfvJW
	uAKSuReEyGyFG4i3IN2XRo4pSpBTyDwobsgefljI=
X-Gm-Gg: AYBFou02cd/IzhgmBzCTdNBeTUEe7kFtxlJnNZkZI2DW6I8a1R4aoVs3rcrJJP7EK8V
	EPON8I91EAAVnU58gxyWelrkfLUwrxm1621LvSDa4oRapL/t+8dxbj5O7afKejCeqDkHTNbHO/4
	uMaoUeEoasyYoPEly/hv4/pXiztGuwneg/+YZzF59UD0S5LzZNEuHwMECpcMs6TJWSrXhFC5hyL
	0/zNTIC+UfbV5Ojx6zxtx+onotFtMXf4fY7y9Z0izbNYUS1yGbzeErnjHZ8swKY1f12MYp5CawF
	mNaGX8JMZfZfUXIjDIp5DTAFiEaztggXxfrK8Q5hJWeqrmPkeylPYYULHgylyEMKW1kDAOtaJpP
	HG+f6LEsJI8HxZcz118xiZfa8WVPOemBUs0Dsy4p4rkpW8iKr0249Dd33cAnzZnJg+V54vIZFDW
	simSv8KV0u7gL/KWMk+T3t3R+FStyhfI97AkaQzPuJET5RNg1zLFFoqfRl
X-Received: by 2002:a05:690c:92:b0:8a9:8744:c07d with SMTP id
 00721157ae682-8b1c67060e0mr106029887b3.18.1793640322970; Mon, 02 Nov 2026
 09:25:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-barrot-le-fixes-v1-v1-0-30e2089882bf@tambosi.tn.it>
In-Reply-To: <20261031-barrot-le-fixes-v1-v1-0-30e2089882bf@tambosi.tn.it>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 2 Nov 2026 12:25:11 -0500
X-Gm-Features: AclHuK8nE9B_f9SaJxGhyAkwZuEIJ22S6BgPT7xi2WKDP1ZDobosJHyTsAeFWWM
Message-ID: <CABBYNZJ+BP3u-gb7GzBud67CEsJr-ShPSjf=L0Rmg5qFnREVEg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bluetooth: Fix LE on Barrot 33fa:0010 controllers
To: ernesto.salvetti@tambosi.tn.it
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ernesto,

On Sat, Oct 31, 2026 at 8:16=E2=80=AFAM Ernesto Salvetti via B4 Relay
<devnull+ernesto.salvetti.tambosi.tn.it@kernel.org> wrote:
>
> The UGREEN Bluetooth 5.4 USB dongle (33fa:0010, Barrot chip, bound to
> btusb via BTUSB_BARROT) works for BR/EDR, but LE is unusable: as soon as
> a scan is started the controller hangs on LE Set Extended Scan
> Parameters and btusb resets it in a loop. Once that is avoided, two more
> problems show up before an LE device can be used. This series fixes
> them one at a time:
>
> 1/3 Setting HCI_QUIRK_BROKEN_EXT_SCAN alone is not enough on a
>     controller that enforces the spec rule that legacy and extended
>     LE commands must not be mixed: the stack still uses extended
>     advertising (LE Read Number of Supported Advertising Sets is sent
>     during init), after which the legacy scan commands are rejected
>     with Command Disallowed. Don't use extended advertising when
>     extended scanning is marked broken. This also affects the other
>     users of the quirk (hci_bcm4377, Actions ATS2851 and Realtek
>     0bda:a728 in btusb), which will fall back to legacy advertising;
>     I could not test those.
>
> 2/3 The controller answers LE Read Remote Used Features with
>     Controller Busy right after connecting, and the stack drops the
>     link. Continue without the remote features instead.
>
> 3/3 Set HCI_QUIRK_BROKEN_EXT_SCAN and HCI_QUIRK_BROKEN_EXT_CREATE_CONN
>     for BTUSB_BARROT devices.
>
> Testing: on bluetooth-next each patch builds (clang, W=3D1) without new
> warnings. The runtime tests were done on v7.2.11 (PikaOS kernel) with
> the series backported; patch 2 needed a context adjustment there, since
> hci_cs_le_read_remote_features() in v7.2.11 lacks the
> HCI_ERROR_UNSUPPORTED_REMOTE_FEATURE handling. With a 33fa:0010
> (bcdDevice 88.91) and an Xbox Wireless Controller, checked with btmon:
>
>  - without patch 1: Command Disallowed on every LE Set Scan Parameters
>  - with the full series: scanning works, LE Secure Connections pairing
>    from scratch succeeds, reconnecting with the stored LTK works, and
>    the controller shows up as HID gamepad (hid-microsoft).
>
> Before that I used an earlier btusb-only workaround with the same
> effect for an afternoon of gaming without problems.
>
> 33fa:0012 shares the BTUSB_BARROT flag but I don't have one to test.
>
> Tool use: the investigation and the patches were done with the help of
> an AI coding assistant (Claude, Anthropic) in an interactive session.
> It analysed the btmon/dmesg logs, read the relevant core code, proposed
> and wrote the changes and the changelogs, and ran checkpatch. I ran all
> hardware tests, reviewed the changes and take responsibility for them.
> The patches carry an Assisted-by tag accordingly.
>
> ---
> Ernesto Salvetti (3):
>       Bluetooth: hci_core: Don't use extended advertising with broken ext=
 scan
>       Bluetooth: hci_event: Don't drop LE link on busy remote features re=
ad
>       Bluetooth: btusb: Disable broken LE extended scan on Barrot control=
lers
>
>  drivers/bluetooth/btusb_main.c   |  6 ++++++
>  include/net/bluetooth/hci.h      |  5 ++++-
>  include/net/bluetooth/hci_core.h | 11 +++++++++--
>  net/bluetooth/hci_event.c        | 11 +++++++++++
>  4 files changed, 30 insertions(+), 3 deletions(-)
> ---
> base-commit: 42b8c2d729268a65a2d98064e8dc59ff53646b14
> change-id: 20261031-barrot-le-fixes-v1-95624ffd0a43
>
> Best regards,
> --
> Ernesto Salvetti <ernesto.salvetti@tambosi.tn.it>

netdev sashiko found a couple of problems:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261031-barrot-le-fixe=
s-v1-v1-0-30e2089882bf%40tambosi.tn.it


--=20
Luiz Augusto von Dentz
