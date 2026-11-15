Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764191;
	b=h8vL+v5MBLWrIRXvwRJiMl/4Zv3QFKqz3O6cUD3yjA7tGfnujDtGYArSx+ufnMPocEeu
	 PTPc9+mQFKmzohiR5zSpbzc3GAq8hUkV/Zu/AvAnVeTzrYS3Ar3y0bqMsXDBiMAG7ahqS
	 VODCBmTDLi4uUIM/Vg95aznccQecHzAdiH+SjeVS0G6P8P+wkjGN8MFAcrytCu/z4pENh
	 +5bMJILNvM9sVbDFCRltj+/uDyMI/qXJk7hHDCgR+lU5E+WfXHQcNPpPDkWXNklff6EXH
	 MUatpCSUqjW0OE0CwGRe5ESj6IyqkJDgRv/9g2r19A+GDEMJp6fVk2mGUaEGs6YcwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764191;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oI/8o/DiV/bCzmSN72SV0aGLWerxFym73b9YNEeRZhA=;
	b=cvLfgZaOYHnVso2s/n5A4eAuLRjCXJMBizc2SHf0em5OwaOYaXhfPp46q9LeXXQ87Ifc
	 JPkkbGY4ZlJErUCLVkkJzinchEbCOkR5212rMHnqpn70NbmHcGOluW58anM+MSqh72ihJ
	 GvxBrlmkBX7Rev96tz/tmyqQ9qUquPe68hY0VPxTKywJHYjEjxSeSk1aU4wQyJ2YzmDeS
	 SW+h1+cFdvFWcaZtMBfc20JnpAgDWhSf4akJ3grib+FDdp+CuFXCeuEwPHjlyGNtyHa19
	 IMFzaxAZv1k97yUJ5D3JZLruzlFSgwtCP5tc3XB/oXt9hscTveFcZewgYlqDUUEcv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ms/BJab/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49911606A339;
	Sun, 15 Nov 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ms/BJab/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEDD1F000CD;
	Sun, 15 Nov 2026 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764190;
	bh=oI/8o/DiV/bCzmSN72SV0aGLWerxFym73b9YNEeRZhA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ms/BJab/F0yMCpVgRrsm8O8GHY2RdEBGakLzg/Ic8oSPJTJQ1fHhg9op3KG6xX+FN
	 wdPSaT756s/v3tPXszSl4TGCCJcQ3EHCN2ALb1I13vNQ5OkoXPDEBbgopMJQUStSrK
	 JkOym9oDdcExytspCG8tT3BMzitYvER7WqbjsKzf4OXg+N9pm+lFXs1i9lEri2QYoZ
	 JAsUwHPXfB9TQ4QoBijs0vbuPeut08ygjk69yA3reuBbYpi3gJZuTEjGps5MM/HWNp
	 ZJKTqcRxNnCaH0z6fOcyqe8oG7RyLG7gBhXo7mqPpgrwnScS2SHC/NzRSyexQbuptH
	 velMd95jS3lOg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7DA603386D15;
	Sun, 15 Nov 2026 17:36:16 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416982.140154.6938504071664790577.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5wCE1xfUPJHgm8WecdH6VIvcEKtYX/3gTuynF0/m4Wg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vp0gfPFO6fX8I4/6m1JuHXr1qPB7XonajnN65et/6
 cuoPWhX6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE7qxg+O8uNutOMIf7TO+L
 EfNOLnbWrJ9VfuXo7M/uQq1/5+3OXnub4Z/17dsNf2r3O6Uq7V+Ty7z6+erVryLbXlzwOrkxZp7
 GjoXsAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Put the speaker protection and VI modules in calibration mode and
> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
> and measured resistance are reported on their own.
> 
> Number the V/I channel pairs consecutively, as the VI capture packs one
> pair per speaker without gaps.

> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>  		return -EINVAL;
>  	}
>  
> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
> +	/* One 32-bit V/I word per speaker, so channels == speakers */
> +	num_speakers = num_channels;
> +	if (!num_speakers) {
> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = audioreach_register_events(graph, module);

What unregisters these registrations, or does it just not matter that we
do this a bunch?

-- 
Mark Brown <broonie@kernel.org>
