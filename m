Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C36415B6A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410023; cv=none; b=YIAajXaU5RIlYDf4XICA/SDvodF54hRWivq4LKj39Zl4A/YqCmEbRKpg1oGjL6s+Y7vLmnOZuXcO1mVpigUd1RPvUOzgdUdnv8UktGgFub+zFXgkotCi+/SoldXB3JfqCCcl6Hto2BxU0DLxb/mpyeWuIT6HcKYICqtH6KrqCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410023; c=relaxed/simple;
	bh=zNa6hjnbJsZirNp2D6itt1WLH37BdWd7BIdoXDU6qOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJL7vPLqz4BQlcgqy+1EBw9Fi3llDVnVYBeKKcugVyKkl+qpAOMlubCHH15I9s8A/2tjKU5FRC8WCVhTdEB1mNEOOE5cEwEdh4EksZQespfcWVzjXOe7jLomPQVCdilVF9XM/NPPumrgwHcrQcOGBlo1MyFVJi2X8TeG6d/1nUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0qske6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDQbixxJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0qske6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDQbixxJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2Aw3306589
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IqIT7unUNeDVbUGIwzQRnFuw
	+MAaKeTUmeCgf8MNO6I=; b=b0qske6YXg+7km4y82nPrdnSjk/9jGB8dE2zAfS2
	aLdB2rwbp9/1KnLBds4r2l+TrTfOr0U2KAQr2xmzeLUMdUyF2/jWc/jzV2W/Kzk1
	MtUZqw//2uZv88Ml9ugxhsStIbmxF22YsG21P7WFiHCPcXOx5sKcKQgO+9SZqewA
	Nn9U5MxRg+2/s3jR73PD5JiMN7wGp5myf7+uj7UvOlcx+8Jine2wHPRi1OIIzv5o
	HDwZfAfu8RHnZTzOeU/78hxlJnQnc9tUb76eQE7DRNM3yaeO6PY6HP03SIfEdORN
	Z0W+8/fHeQ3IvKkWvCw1PCqKIIktBR/PKTyWevAi2Ib5rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47gv6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so462445685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410019; x=1793014819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=EDQbixxJ0NfTXTz7U+4qvABrqvUor5sanbWa0DR/E+8gPR3poqnx8Wdgz9lWq+g42R
         t3jdLH1nSenRiBJ4HOnH1VbzwsfHAhKx3apt2+zQtHSZlYCTIlqDTp9x07HuY19N6BYp
         qMIMgu5iBC07+0/cXDZhNC2kOo+7Ag0FSdNpjkwJUWvqmo5pHNeYpoFmgxrCcwaGUj7n
         niBkZpnsubaOVkk2zk8bDI664ZGJG4zqN8QRo4HLxcV7rPNCyCIWNGYJuDFxmKXQZvp1
         kvMdmu0pEV+995FCdPF6+6GxsNK78ki5opgFJxt+Sel1iGX5jdjHzkb/EmP59VHEuWQK
         Hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410019; x=1793014819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=jFvP+VuS8U+kyHFoLZObnoGUkFUVUsQWhGEdIHwEcxutGr3LOErNTE5cN85q16HeXj
         sfJGOVWGm6z/CRAVV1z+3u0KexRRLKfK86WvPFOGo35u9ftWOQkI0UxGJKK9nkSlF3wr
         D51GGX0ctpqXCoQQw+wQOhXwbO0SC5sbcBYXjkm2k77jgjo+PXmMf6V5DKOxP63iAgxJ
         bmwSnD+hvCh3HEpHnkX53l58YhYWnLCb+GQBtBXQM98bJnhd0vKiYp5DjNII41KIiWGN
         V0c7udt9zYz+Tdx/tXKkq7lBT0BD+ppZZFpkSC23AzcVuz44LGMjLDzFiyG/yjDP4SPy
         SfwA==
X-Forwarded-Encrypted: i=1; AKwUvBx8i/SY4CJUtHRZ39w8sfebQt3QBKpWMAjog4dgDnseA0q70Rh3bP5qIMoJwnFY46boHcu6poyy8pkfc98=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQNgEZmlpSijX8KA7/pHJSB7V8VqXvKGMH8e+FZskCz4I2CKer
	3IaQq+tLT4KvKQFdyXo4bUqOXs6oIfxO+oUl3tCxprvoAKT/8nP6OLYAfd3hnA8qr7P2oz0mv82
	+ENM1ztEdGbKA71mkmGdcviCA4PpcQ48a4inkn39u9qPMu8J+ffz+ICXq/LvJrww9/nE=
X-Gm-Gg: AYBFou2Sa98aBdi7z9L2V0jjkKSCXemjblO+QGh8/VOWqOp50+bFcZmdCL3onZTQZHc
	TtU+MUYQAqQjnE+1M366aDSbCd/EZisgfIgTUvgCtRxmlKmYW91F9GDR8k9RGcgcZ9ROmRmbGmU
	SovrUlS5zQBFbApu3rLcx72j1c+WFP0rQq5qGB3mQUUn+LJwZPPaufvZ/eZGpuqGflaR1Vl32l5
	Bu+3L4QmUe+5FxegUuHr8fxYwaWWxGRr/sYCEPO2AdBoMdIDq7fhqvG/7GedZExOiKFcD9Q+i0a
	SZcRzd4N8+UEStSCVdUrjuDKX6ZWNKtZScFk3MVnJUUls6uhqIHhuiD0GImqQ/t8QCrJIHakplj
	GavCcCMzI3PZ63ndo
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251145085a.49.1792410019026;
        Mon, 19 Oct 2026 04:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251139485a.49.1792410018424;
        Mon, 19 Oct 2026 04:40:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm519633865e9.1.2026.10.19.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:40:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:40:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add
 Embedded Controller
Message-ID: <44vpjtmnwg7wtp6xsqgl54rbpos27fndfru7pmudfvzweyl3zo@r7dxlf74klfl>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZuTL-9xtXWCTG6CLvn9fP42BseAXBiPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX+EEZv1E5gElP
 dNDMBZmqg86yLQk4FQ3MBkMaUgEcEjweZ9Fo6osFim6ZlcyBFPvPLuHlvAQ9MArxxvOLa3EC1PO
 p4HK74nnMuC5j+H+RH935D/MQjFw1Nce53WWWEOwSISdfrieFq9bE1hv0jhxQAHyFw0SwMmtSuS
 eTByg+lLk7bGfxKqOYU7RzozAqatSBIBuUuDwszjLgwaY6A+2SjjHVHRqgEjDfyzp4wsxmSFHEG
 ylqPGuvDBWUiSmS5vujxlTmCBxL14+nOm4tjJtxcTdKa1d/2Ci3Jkx084BrxHIq+eFPl3KNn0Zi
 GkSl+Uzp+KvmAD/EUGTmdCdZ55wcF6+d7BnUXqewQ3ux4ECt5JhFLIL0UcjStxBjOWAvkbCQLf/
 QiTE/z/vbBYnoL2T5KzoMe4+hXKMbwB6mDmcyq9GwhW61F0CQxKhzHzEEZf+p20V+UnoupqVwQn
 DPQ0cKHDqsA5PrQJypg==
X-Proofpoint-GUID: ZuTL-9xtXWCTG6CLvn9fP42BseAXBiPX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX9dO2fLjajtPr
 Sq62dvzYxsJl0E6YOWukW+1fyrgzyguM51kkVo2WGe8Whbe4F6N3HQo++d/n2URch+fdVwNNr+O
 lb6XGSki9AtWeThKMjHsjZ/o0dVoy2A=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad601a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 26-10-15 10:55:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A14 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
