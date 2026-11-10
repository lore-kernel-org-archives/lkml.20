Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278146;
	b=Z+Jaz2MRvrNsQ29vGDh6Wgwzo9iCBEUts5p04THNN5PPTDKp35LhcrI7o6rh5HV38t1m
	 b5o+5DBLKV9GAlGBi4ymDl/2crD8fwIiLHtnqo+awrWPVD3nj4dukwEAuzTg6hyD/usiO
	 OzeeEWeMmQle1dJZNgPmmG5iRcP3kPsukmhNOye1f/mjcqSfU/xVLbAFEXcc++Det3ljI
	 BwUfxf5v4Nb5z82iu52lZgl16ns9kH2QFrl7v4CK/hkEAm8teyPfDRVnIV4lvvpRF2S+4
	 MtbLOVzZQvzycpAlaaFX+KTA8HWc/rOUxyWL5YNFUgxJ0qb7PsFSrlInYF5v8iw2VSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
	b=Fns7rDpDvdeDelTp1uHL0sonpEelgZ/EaeNniX/X2tNjtqmnB8UyqZv3zdoA5eyyWyqX
	 BC7CiO07+jGe4FxjWdT2a0jn340rQG1AyLGcIQ2tPEp3kchtJXG40/37XoQiPbsfgpaWd
	 TNEegV7Dj7LkZX4n4QhdZ+WAX2lgUoD7v+JHylGarA3EKa+CBWZvxzfTL9TGT9LEmPBK/
	 rObkFlb9/c8GrXQC86CZIDiy4DIu78E+fdgNOxbPz5k2tfJvIYRUxzmZuo000/ErmXHcn
	 Yza8a2JXzYd3TaRL4WeJUXcKCEKA1w/f7Cpzn4LbcOBZSWsVrHx7Cu7+5XunTn4/15A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99B606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC99B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so644580a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278144; cv=none;
        d=google.com; s=arc-20260327;
        b=XRbrgczAfRPOxlFEyKSyUQUdbX1KYyWSofDuqqFIzy20Y2dwOznkYmXre755CUqGe+
         C8gy8DJ3KatKtIlwaZsGcJM922Ugz3Y7Y+ypX/qpJDxeVso7E3z3SD0IkBgB3VlyPAPw
         v0511++LnCQh0WuRvDQz+N4496YHusmNNdkILyOqJzrviOroWARIfdDPWK634oAsq3eC
         IRzrupY90bycUd8+q6zwYiW6NiMQdJpSzpqda5pLsa0u082VfroBkcIJ7OvJzOMdpi74
         VoRXJ8+r09P4JNQld0looX57o3IBeUc0v8JMt5Cc1O2qPsH9lnAeUse500QtHveqcx9h
         OmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        fh=LsyHTLgm4Ph3WC9Q/i3GYr0yvSwivsRrLUqeqWTnEYo=;
        b=SnRDqzmS44frgg4CC08sYjrZiTWrN+F+qwoEpFw2oDmgDmColWCXZTUKHPIY4US3j9
         q3DdP5q5Y+szIzWLNu2Y/h9flXvg5+9G2XNn6riZ7jSp3uN39UuR4pkIJW9fxfAj+S5G
         7GNuNr/zMPTsujXJ8c6wc97MHCjsmqx9vZZh/oPyP3NO/lmSS6KDuMS/939vttv1Oh+u
         G4a2HZBLaj2gx9lS6sXa6afRe/JJnaES8DP0g2AWv89f9T1xwGpx+FoJBHc/x/uUgrkT
         wQwPJ5Hj9lgxtSSHc9xDZa/7E5Lo/mDcAqDyUNDanCZRmpcmGZ7Mzgqix45Zo73HLN5B
         Ke0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278144; x=1794882944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=eWeSr5r5o4b1bkqYgjtJbC3rvhYpbz3xWgu0aFWS22hceYif1O3IQXjrS3egH1On7Y
         KX2rRkHlzyj9L1BWTMksqurfYziKbAMiQ/sLsnW2woDzPSHgBnaBJkAHN9eMGje7En8F
         hmedJE2eyTyBa0d220Zu2/+RfZYbFaZSycyh9uhIuIfnwXcRYUnaPlgIB04++iJw4rMZ
         zlt+wbkvaTn9Su/9+0JxBb+QzhIuCezceOZaJHA7ngx38wdX5AXaFTH3QQ6G3bMIDWo7
         a57FxHRfYEDzvyHNNLpvVnxr/9YhRNWLNU4jxDGHiMM8iGpaZNV+iJoblOzKcHB10bum
         VEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278144; x=1794882944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=A7/AE4d6DoNo1szF1Kb/WKwAnQSbSmtq7I9/YgHziDYdYUJMxF2tS0jk6InLObFGua
         zSqBeZVCfPYpVmuA2lv8yJLJmDLDuGyuAELG2XCIib2aMO78ftXVfePPfeXE3HuEBlJl
         jcm4Dh9TozBAahmy6esr9h+8juTx65QZBFm6aK1Sns1/1z96q/UR7qxKjcM7fspRTHI1
         ZaTQtA4inzhBQn3tqDaVNvTh08l7KXr9+zI1n+4wZPW608CcDO5GN+Sw15AQrQRL7Q8A
         X3DhgdoQYlA4xzdKhQGoU6SKb7iJRYKKf1nar4MymLsvFrdIzTwb4MhB8LVtjYfUP+IE
         3aUg==
X-Forwarded-Encrypted: i=1; AL+hErH1R2brSs01KjFQzs+pnMkuiaN/AuP7qhLOL4hy2aQeckn/sdq/gTIKa7l8jsjo8jqf/CZbpL17J7sbz6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sfTtpDWgV80mR40+3hr5uvP4QyJ8ugpnsRws4Pydls1PZbJ8D
	dq/OjbQlHrAY1e8I8cEjlO7R+7Y3iMmRZtBSeZeJEXCnCQEQx/tqUnh9nbXlXARQW9zqfGCB4c/
	W0kDD/3PVhTJJ/4eOCdvlluaPSoNd0m8=
X-Gm-Gg: AYBFou0tR9rawiY3tPD1sJdLoK4u6v9U2xu7l4J+5Bn/pkoFwJNAFqHKnvQXkS7wlID
	p571HKMBRTY18Z4kgf3Fm7ANAW4ZcdeBZefl18I7XIysMBZcvp6LCjG7t6rt3u5KSm7KUZ0ikAY
	PgG3XK72hhqjgyyJ2PGOUTZC6jiJbKF/CreetYvElh/tRdObBTldo+YzVS42SCXF8AQzzx/DjIH
	vReMAdriM4mHpk2EfVMp7eN1epcMxKkRQPJIF85JLIg2EAA0BLzq8HUJx2YmL5+HSJBy5EnFKKZ
	hoZlGN1eYnk2OfkGtr9pfpfwEfa0tKXFJTIe5tJtULP6iT05wL6GDapDI2lKl6Tgpqqn2VvcH8E
	9ch4aoJw+qF5CK9lzPsGtMYf6Rp71jp8LJ0Jx0fZgK+jAfYqlv/jfuKbnMpyoqinFygArIpKGA8
	ru9sOJegDq9/HfnA5mQN+YCNFCqPvxA7ycIvVcU2kq7IVChTClCQITwrDHMKSlbOq0nGL7g8jT6
	pVQWRfnnn4aEK4kNgzX1wsJNq36Cy7srbswYT7vK195SxxHxg==
X-Received: by 2002:a05:6402:1ed3:b0:6b5:6116:e333 with SMTP id
 4fb4d7f45d1cf-6b756ae9459mr1091731a12.31.1794278144068; Mon, 09 Nov 2026
 18:35:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <avKAhjtbi85dpGoV@x1g10>
In-Reply-To: <avKAhjtbi85dpGoV@x1g10>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 18:35:32 -0800
X-Gm-Features: AclHuK_Jcl2NU-HrOo7MbkFV6enMWs315CdjsGGJBAubQkYibDnJglGFx-rUHxk
Message-ID: <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
To: Brian Masney <masneyb@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:25=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> > clock before the driver core is up. This series replaces it with a new
> > driver in drivers/clk.
> >
> > Only the reference and CPU clocks are registered early, with
> > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> > plat_time_init(). A platform driver bound to the same node registers th=
e
> > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provide=
r
> > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> >
> > Patches 1 and 2 move the two remaining non-clock duties out of the arch
> > clock code, so that it only uses its own registers and the clk API: the
> > QCA956x timer interrupt workaround, and the reference clock that is
> > read from the bootstrap pins when the device tree has no rate. Patches =
3
> > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver=
,
> > and patch 6 removes the old code.
> >
> > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> > of the old code. The serial console, both GMACs, the PCIe PLL with a
> > QCA9880 behind it, and the WMAC all work, and no devices are left
> > deferred. The other SoCs are not tested on hardware. For each SoC the
> > rate calculation was compiled in userspace together with the old code
> > and fed 2 million random register sets. The results are identical,
> > except where the old code overflowed 32 bits with register values that
> > no real setup uses.
> >
> > Changes in v2:
> > - Post the new driver as one patch, instead of moving
> >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
> >   patches (review feedback).
> > - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
> >   the others from a platform driver (review feedback).
> > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> >   selection of AR934x and later with one function.
> > - Keep mapping the AR934x SRIF block from its fixed address. It lies
> >   inside the wireless MAC registers, which ath9k claims, so it can't be
> >   a reg entry of the PLL node.
> > - Drop the clkdev registrations, which have no users.
> >
> > Claude Code (Claude Opus 5.5) was used while preparing this series. It
> > wrote most of the new driver from the old one, together with the
> > userspace test of the rate calculation. I reviewed and tested every
> > change and take responsibility for it.
>
> 40 minutes elapsed from when I asked for changes to when a fully formed
> new driver was posted with major changes. Your cover letter says this
> v2 was tested on real hardware, however I am honestly a bit skeptical
> given the short time frame. On top of that, that's not enough time to
> also go through what all Claude did for you. Please slow down!!
This was tested with a linux-next kernel on an Archer C7 v2 hooked up
through serial and two ethernet cables (LAN and WAN). There's no
difference that I can see between the old and new driver.

That being said, I only have two pieces of hardware on which testing
can be done. Both are rather new relatively speaking. Older version of
this series is currently live on OpenWrt with seemingly no ill
consequences.
>
> I'm going to pass on reviewing this version. I want you to take some
> time to test this on real hardware, and understand the code. If after
> that you truly have no additional changes, then I'll reconsider
> reviewing this version.
Sashiko had two complaints. I'll fix those in v3.
>
> Also, if you want to help, then consider helping with reviews on patches
> from other people, in particular with the large series for the new SoC
> vendors. It's a lot of work reviewing the flood of patches from
> everyone. You can see the backlog for the clk core on the kernel.org
> patchwork server.
I agree. It's quite unfortunate and have no solution to it.
>
> Brian
