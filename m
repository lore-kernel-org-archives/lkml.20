Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580187;
	b=JniOGpVzntjwQHqHH32AUV7nQGNBQOTSKHc0ULxPUWGXrpvDKCOR0+OV9nhYV2vH9P8G
	 vToADFJizTttnbp+NxD3kQ6yGuVm9ZJPhlywX2VVncKgEsW5Ac0L72pIFjy6O+JdbHXz2
	 TzjAg2wps7wdjnsrCh9Dhu9Y9TEonOyOxop+/+sLHy7uvc/EuAXlUX03W1UuN7BkuUBkW
	 1PlYMxdW/9rf0jp4xDMpbSnL0x4BCuWX2by2y2P1agNwcbGYNnl5qaR7snbktGmWFEAAl
	 a8CMfXIJW4cRVUOzlHsrqyyKmeaDtIB9HWqeTOBe06mFYff8oxM00u1hwrcAueoTj+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580187;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
	b=ZXfnFdD05FW8baFEZmd6EW9/P3HolI9pXvRVyp0TedoK693tv5U/8DajddghmTlYizvf
	 A3NVMxslPNiHSFwrtJrkWB3nWot5gjGsO+dxppAkiclKvp4fSLIg9osO7smkF2M+JLUPq
	 MGwK0zbFFWOousOlR9u3qyCsPdaaeEua9edHT3j2s3odi/bJynrrKEGLTBBI10V0GzVOS
	 dvVj+niBy3rAgmvDIpDnNlt4m3seCpzPpNfK1AR2+89a644wQUK8d4kfU2A2WUVQVmXMU
	 vZRbXfnD22vVE+h9IA4a+2XgQSBljXdUTi0Mpgcvsbjvf5N3jYqJrSGnvcpUpzf27aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A2606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso482795fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580186; x=1794184986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxLijxCHhlhY2faPDuw/HBU0+yy89FEV9COVq1aaz44=;
        b=OwTZBMQe8WjDu8YpQbgOG3gE4LmL9fjBCNF58FBCfQg0uqMKvYF0HCtL+jBtpgvotK
         jc9YAIXKoinZ6dVfr+OUgC19r4irXK4t1QR7FDbcTSmyFdLh+bcGi3MtEd7A/flToH9w
         K6oeMYsGRhavtOpZx5Myc7IehS7tmn2e4ukq4X8e87alP5+UsP3XaQZk5TTmlot26RH3
         xcZcM2ZWu0ikL3TzoeFB9g/So2IKINxQwyviTXcC2WrfrnKnoXZUhDUnTihdPS6LX6Vj
         JHBgvPwtjimXdZChes1V3fi5rEX4IYdl8+tPedVImjW97sPMJ2u7uco4UG8BHS7+dm73
         exOg==
X-Forwarded-Encrypted: i=1; AKwUvBwsYunFYrJM5r2CFL3KaqIP0cHrdYeocpKRHA29yNGWl4u145I71vgY4rDuWJN7Kes/izp8EcgBghqCxUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdRzAYMFdKTs1deLd5Eg0RKogssK/Ay46Worv9Y8BroqYhpOut
	2PGaGqR41uZ9peP7XKV+iH+VZp98YfM3xCN4V1CH9KpLUjVuC6s9hO64mHa5aAPg
X-Gm-Gg: AYBFou10wH+hQjWEi+DI/YYE87mn6EhTpT30gxQB5eQLh6XSsqepPN4w/1+Y0mBnVNv
	x7pIz6yLTs0090VVyGf40BJkdMwHgU7VWSEIPpSNecYum8XVa+FiWSl816VJ1tYwAm2BJv/dknE
	9DdH1XYtOErn1BdKaGQg+ie87lJiaJiD1iNa+gt5bphm80ayUvj5Dmk6H2yoE/Re1umu6yWUa8l
	Al35KSXZ2F7XOoowngIn7GRsnRpF+G+Ua5TabFjYYvu5lSx/C+hgoty8rSuMB/eMmXoqNzJo64C
	gjZM+E0rH3E1+uqNTIiZI7YnmqbQCUhx4+zqkyaenlA+jWII/QJOb+knigecc0WD0UdSFxUS77V
	BpaHMeLuPuJa5L8GGwGRqGTBWhtsRPaycYT9fBo/UyvpZBxhCx1/Rzs79SXhDMIzC1WFEBJ/X+L
	iySmVCjGZBy3ziv+7+y7Agm7V7HusResgiO2QiNM/dxjBYmshd/M6EffqNek8+fCzPzZ3jdTazR
	L+M3unyI0hFanObMP0HeuIyufwEcEUtQf/oUVAb+3P1VZOIs/qdPuda9KLzm3GDOfPbX+YQB+19
	/tHFkbjWWLciB2kbrUEgUSU+mIvB/xsX3vhs13++XVhVjakV5fzlf2qJB6Xp61ieX9YVsGcbzCQ
	MEdY8X7plpNLmlYHar1ZPIO1FT00Y480ivKeDmsK3PHPVM/RDB3WzgZ/TbZYJ0Sw42w35yd+Lnp
	g=
X-Received: by 2002:a05:6870:b2ea:b0:475:e0a7:9f2f with SMTP id 586e51a60fabf-4a9076b1101mr4887846fac.29.1793580185825;
        Sun, 01 Nov 2026 16:43:05 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm5788045fac.0.2026.11.01.16.43.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:43:05 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-82109f51565so1138755a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:43:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzsDvQ8hyAXCBp1gyD6rd6jbtNOou0RrYme+8axf8vOWOzfGNdlsRtG91lehyitwzO8lo4ds5/NZvg5DKM=@vger.kernel.org
X-Received: by 2002:a05:6830:3e03:b0:814:b62d:3122 with SMTP id
 46e09a7af769-85d365b1f81mr6135908a34.22.1793580185285; Sun, 01 Nov 2026
 16:43:05 -0800 (PST)
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
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 1 Nov 2026 19:42:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
X-Gm-Features: AclHuK_r7QD-EGzh5icdkxVPJ8YDU4Pcq4HDNCl7O8hh8I3jnfCORQFhQybBRTw
Message-ID: <CAEg-Je918POdPr-=6Dzpdkx_i+Hv4wxv5-8A3MUDEqC8SA59NA@mail.gmail.com>
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>, 
	Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, 
	Daniel Berlin <dberlin@dberlin.org>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:49=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
>
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling
>
> These changes include work by Hector Martin and Daniel Berlin from Asahi
> Linux, refactored where needed for upstream inclusion.
>
> The series provides basic station support only. 6 GHz support is planned
> for a follow-up patchset after this lands. The driver retains legacy
> interfaces for older firmware.
>
> Tested on an Apple M3 MacBook Air (J613):
> - Device boot and network scanning
> - 5 GHz WPA2-PSK association and DHCP
> - Bidirectional TCP traffic
>
> Testing required separate Apple PCIe and devicetree patches, as well as
> Janne Grunau's port-authorization fix [1].
>
> [1] https://lore.kernel.org/linux-wireless/20260915-brcmfmac-4way-handsha=
ke-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net/
>
> ---
> Daniel Berlin (1):
>       wifi: brcmfmac: Support versioned scan parameter layouts
>
> Hector Martin (6):
>       wifi: brcmfmac: Support newer PCIe core startup and interrupts
>       wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
>       wifi: brcmfmac: Load signed PCIe firmware images
>       wifi: brcmfmac: Accept newer BSS information versions
>       wifi: brcmfmac: Support versioned join requests
>       wifi: brcmfmac: Add BCM4388 support
>
> Michael Reeves (6):
>       wifi: brcmfmac: pcie: Report the detected chip ID to the bus
>       wifi: brcmfmac: Match complete firmware capability names
>       wifi: brcmfmac: Fall back to RSSI-only default join preferences
>       wifi: brcmfmac: Use event_msgs_ext for event masks
>       wifi: brcmfmac: Handle larger firmware band lists
>       wifi: brcmfmac: Handle extended PMK command payloads
>
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |   9 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 368 +++++++-------
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  36 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  27 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  18 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 124 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 141 +++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |  65 ++-
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |   9 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 560 +++++++++++++++=
++----
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  .../broadcom/brcm80211/include/brcm_hw_ids.h       |   2 +
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  19 files changed, 1593 insertions(+), 339 deletions(-)
> ---
> base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
> change-id: 20260925-brcm4388-submit-5cb8d3e6d6a5
>

Works for me and looks good.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
