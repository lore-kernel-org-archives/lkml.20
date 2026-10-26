Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010116;
	b=qD7Wr2JKT47XXXBjDroDXXNcEKZtJyyxSwiRx4dBMflevwLSLR0UGoyF4pPztMsBFetH
	 yVF11CXNqPMd4uGFEaEViJhPN0UYoix1J9wrsWrpF0p5SQZ5lrIJQQbA4dJyoDt8B7T7q
	 fwJfoiLXkgnaUY+EgrIuedu7s1gQ2egsz8X+TBvDIRUj0CxLKZh55jCoNK7cT+qrfKLyr
	 Dsy6o5fo19RP0taB/Rav+d8yPWSR8+6+n2zVFbxoyQSccl151NG4rG6fwkz3n85yy4DgH
	 IRwI9dLdQiAP/1dgaOzUocbF/pK6C4h/O7XO20bXOemF3ZRIUk2DGBul2gvUG8c6hUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
	b=v5mD3hbICgdXCmTPY4cOtwuCZH+mTDiGlzewrToA3chKA7sY/9QQ6k/8qdQ1Ju4FtGf3
	 +MSc11ZYRjG/RWlnKgBVOVARydRgbvFK2EWtTAPLhUzowHql1zh7zWo3NedP6V8l7SJDG
	 KR2gvfLLokz5Mj6glyxsSF75YGuNLNIL9adDyX+VabnDqftka0DvHfM1/Y3YjN6gk8eyH
	 BMx34IEkM/pzumJu7kp/pYNv6NpSZA7Ebec2ziRsH6yWZJ5v01tn8sY5V+LiCowvTQ0ps
	 RhoPgR8dhemaNMriTK4R0LWj/fE9WOV5IOgumKYxLde/F0J1p/4IkaDfwPiU9YSDtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5329606A336
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5329606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9Pp718211
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=; b=OS5i0lei1ohGckgk
	LVcMu/jYPZKAuABOyZsoNC+h5dRCUfH/GbnKbZ1ADqvvkrJmhL0yatJhg4M8QUYi
	XpvXhluNL13SUs7P6oAjEbDEohq3dvXCaKCP1Ogy+di5E1b7sw/wEIa/gcA4nke4
	xEbOgsHu7kk+mRw4y2lBfRrI2X7itoAd3DWlTsdLWSv5tTz1JghFfnM3+VDy3TF7
	oUVT7PBiU54FN+9Zvwa8xF/wCZy5Nh6P0qWNaedQQzXPxB977+eh54Rd/P4XIQl1
	kTqqZYE778swsIGfAAsUQtuiSOrD9S/jcZCsPU3/2PHle5SqediZLpRPhwtkcPt5
	rBC62Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssyth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so552210485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010114; x=1793614914; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=bc6kui8Hxjm8/L1LiUCNEUnhUmvqkCx/W/HWctG5Z9TQkLS1ICjqWWkOyAgPJi1b2k
         oVNiMvwiGSdAD8VwYDrm09tGOWJeuA5dt1LJ/VKOuhJVDoH3EusexwloCrs2y5CN/HoU
         3+6gCJ/W98YvVt3rB08azfUAM8tG4b3pJVJGI/4B3YOf4HALI5QCwGjH2MUq6dMPY65k
         nEuhL4PIzDXehN2lNgv7Y6hKNnDLlQ3KiGqOI0A+vhPRPSTusBao22jh89GJQ4fgywJi
         eyTguFlJzGKBbb8JWwTvy7ACEux5AZZ5J2oUifLolaFcfP2FdPD7p6E8/1RoC5I9jYXE
         kwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010114; x=1793614914;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=1xh0snW1QRxUFuLK/GADQlgfpq/DoKabIp7Ji5milR3EsQvWJZa5b/1geaoqEKhZob
         6kbEfQNNTYD+gq5/wKxgSNer2t1vW9li84vuvwQGvO9433iarx99kwpddoeUe/QeVcDr
         97ThLkuWqJjZfY3oQswBdS8xwshyYpomHiBVea7fDy+TZDcP7KPamdnlZmrzf4c/uhBr
         VLXygxZA4CLTTgithwtiO7BWoSaGVzg7ghgr4iKk9u3CQ1LGXFd/O/YxzA2tenG7UA42
         O9XQAUeRnVZ2TFB0v144DK2gW+h/luLt9hmZRPkZdw4PvEII9RBA81UsG5AK3wXFk/NW
         xEVg==
X-Forwarded-Encrypted: i=1; AKwUvBznutH868mi2CMh4QPagl2aL6m6Bpvu/RwCrupuIvKX0AXxGHAvdE9Gn2i4D8uRCd0XiHDjdKTYSu8Y33w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkG2V1GWqM9DowM2XeItsuCkPxxSXIjysiJ0nhcqOr4pSkOXxs
	sJb0HXnN7Kqv1TWz4oRZrZI5TkJZGksHfIoSSusJ12h5kmvVZsaiUoUbzp74QjF4qqjyFirsnck
	3cd0A9DKwxUhVHurLldQmXuGIKFZZYWU1w83JaMGCJKG0HglbbTx2KVDwW5oOSa5Er/g=
X-Gm-Gg: AYBFou3rD5Qe+3GDk8/caEhUB/SaLlQ8DAt4CoUmU7kOLwAk8bNQsgh8vZQnHxRnIxJ
	JXtwdQp81RQAwhZ8s1DCH80odR2IDAAILHOJivf/WdM1uu/1OF6UzyoQFiYHnzJduZNg2/mlDWS
	kbhP9jQQyUyQXj1qRqK8ZU/X6aBWYgQW2ObojHgbbCicLAbJ53wUsjSx4FjS3oqFxsBiIZni7CK
	417cqUv7e13s79FG/z55WX/INVWDngzInY+ONvNFb4QA3MLcMvaaQwMfy9MQ68rkjQVYcinLxw+
	DIOuLiEv1j8/JwoKztW0Py6225LJEw+fVnwNbsH//x297GTrOtkTQhS3/6geJQpSmfukKXVl1M4
	qYONCzD2WZw==
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857663085a.41.1793010113959;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857658385a.41.1793010113280;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.4687696587079846041.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VDfkl1pHrWO8x5WUnVdyo5RLejkVUKoVvIZynsPeXcg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym38Gmfkp+9CDmzVg0zP2nOPOUWypdKV7+Xp
 jhzXrIm6PyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptwAKCRAbX0TJAJUV
 VpJPEACS387mP8Z9JLiUK/EEcahtHNDmtIgNJVSXO1nWeI8H1wYGkUTK4sHFzaNZ05wvvk63nbs
 vv4Q778+7kAvRUomzy8jSlM4Aoxz6CnDdIooM68hXf49sIVh3B8P0jyvJ8v8+Qdg+oUHiXOnEu9
 qs80ySTK/SN+YWZ21Ii6gS1YavOFd2vlGfCFRJ3EEvYSIMVdt+yjlsDgwvzOxMFVvpfa5CrciRR
 Eo1QCQyfMOnu5+fawkvFmVGVgo2lMpz2HyFkzXFU+5b/028wyk8iImUCYmfETXh88uYXYwsBbPo
 5uLGAlcBzlhb7n9BfPvyKsTypTu+L+MwRhfWTmXrFuvVcE/0Lnh5D64VDZDbdNtJqr8xYeD9CzM
 NfvdnzRikPTntBuPb3L+UVeacr3a68E2DLXZ0VoAl9iQylYw1daIEDcHp5u4c+s1ATT4bYojV4A
 JrQntQnhdcAN6/lXlgQ/XY+nnxKmE1Ql3Dxsrw2OEDMJL0yYAsv6WJk1wBUQaeTjZZc3QDfJeMo
 Lw+AY8KdIuxZMg79gHEzuei9yrAtIEfnAHhSv00L+54UoAq9A1P5xZBFfritdahfSuiL7xqLYmQ
 sEijK0aqe9CMFAbjXTKF6hS8nkih4QJi3igWYrgNIR/pfa3Drg4VMURWNBG+1IdYm4GHMMdbQVj
 n6dp4MKWAWerh5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXy5+Bx1lzUw+h
 k2u8gCsxMeWCw9n7YYxlgF3EtMx5qaltzHLflK7JFbg+TgK4S1rcld8KKGQ+UmSMb37Cn8lKnXh
 d/ppS8+s9uMo1HkIUarVaroM4cNNzw0=
X-Proofpoint-GUID: t0MlSspXBPt9g_KYgJeW5ospJWyazOR_
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf29c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: t0MlSspXBPt9g_KYgJeW5ospJWyazOR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX+vYXBIPFyGds
 rw0Y4DL9XE17k+ExxvXNgxQuPW82fYdw2tX5GNy3hyTY2dQCoAN0goNLdQ2DBMpl0otgmHvdQsC
 IX9zG/VIKdveh+CUGaNH74UF9PHP3Wboj/4ucZyEKsHOKMpNgPZmQFuGMD2dw1ziXNNVpX9xO2O
 J4qUXkAHBLTgxAquoikxufiDsIH3dyLb756ut6z9JL/1vy4JJ3u1LqbP6tNVZUkj5Uaywv1Izx/
 bEyJwG56PDSJhBZDLzn2tAAGcfZj+1W0qnaTTjqfKjVKeeW+WCaskmdgICSmfBofw4pCOXkKjw2
 zl+Kl4cvKOo1ri7xQBmfTq+t+nkdfn6q3SH/iOl3tSSTG/ws/S6fSJxSiOCCFHFnT9uBNqXaVc3
 I0oUQgVXb/dtK7XLsWTANCe5AN02R7mymKvnSaRZa5oJJw/T2Lmmu60J+BdAj2g2eJQtWgDcUjo
 ZOagliJ/q0lEKkaTxyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:38 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
