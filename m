Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794795824;
	b=pzg709l/QTVwxEkGplhg1eKboi0lYy1T6WnVrsA4K7ltBITbFsIkpELbxedC/QTqsFvP
	 Jw99W6tuQ+bNUYeVgIiiEB8Rxb2ihGUyucXHf3WZIKL6+/xhmy84pwVDOpAgXUUzNm9zg
	 Y1Ft+emA52hR/o7srvixhC65z2Vn16hXfMCw5nLYxTRObwuLa9IBBzvT44L86AStaN1Bv
	 Kke5+EvcabvmdVrUrJnnEFhMQu0XWS8Mp0Z9VZdb8RNxtZsYoZZajEv4RzFGNOf1rl42I
	 MA4lYOq68TS3/z4ThgLzHvPOn6OsWFl+N1CeL8r7xPeHxsFcAxe89MYMvjeR6YHn/ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
	b=NNW3vq51DrpQQruCMQuXJzM24oQvBSntuO77RFb0djRwAAox5WPOguNsp80rEBs7Nb6+
	 C3pYdtQOfU4UEcV2sEks2n3EMaPoRAiWZEPuw96at9THu53z1xwH03pKBflR+LuBRJBmF
	 yfKjioAOETMbJzL/fupqp4n/TBJAT09oFGBKVFX+l1GTJore2atWjHdpX6xFejCq92YHy
	 DOAJEhslN/4vsIVIPJMJWgdxUqVR3B1FTrHBzy2MOIY32s/dO58DWcuyT115oCvm/+MeP
	 WYQC98fijOHVkMksbFOr5wX5llorJ5JacvMkm3D3RWdamfs2MmKmj857paGhzSI3qag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7HQuqWs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369F606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E369F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7HQuqWs
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so2492905137.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795823; cv=none;
        d=google.com; s=arc-20260327;
        b=q/LHOiguwpu2ZPLqirCk1H7qWRBx3w7mlgGlnj+DXswrDJ4elc4ZdeN1pdwWR9r8D6
         ++2le7/mmyNLy2b3dNTxX2wrWYBWTd27w1aWZC+XAvkyIeYDemDMLfVvqATi7zN51lWr
         FzQ22OGWaeaeIgdUTNKmGXCimtUuY2FwtFLNUsFwuxSIIBLuZw+k86SCLZ+cAWfM0a5U
         v1kuUsJONYZ8Y3fO/qziLnU+2KqIAuFherDmrB1LyzZ6AcaKukiWNZrd2d0Ioqa+I/xY
         68zbl66R6HMcyBZRstx1L1E6dCmnIS4G9DXrjRxMOOs5pt7xeqdnhyeXgeb97oYjI6u+
         S+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        fh=OnwYGEIep0xU/JJuDRRYc/B09HaQQ3fSna9w0HCGa0s=;
        b=i1zeCHFzSCytjrRzAZ6PulC+LqrR6p+j0IPvnMEGYURWmO0hzOYuxv/to25ywFVQX6
         MezUDhout4P7CYV0gg+PvR+TPixyVNJ++UXypnxh5Bu0DYOwtl3aEbMQX4Jb83TiE/uW
         0BmM2coToHNtzuwfwY6yjSbOapq5mV+fRD3Vb3hN0dAdTV+xGsjagdM/2hLJohfvsc9V
         UIGxNfxbt1hboBzm+maMY8rsDpnslUkEf9ZuhzLlsjCjQXpYwAGfrkHpfGTlMQJB91/W
         6VQS7mbbVru56X+Ieim+3bItP4qLCeIVkAPSO+Sf229nMFQxP9seIYR3gwCdNfTKExuR
         WuCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795823; x=1795400623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=H7HQuqWsVzZsiIHC9hq/wCIUHRDK56xXHwtTvbfCDjE/9I6cDZIzEqYk41iMFBmPin
         5hGYDCj3e9yKBZUnR6qUTAthcdwQzxvAJZqnCWfW9ioyRI/ONrA2XFv45HNdWX5wkRlb
         yM16bgQZNKv3SBnNArIxXJLKJ70E1UbrBscAZxlAnR1hqZ6m5IRadCDvyUp/WsRjOiAZ
         HgZVRByRzUagfCnCoL4TeYHqxoAVffyQHfWvlqKisQkQgNu0ipeJhsw+S/XjMXEos1c4
         8m4bWMAFmJ7qpaxUZ4iZFMivoGIgoZMl1izfaPplxGRTtVszodJ4oPoss/nr39RVF4sL
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795823; x=1795400623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=euutR3SmYS9RUDuXH/Y7WfTamY6JBjiBdf/aAyQ8CF5CqUTJUvVEO1d3yKDUPj77QF
         M4U2fi9p07tghRo4cTxxvn55d5XFXS3ffy67trQgoBWgcEMWAVzf5UM/ssBuExLt6yWh
         1woUQdh8bAdsV9a0oXCOEMyeWzGcuHQVqsxtv3R2+hagOQWD35uWLvzju11v544ko9ip
         3qvXRd/zPMnaHbwHjWUlgDt+B8W4E/3kawd1/IiPzIMBz/uoGn5PCJJPpqHlU1j6ym20
         M0HMGI0ZT4P8E1PZ51E2COK55vUOzHfdYejt3spX3PBpnxS+wAx32hwELeTtnkUG/mSM
         UQqA==
X-Forwarded-Encrypted: i=1; AL+hErHNS10AsKV6m6+cYz/T18dxrqp7n2M5IWOTYGplzSP4tIBE/058jLYb0c4QsSDLempu3l4i9MshFvjM0+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z99ANqH3Q2fN5LTKhMoLoRIAVyWI3N6trxKkbmpiIFg69IgG46Z
	VdNF7Jp6Qr2AcSBlX+kYTNX+moZPofk34aENJY7ChG9YMWxRPRaFDwcTKNaOkHt3sWlCZ9e3262
	4Vy158dFWe9yNlfIUQy1qoSDZDNxXE5A=
X-Gm-Gg: AYBFou3vo547y0Hor0YuCIVh0P3i4Xo9TxPAwhDer8dR1s9XWCJ7FrLq+ZOwaLAWFgW
	h/Zc76L6LypM7Qok/eLr2NpwYPKCC1T+KN8lNT8D6/lZ2JB2bb1LAuCMVnXmlUin1b6VREEo/Jw
	u+cXPJCi6f1vddMbwaOusQOalglhwPyq0W1llIeEUYCk7iCmbwLYAdXAQhpQIs4N/xq5G8NGyUP
	nvHVImA9K0DtjJjtBUX8mh4pMewrPNqi0U7U2bCctZJFSf/dmpnT7R5JTdGYug5I8T6faOS8SSw
	vpWsb8+vLSlaCxMPcJPijQXIU7X1eTJfeBLmG0q2uj06UE/PNoQZ/1bGfiNaRZSAX09sfOi9qHN
	Q1K8zXy4itjgg343WuVGo2dlewpOeXQ/THutbzwXKCPcUKAQOGVmBnFg1fhSzLXqLHg3rMu7wyb
	BEL/bIQ2BI6/3138rVFSJhA8vrHC1bj++usJBKGiK8sm8vHge2/c4r0QeBwW3FgI2IUbUtg6+AR
	CqK0C7FzFe/6vKSBl8VpKQ9IWdNdA==
X-Received: by 2002:a05:6102:510f:b0:7ad:3ad3:997a with SMTP id
 ada2fe7eead31-7d64d45ce68mr3458686137.5.1794795822798; Sun, 15 Nov 2026
 18:23:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <179479040161.3291.5723238689308327095@kernel.org>
In-Reply-To: <179479040161.3291.5723238689308327095@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:23:31 -0700
X-Gm-Features: Aa3M54r7-r68gNu4ymZsCQOh8t93vqxjaKLCKDTADrWnDebXaQvgc4p-YSz5rsA
Message-ID: <CADvTj4orHRWsBCitdUt5rMXisGK-yzjysvGZcgQj=cJ1y1vb=g@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe CAVALLARO <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:53=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
