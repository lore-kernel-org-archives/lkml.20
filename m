Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205169;
	b=UM6llRzG9vb35zXgykQOQaThWNKAfXKGjNPZRR8ziwBnXLnyTG2BzWaN5Mx+jW1kC9Dx
	 BCb1NpmyUwcePpH4Jo4L8hiTfRgtBDn3RDRO/8SNoOyrKJkbzS2iqT8MOos8VYjR2yr2Q
	 dTPnch4ilHB61ZlBJY2cuFostklceqTmw5gY79azt+hJL4dJwLTZCt5V+pxQzqLJMClfJ
	 6Z7dW+jjMUd5D9RFBP04pJXsrl2ivGOm9/IMQZvyNKRTkrmjDag0/GXSTysTEWfUtswKU
	 8Ibf6Qu+inwbmDgD0B8ewplYLEqG/bh2BOfENeaUl3cvFUk4jza0yuzgvzPuBSJcEEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
	b=sNVvI0v0eyFEBl6bDS6dVaq9VmWaqZxh/9Sn1H54DlJuLuxnQ1vvdCAXW66M0eaPw1Wt
	 9FKoHm6ylLOAo8osSSQ7xDMrcPgX5rtGXYM7s8qBfPUedkhpEd9HcD9zLA0EmgPRBOuKX
	 s71PKdjztCShsYF9X89+VFpfCVtuoEvJwvRFxrIh0vYx3nH3j2hDPXJvMIoWlxk43f3vN
	 qt6/hEeZ1quvAcc/e526Vttcjr64FuMgbZfSnpbEXnOatcHLN+kTM6vibpIv5xRKzXbGl
	 0lAYDx82y/QvgDnHb/wk5DJRrESq43ktUu9EJJNxawbzkBLVYMza5KowyGGhArO/+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9090606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9090606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1899185a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793205167; x=1793809967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=eXbHX832eO7KCEIcf9QIePPynNTj3zpEb16xJdYbSQOpkoowvXm2FC7H6N9IvePrjc
         NYQ2YsaKAWrn2bA552yqC0m4jx9nYIEsJ+kAosssFdnCwTnhd1wrP5purilJVqmg7IW/
         9PyvNGGsC/J8INfibywsqgTj/qEsPfMTfKHOw4dM8efcKWBLZMUAodnHQ54JjxrTf6rN
         cUXimDERsjEyUBueSdi1MiLTD5lh4jvrY5h0wazj9l3ROl/0fZ8OLDTM2Vd6t6/kkAK3
         OMu88H+ojqLazQ53GiyqfkVyj8dVS6lmsTdc9R8SFLBxu3UN0Fq7XJUuj66hC7CQ5WNn
         GpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205167; x=1793809967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=RXunE59MWd2IGisTGuYQA2sT94pmUXQXUnFZ+3EfOJzDEi+0jxk4dnycQyQuipwQYu
         bnYkiHmb6v/Ouui+yqEiG2oH2SKHSP0S6mbZjJGa8eixYBGg3YGSJJmpu55nu7UPPWCF
         u7Ql1LmSzo573T7JnJpi1Bh9PxTXmkHuiCpKSYNzCg5JJkz2FlL3vO7A8YS/LvFlyOVZ
         X7Wn1BpZ48f8rH6NrVAy6V4rzX5ZpDZfcLzW/ZoKiBlynCVZRNJxkK2vE9fvGnwT3k1W
         nrbADRE+gCXQNHuHe2g9zpn97XsjDNylVWkWmDlKKoTMVijoc87qLSSXmEe4sj8CcNdH
         40vw==
X-Forwarded-Encrypted: i=1; AKwUvBx01gYw0/+yLF7ObjtzyxNC1FzEpqKJ3FVNKOWrpVgDDG2PjKSoDOxFcQdmnS0DWAFi/jBT71O+8wD7QXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc0DxupAlCp4UTXw/xz0jm2QZdKWKR6XeURUQH2Wx+P6CjUNS4
	BXmB6xSnlTm7Ybw45/wTaMbdj3qo2h+RzZLi9Bcu0zNRIwpPoMN+NIhjDeyFtBV1Ps8=
X-Gm-Gg: AYBFou2y9E8pUzXQxO+jwVVB6X0P+kAE81DyczEhcQcLhoLhORT7zkTKzlc0IHNh3A9
	n7/RsDSjCHYiNyE2iI9OjydT8e9TIVhrTTx4gyp6rwTWUblUupa/rsU1px1MWycPd6cP/Vuic0E
	sjfeDVnBHZ1klK8nkLzK/xurbg6ddJGLqhWHs+thbs6DLxW5lQpk6mDi07Sih+qym47S024uxCG
	IWsNZTXVdd4UvOrF8mlX0YREK+YSyNbjpqNku+vSnpM2pkK3XgW1pU70mD/fTG7VO4mrfIfp1qa
	kVsqBxOKhc8Pkz75I50/KpwVwarLMGEeQgXqFa+LIYRSP3IEC8nt18eH03dptvO1VnDlobgf2d+
	jzyRKmZzfnA2Sf7FeDHUAAghGge9a9N6rzd/fWbtPbV/IFsZMAqMzlBlFnGuiv/nHS5hZgrZaqc
	5W7UHsY4p7WtVIqVrufUX3Ef2Mf9upOOTN8SrQFJPlFHEFDBPPKHRMdEcZoQjnnhguxj2hxS7CM
	+ufgTsk2zkQ26wB3Amu3kk97OhytrR7ynxqFs2fLaQkNXVED5SktZCSCAl5hp+fvnYUrZZ4jlt2
	4Zk+Ixd6Uh5V+QH7hFDI1YVLxuUov09fRXo3snYe6cziHfbj6LKdAI6vNp7bYYOAK3JHQ/9i7SN
	GTt+Bp5g1Pv7NVhrHEIyP8tdwChzS
X-Received: by 2002:a17:907:2d25:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c49bdfd85b2mr258903766b.43.1793205166976;
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm637108266b.13.2026.10.28.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Wed, 28 Oct 2026 17:31:52 +0100
Message-ID: <20261028163152.26892-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
problem.

1. Over-read in audioreach_get_module_priv_data() (oops on topology load)

The function allocates
struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
memcpy()s from the topology blob. It crashed on the first load of a
topology containing the speaker protection module config blob. The
cause is in the size computation. data[] is __le32, so struct_size()
counts elements while mod_array->size is in bytes. The allocation is
4x too large and the memcpy runs past the topology data. This is what
I used instead:

	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);

	pdata = kzalloc(len, GFP_KERNEL);
	if (!pdata)
		return ERR_PTR(-ENOMEM);

	memcpy(pdata, ((u8 *)private->data + sz), len);
	return pdata;

2. Slim 7x bring-up: V/I feedback never reaches the DSP

DT changes for the Slim 7x:
- The WSA codec list is extended with the VISENSE ports
  <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
  swr3. The speaker nodes get #sound-dai-cells = <1>.
- The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
  Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
- I cloned the CRD topology and UCM, using 4 speakers, with the
  WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.

What works:
- The card probes and the SP/VI controls appear.
- Normal playback through the SP graph runs without errors.

What doesn't:
- Calibration (Operation Mode set to Calibration, then silence
  played) times out waiting for V/I. R0/T0 stay 0.
- I read back the SoundWire master and slave port registers, the WSA
  macro SPKR_PROT TX path enables, and the DSP module config. They
  all looked as intended.
- With the SP graph active, the amp stays gated and playback is
  silent. This matches the calibration never completing.

Question: is there anything Hamoa-specific on the VISENSE path (din
port numbers or channel masks, the macro TX decimator routing,
multi_direction_codecs handling) that I should check? I can run any
debug patches you want on this machine.

Unrelated noise: SoundWire parity errors/clash messages appear in the
logs, but they also show up without the series applied, so I don't
think they relate to it.

Regards,
Fabian
