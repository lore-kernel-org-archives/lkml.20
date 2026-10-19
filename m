Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83845498E01
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400835; cv=none; b=hL/wal1wxP9nQRLJRwiDMnMkTPZ/jAGkEgh0JBxLfjjX3jyVRC+7JVAaoR+6KFwsMOqgzf4VnNUDRnwHLbVvkCkX3q9vUlDOLUKa3lc/tlG3Qkd9F4j9RhCXY0g1ZFBic3OHitRNt/BXsQpTHuXkRSj0CHjkQKZBnLWNY99upF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400835; c=relaxed/simple;
	bh=QiTiJjMnJoygnfwW3obAIo67pZvKlE4o8Z9bHfK8l2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBeUT4yGWXxdm2+F06IvdJW5qoSGARWdYBAmMh1MkPci+clsRrVT+DfYI7o4tuOazq/W7GbzeMOMTdQBzpLRz3+vQx4EoMEpeJibXkqfJ6F5oVibBdp5LCM0vqqJomqXxHTmtqkh3aJA8cENt6D2vP47T84M42t3BadQ3BoVrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1qdvTS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8kBTsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1qdvTS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8kBTsA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orw51167943
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=; b=H1qdvTS1gEMHnE9e
	7cn+ABxl4BSGpqY0Pp1SDKiTznKs2paoLAYfPus3JWuF33vg7uXnBl0fOxfPG+7x
	Uc+CUNpGw2L05vgcun8IllXs0Jjbi7DHcRcXbrHuYoqGRuEQYez9y1N5/mXokMHr
	IVy8qfUP6C1UxBB85PHX87sty6GWV8qw0Jg435FJ/pcQojn8rx2lXCfSPff/7SPP
	HGA9nGO8GSF+nF2lDHqu9N/3VN1ZIeGBtdpHgjXl5xWHA/YcLbiqRtLhI/h+wcOQ
	xMhQuAkqeU0CDiveH9oESKYbp4WARLPRlku/HN7ubEj5uNz//ZmZRCAPDye74Qcp
	6SunjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c89f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so18935885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400833; x=1793005633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=AW8kBTsA4qwPojRoYWPy/Jhnmhv6df+DP58s7vBPY9BJvvBC0m34cb8Ec+4TmtFLR2
         a5yBmdJ28sJgCB5p52uv2LWUPKzUOVTwhhXtf6SL5k19RXJVv7LATq0/+OFKehbXgLwY
         TGix9lP4fh8h3zNChNAA4eBDa7BPrLi3KhG1wm9PBDjiuL1gfIx6GCMAhi72y0/ZWXJT
         dYanR2vbCY+ThV6IcvcVyMaO1nvs17LPBmhm7ol/WpqIZr6ujlvF1aAeX5yYhkj43+23
         baQuj1v4wbOgnxKzfiPgSp3rjXSQDh30+pdx0D6+JouLwVZRnxDlPceKFEAEBottkeQ6
         nBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400833; x=1793005633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=zaBJAmb2cQFV2+GSvf8PFJclfC8DC5PizCnCCzUH30BccSNSbAWjI3TRuS8eHQJiN1
         /vG/HEz9WjDHzzf9iD01eRkq0UzfdDcP/e/J9l40Qc9LrAXThyybct/dog+afh4b7XXp
         NyIXEy3J0HnWqiCut5g3ejHpS8IYewfTEB/YYoLoe1s+TtfBxDROELleiXUW+h0ksfuS
         hxKf0h9aU9RyE/jR8xqpNNXtK/m5Wdqm5pCNcXMDXiBpEhqN1giKflmcNR5eOEQHfBul
         I9/zF/1Oa4NuS7OHRiIHMKuytcCzvRgalLK3FOaLPhedVu2IVrqJZAicX0DnbPEo3Oag
         PfIA==
X-Forwarded-Encrypted: i=1; AKwUvBwl8Dg64NBR6vqAf5UFDl0wIHsQ3fG8zy3eYt5RdutJMXOi0nxOouAQCExoaBi46e+kxog87izWwxfMGIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLojeY6/DBWvFXFOEOV4NuErXpfbaaoj/27536Z6aoS91FuwOXf
	g19ZnMKCT+OvCxQ/oz1jFE3hNV30gCqZmikmINjexPm5xjbVSu5kfGiC2ObMpgK35Ap6TingsCP
	CF8EYgfuLCIEJWCOh8E9pxypb2p4LTx4Kx0RdrZUdJ0Lu6pcdGBD/m56Ml2Iwbq//2aI=
X-Gm-Gg: AYBFou0Y2HE6YJq1Xz1QAzdAMWY1gVpw25uqWi/jxyhmiDEL4qbvscOWjEBGTENuiI4
	TdnnpvJYwX45tmsO662YBLZhbIyOP3zdsi43Zit3sSAmbP1wHIKn55MxQm/+nqTyacQdz9jkHo8
	o/YPLmfQQAZfD/Fx91ZFovQ/Q2fUZHAUsnxDjBfyI7nwxTvOv42lkOIyvyZ/dwl8quLeUhrLbWL
	81do/F3ioANke8g1Ys8rKHuVmLU+wri6YQ2kIz9X0Qyi7j9YMuGU1rwLKxi9sWFd8fR599I5NqL
	DVYms/VZ8Ut/PxVNf7l8jko6Sm/lttk2zGRqFXan0XFKwWEGtukObsu0PWc0xmsfJ5j5RZTqH3k
	4YU8Cpq9yCNjwTz2HCE9Tvw==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378750285a.4.1792400832698;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378746585a.4.1792400832262;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm3577256a12.23.2026.10.19.02.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:10 -0700 (PDT)
Message-ID: <5fb55e28-b04c-4e18-a80c-2f2bb90f13c3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8Vpvf5nxA+ji
 CeDFbkB5O1TPzQk+hQ9h0L1ZZUc4pzXyPwLABOPdfb7LGLVOSF3deNP0wnZK90ze5huamAfck7w
 AkcQv4+uI9NsObtxFUMNrJJ3BBCoEa0=
X-Proofpoint-ORIG-GUID: g3CkqDGHP0DvE5MiWFOPg480bcKWQNRk
X-Proofpoint-GUID: g3CkqDGHP0DvE5MiWFOPg480bcKWQNRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX2kOMaJNHk6rm
 O5q6VagwgmHh2SfJtlYHIMXCF1JieGkwrTUpz6LZiE7km07Vlax6mYlzI5bNoADzQ+2y5oJ2u7a
 frS8+qjz3S6WcACCMDMqgdb/tyzPhWwGiR5TtkHummhLyZtefNNiCWBABSSLW3FhPJ+HT2uvCou
 uSsVBVsjFZ0KLlFezR2vanZ8vSmgOslE/sVIAqjw6p6mtM1RItprpFzr5YLDhO2yZ58O2+t7Bhp
 jRJf+XdSALmCfCpT0XrUG0eaPpLPxdZUkieaKSxPfAuKnsgLxAX6OUJMgQGggOxacUC8u/YVswT
 sc2Ry0kIy+fYBCiAITXPcvM1HKrIYM/0xA8o9EkoJwYK3rv9iEJ6DN693cZtG1IKxSjPYnAH5yh
 7BXR5hNEXArSdwkP+gBHPDtesOZHS6nOYISyevvR4MWufClv9QbCVUgrjXe75lk9Yy2Ly6CUHoW
 nM0mgvvrbzj0q2RTVIw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5ddc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bd4qqj497OEF_3r0wXwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
