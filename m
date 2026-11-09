Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214478;
	b=sd137b4Ie6cei8X5SUp7044OfsGXlpqazz0XeUdc/MKVDiN+fAj6uW9RO/GekqKNuj4V
	 0Xz92hM9b0Phvm+H+nzmew8bOBKb3Ft6UTuek03oHl4DdML+7q5nODZLX7RNW8A1jCLKR
	 4r9egUgzdXacM5rMNmKC/Z8W5I0yaXBW+WpOZ6hMGNgDQwprASP2/0dmbp4fZrmzvE7lH
	 rL3MzCE6Sy5r9aFX9k4wynzzMRuk+sJtwjMuhGjGUmfIMSPSiO6OUE5YS8OdD037GnrJh
	 Gsbd5x6RKU4BhLbiSMSzOODIBDXEUr2QAzsvxWPSk7TjsJddmBWX7EvjjqLQDNLoT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
	b=GnJGxWxWsGBcUKZovDliBju59r6/YLy9wONq6ZIxjx5zBLrPtECfgUVjgbqZNIU/iwlL
	 HxAPJKi/1mSuccfCyhlgYW3ZM75LjjFk8FEFI/QHTBQR0ka4hRI908swBky9LVkei4zK6
	 rDQkNibcQaJFLthv9PYWmqyeStuC1KnUIXXcRfHn/yFRx1Unh8nxuOA8UnGBmb4FP3obA
	 a0ivmii40pRCCTeRvSe5Ct44ShOaALLFMEtlHLGSkm13TjmloOhHiD1mqkyS4xqGjK8sS
	 EPabvoDAMf5GICeVYshGLkVnoANbGQN3YgoH96L3pAprnNImb0oyjU9ZgwRBFuDkI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJeBRbTv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC6F606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC6F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJeBRbTv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AEVr481292
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQf4RM779oS0Lz1Z3sQeMmPM
	DiOPPiuMG27R11kbwhw=; b=DdOJy33Zj+gGloeoGU0YcrU/rBuBrM8MfaDICyyX
	n2WzCtTAZ42ZIxsnzjTL9PhWCB1PMX5vHqJsEznDaayNSyOUnCL9YjlbB9DvYa7+
	SmId5DTFW9F43yVDih/KUy1TGn1gfva7yl7hZwG+46G1dqKyPJQb/E6bUllMjx5y
	QJpeYTh4xafgu8EEZI9syRbPEB3DpR70tP+h32QV5uTXiY6wicVDiJXXCRKyb6KN
	AJ/Qo6ZwOchptXmAv3MEiyh1YB/KKEx7no9iTetUiO+Bw8fGEUhlDI71D0vQV+TO
	O/RuR4wTDSHabp17rCz+bXLSu0/3vSM9hdeAFRkwBm4p/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdn0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so123770285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214476; x=1794819276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=HJeBRbTvguh39nPevmBYDDhEXLGfAjm5qqqy6nkorKRF5Sq7px4TC8xZxitDJwchhY
         X5BM+QekKNInY3VktuUgrLUIdudyDhYTs9fSxWeuevjBGBL1y5dSmhcOwi9ls1t3RfVA
         xxDYt/PkGUXfgbaDuX/o4I2U+P2DzqElckJfuke21ISxgIsiVzQvqDC3u9gI3FBgWJqs
         7i9Szs7r71Uc4yUPKfmRTOeB04K25lOcBnjfKPusrPVvcVnMbCqDAnSKG+6OMHaTewdH
         KOfpN6fFGkExoWC8gAMxgTkAoNjM0ObElz7bIJxJbeX1GoGzwK51m8sFikB8p0fbVu5o
         KHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214476; x=1794819276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=TKtIx3QfnXipBYnwRMHMrExoeqZDtHzNolfmHGZ1Z8WuHiSGJLwjHRXKZxXmeXHB8D
         mINBgyH497dfOnErm00wLUlmK4L2g+doGBPWhigPtwiotdAbt3OF5mvhAnI41W/t8Gw7
         j9dhvyosnWkGw2q1sOzPSVoHR5BYTON7s3cibqqFn3mJuTqn3EvapjgYiBK+C7vW439Z
         jCDYiBeOuHQy/hTU9eQQx7W/9gSE/DJXrr+ObVkKpQa0oK+anSISqslbh/VPg6oF/U7+
         3aN7jcejo8uSb1HMf3ZjEX1+KH09TAlwRpxrzjvd1HA/MepnO5YU0hou2j9qc2eSMxdy
         b5Iw==
X-Forwarded-Encrypted: i=1; AL+hErF/SWTlmz1w6LUTeVJW8TYsCWHLg9bro3IZW7IyEHlG7sXKnHJ+QnqRwfc0eD62HyffaAZdXyJNXP0SRUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bk57lORi7+MkNmDpZ73bsSPCFLUIm+lGBBnT0nXyQ+Cf8iRAA
	oRBmLn9DQ7Zy78KL4ZP1OP3nABsx5ff4SltEXHNdhf9cDaGkOQzVyzpqkX+ORFP141wIDViYBgF
	AhdNIRYJMcKC09WtTLzKWv16o5OvrIeAk9jawYMgV+zFo+eEZh818KePHLYnt1+iRT5g=
X-Gm-Gg: AYBFou28MKwXvBNGtnr+VihP8uJ/ZzAqBeJUWzT4gr/Uqp/zdsW77tfKUNtlZ9GRrpq
	g1a+ULkx/ftmGUsz6m4WmJFacSrWZ8jI5GaEOvLz2aEs4PMRX8fbipQnLNHluJxpoMyOut6nyLf
	Yq28YIoLCJ+5om1jBM6XwhYsYFmhjRPDGl55cn6gJoRqkks0WkxFc+dbsgGkkt5kmsMEJw4F74d
	I6gII5Imhb31wAHsyVdTsdpFzVE5VhlUtLs21BJzRgVDI/7wgkADqfF6yFuahDep5ii8ZPBCdWm
	czle5agMwLHtLG4lnPsvs7BrFEK221vRQff7J0vybD9mEfK94/J24N415WCfiGtb7sGfx6bWkAX
	d378Hui7Uv6YeJ9ZOjeXWdIsU4TAZJx9dI3MdjiBvWDeamLtjgdikmIr25REy7oc=
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544560585a.26.1794214476130;
        Mon, 09 Nov 2026 00:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544555285a.26.1794214473764;
        Mon, 09 Nov 2026 00:54:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm146282185e9.3.2026.11.09.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:54:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:54:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
Message-ID: <x7eciplbxc744uqlbynakcr6ej2a3isj4j7vghgfocvvxldjqq@n3rrc537lgek>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Proofpoint-ORIG-GUID: 4pgi-jxdzmAkkgeYzP_ju3OD9TlFW25i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX2FyJRtRQ83ho
 f2Qxml3FSbEL70gZD1ERXnh9R9O6uTCiwPESPj2Tgt2EP2NyhgQ2RrLhW+DEJU9keUYTnBjth/w
 0PuTu280Oujc3bBp3Ka3N/9nFcNOnlQ=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af18a4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX0IypAngg5cHK
 ITJPSX+1m4Z/gWI0aUcthnWQ1OzcLde8DOD8OnTTz2paOpoFuGGCqSISPA/2IwsgxlzNC8pjnfY
 vddfXG1yrKCLPx/xsoQEB5Zkodgn7BIA6GA3UDWmZuTm53hFhflgeh2Nc7zORsQ1qB/hJWQMTRK
 t3ECToTOye4JoR5UQvgyLQqjHymnPsIQg/V3Lu/rgmJmHhnxegfE+chDvq4GfT9Gf4ETfbIzfdm
 2s3otYfLd72HofWCiG2aBCWbS8yUqyWS3/zN7vDIinQl9BK31X6gDnjMDoMiDJ67ct9ccTp0mgm
 E2OYeqK3z04WPpAmFZicvzgOmgWvCgryUFji4+sRfs2cnyhliK8aWDSJ4TjgXkOoh2598YPBlj9
 zGjbGx+tMFLplNUDYXtDXWY8xlkp5vySzmbUmDr7+6Phg8SuymofdaLAWVtq6YzBQR1mqhHZvKq
 vZfgKHcNjc/poCWZvhA==
X-Proofpoint-GUID: 4pgi-jxdzmAkkgeYzP_ju3OD9TlFW25i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-09 00:29:11, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
