Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201468;
	b=FiVAOkfY2WwnycH7Q+I5OSDnVRdbL6LEVNK7rBMGtBvrxgvpIyX8gIYfieBigyaR6LrZ
	 uzEKUtkT7czdHpqBB5JUApNT0vOnACHknQK3kPm/CzVKMr/ijOdPAWVe/6Uns7O4i1WFq
	 e8EVZBVTYuq7PwJAcdhiofsbCWffvR443xgH+/5M6k0gR8qw/dibmN4+Cz+e9qUApsh+6
	 As82U86+eVYg0dSZ4LWutD1NaZ2W9iUP2jacd1FYSy+bH9nWs+QnyzU8FCHL29E4QiI1A
	 sG+BBbEqoUGxe9vU+4JsSW+xnPxWbyl0e51mLqn0gCw5fJwyXa55FOAFYAelHGcNQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
	b=ejQFAxjLNNO8roP4a0e/+qApvXcGLTnT16hXOYmHR5dkAuul1gER8wOCjtrbkpSu5vaU
	 p8q17Qz5qCaWSea/wTz2sSo0aJa07Qb+RMJDK5X6TnP2RMeBJ2zHbmXcyhnV0QYwuquDE
	 jpvlnFpOQFY0tP9ZKS/eSJx8+RdYRXUPXQn2pw5ix/DBv3RBnJ11lYHBgC3I0iXkJWwqK
	 CqZRZgwckHAXshpEMWRG664T+7J8q7ebauMzVKrE5xkF7OVipOlhfPhHg+8szvBwspMA0
	 on9ONSKHMwZuthPUTGx7xghCMXPxPMayd0XyZmUhbEBvJR1a2aMMJyikSOTy8sIq86g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70856606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70856606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40f29667e6so118306066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201467; x=1793806267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=ZpLSHtz3kFRM2BRETpYSukD3bRLdMeTKGj2xHeVRSOavkV/SJShwlinM7GpZCEqYy3
         zD7wE36CmGuVt0WMUlb3rzEtobX818C1CgH6DgL7nMrgCwL1NvNueDFwKWGzLMXV+kEd
         GisIPOclVxDYGguyzba17fLH5ZszWEgnW+1ceT8rlUzLkFLCO7oMYINNoqlmBKqCUTYp
         7HWmoWQGizm2Ewx79YjaPLfAcNtKLpUSwRvWkAKEIkb51CS876G3x1/TiDL2hpcue+qc
         M0i8Dhw6UDGpu/Jpz2uK2YgVFDwNPoR3ykzRej0CH4upXFppSjaVmmOiNTrpYE6yE0RD
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201467; x=1793806267;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=qADlc9jk+tABYgjIoky7io2PhaLbg8G6P9UaCql1RvFoZ0kLhCGS80Del0o3rMlZg/
         wpXS7WpDU5VHw1tpJCw/4HUolC/q9Ap4GJ2w2oF+Z0CercxMLy65xr+6UyPC2xoUGfZR
         gAr9l0vvp7lnCzjaBEsqes3aAHevLHsP96ZiyXwOhdKXOHWD46P4Twbyh5w7yAWLd1zI
         ga5/O+j4UeDoJ0Q3MsayM2XpNCSB+Zbn0LD9XJoftNP9ULhS4b63ObfHRBe6faMHIerW
         MJodoaMGYapqfjyy8jSDA6fixruEl2IYNTTrnIWZYFEXKrNgJYW38wnY7EaUU2+Ic15a
         gojA==
X-Forwarded-Encrypted: i=1; AKwUvBzwMCGJcv0f3BZ5BRAQ7Wnqw+UwdhNXz0wuoOHL+TOjHc51WYjArM2Wwte1gnZocAYlFRpCzOqP13uqN+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz1vYm3d3SiVhyqYLcmAfYp9EFE0sOMJAPvr4s6EXKBibPLIyq
	ZteQTIQKTAI7IBIcVX6vKt4xRclZrcrbotEjtBcdcpM2G3tOsJbH32D0SwdIhdInM3M=
X-Gm-Gg: AYBFou0XIk5dOMjwfxI2r0zLVbVB5m7DwpDZrSmpmj8YTrHnjQryxq1pflTFte3C/Ig
	QNyPcc8fxZT/AFwz/F6S0D1hIjz5yBltVDix3R2h7wQLVE11M7QjpgoLYKlmQy/87zBXwEMdClK
	3KFMuxKXFoUmzrW/vVGBPTtI0eDS9lkfTIzYAym3ZvRtJsxpbZ3TCAe0JKiu5DRLzkKG/sLNh/x
	+11lYR9WPIWHtLLemnlV3JVP6hPyC9a3ehLxScUxhs3fVhDTQ0GkJMiiykNnYeUL04Cp58etTvr
	vkTCPVtOG0xHBtTe8pEqHkdTiLz7Do6LgWprV9Q3JRMyttmNWqsk6Lea1rjwBWSQq8VG2mh7wh7
	Itqc4YDQJYbqwh3CSaFUwFPAxdfPfHIgw0kwpOlsMlOrc7U0TkUXRvYws7cEiXZqL8HoCgj9oMY
	uS78BzUcP8ZtnK/Who9ZgJNWl2gRHVt2GnHHn1DhSXDCx6FLilwXzeS+OsqVSE6GAv2KhEBOHVE
	Oe7z+KWXHYcqKbWhnkvPcwwVtwObdV5wRm+5to65n2zfjo6jyxizc2w359g8ceEm671itRoSsfN
	E9JTCgiL7/6lUvfLECURp5XLouEmh/fWCav9r6GuLKYb4OIZfmYn97EPWkVmO/I=
X-Received: by 2002:a17:906:ee8b:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c49bdf140a9mr230072266b.19.1793201466691;
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm616663766b.15.2026.10.28.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Message-ID: <9d22f3e6-7f6a-4450-b6f5-871b87fe49bf@linaro.org>
Date: Wed, 28 Oct 2026 15:31:04 +0000
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
Subject: Re: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions
 for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
> sub-block. Register them as PM clocks so the PM clock framework enables
> them once when CAMSS resumes, instead of each sub-block listing them and
> taking its own reference.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 98ec23c39fda..a64242c66cf0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
