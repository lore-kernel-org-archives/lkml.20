Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180142;
	b=apelrfcIZgSMbeqI5LJ4ghPVhTqWv4iaJt/t6qKY9EsqT0xRdnWOuzvIQDJWsMmjplOU
	 WGr+CfyB4cDjVZMYIhJjPM294GZvUDruj1TCYDr0vL5Ln/RC7BvHbxiuWqyK/dv/DZnDe
	 /NkMgTcC50Z8vY7NsgqTHhXgfkoUEBs6G64p/ajXQCi7otCYdXzPvuMsQvacTZKA5ckyK
	 3FakFd5msivkbbT8ZY2Fb0kt2qSbAa7nGgUJ4Zln5lMGm+WySZQFnCa5+5I0c+z5LPZ5n
	 E0AdanERDhofsM4jm0u7EKeyZMchOKlx6Ty20Jga86/xe/HJtcWIvJfH4eTc0oR6BPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
	b=Bo3qpuv1+geUeywJGkwIizNMbksXjspcKgmIyZiEFko80Q0FturdKKs7inSgEhoW1UNk
	 URWku8gj1HVwh+Go2GaXI49NB+NR/8UBT9h19a2FHuiCvhL6EB1hfAF9V4tlf5MhFtiMO
	 2HNis3SoWKwCnOoeMYLvRC5fVquXO7LvQj//yoWlYc5NmFZXpbfu8dJtZ5WpbL1l7wkao
	 kXkbkQ9OsXrBGmaFHysNahBcrlkHQOWdW8FtB0C9FZ+TPOJIeHLE4Jv0rQKkK8FLEwf+w
	 taK+SQONEQFpA2d+jlmPPx1zO4CleE7lJzwCsu4C5BArTSfKmlJPhqZLAGV4ELrPOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldPlcGE0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJaC9kV5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldPlcGE0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJaC9kV5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8h6nV3768073
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=; b=ldPlcGE0hlHPeHPP
	QJsuYuWJOSr1QAAkv9stM42AGaYcrar0p3Wj8m8+Vj+MunnwUcro37aZ/XgXQcq7
	lGk8u0R3ntPAuRuPr1asbLLMGf8OFvizMn7uilvZWWGHR0BEK82XQODY14/tM+km
	bSuX2pTt3ki9I6ubtu06bghbBUxPQr26tgVt0bzXHlbCd2hCFxikGiMw91ZWMns7
	7DJGZB0CW8tmbvqjvFfm3GM8VWkJha07wu30iEqSx1F0K5+HUnfMGXy3oJqhOaeJ
	e9t6ZaC+9HjalTiNd9xTOGsUa61WxjZ9rmCRxz5Lu/GgvDT4Ea5SE6GA265As6FA
	L0XZNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp069r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so139579085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180140; x=1793784940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=cJaC9kV55QEKY6PR6dYpYmWriW3VmcASsEsDUP+1uDHmUt+jf9r99Lp2ItoNOAvyDI
         gRn2LOdI7nNrG0gC3kuZRxKmfdxSEMJfRh/Ycc4tihw5SLBICuLb+gwJNa9SdAuUvlM1
         4VaK7XZpsEB9brGzyapIMCSQO0Y6Ct4sH+lWXnkjoH/YskK4LBQCWQsUu0HIrGb3mjHu
         KaGbNUe9bTllLA9zx9NyF7lGqPgWZ01m/j6Y6W5MvIoWSv7Jm9Knc5xxWcEvKcXfOnM/
         lqvDi6J/rtfn2ImyNcbgiMUxHe5XHFhAQLRY6eCgP9BVlgcfQmvPOoNth89GNUdMt/hK
         68yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180140; x=1793784940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=F1IOT49JHnnsK2C1F9jAhngxV50i6dNfQiW31HJBkavW/ukbfrzI+CuuE8AxJKfps5
         rpruADXGg3KyrfpXQc2yjtKay4ZNdl1asjBe4EHLYqli+SUwXj9mzspXOTrTZ/ls+k0C
         pNRFNy2wdGIodBrGLhmNaTGLW+oTvM9D4NZ7BrUgasMkGbFOrLVbURWjo0DsTsksWmJZ
         ezCb0nae7osdagj343BUd2BP0aY4mVOGeWAo/EtfPPWAWwdjfVh/Ifo9LCURHQXqlybK
         qbHYQkgEjqye0vpNT6qPna8GC0NzqRkuvhXm2bBd0MGY1uD/zP+dklmXR8FY2yoj5MSu
         PSug==
X-Forwarded-Encrypted: i=1; AKwUvBx7tH+APSrThQG5kSudgju4D7OPH1Lv+yf24Auck2mOUC6+ap9e1ofANmTdtmw5rH8q02nyoIcYzFX2BpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLURbNL8pcnsbTvI/DYNUFj+ftOqVd+Kng45shaWdnLDhuxqScm
	0MO5v13evqcnshf55pvinDDcuCOUorpM5JPsjleXMnyoTD9mNlZ51UXM8RAmDNq5Bei/a3AbtW5
	TufVAlcDXkBj5Q1RNccloQtWPL6GOIoFOHtVc+IStoXV3HQtSSBSzdDp4SNjY+XBqRqc=
X-Gm-Gg: AYBFou1pMq03pz7RNZYiG2Xa4XvKiBxCMLB58hItZ8B4ghuhzqQI2Ktipz8DhwBdjLs
	gn2X80QHk5OwP2uazvXGoRu5G2j7wB544PjwaXKH4gvSQDlSqs/r4fri0/5Fiq1RkK8bHYDKwPz
	NRwSW507iGAq8q3kZLUmoPgyyl9PJISuQzmCMN4KyOXvN3+wdjRl/wNx1FTct2dfnGSSulDyhvx
	2YVVHPjNCyj7UFKWWWqSQJLTFLsEe8WHmhm5wo0LxFf7nqXmMrAtqLEzVnJXMGtUPGYKcpmAHrb
	uPX4WlWPUo5PaLhSHeKxoVPkAJYFHnUiSzE/68PmjHjyJku5LGz4mFQTVUGkaU/Cqy5U5zuESJo
	huzP3l6xsVF4ucCr2EUMOCkbf3HiutrR9tj0s7RCavRzHYsv47vhCAaH1Jh8vxZUvumC7e7cCVV
	rf
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192968385a.39.1793180140014;
        Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192964485a.39.1793180139398;
        Wed, 28 Oct 2026 02:35:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm25490073f8f.58.2026.10.28.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Guangshuo Li <lgs201920130244@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Wed, 28 Oct 2026 10:35:36 +0100
Message-ID: <179318013455.11588.11130360473129768323.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026115227.41779-1-lgs201920130244@gmail.com>
References: <20261026115227.41779-1-lgs201920130244@gmail.com>
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
X-Proofpoint-GUID: a6mINwsidcxHk6Q9Q5zrdABIquP13iMZ
X-Proofpoint-ORIG-GUID: a6mINwsidcxHk6Q9Q5zrdABIquP13iMZ
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1c1ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDcPP8y_D6MSDcTJfBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX7CWZTa0MPF5a
 f0JbB9lVMEzxbpo5Rg17qCOESTCDUv09blBTxYJWAf3amFS3SOLgHYjLahrZ98nMKbSy44PZ0W9
 vepO2s5s3nCRZdlrbgrlfJ9Ravrf6bRbgx18hc5sRa/oeh2QSXC4T0/F77fS1RZEvT9qQQ85iqs
 DSIptLnBr/JXvr37bFFI938uW511BTsXBVvpbVuF4DdSvDC+SABMJN3aqNgajBYBwxhjCB2/kYI
 H9sJY2+Yl5zvy/CceHibtlwBzGA6LLY68e/sW9hocFxNGTZHvKikCEvS11Z+0KOJ5R2dteYxYya
 Y6M2B4fCTHww9MAfkGi5xB0IDVki74qxY9AzEHDtAGwxV5/VkYidawnTWy8ftGrE9/L2ZoNAtU+
 dVCgxW6C9c869yiOXuD18xJ6xN9/JiizXA6liwriHpXR06mAH5b3PEajmg/GHG6BOubzWH9p3SX
 wvxnwFudF1vfialBTiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX4x8AavB3tD0k
 GvubJZtrI3iXSlY3EhE8TfHr24e7uBX7zfgYaNQaR9vX1bFak6qUdpce0BUwSRmE026qEt2nVlu
 LCGh7sSvDyPbbe0WYbTTK1swjpIU34I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280038


On Mon, 26 Oct 2026 19:52:26 +0800, Guangshuo Li wrote:
> When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
> path removes the IRQ domain but leaves priv->irq_domain non-NULL.
> 
> The probe error path subsequently calls brcmstb_gpio_remove(), which
> checks priv->irq_domain and attempts to access the already-freed
> domain through irq_find_mapping(). It also attempts to remove the
> domain again, resulting in a use-after-free and potentially further
> memory corruption.
> 
> [...]

Applied, thanks!

[1/1] gpio: brcmstb: fix UAF after IRQ domain setup failure
      https://git.kernel.org/brgl/c/baa14758afb3e2828de1f76511edc1de50216f39

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
