Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105712;
	b=et5R/XEDEyiK4p6OHtGmOeFKuMafE8qKRqCYGTHYGPoX1XQW33IAvrvtGIxPNDvmJpqo
	 7eh9T4ASyWREt6I+AFSrTlnqOeOEHHvrmrw/zcDqvqTbg2RoHjJFlEjRd7uhUUZ9hk+A9
	 xlnkj+IFWS6AvphaU0QikVSVhyPmEXOns9vKOrg2ZreyXh0seBRW8t1WFm/GilNyWLLRW
	 WGKdkGaW9rgA0s8pRLwRTGfnDq/BGmUM4XxO61A5aHJ3JPyXgygTRNUTTMmu3/l60cyQe
	 7jlx+BrfYGlNYRGg8TB+Ciz82/Rkg3cFR1qEOgcs/Ti5s9gqLCQT8FGT2BTbdUg6lYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105712;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=l8rtHrapaottmx9goZkL6akyA4nq8Ox0o4KHJkDcn9s=;
	b=IkiOsnHsNZcW+kII5+JB2kTeZmyOqEk33Xc/eGu2b6OKFutC7r88qeQHYdPZcEI06Ytq
	 ZwCFv7ttgGWCQVfDgl3mO4rFFDkPito4MIBbwgIK4XLi642jpdEZH2eIEH5/eXpteY8/2
	 iyE/H94KqPMnZ+WmN2sfukmm8TjTjWyJnzT0pP/qRzcl/+RN41z6B22/NoLKkvtuSlApL
	 16K0kzs5KEw5e1YiWR51qoTX2PBVep9dQOE3HBAj89qqpYZ+OA9liTgOz0IOuuf1nC8ND
	 waSYs6y4a/gHb0woEpi33Gxi1qZYHyRlrNgAzUcHvcdgU/i5AMNaCz3iBF5usFq0sjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b="jII/eFTh";
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13B606A31A;
	Tue, 27 Oct 2026 12:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B13B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jII/eFTh
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C792108A85;
	Tue, 27 Oct 2026 13:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793105704;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l8rtHrapaottmx9goZkL6akyA4nq8Ox0o4KHJkDcn9s=;
	b=jII/eFThrQM6/pj3YkTAaPlhsi0wrkdNeuEsdMtU/Uat4y4xQGzuLa+oV6yo8SyFFP11Qj
	rlLHD0YtGXY+6YYcTI2jglyRB/O9aBS0RrvvMKSu2z8Xoofsf039UFWAhnK2DPhpAyXIy6
	nF0iKqVUtKzZKmdlBnJAqVa0jP93fkFwZqhXZdldyj+W2xSXLXGz1vGdNUn/H8xDw4UILp
	VhH6wBCTqb/2t+UmMZJjZ3zmRrCkFjzONguTGW8o+VcyH5A5wk3f4HIEZ4VbN2XMU3wyXq
	g5TVszijKlAw18o+ODALDahs0YQZOqRpGRBNoSA5D32e0PK++XkhuIA/7mqoYA==
Message-ID: <b87fb6cb-e9c4-46c7-9306-fce90cbee6e0@nabladev.com>
Date: Tue, 27 Oct 2026 13:31:01 +0100
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
Subject: Re: [PATCH V2 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB
 number
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
 <20261027111201.20936-2-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261027111201.20936-2-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/27/26 12:12 PM, Christoph Niedermaier wrote:
> The PCB number of the maveo box isn't 525. Change the
> number to the correct number, 625.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>
