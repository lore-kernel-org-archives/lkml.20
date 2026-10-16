Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468E3E832A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139150; cv=none; b=IjRa4nUc0GYJPO42sQaVsKbAD8kCjlUXpceI1Bm8TeWsA/eiYSUGJIxrmCsiuGF4TfCT2wnA7F01eYkMCN3zccFGa900MR+aHtZHHdaaQKhMkyEEdTC5x1PcRl/DMII8twTwX2BGyeK3D7aaeWULb+UzE5PjBZUlnuSi+aS9Edo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139150; c=relaxed/simple;
	bh=/td6X5WjtjIuo7HLqlNXsVC07V0sFvtuTwzVhR5IWxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfiYXimHpeFhz7o5HTzPxaApmf0G6JH9guWo7JIuwnbfbIxrmvUZQlaT/OyChUWwB1ZF8G2Bd88SQSMHZKFL+F+xGOhvO+bCzNs0JZVxMSRvCzMYPsQPq3giAux58nBGjAFBOOAhxQ01A4imj1cvpJs4QQt8ql4b0bc93IcWob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiWsb1i1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0J++iu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiWsb1i1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0J++iu5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G89bGJ1674966
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=; b=LiWsb1i1wLlS5KAW
	i1/Cf+5GJRX5Gmb91NpkDPaqOn8ciMhoBPIlOYYDlsSi+AbwnPXlyEljBphTstNG
	7p08ir4oJqXAFWjBrlCmdFbBbJCzWQicPTorUkyYd6o0zpSsdgv9yPFFDCgqB9+n
	aOaYcVblrMHCTP26MYAqWu0vyJT746W5radGoQVeabR2rLQ1xbQTIPomSxFAIXic
	CteYnMZQkNGeqcOcWET2XQqKcOYwmsrkWMbJ0pxC4q5P1IEuHPsdvxhgtv8nwJMj
	eLlYzbdevde2VBDAQlhoTeN4wDCqoUkTQzfewkC0nUi/izBz0dZYYu0xfWSho4Gz
	spsuFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr1ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so716891cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139148; x=1792743948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=;
        b=g0J++iu5OD/kfTZY+bDyfsm9imBALqLpJuShmJC4ufmKQBt5X2Vf6akh8Qfw+c8d53
         z73H/5fVLEGeQFgCfCB3ttfPGsiQbDKHLcVKulYvxDrugkvkD40Hh1cGIszaoQ45tFmE
         QkvG3innlnjc1yj2Q9rXOv/Ec5ooEeA6h/CgiVmir8VXessg4+mBlR8LHNPnINxRJdNi
         oxIo5nMb5NuymurLJ3a2HPECQGTpdtGn0v6lYoV8xi69e59qHCwuARlgPbFV4NL03H3P
         TgcM9K1wRH5q7wNVlF/5PnuJbVjz4Zq4RuwAmJhr/LBGyrY3zR3fAJVUPPTQMlpiqFs6
         SzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139148; x=1792743948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGJhxOTW3VtIBueyJpZSAuUP5P7y+WiwLhN1MpOQJAk=;
        b=qPyNVg5VBDfIDAdM9WBp6ap8S/XAX3gvwScShVCBBz1KvHz4UY9oGfc+HoxsxOJRYY
         oBfXq7Nquq3zd3gqPun+O54zFuRRjsbhcW/NU97S5Lq67Q8rVlBZrTWvhHUHB/B7aoHd
         rDQ3qNhtOAqCWTycSwFnlSQOI5f4i9wOHrvUTCMPqg1vZBTSD/9saHzzw2RZGFAsmMgq
         jC1ms1M8s3bLKFmT6GVw+JJsCt+pDtBiSIG2Nzuc+VahsRg4Tdp8FG+TlWyPNQ5axYWZ
         PqcDp6F1BxxlYj36P+mf5jWCpHbpQj9ic/B1uokAEfk125en6CSVfjtMex5A+//7vlZn
         DVMQ==
X-Forwarded-Encrypted: i=1; AKwUvByq0cPTi7ToxkAUrPM8fhGchnk68kiPbntgdzLJqumSTx4uVmPyXnN4vGZGzgZhNPg246XvSYCRjxyWzf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIegvH1INle2ZReAoKMMGbc1t/Rw/LNwpvDeNR4KqcZcy6DEkyO
	PG21EqExD+rJFrbL+sEk8WmClDFVdhB3qjxGtbwbYjMNFXWTNQsljtWg7YZJWpLDR8ekx3z/550
	/t6oVTOWi/Pw591iyf0FhDRSLymcv1er/gpyLk26iF2bT0z8D6RfbnAu8arNDSuWEEwI=
X-Gm-Gg: AYBFou095ynF0PZwfIKtYfSUW9udnlQhfIem77FbLu4BS+I756R14UnJHCX/byCPA7Y
	NNzem0gTkD44iKSCc2UFllQr6yqdEU5nKeaC0RoITQ0jkgJjB1KX5sjq90Y2+eagPQ7HuVoMzh3
	Miao2VqKHlrrmdbh7iPsODQSozrN8W85+JGfWgrU4Wc0tJrifOo4sBLJhnWa6r/uKtPCGxmTKwE
	YFn8h1h9vqtlBQFvDVLQy27ZIXLLumikHA1rnpAbgc4QNJdT4qEbU/alY/vqJ5ESFm7ZgDD7IOO
	ZTptdpjT1hYgNaJA/oVKwiN6549HNAHYegFYIELBVLnCBw6kD2kex+kZZIOZ3QOPilDlZ2QCxn0
	XTUABxZ7iv9Xe06FG7dlNUA==
X-Received: by 2002:a05:620a:462c:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f1eb089dbmr140462785a.1.1792139147692;
        Fri, 16 Oct 2026 01:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f1eb089dbmr140460385a.1.1792139147241;
        Fri, 16 Oct 2026 01:25:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a132d45sm641339a12.4.2026.10.16.01.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:25:45 -0700 (PDT)
Message-ID: <3912a8d7-6e77-4287-a3e3-84e726f7205c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:25:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FZXLYp_FxZyY2a3bMJm6cDApNIepnhmw
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1df8c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=WE8o4AYwAAAA:8 a=pGLkceISAAAA:8 a=tQcTOJXxbJJ62TXxOOkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX3mUpMAHrSgwn
 NXtZMLdPcDFMphZlY5TdTD6YU0kHSl+OXAV+1UecZuyXWcci5Flp/qf/zkkJVVZo8sTghT+Co/2
 FtnxRu39AEhrQmbacTnmq9CzteIXE0c=
X-Proofpoint-GUID: FZXLYp_FxZyY2a3bMJm6cDApNIepnhmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfXyZrkVWMZ62N/
 OzzGHqlniJrkMqojyXV/KWMoaAx7Ejp1OSf6m2OH5p41xbcHw28u4dSzBbgmM9gr8jdxHsRQqUE
 rQXKB7aEglkc/i5bbVHMPsN3D2/9sdjN4zCCXaxpofcs4YmJr1cJBn3YHcX1jKoYQsggjERDXhf
 MdWYMZnmWwV+2HWFWwSvY4EMTZbf6WFfqNI8We7Y5s2m76BwHuhz0Owc9HL647Jt6MaPfm4kTUe
 PWD9HOBa7wvqCh7SKlpbzDYfqv+qDbOyB4DZ0bmoDgm7yePT/Ovgk6deFGPvkzYu1oJDbzS6lUr
 mGcpwBBtfYQtbp69s58dhio3FHaQGgp0TkoGW+B1iVooYTSgS49hW1WKh8AHLtqqEq4UhnxZ2bu
 /u7w9P109VpgJln1lRMZ63oKR12K28I3TDqg2YsONt5eiAlosShLWQmAqYiGh82+4KKUU+23hYL
 QY5S2S13w514zY2sZSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> ---

[...]

> +/*
> + * Delete following upstream (sm8250.dtsi) reserved
> + * memory mappings which are different on this device.
> + */
> +/delete-node/ &removed_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &wlan_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &npu_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &cvp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &cdsp_secure_heap;

Let's sort this list

> +
> +/ {
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_SM8250 0x10000>,

You can drop this first entry, it's for SM8250v1, which is a prototype revision

> +		      <QCOM_ID_SM8250 0x20001>;
> +	qcom,board-id = <QCOM_BOARD_ID_MTP 0x0>,
> +			<0x0 0x0>;

Likewise you should be able to drop the second 0/0 entry as it shouldn't be
meaningful

[...]

> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n &vol_down_n>;

property-n
property-names, please

also <&vol_up_n &vol_down_n> -> <&vol_up_n>, <&vol_down_l>;

> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-down {

Let's keep the nodes sorted by their node names

[...]


> +		ramoops: ramoops@b0000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xb0000000 0x0 0x400000>;
> +			record-size = <0x40000>;
> +			console-size = <0x40000>;
> +			ftrace-size =  <0x40000>;
> +			pmsg-size = <0x200000>;
> +			ecc-size = <0x0>;

The zero is the default, you can drop it


[...]

> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;

Do we know what these are connected to? Usually it'd be the fingerprint
scanner and NFC eSE

Konrad
