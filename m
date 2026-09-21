Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85B49482F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992453; cv=none; b=a1/RvsTxHsRasTiC73bfgJZpbIUWAMkI5E0nIxTNsDVmzV7LbTdybC9J++zM2o6OL1aj8o2C7CTEnluwhdDVAWHUKqhSjePX7iY0eQiCCiZI8MEMIQNAcY9SpcPDaD6psrsFkz3xX8/nFLqNe3WqbIHW2G9JLl0BGOOjxfN3uLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992453; c=relaxed/simple;
	bh=aI+TcTaxp3qATHFDOIc+09KqwGvOBm/VOg2yW5Pt6c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYyrPSbHNstvFaqGuljorzWDDE4sk03Jtqbws2bZ1ZfwtVImywKieJWpsXKSfuQTujaOYadYIU/DD9yjLK1wBP+wUlfDHjBxSeh69rcrc8fJ69fFSJoxl3VE2qpcnGnGw0vHfwbUitBaiy04o2dUkVKl79FLh58jyGL+oGLZWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edHCoD7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVWHtlzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edHCoD7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVWHtlzi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0r61414001
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mrmIbXeN2TBMf2KsRlbZFCo/
	xNhOB/akjMxEecMlLrQ=; b=edHCoD7AmB/TowptwnhrUHlYRxIeu7lrGS/fubpA
	J0PBp4aDsLxuDDvc5lFjzEXjf/kp0brI8AJp38E6uxFiz8w6R5tXNDiUxWy5c4eu
	zurbSHWEzRpwgakncAWIFygU5mlXX4pBKi73/ZS74kcM9HrVA92LhXcJQ0Ztgwik
	uTx0WbLvMiYR+dYvGDcQMPyzCpTv8k/6JeBNf7PUuHMbqQe1CLJzMugnjM+x9sZi
	1PqaF0UIhhClNk0unCSTRa6+yBryPSDi6Ek1IXxNl7BiL9C701wJg1rupyfkzoh7
	/2UnmAE2NiqyeyArt9Uj+zWlKyxFrCXuNGe0tIsfmngWGA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d14g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:07:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so169374241.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992447; x=1790597247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=WVWHtlziABnNFi18DkJAP8FuSEQgxmnjKM0JXpU343tZGj3NUJLVQXhQAME9JnalvC
         bClYrlkVF1k5wCRdc/zRT5kXaG8x6oZH7VHyAT9SIFwuaFx57irjbCBNxyA6K8lcSLrK
         Qybqc3/haYbNEQSzcjJd0eUnpdDPhaM8yatlnnPfTw+MCy1HUOLB18YZ6b6Xtj337Mdh
         K11S3usU2SvpTfRsG0G5ZruvxOWuSozlA022y0DURriM0+gZ2GDCN2BpVxrInXBPZ08t
         sCWghZogggUG8ynnuyObzAjyQAJ2cbHmRE8WFCyY+ZL4ANhIfHVseEwOCjk19e/lXtgI
         fJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992447; x=1790597247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=N32QLDyW+ZyalOAn5QRU7qmHgTbqAF6DA1QU3bdC+RKbZS0DFZIkoFdsacCEOZcfiS
         0vT3qPQRXD5XPdZ5wFsogkAyhJ7+dNTjqZRqyuI4oUkTYinJEtSEj3K4Pjfbch3B1hNQ
         4tSb36ihdpsDkSoOmmLdSRD2RCWZF/ZxKaNkag1fB0Ng192bcLDNu60wFQN/Mjun1idx
         sj7v1gllP/M6JIuW+2lAy1ebX/kUWEqcD7wCLEAH6Y0+TNz3t4pxG1C5bP6wzIcltPsb
         Z/cxkhpu+ys0N0VTYoPUkDxRd3Ydy4zNb/G2+UBjSjKxA32aq3kRVQU1BpvK6/AYcMgO
         qMpg==
X-Forwarded-Encrypted: i=1; AKwUvBxaEc+TxAOwGOJtCUuxcqfpqAnVgBDUQxJJBgh23u3hLuz4bHbtGGR907BFWLpP2nKAvhSWnF1LjEXeyGc=@vger.kernel.org
X-Gm-Message-State: AFuF++nizaOU9bbaBjT8ksi+qxiYfw/m53RpS/Sf9i+JIyVb6z9oDtPC
	caAdZBVhF559oLHJ2sHuZPX//qu2lROqYRAgOJySvn9iU68Wa+41KmNjJ7tSoXxY+IRcAo2GNof
	tcOm0PKQ8nzkZoeQZQ/2Sk4S/9JvmXHFO4s2xueM9U0ZzKz0Ae8BvQwDFsAMkGyvsHL4=
X-Gm-Gg: AYBFou3puAsPl5NeQp5/PAg99VBpDlJ2tRCUf1faxHIBEIoudFoqL+WiIoAL9ta1q06
	LIGgfd2D7yxCJs7ZlCsxJ8doYYla+XBdpZyWcvboYf9X0MRMgUid3rHL3dBlUyt88lyJQve7q+l
	mw6sXMOkPwVaeuLJ15B4E4zPdyHb1dsjJzTlqytTUPEIm3uZdHL04dhwXJkgePHMJOwEswL1tGL
	E4meVe2tP15heRmWw17926RFFG9cmf7Q+D39jVPZ+39GZhdqcnrFo8gTAyhwvy941x6YrExewbn
	rf163Aboq69rF0AoKa8eSCKODWr00leoi7PZVkbrrknZ0qfBTOqeMIcLIdiP5Ly6w1JAml6PdL8
	cwLwcFkX/hPrZYQ==
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3921075137.27.1789992446848;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3920971137.27.1789992446153;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm233127095e9.3.2026.09.21.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:07:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:07:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/11] clk: qcom: apss-ipq5424: fix 'ipa' typos
Message-ID: <oez5n4yxcusxjuw5pt7gtqqa2drnvbvzhmpaau2s3rybwxdzr4@7qpaaeevdfzb>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vrtVm87ECAbjBVn5U2Sz9FXr-GU6hiNy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX0JBRJOGYBL+2
 h8qTu/KaVy+MJaqH1zjAmqkSmMuWQT2CTXzIIfPRLx16rNLK1rdnx4xiYu+oi8UnsES3JEMXR8J
 +IGujem+xp/rPCOZLEU/BtSa4872i1o=
X-Proofpoint-GUID: vrtVm87ECAbjBVn5U2Sz9FXr-GU6hiNy
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab11dff cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D9-gj5qkw8m8MH5a88kA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX384z05VO8V3B
 HHb4tRh+RXS2xlj/jUxbRV3FDtAXIOmH8es4hBUlCv870PS3bdDfG4p2VnXiD0q8DNuC1qH2Aef
 3KSsgI3lSKDZTapEBbR/veHOslUKnlFbG8EbGvUYvayKtDSqhQ9fJwM4asBxMtKirX40Uog5VV1
 41/sYtSBYUm3F11f7ufTV3e1vIkiNOsT9wQHdxKyplczWL/5ZcdgmByEvbdhmHFBYDvbdTXlLLc
 P+GD4UE7obooeepnWBIP31ueJB9fteTuLLKZVne+uYDZu46PoPeMRy3uZU408KGuQgdKQK6VCLU
 t2T207N4+FVt0rkyRc+zK05lo7VogQTAHr8MkMirpKqdU5eJ424LNIzyd9hVYqUD0tdYrbo+czS
 0Ov1s81kjgP4Po435PjS6EEMvmvDmSdVeSXhH6BJ2nZI5osDPZiwgOe+97xghDvpUoPanojL3P/
 8hufsr3LwzqYSbncsNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210175

On 26-09-21 11:49:44, Kathiravan Thirumoorthy wrote:
> Replace incorrect occurrences of "ipa" with "ipq".
> 
> Compile-tested only.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
