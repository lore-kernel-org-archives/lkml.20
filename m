Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269454;
	b=wCcphwNF/9hY1GQPuwu039hkMTgyXFCgxEVbZPDwU9R4Q7ISzMWl+OBZd925jJ2/BSVO
	 hqXLZsry8NOkdXmihYsIpvtxDTlPAaj5koo1pSSnENP63YhldO5ucyjjSaVQmO1tvO5fP
	 aY0zkYlhjaTQE9Afw+HdOpGj9VocAUovA06WZpmOn/SZ/a6y/tSR41/CLpRrfnLyJ2Sgz
	 Lu8aZXZX/bfSk5nVJL8wTDx81sNf/h39cTs1vItG33Rd3MHZOS7lzJIZLh6B/X4ediDUY
	 0DnKYrQxjnSZZTPL4VY6HDIhV99O979OsczaeP7ZqRFZ88c+TeobKxzVFf20xYR48tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
	b=isSqDqgGGAMBLlEfco9x9IxrDMrQYSfvsgiUox4oRQV+WHBavDqp75E4T91A47M7BzeS
	 30X5GXNV0yFtn2vgamyoiZdkVYykVECX0bCodJErJCPUAobVtkXJvg/VeyZdwhx3NKawa
	 1RQiSpsQt0uDO0J15EobYR94cruMGCDhvHCCTi2mreJIUF8Ox0Jk1rN+EeupqmEow2zYF
	 XGc2WLoT+3m3fyXY1BBbYlztXdC5uZIy5+mY8Aj2fJRh8Kg6UN9KmSKRiR9yA/3wcvzOp
	 FtWsiNeGOD0EJUDMmstni2D2RG5FRhGjsqxbeC8icAaNK6UWXcOmGHnJ7hFMjFsPWqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FD8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jFP3607069
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNrIEX2HLFZvWx0hb7/TeOZv
	8vO2qpCvpN+LqCQcSDk=; b=WPyC5VYUubHpQEMXJRE9GWJ4zuY3zgsVgzNb8E6s
	2QBuhmjbM/EwxQwjBIwlxBLTmcyjHDs0t0tj5gjrRlsZqze/e2zv9bBHjz5ShGR7
	76WiMTlgF9K+WCPlXMxch1M6wO2v9jJfHrMwsOOWR9x+8aZvX161iNZR0it5dGNS
	Kxizbnl6tsmkCpFawBuqr1OBezAsFhwELNfWSaSWdmIxTWUD2r+taCfqcJ6PZ6cM
	S1u5E56GL5O/2iEm80fPjTQvZu5bTCcf32sz7tT+cUfC2FrJNhHwmEOb8IGbqbBD
	kgjgO8ejkBGLLM4o3ixxeJIQ6vsYzt5h4W6eAuJPbwmkEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg2c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso361915285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269452; x=1793874252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=ZgziJLqaAY6DHyANE4hvLejnsK0xeaSDJfOT4PALWPvLLhvGfoXmn+GKZ2cbM4zbOt
         5Uzg5OSAaFj9XCpBc5bUgc2plC7Jlv8MY7yk1eX1o1fOkp9HTnu/DhDwmnKS6pU97JlT
         q6el2t4YIo5mb1UfeaRn4xH09QBCYHE4JzhbSJ4iGM7b239ldTzxKaMZHz9vcHwHRgLT
         nDiqfH6VW65vytZa6mo088SlNt+UPBbVvZf7h9Oh1R1r5oVfAtkIBcIbqWfVppAKPNaM
         6Vrz9GodQIBH0YdnTeL1yTr4kFlXub0A0+tkz1ypjCJ9utV+6j+l03CaohOA68XZDDVw
         vK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269452; x=1793874252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=YThFSEzTrSGCmbmUrUKPBKD3hibr5DXXB5dEb6EaRxrJZ7pqgr1hU6Mfx9VVGU+PQ6
         zQADfvGvokiSvDbjuhBKIk5vmZF3X6Thv29dzMvUs8PWuD3R/gfoRoAuOckDh/fXxS9R
         sLNawJSBlRoSHWQkWv9190WSmbPddFecyh9AoDN9jGf1xUeHP1mHItMaa2PFGsqxtO2K
         YzPXb96fIY8HkrGqLR84gr50JDUTEk+H3NddVTKUZF2y+BemGSEQvIx6sPieL4yRTn1S
         geqvZvp5gXoDDQo7mwMkimRGp8kBEV+JGKhQnVNhXIWzYX8l125GsNYDOFUd4Ye1VDe+
         n0mg==
X-Forwarded-Encrypted: i=1; AKwUvBztqDJVeqepVRWhExrf0PkCzFoOIai+aG9v4IF9L7ACvPUsgZR7Y267SyycP3CMDuobW0bFmYR6RuNZrY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7aSuWKmu9qrKiKceKBHScDMS5OQn1bscf/De4lcsQ8qp9nzDu
	2QKZq6IC2LbtG61lGVBu0ezri1bK7ALjNjTtFlV3B6HA2Cf3Hrlx2TuiMc0rE+7fFVOqs2jlhd6
	97Fl8dCCAdamKqCsQ2khSj26rv8QP4tfasCrAkw4YLbEUQnUCCYVKyfB7KUPEi2zraaQ=
X-Gm-Gg: AYBFou3PiL/S2LPximOZw8XSkAy0dTverPStqI+oooeO0S00mm0pxrgXiQNiiMD0GuL
	EIOoO/rtyK2bmrwcsIKbvUDiQAbIhWyMocGOxmacj92fdTGyFXm4//Rs2aa4GUi0HH/pv06dl3w
	crMv/hLzSkm09tFPOfYeMVT3N23K7DismVs5jdb6gXNE8rmOFPVxomEeiiifaY+ubgJa+uj4TbV
	B4vwvLk9LxqB4k/5nR5bG+in6ndvXqIzcCRgw6BBRylI19DFrnDfxtS5nLzKnDTnPoMpKZaZqM+
	HYhxZM4MjNpvHJCz3U/ZPWxAFEQRqjJfom97linrHT/HKQ8QU8hxVkYmu010E3fPgUEiYqYhCPp
	9OKp/noGd8tyMkv61QWfkk0dbfLb6PdNN7pQEytgQ80jqNhepos+bSnaprvcBMhM9
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766983285a.15.1793269452226;
        Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766979685a.15.1793269451464;
        Thu, 29 Oct 2026 03:24:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm33789347f8f.25.2026.10.29.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Message-ID: <f7rue5rri4gyfs3ltczakyonvejyubjbocwabpffez4wnjolf7@b2hnrwwp6mil>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX/dNbywSWq5i4
 Ey+OB1FF+Ls9VdXM0V5o0ebCoYeI/eAvj5PFiwf444GlgzAYnWeiYSGWAPrQiRmPqhYLeD2HMs2
 9TeEBq3HdvoH9/u6o59XF6TeC0RppzUi+QxmqVR5AledLueAGcRvsX6b2YtGkCj9JwlgwNF19kd
 DpfaKrK36x8wgIwr5lmBVwUANjUprUbCxKMyrVjUNQtxoGAfpJxZ1iMwYNTme1DP+n0ZjBngVPu
 ZQai1lgYXwFbMXlxbOEe8FiJ3IHi89wdScW9qyTiAHFcy1PVdRyF2k8YyV+nvZJgKXOhER6kxHR
 1xV3iGKCjoSQSgPe1i5U1/XPr9bWsXQbKaLW79RtwNpjrrL3AfIEN76wRIbsvEzGguK3QbhfzHa
 ssecadVBMex08uu/tQfNLp4uvdAeyBvJ17R0edS2smS3wBf00gCUg0y/PBJOENmsNkpEvJyODyO
 eiPSqBETixNHxF7FcAQ==
X-Proofpoint-GUID: piwWzNuVx2OIjcsWWgYMKbqN5M1tTmYI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX0qlklfdxAJaI
 6hs05gcMY+M9GzHaDLhzgpJ58U9QE6zydZXeXbkXsXYbgDUcXyL2zU5yGt+2JxxSiXvI2ZHvHX9
 6XjL32ibnTqHE9EjP9ZJPHtGyDQPBIw=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae31ecd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DZmtaFOGBJufDib-chMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: piwWzNuVx2OIjcsWWgYMKbqN5M1tTmYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:03, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
