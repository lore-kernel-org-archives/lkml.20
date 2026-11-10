Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309117;
	b=h3Nq7OemC/OHRUXaATw6FBN0hfSse0Pqj8V/JR6GV5+BlN725zg6EEoVXv2J/5XH/MZP
	 tB+VaOjVxvsdEyY1+U4lvGsKW9dvx6GsmH7qPJSwRsbZoobJgYFxj34j1DLu2f3xL3tui
	 qYhlNMPRp3V30bi++doxUlaNrGdBGSuvucI9MeZGANjsoiOD0jV4xW4rGm6Hcu6Uu0qP7
	 HmML4rmVuFDN4qgifl5K6SU5RBehlegYD3wx9Gyf9UIjEQ/ZYYBfLyPZGe/leVmNOfiNJ
	 MuIDyDJWu7/zrpQLWH44WvLEmOV0yWDjjHzRHaX9dXa2b58o6qvImJlGIP0+DB8/8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309117;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KwOMqReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=;
	b=cA2NeXB1633W0AYq9nVX9LA/qP+g2cZgNTpifV68jx2rn3uMFPrw480eYGL5a9/mrgrF
	 Ry5BaKclqW8iRu+NazvQAE4BEHcUVzR/ejlixQclBxW0sqrcCPVig3c8a4LxYLMMgQ3rN
	 7VeZt8cPHR3FSM/0H1WzRqLdi5ZXCYGybJF2p/3aqdsoirMVYqmiK6FXYGrmINrfiMlYM
	 /5oJWK1NZvf6awnik2x8+GGUwjQ/1B+fthmBNq5X9WRM8Vl0+4JpSAHdKW9wK4EqZ4iQ8
	 /hZgBO0ZF9P3UbbFU07+BBYsWvf15eA5DXgMMFfP1+X1xZ2KepiWXV9K2wFwh5B2LLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QYXnx+aS;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B81606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B81606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QYXnx+aS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KwOM
	qReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=; b=QYXnx+aSkafOzcSvfg84
	+n0fhAQDf3znURYRalx2f6M7bcGzQ1rO+qluar0Ep4W2h6OFl8gOwAewJx0+Pan3
	dPMe1MxRPZ7GptCOkWB1qxv3al+97t/CtWcAQd2rwNK4SN31coneVoF7c4Adg3Yt
	gjPiWxmJyiCiFCkRcntx1RMZz0fGxk07DTTb4IAKaA7cT1NrtdjpMpnEl3n9yj75
	TXCQEDCNmNc4ZChAPy/JbPan56r3xGYqrQEs4/6b+bgCYhCzmpY7L5AvzDCfczxV
	v/NUt5zgVO5JIccXDh7wM/ajsOEbKxNgEWYNGFRUPkrAGbfokTDlSZfJf19fcT6O
	Zg==
Received: (qmail 205390 invoked from network); 10 Nov 2026 12:11:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:11:54 +0100
X-UD-Smtp-Session: l3s3148p1@u8pgJepf4p8ujnsO
Date: Tue, 10 Nov 2026 12:11:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek
 SoC
Message-ID: <avL7-gfNNvO0s_gw@shikoro>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
 <20261103210542.15965-2-ansuelsmth@gmail.com>
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
In-Reply-To: <20261103210542.15965-2-ansuelsmth@gmail.com>

On Tue, Nov 03, 2026 at 10:05:41PM +0100, Christian Marangi wrote:
> The same I2C driver is also used for Airoha SoC with the only difference
> that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.
> 
> Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
> Mediatek SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Will apply it to my for-andi branch.

