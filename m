Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705169;
	b=CHXAjiNyDNQcllHFc9EtF2Nci4wMJEKLSn67QvTQcSntJt61Wz5i3GY8sqPeoeXW6v+y
	 loi3C/SiTtMc76ovCQDR5nvRCJnnlhYJ2HU8OBdAgnudSqhYs4We1H0lwUbZYNF/JOzwh
	 t/YUF8elEVeW8uRkrId7eBpyXJ46LYFAZaemSfveu5hulSv7qftIGCRGe98/TqcLh7mMK
	 cOwG0jzZj9CVryP1CnTEF6VSzmqSR4gS3IS+VN0qsZTChSe7ChjftCBzjC+yACbqfW7sw
	 eFPJypddF+r+yqksbC4w76cPHSwIBhJNf9i2PILbReMrKsBz4HCiLBqiB25M8kHCemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705169;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yZiBXj5/OjC5csH9APWe/a47/JADDBP6aIayiJceirg=;
	b=DuKNDXCj/ePN4sme/qyvgF7ch4jmAHQZGSTa2Eb4eYSTOWU8Nbc6jLWErPc18Wvemr0Q
	 REJBHRyqEKXOPsg8etKNd06b6uBjRZDu0tCV5229qIwAwYSGNyKzZ7vQdbczmDHcAlhpJ
	 O8qYQW84Fw2FMqraLigcBI11wML/QCY+C8hOQ/Thgt19HuW9OR8seqlI/qEbD0UUAMChT
	 zD4x1ReAYrmeHxt6Fh6PwFwqvQlNzzdHGBMnD+mTrVJCDonFb+G3W5XwRvsX+6/EjlecQ
	 9qI6oQqZq5f2dDQNBa716+cVUcDs8lbEprUtu3GectfkJ2vlyMqZdAhjk6KK2cO1Plg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEfcsnFm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10986606B11B;
	Tue,  3 Nov 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEfcsnFm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540FD1F00919;
	Tue,  3 Nov 2026 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705168;
	bh=yZiBXj5/OjC5csH9APWe/a47/JADDBP6aIayiJceirg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEfcsnFm8d7qJ/SazDDCiDxO0PVxQW3q9xZYN4Z3ulT9MpeQNLyf199uCQjOoOCsz
	 5oAJRXw6V7NJxGRvTGIE/n3zNqUcRBZC0KfMfI2/jjsMwEd3nAShSa5+u+jAfG5hxl
	 wg1M9WTuxBVC9YCt5PONCcr/3UJnesK5Lqy9PpQjVwgr+yRFRsOQjZI8Ab4+R+n09z
	 bYn3qbCHLqr9vwHAL1m2Al/7qtW52ucq/WwjezcEx5QxweNj/LqzyY3hZ/9upx+EN2
	 MOxJhRPFmlU3lI3DK3ivnxZQEDlcRLvSIEYsJCXDeI5FeyarNR3f69bIwrr5nnSidH
	 1YQZFSyBjZaPw==
Date: Tue, 3 Nov 2026 12:26:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: Add TI LM51772 support
Message-ID: <20261103-glittering-coucal-of-tact-cf3a51@quoll>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-1-0de62c22f342@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-paul-lm51772-v3-1-0de62c22f342@bootlin.com>

On Fri, Oct 30, 2026 at 03:44:44PM +0100, Paul Louvel wrote:
> Add device tree binding for the TI LM51772 buck-boost voltage regulator,
> which consist of a primary VOUT output, and a fixed 5V LDO.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/regulator/ti,lm51772.yaml  | 230 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 235 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

