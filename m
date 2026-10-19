Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6674E50D8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410451; cv=none; b=abyFqUVPoGRazNSTtAghZo20Oa3OhPx0abT6DXjLNjC2sDdLKt8li/gstrr0grHr+PXtVb0WSCxXpsa0zn2YAS9GIUyww1XFcXmwtBiuyEbGEo4p2z9zECgXCI6TQz0avtk88+rarO7IZr9mNkRXR8kddpi7yIclFnZSZ9kBsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410451; c=relaxed/simple;
	bh=gOZDEHU3naOYoLL7egqr62uzt91zc5Wleb/4QbrTMNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7KYwSiIvD69G0MoNkr70r7LHuUoY/6iCgcXvbQh4FdrI0OFByuXawtIQ9Ql6QX/TgBpkZDnSxXASHpZlPJ3mstpRJc9nkoRdEGrP8K8du/IgkA/C1D194xtBEGfUqUJeiwGPGAijK/+sPuUOlvwftsXyUVGmzew1Ak4ZXUGX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fds1VCWq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9QUHdS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fds1VCWq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9QUHdS9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Or4b2234322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=; b=fds1VCWq9ZZiUZoA
	34xGZhm7jCAyiKBN4O9xLOvroe9NE+XfBXSaQtlVn7+U+h7ZGkyDxPR0W4CwTlL0
	7BrYcJ5xwrb//skXLb+ynXhly30joO1fh8LdGd3TFO2hpX4ycpFsROyN6zrJeXd+
	fzpiusdg+iBzjJSk3sLr1IC5Rpcde21f31a5AOG5ahhHvqp529wlY/EdXgbGRAnw
	u4BOdKijcEEbpWBwXsy48L2JCPitLnBA5ZQmfT/jjEWy2yYN9n0e2z0R+SgQCvsR
	z4i8/3t73LZ3NCx9tBEwCD012L29DaHnbCZ1UkNOhkxAi38fIe/uJymYzdjiZKtD
	5FoL6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8wja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so35301785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410449; x=1793015249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=;
        b=d9QUHdS9aAz2A6D/9MHj7uEDndMVrQujcJHaL/0tUkbyjILUWsPVDVWUIeBG6bhEU6
         iPR9T2fdcFITQzXLafuiHOWEYgf9ZlQtlNkLGadi57zf0UBH4y4bI0twFY6c/G6UAmjH
         N2WMH6rEqLIuFw71Wq76sAqVD4WmOyNXWJbIdLtrNtDkQLGxMLiksz4ATk42+v8TM/0Y
         JUCi2yd1e2IfGqR6O+DC8U7weX3tBwXlHAIMa2fPnGn3uvgAd/au2ymztkkvhaMGr2vK
         6yKQWJr6G5MGl7gOzZzpfYZwhIp+c2UQg0fQt8VU/5H7Rh2K8JaklwYpUv8L+SRXKXQm
         5jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410449; x=1793015249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSnBA2Qem/ruoTNLx5exIMDknp1eEWtUaIxZflIr15I=;
        b=pV4N7if3pgAq/rDqO5VEc3fHTA6edmZVEDvElS099r2BPx6PVzLBEOdzHzx/ib6Y/a
         +kY3bFnkMKUnoHvCGirEGwAj14w0YrNRvWYV4cWjJTRdTEvvWtxSnvZCr8+2lzr/Lrq4
         fjD9lbxOIFueMAONTFnQC34J+DkTecgs2u+ls52yZR8ZM+9HJVUTYLDg2/7IKEMg4mus
         PO9cnIoW+VO3nd55YDg+Brs2pVYAXOATaHrGseC8564cqbSVt3VJQz36l+UQEUbZEp/a
         b+kFfigE8qsTOJVIP7L87nAit8dL35cqcfQqmqW/StpmVekaYIE8HA5y5ydEszFnKKcT
         8B9A==
X-Forwarded-Encrypted: i=1; AKwUvBzdMBMIvuWD3UiGClvCQ6UnZHHIi9pI3s+V/q4JHdb83jv7LMHStSe0MWHgEontbCRknEr064KO8oGT1mg=@vger.kernel.org
X-Gm-Message-State: AFq9FYINtqjtOxIhtyG/UcilsnXDdJ022ghiUYLsvER2D3Tqfu3NbDE5
	+ywzuJ+Xv8Iiyee388RQCkhGVkYSkG6kDzuie/ifecPTGaCBfzrWofLfY/XhIkBq9wdGpbVBD7n
	Pynk8srgvgpgOSKSCEt8RRHeeuabCzWT6Dm8vc2nip3puti/Ucw2OIegRXd39/F5EXho=
X-Gm-Gg: AYBFou2V9JBsUnXxiYlwk1taWHKODsByZaT3VDDiDQbd6aUAKt7cN364Ksgx9lChgH6
	0yqXO2MKQOBPBmCgzhc4mdchuVUqczgB38w+9JgQ2Ipb5drBqm/lyQLFT74xfGiDNFBIidxzU2y
	+nVUKyNm1Ox/VBeUSaia6y/TPe6K4pmFxpdepknZYCLY9BLo/lHyelLYie75PC6Vdfb/VcKSkvg
	/qqE5Aa4kIWRY1UDaTVoapqTVljKfOfmFeq5VVFmBYKCwSnSEm2ZNiwr/WDOP9rCT4hTxy03BRS
	1y6Zkd2Ew0Cu4VM2jB5tqcjnp/mD+Mfsml1yQCKdJ+Ec7F2R+gz1SlhNmeyeCfQIlC7UNLKhVQq
	N0ChqQVRYuBLZR3y/B7EI+A==
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr1384648885a.2.1792410449157;
        Mon, 19 Oct 2026 04:47:29 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr1384644385a.2.1792410448717;
        Mon, 19 Oct 2026 04:47:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bde60sm338607366b.60.2026.10.19.04.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:47:27 -0700 (PDT)
Message-ID: <fda445f3-8d61-42e4-bc49-c4d5715254cf@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XuLTwgxShzcayCBDkc_Usjeu29ZvsMSX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXx9i0Vcv21c1n
 NmIg07maiD+yvTz6UAlpMo1H3ZkpEWGxRK/JAsP8rspAOIRzBobi9EafyfEVj7F2MDnNumUh1hL
 gIGZi6iwdlanJOjlEzlrnbm+7tSmUak=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad60352 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oyhz4BWCyAMKXFkMYugA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XuLTwgxShzcayCBDkc_Usjeu29ZvsMSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXx//VjL1yxtBR
 IPUDoNeCA7X4qFOSD0g5Z/woKDhFsTDT7P6YviuL4CsNOzzFLs2An4/X8kpdwpI6EaAQ/ooy/zj
 2AhqKtHwI2kql1y66h6pSLuv4Wnsq/XiUH8KM2sU+h8cwmbf+TRsr8mWOL2m3nQ/an7NXRu8CDP
 DWR3d07i8dwlYJhNr24CNVIQgaFzFrMR9AnOBZ9MV30CdFdk67WPQlGLvndgFANl3Db16+8Zm8g
 tF9yKPfmrGLsKZMA+C5pFr+C8sBzEjaLUGknMb/rwjGsCV6bU8OT4OfRqT/hEGeCIL7KaWRNQYY
 Xi6L/VrW4FUF/HZLVJUZOmD++dz6VCWAzfPH1nCF+KSjMDBbeoaMvcYXVJ6+2dkb1I7bOoKW6Fh
 gr8Y8SGZk3FLU2uqLw4NWkWNxbAMapME+IaXkFfAk5hzDVU84Bpa+LhFstOsCox9pSJAXJ6ewQ1
 +Bh1Htks1lmTt8UfmHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> The SM8150 HDK can be fitted with a display card carrying a Truly
> NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
> and LCDB for the bias rails, and it is mutually exclusive with the
> on-board LT9611 HDMI bridge.
> 
> Only two of the three WLED strings are connected on the card: the
> backlight stays dark and the boost runs into the overvoltage limit if
> only the third string is driven.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
