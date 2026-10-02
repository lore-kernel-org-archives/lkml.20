Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394394334AD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929934; cv=none; b=MiMCeWPcIOkTne111jgLMf1UMWBjF1xDDuGLAYnp/SlP+HPbYb50uAc/LlxZ1iayfLCCsuBQ2aoDGrUBvEr+ldDO+7q3Qb/hwJ7yb/VLalnalDLZOTcY6Y0PtGd5xLb4UXbsy1Wid/uremrB7edTMmi3I85ZLQkAtfUtAiMDJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929934; c=relaxed/simple;
	bh=BMOQwjuoegDgdBRrw6ftVN3h4UxWkKJmf0XXGY1DkVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKmf4fd25HQmBIEZczDO0z0UUVKpxDx4WrpjQevdiZU0Biu3Jpx+0EFZLS3GPT1kx8JclKK/yUCd4eJ/zrcaBm+uw990C4YwGREDrkHNrosqlyCyujW7IY/EMlRRSQ7rvIJSTuVuEKP7qHayKG+llmrnENUPkYDPurGBKMmK0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxO5e3mO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxO5e3mO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so42198625e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929931; x=1791534731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=qxO5e3mOr1P3iGdwB8Qrek0EMX5JcYwtcqeIBeRqI2h1BghZKRqHBPAGmmX+eMLiQm
         oM2/Rf16TRn9Xfuze9en2m+zE1auuG+KaTYutONxSct67hXlpR+Ec9D6cKpyCLWCbd9N
         1LQ1AZtG8VSplR7TUJ5fVQPwwAd6dSBQJWpWQvbeg1AYlZ6Ooyj8WRpLjMztGn1eXd0m
         gkma2H60MB85G4nyUtTlyFY7qMCP2tzH4YYDXMi/w5uADJypzM/QiDAJyM2fVyDri2aK
         snhT5GbNc1BPx4/3UZ6gJ3DrUL7YpcZHU8ge1oomcsjQXN0n0a37hWBKZBL7gynRR5Xo
         KFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929931; x=1791534731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=fHKhkw/i2G2rNu2aAv3X7DOIyFdJsWWnt3ftJFs7hEGxl9emjQVWEt6HcG25+EapTd
         jyU1Raj2MmcXyPJk+EQW9I/+58EgpnnKtd1o6kWlxRaIcZCRZvEnpTwRaXHh/HbuD1ia
         iN0JL/NGDgT7a5s5kiRJ74m6Zfk/lxTIETRIkyLQJxQghEU3ya0BgWgwroV13dmcKA14
         tDW9E1FoRJnANSb8VF/y0Otf4LZkzmrZN/lb+OtDHNYXzLAjzN7g7upKVwwFik0D0d/d
         48/zGw7E6bMW7BZRSEcg6eoSfU2VWqAoVKqjO7MK6P71+3itWJTLQmCiogFp/vyCQGFe
         HojA==
X-Forwarded-Encrypted: i=1; AKwUvByDOhGFzUZohSc10VqcYqecdgpHW/lIS5mWX/IffgO3BCFTji2ZpUFhyYzw9YEBf0LZHpG2vAuk/n9Kq9k=@vger.kernel.org
X-Gm-Message-State: AFuF++ntdIpRUo/h7pC2djEBOZ5Y0WZdr1351U9BefWn30EnxQSNzlNj
	JQEJbmK84WQld+z6ngRLhftWuAxyHs3zpF/41afoYRARsXyUcvqTso7O
X-Gm-Gg: AYBFou1BKlw+2bB1l8yy9CZ+i41XpEh8ZvoLVqQ3y7XIecZhjguJIx8AS8+MwBkCSxw
	3coyPWbw7NCfo5lyypFDB2q/rrky0CQFDgGHhJkQ+QeWrZFATEibkM2vmtrjLAg8hgf3KRz+ckq
	lEZjUcrpbki1hp8HH92F+5BmsMNytDD/14OFaf0K/ErRuk9q7gmnPWgFat/IHaD3zFWZoycS+aR
	k/T89TrRWvaShXH6+Zs7kUUO1Tbboxhsu8MrJeR8XLyNDZCRd/4B/S5c9IaroRoBCI3zE967P86
	5w6zJjJL/JDBLWcNDH2KPNNCowe0K5HO7+yPgha8MxTNYfX/Z6HMH6CLjP8UekTFfiUQbPwjtYK
	VB8TdkHCMfSIarPRYtEjjzN82QVYh3DpRVEVLENun/kjb0/VCSfVC79L4kryeo38/QweRQ1tGig
	wNDgB1ioPpmLe++5r/pA2vgG2sW7Ho23EBHnqGWxImtHZKMvAbqUnaAbH9XJG51ck7COeemjCV9
	MkILTQYsX2Hms08Em+L/r1+tZhg2i0pLHlUgtqmIhfcO7FLuZthSXbkCeSB+VdxeYsWsBYg0Q==
X-Received: by 2002:a05:600c:2391:b0:4a0:21b9:a55c with SMTP id 5b1f17b1804b1-4a0276a0f7cmr24840835e9.29.1790929930373;
        Fri, 02 Oct 2026 01:32:10 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm67567425e9.0.2026.10.02.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:32:08 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add
 Cortex-M7 remoteproc
Message-ID: <ew2g6ra2f7l35e56a3cslv53edmljlxm6d6rflakf2meftmjnz@ig6q45jlf6ms>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
 <ar5sBB5VvZPJVrmt@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5sBB5VvZPJVrmt@SMW015318>

On Thu, Oct 01, 2026 at 09:19:48AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 01:44:09PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Describe the Cortex-M7 remote processor available on the Verdin iMX8M
> > Plus SoM.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> 
> This indepedent part. suggest send as sperated patch. This time, I can pick
> this one firstly.
> 
> Frank
> 

Hi Frank,

Okay, I will send a separate series for this part with the needed edits.

Ernest

