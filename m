Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963541;
	b=172JL64YBur32EAloyYy95aOaDa5Knl8gI9c+jkJR6odIdjdtgXjo6Cle+az/ltVdiK+
	 4GRErC/0CjBQJ0v18PLELAbg5pY2XhlSMzNLh+WvfxEmtZcpX1/5WqpgWTNTEZ87sUfEv
	 9wpg8wRZwzg3Xbz9F4uHWhPywFrVOAsV2zWdHUVkSO3nNeetAWE2ZoJ/NL5QGao0cmHiL
	 ECn1hQqT9B5+G4RVlRKs50K9FevT0z1lBsRpiSTs3scS3bL5+Op6+PJaxMD6qk59v/MlL
	 URdpFpSNZb7E6aUl5oeaeSZKzPebVS6l6JuqJROXNYS556wyqzimzAh4EymQY8L4s0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
	b=C++lHWI1UV0P7NV2OPheZsbeHk4izS+1lFsQ5ZkD0uqDmt4cXHaA2VbOzWJY0fc2QUzS
	 1UqkLiSJUDXM3F/HjPcCYozSFtMrQcdCTJ3KheILEp8eWy20x1CrqzuHOFh/U3Tuq0YY+
	 GofTHEVdSpbfW1kwxsOrwRHu9P5XVX8kph1PcbxGPj/aAchm7kyyTuOuO801wUgMaC7dt
	 EVFV/CmJQf36nFbsfRzVDne9hoz5z2cfx6w+RNhDsuei0KuTHU7vjNvBNp/9WTWep5pgR
	 4IvGxU2Bsz9RnHoafLSPfSae2t4c7AgUy3STQTFhYMD3lptsFdYXukq7oUg9BNxOWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B092606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B092606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP4SA2731798
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 11:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=; b=m77hjIecq+EtZy7I
	UWrtloMxqxzCaZ/Hsoy+bKxsZ3BAEYaC3etLDzVq/+WCa+BrCbFBVlEUEXHSQPrJ
	xp8ppoXjWPv17Sd/k6/oPBKojUd/9U0fyuUcgzrkK0wfuj0atyypUIEXNVOpfC/B
	OpvOUpgkkNKYoMvu01v9FzG+IlNiTuiWVJ8d1rwI9zi/Pu20hDUmAtft1D/Nlf4c
	ew+lUx4FJwbeuByDkuoJpkhrGVBy+1XXQch/J1Nh9v56aMH4GxmYRo4SNiGVIeh0
	OVSgEcN7K3HIosDobFX/uw89oOiOz9Nem1PwBQiStyJC7NnbrUe9B+NihPkVEBPw
	g5HWDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ak71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:12:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so6845285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963539; x=1794568339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=cDkfHMaFJKtAcJEtgzsmZx7PCwN8S5MHNPfY2AxbF1StCQA5fBpYlNbfvvC3S+byLg
         x0SJ9NhOBf+pTNXpNG/dGzKL0wOvxbZLFHeT08+OMLXZb5xAVeBFj99ukq/52/K8otGN
         5qXSJ54TLPwO+xvLQWXjULP2ikHLP+ATwI3inVs/bOD0+SzG6LmCsaA613y4fRWfvfg5
         lO+L5D5RSyxifm41zES+M7q94p/W7KmKiJs0nlqjO7/EiT+vT6x+t2b43q9TODcIWUmh
         Ia8vbrWOM06HClAh3/gPeiFFt6VmUmoifPL5THCg6CJre7NlFnNiFFUkZEDvDCUKg9xI
         JPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963539; x=1794568339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=kcx0lQbD7/KRaUvRb07DSPB8SvNbSCQwOaKDgPZBflr/CdWSRM2dTV5LuItTzq3Fpf
         lnGWWjOiuhUYEfN9ztCYicl3taSrjSoqU2E6/CwmGvXVnV+QjCnkd5tXj47rOVDhxcvx
         7iHC4/ErdsCbRJbGWLpdTRZNRJqQebte0tHWZSiUQ+e7dOaquwVwL+JvFhD+00HlLr9d
         PuwiTSzusEvdgdOmWHe34m7HdZd91SoEK0iyGRNMoluERTXQ0SWEjOXxrek3+v4xDe6g
         jM6PsGQgmF6HFGScmHXj9hIjrFWabR4xliRAjJkgiu/RGgjflA0yusNUOwxvBJvHqY/+
         OPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBycwQkIgEpbVkAWdGwpaJiqG0hCyUbngJsdQ3vZwnHDE+MXm9YsAUbYxaqT2eySlKcfr9uQQGlCh/YXCUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uBR48a9HYbaIexjxwnx3zp0z8oUP5jUr8cti3SfpIaFz6RcEu
	CDt80j7HvfRGnV8MsgYcNaRtfhthwOVLaFhCa7knpZeq7h9VtslB5sLhGqwcBJJA5kl/81t57UN
	QcI6/ohYLpP1enSfImZLnTaoc6O603+hPwGKEXcKHCeEUA80z/nGnOpagac9XRt6Sx4A=
X-Gm-Gg: AYBFou0d3opwqjPAoDin73gW83tr5nmGkawNfHGCkK7Ys0f5oaAiOOl7mIW/lZnsQVU
	0obQ17ZNCJ8q4i8WZku5ywXOh7X0Ek0eh2RUl3ghdYGTL/7uIlWPOjN8P0DhMqDJUrzOU4QSyUl
	zm4L5iFRQgn1vWMoxW7vV79e8WBIy9kvBET4JnHSsZ/itOlsuWNfk6M843P+0v3gHX/Qc/7JoEv
	yfGz6X092BiTkbDLwKG0lJaCgyuxVPbftbKz/ovjg0BHxE7BLvtPk/KjUQe2+L2LuK2HH67ZFRZ
	1uVEcpT6ubNHbKH9LBnXLJKemqce3Lb6SdFlMR0lU/8e4IgFmvL9B23GtvCdciQN7MJ273WHrPI
	lsHLFgztorM1Vwv3q+OVUlsQAMNxhhLECEWjIU46AHt7maHn0pl7uC/1hrjeZGnFXjTO2dg==
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299337985a.4.1793963539353;
        Fri, 06 Nov 2026 03:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299333185a.4.1793963538744;
        Fri, 06 Nov 2026 03:12:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566f7fdsm73268566b.31.2026.11.06.03.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:12:17 -0800 (PST)
Message-ID: <72bed879-9f21-4823-a1ab-7d8613d70dea@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:12:15 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Drop undocumented
 'qcom,ipq6018-wcss-pil'
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103225845.984564-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103225845.984564-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gZ93qLv-Psau8pUOukViCyHPxOCWRCqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX95MRg1jbzcIi
 jqsCjJ3cq7MM6fAjazJfuKAhd8xFIN+FbFEtRCTHBqbfQ1sr8VjTMuvICmqHypSiy20oYIM3YKa
 37+NUiSXTHtUprVclu14iIe3ltNJxG1U5v28Xs4lRZ5sKZmLCgGut2jbd1ZzqM3kApEKVmNGdKo
 3v9DjOGcR3CMgvmPkqQ/a3jlLcv3LqiC/WIecGxyPPfU9ybRuw79QpD4VyUoDa8N/6kezl03uF4
 f/dQSEl0gyh008b4C6Yw4uOQFi7lgdKq5Jv6+d9gmK4OkJmZjbCcWtEeC2bzn6HvWqlRaYe9cZm
 tFeEcy+UVN+N84J45wlrmURjAsboGB4M0xBVumf7ILIYnX0ZkS958dhp9zxQ5Dz2CdQA91FQhts
 qWf+oB4a+HhLxRTTFSdvxBxNQu2bo5RuT9UbvtBvXgEFfbwgZDieU++bBjgX71pwY3IqNdVwGGJ
 eKAqu14LK2cVX+whjEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX442V89K4pFnF
 G7zc+0f3/Y7+QTHQTHMnWfkcG1UZv9PzgUTufJ6Oeg1n5jfeBgwyxGvD3Cw7MqS8FAtMqHsrpb4
 5rDLjFlsBlTKbxlN3btTW1hqdHr63wE=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedb614 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BGlS9vUawJadlalJgwIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gZ93qLv-Psau8pUOukViCyHPxOCWRCqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 11:58 PM, Rob Herring (Arm) wrote:
> The 'qcom,ipq6018-wcss-pil' is not documented nor used by any driver in
> the kernel, so remove it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Alternatively, remoteproc/qcom,q6v5.txt can be converted and this
> compatible added. I have a WIP patch if someone wants to pick that up.
> ---

I would gladly use the opportunity to make sure the next person that
touches this validates it on hw.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
