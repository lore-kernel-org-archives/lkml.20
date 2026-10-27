Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793073221;
	b=fBPDj1Idi69OxvkDM1FmZFlLoph+vbdB+xq8RYBM4yNuTBqLWNgKfc0XiNAQCGMd5epF
	 wVDS4GvtNoJOdWrcd79tkr0oL9ERtHXu6KLG3jA2Li4fY94terQ2Z6z5Ma44fJbv6uoq4
	 vT/oJDNa0a8r7fBqDDaCQ/v95Z2TrRA64f2r+lN8d19bKI1uMEAHpu8w5UMKlCcPFlKG7
	 6Vlp69i3HBwezeH5z0P7RprsRck2DayQ09Cv3SqRQhLN/kThtVybEnhiOWAC8kxuzz2Wj
	 9Uk6u45tBuIw/lah3jtOfAl5jiYKAgCMPrZuY39p2jHhooDNmNAiWXdHwyxHpaGdOEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
	b=eZlPtENRg4EnFN5KSYC+xuov6mDp+e7PoFU0Z0k691uYAyk0jIHEOzCoxHaEkTVcCRFB
	 QxqsVN/kUOXVV90/PfYOHsE++bQFFJHOYwkAMsQe6Rh5AhbnlfmBLpeSWdJoCmpu9mqWz
	 bzbky37GhAiUHfn+RLRRQvdHFu+qvF2uUzs55APVcqKeONDVeX+qWzvo2wW1v8v0hpC3w
	 ORbLR+qXMRh986w/XoJMgerUCTUCKto0lJWR5VNxI8o727bJjOFW4Dy6kqDmQdl03Hv/i
	 WtIAgvvrjxPXjM0sqyEVgi1UZ1FxKJPmTrGydva/yWYDItA4VmBDxNohKs9K1gcaslg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gmnM+VK2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E034606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E034606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gmnM+VK2
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6790844c9b0so2988026d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793073219; cv=none;
        d=google.com; s=arc-20260327;
        b=smEBQlFPOopcKCd6C6sObJ+FG2rLnOuZySXeoykDW5ebn9fOFIP8JA7gxNRvi/ddn9
         B4tLot6bdmC6HjAHuA1HI0XVqCYmwghrQcljwebn8Q1KJdiDdmnWoYK31k/7dXGxbQLr
         e4Qupnr5qXEz4cLYBV2k2xoONq/uSWWSXiEu3s1JoUn8uD6jUSFDs3dLMCTeqe0D1T67
         SAaHoq/hQdDMJQMAvR8DSyEScCOZptAIESLqPP0oTtTRBiWL3fvsf4Ragsf/2X0I+yXG
         kLrhy2wVuaWsIUc6bDp9gEWGt9Nb1s1I8pf6LI6//np7kO66i9X66Scwhy4tGw49o9SZ
         m0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        fh=Byqz4Qjym/XLKAjdrKJDknSo1WoMuBO7czMy4GJARJA=;
        b=eFL0fhuFqoSHL71eau8L1/WYZcflOxBWrhNLe9Qa/vaNyh++PZxH3Oaju79t6hQsrN
         SbMxDRsgBQvFK6YXi95LvBGzZfH0Nb2sZ5Tz/TbpeDxeWJ4BDrO/pVOgk54pQcclk5XE
         0drv87TSUe7O3gOoOngWS0JJU4NlZ/VBr5kEGTcmkqOefpIAGK1BfcJGLn0JRtMpYylu
         wAYTCXZ7edOrDbR7KV295bV9cqX1Y+8tyS0wf44lBs7rdC7tsezwWipFOJ/PApOczDwR
         z7woiEazIIWvF01yLOEKY85gd+eGovI0UbDefmeVEWF6IQQImGJyAfF5BXqBSY2cCR2n
         W8hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793073219; x=1793678019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=gmnM+VK2FHfRvDryYWxHCVQLkzSvELGiTjKId2CX37exxagezn5WzGkm1vyJrhbg0U
         0ntd9vDW9Pf1TYBBZKoovsDv6XFh/lhEacqhJOcgDdqDHPrte5YSBQNI4vMKTVLIOpoG
         gClP0iuoiU3qugTeu9sD5xek0+2z6AgQW4IwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793073219; x=1793678019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=agAAAywDo1LeSz1AfxmjPNv85CRXw9HUU+Q3ZryOh05TjhyQ85f02nqe53j6YFgIVL
         Yz/qtDP0qY9XcUXnzIZtKdSZnMUir5sGHjySEOlAQITY9Auksw/YWvRS6/A9iRQjYBxf
         qKpAmUuRgQBqBeuFSXSv2ojI/no235hcK0i8Wb2cZP/EO3Mox4mCF9gSZDYMoYEXfMru
         FHrU2qVNsE3MCH6Gl+k5t1gEB4yc5833ZhKkxcQXo5K855qGzDN/6WoAU2jORu+fdTsd
         UxOQiexuSNSNV8qKzMCsDDw6wc4KKNG493vFOQSV0w9jMrP3YpEjp1YumqGXkoQ/pQEe
         60xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcKAl5iu+DkQwjrG6Esf1i9JFOeuVxPCZIwExFvwapxD7DdxG70oSB7ESzLK2tg/MPsknPCKdDT3UkQqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZQVZ72+PnB4cTHjGQg2eHUEuC4We8i3DW02XnhjgJl2FpcSbw
	wkNyhq5KrRdr68vVGgKk82KGvk578ppS7G5lMyha2yUYfHAHbra1DBhbqV7OeH5sJ4QskciAr4H
	X9RI/0kLQ0VlshvonQGuXmWH4lshoE5Mc0G4pJZLB
X-Gm-Gg: AYBFou2fpRezUuHGw8ToJEQndWgbpl009lkYY5zCq5RRW8Q64LwJEiezA0qYQuULVcr
	kTEScM5vKCBdVe0WptRYlvj2JBljQvwqXnc66pfO/rdnovxKmRmNMWiuZfNZKAihkgRs2IgmlMa
	L9MuABf0d3TudXTqMOx8eGew/xQ6XKpC7IkKU+A4VDbda0y4gGERvCS34GC8iWq/JiRmKtYm6bA
	5lQwC8olvYds7A7lIFhNqdtZFmoNU3f4v2WSqqKWTLaU9TEUH+yqi5lz9djizSbg6FtwLX0a8Zx
	aqIm7t/pzPQQZSfH/6ajlVuyGybYmeyN3U3+Iya2AnUsVHGxkw2ciPX072eL6mpA1MbeX/+M46Z
	TzcAiJHdktMSy/hXJH70mMQ9HMWTDb3w+dsx+U5/NVWZT+mGxQHfhfbR6OTRUFknPlPE=
X-Received: by 2002:a53:b644:0:b0:677:d023:49b8 with SMTP id
 956f58d0204a3-67a4543f2demr5622996d50.66.1793073219651; Mon, 26 Oct 2026
 20:53:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027002419.2099708-1-nbryskin@gmail.com>
In-Reply-To: <20261027002419.2099708-1-nbryskin@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 27 Oct 2026 11:53:28 +0800
X-Gm-Features: AclHuK9fP-f3Hs_1VqqYwtoVLd1mzJ767fSZbB5u4Nm7cGL3-Cn95lyNs_2rirg
Message-ID: <CAGXv+5HiwX0R7a8gJeQMbZOB=AYEDUanD5ry6y0-X=wqO57RKg@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: keep the OTP gates shared with the
 secure world on
To: Nikolay Bryskin <nbryskin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:28=E2=80=AFAM Nikolay Bryskin <nbryskin@gmail.com=
> wrote:
>
> The secure OTP controller (OTPC_S) shares three clock gates in
> CRU_CLKGATE_CON18 with the non-secure one: clk_otpc_arb,
> clk_otpc_auto_rd_g and clk_otp_phy_g. The kernel treats them as ordinary
> gates: clk_otpc_auto_rd_g is disabled as unused at the end of boot, and
> the rockchip-otp nvmem driver enables clk_otpc_arb and clk_otp_phy_g
> around each read and disables them again afterwards.
>
> Firmware in the secure world (OP-TEE reads its hardware unique key and
> the secure boot state from OTPC_S, and programs them) has no way to take
> a reference on these clocks. Once Linux has gated them, every secure OTP
> access times out, and a normal-world nvmem read on another CPU can gate
> them in the middle of a secure access, including a fuse programming
> cycle.
>
> Mark the three gates critical so the normal world never turns them off.
> They are 24 MHz gates for the OTP block only.

If OPTEE needs some resources kept online, maybe the OPTEE DT node should
have a reference to them?

Otherwise everyone is just playing whack-a-mole in each separate driver.
And for folks that don't have OPTEE, it's a potential waste of power.


ChenYu

> Link: https://github.com/OP-TEE/optee_os/pull/8034
> Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 24baa0ef9bf3..8e0f408fdfad 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -1158,11 +1158,11 @@ static struct rockchip_clk_branch rk3588_early_cl=
k_branches[] __initdata =3D {
>                         RK3588_CLKGATE_CON(18), 9, GFLAGS),
>         GATE(CLK_OTPC_NS, "clk_otpc_ns", "xin24m", 0,
>                         RK3588_CLKGATE_CON(18), 10, GFLAGS),
> -       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", 0,
> +       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 11, GFLAGS),
> -       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
> +       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 13, GFLAGS),
> -       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
> +       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", CLK_IS_C=
RITICAL,
>                         RK3588_CLKGATE_CON(18), 12, GFLAGS),
>
>         GATE(PCLK_SARADC, "pclk_saradc", "pclk_top_root", 0,
> --
> 2.56.0
>
>
