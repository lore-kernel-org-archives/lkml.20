Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A1532BF4B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917809; cv=none; b=m2Mb8UFRbU7EK/OEItxgV6zerMd1PTlVcxWhUOTCpmUBVsZ3TkMZI2nath9jIp3rJF94lVys1hYcvwIAwdTTj2sszCmFUz/B0xqv7qS77EOYK7AuWrroG04719TVIdLxR4I4TDwDR7teHICb+yCfr+kkSja3UkUYdC0gWEoCaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917809; c=relaxed/simple;
	bh=OPMKygoceZMDJyOGH20lQgoZZX+2mPTA8duNWRXxNLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYpxZvadgEyGE7rdWekWJgWpVidousYHSb9UiZFS2ityLs7/j61UVMMl8UpMTW7XP64/y08My7iPnFrb8N8sj5L9kZoaLcXrFuoirfCyqfw65nm2L3ZcJx8uO5Y7ne3IvXyTWAqPOep8YbMhp8abQrEBRjB98iY3Zcmx8n8Nl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhEsOIRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1P6lxAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhEsOIRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1P6lxAC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7pR32152641
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=; b=JhEsOIRO+a/i+u/r
	lv9dHczGxjqUsTe3Qwz8GafxHU13THPXMyE25KvSWe3Rd9gz7/laWRzJe5e/E1HK
	aOtHFWmWlGGLggkELzg7LfP7Z+T95CSgZ4U8Upa+ZXIWmoqBuMvvUhJoSJzXYZAH
	C+oy1TEku44trBtEavVlJIJfhue707iyK5rjK37AEi5pM5Fsh6X+M29mZEEct/2p
	TWAVHHmj+/VeRuIFhqmo7WqpjKIDCPzwHXCECiXWNu6neE/o/jj+NQQigVzTZ9tQ
	SNcmIJr7QuC+qmOb53OWtg3Q2cMDRAvQP75GTXjXvwUBwMZ9QU0rgYfGlE5hfZ0t
	STO2vw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9gxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:49:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ec554a80aso1515341cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917794; x=1788522594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=;
        b=O1P6lxACLh3x5S9m/hXkfZOudtyPLBYJQWHFtlFpGBlEafj4nN9N1eeuY5iiA1vdTM
         Vpa3YU6TO6d/r/VTD0kPNMCFgwAC839v4ZpotzVQx8H6pnQlUUCPVNAB3W96xLYTF/gE
         nleVW5ZgLJQaXv8UcpQNYHlPqwzo2qbg8yeRSaDY3SJ5PkG+UxMcyh0sqdqVno6FOSCX
         Yj7BGIJHnrJkZZEGD9RF5GJs+AiUL552mBcg5GRGy/oYpH/IIJOABd6IyYJlEnDxn8We
         IA5ZhkOqhFpdySk/H06dbJ1VEvsJPU5dG8Qx5BM7wtFAGVGVZ4sKVMvXzpvl8ysogtnB
         HpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917794; x=1788522594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkscxSeQA75G5CVLELcqbbwuEp11lW2ijBGhi/h86ik=;
        b=E8nCB3PqOev3l42vuUAuahi+Rpe77sShE7tFOXcNpR3k5brJuUGmRlbanYmfDuUfyK
         2tkXdkJQr5jvvEeEWH4q7GX38XRVzsb6zNAvX0dvFLHHZDnwWIrdjbhXsEvi1N4XzhgP
         z6FPD48DWuIVrCtKt2M6qXgYFWKKqRyK5jEIgXQtaT1cy1Vmy/8wb1mCCMbC05U4iUWj
         8nBrVthoLG+XiFyo1Kqaa8XMb9hsKjh6QNRyhdldp8Fy+TT5WUqYx/q0QW40kY4JpJ8f
         YK1ccgseFMoJhYl2OmH4VqaCM5SgtGbjce167Vx1XnDUVduiAB7P5+y8zqmsUvDxMmM6
         iqhw==
X-Forwarded-Encrypted: i=1; AHgh+RrlOH1rOYrWV/sMFsrCNVThr5wdlBF3A/V/SSbCWJzwhlPHiiJz3NMXgUMWTsE7QvGxLda9yn0K3zPqMwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mfLfAvyXXasj98N3+TbBb0pEHRjRKcDgVh/iB6Q19Ya4wLT93v
	bWrmUU4CatuYvJ6lBN7wpRnymywlGxgjYMeuOLVQOvxTV/+FBCpFd7A3lO8GP6glXfX4yNBN95c
	79hmpBmR7ry6i6sgNcEVwyG5dq73Ejb0heZr1jhGkTnPXEZZD4bENhwcbMvDSrgHb2ZA=
X-Gm-Gg: AR+sD13XKHw/Jf+vMzZmW7jKmvKOjtgp4k6VjmnG+qKrx1h17S/6cnAk4jnBwNzOVpM
	0zQHq+QK/DOejr9mRHSVDj23bV6GS5hOvK6v95j+ZzAFz+ol3Q0690M5r0p+hzsT1pWbK3r8ZbN
	1llMXFH0P2LzB7r8qumyS2O459mZWHKq3hVnDvDVnqeLd1L6XcC7wuplvnzwI356ncCx6RaJcU5
	dsi471OL8oo1HLjAKSw0tX0wmVU7kFMQRnsFKso0tWXW34/LsA9HwfakYptF5uga3bYtBDh8pDa
	j1ioRIcgaCy37v3xTcFICyB4TYYMwns/kpetIPgyr7SJTuGkUCgi1FodESF6Tq5U6ftKfAVokom
	BLn2ym6fMORi1wOBAJGLNWNM=
X-Received: by 2002:a05:622a:130b:b0:51c:2324:666 with SMTP id d75a77b69052e-52fb9603de5mr48555511cf.3.1787917794471;
        Fri, 28 Aug 2026 04:49:54 -0700 (PDT)
X-Received: by 2002:a05:622a:130b:b0:51c:2324:666 with SMTP id d75a77b69052e-52fb9603de5mr48554871cf.3.1787917793734;
        Fri, 28 Aug 2026 04:49:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38e82sm439669a12.19.2026.08.28.04.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:49:52 -0700 (PDT)
Message-ID: <cc0906d0-5a56-4878-88c6-24f28a7b2fd2@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:49:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] phy: qualcomm: qmp-combo: Update link rate
 specific DP PHY tables
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xsdMddVa1O6YIDx4A2Q5PZ9jzsODF4kZ
X-Proofpoint-ORIG-GUID: xsdMddVa1O6YIDx4A2Q5PZ9jzsODF4kZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX2HWLftkdAcaD
 FlBvVYrewH5ty6+nUxJFc03cs8tnlvQGFkoVPwSEFZhvZyh4NTZoG4+clSmX+QaGgy3WfSgoxMs
 OewR+qMtmJzdmK8kMYhEbi6Lb82ip9W0ORIvsX+6P51/j3EBRVt7c+OBccf12dAVREcCw3JcttA
 BFmByX4E/vpGzmDOSxAyvvwpPSCFpywbh1Td4CdozFacyW+kYi7hd22dUCSpmoyqvCEZc68tqrb
 ZYbKhKFlWpuY1A3LE5DrVy0ZcwKEBYKWHCgN1J/yuC8cQJ2PE23PWkbP+Wu1ZlLvPVgNx+ZU2VP
 zuctSx3CSLtE3a78y62nwKayV8AazXKn9M6O7ktWKs4O2Xj0Qs4vWPVbIX6v4BMAzWv4/84VSmO
 b7R35rnBmpiEOHUk1GF3E+35bXUdWX0ipbw1RHdZEN9D1zOCygXqfXZC4NwZUABJN3lfaca+JM7
 seC+JsJnmURLTg4CQPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX57ALBlioHAaO
 25iA8tKh4n56lyrxJiNxmp0D0/NkAxwHyxl42PuvYlBVdpUxPnytFLnYAlDZt29UnGrb8tANmnj
 8LzxkGGPJ5FGg9yUbIyskeborRiirEU=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a9175e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ICfJUWih502foIDt9eMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280101

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
