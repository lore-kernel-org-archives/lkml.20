Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138467;
	b=OxeiprknrxGez28XdQ6I+HkZcOC2/MbunqPBqMhqcMmoQ7VxODbAOJ/7+IpaknYWdJOe
	 MEoBrJlQHRuPnBhbIsn2MCBj6yk6K/CkhdHZJtsixTamLZ5UQJTlZ+aCyZCXLS7KLvnFp
	 zjfEbhr+P4IQt5Te9r2u0X22vrnfpsB7N1ljcB/6y3Q5Um+gHMmPBZIKtEDutAxBCBjR0
	 uKD9KV8TxIMX6kjizH7/XX6QDlDu8ysoHSoGcOwD23xebON8+i3Gzh2+udTIffjEWEYQw
	 yKDkdMyl7yTIEHrSmtmScHdFtlGw4b3vIPD15cYHbBTlUxAEJy3H435Hb9l7kHEEcww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
	b=RmYsPbd4+v70cfN9JU3frRWGnkEQluJf8lSG9CK10IT5g/6Woh13KrHGTvD8/FItUBBw
	 gjNMTEKJRuWLgALQ8SRT/9dq3urf9ztmbdML1FWa5+PzJKKy/weEgF6hxbGPzRndVVUcU
	 TaqCOfj2NU/dkjBSknKn7goOKlffbW8B2wezQgDJjmMuI/75QF2e9GuuORZSq5dChg3/9
	 tMjqhnKX/gGrU1HqyZxw5bk8wHyziznSYZVDuBhzGc7Syp5FsMfREC11RnRdY2/y7+ILV
	 CI1xiAddmGkjylg5ass9ln5vPQbWY7mer0ZMLRolwdoC5ad3eiilvA46yFP9avnX5zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="XBMkG/II";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FB606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XBMkG/II
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4550d8ab15so6450066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138466; x=1794743266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=XBMkG/IIcRv2erhu0jLaUyRAxZewraw5dmsWN3hr/txMuy8Pcpc2x0D7vuGlZPphI9
         gRZvOga9mqvWxhPARZxqRgkk/+kxoUSkKfxz0ZWOEy1WEtBbk7AkkYeWFRi/ldzlivXa
         7DXCGnN8GohkSU7uwFuF109XOQveohNLVZfYFXtqr7sk6/EbRcUTh/WV5abnKsqG6nuc
         tzIl55i/zN1+cK9Bz16/UPM29dp2cpvMLQo6Q/TdP9fSSw+4j49wcpxK9edWYfvPhbCS
         eQanoJkJ6vbOLAcDwlyFKxonmU783L4jU2aJOV+/eyjjw7B5igoGxDacquIwVDQA5VZp
         AXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138466; x=1794743266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=nnacA2nJyER9sJeZA87o2XPgaeyuXtsKDpw9NZrudcLTYKhgSoAHzjgnAPaOt5Alut
         IfFrFkNOAEEYWOkS0e7ybTsyQbSev517h78aDxZuiQmZvKvQwYYsWiGTyie/k0BgK91v
         GOiU+CGGewQSQHz8KOgJNiuMIdEtIP5xJi72xlp7flfGuRthQVVqKvakINxRG8jLs0+9
         zyo4CShTyPg41dgR5ddWNDzO2WITICYukqmztp0u6x6n/lfYhUOFSlg2AG+cRyS9sis6
         6zi/er3IhoP5qIMm/6FsOn8eDIRNfUy/1h93N60n2lFu5IwLEQHnMeCT1IW5ueTkoQpa
         txfw==
X-Forwarded-Encrypted: i=1; AL+hErFqdKtwMt3SRjKsjZGW/vE4pxyoDwV1EDWR9aRLOxmmbVTDEJ5GqKrCiJnVCyD44X7fPUQtEdgKH7fR3oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FqhB3Z+5uZGKQzWolWwoW51xkbTp38YfqDZyz0c6UVo2/FHn1
	FfcyR/ri0ra6BiFw4uaJD+GPgnXoaIiqcew5pnk/na9NsTgziD9o5caiGbFcNAIXTg==
X-Gm-Gg: AYBFou27BDZU/5B1/cHuNBuRCCc3W23uhDJ23QIj1g7kqRNm4WZJc2RI+vCXeUjSTZK
	TcZnyxuailW9kySuzhvI3Scp7WaBrGM3cLBp375klR+gp3yjOqjQ5sob4gkSqViWK9rsDEMX8w3
	lWMKuQIrsumZ1qukrxyeZa+jIKKayz+hwevBejGvDsT9MmM6wC9tUSpLF5Zz6i26L0XPM7vxvZW
	IlY63gMBqoeo6pg2srsRV4eU7Tto1Nm3MXmlOFZFOnujP9RyR5KCscZ56kYSIioDI1WddVHeMaW
	ySet6Z7ZsjX6abRbldsgNXI9AFdw7zGiScad5MaHY70MwjOgdTflOFPhwZb67RxNJtrDN5QvZem
	Bub2ix5/lkeq+9wHNwSFN0GxstIODfdRsyunVvQASXcqgMmX6JP8UXfqjepqxoca7QgWUMQesw7
	VclsuitTWEyL7y+b/zP9vyzYpsXDD/Gfu8XZytAHBTm1m7rNVpIT0CGNt2pCuCPP7+aBoRBWqCi
	I6Jty/nseanvuAeRzAbZ2gbTewRV81WzWmZQHdlkdT9+nCvqu9Iudvwg9C/TCVOfz6PxRw1JrBC
	fGwftITi3iwVnYZllHQzWpFpEpME6SXoctIT+nY8wmNCTh+xO1QET75yZSwpb47A4iZ4Y599dx+
	oMxnIgvethYV9sbZhO4zL/qFgMzRDXqybJLFyEGpU+rHxJfQ+eCyF/oect+1tIDjrJhNL0qIhqf
	ECP6RHMKuZYTYluELtO3rxryxO/E3uYQWACiQeyWYslh/MfUtpBHNpZ44DSfoYfLVzf6IKc/1/5
	tmIrzZufwjtcRABJ4+VBi9QSucyNuNHCf0FqpdLo6qSNfFxZ9YXsOZA4U4mzJuxir+PYlWKtsCe
	qJEc7ZHRyPUBWcaGtw==
X-Received: by 2002:a17:906:9f88:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c4d6d8ae41cmr91002366b.45.1794138465886;
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a993031sm56570566b.68.2026.11.08.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robert.marko@sartura.hr
Cc: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	sboyd@kernel.org,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	vladdrako007@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Sun,  8 Nov 2026 12:47:45 +0100
Message-ID: <20261108114745.125841-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
References: <20261020065430.1251541-1-julius@bairaktaris.de> <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com> <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com> <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Sat, Oct 24, 2026 at 12:35 PM Robert Marko wrote:
> Thanks for reminding me, I have sent the IPQ8074 wiring.
> IPQ6018 will follow.

Thanks. Please drop this patch then, the CMN PLL wiring replaces it.
The IPQ8074 series works on the Xiaomi AX3600; I replied with
Tested-by there:
https://lore.kernel.org/linux-arm-msm/20261026120920.1667982-1-robimarko@gmail.com/

Julius
