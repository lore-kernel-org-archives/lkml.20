Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793235494;
	b=Bq/TjFuIfXMtL9Vdv8bChhWoVxjdxSHjZAWLPChFntD3yHTZAP581T6OIv8q5nukohFG
	 A2DAx4th414CDJmvpD18QPWimrvJ0HcMxaYFAydJC6eWRJd4NsZ0P+Wd4JfxGu86ASqWF
	 vMFFrX/UqtFmEYuQ+Sor7a4QTGLJwRysrKBQAeJfqhS1yZfRWArCgygZbtFstyPN148MG
	 b0sWNpkHGDxLAKb5cSewoIKxr3e6K/gA4EgWxZcbUSrjVtq4otquMDXZBY4kkbgqK16nQ
	 HCBjPw1jib+sSD7vrDJZ6TubXyVOzDjjmnf1BBaquWInYI4Sb2S99ni2gngl716sEOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793235494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
	b=RPMamINIiUD1WeqFHTxsmKZMhRKjIr5MXZ15f209pZwYSWY/488vtn4tXY+HNqABKfq1
	 yOgtsxYGqrD+FO00PGZLiET60kwliGivnXLeGtYJPQGLokn4phl9zQf3a9EtxvTyRZXi6
	 1mOzx+SylzSijq+QMBIoZgqvjpn5vjwWFOAcMBh+1lXtMFTVt/FXfZN7L9yM1xBnY5JUc
	 BTAK5JRI5beKJI9TK3zAffekCNbKRR4UI/vVZWGqDqGWOsTRCKQ9N6zIssZaUmshVMCsE
	 LvxDQPtP/NDu8WN9Fg94Iuw9v3s4j5f+m2M82XrmS7EoCSJiAiDRn5iwOlTfR80VvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rs8xIkAo;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCD606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CCD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rs8xIkAo
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c423b145922so224820166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793235492; x=1793840292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=rs8xIkAouFHDsph5jR746myyk7Bx0+LNv1CR/Wt5X62T+524n9QPun1aakHOpK2TdZ
         5DmzpUBHkUlXiNI8zoV3Jytk7K2OWDFUQhiOuU78cfX7QMlMKIHxNBXbgZaKhdp49oX8
         pkp5USBEg0p1Ghwcx97bwqO4oCdxJdXvL3rx+pSMQpObjrsh0L6Lj4/CPHRzcx1k3nxH
         EbLADyELT7y9w1Bq7jo/QwVDBh6MC4C2l7r18PKZEtpziPOgWjlOc89CK8C/aS85wJWV
         D4BBWo98f6KzussDciaxsvQAYYxC3a9GZucuChxfUz1pT0Mt6z7rio//7ffN6Li5zHY+
         WscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793235492; x=1793840292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY0Rqt9U0dIYToocgg3kUF7zpT8f/idrVBwF/VTivU=;
        b=UpzK+P+0jUfhYHbcverRGe/3s89L+PZ2aHGc+jwg6g1p7RU2R03DNf5jwh92vMNu6V
         Umh9lTN/nJtoQONp5Bi8LNVvIGkeYpuvqRx2J/FkIkwICqbEzmc5tWnPOD67Jfc1GMAn
         hqBPM4jhlrmI1cWl+Km/JJfl8LhcG7/e/BysmHc/8rd4Y+6dUxtDa4oNiNRY7vMK9ZaI
         3l6gXxr8bCBhMq9uH0gINsPSkKbRZGfZgFLHC6E95QRzVEILvlo8sNKCpE4ybVzXNswf
         0rpw7Mh6CwkUCa0RrAu3BbDReGAT0UqdKXdPFQQbusFmpAksDQdnDL05bu5fr6VrJYLb
         oyOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNTucOEXlXj15TseBr5tB9zdPo0FZ5qHuAMcBSdzPa/eJALGl9ekU2Ut59OOoQxh90IfDwBQZBLXFFLDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRxmZCjmWAm6O+YmZ8WkrNjFye0zv+i0PXwy3LwEyoodz8BRuZ
	EnRJYyxobSTblqj//M0IDInNYM4iz1BvAZbU0EVQIe8aYSI0oMnzyMET
X-Gm-Gg: AYBFou3K6wGs7F/B+o024Q9e6htrkCNSvFBN0vo2+oUp77zH7+Qs4uRdcgYnqPa3Iit
	5OgvF9hoQvWKfIXeOzjdUZwCtIH0ocmVkZ0I5eUKuPjYB0ZVUR+vZtt8iY1I3dn/HHDKiFZCnnL
	5X97x8ARtaKIDWIbdV6j7JqtlZeyeSrbbobrMOXstwjoIVyYqH1zcMMA2v3mfegPQdd+ixaIqjc
	bPOXb2r0+eSeDaaqBLMm+7LU4wMgWvLtgU9rQXmcLyAlht8nqduq9qj9jSbw43erweRk+dpl+WE
	FzgvvzsNbAZQKG5pcGR/FwIy4sd8k/2qiphyAhFgoK+WARu1I3jQIuNn8GHCEVv2RB58XooTsxy
	KL3zdyQWZ3tknsfMFbA2v3hUDDGhNZAexNrXacwvZ3a794p+B3XTbTv7QGCfNSTQ5UZH4NmXNQ/
	HcL2LAWunudJn6ZaH0KS7v2/RgHXidWZzJt1+J32NHaryxffV8TInX/mFw2suBN8AggCs1VGzU8
	YMui9BCaZGh5PVbfP9nUMuHj1kguDKkFa73M/3Vx2vkn3/Ydei6KkOo3tdumPKS19zx+ASIb7/R
	OHfobuyQ1XJ+EmPvmnXi/c6k8TIPPA7QI4AZHWvRpJUyZH+52IiZcdDp90+YxnfuOkWcMk1a9G1
	99Q3I0j+6F4lNK+jx45kl3mHBD3A4Fy0BiAo2Qcw+Vxjrzw7oK3VuQZXh8VbldrVOHe3/bd0y2c
	dT8VXbbXn8ZDUjRx/UUF2XFdKt5GCmwtWg1QbM
X-Received: by 2002:a17:907:72c3:b0:c49:b90a:988b with SMTP id a640c23a62f3a-c49bdf89bc9mr328062966b.49.1793235491600;
        Wed, 28 Oct 2026 17:58:11 -0700 (PDT)
Received: from localhost.localdomain (249-172-21-31.ftth.glasoperator.nl. [31.21.172.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm668971966b.56.2026.10.28.17.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 17:58:10 -0700 (PDT)
From: Emir Beganovic <beganovic.emir@gmail.com>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Eric Dumazet <edumazet@kernel.org>,
	Jianhui Xu <neuromoments@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH net-next v19 00/13] ax88179_178a: Add support for AX88179A-based chips
Date: Thu, 29 Oct 2026 01:58:09 +0100
Message-ID: <20261029005809.19405-1-beganovic.emir@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested v19 on a Dell DA305 USB-C adapter. It has an AX88179A
(0b95:1790, bcdDevice 0x0200, FW 1.0.7.131) behind a VIA VL822 hub,
plugged into a Dell XPS 16 (Panther Lake). The peer is an Intel I225-V
behind a switch.

I built ax88179, libphy, phylink and ax88796b as modules for a 7.2.8
kernel. v19 needed two things on that base: a4e22e9253e7 and a backport
of genphy_{read,write}_mmd_c45() from the adin1140 series.

With the current driver in configuration 1 this adapter never gets a
link ("Failed to read reg index 0x0040: -32"). With v19:

- 1000/full link with flow control
- download 940-941 Mbit/s in nine runs. Upload was 937-941 in five of
  nine and lower in the other four, and I couldn't find why. Eight
  later runs with tracing on all averaged about 932.
- 1-byte TCP request/response around 190-200 us, against about 1.46 ms
  with cdc_ncm on the same port (its default 400 us TX timer)
- switching itself to configuration 1 when the device comes up in the
  CDC configuration
- 100M and 10M links
- VLAN with rx-vlan-offload on and off, and rx-vlan-filter dropping a
  VID that isn't configured
- multicast filtering and allmulti
- suspend/resume (s2idle) and wake-on-LAN with a magic packet

Two small things I noticed:

- "Switching to vendor mode" is printed twice, once per CDC interface,
  and before the netdev is registered, so it shows up as
  "(unnamed net_device) (uninitialized)".
- After a WoL wake the link goes down and up twice within about 2.5 s,
  where a normal resume shows a single link up. It comes back fine
  either way.

I only have this one adapter, so nothing on the other chips.

Tested-by: Emir Beganovic <beganovic.emir@gmail.com>

Thanks,
Emir
