Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73544685D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756906; cv=none; b=t06/MnJBKmDU1Lklq1dfollomqCpkGDbUYNjtwXuZ6Isah5b+TpEXXvVEnQm4Y4rq0O8hRt1ErKFEqDVPlQAl6/ThrwnDX10Mbun7g1NnCQhaI1QDiZQV5FuqrGX8HLclEDIzz53wrwweSJRDkgWDu8TseI58ScE1etWqSxubqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756906; c=relaxed/simple;
	bh=8U0LlrBB92rHLBvToxCNa5U/P1iQ5iI5O2fWADVmb60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heT9EcYLL4RKpP/Xk7ufjSIdwzXBL4BEk0XSZOAKoT/yiAyphOrfM63JQ6S7SLZAG7HRPy03jYS2jL5sw2vdxCy2BOTem5J22aQX3quohnc3fjf3WXSTkSxRgcZ4vud6jQtQ0PaOdE2Jvw0HQW0cNvAPb5ockDvHzCNEwB7zXYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed9oj8E6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLB7iMVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed9oj8E6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLB7iMVl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDv91T1462231
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=; b=ed9oj8E66adJtJKD
	umasm9msml5dRwqxi/J6+LZvkTEJM13lxSgHImAJE6b6frV2H44cX0z+yk/WMfPU
	RsQNVNAHm4IqZIqsMYBc9tHKajrKPRWjmWNHWFaILc7m8cFu1IPtKqmRpimMDhZY
	k/bKH3A2f9t4aNA7S/JJSg4DKGLr6Yyybqcs4fRxeVGEmiu9K8/x2Zee/2sDfbyE
	2f5EK0/rB/jqgomvpIbn+umc3Nn412st0HAzu1YGR8szf9JgQBRGVLVASL0raPJj
	NXGY7l2Drvkv4v6wYCE+JZcyXnEVeyvrkDUP6zNe/eDYbfikKJ1ZukGo4Qy43daf
	ama/5A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gjq5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738ffe90415so42577137.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787756903; x=1788361703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=;
        b=BLB7iMVlrF8GeF0Gow/xHXUcN7Ic5a4sD3nsOXUAGiq1Uz/Z6x571W4Av25MYJZAEP
         /emjTzLIMTVF0HOFJtgJornUWTwJfF5SDk8+QfYTg/z3BeEtu4YCkW2guFAYRmcOZ6OU
         RHbRwYi9H3yFCMw2YCJq+WQAx7lJkZXRkvoU0O7Up6E5/HF73CCkP2UIVI7jRKgzvZFE
         TSlCzgwJbnhmpD2HK29ZK9sVCmqfNRJUhkNJx9A7Ng1DyB73j9aDxfW+nkBqrv3BSp4K
         nSQ7l14EstjHVnrGLssGrne7AUWkdya8HxJu1Lk50MjmcLBsgqDdpa0IDKgu9RmNhjIW
         rsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756903; x=1788361703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCKm+9+9oZv6uYyfqjJ7ZMSS3G7gpwY6tgFlUutKkZY=;
        b=ETXhw4XvAPZSZvKNVqYrcTs7KBHpC0QpD7ZOha8A++DNJ2K93Iu6NWqkQRRM5dZQ2H
         CNS7ysHFVfayKrfjYNmNi5htf+UM+y8/tYVlJxWyhbkRkC8pvqbea4NRLz17CdIUmg1n
         nCL4A7U2bwkhqiCZx1spE62YseHDMZja++R9NDTAJX3tjX9pJOOXnbybcWhPLCRvFTPl
         KaMHd0QHcn3/EA+ouT8fcEi/b3id5AB/fp/KEdHqZNHh++MZEcZmAsnmxQQtXYsdBxbG
         u/fbMkW/chMUGNq1PSSUrQz10RO3I8jBcA+BlnwckGlGOM590Zmroxebds+/9D8RkqEJ
         drHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLdgCEQtLRu9wPLMoG88yz/zn4Xs6fR8SQBB1hdjhMKbWcypKS56v8q2FNpzkSg4oQk9Z1UDDNnQ2oGfk=@vger.kernel.org
X-Gm-Message-State: AFuF++mavhymagElWzrmdUg+BtJp4paudcJcGHTqXfTA5KNpUyCcBCJO
	1y6Uii0ecc8u5C3d3dzv9dn3RpbClRnpLuA9TPk4qzndx6zwHAqYgrYwcuDZ4B771LOd9ISffhl
	tYxEReVliTG8SHVcLBoJSmezp6gLp+MMkgD3yhSCE9hEkjGYrDQao5lL1JS/Walec/NY=
X-Gm-Gg: AR+sD13pNCAH2lwAXbtrk9+Y+ULwxFM71IMFUuViDHehEG6FgOk44Vsr5vz04B3Zakf
	IrGRFj9S5UjvyT94tIZG0auuwYRdz5/+A2vFrqqEHlEdAabZQLrHN6a3stqP7kth832QHbckyWO
	Aw5kVrAhIxBSKAEP8jqIOht/OpGIa/B9r4HZv0mt4OmUVhyG0PfHTEhj9v9tb75ejbFjuouclim
	tjQZcja0Y53dbd1COoEteiZM7sBp/2ByW5jGqPblqi2IHHOPhBII3GzpYnBFoIfIRWKwFA2Jh9P
	8XjoOxoAuIDPsNhAZI+8rK3WBGgKbdDgrEI73iMuHGyhje3Xk2Mj2KOBQ/hxFNVpYYJYK1is4P/
	yoqLQXrVx9rZ8wm6h7FGtFA6zEuNq
X-Received: by 2002:a05:6102:2d08:b0:77f:fd02:501a with SMTP id ada2fe7eead31-782c03e255fmr2379479137.5.1787756902869;
        Wed, 26 Aug 2026 08:08:22 -0700 (PDT)
X-Received: by 2002:a05:6102:2d08:b0:77f:fd02:501a with SMTP id ada2fe7eead31-782c03e255fmr2379449137.5.1787756902323;
        Wed, 26 Aug 2026 08:08:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8a986sm29340315e9.3.2026.08.26.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:08:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Tai <james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>,
        CY Huang <cy.huang@realtek.com>,
        Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 0/7] gpio: rtd1625: minor cleanups and log improvements
Date: Wed, 26 Aug 2026 17:08:10 +0200
Message-ID: <178775688405.67048.8153038759125205303.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DBcOXTo_HVMBO72qt9r91GNo3DoPow_w
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8f0167 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=81INXhKgSao7X_SL7FEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX1jxGiV7Kqnbb
 CSPeJk5sm4QpBj5BaCgI5uncsde9bu3SVOryro935hapOxPHptV5keFB/muxgM8Ffz/VI9nomxu
 rUNp70lG55qHI0Za8ZNJphk7MglX76w=
X-Proofpoint-ORIG-GUID: DBcOXTo_HVMBO72qt9r91GNo3DoPow_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX980Fzzpkp088
 EXn776IM7G7mjfumzrp7qOMhRzvNAJXoJBST6+yfJHmdwQUlrAy8bSA4/4UqqvGAA4h8u6M0q8L
 ZQTtTHR9CW9Gxr7ao0NfORc0kbcCrIi6xDJB3KiQVoqbj67z3nHdY8wAdwuxOeP5TztuQtb+e4m
 gvD5IG3ddX1UjQHigl/lgH1RIaVEs2eA6WngLLVVpSDltABe6dE3BmJqW6WIbUWf49XztuuYnIV
 KRzPoPo2o3q88flBry8/wZiy3ZC/OVLK8yOkpwRDNAEoBivBQLy8zwhHTXbMq/iWdEgQ16NYb4q
 SmGqtgKzMt0AXf3L6sVCrIynB9NAWRx1eS3epSlSzxF8xW5egtJ8Bjf0rQLYOfSYZoF6H0dxmuM
 C3jfeA4PO97uYJjb6P+h5cy0CW2nKj+8fjwCPNB5CoBiprS9L5SrH0dg4eiauE9KZENBUg9rJmI
 8kqv7eNnLFjdgcJN+Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260126


On Sun, 16 Aug 2026 23:17:29 +0800, Yu-Chun Lin wrote:
> This series splits the previous cleanup patch into smaller, logical
> pieces and addresses the review comments from Andy Shevchenko.
> 
> Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
> 
> 

Applied, thanks!

[1/7] gpio: rtd1625: Remove unnecessary blank line
      https://git.kernel.org/brgl/c/f60178ca784aeeac3552383253e463d7e9d91620
[2/7] gpio: rtd1625: Drop unneeded initializations
      https://git.kernel.org/brgl/c/097d950bb33edb708f3ea40453ade989cbd8c283
[3/7] gpio: rtd1625: Fix variable type for regmap_read()
      https://git.kernel.org/brgl/c/d54bcfc3402fff60f38028a3ddf4e21cb0700fe2
[4/7] gpio: rtd1625: Narrow 'i' variable scope in loop
      https://git.kernel.org/brgl/c/f5440a157b062e0bc67196614b6a24649533d495
[5/7] gpio: rtd1625: Narrow 'hwirq' variable scope in loop
      https://git.kernel.org/brgl/c/7e9d11c9abf5e856208c0a3f3f32671f2861f4a8
[6/7] gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
      https://git.kernel.org/brgl/c/a3902d376dd2e384931aa10c077005547b9c2ba8
[7/7] gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro
      https://git.kernel.org/brgl/c/d42c1df90df49b19c063d029c7d67e91751edc96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
