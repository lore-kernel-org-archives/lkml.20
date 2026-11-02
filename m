Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610322;
	b=5e68qIPuV7R866Yg6J2F85jMO6JIlozfnjBzGzskpS6S3bmL2CmMhkp7BhpuxTzOrjWR
	 p6C97qZoj/sqAMbZU5tvaod4egRz/wtNzmGqrmWJ6UyVusGcS0AWvFOJ5RPuQhequbDdM
	 sdau1oDXCPNvir/0eEGiEMb8GB8nvXTfmUxBebevwAA7zSPP8x71F0o4LDB3PyVm5gnNl
	 d0me5GO5/JqOGueDeIanHOBQgQGzl2Is5X3cAVxzKHS3FflqF4aT2aO4y0PdxSXpieNEQ
	 hXIspwgDc7pCfMFDJRQIdZZCcAG/vThkijecdsUrgEw7MQ2ad4HJJjed8h0b6yM/6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
	b=bZIwWDbSQdnhfAGIfLrmHk/1qdwwFsU93ZfWurH9FuHdiPeZfV2hiCkhjjpY81XfTMqr
	 NoCoPJbJohGL1IgPM+6sVfMghAUtj2o+1Xikjpk2l1ehgmvbOH3MDP2FJlbdiIdAKqOqV
	 sNJE4wa2QLGpwcTuRtJ1PGs3CZJX/GYPAyyv3Oec+lMTGIjYWYQmDigB8LZSJJIlS8w7Z
	 dmfVnYk9spGIC01pN2Cm0cDaZzPOQwQwHtXz8LM0XP4frQ7lT01+RQtCiDY++3sWi158h
	 kon3cB6b22V9mFUgtGSOTg4RKoafixgfD93GmD2PwzAVkrq0xqO/RB4U9c3ggC9PzSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvQbCNf+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KD/l2EVW";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FE606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvQbCNf+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KD/l2EVW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vIST3324667
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=; b=dvQbCNf+TII7Rvcl
	QH3SWWJasayQGrXTuqTRLM+NOPKFLQV4DsqhOE3QRHqAKe3O9Tj+Nwp7pxoua1E9
	J3SNw+Qv+f8aRKXCWhFM/mmczh3xmM1OgYBHn0GSSwU2lFh9iaAjTRS1h/tW0uSG
	kz35QOGqEujVeJyZp3SJON2YYGWMt7kmfZrpZpkqvJ1eXAv8Jbuiai3n+zAXaeeT
	l1jsxq/oQRoYYTW5eOUT00VL8TbtF4h2NIvhSI9++mWpnrg/6rFaPaH6hXR+f2ft
	ZdBGpzPLodyKeTkMN4eU285Bg1dgeIlsSFKhb3X6GPTdaxOC8b/r8/2GXDpFDJEp
	xb+XzA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p7s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:05:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c15deb3794so548386137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610320; x=1794215120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
        b=KD/l2EVWoMHDFJRHM21MvNTAcSndpgapwlOdD6OnSG+L98+7oh1T71weHqFJqQlExf
         SYeDCZfvHT0ungxLBcHLw82CuARSMw1o97ARCeefB4EFW8shzmykrB5DJeKsjfCSfTfk
         JFbCJQpcsYX2b9DqvshVLSLG2o6mGv3Dys9TRVV7qmgw2j7nxeBRtJsVQtxoOCxcQRAX
         yXQbQcN+4uoFf0nffedsTRi6RvLsXsPQY7gfRVN9ZvpUlr8MKiPXXThvHlODHxCSFX3u
         EUl3Gh5KfH2AF7SFdLhxEDsOiG4rAZOxPsfo3gRATdsKqK58toLI+DaIrzDddtuM0aKy
         mWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610320; x=1794215120;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uj7glmkl1aT4wyjfINGa2j7rG0D5MjkaV6HqnjPJI0I=;
        b=e1REhK9AKRAGect8dVmAC+iIiPXEYs2SnpzhMJ+gV0iBjLlxRpE07D6B0Ejol1Ryqg
         WM15gSQ8zhoYk1xASBgmByBYmgBycI5bMwVsGcVirCksHLK6fN+OetlPxGb//KKWrRT/
         V1C4IeaA3tCboYXxioImIUT/fvbV6WRueddwG+XfFudblGuUk3pUOcU69c9+w8YCoyUn
         pVp64DZ6k9+BP4t2ycCkVY/cz0l0hapo0SQg9Pf9PfFqVLiG4LIPUA2wKKc9Pbq3Idw5
         snWf3q2p0B7P5icG55570xSvXviU5zpabFdPNP8E0BZjjLwGKTgjO5FSY+qbXPzooTWw
         b0YQ==
X-Forwarded-Encrypted: i=1; AKwUvByMKSqTQpOxCwJMJkZuWPCABodEcr2+d9dv7gqZAabEHPaZcw5EhkZF1ZK+hI1EpVFGTmF2GKxKZ1jwHhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ubgoZAsYqK/3Ol9rgE0Z1tjmpQlwuwuopDv8uSwdq1JQSFfWj
	ia5RaNrln+l2LjAKOR/EIBm792C7Jn6/OHrZWkOhwfP907PERonH/9W5TViR+sINDsjAqy81I2+
	8DX3Q137YP9unoyErp8qvAmur2NrQwNFdJdomBNwejBoUWjfrJHwW4RSj2813q50schs=
X-Gm-Gg: AYBFou2cN5UMkTzDoqGlOejOlS8M5ICpNSzcqQUoYlQYKa1Yi8Oy8VW4LqNODqnFc1/
	PLKoMAQoAlw2/uVGxFRAeoRTWy8uUIWo20jY92hdwhg68cD4fy2ZbtgrwEP6HIMA9qMl+sFXlOc
	bREoArkwBlAcVSnN5Xu3SnX/bwfBcENv3T99K2pr1DB3W3xWjclOGm8ohK07RTtC5cHo10Oh166
	QBlm+2c2QcwMUael7fWApaN59e0wMXFbzRjNjAG2VrXjI+1ITygdQBvep7UcCQ+LwsZmqLqCd5l
	22t8CZAPKyS2fJmuzFqzvQTGfZlTrjtDicYdZb4EGdkwSTnNaZwiRRCfYEYHyCcYak4TaxWH8hk
	TNZ/shg7C81iKVMrzpzVeaiHXSpSmm/c+zbn3iJeBISVW032Evxe4z8ht1FX2yKDIcT9Obc4uZQ
	2Z
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr3405059137.1.1793610319969;
        Mon, 02 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr3405052137.1.1793610319510;
        Mon, 02 Nov 2026 01:05:19 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:12 +0100
Message-ID: <179361030997.39187.14281865642912768341.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
References: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WWqoYPUph25mG_TzEQ__CCIe6MPleSiP
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85250 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vBPT46HQKAXVtv7808kA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: WWqoYPUph25mG_TzEQ__CCIe6MPleSiP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX7lVWkQ8t1Hnb
 TdEKSh9LYGjlofyeD0zGZ5IsipDqmCydwf/PVmWSpmAJexkB+SL/Aoj4mhYVwxx7uDkLHmWb61k
 3ohEcA9Ggmt5951GExO2Q1pr1SMWNds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX2KCuPS/T8FGl
 UKkFlQ5X8MRK1ug+zMj/wX3kDyu0JSlrpODMW51pqtrKBX9QKpZLFtPxnbGHPnwGZao/47FhSZx
 SWCsWTxImHtD1qDHA7m30M8345PKFkt+udnmeCo26bn626ZS4pLiAqfoHTVQFe4c8u8mVvywSca
 hZlouj5lgMHH1mUIsXGXfpKgt32RTlPqDSY9CApOE+csc3AeNLuTStVaTkRdZ616YlZVrITn487
 UTVNFOjbAMye8sp3l8Jv5WGY0i4mxRfMPqVGgfFWRASVH9YHIwR9DKwiHAqI3Dm9eXGuNP/UXOr
 Qm9ivfEGwQq43zsYFaWSsep5oMLlAzzVIBEgzDr0dJ5WMP7FgN9RpQ2uKXsoKOqYfUuRuUdJDp7
 Xi5plD6Iu+yMYNpyLMqAxwmj8HNAjg9oNqAcwB3pnfAv5vVI8T+hcuNsfJ3nb2vHiXBGGvxfHqZ
 jak35l0lsLwxlMEbfcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036


On Wed, 21 Oct 2026 14:24:29 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-virtuser const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/6c0703e5b8214e3625ec2058236db4a27d4426f3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
