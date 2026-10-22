Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683498;
	b=1wIJ17pqJrDYcKL/KEB8j4VHdHi5pLsAcGqAprB0/Rr9MUeyGauTZJ8fy99CE2/+PAgn
	 SOXTWtT9DAzUe6k14d6zFeebbspkZ4DRZ1sPlq6glbye/pxRGsam0pQ8mB4uDqs4/oc+X
	 Fdy+zKUUufIeepBEXK1pF5yNfpQaAwqidz6xDOQO0P7Ym0pXW8jkDZoEsTEF4+Tq/ZxVj
	 8g7fWM07guQnRufcaVsaWKFSlfIuD5rex7cju6szJDUBX8D2UM9KKACJldOvlaCzbmdY2
	 w75yWBFbgLkH2hI4K7KZYM5m1E3zokqSRKTl2dKDdduJtKxysumiB4IWmIjoPtYYKTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o7ZhmIgapO7sB4tEy9JjIYiQH9wnF4DTp0ZY1/4zEaE=;
	b=wWhrfuWsnQ1mN10ppRagU7O2Ux73AkLVdlUWvd8ZR2h4W8Yn/X3hRMIRMOy4bl7tz2Tv
	 rbS4af5TdXTWf4PlqXQ2plxQyaOMqC6PD2sQzUCPYMBx0zdbyNrIk1lH+yk25CeFgFiJj
	 S+n+2jXpJAjl4xL3Br5/tIra6RC+fBI3tnqyAUjlRLL87OcSPqYjo8Cn2nncH36uLZQ9p
	 S5AvGM9nSl3E1GRNaE7BpaAxQFMCC+iNlA4WrXj6UOYT7spGeSGDnbzp7dY8igb0ppJPQ
	 mU+YWUWNQIlwPthaEC8fafbkggL28NiEaJROVGOTXkgJk7WjmlvEl6/GXXFLPrfb8xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofiTsxrs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5801B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofiTsxrs
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9178aabd30dso78136d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683497; cv=none;
        d=google.com; s=arc-20260327;
        b=RFyjOSs/a/tKf7BrgYg3cprwdrD0D8cSZBu6oHwMowaRve+IHFFjjfqfLdxweoyVEK
         XGa0TflYKr6VlyHyFOIeFxohUy9+kMux5B2mF2e8J15PR9RyGLWlzGZ2rTgYB1cmsuGS
         ijYqkve+Ix+17cE06ot5A2F8OVdoOAyJ2Zjo0e3VwFmupt/h+KUK+kjalci6YpOVLDWn
         fhEuyVc241SZyKIGHAep6tTVF9O/s9q5OVcPxyYz0FuPEZ6nq8bX2gB72TxPyVokEVwJ
         EK2vmgBgc4iqTyBKGbOblRBnKlWyXeLqlvwzYDFcAb5nJX7MlL5JqCH0u9lXqyxmDd8h
         NwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o7ZhmIgapO7sB4tEy9JjIYiQH9wnF4DTp0ZY1/4zEaE=;
        fh=HYqrYWgqSLFoKct2fBZOS0bDdkAQc+dExThnQXQ2Tuo=;
        b=FUuvijkRKsidE2rE8S8SWRlkrSjEiAbhFEBAqMS2+Xjy5VGw7x/GjSBBSeFmDil+/n
         9nHBOTJqwh2P8QO7ejOIjVLH6Xv7E3wHt8wUwKKzdt2ocmh6GBgKYG+7dsfYa996dJwn
         OnITiJClN1kLXC/rraMn8c9Qz9HX0u9kjyc/wEF4QNPhbYpgInVY/KXsyjxqs0MUAxI1
         +1ibbkho08qMS9n85qfoagXU03VPOTHYjdggUa3WVo740Mgoh75gWk6aa62LXo0Owhxj
         R6NLzLpxnEbXtePasGfrgvKLWdoMfpPF14VBRA/PLCa8KM9AtNLnwH4hcGtDoabeiEeI
         0LXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683497; x=1793288297; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7ZhmIgapO7sB4tEy9JjIYiQH9wnF4DTp0ZY1/4zEaE=;
        b=ofiTsxrsZbMusf4Xlcz/c1ye5oZ4NvwBZjKGm8C9ARSTR+axAZ16zEUWeEszZbojv6
         zC1mDYCF5CL/SLjZpYa0nKf48qTVpzZGu5xeVKlEx3zgmvORcVY0MkgMpwO6gVJXNkHP
         U/5HyRUMUB+ZP9afP1JJ8Zvc1BvezO0RgZiKGxrj5aOCvfF6YT+M9l5SJIJIdZTty83v
         oxMsJ7ZMWZ/tePek5ugY9TyvbvzjA1zEsUHoTzAH0dPn57BSIhmhrcv9bJjg8iP+H1f+
         nPSK/6dDIubxvm0Jm/98aoZ1kNPcJ1YcgFHmK+BjePzBluviZCOcCu7C/gydgnGUHL0l
         KYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683497; x=1793288297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7ZhmIgapO7sB4tEy9JjIYiQH9wnF4DTp0ZY1/4zEaE=;
        b=VS3J9ecQKL1DTue0cSzx1xOl21i0uD4J4h8ykgxGsQz1ZRm3LqmKQLbGq8+iB1+q2j
         O6NhG73F/AFrhxfnZ41/2FlAErdcrgq5zW2Xue9keiGXWOCzldbLEzaOwpu0vGfdmmp+
         Nl6o5hlnWdrUB7jX2PWwJuvFBdDM/tAdQNK5USbQyjORqKwlNHAXjzvvrskHmnezrkZa
         p6asYLm7HM8ySr8DGX0/5BikfnATLvNpC/PzSpIhaOs1KpCJxPjJtXJiU1T635w7PS5W
         3XhI0eFEqsh5FWz08MzmILSMT12E1ClyeZ8+a99+OX7FjOkp5bohRlyH1wbTzBfRYjFh
         +x7w==
X-Forwarded-Encrypted: i=1; AKwUvBwSSo4IeXYLxLgL+FRAiVT2+hhxr8LN/mcTGlCuuA6kwPSVOrJT9L67qB0kO/DmsmQZdyUtcKCz0Uwm714=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM00hF0yCFKYWbiKLMYqHI8ibk939ukbh6jZ2+G3/etVBXAiDP
	tLY+K1jYgFptTbfQYIG8lagcw2mQICsa5679GrQszKSA4CGqx3njse6El+8w2vWq+lZUOexpTrz
	BapqRr5rHDYvAfG4Nam4AWyqDxc+FO3U=
X-Gm-Gg: AYBFou3tPE1fUN7w9IcW28aYJxGtsB4AH4QjW9ESrU8V/Fr+xihnO3JcqkpxdJa1bQR
	GbJQp1gAvg8fdmZCL55vPvUahMNkm8a0olsY6z8wPr9G6LECkxwUg+QpEsAl/8aFAKd1Ghtdv+F
	JkldmDBf/XkGpgeMcgfeyDHy4lzFZBxkP4qQ30KJTaiUmLzXNIyo50RJcyJQx2L94Z1Bj4CPa9K
	ohk0eyNVsZAkJi3wh6nJ5je0NPk4grMo8Ug2DPcgm9srdeZFAWDWtFXkQylvM5lmlYsqn0c6uZ+
	jPVuGmluoyW9ub2Kiw1jqHrJNaX4R8QJRGSQjaPSUQJbAn+LRL9z2kTwRphsIcqR9sfVKRkaCXA
	6EUhIUEbEoiiHqH3fpyu8F4xXN0odV7xBH//Qrv0dE5YE6Un6joYNEYTyNO4PXHBm0iB7Ap/fzk
	1Ob1Q3kPQ2zduPBOvwZwLTMP8XU9ajpgzFFheTQDBrPqbAL0EqSA13UIgHFhOBOZlqeKxGEkisI
	hGJazqnEcvzuPlZwUKC+gctAnJ42vpZ9vA=
X-Received: by 2002:ad4:5d46:0:b0:91b:84d1:5c73 with SMTP id
 6a1803df08f44-91c12eed190mr92514456d6.12.1792683497164; Thu, 22 Oct 2026
 08:38:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006130701.120460-1-luka.gejak@linux.dev>
In-Reply-To: <20261006130701.120460-1-luka.gejak@linux.dev>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 22 Oct 2026 16:38:05 +0100
X-Gm-Features: AclHuK9XC8r_3uVfTWtK8cLfOLYuPfjNqTOzeWnstj8Yb7R7BoPLwf8SDqgM9Tw
Message-ID: <CALeDE9NKkv8TxiCNUt-fUYUkh_zk7Ne7hRKF51QDOSvvrp1YRQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v8 0/7] wifi: rtw88: add RTL8723B/RTL8723BS support
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hey Luka,

On Tue, 6 Oct 2026 at 14:07, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> This is the second of two series adding support for the Realtek RTL8723B
> 802.11n chipset and its RTL8723BS SDIO variant to rtw88. The preparation
> series has landed in rtw-next, so this series carries the chip register
> definitions, the BB/RF/AGC tables, the chip driver, the SDIO bind and the
> build glue.
>
> The first and fourth patches are the shared-core changes. The first moves
> the CCK power detect setter out of rtw88xxa.c into phy.c as
> rtw_phy_cck_pd_set(), so this chip can use it without pulling in
> rtw88_88xxa. The fourth moves the definitions RTL8723B shares with RTL8703B
> into rtw8723x.h. The five chip patches apply on top and can be read on
> their own.
>
> The driver supports:
>
>   - RTL8723B / RTL8723BS, SDIO only
>   - 2.4 GHz 802.11n, HT20 and HT40
>   - one spatial stream
>   - station mode
>
> Only station mode has been validated. The common rtw88 core advertises AP
> and IBSS for all chips, so those modes are advertised for RTL8723BS as
> well, but neither has been tested. An out-of-tree tester has reported AP
> mode associating without DHCP completing. The five additional SDIO IDs are
> included for parity with the existing staging driver, and only the 0xb723
> device has been exercised.
>
> The chip driver requests:
>
>   rtw88/rtw8723b_fw.bin
>
> This is the version 41 firmware extracted from the Realtek rtl8723bs
> vendor driver. It was submitted separately to linux-firmware with its
> extraction provenance and carries Ping-Ke Shih's Reviewed-by. There is no
> known native rtw88 RTL8723B firmware.

Did we get the firmware PR done against linux-firmware?

One thing to note here is that the old revision of the firmware will
need to remain in linux-firmware as the LTS kernels will need them,
not sure that's a problem as the drivers use different paths.

It would be useful to get that done so users don't see a regression as
the old driver is removed.

Peter

> The implementation is based on the initial RTL8723B work by Michael
> Straube:
>
>   https://github.com/mistraube/rtw88/tree/rtl8723bs
>
> Michael's Co-developed-by and Signed-off-by tags are present on the three
> chip-code patches containing code derived from that work.
>
> The known limitations are unchanged. Bluetooth coexistence depends on the
> BT firmware's status reports. During A2DP streaming those reports identify
> a connected link but do not expose the active profile, so the WiFi
> coexistence logic cannot make a correct traffic-aware decision. WiFi
> throughput can fall sharply while audio remains smooth. This is documented
> rather than guessed around in the WiFi driver. The intermittent RTL8723BS
> firmware failure to leave LPS also remains, and instrumentation shows a
> firmware stall rather than a polling timeout that a longer budget would
> fix.
>
> Testing
> =======
>
> The exact seven-commit branch builds with W=1, with no new warnings, and
> links all rtw88 modules with real modpost. Sparse and smatch were run over
> the rtw88 directory. Sparse is clean. Smatch reports nothing in the 8723B
> files, and its only output is an existing container_of static assertion
> from include/net/neighbour.h while checking usb.c. checkpatch --strict is
> clean apart from the complex-macro report on TRANS_SEQ_END, which is an
> initializer macro that rtw8703b.c already defines in the same way, and the
> "does MAINTAINERS need updating" reminder on the file-adding patches, which
> the existing REALTEK WIRELESS DRIVER (rtw88) entry already answers with its
> F: line. git diff --check is clean and all seven commits are GPG-signed.
>
> Hardware validation covered module identity, boot, scan,
> authentication, association, WPA2 key negotiation and DHCP, TCP and UDP
> traffic in both directions, ten scans while connected, and twenty module
> reload and reassociate cycles. dmesg is clean, with no warnings, no errors
> and no TX-report, H2C or leave-LPS messages. The extended soak added six 30
> second TCP runs, UDP saturation in both access categories with no loss, a
> 2000 packet ping run with no loss, and three idle power save periods with a
> clean wake. The test machine provides only s2idle, so suspend and resume
> are not covered.
>
> Changes in v8:
>   - a new patch moves the receive PHY status layout, the SDIO aggregation
>     burst fields and four baseband registers out of rtw8703b.h into
>     rtw8723x.h, and renames struct phy_status_8703b to struct
>     phy_status_8723x. The chip driver no longer includes the header of a
>     sibling chip. It is a pure move, rtw8703b.c only follows the new struct
>     name;
>   - the vendor driver's name for that layout, phy_status_rpt_8192cd, is in
>     the commit message rather than in the source;
>   - dropped the long comment above the CCK swing table;
>   - the two receive PHY status helpers take void *phy_raw and read the CCK
>     LNA and VGA fields with u8_get_bits().
>
> Luka Gejak (7):
>   wifi: rtw88: move the 88xxa CCK power detect setter to phy.c
>   wifi: rtw88: 8723b: add the RTL8723B register definitions
>   wifi: rtw88: 8723b: add the RTL8723B BB, RF and AGC tables
>   wifi: rtw88: move the shared 8723x definitions to rtw8723x.h
>   wifi: rtw88: 8723b: add the RTL8723B chip driver
>   wifi: rtw88: 8723bs: add the RTL8723BS SDIO bind
>   wifi: rtw88: 8723bs: enable building the RTL8723BS driver
>
>  drivers/net/wireless/realtek/rtw88/Kconfig    |   18 +
>  drivers/net/wireless/realtek/rtw88/Makefile   |    6 +
>  drivers/net/wireless/realtek/rtw88/phy.c      |   39 +
>  drivers/net/wireless/realtek/rtw88/phy.h      |    1 +
>  drivers/net/wireless/realtek/rtw88/reg.h      |   34 +
>  drivers/net/wireless/realtek/rtw88/rtw8703b.c |    4 +-
>  drivers/net/wireless/realtek/rtw88/rtw8703b.h |   63 -
>  drivers/net/wireless/realtek/rtw88/rtw8723b.c | 2534 +++++++++++++++++
>  drivers/net/wireless/realtek/rtw88/rtw8723b.h |   14 +
>  .../wireless/realtek/rtw88/rtw8723b_table.c   |  861 ++++++
>  .../wireless/realtek/rtw88/rtw8723b_table.h   |   17 +
>  .../net/wireless/realtek/rtw88/rtw8723bs.c    |   59 +
>  drivers/net/wireless/realtek/rtw88/rtw8723x.h |   60 +
>  drivers/net/wireless/realtek/rtw88/rtw8812a.c |    2 +-
>  drivers/net/wireless/realtek/rtw88/rtw8821a.c |    2 +-
>  drivers/net/wireless/realtek/rtw88/rtw88xxa.c |   38 -
>  drivers/net/wireless/realtek/rtw88/rtw88xxa.h |    1 -
>  17 files changed, 3647 insertions(+), 106 deletions(-)
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.h
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b_table.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b_table.h
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723bs.c
>
> --
> 2.55.0
>
