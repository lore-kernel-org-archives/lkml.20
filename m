Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793511590;
	b=SlYUDT0u1eIH6WLwhdRVPEoHKZPsJ+wrr9k8DcF6wch71OSFb6jzxpVFOvH0+95sG5jy
	 HjrKjXeKB4ucbQRhKDU1KO0Z+puDJQHg86+aUXoxvFllbT7FyE7V67wcMCza1jjBQsXig
	 FU2CBoaxXSnYq0IUPeKi9Uux5CrrM1X/DhhfI/gBjZcYgxjvcjo6NPoJvH/XmskW6U4ZS
	 rneNDHCcSEzG3E6sO3AQbBKNRPti/1m3Q4OR1hqCYnnMdLITZt+pILm7b2yo+zY/N70ML
	 huuHvCSB+AUY8IcsfMCr9WBcJHd9fWMHjusZ5ssIyC2z3Nwht0o7EVNto32Ee5UXVaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793511590;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3un5P10sk8oK9XNXAXKYVD1iFuz81kb645oZObRJaFk=;
	b=DXgEEtawvXQNilUs6PlkYPqCNU8QBbKCP/3TfNQhlZBAV95TXpLs7l+QXYa0Lm0NCA6j
	 6Xs8dpc6PvNUkzsIaDeWY45+tx9BZIDNB9Qka5GmjKQYNPLlTWLrFsxUqnC3xP05LVege
	 620qSiISHwR9OJtPupcu6l5D7lNRclxwZtQeCDxx6qzYBE1R9Ho+PjggoV2wbTSFyieVF
	 6iyNCDRXrI+UtfL1NsdZ8sbiOk4Fk84Kt5Ac8xHIP/W1zvwgyUtrFH6pn7gce1sUSeWrA
	 aNJfhVpE6jaOdcC5R6YylQdu36MdmgHnBQiEx1fQymiVZ/crtvUsTqQz8EDdIZ5jcfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Aj02QdpK;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2318606A324;
	Sun,  1 Nov 2026 05:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2318606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Aj02QdpK
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F216FFABF;
	Sun, 01 Nov 2026 06:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793511583;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3un5P10sk8oK9XNXAXKYVD1iFuz81kb645oZObRJaFk=;
	b=Aj02QdpK3pB0SUgQXrZjdhCvnMas32aLG8WPYEZPq2FW2yz1nj0HIVs5QrIjXzk7RJa3i3
	zhcaZKDqFVpF4eslHEYaoSREa+Zij4XxxgrxxlIlMbbhJor0J+SWRgce7eFOU6OyPrqUPT
	rKlTjzVOQ0J6a9jUlhJkbtZXLZXg+Z+4wnWNRz89W6nsp/NCQLeXOyKU/d6G4e8ekxOJ3j
	o9pRG48ScVy/2jfji9i8gVsSgjUBzVUum84T/eXVKFhWlrnw0tajmbnegiV1a8WXW+fqXk
	tAKiClc9d5jpym3WeA6KMNEEjEs84oZjmS0ri4GUDzXqnx1dYrCcJsZKGclhhg==
Message-ID: <3237f9e2-6c80-4adf-ae4f-65f8998ef4eb@nabladev.com>
Date: Sun, 1 Nov 2026 05:47:21 +0100
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
To: mateusz.nowicki@posteo.net
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
 <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
 <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <799394b5ac7067cd2bb2e06117e53ec3@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/31/26 9:59 PM, mateusz.nowicki@posteo.net wrote:

Hello Mateusz,

>> But maybe there is some way to probe for the correct ARM SMC WDT ID ?
> 
> I agree, the ID is not discoverable. A revert or a board override
> would not help firmware built with a custom CFG_WDT_SM_HANDLER_ID
> either. Sorry for the trouble on your board.
> 
> I like the fallback idea. My suggestion:
> 
> - arm,smc-id becomes a list of IDs.
> - The driver tries them in order until SMCWD_INIT succeeds.
> - The SoC dtsi lists <0xbc000000 0xb200005a>.
> - Boards with a custom ID override the list.
> - Older kernels read only the first cell, so nothing breaks there.

Yes, that sound good.

> Trying a wrong ID is harmless.

That is not exactly accurate. The wrong ID might be populated by some 
other service, and invoking that might have unexpected consequences. But 
I do admit that such a thing is unlikely.

> Old and new firmware both just return
> an error for an ID they do not know, as your two cases and my DK show.
> 
> One catch: OP-TEE answers an unknown call with 0xFFFFFFFF in w0, and
> smcwd_call() compares a0 with PSCI_RET_NOT_SUPPORTED as a 64-bit
> value. The driver gets -EIO, not -ENODEV, so the fallback should move
> to the next ID on any error.
> 
> If you and the watchdog maintainers are fine with this, I can send
> the binding and driver patches.
It sounds nice to me, thank you !
