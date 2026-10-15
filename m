Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041A1922FD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023695; cv=none; b=aMA4p4Jn659kwWGrcT0JuaxC+vUhMxPK0hMuiyNnfjQ8x6M8AS7i/6A2jBNl/Ts1YOegyAvRXOSIPkhVHV1DzLgE7rnwAiwjXcYv7hgd1HJLj6ICq5q4YnDM/zYNdL4hvDFgT2Oz5l094APtkSZTUNefzqVA0PPnvttBhLrPAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023695; c=relaxed/simple;
	bh=gi48cupS9h7XgwY6WPv+vOA1JVj5jws7mmQ9ojMZxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2ONVgYPj5Cd5rWHY8m3iRKmqQa7YdXoLOBuWeCpJMJX+s4/QlPq40ZjyHlKlS9TA5FRlB/Z3sM0EB64k8nRKSKeghzxfMWHcKHEWI7KSDq+UkGq9h+GSTj4MR2H53eo0DBHYLIkmieJVl8+ePKWWCr/ABOMWhEpYoj2DOXkAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUPkFvBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3Ucbvk6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUPkFvBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3Ucbvk6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFq2c91672812
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yaR/N3Tfnkuz4eGTVgBjs3mV
	pu7leTe1gRB71C/CEt4=; b=jUPkFvBK8Bam0QI2S0E5fz7hd/W/N6wZ8bCVnR7/
	awYjOYzdM9FpkunS4kPxLOXogbp5CIpClvu7+7XlbeR4hguUzz2h80W4lpE6RH4q
	s7aRLQZ9miMd6/KDpxUkB4Pd6zTcXCnID2VvZWeRYp2GdIYmG7ekI6SuXRaWJENt
	+f+aXzLW9kK6070UItNSO+5CgsLUjLjW9ffe3yB+0+34CFjzZMZoNMTWLTxkKiYE
	ElZeVX+Rqf8LwknyMqsgiHLvYLsyuHsC94egr8H99NzyIuHtKVa0FK+ME38Hr1HN
	em4bHhw/fvXcfhrLsGLI0vnv6cr3j8H7JUUjisV5aISgJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh9pqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:21:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso7512101eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792023690; x=1792628490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=e3Ucbvk6YebkuI3xSJzkF1JAhvFrjdS3lRofY+jCEiyOT26XHTRE+7ubzgS+OMgcZm
         rr1VupNsqlK9hq1B8PciFUbg4ZLBmp532kG0f0vauOG52+h8Bm0tfJKmXE0mj9KRLfRL
         AjVaOsz3x3yukWn7vwr+7Oz/G5xcvSLqU7lLefrRm++zMurbAE/n/1qQuOwA8IAezXCT
         TtaIM4Ycur5syVKgUXOYamd2kVGAJvdE7pciana/5h4imIyVj37eOhEn6C+53/A6opCU
         G7xpZiBUPY13xZ5gvE5TFLHCSbYxN2FYSi7ecAY+ddOSTiw9lECQlWtgema0Mj2ZQ1bd
         /jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023690; x=1792628490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=A+eQVTfOECFrBpgQkMtkPdiIiqJxZ9JeE9hFmGqv+m3IS8f2hVQ6sBk9Si/NBHg5RI
         HUI6rrhfML+fQ0E059vjFtI0rUo2WUIdblRilF8PwUImDB5SHMRnwhkbYL3m/WAmWfcQ
         tK9XROFjnlqrMlfk5DZ0L6rE4kljSOi0tVOwWTj7gcu9JWlXfw/HtJdQcRZkn0PLaOxc
         mVHI7GxKtEgbbGlv0KP5jQx5wqCScerWlCOo6Gzvmw0qVJjpSMiQjT13pHOoc3qsNeca
         +5l/+Pj9XB9Ny1wwZYCRIkPZeIrtxJ/pJ1g95DY9zUmMStLgDXm3Xf/YnieVBr0MZ9AQ
         AlYA==
X-Forwarded-Encrypted: i=1; AKwUvByIooApysS/RlgtXW/u69T56SAyqvcohi7luzTwIAHFnRRkr5DYEUB3VYw669Z5aRtfozpXJAg0lzfCGG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5RH5Io2XijLxDPl5207wqqBgvPBzemoSapZ12/JTTJA8HnKIe
	cc5hTH8cZkoa6jl6H428NWL3jWQH+1Pk2BKLnAWO/IpckzBg4cpveuvf+OfanLp7Jns80dPVzd3
	QHS8l5nvax7dg3Uf9uPWuKjhH0tddRJkGf2b870ZlXHs3xJ63VWyWL1v/uOfVHJgWeOA=
X-Gm-Gg: AYBFou0aqXDyJbllIDAqqvYM36OgnH16T6G24kHS+kzwyZ7OpTcQE98CIjV85HKUIZr
	LK+GXzmFivzvpgGeIOp9Tl3+T4ZE86zVbNcIvMZQI2L51hYu2q7cCjmXtobSk9gejgbFXU0YLfS
	pQcPhvp6SDfEoh6+KZR5tRmXk6Aq/rxnCxRUfmQdJfBpPOGL1xZO8tYYDv4nliagl6dE7aM9sGE
	uU/KuRaTUQiMeTK4rAoQIOHwj7GMfUH0Lp24UcdZPf0nyIrPTxP2igUDoOtlR21L2ujPACteBh4
	FLFuax1FQF4Y0vsoQ7YggHoyi8FJl5D5+IYa6FgaZnM+dsgyi2DrMPqc7v6iHiHZRDauypDMF4e
	V9NWC7VuTKMeia7+f3H454huCRSQXFsQR14HmRe0ZAQ==
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615302eec.14.1792023689859;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615268eec.14.1792023689239;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm41347836eec.20.2026.10.14.17.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:21:28 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:21:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Message-ID: <atAcgjjlin21jUHa@QCOM-aGQu4IUr3Y>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YLnYSph-LxUoecxYlWQqq6PhkpC98pDE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX9EKVfQS6Mnpn
 ONWnq/9CLYENRQxJLJhdsmCedTZKaldcqoiaGUoV8eX2y4gLwZrSE+8q7dnJQ8Eei2zJGM/gzuY
 i/ri6z7cCIDSAzSW7hJoWDo+Ydzm7pw=
X-Proofpoint-GUID: YLnYSph-LxUoecxYlWQqq6PhkpC98pDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX1yNhrDv7FszQ
 tYopPVnVyAQAPX1ft6fuz4YYGIHP7izFRub77OZT4VlS8lVKfLvFT2Aeht8OdgARt4sqfOhdrgG
 m+FTK2JkC1cpV3q34dVp418OAayi0JNB21PnYls2qp3YLehtHBG0DpAidB16XAzL+xYfeNulH2C
 BRzz5GzjTK8/JBsq2rQkBU3oy9WsnhHFsFwROhTr9Qv9wFjqZza5D6e6+O8W+bzVMIIBCw9RwSy
 Cz9ym0GHl2rDc6Lr8765oRwwm42/pKojkKskoUsnSkwbCmig86NkAYkdNJD98oHrub4y8Yyiurc
 4GMkbRN1kYOzOy0XHsL8JFQeQxjBhBQov7aGgrae5TH+uLhgx6bvtWm1vOQOVatiBY+UqXx95LA
 7+YuKXjCN3ftFxbbi5aqSaMfVRg58deCjZ1jBVfDG5xXrvpAXMdQldGcYYqpXomakpt5fZcon0t
 b5OGOLR2WM46EyarRkA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad01c8a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RuunLgntBIPE6M88tmEA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150001

On Wed, Oct 14, 2026 at 05:16:10PM +0530, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
