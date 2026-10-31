Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453727;
	b=XzAalbGOMxIANE+ZyoWdXC92sYKa/wdHZsKZ2X0ixgU/TnzmkPiIkcezPXWgx87TJOOM
	 x185Akg44DaqsAlxLRoT23LZoPIRtNoZH8SIFwuH2hoI+Bg2GxdvNcuYLdHgaP5AChKtc
	 e8iCluXagnlX3NbIL1bDUt2rnqRBRccThGJkx12nss+PoFvbAmV7qod/26j70AzCYhsi8
	 WCT/2SKYjgkRp3xPHbedEbyWZ6qznAt1YcvoAVKxD6tF5kDCYSVa2TRC20tsdaS7bHeBY
	 Byx5/XYGxofsjEA34WbDsvqjkut8VqnC9WGI0hl6hdP9/qpatK6SjzPk6KIJDfGaKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453727;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qR0DGjbS3VPeXKtuCsRN8V74OoIEh8cWN9/0vorUk0M=;
	b=bfbMI2xGCkfXvCUgYhkxztkyiYjnuquH+uxeY1ALO1HkJ5fQ2FyQxOaL7zh8hs0ADumI
	 tZ5HaFU9Wh58IC97wvFL3SUL/rVgLXMUEr52UWG4+DKsC0ClnR8E0433J/LBkt0QoUcdw
	 0eJM9td8bVcO+b3/1/dv2smKfAAnzuEhN1OiXnqsFZOpkkeluVmBcGu4gh7uk/mYs6mSv
	 NqZ8ptDmtQXoy8vQIN1DjDEkL8YOSLBG9ONcBR76bl4lgK5jGpstLI8cEf15VX1mmk6uG
	 zyb5MJLNKyaItLGfH6zGUwnpA8UM/m7kPnYlH6kO0wliUz8jcFFAf+qRk61/LXjOCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iOnYndQv;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BA606A31A;
	Sat, 31 Oct 2026 13:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iOnYndQv
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3F3910C1B8;
	Sat, 31 Oct 2026 14:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793453715;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qR0DGjbS3VPeXKtuCsRN8V74OoIEh8cWN9/0vorUk0M=;
	b=iOnYndQv0hHIs5gUv4GuN2dOQ22WQjGrLex9fKcrvEx9FvgzZ+VNX0qtYcTxY8R24V9jJw
	921TFtgmDmHC71Ibrtu3HrPYbAJB9ffKfUGlpV3zmoJoMuc3qfln7jekP7qWeTVLaS99ZH
	nSVNgHKLf1fVDu5UBhDHT9PiCJ4KucP9THD8UIqeMb6c2wPjAELpUJxdlxeivS7CJMHvSO
	5AMuqPgYn8iWBrNYNgbMvmIK9Dca87GbyIGMK3tc63JtCesHG8gtzUINIQqgbZ4xJdthGN
	3+T7455CSkL/84iyB74fih+RDb/hR3dH7C2xgaeSto6cvJJFWZi4+fLVfnLV7w==
Message-ID: <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
Date: Sat, 31 Oct 2026 14:35:11 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: mateusz.nowicki@posteo.net, Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Fabrice GASNIER <fabrice.gasnier@foss.st.com>,
 Stefano Babic <sbabic@nabladev.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
 <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/31/26 1:00 PM, mateusz.nowicki@posteo.net wrote:

Hello Mateusz,

> Marek, would that work for the DHCOS boards? I can send the patch if
> you tell me which of them ship the old OP-TEE. Your OP-TEE change to
> accept both IDs is a good mitigation on top of it for anybody who
> updates the firmware.

I do not think revert of this patch is the right approach here. I also 
do not think patching the arm,smc-id in board DT is the right approach. 
Both of those, because we do not know which SMC ID is the correct one 
(we do not know which firmware is running and how it is configured, see 
the OP-TEE OS CFG_WDT_SM_HANDLER_ID which is user configurable, and as 
far as I can tell, the SMC ID is not discoverable, or is it?).

But maybe there is some way to probe for the correct ARM SMC WDT ID ? (I 
do not think we can infer the ID from e.g. OP-TEE OS version, because of 
the CFG_WDT_SM_HANDLER_ID user configuration).

In case of this SoC, we can mostly assume that the SMC IDs will be one 
of the two, 0xb200005a or 0xbc000000, so maybe we can extend the SMC WDT 
driver to support some sort of fallback -- if the primary SMC ID fails 
as not supported, try the secondary one ?

As for the DHCOS boards, those are evalboards, their bootloader can be 
easily updated, and they are running recent software more often than 
not, there this topic is mostly a non-issue. There is however hardware 
which does have downstream DTs which pull in upstream DTSIs .
