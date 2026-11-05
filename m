Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858035;
	b=WIjOO668kU0Y+1E2hoRgtx4P5TkcHw1nk3NXx212GkhUVhNlAaMRQoh96wkEuNOu+PBT
	 H3LQ1N/iRbDzIm9cI871Y0yLsIXf4Dj230WD+a8GriTdu6bS+WC8h3RQOUog852ojdejP
	 OmlQclJlZA9H8D/E0MD6aY2IgemJwMX0xxK7ENH5vODd04j5XXp/hF4KnFB/xIy/8WJSY
	 heRIVFXaFn5evxOkqxnkBBEi4r7OqC9ih2ppLZNqAPdS5u0xJhrriD9f/Hx0h1SRXN99a
	 VD5BmaGJOvlSmKPE6oGTS2cOkXKdjbM0eyTyc+waZ0ENrnLfy1/QJhuSbI7ALdfmJqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
	b=uFYIFj9lAwJAYBYJstrE9i+1JqYos5NBQbrP2/zzMBkeZphNebX3eDwN4qYMbySn154r
	 1nq8P/ScrtxFNcbQ8+uE1o8cwXfHltYrHA+ayMaUWWWFwwGbj+MUw83uBAALj3zdTGB3u
	 gUojv98oVPoC3n5nd8Jote6ERnSuzfF1izDlQReP4Rb9ShRdd8Ks3hRZQJvIR0IpEtyG2
	 pGiubBDx/at/57CeTV807A/IvJX5uwWaPaPxvSOA0h/IX+zm9DkTnfKkDxLwRKfiQimjQ
	 sahCEr9OFHy2qS/ibf5vn8DBHOYcJcp7yj/hhovccZIvTSrwOfNHGvU6WbXJznD12cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWtEO7kP;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E6E606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E6E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWtEO7kP
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1044503a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793858034; x=1794462834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=uWtEO7kPbQwyLbeKx3WLFl/Pb+ogG4nPrB4bl7Ex5y0v3lZAgUnyRii+1xiSyFGLIf
         wa5nEo2rQf0TC/A2rsToWG8msA+dWD449sNcAPENrxLbbcuuiSc9y1n1e4Kjm/8zBUVb
         gxcJqidzZp6FzQNdePsgcU/udo+1YyDvocc1lluwY4p6b5Tm74mPMw/C/zrxBTanMy3B
         mhTwMnEw0d81nCSrBwxFUK2KlDr1VUk7ylaQEBskClVlSDY05eqxhdPTDPtu2uxd2lhr
         whRDWrGvqk16DM+0YjJldmrK3TRxxRlg1alNLmD5zTo4AQ98ppxgPXLpCZmtHK7yQOQ7
         S5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858034; x=1794462834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=MoKjPBsQ6tRXH0OuqQfm5LJJvc8SRGbpZDEFItoGUZkwGAcWZufC+q2VGaj4EdqlZ+
         T6xPR4p8bVjBIyG5qGvalLY3PN22lORKpjeiroMDY1ro5e8D6StJJW08nKitM5AaOsY7
         4iH6mUFmnO+1c0HDmJh4iddMlOj7iYmJbSdr2rdrXL6249+dUJ7A2xNveFkgeIsBjMWR
         numqSK7eGTjTHC+3k325IbMSJNK7vsr/2H0Ru4DlQJUjwuuViarBymDmUsz37GErZfzI
         +5dzPj4vDKVxUnAa+NU+JaJwVMULPLGWcPYvuaFNWpzTPPxT8xtZd6CoYg31txCYGpqJ
         JuXA==
X-Forwarded-Encrypted: i=1; AKwUvBzfEtfbhYF2JRwjMogdpSNCi+V0EGSsawzvrlzXFHSGDzUC54hdNnMmAr97Sx8TJvJ83gF50TJW2E2Lmac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6e9YxDxn6vc5/AZXGVP1diWXuXedpaGKWixoUGKRmy9LXPI8p
	ZXFXYeYl+vuJXO1StI674TGcqnJnKKzwQ/PAc6J1wIrgh9WBicSJO606
X-Gm-Gg: AYBFou2ED9b6VIT+0YlWe79vR8OWhGfeXMOSpz2DWD3mo7HtaVeAiclpTiW8D4AzBFb
	uJO0BjQoDLmOBWg86qNf89FXY65l0sHjMRO3tOEaM/m4I0Kxcu2428JrdS54T67Cfu7nRtyB5O5
	X/D/sHaysNsr4LcXb0DpyM2HIIWKfYj9ADshdo7MN1a8nf2eSPJrq2G4ajsfjK122AS0HaNPixw
	X35lhYnyH0rJf+8wq829B8p0ShOAvns9qgMmds0NLlz/C2/EfRVJ0yvwjvPsjqBqN7szM3ujhXn
	AAhvivJ3wTR6NvwJi68211DlyCI4P+zF/KCz4RYCJWmsoCY/LoFq/ZVSTOWN2MP5nyA+0kx5B2G
	kO58PFY2ot2wzrT4g5Mx1h+X1pr2eSVB0EMRGWFUZXaBh05X8RnBtdYJxh+n9Dex90kMzwa1sov
	2mAIzPn/6zcelPziXSDy5yWAkCu8glRuKgi7UcQYz/W4oWYo0BXlr5O7ZSkXZuspMTAkuWyPcHS
	cGmwBIRudHLovZRSYuZe1upfI9iFrMIrvrSQ/oUafERayXJbgKtyygWajW7iGoSWKdplJkuikLq
	shFEJ4WQ5/EcwcoEdv4OARc5bbQZu+75S02zl7jyi0vD3Wq3QeEVR9A=
X-Received: by 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr15148293a91.66.1793858033891;
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm2293530a91.1.2026.11.04.21.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com,
	andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Thu,  5 Nov 2026 13:53:47 +0800
Message-Id: <20261105055347.947416-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com> <20261104081302.304667-1-leeonion.muyu@gmail.com> <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
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

Hi Yin,

Sure. Our memory controller MSC is described as a top-level node.
The MPAM register window is mapped independently in the SoC (the
component sits on the DDR egress path rather than being a sub-block
of a memory-controller DT node), so the node is a direct child of
the root:

	ddr_msc: msc@2238000 {
		compatible = "<vendor>,<soc>-ddr-qos",
			     "arm,mpam-memory-controller-msc",
			     "arm,mpam-msc";
		reg = <0x0 0x02238000 0x0 0x1000>;
		arm,not-ready-us = <10>;
	};

The first compatible in the list is for our platform glue; I have
replaced it with a placeholder here since it is not relevant to the
binding discussion.

Notes on the properties, in case they matter for the binding:

- reg: the MPAM register window. Only a subset of the architectural
  register space is implemented, so the size is the truncated window.
- single RIS: the component reports HAS_RIS=0, so there are no
  ris@N child nodes.
- no interrupts: the component has no MPAM ESR block, so there is
  no interrupts property.
- arm,not-ready-us: 10.

The verified probe path: the node matches via "arm,mpam-msc", and
patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
accessible from all CPUs, which is exactly the behavior we need.

One question in return: with the node being a direct child of the
root rather than a child of a memory-controller node, is that a
form the binding should cover? If the binding expects the MSC to
always be a sub-node of a memory controller, we would need the
top-level form to be allowed as well.

Thanks,
Ping Li
