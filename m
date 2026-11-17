Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905561;
	b=HljpXWF+D1Wthfmuo6tHh4KEmXuqu42hHr5a4oRTbiPaqrRQYRAdYYpLuzZ5sPsPMRrx
	 vUMlkzQlD9pAAsMxqGitjDcmAyvr/2G7l1xfBp+OUmPAU/0Y1Kr6+kBv0e7LChzVugev3
	 oW9L+A7jMuOEo/62t+6hO6L2PquXhw3LP1FJh9JitPCfz91JGKsl29nSIqRMk5zxCRWIF
	 gimjdY+83SOz8DU6SwhHocqdWFRwo2AXm7IwfLPDZ1wlB+b9peU1/vRMfE314i9/fIGV9
	 7HmveTXWnP/aWbYlcrYJOJeK1B4G2nUt7bhWXg/uij1ALC3Cz/mONx9F1+dG/9zhCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
	b=UJNUs3wq02WKJfZeSQbQHC2K5oMuXawMDySTD02U3QsznUH6PGng3aWzTX3QtObTW0qk
	 5iar36y9wdjG8qcqalrULpk6kOGiDjyo2J67t2sAsFkYvNfVrPXTKWZqR6obtdsi2XOUQ
	 SEYAtHKk5yyvV0Pky7GL7RQIqPL/J673KkBuHLPtsPA2vZORwylshf5dh5wyyahpdqu1L
	 Q5QNm3GOmW4UeqU9ZVN5mzVtFRYzw1T1/vm7MoeZ1WtMC2AnQ+Emz7S+l2G+/BhufzP8t
	 Xars6zqafKvus88NmKBQgHtmTv88kMfToHoRSKK46lrQOsTaKSyLpF1Jkrvf6VS4x3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F18D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXi01801438
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hhed3X0YRZpLtQTvo/jhCcuI
	l7K8NEaUxlz07FYiPso=; b=noe5qyDBG+XwO3W0xZw9csfNryCz16p+L/v6AHeB
	1MpvdvzJv4dSypTHy8SCOmGMYIf8w+kL+YPhWCmSuoZXmR3JcsbVUELt7qupatMw
	yDcNeZPxXXHLwxHVd/P1mjjIwCZD8Ku2pal5yVAfYwD+aK9ILSGyV4c+3P53tIjj
	YE1sFkcUwXPoYrXkHufOPRf6eCWJHV/6cFbyfEGib4zR8Xqu3bbL0GSFDwFWp3AT
	yDa7Df8jrOXZ/9Eo9g92YPJg7TeUIPuDzlSPrK497ne1qfjnaVCo1dBf8j7vtj0V
	E8g0vQ/k7S6WISybfnVaGjcNqXxz8YnHQORQrFhYtDfbTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3yeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:52:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso669884685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905559; x=1795510359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=dRFsJLrAd1jPUHU/h1UWNbNr0RsWx8LcsMRP8niyPSODEg10AQ8rdjBFdepDdUlVwr
         /9IHomwSM37fUJvoPvQNLOLv+2dErZIsxzYlfOtkfU0bQVyUD3YSobeMZMdd4S2F+vHh
         CdUyxplE6nLgVlTE/1pl7jI9zR1NhhRRscbED6Bb16jFnNLHrqyOIWenKuMd/6ACoTqE
         jGz7h8miR0nqeaeLsAraijAM47DVNyO0LSpU9VD3zmMby57A0aEUFjNMhA7aeIq7BbtB
         xCeKukU7NcEDvEDzYgnuCW3FmZEI+S1amFpo+BnMxJO4QiJw8tYoh/FMdrFtXCQmBots
         LuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905559; x=1795510359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=2L6piYGsQNisxKwto/gmm3rFsoS0ENhpHsfcpMRCK8zVafbxKheNGXUIUp8zGSdNV9
         54QBWBSNNQab86IBZAQTVMNoieDjBBoSq4hhbgnvvwuHQrzzFMUFK/LzNpB0JAR8/wgC
         MZiKZyv/Aw18ll2qaqB1cZBfAjYOZPafGsC9cNFRmmkbuikMOGo1xlnHIzpCntidAxHy
         2h+fyGTXakNJHqdsAN6T8j+ikAZdG33o2jST0C5dt/5r/XyJtmU2yEiDottjWfs7L0/j
         iBrXyXjRjMkHofUyeCGbg6ClyaSNvxIYd0N1kfz1V1gA9iZqYbE81Pr/8htFa7fWIY16
         wUew==
X-Forwarded-Encrypted: i=1; AL+hErFn0+H8YaUd0UKUz3gvV24+ITgPQjXOGngS2EV0E08Yh6OVGSGLSMgE3KewkBamrp5QcmZiBXIoR69/iDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pyp6Slh4N/FKNTUn4ZKoAN0JZGwYhDHw4+YrzR36HrDIpYQ5t
	iFNkUjqb+qGQMrrbkEFdz7g01b9FFMhn+wWTWXj5eQLZXAIPixRGIU5swct9zg/gk5FMLM8Fs+e
	/oEJvAV73LJXuEY2FECapbB8uilzfDXhLlrFHeyHBnUB6wGeETu4LbP6BG+rueMIqhoo=
X-Gm-Gg: AYBFou1dwSgNJfmo5YjflmOhJnFIbT3h40d0MroqBpR3B/d+TmpLHkaUM2fn0go8Rq0
	fAhKdUfkpW/f2bQd156VBP2kF8TA7xYDywB07k2SvUJoHEE7wTEkUVmL6zaLcId/wcNCoxnOm2o
	jeqcuI0XLVL8c/UtibnBR2kY0fhEeFIFovmLSUhcan+NN3KBfsRZmouPMaeOk74vH+a3yvKQx8H
	CcQasxxrDAdaxvthCZ/VawQYo6Cc9ImGDSdOgPW2AJxTuATwyPjql/FcphyCMmKa4dwvwi3lJIU
	jLW2AiVmNHW7zdJimb87/ZUbVJ8zAbUOZeek7eSab5tRvlRsYxuds8kcEETTMi2ng4NX5mMLSkI
	EqZSxcl0LCVFHBAOkvySUvg6RpRQnrRCKs4gDY8Gdh9OXeVI1AWM3S96zgPLX85Ou
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996837485a.9.1794905558673;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996835385a.9.1794905558009;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm15117005e9.15.2026.11.17.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:52:37 -0800 (PST)
Date: Tue, 17 Nov 2026 10:52:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Message-ID: <qm3y3loq6bjchtt6xvcdnybh2pz6krak2srvbivtqnajti2iaw@b7wyan73npyn>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 89nQ5SHrFXotc2Hr52pGBEsu-dc--ziv
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc15d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lB4lvwQLOsKnOPBdp3AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 89nQ5SHrFXotc2Hr52pGBEsu-dc--ziv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX2NFNahj0RITO
 JL0zSeSOS9OKOEgUJ+q3C78qsc8vMufYxpLnEMADEMbSX6mfxm6W4F8cPpdBeTIPVees+zVcmq8
 bRqqQhuRvXrOlHYwSqOlGm1ERcIbFVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfXzFrPloQ0mLKq
 5ySGiULFrNoUR/au4Swlpd+qKl/03P/5WdJbPyNk4zU42uYy9ajbrl4OPxFc30btqaCgoaXoNLC
 5h1llB7p/yWjtLIRqis9NhM4H8B0vs/dqR7p02g28MNZ+rqw8evjmmwFEo30o9pWy0Qd2xRCg6k
 SBGQSYHZ7FvfYv3+4kAk1UN+kpLFCIMYt0d9/HPrji/B9/yk8QiizfpLrCPUHdmz7FOGMlqlqfN
 z9mVH1x0cl3BHOQhcF1s7Zm5AXdxLtqy2NeSI9pKJvVBf2zBD9fLayvn/7PLBXoLUV1p4tbt0Fh
 a6Zck8kic8PAUp86AOrB3yhm4egcZ+iaZyNaCDFKOe2e7PJOQ7XGDOL3fCs25JxmG6PRSM1N9+E
 bFWbhim/OpTcrzA/bF2N1T9jXYByUGKuefFBNy9MO9mZQl9YKReASDhDiPWCcqevKJX2UwbaOYE
 1DRyIxG4xRzFG6Plpmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170035

On 26-11-14 21:33:02, Shawn Guo wrote:
> SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
> Update the soc_id table to follow the corrected dt-bindings, so that
> boards with these modules no longer report "SA8797P" as machine.
> 
> As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
> to cover both.
> 
> Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
