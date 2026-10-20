Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497547;
	b=HfSHRHJ8lyufr3Bb5V1DhQ5BqtSKeR/eOEwIct9DTYmgKCHAiSICUFON8SoX84e4X5Yg
	 X1Brs1+2zVvj/b8sVMN7MObBFrkZkr3NI2O1nGHZCoZpgqgq3oaccQ0qWImBfq8fCLwhZ
	 Wi7u93XfY+ecEFJtRo33E2GO3uUL9KanV58efUgUrISgDFERqwuxVg9tKYmTEgiixXTal
	 X+1J9l1xtYvjAd3WK4J5hegw4e2h4Vkrjv2+BJWocjydKjC8djx8y8/omEzcNtiiKW2zz
	 LrKATkyQait/jDTV7n7Tkcrx/EUnE071K0EIjfTspc+WRMiAxv6svXXSGXSe/CbEnQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
	b=SnbT0wF4ktsy6MYusxu1B0TwbUBrJWqZmTJgPHTQxiZpNQY+837ZE+IdaWuJBrPbpMQm
	 hGdjfGhcnZPU+CBq18EHwJkgDsabuStyj65q1SjhIROym2NNrKF7z1m/h8xMBC4vF/yj8
	 6iE+7CCEzsTzd2Jhm4OzHpAQi2OKLecqvNB4RUEeAeJoJoUmjPeB+e8PvULkAVGdn0SVV
	 XRk4NlIXA132PNFVRJv/41LJ6PAGDk8R76Fd8YP/tbv0/z4j4L/rykJgdlv21a8k0f4a8
	 XOViVsh6ADVEYFu5i7m0WdZP15/LoqYabFa3duZBUJAbAsGXZRaMDVINKVcLxebj7YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532560A263A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B532560A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWUOE1571779
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=; b=CP2iwbvoj9AxplqB
	XtEYnOAUryPZSXQz4b96sLKEmHLqgy49V3FSllEBqwBhizNXO+xoEJBm+/bkr0W7
	CCc7PrY5HGU6jL6GUxJ30LcaQFSiggwWq2ll/apkteFfT6rXPts1PQN/9dnF9OtM
	l6NH4bLEyOr758vBG0QovrfpdRgPMfQrGn5LmKDxbtqBV3ph/H3CvAAa3yOmaBXh
	+LyksrSIHbFLC1TiaJP1fKYAsG/SAmDiRuo0jm1CimGtqPy+HQmVbhm1MmBBhAIW
	8AhZgXdKY7PxKoHn4idEsUwoSkvA+bd+xW+B1PCq0TeIRgYbYPQc6WaV8qu031Wt
	/qctwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h282kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338bd59032so4330411cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497545; x=1793102345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=HgGCpnxEBhkge1Z49EB/vhEsdhD5eMkHr79IrTXLfgO8apUtxkGbp455cpaRctktyD
         ymHeGB3N9kFZ37Mtzm09nXf4I8i0yXsIDE6+fWIs9SmhYwG1KM9cnYQHwj8Y8LzwMt3I
         DWT8CL1Xe0IkNfZ7itIcLHXMcozf3fgOcXypUR8FDhZBYgkKN/rZmhnoguPZ55ZFwK0o
         V4aN5R19CJ77J77Jzrr1CkZA5z+JfuFX+jYwgMtrXy46qUiMu8tnA9IKrhGsnG2nURMR
         g/3xNcasxFJ/kngRK7oIG1fm/ETOtEKol8tOfgi80e7dwAsqgLZBXza8REu+azigZzsf
         GS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497545; x=1793102345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=j5eBy4VmMQpLZNPNUAbaM9wLGZBB4ewoyrKXBTpRoIY+r3XENrRtkSW3UZ+j+4OzDb
         Skevak+rfsnBvcIbsvRzTQYTqarqIFEzjdnbYXFsVXHlLww8C2T4kon5C1/zB1xoonrH
         JjYRQZVZMsmM7mNlhP6PwxloxKOGsGiSBjywKShEkfOwL1aZ/uvKwq4H3EQOQ2pHPFlE
         vySiUY+omfSjF8jk+s3OxRMGIyx0HHQ4o7sy2bsjeh4I/wwRLf8g0JVrobax3w4efSPe
         0lGrUVRH/TDp/2c70Wh7QlHB/8seMOIz7N8SfmaSBOOn0E5q4s4R12wbZF+cO5zQvAUL
         LZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOAx3CBiNLN1bB1u8fz6VGJehEbPPaVv23MowkQFLHQbwsyFbVrsdLwcg5M6AaOMy1aXTsQMLAnXyWdVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR3NaklVGgS1WBXfdO+uCygcD2nI6s078XEn2lHGo/a658hIhz
	lZB6fX6ANVqZlvkdOrjYcQtAXiP6IZ6eZkEDw47FZa+nADYJW3Rkcur44KCxMKdeCyjGV/g2EY4
	tz+Q356NFXbkz81q6kJd+Vc7nNQzdIdwXtIYiysFE6fKoDTzIVE0oIAm+iNT0TShXEK4=
X-Gm-Gg: AYBFou2eJRDPwymGJTRSNBpdWSNz/ihN/xyEuatYa8vfoy3mdZ/f5AebGp3YzKdCJxV
	nwkjlHHB4Go7MeACAU5SvBVxKTZ3y8Tv2w+ijleQMd8F5HxgkQJ+yGwMLPez30ZoE9TLOdczxwP
	Lbw+oK8XEru1YW0YA/hbeIcaCnQOS7Szw8QambsBxCJ+tdp8+nn3JRiGL0t3EGc3v2+wTip9oth
	9CqgKQNa4bELGw+StHh50mjSZTN7W1AFHYF6jqpA2+GkJdyXD9RuI+HzCRZkegd8ziXt16wZ6+4
	NQpLj2zMFC4ETbw+j5acdO/WappQUyvZJSqC1s7Bg3XPDaWfXjey7r4wPGiSKCh2c6ve0t4J6lS
	5RKocSks=
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543851cf.5.1792497545060;
        Tue, 20 Oct 2026 04:59:05 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543371cf.5.1792497544441;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm476375366b.5.2026.10.20.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:59:03 -0700 (PDT)
Message-ID: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:00 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e9kP-oyJkAa9v14NEf8E3JslIhevjdD6
X-Proofpoint-ORIG-GUID: e9kP-oyJkAa9v14NEf8E3JslIhevjdD6
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad75789 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2J1e7r4m5WDM-kp8FRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXxj8YTaIPyurf
 KNt0UZvvZWm4wCvvMOlxptGlKV5TIZRu8u9ok9p7pi8+r7dvbdl+NhL+lJkl5gchGxcY6LYpqy/
 4j53VvTBerjRLtnHF/77JtO58l1A8Ns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7RY2Q1uRZRHi
 vGSCswYNbvVNXkHscgFw5cSp8kzUFWyjkDaisIU3qF9QWhdW7s/2ZzLp9UiIurfU8lEMggOwui3
 Fnt/6qaRJtItbmIbaZfo1E0vBMrWn573sYeEbicIgeJQYGhv5Fo6fgyInb103CEMK/6fPOaO2qS
 7+r8125EDkvIhUCSIg1WsszZ/pyqHTr2w3Sm5mqxxGov9QBN65QEB+FYXx5nUrIOWiJYT5qRFFV
 42aDVxLxBHgCD5MrxuguUUhrhUAAX8OMvB/6TdtLWCIAHkUNQBGaIWMmQ1YjglJt5e3Dylnm9K/
 DrSmUMQSztAZU37OevmFXcENV+dq1tC1wfJzUVxVIk9ll8Epdv4sx2SPJYU6OfDaJn0/1iIb708
 sED8hk+iiYhRuy1WGlM385DzjVC9V/SQN6Y64mTCNXmMGL5b5pFudUHfdcJMp+6SnQFpRkJZbtv
 Bb7nkYxvgAArlvFV5yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

[...]

> -				nsp-critical {
> +				nsp_alert1: nsp-alert1 {
>  					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

No "hot" points? And no throttling at all until 115?

> +
> +				nsp-critical {
> +					temperature = <118000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nsp_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Please align the arguments so that we have:

<&foo bar
 FOO BAR>

instead of

<&foo bar
FOO BAR>


Konrad
