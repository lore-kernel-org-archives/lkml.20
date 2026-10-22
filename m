Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661894;
	b=CfRZTfhymInVK4x/oBtIuyPm4mcuX6FJ52X3+6LX/BVHoC8YhTHAgCzfUmUzEviIVBuk
	 wpsO+rhSvEltp8EFDblIuoVdk9ybirjPbv9R/9Ho0aiLMKZ5cnnfUMLHSQnu2IVCNaRwF
	 FZK5NpzoSzdbY5vvaPhZQKR3aB8nNS7O7qbNOhDzR4QHY1+D5Yl21RnjNdo2eIq6qNbNW
	 qqqbc25HE7x0NvaPUH0l56jTs2GkkbuvHNrxSYNvilkRL+E8HLUwoDERKmZHc8VZXcDFo
	 JQ3XGC69m/++a5MjWErCJTHPS2LYO+sIkHwjjX4Qzcum70PYUEoUWGu+k+zAvQnaz1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
	b=I5gOH/5wetB8vEyEVLIilHL+iCUBhe8nbOl011r5TEeoyeVzO8C/lpzgo3q0hsiN15Bd
	 HdmlfzC5PY9gvbonk8xYOGmHpXOj5znOalcqbrvH7TRky6cxoNx57gc9ZOu0AtBBHo4m9
	 xVezjgN/UEw0p2GwIWyECdc/PrR3ae0C1+ff53nFIXBp0EWDvuW7AP45fMbkrZWAr8WAQ
	 Vyt3x8XZPhSKqPvGtSmIZYkJRYr5vUREqxrHcsGZTCmwEMEsEl3Id3C9W3/67N4vtuojh
	 NHkK8u0GiC4nlqyQSVFldAPat8eKMxWpq3sUkCu7Du7Ph28R8F89qkT8RAF0dRNahtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dKU/AE2X";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85468606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85468606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKU/AE2X
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e30c26a4so105103266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661893; x=1793266693; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=dKU/AE2XlsC7GcWUGeGpQLt0ZDOploOIt9TkwpjyXXpNkXM66tiQQU3PdJQ6YC4eqC
         7hu3ePU433r6xt92ffRnYkgKDbvLPW7yu6du2EQp6Wjv/TwNni+cuHZCwDBi/nVtnaNy
         OTRLqzaVMETwbad+9Xmd1SPzaCyJpTnX8pbq0Rea/YPDrSA2YuojfiPoPqmwzh+lzLxG
         TNllcY2VYwQBqP6vP/Cxuky9Ab2VmodQpf29JEJNNkpTOqasJ6MzHFIjxne4Wd0/YO5U
         liYC4YzUiTebLacLHzw/aKKl0vJ9JhrpSQSV6JysLowoxESrymrjH7h0JXj5c4uJQFZB
         99kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661893; x=1793266693;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzwu7Mo7blUPO2g2psRpJeiXJWtUOEqjjPI2Ak0wJ68=;
        b=xnQUXFTPoUYJ3+kEfsOg4LyUPPLaoMXskplnluP4wXLeeys4LTFb3cBvRThsy5r6LS
         yiAe4byfMfXHs6Vq9N38G5OkFwjB3k1VG5Z7Fr8FdhNemwV2dH12lTNPoZ+TH4eIm+mh
         voJ68bcV4CowiVTBQAolUsLbCanTnjKhkPXv6kzjOVzzY9BHh2s1JChKxc1AmJyAbGXF
         JH+b7hMtCuWD1sMU09lXV7PXi26K9PBw5F8d80c60FCiMzKW9ZFtzoek2ZcWwRDofwqM
         jI8dkb99IO1ankRx+tO0jwL35JPcDutu10QlUfmR8IzpDaHnM39mZX2UdG4DDOQLQTZ0
         Sblg==
X-Forwarded-Encrypted: i=1; AKwUvByWOMxAEDOw1D+Xla19i21Vo4OQegccXr4S3PldJ1pnS6UTNZF6R6JwPRcYXc239ktNXDJNMIDsLJn5yas=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeZBdZ8U3Of50zPVK0J970lNfvdDP5L2u9eTcUIK+n0Kwpikm8
	duW+erzubGjTPzb34x1zzCU2/ooWwcZH7cRgz7toou4yDlXCYUc/9m4J
X-Gm-Gg: AYBFou35WEcK399+AwcfKsZylzfQSK5nxqUqugOeFWfsoir72PWiUinB0Na4wi5FHXk
	FkzOt1BmPTGhzuQ9bOdbT40dnnRJf8f319zoMbE9i6cnljBfBqcV06faBp+mM7V2Jmv/W8FZKU2
	hsxIlruGdUnrJmnsxMG3EMXHfH/Jy9pwQ5uPhh9YFh9rjE4g35n46NbLgnKYEbSkboWo3v9lsLZ
	4sA09GU2vRwxaEcrRy5X/fGhRA2uAoP8CZ9/4vM2pt5jWPluXxcRJfHB+QnA4fl4NPaU4uDEzBF
	oC3P+S/DylbcWk1iVfj6kV6tZrEvFwjH+jPeQZSy/G9nQePmH4hJB0K675fFwjNXmLvJCdGQmcR
	3XoQ8qfzmQ6m4p7ET3x6tlPEEUdA4+kj0d16c7M6PbKGpQ/6ynWPBAELHJKItBOhCGvFRTH0VEQ
	B2TPu9NMi1EuWCqCamC48SJoh+YTpAi8OUTAkxza3PhS94l8kQ9Psh3fSS1ts3lL42hEF3FacrX
	UXdhKM3781v1uDek62f4bIC+Q8BU2rxxhgnxMYld2IXVja80xSBKdCfGkb0F2OWTaU=
X-Received: by 2002:a17:907:d18:b0:c2e:616b:6763 with SMTP id a640c23a62f3a-c468d5d92b9mr198921066b.3.1792661892804;
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
Received: from hp-omen-16.localnet ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm87755766b.32.2026.10.22.02.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:38:12 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
Subject:
 Re: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document reset-gpios
 property
Date: Thu, 22 Oct 2026 14:38:07 +0500
Message-ID: <W90ai6epRoWrikRmhqTrfA@gmail.com>
In-Reply-To: <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
References:
 <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
 <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
 <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 19 October 2026 11:49:17 +05 Krzysztof Kozlowski wrote:
> That's the same pin. This was sent multiple times, why is this time
> different?

Indeed I overlooked previous discussion on the same change. Thank you.
I did a few more tests with the wwan modem. And since this approach to
handle modem reset more like a workaround, I'll just drop this patch
with rfkill node from V3.

-- 
Dmt-Y



