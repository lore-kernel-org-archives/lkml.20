Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498593;
	b=TFkb1DiLkm8lwYJgYIzGzxZ2jsvpJvI+jTiUtrMKsyFVkbKu+K5/tknoFcVCLwCl+KAB
	 KBLfcpJL3fGSLDZEmP85JDWICzDFHhq/PLLtt0xdPzfB8nGe4jmlwORxF4Zsr+tk7ADe2
	 tZ58OuQmh0iUEA/wapGMPrxAo/h/qybxAxur6x7+rGQmaxnXRdfK1odc/ZBzXLatlQj/5
	 ZqWFG5hmhaz8adbwUbNICqE7V4ZusTCPn8qlOi19i4cXYhBpa4KtjjtZbNjf+j9XDf9P8
	 zq2UfzC/J8NT0STOzm/0Z6RgDLC4zZijhpt0JX20qdCmrF02YU40GGCO+j1Odc7zYmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
	b=jgxY3G84gGB/TazDiU+977RYpa0iijXW/oB++2YHBkyfoB/hXFnAbJZfB15FNf44iy0Q
	 wcGiBdZJfsrQusvVEN2ihIfj2eQlLKi1SNfyBeY37kO9vMntjDwKMrwpxVEOAcaDpiALk
	 LNwQgPDYGSWWNGNMrVLlUk8W/rjNLqA/yjel1467616VPPtLSs3fbydc/mHL58G6ydUeE
	 mD5YR2nLBbTHnnWJadDp9Gr8I5nN/hpMMcCdNlNHSuEh9iHfpt030i5FKIOgGlzZ3rqLr
	 KBjADRgmn7pwsbrYyvgED887qrEEEip4wzClW/8xs7wjbSgJJKQlkC5K7Z6aY5uljtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D88606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JID9g8c7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXO2qyA+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtKl1929065
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=; b=JID9g8c7iiFlgzX1
	UqmCHetnxCha9hRvNy75UyVveqNRK9Qoh2Ys0EfK4f2YLibkkImOYavuzM3T+PGi
	pU1fUvnEkgSJ8Kavwe6Wh1vcsHJL3sey4cIPpStBMpZ/Kcrf+V7dCncpovHl1Gqk
	SbupoRuTBSic0JRu8civ9BGVLizEl03Vf59gsE49hsmmLInkLiw86wPvZ1JcADdK
	mU0HsACFR7UUvhwoHLduWnukN8aPwoplQlhPQQhsaren7Xs1sYm4zGiUakLZ6nF6
	ZjWqqj9+uEWtQPQQCJdxjL0ssgN0BO2nlciDmv2fjUyDU/0hx7l37WeVTQFxMJ+t
	UGcfuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntawp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:16:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338bd59032so4355951cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498591; x=1793103391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=dXO2qyA+54p2+XXONPJkrVKegExcBGR7nB65DcQ8UmBLF6mdTFIfnBW3IH0I3vYtdi
         M3bikgLZTD1NZ+LqokCa5SgJQay5sZj7pJY6XMTXRdFYqTj+SMNmWg5tLfQJ5SDLeh7t
         7d3NRaMoiGTWn0wScwygMkk841D4kjsFG6BgyRYEIvqwBTwEpSvm+Kz258Vd/MclA5Bz
         nLDSlzhq7neEpjmqeaxw0hhfhnqJ519++vVdlB3WKE7vYuAqedxKURnrNtDqmZjMEpUX
         wtePp5DKr3lVmbb5bCkSTR8KQd7EK9JFQpCREGEeNzSiAuMsRVn6Y8YOt+nqYyU8B0lK
         KAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498591; x=1793103391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbXhFwaOyFV2hFdxf8mQgggsDq2L351KmjYmqaBgfHw=;
        b=tGYXMwP0Z6tR73D60JeArfwGuNYQzE3oGxpGPKkki5NYPoZuqxE3Da2bEKPScwkE3m
         IixpbNmaZYiXV7LfY7Pi5QItvA+9y+vA7evs2ktKR0JsbMBC9hwtvo1DDp38YzossA+u
         APyZaIdX8xwx32wfPD9YAjgQUZtIiUYA7rM37yOwENMNmaB8XY7oq2ncdpVAStl+Wgg4
         bxI2oWtme+N5w3ugNy8ZGurj895waCSupX5yg+740a3Ja7avwkDd5ACdHNmLa32YOvx3
         86VA5KiNCpHi747c6ou6ckHETcgmBrphENE6ZkT3LmPM9JzF7/G+ChfTSnpLD/fCE6hw
         pUJA==
X-Forwarded-Encrypted: i=1; AKwUvBwEXJxhkPCgrCNYOR4ZMNzJSRkz7jlL+SxA61K74lre0OSuk+bxp2orrFmyXh20aIxODjqfCBgjnh2KuR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR2WraLaTbdhUsfP6LED29sw6lhRiqB7Sgnpou3vhsyVGcFqCq
	5Stx4ng41nPRtUOVwAuT5d6C62Le7wjVko9CX7i3I42ulIF7m1vwZgVGyGNMeBsHPWzW4wnPpS9
	G1p6RaVqzLQCCwZe977iZvKS1xa11Gka8bacRA8AvIhqbi8Mc4qqMOCcRMdBzObIKMEM=
X-Gm-Gg: AYBFou2O5/sYDt07FTCHBVmf2wy8c1CxvXBWLc6+xonCCPyloAZegRZ4s6Oh9TXMPKr
	C76/7K7GDCw6vaB+RbkWvwg5NdFmTV/5hXUD7596PanYP5GXBN63lh+OAKJ7Sprfose1Fz5/KOQ
	kQuX5Dx7mPih3xpD/PeF7JzmW7ht7j+ZHiI5UV+Bq6U390Wyg7UG8efSGKhxif8SLGfrSqMw5o6
	1oUqp7QokdQJky3vrllzXB4U1AmQkQ29YFO/Eyhb7MV4E/fL2f+OrsKPrQFQUQfeM5e/ozzQ44n
	/HqtlEQDaDHwTsgVNpsU/Z+X1sQ547gbYAFXl+CpyWgqhsa0LIdOMhyNi1Cq1OSuaarQLh+0rpA
	ciXTvZhq9+HK8WZtY0Ahlww==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331811cf.2.1792498591296;
        Tue, 20 Oct 2026 05:16:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr189331401cf.2.1792498590868;
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm477131966b.17.2026.10.20.05.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:30 -0700 (PDT)
Message-ID: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:16:27 +0200
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXxGhzax+AOw1u
 2TLPom/WmeB6Xs4jbbCOci0mLC3RGjLvhwO4UyYmdmBojP/i5KQcTR+8PRV9NX2P5Rj03MgsmB8
 Bma6EsAjq7xR2Ps86yn+wpbOxX7BqGE=
X-Proofpoint-GUID: AFH_XQOWe-o_tx68g6t5tEutCHeng82y
X-Proofpoint-ORIG-GUID: AFH_XQOWe-o_tx68g6t5tEutCHeng82y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXzUFgF6E0JLaQ
 LiN0eczfbZrHgRCZzP2GUw6vPI+ST58f+SXxrlihaOxgpmZPsOtsFAJEMVxa7rJd3jShvahYsCw
 qkknSzRzCqlXgP6nLGokZUx9ibnZQsVesCraSVhJNeUClbP9EB16znjdVqYwa6QwFQjqxuK+QOR
 qzIAZiOZH3OWQUmB+68Z1FSuJHQTW/+SHCfIvJNxtK33DlOQTq1ua/7Aoxp5zIdka6FB3OAfboo
 1N3BuNB0axSs/KvT+PDgVvZtPQGv1PCd0QYCInTvx5OEPrHVl5neJTH55NIKTonng8zljLap+bK
 YCiUpl/tzDz5q3rLvQfgAcSecA3RBHBYFbqKMgMzOsi2pGeepogQKUfp78HBKXLEg6IePaQM4YZ
 VusYjLScFcxq8HkpJxerkmpomtkNiHYE1XbNepOlt8rUf8qexUuUs3nihkVh4BMnpyoitBHTQ+o
 /1nyG6v0m1oHh2IQusw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad75ba0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u5ebKnrMhyFaJCspccgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 10/15/26 4:37 AM, Shawn Guo wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Add initial device tree support for the Lemans SA8255P Ride board. Enable
> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> zones for PMM8654AU sensors, and SCMI protocol nodes.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	thermal-zones {
> +		pmm8654au_0_thermal: pm8255-0-thermal {
> +			polling-delay-passive = <100>;

Do we need the polling, is there no interrupt?

[...]


> +&pcie0_ep {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> +		    &pcie0_ep_wake_default>;
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;

This GPIO reference feels like a layering violation - the previous
commit promised TLMM is abstracted away

Konrad
