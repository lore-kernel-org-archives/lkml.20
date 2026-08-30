Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F83B9D98;
	Sun, 30 Aug 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104798; cv=none; b=s/QuWTEo5veFlBVWWOWpxFF1PXsPuVCNhUc8VX6wXnxeYkUkX+S7AAY6FUWDihElR6yjs/RElSxkZcCgS7GnDI7517WK07cKi0KrBRDuMTxVfpPjxmbbxaQscPj6tp73NEdb0iDZfiG6RMUW45807JVmXV0Y5sCSCpMvs77vKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104798; c=relaxed/simple;
	bh=PnXdbbonI6TDVucUJnB/aGVbLdU6d3iGG+sX+Bz32RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKJn8aVh+lXmc4nxrqueoM3RJyZjY2xaitSUO8gCM6GdBqwntElzI8EXNzzu3eGnMxhIDezKvEzUx+a88bUFqabZTdtTsUNt6SaIceUu6ocBV508k4NBxSRDsEfZnOZieL8YAQ2LdwtA1CFEau4l6k+E3sAO0oakBoRwSTXRx50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Awu3naLG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PEP181CD; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Awu3naLG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PEP181CD"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id B7088EC0175;
	Sun, 30 Aug 2026 11:46:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 30 Aug 2026 11:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1788104795; x=1788191195; bh=MihlHA0jeW
	9cf62qZZuSDAm/xr/Skg1GoMpPWPUioZI=; b=Awu3naLGhxs6DNzMVZ/y5uVxuH
	mo/jt2sQdf3xqebztoCcdDi5HxuDDLpYAVqXvFpDlTV9+CuQ88IhpOugj2RyspWZ
	GdDQnJDxwIoA7eNsTbqlN1B6ULQXmXJe+7BLq1T0jEy77YvwL9LBSOw+G5R6isaH
	Tr29zTOKWoZuz8JQt28Kb/cldynUfVOcea7v8Jr8mrFqWyb1xX50jPgKpKEwdxda
	bYCb6S34iEAZzs21zqcOSPPsvCIRqUGUzq5zHZbLUfGzK6l3k6r+SHka9LI39LCn
	BKAJKVrUH5deSkwRD6PbBoDHBTF3vPACB2G+nW3DNiXeKYoi6mJGVLT8rKzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788104795; x=1788191195; bh=MihlHA0jeW9cf62qZZuSDAm/xr/Skg1GoMp
	PWPUioZI=; b=PEP181CDMaZody9j/uydol4/X0uG5oOkaaioYRRHeWHZdhdH9+8
	RiMROxs8/62QJuhZWbQYLcUS0SguOemsam5DmsT9fMZPBhxxHbj5uIsW0SuonDgh
	3nN/xmaL3NLaDsUd8h7XErNNrGM7QGjCfwNigfTXL1TjCxGnmSUH68pemkDybSnE
	lcgNEWhmKcL3ilv/yN9dTGY/iPE63DRjotYoYF54E96e2MOZAjMQ5Gnf9kG+o6yo
	/FFnvDHv15dR62IUnh1+sBY8dwz5XsfSAEzcSFvH+ebFVQyq5QRsWBUDBz62Ho2C
	aZW/+t9/k/ursxa3I3sZUA29vQ/6hJsu2Zg==
X-ME-Sender: <xms:W1CUanVfhvurg80lEyKTCNvzbdgjSzZuSERAXBL6bg6ID9Iz1lOk6w>
    <xme:W1CUasKpob-wfo0jHe9491cCn5uVeFtmi1QcRXike50lCIc8AlpTiMFdE0PIvOtfz
    N0E9wi5fv42IEzYerCFvIryHrSrL5mJaJwSEyd3MCiNXES8NsGhUQ>
X-ME-Received: <xmr:W1CUan3M1wR4M9LP_CwTz7lmuBIHqQuJbUh9DiivOPBfNkrsdBiApwJdrw018Sm3xVEBlBk6slD1txVuXx8o0voDOAhYQpMm6pU>
X-ME-Proxy-Cause: dmFkZTEOYRK4gF0nS1OU3xem0WZp15SpUOTtBPG0aPfGupIuYPdkf//EB6U20QS5qwMibE
    5xh3VNHbQsPBXG/WzMft+EW7AUnukz/ERkxvkIAczmn9Y258jeSCGpTxCNUvven2Kxx+JU
    /eR5GnwCNq0xJCKmedT8YmYPRbtXx3vF1jmbPtdcFR+QipxXHZFc+keCuudFGmpoJGX419
    KKmLoe2RuisnuCQSErHe+aeQOdLg5w4+3PhUCUQnbPTriE4Iq08GroO9iA1cgQG3zNcKSc
    6T8v6Sl4d+5howPOj81vFOPmvZj+0Ri9+yj0AMYH4nHLVMkfzjXT9oic2CEPTmSTuO38Jg
    CIcfGw2h6zpEfHXQ2eEnHK3ACmSZnxW/uUrwn0KGpBxSgT9BOQtCsPs/+F4julBRH1Yhg5
    BgBRsBn6MLOreK0uviMip8UyEvzMRPLm/6Rljyf4U4ioeH+GSmWMNq4ctEiIz9UB2iiEJb
    irdWJrOxMLhT3JLNhKEqvBSCbFLyL0VOiZtydeV6mIn+iTfgkDfP3+930ZPjHK0TQXlVAu
    49+jOmB8QaUXvPvQH8GvalWLWC0TOV/1i782v4fx618ZU/b0YCEUq5pOfcsvgspG4hw0+N
    JunNhCTJ9JwwqiiLI6nI0+76aSqT4cegUANCcW+1NLD84Z3mygeVK1zp6EQw
X-ME-Proxy: <xmx:W1CUapJgSwv0S6NbiF_dhTq3QJtGAxrpy4i6GS_92UfcfiTT1BH_wg>
    <xmx:W1CUaigikYbJQFZdKjtXuXqHfi48-Tu5EAup5DhsjGSitVDLb1C_fg>
    <xmx:W1CUapDyXbY2XedCU43bJkXxIfk0pk4nVrJz4s07y4ZXSCzwdDMZ1w>
    <xmx:W1CUak4Qbh6ZdJSZIYIqKUS_v_YU-Ja0Y6Fs8XmdwegztRE6M9X__Q>
    <xmx:W1CUaoxI285qFTACu9dfBQhKSnolp32zwxlAVlogOEgibArVn9zzgcbx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 11:46:34 -0400 (EDT)
Date: Sun, 30 Aug 2026 17:46:33 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: apple: Fix cpus node indentation
Message-ID: <20260830154633.GA1748618@robin.jannau.net>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>

On Sun, Aug 30, 2026 at 04:22:06PM +0200, Sven Peter wrote:
> Hi,
> 
> Just a small series to drop a spurious space in our dts file. No
> functional changes.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (3):
>       arm64: dts: apple: t602x: Fix cpus node indentation
>       arm64: dts: apple: t6030: Fix cpus node indentation
>       arm64: dts: apple: t6032: Fix cpus node indentation
> 
>  arch/arm64/boot/dts/apple/t602x-common.dtsi | 2 +-
>  arch/arm64/boot/dts/apple/t6030.dtsi        | 2 +-
>  arch/arm64/boot/dts/apple/t6032.dtsi        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

whole series

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
