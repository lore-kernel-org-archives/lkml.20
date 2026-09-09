Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59357D218;
	Wed,  9 Sep 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969326; cv=none; b=B3IxOPpgoVGF7q5X1gTqJYACFFz2Aejv1eVHrBqPITAgN3fzrxE+6jH72r9f5Ynm/335+ZZrZP//jwkDsn12RAdtCQAi50mYR1nsVgyUIvzhlqmU1wya1rQ4B39aY0p9TG8lxUlzXaCsB+G00AEjUdCA0mwTlZNSU5BXGQFRg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969326; c=relaxed/simple;
	bh=+oKypz9oArUEm3tSzu0eXI+9ht1kAD3znyQonaqDhoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CToyomiUe3YfR3d9YWIrU09YjLwsC9ZHq9e0klF2+8sasm6SbPV+0uZxqTcsBydXHzSSwwRZYGbwzL1SEfugPN5zxCr4qyLXEbOmSI5HErt7TND/c4S7QciamwkhYq42YJvyqeX/eOr04IB15BbJdcaaSkmN035JmUUhC26NOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CxMBx3uU; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CxMBx3uU"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hg5486rjsz8sYW;
	Wed, 09 Sep 2026 17:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788969321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8mVmcBNQRcUr40TX7TzG10oD0qawFvTxK/+rQfqGH8=;
	b=CxMBx3uU88mh1ll/lrVnYH6E2Dm76+ffOEjVvbdkiTgWwz3as3NLSdUXq86qrEkeNpIN/O
	GFSXoFx00A/nYV0jahOvb0I5Ei+S5+4xn29QE/gxbOPSYHKR6h92WGdXYfmyfIwKdmz+3b
	OZdUTL+Z15+U2zlyyn2fAgbtAd52A1+jVdp1btyMjzSOD5FKiUoUp/ZhP+D9++dfjnJVkq
	Rw/IIiRow5lW8oNGOKu5+mdHPhoOB3QFawstgJ3bL5OmX2r4T6xCDlwLR5m1q4mdIB5IIN
	m1yxI+GkK8+IttHNDWTHlfXtXoCagNr94iGZUzBSYsObEvvax8tDbLbv9pY2hg==
Message-ID: <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
Date: Wed, 9 Sep 2026 17:55:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8ccexz6nocmeqr7i14osdxorp8fge9aq
X-MBO-RS-ID: ddaa8513b879ba6e098

On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +       /*
>> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
>> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
>> +        */
>> +       spi {   /* SPI_1 */
> 
> As this lives at the root node, I'd rather change it back to
> spi-ws-2ch-canfd while applying, if you don't mind?
Please make sure the DT schema check does not complain about it, 
otherwise it is fine, thank you.

-- 
Best regards,
Marek Vasut
