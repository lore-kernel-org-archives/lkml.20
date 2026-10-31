Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480363;
	b=RZOGKzbwg9KcL2YQwxMTiGhtu+H69a4YcdsXk3+BhXlFqxdy8h8dUVvliOB4NDpftluK
	 uOgG6kPbcwB5aKSAgcsm87fDrgya4kNWK6BUdSCUxPbViFShob9iSvRsVmzkyKZmdAwAY
	 8Qei1yUefcItnyFl8MhqfDWMFKLOl/5YOF3ml4ZNAneJn23gK5PCIxFdXpDdnUOlWywZy
	 RwbxOroRPw2iBtmaT6wasFjpecoZQ12eqps2Ge8LqZeZImOzWvP9cCsk2vg0E4YSPRAsv
	 o3pGUxDbfHndLrr57Cn5IinSdDKxeTOhUAzfoBqHoM02FhRbSW25LUySI7ZsyDD9IiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=m4TcohsJzsEPAJsBPzHPQnX5dlEW21LnhghKMfVe/VQ=;
	b=k6OZZaUMo/Fn+Owq+Aeq6kMNzAWEvLhkmtDVYR8wpm30/B15jRszXQ+HRa+k5l3gDyR+
	 s4AD0AQ0LfxcMvQCqTCIesthZMGakFri55SSyGnptRQmxyZ7j5qi6IMDegCxsC1ACxtcA
	 cDYLEwESNXfamiEz2IDFdn5Vcv2HGAc/3iZTC7lIkoDUuGpYt+ZBxMpreFcaAUjJG+vFv
	 s8xDU4Qy6AYo4V87cNmKn86B6AinxQBAPAFfXjAjconVQHtswCfrYOsbl+X1VvOUQDKUX
	 UqvcT6uBjCmMtI1hCt8XYjWOn20QTomuJKDwn4xTHd4pMRn55KWcL5EICkF9Eu/MJTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=Ae30KHgP;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA605606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA605606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=Ae30KHgP
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6107D24014A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793480360;
	bh=m4TcohsJzsEPAJsBPzHPQnX5dlEW21LnhghKMfVe/VQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Ae30KHgPmU1P5Ej9kF3bnsUs/flIG6V5JJ4q1GEG3yPbc/zFW+1sDUqnlkR5JAykm
	 7FQiUeDChm4GF8FLHjfZeCreeTA07qtARFpdV9g+wBpURBzSMYdwPjUMDnHySzif4S
	 YxMtsM8rTulrPLlSNATSEIMudOQzSQEypsDCdhaZSXn85Ps5e45/1Bh8dlcu+Aqjok
	 H0zKpJORi8RpPT2cPX9LrhJkqmoOMFT7bHPmOVzyuKEmN1XoDhQl7T2LkfkETDmcmj
	 yfNArxusWCt9DFk8wmnLCK8NQABKrboTf4Lz+2gMX2g4vOq2bkXZxFhhMHZ/FgBYfu
	 qDIhKHc7povfg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jH9Lr2kdmz6v4k;
	Sat, 31 Oct 2026 21:59:16 +0100 (CET)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 20:59:19 +0000
From: mateusz.nowicki@posteo.net
To: Marek Vasut <marex@nabladev.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>, Lionel DEBIEVE
 <lionel.debieve@foss.st.com>, Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 <kernel@dh-electronics.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Fabrice GASNIER
 <fabrice.gasnier@foss.st.com>, Stefano Babic <sbabic@nabladev.com>, Etienne
 Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
In-Reply-To: <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
 <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
 <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
Message-ID: <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Marek,

> But maybe there is some way to probe for the correct ARM SMC WDT ID ?

I agree, the ID is not discoverable. A revert or a board override
would not help firmware built with a custom CFG_WDT_SM_HANDLER_ID
either. Sorry for the trouble on your board.

I like the fallback idea. My suggestion:

- arm,smc-id becomes a list of IDs.
- The driver tries them in order until SMCWD_INIT succeeds.
- The SoC dtsi lists <0xbc000000 0xb200005a>.
- Boards with a custom ID override the list.
- Older kernels read only the first cell, so nothing breaks there.

Trying a wrong ID is harmless. Old and new firmware both just return
an error for an ID they do not know, as your two cases and my DK show.

One catch: OP-TEE answers an unknown call with 0xFFFFFFFF in w0, and
smcwd_call() compares a0 with PSCI_RET_NOT_SUPPORTED as a 64-bit
value. The driver gets -EIO, not -ENODEV, so the fallback should move
to the next ID on any error.

If you and the watchdog maintainers are fine with this, I can send
the binding and driver patches.

Best regards,
Mateusz
