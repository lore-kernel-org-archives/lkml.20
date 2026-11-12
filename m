Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.10.52.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442493;
	b=BhYhw3sEVy2ucegWminN0ex+ALTrBI8fFyilYm79k8k7olrlXriYkfT7vGdYZpN65dy9
	 8BQhmK9WoGAi7qvLEimVq5q+1D8wwvrE55q/Khxp2Vnq/rdQr1zM+6wKoziYVwvF25MsL
	 jGshZQ1tmyDK2A2z+Me7YC43zqNuftehITEMlksNdaMKhosuITffm2Av00N0OOV+k5HDK
	 3oYUculVKVa0kUYWsVOUdqCywMuRBx7x8LlK/FPAgRSqmTNKQAbW99JG0qoONLzBFw672
	 QrD++zW4DJnyh3eJ45JWhUHCIuO2RMSddZquTY/M/JwkAiUr72UdTDPqTc3hxh7T0lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:Received:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iYgvMHFVIza7LGEO5oKdUjEyN0pckhQn4zDTkkIYSI4=;
	b=u5ys9/3TNLSZIiPbRl+TbFvz3QjNQigpVrNtsRZSOcQT+dTHVbqPUhYRYgcy7UPGMb69
	 abZ4PqcvhR5DwkuhsiBQFEGYxHMWBa+07ikRVomZNcy25xCQ0iH/t4z+wmo4Wp0fR0hcY
	 /asRp/klmrcW4HBPyG3TXO5O7GjdCksXFxeuI7IV4MpI6X66fI8JQL2B6NcFJ19pH1YWA
	 4FZDLuv8KANwn/ED/MBg5e97l4aJpdNr43DS8HNX3mrVfVkYE99eL43P5nIoHYhQ1RncC
	 H+J5cLNvGWciFFVrwKTC18y7cSM65mzV/8FNOya/SJhTlYa2Qw1fbYTwF7RpoHx+/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b="c/ORQa4P";
	arc=none smtp.remote-ip=217.10.52.204
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=c/ORQa4P
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794442493; x=1825978493;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k7kpbDZfkdOu+6+Q4eAosh4Dn7tQCdI9lK4TiaOQa1M=;
  b=c/ORQa4P+AldT9C5hdrdaB6DKwlxDG+xNnEvwq5pX+nRf6EA6uQ2/tYQ
   5B6lulDJtp8UqS3fFbOOR2JQNVa6Wymj+2B6HDjKP5r8RNPb+DeD3t/01
   MLxe9vvq9itjpdzGNL7yRqficO8kHM424X1XT8sd5JsVqYOWt6osIJGwz
   c=;
X-CSE-ConnectionGUID: HcBWqX06T3eMXfcMeEeiRw==
X-CSE-MsgGUID: BhPEGWKUQMuvlhW+Eydr+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="117413051"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="117413051"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:14:27 +0100
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:14:26 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:14:25 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 01:14:25 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 2/3] mtd: spi-nor: debugfs: Correct DTR protocol names
 for 1S-xD-xD modes
Thread-Topic: [PATCH v1 2/3] mtd: spi-nor: debugfs: Correct DTR protocol names
 for 1S-xD-xD modes
Thread-Index: AQHdccU8ziCaTaZiX0OZMPbBig06S7cpkeuQ
Date: Thu, 12 Nov 2026 00:14:25 +0000
Message-ID: <53feff9e3be2486eadb42bb3302cfc5f@infineon.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
 <20261111101240.7378-3-changhuang.liang@starfivetech.com>
In-Reply-To: <20261111101240.7378-3-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> The debugfs protocol names for the mixed DTR modes (1-1-1, 1-2-2,
> 1-4-4, 1-8-8) currently print the command phase as "1D", i.e. dual
> transfer on a single line.  That does not match the protocol
> definition: these modes issue the opcode on a single line in single
> data rate (S), and only the address, dummy and data phases use DTR
> (D).  The "1D" prefix is therefore wrong.
>=20
> Rename them to "1S-xD-xD" so the names reflect that the first phase
> is single-data-rate on one line, consistent with the "8D-8D-8D"
> naming for SNOR_PROTO_8_8_8_DTR.
>=20
> This only changes the strings printed by debugfs; no functional
> behavior is affected.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
