Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38A47141B;
	Sat,  5 Sep 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788606642; cv=none; b=Q9hEemExEQw2PflLEQ1kIhBT9Gri9mkoZqsSf0A3ATwx0RLDubhw6qQSOyzMjyZpSFCkGEO7U+VPNVS62TGdxwwYouozOU7WjEyEi49k3aEo8tomVwTbX/r08RdnAc9ZqWYoWW/o/IOiorJqCnItUSOCT9AjtydeyyNJQA5rJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788606642; c=relaxed/simple;
	bh=KzRJhxRTrvqAiaVJVaqWQkWGZ+54F/AZGCB29WQ/d6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed2d0eyeduGiktam7uWb8ZdCjQW/vRVj8atl2yeCMqcTm2KU1OGW3bYYGTho0t2oZnJ/f7ckSr6mU+5yYIvo3NmDGlOi3ynr5+JR5UQ57ZzA8/2DRj7kWnsrppdAZ8XeSab/oTqH3V0BdcPv/i/rUoKvYsz9IuJgVcSQQ2PfTNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w9fdaBoF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w9fdaBoF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3AED4E41535;
	Sat,  5 Sep 2026 11:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E9B860233;
	Sat,  5 Sep 2026 11:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E49B11C79AE2;
	Sat,  5 Sep 2026 13:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788606625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2G74mMDoSzWYSciLrgMYcbatz2kFir3mltJmFJtTQBo=;
	b=w9fdaBoFJ6QLGxqG5SMb5jirUnc9KTDT6DGlJ4PpYqKfXBT/vhFNDW0RcspOWd0qzs6CG9
	Qy13+SDsWyvPJrCG4zJGGHT21oWhqpIjvnrdqCGphIBmEmzfTF/s9eJauV3hjsH9MH90TH
	xCpPntoKE1KOq5bMXJp2EGRoOCxgNzMDFZx92IrKP61l9NNQ8HT/pYOhrbhFZ5BcqopEEe
	xrDwQvGlTxrD864jvGDdBnrZ2G3S+/oP9ODLMVSuaUyk+T3g3cQmSyppu7JYyydq12+Yh0
	1meMNaurUlmkWyu3KzHmMGpBfrX4YX5TU5g/1xkN0qPLFGMFiN0+G/x/zoVZUg==
Message-ID: <ce07b2ab-60b8-44d1-9d72-23c6b6a85250@bootlin.com>
Date: Sat, 5 Sep 2026 13:10:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
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
 <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 9/3/26 20:43, Mohd Ayaan Anwar wrote:
> The return value is never checked by its sole caller and the speed
> validation duplicates a check higher up the call stack.  Convert to
> void and remove the dead code.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

