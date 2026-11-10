Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309933;
	b=lnEjd8mJ3+TEoVJ1lqyZpjpMJHORw6qFnzs35tcXgpkFHloaCWohPU/cCxiBwCxczV4S
	 Qt+6z98wFnfDvm9r2Yli18o0lgwVf4MpFs4Beuc1tgBsJvUsEfmQrfpu7Krg9QxANmyXz
	 q8oIFWPGvdzSQ22FuAcnb6qbo5RirFoRXOhZPL/HQ3s/vWV0dZDHwvC0SpeIW+54gCgUX
	 3Y2nKPa+A2gpb+JhTkXgFgPDdH+3RXItjtdWHvvGeEHYLz4bZ15GzgPldQBIfSvwWH6V1
	 UAy0VWCIgrm+la63g+Yx9AquQBa+JXA2xr7fSZppa0t4KEtIIS53x+As7V+npOsRyDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
	b=QR+XcckcNniGlLPqo3/nVR+eNUDNhhQo8KLxBSD/WOb+SgBZiNAGkd00LY9g8sVNZ1S0
	 tXUnUnC3Hh7JliB23+Q+31dZHL2GTJzoPXl6hiAGhX48tPmYbcf0fXV4D1PJWrcfpSzyG
	 27GziBLhU3enOkqvIgB2Oi81E/dmH50xwRq78P3MxmQHRAfAnfByjhrY25AzimZRcOI0+
	 Hl0sA7fW3K3J4DA2TtkXlQDHE8eDmRGOuK/lK88nKU3y+2VDq8Br+2kNiRTq44OXjnKc2
	 IdLlN1d51/Bmk3OlB9G+YOgWra4Ic3svoNGIhytsFXM2pW+SKGu8/6ap0mVu3vrFKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCA60A5BCC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DCA60A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGZd3839765
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=; b=SsVTADHcHBKzYavb
	nLGn+1vz37WypDtAQXwl9WLGZkVuoQ4m1NRqcSaxdHThnyYTnO0hVcmigznimkrC
	RBBSvTFukyiqAcq2iPekfLjEW47+v7j55zYxvWlTbjYTlnAmgH4RIsmrpCwOtz1E
	yg7YplOeUaClzVsIoGY4g6tPDU19Cavo4Wj+6RzgQXM6f/meoRHJEAefXIJUL0a8
	BSP7uwfY3ZX46ZIPVeAf1WN6DyxiQKxmUxe8SbjvUWDSs+RHPcX9rtLACiw4Q3bv
	lupQCnp2RpGoXvH7pMkjuX7GB6p6qAuKX6f1nHsa4rO3g/E3cz0tvqs5myKQ8cwi
	5nw72A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg36v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so256835eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309931; x=1794914731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=AWDHXQ7+lkQeHnXLSfs8jAiAlq9QzOGFG9K/KfEFyIZL9sbAxgjqymFR0SqlWk5QPw
         a2Ct0zfthtspI97wnZNxiQOig+ivpeUDpduHk20ZyXzdT17H3UnCQ/gbMvuvt5r23ImF
         GSSZ5JBHjHIPpT+yjzVIqd6HkJ4I64h5Id1L0GKobEzk5L4yWWhpZbP32TDisqlO8/35
         JpaC4bEniXPCptKwU0pvuxwyF6hGMmAx/Fn2cnyPUJ/io7RTzuvKOk5mJ4QqmMCjsM1+
         g7BGMi/CVzDv/l2eIu7j6AOpoxKl8VtP8vbbiEL9MBY65ZdodMespu2NLO7y/XpRzIfx
         wXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309931; x=1794914731;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=QpoiP3Tg6AJSj9K92opcPu86z8hSrAbEzLiK7PSHJCIVBg4aOfp/M8UQwtroeuzE+a
         sAwlFQ9gjFgB1WdIfU6S4N/LOnnz5krkVFpxZb/WkvOD2lBGgIb3czfZe9r9ZMVPS+TH
         z8xWhNpkDa4WuIpgwQCpv9yFkGTHyOQZbVfEBtjUYKEQ9GWOI/aAWa1NyBfc2fNHaqWn
         EWRjR5cL5rdZ0KQnOvaGfn76Ommn/uG+F+EK8GrhnR0XGLToCKHcEIr2CSKgS8gDO2MK
         L5rWEOLS3lSk6m7fVuwi1CJ2SsBvbkV6pUiAJWZotGx/fU+CbrVLHVy1r0n3m2gpCckU
         Vlsg==
X-Forwarded-Encrypted: i=1; AL+hErFz5+onSRQj/+ghzh+Vxmm6lDE/h+JeCYbRtJpu0xGkqwZ3Gj74r/E+Q+GTAY1ML9x/tly2G+n0kTXs4v8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F2VdBjjbieyGvHq+dBzU+WcXPh6wdWaXt7l1oNZuUnY96gwTW
	PAEUCQAXC2rPtUzwhJiKmOEu0YnqT4JESmFBLcD23wRVyNg/YTCFM984iKTBaFJgGzutz+qQTtm
	LJy15+PSbkasHIQo8cMH7PgWF4ylSdOnLPhc68uFo/EaxwX725fG+COLqT6Pu97JneNsRSOiIyV
	w=
X-Gm-Gg: AYBFou2+QENligrmsiNlEEVuJsEyft3+qNTcsJSJtlMOUrIj6sbxC3HK1EAiAhe71eX
	RgvuaowLyQB70oDwJm8BurK9c1ulRRyDgwyT5VBpZIE+qobuPMM3BbX+6zGDtf41aK+X4Senk9m
	P93frxneRdCWir1dA6F3THeLdGvY56u8ZC8DUBxpy8CmWN+C9fNWX7BY2VlzGhC1K0pFbc4RgBL
	mij8rofLcXxNcZaAsby1f8ctpSBpBTR/ZjC9q44VbFOOevHMfcMxVSC3TsHEn8L90kwePpx79Tg
	+o/tqtsF+9UZNahAc2zFkEgeIca5uUM3vk4CeYs7VAzFc211baLvOBUmSSufRQ3mzBB+nPk5vyc
	ACUej5hYyD1SO/af2FQ74KAC12gWeWfhmeTpTX/Cjyj87+k3OnHfgJRhig4gp3NvJXXWUOpef0n
	mJ
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806037eec.18.1794309930878;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806016eec.18.1794309930393;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm11890587eec.29.2026.11.10.03.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Message-ID: <6f94633d-b134-4b1d-885b-13fea6334767@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:22 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
 <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Language: en-US
In-Reply-To: <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX0H/XGZWI2Qy0
 UOFpmcCSK6vbEmx0XVlsdmOnArWfZ1/CkjICPLms489J/6ivJ1Dbbn12qkJW3CxkWLEqTYiZYoT
 nFbxFxlaqqG4j3GJGP5+oE1fDyRk61IEGQbPSEoeIkXIEynB9Py9wawuM221nVy9FiPh539tnea
 eGAEwDh4XYyHLPZJfv6Rdb7cK7APpgkjw8eUEpu85tcXOuHZWYjpiMgwVmwShwlIOpROaX89G+X
 pocWnl9m+8KdrgeT/Zq71JG36BqHh9czTqxNWYc+0aNDYxB+rmvuog34u1Gc9I5MZZtLdrbMGbU
 DKfgXeWW3mWlzcnXELXW/tUqReET13cuMPokqt7fS38kATIJDRsW71KABpUAyojLcEEiiZgs1Rm
 4aMnkdTkhbfp3Jdy626/IH35Uh8m+pfDoSEAsRGyp0wTDJ6tvV2NM303BotmyJNtT5ety+Ezhw4
 gdi+N9FUgPW8HVKdESQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX1Ti+RujWcPYi
 SseBFMTamjv2ivS3OL0QbMqQtZAfgb0+wVZS1dB4Y8X9igB6LfsJmYQ/TSWnp+z4Hl8fUON4+VQ
 MtGVXjEpq9tvUUsnDv2G/Xf7Ysyrbg8=
X-Proofpoint-GUID: ZrO28GN_A1m1Ck2Imdeth25DjaO8IVp0
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2ff2b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FDn66hFibwGTVsjr8H0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ZrO28GN_A1m1Ck2Imdeth25DjaO8IVp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045



On 10-11-2026 14:53, Krzysztof Kozlowski wrote:
> How could my tag go back in time?
> 
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Who received the tag and what was happening with this patchset in
> between?

You are right, the trailer ordering in v4 is wrong.

Your Reviewed-by was received on-list for v3 and carried forward to v4, but I
placed the collected trailers in the wrong order.

I will fix the tag history/order in the next version, and use b4 trailers -u
to collect trailers properly going forward.

Sorry for the confusion.

-- 
Regards,
Nihal Kumar Gupta

