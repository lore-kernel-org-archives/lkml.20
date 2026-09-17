Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF7C59D634
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658159; cv=none; b=YzXT/qAyc4r/stNNfZE9QrWnEvw15p2EZiF6yAok5mPTtgSEk+VBtpEtuppdv0OHAr+orbx6bdWMbp7RAKqiYuXOEGMhpdg/rmAwKiJf7NBwfWvemM4HYs5li7F2C929v+jfHyA7PAMoDxrb9TxDoX5qJ4Y4Vwq4mjqEhG6WOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658159; c=relaxed/simple;
	bh=mN/y5gkJ1eIeT/23li5ZAE6Vdcj+otr5+S74JJYPlzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndZRofJg2XJwOWwCE4NdsVPRzWHAzBxMbXwFvdEazLxQxk9+z+TX2yJKD8vFIRO639YJe0yVr7Gr587jF7L0JjNv+OmOiaL+d22I7gHlNLcMsO4v91I+dQngmdSdHcm9UT61JlymbBCr8LnZG+WaxRXkgvbjr5qTVnKW2Ahqs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4DA+xHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFOA078w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4DA+xHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFOA078w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiXJT2086569
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+s9oHZn49sNcqeY9P4zWOZp
	N1WVw8/WixsEhkKlvqU=; b=Q4DA+xHpdwVH5OiCoVH3SIS4BSvh1opGgyqJnG3B
	2Q8KQjNM6tSXNBeM06SwqG/mihISOkN7+Jda1KHAwZG/hI0lcvKYOjopKSTf6qz6
	GoZDbTtQBSWWM16wP0BHHSLEbqGoCLRfHLbWUZ41aPy2E+sAJZfAq+OsZ4ZsfUEd
	zN/GkFC10sgUApJlx0ulaxb7Ur97xcPvPmyiu/2WZRjciejnwQkrMCJGrlZId3NZ
	8LssZCdBkSS9ggNay4UpYUm8iW/obp+MlIYn5n1WDIOYJe7ctkLCnhnGFx153bXG
	huHY+JVaSbJo+oNPCSSIAFEM03olS1Km/sSP+mi03InhmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu40y2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:15:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1b824e84so222307685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658141; x=1790262941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=UFOA078wx4hc8rptQH8cPD+j8gaq5j6mXPLPXybNB1QX4oT1QM9pWC/bxnj5+0nLwo
         eoAIABTuftAdGTsDibweKUjxpJ4ECyLsTLOT4DDMZOHBa78tECjHnr66sw++N6Q8I4iK
         A1XIPwUbLoAgIf3gTH74vD9SzhE37VoS0U/OMT3afaGVequss+47fvRpLDMFeCkrP6SI
         4vC5Ct2FQ71dlGqvzljgTukUFnZQxfrMb2EbTjLHEoopkHA62MdUeZvlR6ndIjTLUKTt
         Ep4nUhZHFD5QVg4B1nRrWnpQ3/6zsoU8A8jv2OrcKrEkbZqdbETnIqaJ7JjMe09gQp/L
         NzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658141; x=1790262941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=tM+3LQjjjbncbpAcCvu4VHBDluVFuaAfybhjGqNUpJwvn0AnEOx1uZac3uGa4KU6cm
         ODz5b0AbW8ahTw3FktxQPGtGKFzSEOyYy45qWUtPV8NkvDmZR1B4VcM2rd/GHYGS6zlw
         zBtws2yFi5kfjo35YtJ75qxW0dQTgDgPpT8AEU4vmg6rdwWhpcJn375m4JVlLR4HH2uk
         QPipza2m5TD7EvbkqM9KCj0CImqN7GGX+SZlKw+lQg2+FFMofUYxtvc7ICPxc2l88hfb
         ImTl7ith7YNu31itPXztdv0DxOUDJcUvdmGnkcSnp5xHAkdGqyfys4yNFW1NniYDVoG3
         hXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj0Z9BeyIMVaKikkAqvTMie7GyoTF9Zvj68hfSrMTm+fZnhyDRN11JukmWOU86I3g2gvTP+lg+Xli1Jn4=@vger.kernel.org
X-Gm-Message-State: AFuF++nWR2qxmJkQ4zC9XWOLrZtOMWEjtpJcFvrOpIWcXY+DP9hepBgE
	N7wTjyHQdDYcyvqdQI7KmCYatlnxV/rzus9swZGGEHu7r+stfx+cRknA9B86sky024SQHXsPT4T
	AO4nxnHhJNFmkep0dPhaYwfbqh+GGjUeqTH2vUTdmEmgqV8Py/QozHdb2ZCrMnyjHcTM=
X-Gm-Gg: AYBFou03scKuq7+yfoT5eP6uKplcD+c+WEMM8OZ424VEBBuC7LOMiUKXK9OmkcoexpG
	AOheOKZe8VTPYB34PbF9fz8Dm+HUh/AkXMCCVH7GecQJMH5vENupaFa4o9b5TfcexFY2Q6vO70x
	tzURK2ra0iYHWwD9cXNrSe4kidVmtT+3fN8Om+wssckgQL/XkNLwQ6vbmuFrWwcSm4gRnqNjHqr
	4NtcXQk0Y5WS0XkyE2a5hBQTQiDb4PoeNTU7Y9VfUIqD7Cfj+TlV1ucJWGO4QGkTEJkfgVRIQBw
	nqBEtH20RVLl2l4Vnj07V+v5RR64qR8gAg9V5zb/qieb3MzyGZkq0j/THi4rYwVCQo2sg66MVZU
	A1Pj/BPAWcnYwyw==
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110298985a.77.1789658140812;
        Thu, 17 Sep 2026 08:15:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110234085a.77.1789658135590;
        Thu, 17 Sep 2026 08:15:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847e994dsm113950375e9.2.2026.09.17.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lgv4hrhmvgetmiskf2j5rihn2r4rtpzlwnsb6rz6peiqe6t5kn@li5kt3psjw5p>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: HZneFzWv2XYi4zJZSsRzjcOuKDvCtNqK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXyfzFoqnGNDxF
 uRfbqpGBaz31+yySJIIFKax65FUmkMGBoF5oynhhoVcqQlm3MOh8p7fXwr/78BLDDrMiBYirylj
 nlTaZFlGgFzP88jDgm44jdwm084IaWQ=
X-Proofpoint-ORIG-GUID: HZneFzWv2XYi4zJZSsRzjcOuKDvCtNqK
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac041d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXyVvsgU1n012S
 nevO9uqXJNmZ4LbagRSE76DDhkUZm8koUCd/6mhg0yXp092E0vLE+DZQrRu6ILZOE0LZY1syhoa
 mnPGlEDGUJYBc/TciKVv6ewgf1Y1i/QdM8Btca10XI9ZtkCQr7CVyX5PSZrf0bVwo/VtVuHOUvT
 rs0RH0KknDnFRva3hzGJ6rsmowRYjcBadYefQ45j8qW3alO2bAXuUDAfoBKhjPkd9YyNc0KUZDI
 ioUrK8mWxGWPEuXIOX9l4HIaXQab8/uijyw/1LJibDIRXvROsK9P/Kcz4N/XkbwQ15zDeeRvH5f
 wyKwSDMGGSGvUzNlS2G5XbjfDNuZKgu/bvBFTM8GwxhDYPMr7G4Mre69x0J1pc4IIplzsMRou6V
 Z6neLPXM8Itt5ZBVM0x63uUnceLaXhOKV1UvIZVM84DVr5cfwSA9TJFg983QScjY4dULRvrn+dj
 u7kArI1W7eqej1np0zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:27, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
> nodes to allow board-level overrides. Move perst-gpios/wake-gpios
> from the controller overrides to the respective port nodes in the
> board files, renaming perst-gpios to reset-gpios to match the binding
> used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
