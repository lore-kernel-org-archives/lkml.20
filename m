Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9047D374A0A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184254; cv=none; b=m4pbgMTB6fZW7VPEcor4WZdwJBGIh6LJg2qcwTiTwOG60w+Sq4PiAbMj+IYgiZyTxCcWxxdyx0TdldoKC9MvyoSE/ocpP4rPmQkuE3RUEEvX7C7uEC0mF/vlhixQ40bbWSPs0Yip541OUy4q+lR1RdE3e69ax8j/3NXXvTfJmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184254; c=relaxed/simple;
	bh=TiU/JSZ74eOQTRk4e0IYylKZJ1OTH4hTNjksDkFeTus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAIva9T0G5yigNxUEgEavIaYsOxbqSZs61btoReRlg7mCkMy02jCYoJ0NFkblBN9PGs5Lqt4WPQUJfLeaVvbGzpuG6gWr9jtSZQ9d+Is/l1bconWt2sQX805oy7y0vPro8w9S/A1lRK8v3desFmmOWPXylRA+m5YmDWT/puOE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXM92+rV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD4nIAUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXM92+rV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD4nIAUu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510bkl788386
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ekJ+QIxDug/CGTDDlwa0cFis
	QBqM4wqLUQXr7Sny7hU=; b=GXM92+rVr+xbTJsPJVmdbrxsMaB5DO9CRTxmE9Z4
	NtjKy1lJs1Hqw9ykMa8PlP6IbpkdRBTn2lUvRA0WhKmmXjI4yosnVRfpS6VnnOPD
	KpW7It1TU9lntq9d67h23PrYNveoFxl0uVStM8Qng4j9vSiuCmzCi2hw1TYE6SJH
	pac3WmJzXDampdSRB9LsHUa6iE8oycK7RO2UTvon9tvmIDadb0x52MjqAo4Zoakb
	LrXWYpfdIiQO5K2DvHVNBg7ayN13bGA8KBCefkaC4gI10jOHI70/yxUyHEJWV714
	x2lxAywn2gupmfAKeoUOt1AT2WMq59n0jlcAeVt4PYzwyA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4vcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:10:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7fffbe0so37602026d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184251; x=1791789051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekJ+QIxDug/CGTDDlwa0cFisQBqM4wqLUQXr7Sny7hU=;
        b=YD4nIAUuO3JZNl6Ewb9qRCaTA8AmvE0zktXA/E0BE8aQUwT0GR4WhjZTCKtyud3SKp
         IfDR3GSasD9mBCsdkMkjJG2pyR0T+QAgtjYaQ2F8lWsniAqjlTRjppY7wjaEt7MCYvmC
         Kt5setyXhqnTC4KC3pnXBiLdO83W3TDt9tDFOWBzH6VOvvoap4F1FKYakWaCDLLqoFEf
         ZexPaS1ktTPOJ8TDngVmMHuxjjYtOUeJG2w04f1R6a1HnqeaBklMl5CwJ0iI+TaaI9QK
         zi7TTdrJiVFixDxLLrHnb412qoNotF5UhFc6hpIdQip5MNMkAxwoHi3A2BIjKAQWvy3k
         Ud7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184251; x=1791789051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekJ+QIxDug/CGTDDlwa0cFisQBqM4wqLUQXr7Sny7hU=;
        b=v38SW84MGhMprRRgXwZ4NX/UFf6t+vO6dLzdLHZDE/BoUl0YtyL3Q4+CSZ7WF3Rqbc
         rD1v9csfKLDh/UaYAiC9UI4hcyzB5dWf8BO46lfqYWr31V7YDmt8QeLXKZOO5zDvgMIS
         OUfrV2F29UkZam1C0itTUGduU6wQ47g/vyGG26WKbztt95iao/shYKyuO0MBRQA3c4aT
         5IOqMTn3Vo94SCAuixAC38X1WEeEIN2r8UJ//ExzzxzpDXOfljNi/aXvC24Ho+QQr8Ny
         mfIg7n0zc/8quifTYRoxCCJVAhP3jeA77Slg13Uz/KfApUwVYoFH/fx3pLSB11T9IWZh
         JVSA==
X-Forwarded-Encrypted: i=1; AKwUvBznJ/pNeax1MmkjUSPGYwPSC8yUtczMsH4ClMNLC1LI5iVndOAgXc5llCvv0VzNLft/mmPD6GG8JwjrJgI=@vger.kernel.org
X-Gm-Message-State: AFuF++m+MC00/Ove+O9Z4BuvvD91MeogCOVCCqg9o1UdnkPp0Ro2WQex
	/OIqkUNrGkF5Y8wcVMi2IcSPF1hNJ9VDcbnbVfhjI8yewCNUjnsi+BIZg51jgEkoGJJK1vf6Ddu
	Lrc1CS3zWfg3lWnU0aeYAEFI9X48MMGHkLBbJyvAtuc/1fB6Z/QdtjVrX53uoDfqeoVE=
X-Gm-Gg: AYBFou0EcGVDN6R2VQXQ/iDUjIpov1FtnpxQ+EZTvoJQaIAtiSMcwnmAmrgTpx+AhmV
	BRxwrbY5rgSoOGhBdGFY4Raljw21FQ7VgO26KIHoZYsWGde4WlQD8uqALoBC+w8zzY7WuIqrDVP
	LUz0X4RbWczoIpkvcOi+KenT4v5AN2u96FMtbZOPzASLu3qhp7SKsbCmitX/Lpqz+ZkMRGNJs2r
	VAEzeY0x7J2q3w+TQ2hqfMprYuNe8pD18tuoqavHDIDRFCeYMtMhacDPV2Js3aUZ4LKXyMRhUmF
	GBDdAGqrzoCsGWYN8ch4YWY5TPzYgTrmzYRcZkAeeORn+jaBoxHvKaG5OWwzGPRyr5IPAHXx5Fq
	l14e4omX/t4d5ZWxb7L70JIHlCEniCVWgSIakvRDLOoe1tjZjCnNXuc/Ws6oujwhJwdE+Qtoi+/
	yxfH1pRAX1U/Mv
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr1821043285a.0.1791184250523;
        Mon, 05 Oct 2026 00:10:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr1821039985a.0.1791184250067;
        Mon, 05 Oct 2026 00:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcbd7a9e5fsm1036221e87.80.2026.10.05.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:48 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:10:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
Message-ID: <ltg543gynh5obljyqbtnpn3mnbdpmrazttblzpuvugoshqcdrw@dxksbmbtnyyi>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
 <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX/qmm+GasaDFd
 lequcTKF9WAGwFnAtyauj1kuNTjMKYfkd1zqD5KRfRw2wfRRWcAHFn1x4X1JxlekADzGu9F5l/+
 +5PZZzpE6lpomvDk6j7ySyXA82GUhABL7iGcr8FnGpg5BLTRj3nUO+dT4PLyc/lNTBQht7omBZL
 +w47rwkLn+iUJ8HSzqQXRPH14ogTXm6tAEauI5auJtvjx26iFZnckjw6UsggPVhnbBnc/OnxfLY
 d/Qo6lWfhaY5lHvnffgFBRIgI/EcmaQrXLVCcXstQywqJcgg64yw01Jb5kk5DXxbR/ksPu47vVN
 8iUa4aFINl6ibMZb5nKdO3dEc4cAT3l+bKgohkI5VJusylFiZCwCsWB97fz7ULSlm9bN52Zm4Nc
 NpRDp1Jd48hmRb/8mItkx5LbYUebl/530c4eHVMSgsOAk7aRwwEcNIPV+W2W8Dt3Vep+yrYnHk+
 mAdf2cAMj6+vhKKASEw==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac34d7b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VaJONqEZ7KOUvF9uvHMA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: WeE76l2j4FiD7r03D27lK-TlmEYYSzTr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9mJD6XbPuifi
 Jt1eQVUggePnPTSpYTnHlO+z7z0ppppW8ja3oBp3TjV+B9RPYwTuaePAtUAzikm43ykcD5mWMWB
 l8Rv4pFIYuOLLnMwpSneR5ue2QcYKIg=
X-Proofpoint-GUID: WeE76l2j4FiD7r03D27lK-TlmEYYSzTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:30:21PM +0530, Mukesh Ojha wrote:
> On Fri, Sep 11, 2026 at 02:38:13PM +0530, Maulik Shah wrote:
> > Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> > request instead of default 8 byte on older SoCs. The write request
> > continues to be 8 bytes.
> > 
> > The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> > GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> > length.
> > 
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> I know LPC is going to start today, but I wanted to highlight this patch
> specifically, as without it, both Hawi and Maili SoC do not boot up at all.
> 
> Can this be picked up as an independent patch for 7.4 as conveyed in the
> cover letter?

You've sent two patches in the same series. Typically maintainers prefer
to pick all or nothing. Also, Fixes should come before the actual
changes.

-- 
With best wishes
Dmitry
