Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017374B8DFD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447754; cv=none; b=Q0V1l9Z3zfospFu3NoXy4m7+yjEmcETwWDfbzvtpXAh/XASU7hjGz0b8TBv3MZoig3aRdFwSLGI5gLXKY1fZAkcbpMxkfWedAS9ui9E3r9ojAqfqrcz6sEJQnBwqhpGvtKlTbSdNKR+zFBM+o7EeTcY6G5PbsnKgt31j6L94Wa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447754; c=relaxed/simple;
	bh=6OXN9ZSxOHsFSiWwE84thZW4F6t6pwiSkpDKU/qF3l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kozBOM2ZT4v9vA8UNfwQQ00xj2QpS4j9aKYT8YQ7Q7E/+HcV4m2DHNxAUXphgqsvcMuWN/vq495eMZLYdH0AUMS1gyDyD7y/fT5JI6q/bkFVXy71w4K4HXqGfCxWT/QvFVMdmzNCAt4VT6G1U3jDUjzi44PibQ8/aIA6vT+1JFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V60kDtss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiswnK4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V60kDtss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiswnK4L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAAsB1704864
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OtNsvJ5bduzzTnr9siqKTCYg
	n2DujhWtW1+E2PvYXZg=; b=V60kDtssY7nUG6oGUFHPc07gc7wNiTtxIizC7ZZA
	toTkvrAs8Em/KabPWX9zHKv7HxZf8l1IrqG1eBFyBJVQAEihBt38QmP+WFRvZYEA
	dJbrj+LObAQW75o0vSKveICAw+qfVTn/Gzrr27PCtr2QEfJ4CR0RyQrn5w9zxTo1
	y0aCbjX8GuXpUsrZeWY0gb0cynmL5GDQo2gDvd3E4P5hwFuxL5/YYbmaF3MhTsUy
	f5ATe7yp63kpwkfw+U72eG7WcSLKDGEA5KQdTwJYHZjVUfnnzu79f8dsT0luuo0r
	c35sIeYkGa2JabR5hxdQujqIWJO49n2MCHJ6bGqv5nlUqg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b18hsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:02:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7563011591bso406587137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447750; x=1789052550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtNsvJ5bduzzTnr9siqKTCYgn2DujhWtW1+E2PvYXZg=;
        b=RiswnK4LmN7RzixLccoJpbknFWSqjfufjFCoUYAP4eh0032uToNslyYVIStgRACJ9K
         S2ZXUXjMt2BigdJgo0Bdk3SsEFtjIsANFVtYBvWSQH5T12w0IE6isI9tWSWxH45S1/5y
         Pc/PQklQwFFNAQugOkZDUaNoGDH4EDVwxXdgHpDp2+rhfxbsWXwnJzlmYxpU4xnbZK1E
         IhMTxHEH7mJWyBRqT0XLohwxucZFClCzTxnBHIUajzGhgaOV6EGgiQPdjmuI5opHpivV
         t1sNPl4jNDlaBMr4L7X+k7y5MwzVq5SYdnn4mp20sHuAjNZvP7/5w5R1Ts55291HXu8L
         RNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447750; x=1789052550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtNsvJ5bduzzTnr9siqKTCYgn2DujhWtW1+E2PvYXZg=;
        b=ifAie6+0zDLxBU87YEovAuSWz/VI/D5mQYnQ85yI/Ta861JIphAmwTV23f43YTB6mq
         4JcWz46c8TcZFY9mersENyWg+nOz4QoizQlvJm1CA8TPHamNiOn57OCYPGPeurf9vgZC
         TEBdbEG4mn0Xn4+8skE71F63RRgD4NRIv3ONeZial+XpjJeSxM9ZrpmmxHhRwa5hGdCv
         PMRXLpa1X8endgnHftcdc8rCjiK+T9aZsBG3ZdRX2rMBhIIxv7t35gtHSbcls1D3Cjzk
         c8cqg+EWPJucWPv4Do1/+r6JmH98/ADklbigsUrQ735lAFU6dX5ZeFbxAybAvjYkUx8u
         k6mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCrz+2aEPjJc7PYbR4s4Xk5GeebUn2QT8gnOG765ZyJ25fO54Zq4boLIdUlUBZ3d9xztLBFRxVDnASK3g=@vger.kernel.org
X-Gm-Message-State: AFuF++m+YM4iCIC7L3ZmzDAZHjXyKuLXS19hAfw4nxVjFEkABubLCbnP
	KCj3P2lsK/52cf3gjNmWAP/7xcSSz0qKYbhRcvp2g/ftB+kbi4ZHA68CPuzhyB+yqLRaHqDzqD8
	JVPnKIhqMvcRMSMJ/Ld0ab5OaYMTQLtbABAWkUF1O2LrcqNopM/orv5pf3cnoVVHjZjg=
X-Gm-Gg: AYBFou1na8ncqX1fvpcJmj2NIX0QwQ2f0CjKxWJEoORH9RqBKsb10RBObx+dx36QRUc
	gNXWB0mXwCstaxm1LGR/KiQ7wJlU/GXdajqy+OuIGq4aBsJiqQbEIp0RrWgbZmzbKNUsETAaDaQ
	rVQ3p89p7tMzOxOHRsZyBldULc226wOrpzVAowFnbdAfcXzeMBb6WzUkDnUbHBtK5wg7guRIJ/S
	Q8UBE+dM6YsnD6xmsHSWZJnfXJFfFWqZD4nz3fo8dK1tHK0mPAjS1mnw30VuZLa2W/6QDzX4DcK
	FuTjw9NS8BQtIFIb0rHZCfaFYrgqyF2imyy+v4bl+qxZP/ME9okCUwLRzWdt1GJSFqVMS6b4YZp
	bNgZF9KEHONLHSA==
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3873532137.7.1788447749846;
        Thu, 03 Sep 2026 08:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3873476137.7.1788447749277;
        Thu, 03 Sep 2026 08:02:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm74128345e9.1.2026.09.03.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:02:28 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:02:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2
 PHYs
Message-ID: <hnvngqgtesfyojftxfuqcsc6ajf7prrlxmdk34j2pgtjmhse5w@vo57k4jmlgtx>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-4-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-4-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GZ73slNxSbinVh9P06DlmVagghRMGX9H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX1UQn8e7pXmYX
 tJVi0FgpGA4VHdeoOXTha+gBuzZV4McUhz7Ehfi2ZOeup2FQWwobTR9bLnXyFR1RXNHuF48e6Gm
 3bErvyC5fzeVR1O3Ige32T0oNk8LIyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX/P8XJ3xGojbl
 mKGc6eDS2VZ3gmEIPE/pUkMVMSgnOUtKjXBiXaHtQqkKswPRu4/PIi2wJGBEIPf09MUBygqYvW7
 KGmtyklCYBY/z49Ftoaw/vW6KfUfPfoQpB5wwZgvH9ADH0yhnCsO0Vusg6okhG7zjjPvKuQjjcV
 PkVl5zm8DhtDiIT80tMXmy+JZ5hRDG6O+ITuqhYW14h+9cYyo/V2CeWZZC7DCvfbNFXWPvYaG/X
 GOM69tjUtVJYpzZTXCIUu7Sx+d7r/NnqTNWlTOQl2Bju8NqVwmazZaUTfp9SipJAOEVhQA6aWzG
 S1I3jDczp6YQw/eLUznoJHVvH30zu/WDk8s3+Av94VOjI/v19YmUXRz4kDISZZP0AwBxz9egQ0s
 KO6z+BmcOiZ0ZiVVvYVPSu9HT1wXK/ZGXHrQhsLDWRlVH/j21r7aOJXKu5uNm8pavWTwDMZc4yv
 XB2h411garsOe/hbb3Q==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a998c07 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DCX93tUFo-QliEHFFTUA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: GZ73slNxSbinVh9P06DlmVagghRMGX9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030130

On 26-09-03 16:25:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
> Describe that in the DT.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
