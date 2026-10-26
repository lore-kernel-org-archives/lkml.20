Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028204;
	b=WMbbM85/dXC4wVjYa/oMa69wDBZRLXfN/wURjkAZHhOekPTar+jHEYcvbtTm+Wxfk4Z0
	 ZARPdnszuWUl6HsC9UUMFL5cIs897l8ZktwzemQNoyBpLPVscfDQoRaqbn6pIruTMkGnT
	 GIQrlFyzTtKSaamzDjF/zvxPBk5l0fvIVG7BZsxEc7KKxnCuYi0trpycDu+wOQ+aog8zg
	 bCTXLqWIMHUBLljGneI4ou+zDbGmHv2YT59OjiWz8yDNa4MfIaNfqObdVCZXNOidjBYNH
	 hOkUbLsBFQcRUwOEcpyky0YL1JA2LFudOHHm0mUzsRr/XyAH7hUd9aYNYImQMQMNl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
	b=MYW41KChLIwM12lPMLpCG0+sesQskrJYf8aCqhoTpQOzV6O9DbX4zJ7+jjkvrr3e9jCK
	 3D11zDD8rpzfgGF3nWuHkdY5K4v76f4ln9BOhkhAU2CGOmoY9V7z4qq6A/VpfYusHwmoT
	 dZ3L01hbxcNQYpXnCdC6CpNzV9JheghzhIPczZZjmGfeRmQZhWPonvedMsxpHx6XjRbeU
	 gkzYH7Ca+FCjWPebDkAylBMTFrfjSe5GXXsGMBv32X7IJ+bfuF/SsmxtrObuiOaLdimNP
	 mmgCNJZbYbMX9m+v6XTyttaraJCjf1hzgGv8LUOaQ1Pe0Bkz/YX3FGjokC7OWwpSEqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02898606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02898606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvsE53268523
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=; b=X8Yh7B4hAj0G/9xe
	ICC4+VLiYMkTqBhIkJgiW9x2LBO4LhbYRQlByj9Vic+fdyMqxWn+RvLBQGPiJKOz
	/IJoivyTBEYmqF7B1DmHSA+r6hg3E0XZrL/+23i2OsAAjF+/e6DoVLhdKHSLcMBJ
	Wm6/xIkhUir1rcNpys8TTtrsiRBxP6VjXDHcaax3JKpFuJnuxpoPEmnWKb6tjLey
	8YTWnhbdHQdTSHkxAyV6BvuCQ1myxXsMb1uImUa/8NrAscuaeYL14xZuPXoSYW/k
	kzRez+zerfHavCv1F3JCOGGOoaosES4BOUu3xkeHwvzxxhB+gWFpGyaPCNN4vIlS
	B3LNoA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9ayn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:23:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9906eae4fb4so25063241.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028202; x=1793633002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=CWAx7qxi96ibgnYmEOPfuJRnb9zoK14LGae6i8hCzDNhCHd2l7YEsJvT12NLQG8oY5
         UGJsJP/+U2K5SMrMjLI1SoYBVw+g33tc1j83wM6Sa7OwbfbLTlwFWXoiY6EnmS1YgedR
         s5HIt9W+2vYs4KTow19BQypt9slUZrQIyjcSZy2UgQUF6cxsUnk86OMN9avtPL6aeYND
         u267oOxO/OpcSgbrPXi586G8RY3+QmXT1bEWyi5yCMO5MrnOUcssr0D+vY86BfT5bwbp
         Rn9gHNmIjCrrtkxVmmXPr+ge/it7M7kJjnmSNEYhBb+eIEZmjz5fuBAfUYF9I2NlSJtD
         L6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028202; x=1793633002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=b1FigibL1w9lBQ7K+y2OgZ18ptjeAZ528vLZ7Ouar6TfTiTIDVxoUAsHUgztYZTY3k
         6f9a+WlcbJ30hHQEJZbPS9NusKhK8aS409dZAjR92YsmsOBbxifrSTScE0BOEToW+GPr
         b8Nx6qr0nxbkgcSbzb7dSKLdGaDDPXC+7eTKF7XwybQVCPX2DwlLDKaDrBfYk4s8/QOd
         3B74aVQktOxUZ153/QVXj5hvBIrkX6PxOanaZLZq5TrQWfWedEuxR/mStoFt4h0Lzj+o
         HLhgY8ME2YqZEf4gV3m2Dty97xsBgQTuVLIPrNZO4Llai2+gJIs1dnReuXCqc8Y0R0MZ
         gxEA==
X-Forwarded-Encrypted: i=1; AKwUvByoiZy9jxJCa9GxnF7V93W+mMfJ4SkXmV0en5lbCpUSAUOcF2VX5lrcKQTosiIxfZhypnO3+45TNO9LVfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgL8tF7GpLe7rqYs4MmLzDPjkO5F/R/gUllgWDkkrWW9wdDpMM
	/SE5gwQrMzF2IJerqjscj5cAK044qksHgewXmdHM6O4wRfSYLSfskjFBMhgYO2hjrUiCTaAQF7z
	i4EBEjk0OPo90trN+nszYQtFiSn8raXIEjozMbSZm+Kg5V9m8QEP5S8cJw7FoDe8+DYA=
X-Gm-Gg: AYBFou1elH68CPIZaxfldT/khX4eCmE/XyRHUkBXoP/eYQo3Qqki15kx1QhnCK+mm5D
	Ai0Jfv0QfGF9eChde5Ttik1RY+tdQWNcbSVTPFp10xZ/5lXJjzIi5429L26sky6SAflHiHSOAe4
	l9iXEa2TGP0jC4rOrFOFPDYQX15kBBKlr3efEBItr5wvARcuRObXpifa7xwLzUTWKBfn0KjyvYV
	PcQz7AQfTTKo/v1aAAXUTNnjc5oYsVvqR93m3L1dWJtdkAkvOLAd4LQurM1PZj9bKAtiYKnu/f8
	0rGcJYTOjBzuvBrdXxUPN7hc1GHEBLIdNKmeBGpKzO3S8xQbkxMnoO59SqY/Ga813hksmh0pQb4
	3Vl9w/jzHMK/orIk1jfUqRg==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378632e0c.2.1793028202199;
        Mon, 26 Oct 2026 08:23:22 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378572e0c.2.1793028201524;
        Mon, 26 Oct 2026 08:23:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8c4sm335085266b.47.2026.10.26.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:23:20 -0700 (PDT)
Message-ID: <a2477a12-6259-4e1e-ad4e-e2fe41aeae1f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:23:18 +0100
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
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
 <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX2uHYRJ6NiD+1
 +zG4XkN91JXxo46LQADBIAVQ3+37B+1VEIeVXnF2L2iOhpjXcybeaGf6L0MLsUJBATM9Zp4dXjA
 gbHuGbdkxSQoU4MZoZ/+eQuSs0RG1mDKWkPWX6frr+d3ZavYVi4OPyC/RVVsxxfl2bLVF5P4kp8
 z8pMoDlC4y3fL+2W3wIPbUaLotDkuU+ozPLf6vn0RaUlrr9823GtL/ZyGhWVXzubUpuWkudNVba
 1QaOO6iRXBCnnICmHIIBYAX1rPYNbo4m4byEojK5EJxaYa0KcGJ4n/jkOvcwvOPrmzgirtSJA52
 AKTw7t/k/NXqv1yIOImNIbiyBYd8/Eoyuxmur4W/Qx54zA13l69d2akuI9tndvsLm2lGk9l+lPz
 N3knn/8L7+wFlUVVQYRaU6BzD3iIDJgI8Mxg82A7ux4uuuboYtLQTOksZEjxGh83733a19u8afk
 fcbTuwT6moUaRo8KHng==
X-Proofpoint-GUID: U9JTg0YV8mEGTcY4V8WIZpAjPUe_4txr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX7RAl8sGiBA9g
 t8cz0Kl5EsReXDdqJjI8xoTlgAJjmhEs9R7sdINjLidFjy/8Ke4K2j1zw4agdET1kUy5C9oJphr
 WTrOhnvH16EzFdWglecStUSzw1pGPRs=
X-Proofpoint-ORIG-GUID: U9JTg0YV8mEGTcY4V8WIZpAjPUe_4txr
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf706a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-OgLTNqWArPnvb7kmGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260061

On 9/20/26 9:54 AM, Mukesh Ojha wrote:
> On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
>> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
>>> The reserved region wlan_ce_mem is device memory used by the WCN6750
>>> firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
>>> erroneous — the region must remain present regardless of whether the
>>> underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
>>> both board files.
>>
>> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
>> matter, no?
> 
> This region is used by the WLAN driver when Linux is at EL2, and similar to
> Kodiak Chrome, Kodiak IOT also needs to use it.

Right, it's a sneaky iommu_map

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
