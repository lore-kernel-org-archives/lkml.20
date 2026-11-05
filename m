Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915093;
	b=gmJfc+cUiYGLrYm08EWiu3u8D1K40lNkjJFW83d9VqKje6L7HgGd4CV8FsZ8sRnLZcUZ
	 ysrqH7rLSiC8JE1glZ7vSAcSVMLoymrArAeC/qR5yD6aQQeKz1oEhVJpKk85TkE5a4yex
	 vW0LLUzWRMqu4gM0fBIMa5zNCVxXS09J1o0Fo6MrqcAOpZNGbHHgF8+25yCNuS1xH/u2O
	 p1fGEZQBzPDKKryPIZ3t0dX9zaNEAfoRN35PFDo0H6m+uEFj3CsviqeSpJEadGfBac/UE
	 GDiz+/WtehPYeP2k+F9zc7ykxUyl82e3K0lQkEOCm69SaKP1FLAzkb8QfwjgWrh9PgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915093;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oHIzt9l6ZqX1+4fgIF4dpM8hMXfpU4Wy6+rPpNQD3cg=;
	b=jybOh392wPEkJeqE5zSSOxWWepDMYHwN8iJMIrNiRwpoSz4w++Q8qxTW1Fercy+ClWvA
	 jS0ZwhQqoBDQGr9XeRSGx9fC3MZZi53K1G/XKHb4kR0mt2ZnUg/zTfZS6HoXoh8rEqibr
	 Jocoi+lxTl8m17wRsgmocSxE0XmOzV7OSO9NTgf3Cr/6Q1RfQicNsBKS2jxNyKgYmbHW9
	 gAC89Xo5BI2FENB/DB9WihgoMAHR2bBcoGnPBxQ3Q0hVLxct1TJ5Nz9PFF7l9qkMo5UAb
	 sGjrbs1eqxhUiioGvjaztKIXp9Pjkm2tz/tYCkZgf99Ib7XXw6us8IBxYZRBG59pKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA46606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4af81963f35so1489620b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915092; x=1794519892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHIzt9l6ZqX1+4fgIF4dpM8hMXfpU4Wy6+rPpNQD3cg=;
        b=uAvdJvKwH4FXchH1T+gUu4PNpDVxSAn9bVr/qE4lJqy/Oh10lbm367IKdd74C2EFNz
         2mmD3Ywf5ax3SMIhtVxz/9AXfg9xLB4IiqEDMHqEwkuMNKUmA+A1P1cjwlCOfVFYnt2M
         8vRiHIHE+z2BGv/u0AId4wRU+Bsw0ipxlAH0sM1BdFDQ903C/ZV1Ez3kFJ9WRpalqhz1
         CpAqHKhThpvOxM9wBnfF5qrpy+3nGWCTBjP8UNut2cH3ggiapg5mdVLLYmK3jbjSPUKN
         yhxRwFLm/nL6JhN3oIUibe2LsmJ2CEBqnIpI0BVQe26yi/D6G42Ya4Aqh/rMCR4PggCh
         ZeCw==
X-Forwarded-Encrypted: i=1; AKwUvByKj3OZIXgvF0BZ4xpfzdKET1KNnNxGtrTQLT8BNnz6tObwMxVmROIOQg5pRwewqq1gxUqOYlSFCnT5Qcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kuz1awHWefBeWCcNbc65bHc0xa98aEY0qdIv88wz0qmfIouMi
	E4f/xXDNEnskw/BFFoX2Te+1MgUNQQ4f2emZB3BfMydxA+BDCKugVFNBZ2ntj2xM
X-Gm-Gg: AYBFou0DnJ/KpBM1ak0iphAi2DmdkVZ5d3sslypg3boWd2cOb7nkRgk8JZOrO8MvuYr
	MaTGUFyZEeqBqI0w72EelU80Jchv4BGxLCF1qvvNg5KGUYIOyXNdQV/4zRUGvVzId78EfIjFnpU
	LRUbZek37JxKPED+eiKbotnR6WwqF2JZ8SSbtdQ4X5z+GzXYGUIjyxKun9LRutMwrYOFwCk8Dxf
	pFSYzMV+hGpAq8p6FQJnnAPwVCBNwxOsdRxreTlslEjXg4QpBRAQGj+LaoHnMTFAdYXMK4f8YEk
	7FKBik9tjP58vaKIu6L9UWSY47rRrgPWgb/DqKdHPS/MOehVnjQd3BdLVjoL1y46t4IhyVIDT3T
	VwrWsszumjYURIoDg8NiiYjo++O1mDMZfNwyjF2y4+mkEBTldRucAGPboB+m1LJ51DDyRdxcbC/
	dqNHtXnk7O9A8taxBlQcuPV7BQC9v24+vrqqp/cIPfPdX55QrgKz2YitDG/hM+UHuUDJUvNRdk4
	myEpO2IS+e1yvaQIjJF6kFDyMxizndUFYKtNOUQkA3hrCXmJztDnAnmFtSJvolK2LztFXWCz5EZ
	zMtwAJe+pY/kOI9j/uaCWIsH2TOclRZHXNUtXtocMtf7wK4+pRZNLi6/ex8gTXSp9FqeL7qynaz
	wxfxo/XAJT/zbfpe1M8+vvrSIAfqYZrsXZ3T0tCqUd9mIoPR+UyK+QFx2Ox7w84tSmajOC4VneP
	dxtlTr6vzGOBZJCrulhal1
X-Received: by 2002:a05:6808:f0d:b0:549:572c:fd42 with SMTP id 5614622812f47-567e13616d2mr401819b6e.47.1793915092083;
        Thu, 05 Nov 2026 13:44:52 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6436sm5290344b6e.4.2026.11.05.13.44.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:44:51 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df5e315bd1so38917eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxp3+0ABaY7+Y8vPp1ohxPC7IzjuPcKBEM/xlNhK7xcMMIc03n0qgoqTbR3yM55u7lOO+eUY6Y6OkSBsVM=@vger.kernel.org
X-Received: by 2002:a05:6820:4d48:b0:70b:8831:8c5e with SMTP id
 006d021491bc7-716e79aa3abmr562272eaf.51.1793915091517; Thu, 05 Nov 2026
 13:44:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com> <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1a19d3270b8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 5 Nov 2026 16:44:14 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_xkZ1oGsg=uPtCT-Eh8_-TuLEwxEx02BfLiOB2bZyg-Q@mail.gmail.com>
X-Gm-Features: AclHuK92anjNPVWCBzaMzrlLgp2aPs-ERNpv9JXE7UUqwrJIWMbDdlGrpwi1rH4
Message-ID: <CAEg-Je_xkZ1oGsg=uPtCT-Eh8_-TuLEwxEx02BfLiOB2bZyg-Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: michael.reeves077@gmail.com, Pieter-Paul Giesberts <pieterpg@broadcom.com>, 
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>, Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:58=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> Op 2 november 2026 01:43:07 schreef Neal Gompa <neal@gompa.dev>:
>
> > On Fri, Sep 25, 2026 at 9:49=E2=80=AFAM Michael Reeves via B4 Relay
> > <devnull+michael.reeves077.gmail.com@kernel.org> wrote:
> >>
> >> The Broadcom BCM4388 chipset requires new PCIe initialization and
> >> firmware interfaces. Add support for these interfaces to brcmfmac to
> >> enable basic station operation.
> >>
> >> This series adds:
> >> - Signed firmware loading and mailbox transport
> >> - Fixes for chip identification and firmware capability matching
> >> - Versioned scan and join requests, and extended PMK payloads
> >> - Updated event mask handling
> >>
> >> These changes include work by Hector Martin and Daniel Berlin from Asa=
hi
> >> Linux, refactored where needed for upstream inclusion.
> >>
> >> The series provides basic station support only. 6 GHz support is plann=
ed
> >> for a follow-up patchset after this lands. The driver retains legacy
> >> interfaces for older firmware.
> >>
> >> Tested on an Apple M3 MacBook Air (J613):
> >> - Device boot and network scanning
> >> - 5 GHz WPA2-PSK association and DHCP
> >> - Bidirectional TCP traffic
> >>
> >> Testing required separate Apple PCIe and devicetree patches, as well a=
s
> >> Janne Grunau's port-authorization fix [1].
> >>
> >> [1]
> >> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handshak=
e-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
> >>
> >> ---
> >> Daniel Berlin (1):
> >> wifi: brcmfmac: Support versioned scan parameter layouts
> >>
> >> Hector Martin (6):
> >> wifi: brcmfmac: Support newer PCIe core startup and interrupts
> >> wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
> >> wifi: brcmfmac: Load signed PCIe firmware images
> >> wifi: brcmfmac: Accept newer BSS information versions
> >> wifi: brcmfmac: Support versioned join requests
> >> wifi: brcmfmac: Add BCM4388 support
> >>
> >> Michael Reeves (6):
> >> wifi: brcmfmac: pcie: Report the detected chip ID to the bus
> >> wifi: brcmfmac: Match complete firmware capability names
> >> wifi: brcmfmac: Fall back to RSSI-only default join preferences
> >> wifi: brcmfmac: Use event_msgs_ext for event masks
> >> wifi: brcmfmac: Handle larger firmware band lists
> >> wifi: brcmfmac: Handle extended PMK command payloads
> >>
> >> .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
> >> .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
> >> .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++------=
-
> >> .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
> >> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
> >> .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
> >> .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
> >> .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
> >> .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++=
++++----
> >> .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++=
++
> >> .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
> >> .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
> >> .../broadcom/brcm80211/include/chipcommon.h        |   5 +
> >> 19 files changed, 1593 insertions(+), 339 deletions(-)
> >> ---
> >> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
> >> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
> >
> > Works for me and looks good.
>
> So what does "Works for me" mean here. Did you verify it is working on so=
me
> hardware you have? If so, please share the info.
>

Sorry, I have tested on a 14" M1 Pro MacBook Pro and a 14" M2 Max MacBook P=
ro.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
