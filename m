Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427442;
	b=m+Un8Szk6FBFIerTL0nfWQJe1d2b7ID4vOwyexE+kLFG9fzrxDeOva3e6gmI0g3gXcb6
	 KkQEAvb+VwlccbFmmRXNoycOqoa6mC1qVA/t6pwUF/yrKMKlFpzxiB11sjLNcnjCwi19z
	 oTfSDFJdvxMWjX63k6EZnvLU7SePnCtsHirLD+G8V7YNfESNMKSEcR0MtxZJIJTGDfru+
	 aCH6XvP5fT/xmrnlcSLO1JV9blFSItWIipZF9cOMQvfXbAsYFMX3ojrXInQCl07yWmraQ
	 Na2I7dRyxWFu2gZh6zMyq69Tb3ONV+OzVp+e/Ud0FF6OSBdebmNaat7g3F2Nc3IP1BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
	b=cMY+iyx7YGHJPvuvIwNYrc1hn8HhT9Eg7jXpnha88mhk0Jg38OMH8SE3i5HyfMq2m+Ed
	 QNPFSPH5kTz3KaK4/V7ONa8nMCRsYTs5SN6YLsSf1xPf+8KjyxHgTihE3PyQ+mbDL5gPD
	 7mv4FnvjIjZ9+yBYj2Hcy39/VSm1+LzallDOCRt6HVNn7f0AGKByhHwrB2mqYW3VdtCyu
	 L+ae6t7nIwyovg6qORd4OYLXsqV02dRA5jCagsbl/3lvRg1J06vFmeN53bWqbcS8UYJk7
	 0LLvxAkwlpjAgh1GwuU3WMvuUdwZN6SdC/TOPxcMrKbMdyPBqMF4JqI+5H8zyuZspLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0562606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0562606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso4503282eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427441; x=1795032241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=zugu79aaBztU/JB/0/i/jqbfCJ7mv+7un6V296+ptLLqHjoNzbL3712fxicZrxzNYb
         jgPTQI8yspdrNlDBFW45xKAx5v3ZcLoHeRd0G28/uvmaJ+FQI9Q/V0Cl/XWYW55Pe/qA
         afLrPj26oqRcsF2gNknTXCB90H1+WLbqscEN86OtcU2/YnEO7yfVsmf8HvTSc5hVzHv5
         OVSD7pigMcFSmYKNwtl0sAsfU5pgaAhHoNnM5/F2u5RkZzVpHHWgYIcRuzn7dZypJKqh
         zP+yFTaW2vvUunbj4av6KC8J8lVtgNa3lRab2dWtVtqB2n3ct+S4raNrjcb28lSCdYEA
         pmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427441; x=1795032241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=qpsBFg2X03MN7FgSULK8GB1j4VKAvZ7qTFZeLgBgXC7Es7lqtveWtmRv3wmW78gGWb
         CgCd7epWS64O6m3DXpLYeH6V4exdMEeEaz7NwJ0GNrf+7+2otkKgkMkAaJmyMr0M1+hR
         zvy4z6VBYB8nNHoCIlPsVHW57iX6QMBOFCMVCd8kcPXc0Zn48BMqmgP+7mxbb9oWel1B
         4EISmjYNO6jFpiU5cP7oyPU3T5dMFqjz5DF9I5yqBOA8vz35Geacz9A2ohdVfrwMHNO/
         Pl0vvb9YKCqdbiewYb7IFDcfZ2WTYVZCsqS/Wy1UAMJLOHeucHfRVbkBJ0D+Y/xgU8i9
         kdDg==
X-Forwarded-Encrypted: i=1; AL+hErH/JTLwh+VhoV/Y5yFm2K5KF1e8UASzIA9ZXGjn6PMxogrP+N7zr8fh3zML9YghUsuDQTDfRRJ6bxd0v4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bCMaVRAKsa7grFFMP+b/cCMP0ysNNklwUhf9m3YN0ujy3AUh+
	LKWEvqxaINicd7h6kLrDNcXUqsQo1b7k+dVn98FYshRysqLPqJKUAk90
X-Gm-Gg: AYBFou2sKgsTkEyDEMpvFIpqm3w4tFgmHGe5QW+329J1uJl05y0Mq2D9C5u+LveoRhD
	8piatWvALKCjJ4ft5eBg5xw/zww8SDZtKqT5MiDSgURBYCTCKqSDPsCdyJfMggqY3J0pj/jugUF
	0Fa/5wQsR5RjIcxnkSNvezk6hclInUiW6X6zGo5LU/OynQ3hCKYPyyy5Halq7uauxxV05UjhqhX
	Kv50ZP4bqmuS6m+5VQt2XpoKSjOGAvp46PIoPGy7/ft688wjqCx7y1+muZNph+kZUKJYKPDrPvY
	tQVUNsCDTFASiYRhWW8Q6zMtTlZZNl/kwvwyhlFm6Epsa/TQ9kG2Rk+HSlxpSCime5XlCbX0J1H
	07Xp/DrBRUU+XIAAT3h8wZ2ibiQ5EocBS7jwmcZdwJ4DWdvlcGi5K3n24oeZ0IpUHuTIt1kzrQ2
	7E64wQVBF/RiezXRylZY5KoDx/SPmblFa2bdysvoT/NdUK9rburd9Qnc5PbXcLQfTTyLeOjOLzt
	TmTpxlgsBTKSdsLjYogrb+jta+XJya3bbOexpUJ9x58TCDci2mUbJSCr7flHSUBa3BmxHsoM+KH
	zw/FlWlbfuamUiu2tO8QA1MAh388pio=
X-Received: by 2002:a05:7300:bf91:b0:372:fa14:8b6c with SMTP id 5a478bee46e88-37685d7532amr4114764eec.19.1794427441021;
        Wed, 11 Nov 2026 12:04:01 -0800 (PST)
Received: from debian.lan ([121.101.132.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm20104476eec.25.2026.11.11.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:04:00 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
Date: Thu, 12 Nov 2026 03:03:49 +0700
Message-ID: <20261111200349.6588-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
References: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
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

On 2026-11-07 19:26, Barnabas Czeman wrote:
> You should not override rpm_request node here, you can use the labels
> from the common to change the ranges like:
> &pm6125_s7 {
>     regulator-min-microvolt = <1280000>;
>     regulator-max-microvolt = <2080000>;
> };
> [...]
> Please add the missing regulators.

Hi Barnabas,

Thanks, understood. In v4 the common dtsi will define all the PM6125
regulators with their labels, and lemon and citrus will only change
the ranges that differ through those labels, without overriding
rpm_requests. I assume that by the missing regulators you mean the
ones that lemon.dts still defines (s7, l5, l7, l11, l17, l18, l22 and
l24). Is that right?

About your previous mail: thanks for the dumps. In v4 I will move the
ADSP and GPU carve-outs to the common dtsi with the values from your
MIUI dump (ADSP 0x53800000/0x2200000, GPU 0x55a15000/0x2000), as a
separate patch from the pure split, so it can be reviewed on its own.
It changes lemon's compiled DT: the ADSP region shrinks by 4 MiB and
the GPU region moves away from 0xfa400000.

I can only test citrus. Would you, or Adam, be able to test the lemon
patches in v4? A Tested-by would help a lot.

Sashiko points out that WiFi bypasses the wcn3950-pmu regulators.
WiFi works on citrus as is, but I will route its supplies through
vreg_pmu_xo/rf/ch0 like qrb2210-rb1 does and test it before v4.

Thanks,
Amir
