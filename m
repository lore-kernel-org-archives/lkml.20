Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993475;
	b=ySHBaL+XyCFKZEpI4DAD3pAMr/4KHMf4Xam4UteYM+nu/QfbfBHO/X9RQ3+6SYsohyKq
	 cwMS4Hp5CBeeL8zsg1IjZ5E4Aw1r9OEgTJfE6nb/2q1TmLE3ixFzrAhBo8YPWVJY6OHmR
	 xt7g07LJ0pR3W2+ZsF/pfMtwNapcj6CCA25IzFTdtsGX6CdOfVqX3JO7OFGVieZxWxTcx
	 nzBWcj4E+NnUeg0BOeDSdPoWDYKjAyt3tvLKpzpPWQyygTOEkKmvYsR/vu7gxErXelKs6
	 V5VIGud+0OrXMeGF12qn0YNA/5dHg1dlzcvhRi9bzQz+Y9sPxEP6cWyQ43ulkuHuQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
	b=omapRFYUi87MHiKdoejjDBk05yZlMebb4tPmGgHXO5ERV5StZOjp2kBfjz2V5Pm9+EUY
	 wjb/r3rta0O/ffffJ0J6AY3u+RVf18VIqRGyVfKYcvK1eFrEKseQ+NSZKXQvPRgevCoW1
	 ulmV7JIR5VRy7wf2Donk+ILDjW9QYIBu0nE+z1cmz+0I5xlc1ZZ4lKL/Whp4Y97zo7sU/
	 mLxMp0wT/hJe9Zobkx63TlA/KeV7Q9QNIWCyjIBX8UoMD12j0cEgawATd6Ra9d8RD6en7
	 VQiK39Yp2l7Dep+T4LTgomuxla/BQ7vCGEsVTQRPwWkKYfHGWxWfqNydCb/IuOrS25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rt1NCMPW;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rt1NCMPW
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1205799a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993475; x=1793598275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=rt1NCMPW6K89Nyetn20rvlfOqH0Yt6rO2nrzBiBrxhqDULj6BNHHvgerHC2zOdAwV0
         BdRsfeUWTn4SY1MGHjkurK7RDA5kX+48Po2LUIc4nUNyPRx0kmEy26BOpAzlaOcgLZLf
         nYIW4MT+CtIYD+9UzX4qRLhBw6JPpphdAK1GYxMrlouVTyEyzGEhDg/xf6x+xgiQSlt7
         S1WjS2sedSDljQc7U9OjBuQ0I+gW5U8pJYsQdOpCrjC83nRfqWwt+HyR/+o1iTkbKH6o
         pgqEPaPTeuzE+5JvGkcpaRE4GgRXDBEN4aYr//G2xiClrmW243B/ozI0VbIPOLFAzAkc
         KUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993475; x=1793598275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=PPSMLOqINy1k22hRcmPbtsIriGXaT6O2HbUP9M6hWdEaXLVIRkM8VPpZ1L+GAkPO+u
         ttYNTogKs6/ZhhcdY2/a/YwLkIj3KTVpqS0UjoWv8v2EhKPrhx4C2AUY/Qw1dCoi6HrU
         esn5yc4WhgfTclpqBdeidE5FS5JgS8csZYv9Crw1meFpYDqAeApZ2plDCafJY4dceUTv
         nIACOUJNrjA4EFeTXW6GqqPL3AJ00+pGE/8R+tPwUI618uYJGnHP/pdAnoHvdvGweftY
         4aS1J85eksMYbAlYUfZHGAI8vTAtWZWVIQ9wViaeTN1z2iAAFoz0n9p76JDjmAi3MeaN
         d0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzrW9rXjSmbBy+EzMUdQvQ301jQ3uEYOxeDv+kXDrfRUNxhu3PSVRHQkfVpY+OJ4l6QF06pThRJiwGfgMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzPHBxEGSBgjy6nkYz34IBpNGG0xTdtmG/b1tRTb4nMoBiTnPn
	Hn1E73og2L2ufpxfrSLhnsR3BEFirz1Fm5GaxQ4MMsa5ROWNekA17emj
X-Gm-Gg: AYBFou30zBHYpCa6VszsOGj9/WKDFrsTXtsfHcXSzwbVNVAYzKMB2cAfyYWIx1hheza
	EZpntsvxFWJ8BXSSQdN0jhE31yA6tuZNgZAKYMxVNzsLCVBYeQLunwDFGGaiieUgsaOiyLfSlfG
	01VSDZz/7tFEi8XOFWvYknnqKfAsod4SP19izOWy73Q+tr87TMyAJvhlPbj8tzpiarAaXA5OwaB
	Sew/R8h2bRHg/KEgvIpghF7LHtoRHF2HtKyP9qNketNI6eKcpYpLSh9h4Pbh98HZkVv7TxbpqsG
	mCuTXizPm1q8fQfBPsi5OUlyDxtiTGPm434Z5FCS30i6O+qQRaaINtM3sDaaPRFVf+kTUwu+4UM
	WwKG4R6qGP1kFXtuoQl6/1iwXnzJfrpu88ZMS5kEcETQ561XbzUVNNGOK9SI/bf0ck/BGpTubXL
	/vEiNA3J56cwjCxJ2+80KbgeyrmGmHGLDVlo4dBHhFBOW1HL5p6bC1T/HVf+ntFYnYZ9DOqHRgb
	L8rgTH2BJtdQMDLjbaTnjdzAj5KpiSKkJ4zlNKNWP2CW1lKB27OhohnbyFm0l7YaySDr+fXhDOE
	4XeD0QKeCm3RCxNVrrkXSdWmUQoNvsMs3WTPQW+0sN2l2WcTdneXD6mWVOfIHM0/uWs5bMOBECj
	TfMjV1eOdHbMsVZaVzUxu/V7M2AkLcxBAcS8=
X-Received: by 2002:a17:90b:250:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3ae29699194mr612839a91.45.1792993474829;
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa53c3sm6699893a91.13.2026.10.25.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 13:44:27 +0800
Message-ID: <20261026054430.557499-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com> <20261025130206.187282-1-alan.tseng.cs@gmail.com> <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
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

Hi Anand,

On Mon, 26 Oct 2026 at 13:38, Anand Moon <linux.amoon@gmail.com> wrote:
> The main issue is that SPL_PINCTRL and SPL_GPIO support are required
> for board bring-up,
> but these options are currently missing from the U-Boot configuration.

Thanks for the log. You're right that the SPL can load the next stage
from a different device than the one the BootROM used. In your log the
BootROM boots from SD and the SPL then fails to find the SPI NOR,
maybe because nothing has set up those pins.

So tagging the pin groups of the boot devices makes sense to me, as
jh7110-common.dtsi does for its i2c5 pins. I'd do that once U-Boot
enables SPL_PINCTRL for K1, so that the tags have a user. It would also
go in the add-on patch rather than the BootROM one, following E's
split. PCIe and Ethernet I'd still leave out, as the SPL does not use
them.

> I am following the approach used in configs/starfive_visionfive2_defconfig
> to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
> as possible,

I agree with that goal. For the regulators, I think the board files
should use the names from each board's schematic, and the SPL should
find the rails some other way than by a fixed name. Otherwise every
new board has to use the same names.

Would you like to send the U-Boot side (SPL_PINCTRL/SPL_GPIO)? I'm
happy to test it on a Milk-V Jupiter.

Thanks,
Hung-Chun
