Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7C2222D0
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595520; cv=pass; b=Qgu2+sBgFBIqVdy+KzKmKajjL9iTO69EC/U4rH2faZDKqrU3JgpPYnGED/jzdYrjhzKDeOhSU9QvYq0fOZJIHRnZ/j2fcmQKDrhubVDSdmMnzFx6NZgk2Kbs3QKj7J9Gm7UasbIplnPmESMTtCjxYPJ9j1mxZHOhKWapjzhTcic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595520; c=relaxed/simple;
	bh=b3M1oyexbWWFMbupHT39KBYQPo8xp7QTlcXumCXHqA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfggADESG9U5qohSStEdw8lHeiD4KZiJ15ieMXEgX/wGllH2eT7mDofnAIaZ0V3o+lCOt9vY5iFpVx9XdlO5vtROf8D0q38S8Oqk7fUdq+AnZYwOJbjQbouh6Hz+creqE5bdo4trcqFodah+2dI0Nikr+5Jb2bSgrLB3mFzvFw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=j7mjvA9p; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="j7mjvA9p"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5352a876d5aso3452841cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791595517; cv=none;
        d=google.com; s=arc-20260327;
        b=FjXtBchxZ27X6gXLA5K7Pdt7xeILx6HVsU96d5stHNWQHlGbpMo6Bm/kOzjfDAAq9n
         BqueMcQwo/C9B2zAZ17uFbgh0vq+/i0Dc4U07n8/yTNHbhla9ZxRw6Xgg5iGBVJyMNJt
         t1kQe7Dh/jGuuM9bQJrHaFkMNNgV9tLRfLYof1wfVGNR5Kq9uRS0b8NHyfq1t6LVVSda
         MQG3TidENUSIUSVOD5amyngsIR4p842dqVBM0O+tIXwUIT0H3QkEyqPLinufzyxdvL+/
         eavUaIEWY9HzsZP436nIVS6s47JosDySx+UuNHtH6OdcUj0Fm4X3YNYMVfU4Jc8Ngrme
         BxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3M1oyexbWWFMbupHT39KBYQPo8xp7QTlcXumCXHqA4=;
        fh=W3odnNUqq23HoPRZL90LCUAp07JvPIEkNFY0Nx4MWGg=;
        b=EvR2fvRGSU1jXf6IPT8RSF1k4Yt6Nnl1pgffHMrjP1qfoCBAsyiBkOWNHtqOhlsDjp
         AMblh8CVj2IIi0+CUBujphfvzUZe5I1TRCOZNv4K6QOFMbLDC7z0ikEewSBL3+e17/f7
         3xrBXXLWmTbekmED2zGx14nO962UmsBXFlLheZLAhuy2C/tJAegz8xf21ar4MIktbbYZ
         MH0LpTnTnglRCVYw7oRzhDS8MgQEnbbCjj4V7cmzALAVMO3OXnUA73FPZBDCHfQL/HME
         wvUZaOmWAKGLUUThZjWhTOhBgvGivhkBfV0W7pycj4to+mlvI1vACogsXazVXI4A+GmO
         zA4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791595517; x=1792200317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b3M1oyexbWWFMbupHT39KBYQPo8xp7QTlcXumCXHqA4=;
        b=j7mjvA9pwrnFTRMmfe5JuDifZfsaddbM5GemNsZvh2V3h0UkAiAaewnquAlCYreN71
         WDbDitT6NAC6LL+hTH/zcvqEv+vvvjOf/pxf1eE+C92K0WbBf4d2M9OVz8lw175q5gON
         51iATnGCHZT8yD44fxufWAxsKLl2Vwo7XHUTGDxL6FVK/fFLg9I2HsLct9ksnHIrLfJp
         AbZDnHHfmGkq191LDQnR5noevxOahXvZXiBjEaJdSvrg8ePpIg/OuT0/uaOqwkAg3pAI
         R7sLkfGv9mjwKGyYtlYfDGgsaZcUV+zc6OnuDuisOZJGyXgiS/hLxKuyNNKz08vp4lE9
         8Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595517; x=1792200317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3M1oyexbWWFMbupHT39KBYQPo8xp7QTlcXumCXHqA4=;
        b=wIHcncC/GyL5kOtUzFJ8Uf88wNDueRVUh6royVzG0p/vXUT81b62oLCbCBTKjQ5qKx
         AlFB4WW8084Gt8bl0XVPLIKJJkCKsmOeZz5T6rI0JI5qmcamlWgZPjmnYw5vlsK0QK0R
         EP0cVp68Cbrcoj8KihWnv829/nk+ydXm9xkAMEEIlbTEMm+4rdSlmm49Ds8KHIqsGHVG
         E/ANaJpX844L9JtSvSonKQktqJDwWki4/zB/JdYLlYzp6bexJoyQ1/5IbmbVYsV2ok1a
         cTlczT0YX1qk99NkuNi/HTnTS5SIn26j5H6U4SDaMfoATMhFdVo2kvFu+3ECJg7G1zUD
         ZQgg==
X-Forwarded-Encrypted: i=1; AKwUvBwROn1cnS//ZGW9vU5lFCXBayRBDBlfBzV5Jt7gR5MdLOgrvVhtyfojErjckDUB3lAaB1XG2RWX1M9Dg5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWXu79wFwSdSyGVYSy59mezxnAOZDyKuq37gMn62bG67trz1aF
	W6Vsjn9pOgVj4ZI6c/YCGpXxM+fRTvqMlO2cotstRlFD4l8DWDN0SCJQ4Ye0gX9Wxoo/oarNQJZ
	mwftdx9Ht2xX9hZakbT2zQerzqnYl6Q28BXcvupD9
X-Gm-Gg: AYBFou0eslkGiBdj0N3YTkxufawJ5pUkWvz6MmYbvLuIof9pTyxqj/xoWqnpyS8mnpv
	x66qOfcE+cyjrklLCU06ohyn+3bZ7KVnwb0DlEUmE7nMUKCEgNl3PaRWi3f4Q+twbKy00KCaVTG
	h20hA8Tcfz4Eb3RHLaiWz7FFKZjQm8qZsP2M4Y393x86lvL44mCpXdgyo39kd/U3wbPO2hM+4G+
	Pkr2ctjJFICD/0wOvgYgd4uLrSK7+os5a5f089++cUtceXPwrw6XjYiMib70zJAbhTmUvQI1i9k
	1iQCa7bgR8BP2zIlzM77Sym2/5L4etAvWKgMIxbs5ikRcV7xbFrnR8fGnK1X7tonjw==
X-Received: by 2002:a05:622a:4d07:b0:531:11ac:23d8 with SMTP id
 d75a77b69052e-5359fba60edmr54510921cf.49.1791595517306; Fri, 09 Oct 2026
 18:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com> <20261009143506.2507607-6-jjc@jclark.com>
 <3b1a2994-5251-4800-8c61-b63d7a435b21@broadcom.com>
In-Reply-To: <3b1a2994-5251-4800-8c61-b63d7a435b21@broadcom.com>
From: James Clark <jjc@jclark.com>
Date: Sat, 10 Oct 2026 08:25:05 +0700
X-Gm-Features: AclHuK9fnyUSFTBRatk4Hx1M48w-fuilgNmbIw2Nk6Pos_snbg5ersatAiB3CQQ
Message-ID: <CANz3_EZMG5SMYL+_sxgVD80ZG55VsWNtO-POd1L=6DowVcuCiw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] net: mdio: bcm-unimac: implement timestamped
 MDIO writes
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Doug Berger <opendmb@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 11:04=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> The clock frequency is fixed, so you could also provide a fixed clock to
> ensure that the clock frequency is derived correctly. I will check the
> actual clocking because 200MHz sounds odd to me, since the RGMII
> interface does require 125MHz and therefore a 250MHz source makes that ea=
sy.

Thanks very much for looking at this.

Here is how I arrived at 200MHz. On BCM2711 (CM4) I polled START_BUSY
in MDIO_CMD with the MDC divider in MDIO_CFG set to 9, 14, 19, 29 and
39. The mean busy time of a write was 6.42, 9.66, 12.89, 19.30 and
25.63us. A clause 22 write clocks out 64 bits, so assuming it takes 64
MDC periods, the MDC period is 100, 151, 201, 302 and 400ns. The
comment in unimac_mdio_clk_set() gives the divider formula as MDC =3D
ref / (2 * (div + 1)), which implies in each case a reference rate of
about 200MHz.

Could it be that there is a separate 200MHz clock driving the MDIO?

James
