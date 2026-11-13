Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530171;
	b=OAxqXUyXCtn/KJ1o6Zv/em8tRVj6j39j2+91e7qTXheUPtisPkcECoYkTabW8OKo0jS/
	 J0PVolrHwhOPl102SNmCr0s0eRuyZNy1byRANZqxlZONwdLhv4BJQRHeGAY81Bjm9e4US
	 q7lQfBXSmVHOZoMuuKHkB8AKIfF+1pR2M8EqL6n+rkwGmHp5FiWHmCBMRicNwWYg9jLN5
	 Sidl2p/m0WXz0OrJHDmjBHE2vMEbRnL0nn+Z27gP7R5WuW+5+4eLSMFWL1AkVXeJxwj51
	 wilr5wf5VeOs6zKjqPgThn9hQmH4g0S/D/tv/Q85r9xGa8dp1eHKBUtuypqAnP1xM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
	b=RblmZ2KLz/1JBOE4bXE6ZFQ0wf9Tz9WkmNIqvlSc/Otfzww5MtXCKJQRZwA6wh59lGh0
	 KotpmamaGq6bBwya8J01u1RXa1qyht6ixx+BVUfypR7UkKfiGDO+5hPPd5giESqCex3TQ
	 oYZbI4yyGs0zymPaDLkLVGtv7dCUoA2uXO3UvU67Sdm58Yg4a6HeA6sNnpALF89uF5IUl
	 3NFLnj64rNZYl0mtYtvtOyTD5xnUmSQ37xQLvhhD61pvCTU//I2RyeRGOBUF6Lj903Ui/
	 5f/WCtQ4p4gTXGbWoRyXH8vMjd5wBl9Dn7uH0U2G6HJkcE9bYGBUN0iBo/PipwIXqqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAxmM9UV;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982E606D189
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5982E606D189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAxmM9UV
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4919a880834so158270f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530170; x=1795134970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=EAxmM9UVr5xiS0EjOshRHqm2ayrWnv4PiCLsP67q5xGBXcB5fd+GXWiazf20EVgGYa
         Ht0TaImHEWIWoStmYdtD4MeeTDwKEJpEMjeGAmVOahXi9jU1yEqmNz55AE6JyjwOXvSW
         SYiE21tU0E+80N7/XK6oi0vN9HujuOLq4vhDcHmpup+n5kBwOFe65e+9AqW3cxdVXFW6
         lBWJD5r3EqB8ZfaY+XGNolHNt/+PgFBcYppc5QB0fT3p/35lwdwhcH7qo3s2ZaPG6MII
         CKXcBVBBRHAMHE70ZtyI84hUq4xyJ85OFpHYeydVEfaX8qJmQu0ZNV3WR9alL1z4JVcw
         KSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530170; x=1795134970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=XKWymMZkuQuXATdppG7MvVZJjWtkq1/tNSg944uifNFZP5SbDX39Y7+oJUf265uom7
         f5BaUqlJQ55Vi6XWeAcUBbK2Ord+uSVLMZszDPqQjRQZaQ1zIFvYX/kCqaGstgz+NUq+
         SQfPQL5lVPznttMG6L+ykEDa8oNl8AKoKUGH6SaLZAc4BFaS+eb5G/+h5WDQlnl4YUla
         bQLxArZK7Eo3N2OQyYJe/Tldv5B3XD/dgQvRo4C42xlVD+xL3DgAfTTLluDqzbyFg1tT
         gy21lCMrba6QnfE5oJyF1ds4P0/+1lt9T1x9iddacV5UvpRt4Bu9cjhHTZTZTwlKkudr
         2kkg==
X-Forwarded-Encrypted: i=1; AL+hErG+1mHJ8l5ouDpIN9IGgmg9R05gdkm5KFG9lGGF50VJgMlZoYj3PBMctyQxOy4nd1svtow+S0zdWaGSmfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Gi+NvZJDNc3GBx4gptVbYIdQ77QNmwl96bgDA2N+lGFVwsAf
	fMU9xfq/DfWl/lQXHdkzkkCk4M+X2mqn7F06MiKIcl7L93pjRg3Hr9ZS
X-Gm-Gg: AYBFou3U1I3/U+BrhQtvhtUru63fdSVtXB+If94EtxZ6HUO/mYYF/LX5aVY6dhxrgJm
	qqC+lYzS4H54+9U0v2ixkUjGIJMbPTREE5hEScR4en1DOESCKvILuYgWZwAd/7KuCoc+DPi0sdn
	A0EWaofcyKihQg1A1mPJYZZCSd0R/kliHiNlt4wOrREQF0IyFiYAfwiez/cIk1Iqp8piuQkkBT4
	AmtODUjvBej5X6xjh85vsFh7BRapx3BFivPnuiS9efPsMkAQb03010ypmou6O/phM5n0hMGu0jz
	nrzTPl64rTKpuW+JsiHscp735o4MXqH2OHXNy4FxmVJbiBKgqlsIDuZ3fxZ1VMsJnbX++JiVT6a
	Nen010lPEKz5EWGxA8DYhG4OVLwfDWFI3Wr2H4iiq0xjn96b3DlFQhYBAaXRS48VY4954abeFP2
	Llp3zaKTZm5wt3TvDiteZVMlwbWW3BEp/u8xWWJcTmyXldeESpdSubh5XqdZKpX+9oDsLGaXUXz
	FuvQVoPI+M3R7pLLBfghtPdl+MBuHiBz3TSEUiEQw5A7KWE6PrtAShSZqauwJyrxGOEFudBvPCv
	ifWJ3/fMs3T/PVjIwg8HwISkcZrB6OnFU3I69ev4Tfg5uNV9NzLeCcdmXW8LzywGSYPXXcJz243
	WrVnxtXvO11xbufNS+JeifwqN2rLfZLHHTvr19248Ac57v30UmWJkpr7dUE/cd1iOzer/1p1JEo
	s0gVlcAbnKBEApc36g
X-Received: by 2002:a05:6000:4381:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-49c72c9c75emr2405809f8f.50.1794530169802;
        Thu, 12 Nov 2026 16:36:09 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm1918847f8f.46.2026.11.12.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:08 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Fri, 13 Nov 2026 00:36:07 +0000
Message-ID: <20261113003607.3662439-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-14-ghahramani.navid@gmail.com> <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> If this is a clock control it would be better to write a clock driver that
> manages the crm2 region and exposes a proper clock handle.

That is done since v2. crm2 has its own clock and reset provider and
the PCIe driver uses the clock and reset handles.

> For the phy parts that are part of topcrm: drivers/phy has PCIe PHY drivers.

The PHY setup moved into a PHY driver with #phy-cells on topcrm, so the
PCIe driver doesn't write topcrm registers anymore.

> By and large the zx279128s_pcie_init_crm has a bad code smell: It looks like
> an LLM translation of ZTE's code to me without understanding what the
> registers actually do.

That is fair. There is no public register documentation for this SoC,
so that function followed ZTE's code, and I got part of it wrong.
Agustin found that two of the writes went to the wrong block and had no
effect, see the v2 11/24 thread. For several of the PHY writes I only
have ZTE's values and no explanation yet. I will try to work them out
before the PCIe series, and the patch will say which values are just
copied from ZTE.

Best regards,
Navid
