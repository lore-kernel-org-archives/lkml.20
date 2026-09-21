Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79D466AE5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982188; cv=none; b=QWPmPy26ZRIEjflmnRolvpDiMOZkz+FCIjfEFVUR07pep6La4EGMdqCXZj2Z9Go+8SxAn43D17oDWDPn7/h+Zy75DXIlzc6Qrk3f20ShExIVaPFoK6Dq/xvIggLnWipAI2Z5Qm2ejA9FgHBQBjOlD6LR0rJEJ1mm5/NpLoOm5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982188; c=relaxed/simple;
	bh=gARbVD09EARrYQ4UKtDL6tThF4d9UKCxBmg0cLWL/2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FU5/i5OrlgidrB1TjvGPzGzZvS+CH5wGgvyuLabk1szUx5sQH6ONewV7VD9oGBf9m0st+qEJl3FN/ZKTiYaeg6TIXNDK+rTxbYceqXmnJQzSfIu5bLpZwGpHMf4w9pQ6xK5YnsoJZd0qcwkXu/KGIv9nIKW50RQoHYUYB/ngpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGRvcwqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgTrApDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGRvcwqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgTrApDH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A0Sd607143
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=; b=fGRvcwqCJZhEzECr
	FMHMTJce9NFzwUvxWQ9gGKTW3DUJEGaQ1KF0J8jMmimCE9ZT/u/lAmXKztrw+ffc
	/lIaNgUuReSay/rwbgpEy7V/gt76GmmTMWBd10wd1HKxcCz7L5EAfrf9Py7qvNck
	Pb+fYUcZnBKC++yTEitn5OptTABxkyNDs0CVaw8mqAxJ7osuvCr6lHf+H5wL2OQw
	ko38k0RtZUDBQSwnnLEyLV0wBWSssLZdIKeMF6Ht/IQJVH8TJQHYywFLsEIG6LNE
	gj/L9EeSmpDg0iFknUlOqPj0UWZ2aB0S6j019gNx4sJqhaaQWhX+HnsXHVGHP7PA
	g0CYXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1ehhhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so418324585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982185; x=1790586985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=UgTrApDHxMDR8sbVKGaYA1zcWznfkaT47Ym2Pu/LTOOdaZj90+qUg/rqlW5UqYuXAb
         NP16kBrVS3C38m7ZWATLqMF9WnzIsY+3mbNHMsPfnaMi91Y6Pe0LApWvJaeCKkb6Rqyy
         YaVU+eCNYfgejKtnyLT3zj8LhMuySjP/CgU/Utw5M6mLyAfZ5g1F27dbcRHVKWjQUQek
         eLuPBzgaZXLbD70AM/sn3zSOcjUBYCtWuDvqSvVIP65qWD1peIRrT/ibvAp9NlEyPF1h
         4OK9PRPIc7ZDsaf/oJzHYxmcn5BG2R3ye7EJIEXOAv7hLyyftuALwGUS6DRnoq7sUINC
         JZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982185; x=1790586985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=mviXUnE+4vp9efdftlnOgcRXX38WhqZb4t6c4jWRzOM7w6hRm+vSwyfCZ23mdc8qna
         qeQkPhaIb88//8tIJGiFv5j9W+1RrRI57kM60KGf2B6lHGUvmV3TFdwDDfCqUb/HrlBs
         LlMbSQ41rw1fuAnRSGEXcQsFoW1cG/JgPprATZB3/7cUZ2hrtnet6IQqNcR6YsbprXGB
         iOKE5eCaO3tedVrqlPqYKDjdbxvMLJTIMuYWSSGSju5rt4yZcJFV8xvBshD5j6e1D2Un
         KrgMAnccAcYWGMttB/sEgtpLzJdFVEWH3Y8RTb3dnDrxwZ/RBhXtv1/KhAY0l8u3qy2M
         fHRg==
X-Forwarded-Encrypted: i=1; AKwUvBy99amEXkPnrvawuTr4MX6cbONxlLtMNcuMHmRON5+Hu8R9WjoH2BNL26B2t2tuFY+sCcLulpZDICUmMII=@vger.kernel.org
X-Gm-Message-State: AFuF++num4DJzDUPpi5eooyr7lvUH5yvRrxiqmHJ9Gogu0l8jqXscCmL
	IeyZRkGmhpcXdBJpu9KW/rX4KmHPPKsw21d4tFfQZjmQoi2o8qBmOJ79iEKr4xw8HEO2rNIq7Vw
	n7IE0U/ktM+JyeMmLD3j++dAVDu2G1zsRUMg3knzuSLjDZwnWt6AUeKAT0Uzb/5JLk0w=
X-Gm-Gg: AYBFou07975d9kn29V14Z+0rIBbfuMrXhjBWufvjbEZSERPaQu0q3IES5t87GiWqsr7
	pMZOYQKtf9Xdt0HBPVAbUlt7lkIzoTvfFSaWk7ePvB3C+N3TmSCkLYsqmPwZywhm31b66gRC8DT
	TbiUNzV2VtxU7sq43T8kcDI4uQVAC4Tr3MTvXMwHPDBGELzWKaQ8y7FY+qftAVxcCxbOZKQYv8r
	AsTXax3KjxzVHQVJGsGxvcsEowy8fd0xLyAirPzoJt29E3+P3qDBx0GR4RcezPjLeoOQVj2r+fO
	K/PPoahv113l1gq7fRpQAjZAbc9cTfVpFGgLsJEReguYSzI+z5BDu9JPDbohBHqvo52j5TQNKHe
	OXKoZ5nlOdgl/jB5d3aPE1ZcZqg==
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817539585a.17.1789982185242;
        Mon, 21 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817538385a.17.1789982184876;
        Mon, 21 Sep 2026 02:16:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23544040f8f.0.2026.09.21.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:16:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: (subset) [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Mon, 21 Sep 2026 11:16:21 +0200
Message-ID: <178998209530.39208.11869939955617063502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX0DRjwdKMAyZi
 ywvimr6tWjpM1tyUdtcvRRazWAWTiyqT4rQlxfezfJV1UqAHi/XONhA9/1lrjVltY7aKVLlP4an
 e9XmtoiMzD1rkUr7oIM6CY86RqfxRrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfXzq93euVXlRl9
 aI0jBLi2M1NkkhX3V5LMu1t3/9fld77AN8hVoZHo6InZdozCJz4tWAsgby3ybB5KkNS23N8jgGL
 vR3a4+V3nsaOMwdG3/AO22+8JVClW4YakXbl1LwxR7EA3LkVt926MtQgRwaq1z6BX5+8H1w0BOL
 ReGVkc/VkL3XT/rZfU+mmo9BigJgfEVu3X3bAzX9v/fGwbSZfutWovCXaEAic/VEReM/I9ARKnH
 APJRlHe/u4SmBxAAi7JcsM9uSvB7831/0gUPGAiQ37VxqhK+T8VxTfBngJlz3vjCF1/BW+RO8K4
 aCxh503Qz04mdhc2mEfjGcQxzy4Jxat9VTEL6XXRzuVsJZLO5MJUEw4U8ikwbIva0MWpYyXyapb
 81ayng0mb/EOnLBRkhVj9bahnAKVZaG+aKV7SCsb3F4//9wskyhjW58Ru+WAPxGYvSo4hHfCf3O
 3nq36/U6Bmqd5uIqrZg==
X-Proofpoint-ORIG-GUID: L90WxmLkfUcSmy0JHrpmQkt_yqz5tJ2U
X-Proofpoint-GUID: L90WxmLkfUcSmy0JHrpmQkt_yqz5tJ2U
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0f5ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=anw-P6zLAAAA:8 a=EUspDBNiAAAA:8 a=niCvQgg7AacVuODDKsUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=7_zPmhNiJtJTypZd5sO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> Hi Bartosz, Linus,
> 
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
> 
> [...]

Applied, thanks!

[3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
      https://git.kernel.org/brgl/c/fc291104d01a4e42b44132925c46655d4be5ed13
[4/4] gpio: mmio: track the direction of chips without direction registers
      https://git.kernel.org/brgl/c/b5c26686305e070ecb8a4af3acbc4aa92266029e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
