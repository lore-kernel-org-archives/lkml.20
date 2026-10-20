Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519725;
	b=XLG8S2xodUguyhnN2OK9dNDJpP/6rtxlIqcip+JMFg8E3ycLC7SAUIluQ7gsCeBqEPs7
	 m/6oIfT2TvUfP+32Bt63Ugq/OJ+j9TaJDia42+EDX0ugabqNi/xe1PQFC6AylQteb/9Qh
	 NaTrVWmF1fUZD1K35OJINTWZ4dSofSVDy6jbJtqNQV9TiuCtO+VNyGNuHQdpzbZkgjidY
	 kXSLo2MvH01HVluWgJBCTOPwvtOxYEZTgECoZGadfJcF6fsKxwC702+q5Nu6uNgDxe/tM
	 CIHcBONaoONNZej4Kmgc5gAzZegMs0ZvQmIsxU1VWgHg1ygo/IMDAlWEKHOb7Bh3Ueg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519725;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uw7E+NXHWi8QV631+w8tMF0xe7Dq5zyhGNqxu6JZU6g=;
	b=Q0oKDXY3Ut224mC4DwzjBhQO1rghk0EpCv/Ww/GBttNKJuvJS4TT286/kFLCYg0wbMIU
	 FtegwGSigKDs+Age8WUSu166T0L3gk7G34qBKt7GQJ7/hRYxWgA1bpfyqnvshrbvybfcC
	 /6SDKGLhNwKqOsOyIXP5DOHfxXFw8Jp5fkaxuSROGMV7V8QLUQH1ODb/81RRJ/cCQkCj9
	 iYLIKOBW21T7yty4ivNyL1PEEfrI6OmYgDLsr08RckzRD4yZ0+pQ8/59s6ooDzceegB2Z
	 vOhLofxHS+WwkX6CzoaLPKkqsUMBN7Q7C7iJf/dO3Rvxu6A9H9onbMD11CJuzb4QtGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC888606A323;
	Tue, 20 Oct 2026 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C3C1F000CA;
	Tue, 20 Oct 2026 18:08:44 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:08:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
	devicetree@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	linux-sound@vger.kernel.org, broonie@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Message-ID: <179251971819.480464.16290494535168890075.robh@kernel.org>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-4-joakim.zhang@cixtech.com>
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
In-Reply-To: <20261019122048.1107179-4-joakim.zhang@cixtech.com>


On Mon, 19 Oct 2026 20:20:47 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-MC multi-channel controller
> integrated in the CIX SKY1 audio subsystem. The controller exposes a
> transmit DAI and a receive DAI and moves audio through a configurable
> set of its 8 data pins. Which pins are wired out and in which
> direction is fixed by the board design and described by the
> cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-mc.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

