Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499573;
	b=JECzi7rjOKYbDCZYmbvJfibwJPnunl+AWFtC91NKYZJxBv8vC1AxY/Ve9Ye3Dq7Vma8a
	 Kgsbvu5CxDp1p0L0K0UZtfn2vcoXV4S0VGlU1Qouh+DqDWWxGb4IO98VBpdpR+X4TYQXX
	 zNR/+99Tin8rAmfVKFXdMc45XRExP/yOed+5+EO7zr04YX8xA4z2IWXQWMyN3BZxdOeB2
	 qN/w2fuDRJl2PhMvZR0F5CiVTsIrVp3Cx13bMzHy47bQgHGUSHkXUs5s/SdAitCr0rjUD
	 yXTo2KF51sHrjhKgXzrpXAlpOJcjSrzPBjHDuJthJfxgzLak86s8qLng+9pF3utPIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
	b=tHareI6pdac1zFN+0YetNJkjnrFgKjrtrwnvKuClWF+VpehIBvcuQ4VcIuQ58nSN5gYz
	 ClOLKeanXf8Mb+Yv67BJZuAEHR9UTxK3hgUz54gjwAE96GDLnr7XwwCiAcYqJvAVvCxdb
	 bd2myjS8UR6fvLkMXAjHoFWam2xBXIZHKH+C9IMcm9bnZtWmWpvnYkVun9smHAxwET6yL
	 aL+/avVMsBQB2pm31T+wPVozgPANT4EJVdrjV8EneBMGAeQW7C2sOLrma1IF3jYRumPY2
	 gzH0+G5latihjku8A7bGAWqgVyOCFA/G82mBYhJ+H3A3BGKTj839ptJ5a5MAf8+Xk/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvQyDKY9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKdwDSGR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20877606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20877606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvQyDKY9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKdwDSGR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxI7v1292949
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=; b=YvQyDKY9Wanl+MIn
	LmZuOeWE+r8HggU1EpMuNGxUZLchlJj7wEjsVulMoGA4LTFDrMe1AStVBSvwmSZb
	opCPIRWwkWGpt85Fqj8i5+JvZ1WspqBv44MDKr7IIQHabUqKiJyApZHY7VrZgLUU
	bpXJEul8WOrd0lMC+lo5/xIKp7PUg6tV9abJkNVfkbfT7Oh621czMa6xUy93f3P6
	K8SfKqWi+bQr3G+2DulJQ5+bAeEQfZDEOwteLYbH393suja5tO2uUoZWTiH4adjg
	FOK42F6SRNgPVaKpEk+H6wA3bO/9Zo2wt1WbB2+vUytSgoLhxFg2gbFDP7Gsf5v4
	W9QRIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2f4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:32:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so651301985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499566; x=1793104366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
        b=gKdwDSGRVNJ+WUxJxs6Rp0z5LEGqmYK2LRR0jJuNmu8Vq8563GuEJY6hVN9LdqBr2H
         bDWgQ0XDs9yMUbLhyArh8sPYCRjGf+ZIyMhIOKkCSGGaXtCn5EbV8WC9hlIiiQ60RjPy
         /sZetKfsSEK4PNqdXkF6tFnDQZgKWn5rIExfkmynN7C9veorTxzJxNGhFSdG5lOdV79L
         8hOZBkFhn+8EqkGitc8UloOdx6Q7j25dXwKw/F3iD7H8aGLGB2SlmtUAjBPvj1lzatlG
         V8Nn/8TjI2VENnNxXSfI9fW97hWb97TZ06NIlyt7geB3R4f4gNsYqmWW8rDO7AQ+c8EP
         pATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499566; x=1793104366;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
        b=MqRCZHDR71+B+UjsnHuVygbsf6F37MIh5nKZiEJUClksdmPI4oVqd25J20ZUN/QIBP
         RZXZMK3LuBebw5YryPwHfmtX2pgaUnUGrYxTs6MPjVWidmTisqGAPsOuG2z1bnQYjn3A
         Su3+xUkGx0VUmyjUa15hhTN58H1uNe8DkhFW87UoDLRLZsHDmGe6FsKW5XUC2QOlpvXQ
         Juavpc7MVWC9UN1J3qdKI9bR2FoyMQHj05qXEtGBrz0cHuGuWqoD7crzQXOepQsTcqgV
         85Tl6gbNCUgGUOHTDyItdSGEJw/yE4gS97Ak8kJiZjC2fLIwrNk/YswUvca5dI3xW9QI
         AcVw==
X-Forwarded-Encrypted: i=1; AKwUvBwMC/9jO+ngisHLLnvQmI2tlyFnJcYqZD+5/u+D+qDEYTC5vvmBScF+OGCYANQjUxn5PrTXTDmTpmdml54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj7jRdxmmJXs0M2g82RjHartb01oDfVjhc9pm50dS0wYmNNsFe
	P81YJ7pP4mQdfqGKTtnUqBZN+anrT/V2TENz8EeHYq57RuDG2sLDFR2eDXIlJFq4dNKyFTaC0qC
	Z1uWc8YYyUCktjOGdx3uooXSaJEIum5kBUWzTrFIEO+sFu8IrZGzsyh1ljl4z/TRxSyw=
X-Gm-Gg: AYBFou0JHgunXsAeXGmRvs4YQ7Nr8zJhHx5Atf+dPxx3sNEmD+y2rkZ6qEuS4LJdgTw
	H/QqNh1yW/L34IHJUXJ2ub+aJD+ofeXLECGXuKlo+f6YeEoSd9WHRcpWCfLEfIXH1iZjL4SeRem
	7LAc7fsF682L7abW1CB25SDBtNGNzztZGEO+B8K5YuTjHeQAGD6ksPh0efVSykeqGbiEVIGgEhW
	E90TEJhfsEOsADdiAVt2IOrxEDOBrXHL/sVIzJOSaZ9eiItWFrfiQ7c5D3YgB7IaOV/FrziUtbv
	5qCAMT5KgK63K+rjLJiarUoyBOAR347rqDJJhiOJY2/qb7s+YxueGhuH0loAUP/s+omOYiJv+GK
	9LbZ9vu7zQfJesR5JJ6w23Ws2aHk=
X-Received: by 2002:a05:620a:171e:b0:93f:5ac:14a0 with SMTP id af79cd13be357-93f29de3496mr1821373285a.67.1792499566481;
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93f:5ac:14a0 with SMTP id af79cd13be357-93f29de3496mr1821369585a.67.1792499566034;
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm5866725f8f.58.2026.10.20.05.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Werner Gartner <Werner.Gartner@congatec.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cgbc: Add init_valid_mask() operation
Date: Tue, 20 Oct 2026 14:32:41 +0200
Message-ID: <179249955802.22604.14302944831924075277.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
References: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rOIAKn9ZtATqfE-XmJ9ilrdLWKylPjtF
X-Proofpoint-ORIG-GUID: rOIAKn9ZtATqfE-XmJ9ilrdLWKylPjtF
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75f74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZuLFqlo1Mdk4vJeqesEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX5LKusZEkaRIc
 K4NGYpiVcduRCj8dDIEbs00HiPE3PXzVn67md5FsYQfmSZnWnlWJKWyscnIWrJdx2KShl51xa2+
 2TkNOCCt5apBOsjjqvS0rrhfnJAeK0h0u/SpQv6hrr8xzw0MoZhNGwCWpY1Cm4zm9poYBILweqS
 bc0nAmHa1zFLLsDHFWhPtX/g6lGtSeAelaRtTDylGM3DXy2wP2TBi/IvwtR62o2XNZE656Xx4ey
 RKU916eM7oveDrfoPBm09MHtvSUoRDNLDZb7sIoNfCKuB1O+XawD2YZHt+8KgDIAJvLXodIDEco
 BTns3G8XeYXJLjNIRKHCWaykC4b5Tth9FOAndsjIcm0duUumJKzKPvD5ELEkaacRRpY+bDxLK3T
 WZgBM7DqO3jpGCIWPJAyTi86mD9c2dGX6CVg5j8QgOLGK/wNsiGcm7s9+6uyXejxqNbQ3OytbWR
 TRwWPxuVer/Ql8LFBnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX2Z/oaAP/dcLy
 JSShJ0OhVG6ruC3aisY2qfOb6SBnfj3c4OPdyGIledVoCYY2D36IV53Ark4tKlMsFqqsq6WQX6a
 JVCL+T1UX6xzcwiY3PVWRjZkhr4oArw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200049


On Fri, 16 Oct 2026 19:13:03 +0200, Thomas Richard (congatec GmbH) wrote:
> Some pins can be reconfigured from the BIOS as alternate functions,
> which makes the corresponding GPIO lines unusable. Add the
> init_valid_mask() operation to mark as valid only the GPIOs which are
> usable.
> 
> 

Applied, thanks!

[1/1] gpio: cgbc: Add init_valid_mask() operation
      https://git.kernel.org/brgl/c/15516ba3286daea3debeffeb8e04f250fdf7e703

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
