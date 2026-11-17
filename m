Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904185;
	b=2lcLCeDyZb0CivlPAg7DQFamAuZMLJu9+Tpg283JKVY+dZml0wCeJdX3HG0hTGgbMEGN
	 t/r9Z7XrIeJdLCG7jSSlzEjn3aVRn+JNTwxmLdDQ0WtTkMPIVEbHrZ5Q4XwzXLPLkaXrn
	 R4unPsC1GqupZdaz3uPbu67d1NvITb2Wu96T74ob+Va3ZQRS6oV6wYVDnQOnZgsVHPgeH
	 70ZtqfICCeHOuDHLBSaciX5GIh3hbV+FFS089EooQAmMxa44wjzTFI1MA0CC1FC5jZIs5
	 +spajpWrJOAmrYhg1cYO3M0CAlFK57RtgCJzxV6mIwFpWsMUfX+9jszYkyDIfmloTXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904185;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oFYnf9rWIV7nuvHktcNWchTcAeise6OHwBzCHmWfzfU=;
	b=tw46KUWVN//3P9tI8GL8UJlfRIDF7qxkVNr8Z36wb9ROQ0jSb+awiUxrLhO2Wa2nTK2x
	 1g9DQmYBsT8Cc5C25mCD7Rxs1JDvgstJlUv32h8lFygNMolc6PT6OXhKnC0AtPIy5lifd
	 v8Gfmb60akjWfEU3Uh4HvgjzwDHIEVhAi2ZDhS38gHyK4QOWMKucX90iJTBLzyDVpEKXl
	 wEDJm7LnelA2tYku2cjn0Fsl1ppwJOF02iWFW0uBUj1JKOf+B5J5LvAeQaknJHHzEOFMl
	 fsIkvc6RmkKm2Wn1hQkQciEJWsLTbZY6DecoT2IXes5vlkVfaU0AofmcvBCy2sFFZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTi2Jgpn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4646A606A8A1;
	Tue, 17 Nov 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTi2Jgpn
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EE77E1F000C5;
	Tue, 17 Nov 2026 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904184;
	bh=oFYnf9rWIV7nuvHktcNWchTcAeise6OHwBzCHmWfzfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTi2JgpnWkMwq1Ej1zvMX6FGEqdcxEbaXzeTou9sYU552qluNjXrbIMBhK/eRy6OJ
	 27kHuK/F2HaMRFvN8LIb0awh0Fmhpyv2L47ra1TU1DqRe1Xx6r87KqisKItLG2tlsB
	 5U+Xb+EoOgMO/Uj8dF4ALfEdFE3uufnsJjZwNxMfsfg/ehBrx1UT4bOS2qR8XIl6O2
	 t2BB+qd8EQJ2tjlNhkZxjd1dli358kuUGBvGGQmKGAT8RlDtvcjKj5lr2zusADq9Jb
	 mjHPMpAKBGZSiiSSdbP4z9tAzejFS5hCTFz5WLajLqtrJgg3FCz0iW+wrondcDCJzv
	 3RSY+FUxb8ffg==
Date: Tue, 17 Nov 2026 09:29:40 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] soc: qcom: socinfo: Fix SA8797P and add IQ10800MD
 SoC IDs
Message-ID: <osbkd43sxblbz2jk76oosfqlw7qxb6w6fzxflw7cwa7ibmmtat@xkji4brv6nxj>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>

On Sat, Nov 14, 2026 at 09:33:00PM +0800, Shawn Guo wrote:
> The Qualcomm Nord (NordAU) SoC ships in several SKUs, each reporting
> its own SoC ID through SMEM:
> 
>   - SA8797P    648  default chip info variant of the family
>   - QAM8x97P   690  Snapdragon Ride modules (QAM8797P/QAM8397P)
>   - IQ10800MD  798  Dragonwing Robotics module, e.g. on IQ10 RRD
> 
> SoC ID 690 was added as SA8797P, but that ID actually belongs to the
> QAM8797P/QAM8397P modules, while SA8797P is 648. As a result, boards
> with these modules report a misleading "SA8797P" as machine in
> /sys/devices/soc0.
> 
> Patches 1-2 correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P
> for 690. As 690 is shared by QAM8797P and QAM8397P, socinfo names it
> "QAM8x97P" to cover both. Note this changes the value of an existing
> dt-bindings define; the socinfo driver is its only in-tree user.
> 

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
