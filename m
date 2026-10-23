Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758638;
	b=pyMkGdpWCL51IONV4ZQw6HHMI4HDdKVa834DRdB/DwOla/yUtjjYzZ4y5G3fqwnrdbCe
	 hDT3CY3d6trDnmdAIbeR/LpSt/U8orq3WkNtsKl+Fgx38hHWze95Yl8ccHs5oirmHb3RU
	 9nHopcuCGlFZhc4XF8LhE6sgEXLlPiB7UvMvG1eDO2usvoJqWr+SwWdmAcq7JZlBmHP1R
	 5QlFOqn0+gnRcLq3KfwssHt0Kehy0bI7kc6f9RHuF3j5eZDTzwjFRLHAosGLRaje6cU53
	 K4NtHa6GvaaB3srBww8dCQCIZmUwQ0h1bp3Bi0u3+gdJuohYs5l3uyLjfJj3GM4MNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
	b=Cz2GTH/f8CrP2U5FoyH94rQ6UzkAnn8pMJ1h/el/x+mGsXMJkvz3lvVMtvS0aIfGt8UD
	 YXb1kcEgw+QMImfO2gAw9k5Ej+ZD/ShXyIm9xQCB7I4qGztKA5lP80QAFfQQAOR5QwS1B
	 IoGIXIcmuZQiSeidJwHtaTz/qEtd6EroRU5utarAgmdxjOt+BUhgSTznYLd0/+Uqbcb+p
	 +BcRdiY26i7X/6gnWlpKwrIW6exI9R5/8AR//9tqjmSPJoH4ceTM9Jv4plQX2rIIp3c9g
	 KntF/gRDCJJPFr/aeuzql0ByUTExdS3Nl8bNL/Nk/lzdOrNqPjC3YWRwM5k4sbQgR1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C511F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C511F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GefZOR9V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al0PgfCm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAbv23045504
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=; b=GefZOR9VYvH6EOhK
	atAViuU3eAyJtLYqjxrnvK/kHFS9xm0xRy38tdeV9SmjWO82HyM2sLAtwvvr/jTQ
	QKCimYHiLijfvBm1OLiLSCYFitDdnqJikRP+r1glZQZv7qjCLJWLZ5PxVuplORpY
	9EBXnnbKshrXsd36Xis1oOUz+0lHtrRD+BfoRXFxbuzCyhUIKTuZ+AKAMp7WhBxJ
	3DSm3PHsLgFkryi8SOI4inXDAItovCBMBcZug+mlREalBL1EHrN2nrKAHkS/Yhnb
	f+7TEEkMvwqUpsdhjKQsfRzLC4iIJgfM1E7t8diF6e0DATCfrWF3pEaBJGXdymKz
	vw7xkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjbp6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:30:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso2180511cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758636; x=1793363436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=Al0PgfCmiteEWZG2LKzj8/55fOg8sluCdF6VTZqVwCuKU5K9lLbNDemal8/2Lr4DaE
         a7nDBmXe7AZI1NTRh/2821g4sU7G9orb/mhLR4ssfnqJP2GyVuZcw+8q50PHNDjbs1dJ
         3r/x5NstOqtdRNEBvUHvf0nprsd351UI2TLEXzrJLownSgEeUJp14RPB2Y1vpeYNU/Dh
         H9DxF1cFqPeMkfy/U4XhULSpsotp19xfKkS5ChPBSmqYMnm9NhJFOCgW/c7fS/9Zy4y8
         k27ah1rAic2eUssKkz45BrmxYQCTPPtcK/GZ7zVhXW5bo1kJwshiz/5Amin7EVornZEo
         3Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758636; x=1793363436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYbMFzbjxkJpVo9pkN7QoDDHfc5w+jmedxWWYnZ4x1w=;
        b=DO3RxcyXEvTLbt8HgxMqiztdiKOwD/owSVuT1fUi+ThSG0LY1qfphr3vYMhX/n0j8p
         2SC1JtYCbDR6K3htWlchudvKnUa89I4o2D70Lth+ZJEtVwDuoEejjPrUD+2sZpX4vaqx
         tkhUZN8P9QeNtywCeNrwLJT377iriYa4kspvMyQaF516qCiHsHYmZL7VfQ5JRnM0Hstw
         vC3TU4LOSO8k44+h0WkMFEOKJcrL7hXRYGXzscuRp0hEdEPfq9CDztDWvmbsywSSUx/j
         G9Cw6/oUlIHrEAWJY+Xw6GjlrUvcpWp74wXaYXnPG5JGKXjS8sn9DlxiJkiq+O31Q5V6
         3HhA==
X-Forwarded-Encrypted: i=1; AKwUvBzJpu5xjeeQrN9VijphDlHIVuOtyzu1EbUxh2FBRxr0z/t2igZGJ6lB2h4xLXuQIDNsQvvwY3ZeDLwsOzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeoVno/HyeVtEUg1JxYRoPkNPlX+r/u3LXdWqO0vTai4ZafU19
	G3AZ9GNe9zEE5O41PvcU779ywZ+vArcFNp2tZ8aMnwqzINWv/8c2M3mufP9CMEtAky5Zkmifpww
	dyf1fh1hwoAleQenK9540eKhvHbCI6DMsZhC1SsJe85z65rufy2G5QDhps33u6ExPOy8=
X-Gm-Gg: AYBFou3etOOyDm/VNakTYraCTEeJZU7NM266al3X2qIT4P79lFoxW5cAnaFURWydtOl
	rQt3nlFXPhCK5bb+25kMVbZQDYctTaCybeeOfbYXpwCLrgJ+izijtA+rshtYLzbQRmGbJX3bDAl
	gLWPrpLYSb3K6GF3WlkZa3c/Cma2pxvXN7WvYmIUWMTi0EgztFJt/uZLyBfGBW+XCKhCrYIdSmn
	yZAm1FMf19WtNCa4ItSfco75Y0mhGDn5bJlrEhKG6mLX2HpO+QxYEkrNsJlNzegm6U4L6qZwaYC
	iTJYcKzmTuR/iHBbZy12GeTfeFFrw+nF0YX6D5TlRSO/8p4jClgDy4oKHXnFildZxjZHP/StC7s
	AhjG410hryT3DlC9dJn1y5Q==
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365715085a.1.1792758635881;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:a184:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f6f7a8441mr365706885a.1.1792758635248;
        Fri, 23 Oct 2026 05:30:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d17e95sm97254166b.83.2026.10.23.05.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:30:34 -0700 (PDT)
Message-ID: <ea77837c-0a64-4705-bd8d-946a0a03f16f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:30:31 +0200
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xD3GS_PniDk0jwjk2SSJBLdiSpbWj4zC
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb536c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MNZHkl_XmBfbRSJpkuMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX/auLKMD04++A
 z5XgcCmZ+RZUz/a1RfejLCIK9EfFbCVwWyEcJJDMoIBc+omoiR8CIIEZE3AjL8wnHNSyggf3I2s
 nMIfMh0PIaxZntXkHJNaY/zWKHWuRws=
X-Proofpoint-ORIG-GUID: xD3GS_PniDk0jwjk2SSJBLdiSpbWj4zC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX0WGQIGud2vmd
 dD0ZivlgQM9hj90Bx/KUEtAtQx6Mh5COV87+et+a4KlJZat1eaw2vE5A6VxBjy+gdA8H2m0llaf
 mXFf9RY+u5vhVomurFPAbHhy8vQLqiLbjcWElBXoeTMGI2OmxJgrzcnSetEUfuJVrptUwdWQaNu
 TXDl+VR/cyE/PvJDSLAcLcb9AkY/0FDM1CNtvAWuLh0mbT9Q2oSE0wedfqQExs2+D2gA6hpG6Qv
 8OTVVT8ll80+aD+dZiXs8Tc22qlQEGH91KR3yd4SNmnhAzDHToJ+o6THcEN1rmI9HnzkiYKgf5J
 C8bLuho3YUH8LXJuguEW2HVjXgktUPME9zNXsiITEZoSgZ2VYBBs8N0b4c9PHPoTp2032XIniM3
 JsSfLuH7Sb2G73QucHG3MT9ILKXH/ngDOflNhqkL8/unozYvQIdXZT9IJquRmvqMkgxCWyrGDz8
 eVzZHKEMb9MxrBeG93A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
> stream IDs per MAC. We should actually only use 8 SIDs. This has
> triggered a crash on sa8255p after a boot firmware update. Use the
> correct value of 0x7.
> 
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
