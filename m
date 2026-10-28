Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201110;
	b=YenYIKTFulV9gPZX5vtVlyE2Wmr8KpdmrfLyGSRuVugSk61145M6o9Ds4hE0teImIRlT
	 u6xX5fuHFJh4pFgtrpYsKZ9KI1Md19KilqVePUF52d39Y8H71E5yFlJWB6MMxIqxpnvGt
	 f8zPslIG+0GRQXfjyGqRUyhuwXHETn4wQF5TPRD8OiEHpiY4jVuJKSUhHBo5AeOySRyHf
	 66JwwTaUpeYZWkGPGdUogunvT6gwa+nMUpXL410Qny25kdPqZswK7GNWvCwuLTHBfbaFA
	 dpd5GRiOlt9e2JEHa38bgRUu68UoqJyy8pZjHMyILL4UIQkSKXmQcoXzS+iAdsXIeXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
	b=JbFL0seAowudinsfjD+fQS2oHL0mIWsmpQLhozXeytd2e5/1EqZxvQtPlxUBiVAHkD68
	 FKqB4MTpEJLsbPOrhAsA0/C7OkP3PZGrIyY7oVzV0+NDbF1wmyugKZKBcR1/SLNzKNQ1K
	 RBLQiS6ACWQQYLlZCX89GtJqv5TTp9Z1qZ4+TcLKGcMaED9RnTkFPPfthx/AUCIsmOoUL
	 Gey9DB5TYaI0PAeZ0ucHQgZQFaDNVXzh77uUVWQwT3imsI5I0/F4SNes1m0lFYUdWCMI2
	 NzwkbPXf3SwxVEDLIMMSzmZY8Z8gD7HVZLs5+5aPAzU8EyzbtHma+EyPZ2j+myMU7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7TMPUPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etXaAB90;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7TMPUPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etXaAB90
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAaNB1458921
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=; b=O7TMPUPhghvL6PoQ
	t4D+cqFyPHXysIIdMkLBOmQ3v7ybcrGH2VG2eN8mm6JasWCvZah5erx17n3ZN+gt
	0yI9FTlqR9dHFBejyU3j8UzEOp8rCpjIbIXdyABz3HDO1MDryIbvE06icVimf6Vf
	kU7jsPrmbZLgWZ9lJB9bJhkFy2mcm/xbFZbFU/04i86Hs4g+b20SsT99n8N/eGOd
	Lg4dqIxddKUSnFEp2xlUWYYIsfIJPp7eHBaQurwdvJmQpFDLBma29kBhByJFJIJ3
	5GH8f68SngkVz2yWfYLkRDl9NLJpE7WjBUNSxIFDoOMYDbAPS0v6rbkRcchodpDm
	3Sp6Lg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttsev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:25:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead2112f11so68792e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201109; x=1793805909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
        b=etXaAB90ihACA42E1Qpf7AbAOKN8S+s6r56wcP1MT12mSIHtpIguyoDSMXf7XN1EZJ
         FWL6LwcH602E0cJA0J01NY8GSG/weQ7nu1tdeTlkI9sXKx/AvNNfgnKlgaN2P3iiwIX7
         IjrvKReLnY+OvsXIpMbMTBI9R1cJXlVpxTkzMF2v2nC2BR4sloYR9fH6Kw1K+kXFH0kF
         wJxgX4rDdOlTB7/Sb+25/QtuuzjHm6fMQ2EBHAxgRYolKBah+PHrHGWvHYsX7Pr5C+ao
         cmpQpbD9DyDa4ggBGW1+aU3job3nARtkUNy3SgekBhHSQ+M1RW/zMSQcMfkCEJL1SAYW
         /cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201109; x=1793805909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYDXrDV3B7esNKlNVgZYwMfud2hi1hHvN019zxOjdZ8=;
        b=PbZ2pPY8y7IgY++CkmRc+2EVXBalRgEkv93ZLeHZJLtPI084xTssGzgm0iV2mWEM7t
         t/fFkRi7QBC15xBMUuTKYGV4jYN7+ZOatk7wPeFZnZqEp5EDNX2C4HsRSkNdkkZMUVxw
         VBIk2AKCCacdghEonF0YW8HnYJ5xLT4lGn0dOpuyc/IgF+DobUwS/HCSpe1f/BMB7k1x
         IeixJn9N74Aokhcww4fRTutUd7YXnXpmPgUday20amCAnSTey0aGt8jacl/6TgBCKYx0
         lJHawvu9r+83Ra6GbBk0uSaEn9PSr1isD+sFq17iPBLqZafmJAV4Y3MgJVUaLPYHCKMR
         w0KA==
X-Forwarded-Encrypted: i=1; AKwUvBzvFtJ090R3qFcQW3/JV1exnXttSSowlA8TLb0yXDikwNuT/AkvVSQfdwsuEh9UNAQrs5jElvcdU9djRqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoleb5codWMHkrO1YsjpgKwuzQvlcp75mES9W4MAgYZdSYlEx7
	7QsbzaOjRS+rjdklCAiILvwnO1b3/2RgHycOk3XpyQYGqOp8F/35ddGYxXlvRU60yHVhq6yP0Xw
	oB8fmPjYmmqZa4HptA6eorNAaIs2HTczG5kvrUEkRdIGu0v0jDEcDymjvNBWPmMrO76Q=
X-Gm-Gg: AYBFou1/tbsjpa3WnYCIjowDMPXmfh+MrqLsdH76t3VcdoQhvtBb3wgXawAgvA9etOG
	U9rcZPLIuBvg6RJD+lHGpipE3nbnAt6sTsjx4CHfn7APsGugJp8Px3bGQUeRzd7uqiP00UZ5iSj
	AxI42ZGmfOjE6dsnDvGC3pk37UT095okbttsAHX/E6HHDOzFz7bR4UXMKiZeRkRgPp3G4+bhffc
	Ah9u6yyhiMtPjAcn9Te03q4HYfZbR1yqfBGngVV5Fob2xhSWotwr7lBCLfBLmm/YCH9rVnqiOYz
	phEbeppNQhMjAiyrplek7GT0G+LiTnLpH/V4/e2dZcjV0QD0+yO0y/VLo2WOMs7q6wuVEJ5Ggya
	fq5v5qhOEqNSMbXrXeIQQgUTTi6X0sW3YGkUWlybbUlFasew1cKT+5Ackb3sWzExC1U7SUxs=
X-Received: by 2002:a05:6123:5c4:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec4cc86667mr1380772e0c.4.1793201108708;
        Wed, 28 Oct 2026 08:25:08 -0700 (PDT)
X-Received: by 2002:a05:6123:5c4:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec4cc86667mr1380726e0c.4.1793201108264;
        Wed, 28 Oct 2026 08:25:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm401541766b.60.2026.10.28.08.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:25:07 -0700 (PDT)
Message-ID: <2feeee07-b691-4c06-94a4-f9b6d9fccc2f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:25:04 +0100
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Burke Cates <burke.cates@gmail.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
 <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
 <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
 <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a59c982d-67f2-4e86-a110-ac7c1e0f1a6f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LSBO7acJUAVk7iuLBLx03MKZQxx1oyPL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5JPNheR+Z/wf
 Sk0HFJVT5/RV07Ij64tuha5p2Fln3IEkkZsFRZ8bPzBoC+JAGtXtUvLAoQMAGrLRPEoFDhjfLDk
 hPdgm3t+UdUZ3xCcl21YcWTPv2gxmwA=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae213d5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=f9guqRr10KZ0PglIEQoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: LSBO7acJUAVk7iuLBLx03MKZQxx1oyPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX6IeSywLSZW4e
 g1E8bKbGGQ3Z87DR8Knstn75t+zGgS3QiNqslST1QZmzIMDEyFHu2vKCXV+GoTvgXcHPDAEexOz
 m05hQuIrZolzDt7HoR9DcXCY6Xjlme+r+rXe1VAMzABxn9rv9fjp/OGoztMjGGmTbsv7rGHwmkw
 1ZbboelaKPbbLlfucj/e/SEm/BPM1H5HYi5MXQKE2szxs5GA0rRd+O0FpfjUirlI/I4+FTZcyA4
 ltCa2X1ujYeaOibfcaND/LC2vvs3ikkylWtTyFAd6j7TJRwKTB+McFUQc3lAYFifxrdqu4F7zwU
 KxlsZUvEot0mtN+MXmL+WIJWS5uV0ZLFBsak2xIBzChB8JwYhEqcke/1UYM5vaOH5JWkoWfyFOH
 5Qjei/ogCw8VzmU5LG7m0xY1/oei82Kp06KHM8a5jG116VaiXtdw7+lVyb1lOke2Eq5GMAXilPC
 9SAYyfpdqzDEMASgcdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 10/28/26 4:23 PM, Burke Cates wrote:
> On 28/10/2026 05:22, Konrad Dybcio wrote:
>> Is this something you've also seen with your local changes?
> 
> yes, but only one data point. I'll roll back to to that later and collect some more data. Anything you want to see?

No, I just wanted to confirm that the patch I suggested fixes
it "at least equally as good" as your local change, which I
assume is a "yes"

Konrad
