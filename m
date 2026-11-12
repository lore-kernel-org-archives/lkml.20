Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472762;
	b=LxSTBjoNaoEgDPrvjmt0ysPMn3JCSe5R/znVl6lW25pa0jRSoE4kUgM8qI4tdmAhLp5D
	 QstekVsEH0IMB40wXIDVu58dfAA2Sgrddrn6474hPgZ7QbbU2QrjAgaH1RRMycwQlER8M
	 rVnfNrYmeRmcY6X1U/LXv7DVuCJnLBUQJwSdsRNhIcENxnNR9pjngSixbx8NibtngVRX1
	 5FGZbq6ELICdZicn+FdFAUkjiEb965IdCgSgPbnBrM0Ktfij8LlJTp9/fK1ghjjkCYnrU
	 gg67mCw5aaTYuw5GlYPLyd2BKrFEqKz0PsxqhOXjT9hvRFOcXatE1nTmOcmK44eTjIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
	b=sjlVvBq8Xq5gNDOp/6rzWi0WJEavVYpWsSNxiEkTfPJjpK4wHImUNJyRSNdq2Pv/X6cR
	 Lbh0uGaUOZQJH7mQNQbUzhF/8WJ20ey84Ga3QfO5vp+EZ3izi5zsPmn3NQepEcebKdbW6
	 y66s70j4977/4zi0YTWbO5F3e4bY+fLqrKsPUV3YTKK18ff5oFsEaE45wW7aaJ9X4WYj8
	 tP0NS7hIU9vfV9blFQGRCdOiGljL8mfGcVdSizJo+AFmjPWqbEuU3D5dy6e6cbSjoTaS8
	 oQ2qpk9VAXlVi6nznuVLvS50XcQu1U/ioKLHnF92jr9roil7U5WXQeHGh82cBuqK4OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0Bvchk+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA7E606B26E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA7E606B26E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0Bvchk+
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c05727a58aso103471e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472760; cv=none;
        d=google.com; s=arc-20260327;
        b=CYCsrFgwWdd6Lc7bulWisjW9+4MDsWgPuersm4j1EA27qwNQ88pFeR/O+a0IrHpETP
         0NnRSD0DcyvC/9HXDsXolJFG8/5Feo6KD2RN14sZbG8eV37r5G378NlTOooVbnQza29w
         QXomKmyDIenShNnYrNARR1+k7qs7dwcPnEYxbpXNnxHc8I87bfuNKSJWuehwbId4ylfl
         o349IuoAID/3AaXhpOTJoQ8YEE0rN9aw343QWnVr+YHmv7N+xttu764qSnovvaHJiEWo
         LwbZsPMmtI8TPo4Qfl4tl8fD4+pCI8mNxkRDDNLm+Tj1y8wyb+jaissjTq5rLUY4op2o
         fiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        fh=rOdFGRUNnp8YaBtfWO5YnkjUMG9K1OP/X5uLZXdyi3g=;
        b=EviqLlCp0WVpmjS5TEsUnYdX0wfqwa6pTP38mEzp6Mu9xpKn6igkIeMyo2TUjllntx
         h5Obr4X99bahKmtfCzYtIR7KgXmito2YODfKzVr8ZTQaCySmxoWcRiLnuT84O86Ct1Sx
         A8WbV31n3Cn251FoiSnPW989Xuu9vOaeRaLnIcNMngz+89vQeyrxfPZsZ0bXKMAEZ+rm
         G6rOAJtVY8mGpiThKqBjC2WdLA4xXopR9d7buc6Lj5GylrOkLw9TTftXYeWBBiWrNFZ9
         F9FZsht659fouqgmBBdTE664lncfDbiAuVp9X/C+ZgPw8HnlI2+6ynSZngGmp5SZhOQh
         OEUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472760; x=1795077560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        b=v0Bvchk+/IGkg6KT2S1V3px0AMDP+a4Hp0A6dp1mzBTUv3a3FDI1Zi0zORu57whEdQ
         FS6IVxi3Nzd25A8mGJcyxpdt9GbvE2fikKiMiNUqPscliYqg6Yv4C3SvwrqgKNoEdx+S
         Z+uV8Sx2VQWSsvlMjXP8Y/Mk9BlVBFMSZI1mI0YKPPx+kLO8GmPvhfDPGd9Mosf4SS38
         iFPLayKDdpC9II1hJ7R6sL70cYefX6J/i6GjmnIwzKKJo00BbgZ+HlL0V4MZQb2+U4TD
         VBUdbRiCh7y0LDiOgP+dhn1XVU7SVckjWonxhqxoMfaraE/380KofqYUIy2QGRbrJZOu
         Ydfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472760; x=1795077560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig8TOwEwu93oj/vlPs1jDWfcC/HjbbLnhomiuGEjcu0=;
        b=rcJtQrl1bpIgVQpnX63lAluS2oZZFRJ6NndRlNQ107gQZIISQZ/oNbdUL4zkLJhUxd
         OXw/na2VGmxRmKn8h0+0NJhU21jdR0Jgqi1hldOAKi0BFWab8h0CY1iRN1Uv4nc/xJ1l
         cGmCGWD5Y+07TsyWCbLaLz7deJ25uQvtFavqESz1qCoHgSDHjxqHPjdBWGsA6Ff+YdRN
         CIDzCN7csrXKycOtpBHe48hZxqTvjb1yKSw4R5v7Xp5XDW3JTVQISg6/+v3ZftQmB+uA
         TJL2OUm7lgjBDnWh0fs0KG48TVhYoGdDacSQh7PMepkzlRAGSWyvYsDjuJt1NkG4/Qwq
         9A6g==
X-Forwarded-Encrypted: i=1; AL+hErH9sROz34UpDtcQIkNwlU/cGKfEbEuBzso94euzSY1iXDGayYIU434lCHZBT/geYE4LmguRrN18/rwCIIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bx/2W+p0OJ8Y5S6UwhMnVa8KHdWUxMtOQvCvbpV9rcD3SE48W
	JoLSSqgr5DVuOP92J8AdMbEPi5mmrkqrUIvl9VomJaUF9r3Cn3q/9jFOXYw8Ak0LOJpD8ZCstrm
	6o0y6M27KXXeyi1z1kslXTE6zg9wC62k=
X-Gm-Gg: AYBFou0n7Gf6lO4L/pJIZsIzzZf8QNxH9ImNwVUCu9rd5TqRMsAuw7SQdFejdAQbFnX
	0Ddt03PQbmaAfn9PFx/dJgCJsrbkI5uLIZzb24YDB0yhLVrrMkT4oA9bAp4Yl8JrNqJbfAkM4bd
	2CCKA4DP0+D9+wzyLBuWhs2D5/kiCYqfasAPJ66ILUlBVFeaEBaFAfL6sr83Uzp8wSwt2XE7Wvo
	U7+AQ0hQDijNtREUqcgxz9OeERAR+jqwerwo0/2kxkRDftuBM5efFsFAQWEyGeu7KsDrJx37Xma
	t28wo9zv1j+x6EtTdanPXCZ8+YbQ4VHuqZViJsz4YWAjug6mqOoTB2eCjN97hJ6EFxSDMcctHYO
	xhL1DtmJZ2G9lZ+7fCcqPYm2/Twq4yrf4w6F4kuuBlTR7xv30RMhqR38LUffN/hlFlWITlt4=
X-Received: by 2002:ac2:51c8:0:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c15d5f7848mr1986848e87.2.1794472760172; Thu, 12 Nov 2026
 00:39:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:39:08 -0800
X-Gm-Features: AclHuK-LsUOtbUqqsSLc1VRlkuatKOgx5pOiztBW2KXQJW8AeA8OYEhVHHOWdbc
Message-ID: <CAEy9hNXag+0ssyuc9U9vSLqUS3jv=xKAaPkegR3W3Lyqma=1TA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] usb: dwc3: Let the Rockchip glue keep the host
 bus across suspend-to-idle
To: aiyengar1990@gmail.com
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Joonhoe Kim <26rote@gmail.com>, 
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this series.

In host mode, patch 1 duplicates Joonhoe Kim's earlier "usb: dwc3:
tell xHCI that it lost its state when the core is powered off" [1],
which I only found after sending. I have tested it on an Orange Pi 5
(RK3588S), with the core teardown forced so that it takes the same
path as that patch alone: 10 of 10 suspend-to-idle cycles with the
core powered off recover without "xHC error in resume". Please take
it instead.

Patch 2 is not safe as a default for every dwc3 host (Sashiko's review
of it holds). I have reworked it as an opt-in that a glue driver sets,
used by the Rockchip glue for RK3588 only, and posted it as an RFC on
top of Sebastian Reichel's Rockchip glue series and Joonhoe's patch:
https://lore.kernel.org/r/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmai=
l.com

[1] https://lore.kernel.org/r/20260929130252.869-1-26rote@gmail.com

Arun

On Thu, Nov 12, 2026 at 12:35=E2=80=AFAM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> In host mode, dwc3 tears the core down for system suspend unless the
> controller is a wakeup source. On RK3588 that ends the power session of
> every suspended USB device in suspend-to-idle: on an Orange Pi 5 a
> SanDisk Extreme drive on the Type-A USB3 port and a card reader behind a
> USB3 hub are disconnected and enumerated again after every resume, which
> kills a filesystem mounted on them. With the bus kept suspended they
> resume from U3 in milliseconds.
>
> Patch 2 of v1 [1] kept the host core in suspend-to-idle for every dwc3
> host. Sashiko found three ways in which that breaks other platforms, and
> all three hold on usb-next:
> - legacy glue drivers still act in their own suspend callbacks in
>   suspend-to-idle (dwc3-of-simple asserts its resets on rk3399,
>   dwc3-meson-g12a powers the PHYs off, dwc3-exynos switches its supplies
>   off), so the core would skip the re-init on a reset controller;
> - dwc3-google asserts its resets unless wakeup is enabled;
> - genpd keeps a domain on for a device on the awake path only with
>   GENPD_FLAG_ACTIVE_WAKEUP, which e.g. RK3568 PD_PIPE does not set.
>   Vladyslav Tymoshchuk has since seen this one on hardware [2]: on
>   SM8750 the USB GDSCs lack the flag, genpd powers them off in
>   suspend-to-idle and the xHCI dies on resume, already on the existing
>   wakeup path.
> Commit c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on
> system_suspend in host mode") also made the teardown deliberate, so
> that the PHYs can be powered off. Thanks to Sashiko for the review and
> to Vladyslav for the test on SM8750.
>
> This version makes it an opt-in instead: patch 1 adds
> keep_host_bus_in_s2idle to dwc3_properties for the glue to set, and
> patch 2 sets it in the Rockchip glue for RK3588 only, whose PD_USB has
> GENPD_FLAG_ACTIVE_WAKEUP. Nothing changes for any other platform, nor
> for suspend-to-RAM and hibernation.
>
> It is an RFC because it depends on two postings that are not merged:
> - Sebastian Reichel's Rockchip dwc3 glue driver, v18 [3]; patch 2 is on
>   top of it.
> - Joonhoe Kim's "usb: dwc3: tell xHCI that it lost its state when the
>   core is powered off" [4]; patch 1 uses its xhci_power_lost flag to
>   re-initialise the core on resume exactly when suspend tore it down.
>   In host mode it does the same as patch 1 of v1 [1], which I withdrew
>   in its favour.
> The base is usb-next (v7.4-rc1) with [3] and [4] applied.
>
> Tested on an Orange Pi 5 (RK3588S, no wakeup source) with the code of
> this series on top of [3] and [4] in a v7.3-based kernel, 50
> suspend-to-idle cycles through rtcwake. Both dwc3 controllers of the
> board run on the Rockchip glue: USB3OTG2 (no power domain) with a
> SanDisk Extreme drive on the Type-A port, and USB3OTG0 (in PD_USB) with
> the USB 2.0 billboard device behind the Type-C port.
> - Bus kept (this series), 40 of 40 cycles: the same USB bus and device
>   numbers before and after resume; no "root hub lost power", no "xHC
>   error in resume", no disconnect, re-enumeration or "reset
>   SuperSpeed", no WARNING/BUG/Oops; the drive was readable after every
>   resume (64 MiB direct read).
> - Core torn down as without the opt-in (forced with a test-only module
>   parameter that is not part of this series), 10 of 10 cycles: all
>   root hubs reported "root hub lost power or was reset" (80 lines), no
>   "xHC error in resume" thanks to [4], no WARNING/BUG/Oops; the drive
>   was disconnected and enumerated again on every resume, which is what
>   this series avoids.
> Not tested: RK3576 (left unchanged), USB3OTG1 (not on the RK3588S),
> suspend-to-RAM (not run with this series; the opt-in does not apply
> there).
>
> [1] https://lore.kernel.org/r/20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmai=
l.com
> [2] https://lore.kernel.org/r/20261111121556.1871-1-tvlad744@gmail.com
> [3] https://lore.kernel.org/r/20261021-b4-rockchip-dwc3-rockchip-glue-v18=
-0-60000d03fca2@collabora.com
> [4] https://lore.kernel.org/r/20260929130252.869-1-26rote@gmail.com
>
> This series was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit messages, and I reviewed and tested it
> as described above.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Arun Iyengar (2):
>       usb: dwc3: Let the glue keep the host bus suspended across suspend-=
to-idle
>       usb: dwc3: rockchip: Keep the host bus across suspend-to-idle on RK=
3588
>
>  drivers/usb/dwc3/core.c          | 41 ++++++++++++++++++++++++++++++++++=
++----
>  drivers/usb/dwc3/core.h          |  3 +++
>  drivers/usb/dwc3/dwc3-rockchip.c | 10 ++++++++++
>  drivers/usb/dwc3/glue.h          |  7 +++++++
>  4 files changed, 57 insertions(+), 4 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261110-dwc3-s2idle-optin-1e3021adb650
> prerequisite-message-id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-6=
0000d03fca2@collabora.com>
> prerequisite-patch-id: 4fa3aae8ccfa5383522070179c8777302411082c
> prerequisite-patch-id: db09b4f5b0cffc1d5bf098fbdebb06b8be448fb7
> prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
> prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
> prerequisite-patch-id: aa0125edb604ecf704a69250cc0d693013a977c9
> prerequisite-patch-id: 62b492b7b6e9957282f1029a02aaf258b63e990f
> prerequisite-patch-id: fcc7dd5dcd583913f91bf9986b0137c2930d2200
> prerequisite-message-id: <20260929130252.869-1-26rote@gmail.com>
> prerequisite-patch-id: 34a5a2c638a729bde49c06a330bf0847bf17e5e9
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
