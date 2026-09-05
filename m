Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED53C141A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607307; cv=none; b=pJI+XzOrGctzUEIEGiIfdhG4fHVWFT10jRVaQ6p6BJDYQzlv/k81cpwv/4WqhWXilUKSIq9qxhsfuHUUE4Gb7ogO0oMwb1qMRunXtTPbH9oifYq4WCVwIOgxa2Mvyj2V9vEoRocnuTUZfchojvIl2Ou1LmBDlRBhh8GDc0zA5x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607307; c=relaxed/simple;
	bh=ma6bS58FfCrfwdM8DYJ2sps8OuXCTGmCG8RQ3Wn0mOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CefzPcaTrOVAhI6679uYxUDAmVNpT5xZPNNGFQDulQEmeCvb9ST2UtuxlhGIXbimRsNYNuUF8GsXFvy2hJMSQAejzcBjtKGd3bIAPKjg8xVWodwV1fKARiLl4xOrX0+/GrCYfw3UsK740qL0DRgWXWm0sNI5s/1TUGuoIgaV068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p3MATlEg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3MATlEg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76BE01A19CA;
	Sat,  5 Sep 2026 11:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39BB960233;
	Sat,  5 Sep 2026 11:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42EA711C783E9;
	Sat,  5 Sep 2026 13:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788607296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FhTjWhvBY3J0Dewu042nmXY6DyK5b1tOm9obfDRLZyk=;
	b=p3MATlEg/66zDHa22f3ifAmjMncnfKTK4roVoSVT9HLjcgdhTou+zP1J08g7iQ3L4i3NHF
	/O1JGSToy6cOG9JGgS+Ohuhg3ZljinKmyCCUByLouMA275qUVx++CEThKYszMSpLLK05Tw
	xqxstb8mElV5xCn/6u0RV5Yy9efLrsJPeKQyqbLt6M62VemFqH5z6n9RiP3QPub/QfLn8F
	pTN0R0csEWQhLL/6ydW1daxfalqBrdJLJQ6XKqMFb+rzGa+qIx24RbMwJuFwbXRpGCA0LB
	Jxu8T0r6LifhGm/dnw23SQWHe+MceGjV2l1n5SuZdumY665EyC8r1sFec1ejmA==
Message-ID: <a48ec7e7-a2cc-4bb9-96de-69ebae5ba184@bootlin.com>
Date: Sat, 5 Sep 2026 13:21:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 9/3/26 20:43, Mohd Ayaan Anwar wrote:
> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
> 
> Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
> a link is established.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

