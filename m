Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020724;
	b=qN568irg8XTqCSKsAGTsdSW/DCh7Msgn61aE32KTWiVNGnCnx/lK9k6KvULrR7GHm6Ah
	 PhTkoJghfSRcMDdKlzVwpcjAzw/xnQJYJCV0UFQZCufrirU3ATxHMP7C/gAL1WLH33QXW
	 0rphMsgHfTlcsjTe9Qg3f83njrriHzOBWgsCSf5IFuUTKEnwngf2OD6/aZuRfD5Q1YI6x
	 C0GlPUrtQIwdO7yK6Z+NrOynnpvaoYg0geBDigjllxec2Dq2DEJz5YfCeWt5ji7fear7i
	 PJqwgeu23rrvArWkMF6m2KU9jBLkOCb/+sEQimYTt6QS6YR3iViKS43BrWLQRIHKVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
	b=2qvBDfEdySWtv1BEphfMHHRWLaKPojX8yNg87+OA3NuzOth4vyDLr+5/wJkV2R5pgb3Y
	 O4xdWJ5U/7YofzADIqmZFb3cfuuAD/ZO1SFYnno1oMemnUtVkAAyE/jZTPdOJrBf/k7gz
	 c6SHqaIuSQ6fNdPbXyG6LPT5jUNl+G5xUh18AAAwAQ+mtBpOdo+BUNDRJeWUr8QFNt8up
	 fksSt/c7td13R7T6NcFSSqjeZxKKsAuDe08RBaTNsBtU8Fyi6c8vdb6ZVxrF2b4h6bPhS
	 vUsJt3Dz0QmzkeT83nHq4SLso/FGzV9LsgC1WAQB2ypG6f1Zg+XDC/2axwXyotEygvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jJ95T/75";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F49606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F49606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJ95T/75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtRdW3348824
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GUPu5fQHpeR
	WI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=; b=jJ95T/75awVGsB3vP4B1+UOoQLo
	Qgt7MnhR8qgQLV50C2F0Y1HsERqr17c22qevWV1q66haNBryl+w45Cn1Gz44h0W1
	WLo/JwmY7Lmolo5O17nKU4d/3tNFGKtDkNBRD3r8BD0Tr6GTMlc2dsIHz/Q04QUY
	eAs5Di2dmgTRk+xh5h9t/aLvVeWEGtmA9qmI0XTgBgKubgYXsPx7xFwqHuV4syMh
	LUm3cZAky7qILsFjRPdeOCmmff5Kyxjt3BnEXIHiWlOeokQJ3JjuOrWle5083gOZ
	PB+gEH6ySZtDyg4FSMIABF0pEgb0TULwrn6LukHtvk/0aChiq2PEZ737PVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr330-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so295617485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020723; x=1793625523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=TV51eRcJTaNUai6lT4V4UwJKyro0v+60Tarsfa/1ev0IAnm0OePHkzhgl0w+mfXcRK
         eD4Rx60FfP8lHu/sRAddEM+K3aP9CDXQOwZpP55QV7wFTWkk60o243cKvA+bbn/Vau8C
         pOsh7yHnu4HhKjaic1/2DqOocfSW5CJqS7kOH9YlUnvVHIXYV7Rj/2087hBO+yiI7LjJ
         R2dlf1QXtIARYW2xwVf0d4a169thHSPrsdhf/z/S3U1xxx2Zc5tI1wBwc1HPUoq9p6RB
         YUtyASynqxpA7yRyLT0qVfK3G4pASvtzXILfrBvU6gyvbr5z93a+iTLeJ2RSMQlrI95A
         hfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020723; x=1793625523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=bBEwU+vKQfmUNFa/WTRscp3+OCcC3vKdFXkJzpeZoWba7bAnrgK1PTFN3RS36i48Cq
         l0PnrMrA+8+TnaBaBJ35tDU6DxgJ0+g1OL2+AsIF0Ubhkd7OuOroH2VjUJqxuYM1jUTx
         aVQLOsehp0arx9v7XCkQjKy5+NmLXg3okjOjpvciUsdsDYqKVHV6LlM888XMjaJ7giDd
         vvqFrrf111a8KJW2xYjegpxk4+vTOLAcudd8tfZsYezZdIVqvkF34Ea7saLrtdA+txCs
         AeCi7UzbA5Rk2SWdRV1mY6fQqYyFSWf3t/6py+G75kSKLw6HWWOcad0csn8XXnywy4bU
         ig/g==
X-Forwarded-Encrypted: i=1; AKwUvBwNyao6lUKIMFl6An/y38xgxgqgygs123PmPnKnLbjYAp9V9NNU5/Kia9jxHCNfXnLmbrg3EwKKDXB6Lxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF6GqFBoIawxBxLQUu5eoVnhCS61FTao1UF4ZGbVqkh0qFF9Rw
	o597Npe2uFJATMzJGt1vGotfb1j27YwgSWUVHnKHbVfHqVutXvfo76lKPlBg6fj1RSz7v9Kyx2h
	1JqSHAR+00Ocf21GVYRDuo9m19DWD/4M9emXOkTq1CC4TXk3X7g6ivsY3NQsd1Uif46A=
X-Gm-Gg: AYBFou1i+CjvuSB4Mg19efn7Ok1w812+zhH9p9N8vd/1/QizFEyJGgn/kI94bY/GwdN
	IwEFSyzbzinpytgByIwJ+VGHLr6OEtKl1MBfXI1z9GA05OZbTGC4A3VfPbJYRir562DWmmMSZpS
	oLYsrn71AdwY+ncHUPpTqt0bHqwLX1G9GecH+2U1nM+BuCG3rtM8kRjxDq7HXyGripXRlx38VjD
	HSf7ZPWf7n97sGcnLG93+qdKzqmCmKg8WBhLLxb1H7/dmBVy016Upm7llZyZaaJSoPG3TAZyS5F
	+XPpWwKdLFalm4TEM8LFud3FXwvyNgSctjxTSK4Iw86VvYMQGw9hDWsUCE6DEZWbe1GbAZ9zXs8
	UAXBnZ2rzmdu+0zmBQOLCAu9W
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865182085a.52.1793020722663;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865177385a.52.1793020722195;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:18:34 +0200
Message-Id: <20261026131834.3247963-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com> <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P4PuGQ_jziKytMnkDvUeJ2YLFzmRoXzI
X-Proofpoint-GUID: P4PuGQ_jziKytMnkDvUeJ2YLFzmRoXzI
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf5333 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=mLqpLkQxU2AaqChaJ2gA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXy8bMVTOEhJ1q
 +c8CejAbGYFmk2Kz7WK7pFEFtNBvWvUCdrMo2Xn9c3DFGpRDkyA3snxaGI/GYHch3ltB2pqNAiD
 kJldqt5iXddsPOz9cKJahWPu2uQJOCxgJP7TIxT/hAxtETtYhWSRB2N1ewAk6iZBsv5PfiAsOGP
 B6EOjg1qR64UMbbZFb2PrsSQwsj+nwlapnevpZZp8ff2EweNEXrsk8kLi+EClpDdJRPiV9aQMRn
 EspgSmQhnmlmaYY8lRJ5PS8Q65Z5ZSUaaK3tZywDlcyTD0sslbtQfeknbQYtledMyn2fUSUI66p
 ZG9Am2WFNHZz9jxgt7gpyNJv2mqaHuXkX8sYqq0k66I6LgFMTm2SWf/A06vJROwo2+xLghougxx
 PzF5AcZBnQzU0nVPGPYbC92JLyI6qD7Y9U7Fe/8fwI/4ZhcMgYHwSB9j2YSrzPDr9Y1U6WuZICu
 sYy7sX1uJ7mlG0V0j9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX3TMdOo7MQFyw
 xViSkwtLTd7n/C7/XryvhGaX2+2usgxVq/w0/FqMsuHuYhk7YoqePw9eoMyIhiYNzQPQyDomXCE
 AkAR698nZz4RSd+V8c4Bf30rABsj6aI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:25, Bryan O'Donoghue wrote:
> I suggested bundling in clk_set_rate_range() to this patch but I believe
> it would be more productively and correctly done as a wholesale
> replacement of patch #4.

Agreed, v3 will keep this patch to the camnoc_axi rate table and do the
rate ranges in 4/6.

Regards,
Atanas
