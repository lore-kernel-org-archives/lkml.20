Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABB3A254D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025463; cv=none; b=JmldkyR485qxCuLc323U1iT+WbTgHPpWUMumyZIDxiXxx0w9AvIIppoqHGrB2ugJSJcvt3RQGk3da+u5btB+ITdxmNrTDdKXA04IhXRJ4ClXFO/dD1q6fm8ktEsfkOr9QvRYd6uEEBpn132B91FESl8LuIbvgRBdFkR+uSZ+YOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025463; c=relaxed/simple;
	bh=AyVcerJHylSNAM2SKa21XKFVG9gJYJzCjHvH/GGyVzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUCmj2QBpePiOcmesFLSfQ4+yCzMiddk2ZuM96FRMrDWP139lKpqkoyvQQGE/DBm4eUbC8x/gnukdsfzr4x9Lzuq1YHFz7YrZAJuxK9WxHwIRT5urjlD61GE0RvD3MIdtqYMgUiy+771QmLJRhetun8tO4Y1ImxVD7lZBzLLNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnZWzuz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifh8Y/GZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnZWzuz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifh8Y/GZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gu76319266
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zYEZTvqNgq2Wlrbj8LO7oYe
	IOOP1BRgRUxnk+w7h7A=; b=KnZWzuz4INn0Z5ha0Dn1qoEOhlmjLOGSGoFy0mk7
	fAFy1PasPV4rldzbJ8wtupC3fLb/1dK5o9v7q1U/OG60YMzkI0jqyAaw5A/dK13b
	qGPwpo4poKJvj/i4sn14KGuChASFiNRphh+kxpmS+KfMX0drTrnwMk6hx4To5Raq
	CgR6P59fuoR9yLkVxq3W4jDPm2s5Yfm7Wzwejvx2RFDsccwLy1+mY3GiVdNjaCUu
	Ev+Z7mCeB6T4jA+n9wcViKwoTi/By+B+THv9clK3QCYASPF3qYDkiyefxlseGytl
	tv6EJ2vZvvPGwN+oGIreFrnrwkV1cKEaASsbt6H+WmEJ4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2n40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:30:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so1354383685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025455; x=1789630255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zYEZTvqNgq2Wlrbj8LO7oYeIOOP1BRgRUxnk+w7h7A=;
        b=ifh8Y/GZFxLAUfD37yUlmKmv7MzHi/dbAqulKpX2wj7W7h4R2NMZTybtBogf3S0Giy
         ibh/TJeTqpVztZODp8OA4E5T4oLm057LlGIUfz23v+KnPoYC9U7bdk11z76+0DJPUU4s
         WGVd7Epd+3qqsZwgAS1GMQSAmKNoOx/676U59AXvlgbJ0BTLbgx5X7mH4N6gsgZuh2QH
         4ODfjD5TKDWEGDKC/U0y9QPcBek4ARZCCYPqPJaX13yjb5IzJjbqeYdotbax3yCvAzfK
         NdibcZOnxGrwVarYgP/OP9YO1fPDnG+0rO/1DHyOpYrCaV2ktsGHZuv4/6b6DRL4HoSh
         pz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025455; x=1789630255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zYEZTvqNgq2Wlrbj8LO7oYeIOOP1BRgRUxnk+w7h7A=;
        b=rtfBAlaVXwoxrNWDeqdWmTQ2E/rFYyFoXvaaD+etPGUyeeSzcNudgJOWDV6gZDh3hE
         NPMclS5GcupfsZ/v6snp4BHNZFp3YrcqdAv+xK4aqpYl8gvm4n/I4Zex+cu4WknbF5DO
         VdsZtxOx47yaSIPEdEKFI0wK53yhe77yPR/aeGbI4qOh3qKraANS+WU6WknYXEVum4/o
         VLZj3GUlnAQ5VV18J8fXpIuFW636sOFjWz2nyFSgKx1xOy8HVFRxtJzvYttHN/vFF5uk
         eNDCfa4OnHzPGuHWc/5wXx+9jr+OA/HmecICPrm6GZf4NoX+Es+3EFD1Otf8N2PN4iXg
         EBoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy97t+QQoKsu5MLZsbWRB9BnSlgv/r03u+tUcCj8FARZvysqMpjn5tcaH0tY7yCzbwLVlzY6FbzX469q5k=@vger.kernel.org
X-Gm-Message-State: AFuF++nSox09pDdidewAET2fra58WlSBX+78GKIU00u/jEv04nkv3SmO
	OJl0mCDXaacjUdek1t8eUnwAsOBfzLHYQ9oiao1ay2WvwFzk+uKNrRLmwD+4BDZB3hzA8vosDIX
	ABKo1rIgwoDj+3KLDLO7vtA2UQMKRC6ZNLTP9GM9ako/Bmm3fH5WgXPTeDXuK8NEiiyU=
X-Gm-Gg: AYBFou1A0J16SNcO9diuUlIDKPe4C8/XunY9qLs4pgiT/OPRoT7Rb5q2fXa5G4o5qSK
	0kjNwC1WR9MGitZMuXv1zJcORB9Uy0xUip4a9nnA9M4vvkZ/sWWru7tHAyLwvFf+xy5oA9s30jP
	dPoSsHVKssiVMaTmLQieibl5W7Eg3cxfGtiPzXVJ3RFYH+NRkBaMiL77shGohuNk3d8ZYRxQwZW
	qaqvXB/DpZK66tyym7KzIAhqoK+607pehDT7ZKXHv1Jh/5a8sriTq4vx80PmkO64KswL0O1KsfQ
	DeKb5lMlROaCSskrkqQ78d9+CbWbnHZUKllPtcz6rOzIIzpy/2vZify/2XZH4CWn/BBxbpe9MGj
	vfCDDK8RZ/FlN
X-Received: by 2002:a05:620a:454c:b0:937:27fb:96f3 with SMTP id af79cd13be357-939d4972f56mr731156085a.17.1789025455345;
        Thu, 10 Sep 2026 00:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:937:27fb:96f3 with SMTP id af79cd13be357-939d4972f56mr731150485a.17.1789025454831;
        Thu, 10 Sep 2026 00:30:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm55293034f8f.12.2026.09.10.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:30:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:30:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] interconnect: qcom: icc-rpm: Handle
 icc_link_create() failures
Message-ID: <squplyvzsl743rhov266cdvtc2wkahxfnem35gcfus4pnn6d53@r6ofvrmh473j>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa25cb0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sWVvvRLjqkiOkWxATgUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX0EbgeXaOS7XS
 kCU9Cu2o275jAnHZCLTzLTEJGXCIxGz9LU3fSoPB8Fz7socL/8z2bZ735pHqu2lTBvJYn5NoEe/
 4Xnss4/dE+VSC2CFXhArI9vXi+X6Dzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX45wK3G9dQ3PB
 VtjMBVj3zY3BgJMdv7t4lfc3fSpkwFOQLbLPbpik6CS9yUUWC8O93xzhOyaVDwNzBdJ9Q1S7wnx
 QMdsNPwtO3P0spP1JwvnXeUD9FzVMaJaSPfd9821rM+8yNr++JIucPNoFx9r6ViKctTIRT31GaY
 AzaEVfd85fAz8mTG8WD7MX8Tb1lUPbyONDSMj4VPvrhrnq+eqLnqBifAibPhZng8Lz8STtwgqMF
 SYsqqvHK+ND25tuoh/p0wwX2OfbVe1zcIXIUWPQLckb0Lex6phndzo+667Vct0DWsbsgb9QuBWB
 ro07XJ/iGegjtLsSdacLcOrDBxSZeIXpSHdR+V4po2bBf6sLBFFhDrldqRxdLFS+UrcbAPDHAuu
 vXGRw2np85Gz8+6cbDzUsDg8lN99/mmhigGshGNG+8dWWesBfvy4EbhCQpNzh6o1EsE9KfPNoWI
 XV+TJOWN7pHyxMBXC2w==
X-Proofpoint-GUID: MfjPJB-jr5UjzXf6lm_EBSrEwbObmweY
X-Proofpoint-ORIG-GUID: MfjPJB-jr5UjzXf6lm_EBSrEwbObmweY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 18:41:56, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> icc_link_create() can return errors. Don't ignore them.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
