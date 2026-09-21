Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387D27FB37
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981936; cv=none; b=mujN3bYILmkgSOIAvUIwiQeDotS6VNYCTtr4Ojx49SlTgvqc6UNj6nn8y50yV7xBHqMyeGtELbQV907fIzJRPEN9uHj7UUPaLWvxBTIiuhOAcTmMY6G8p25qBB9UyH/KfC2HznYxU2K6y6/f7XzbwVW/GQXX3lCl9Vsp213z6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981936; c=relaxed/simple;
	bh=HQybE/rREyoJpbWUiRRQYe3TzH2z8xGubH8XzfJ9ZP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9sm4GuaP1wCTeTDTYWl2hHAlge7J5fUb54bG7Ig/O8IA3kJ9pBWo4nv/26hnSrXYFihe+HA17s3A4uwWofCGNLp9IM9O7nsWnsvq+PNmiJg2wceIetldeAI94XT6JgHmxMz6IR1G81AsNDEmCp9uv7o8TV/6AfMtN98/rhCPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TevG9fOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYzBxcYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TevG9fOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYzBxcYx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7EJc8759270
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=; b=TevG9fOxvoXuUG2i
	Cxf8oLeoAkajKH56rYbbqXqy2w/n+LJuMyn5M1Rfa72O01Ceq+GGTp/yiB8nowco
	Jke7JIUxSVTCop9pqsHX5Gr5YQnwnGtO0GOBbEnF7pG+k6o7f1qJ/X8WwfxQr19C
	+klaIIgC9PXsygMAKOkuL5ET/xXQQzWMiI0XGMcAqd93t8d8iCFKOjNli4qBW1fF
	x3qzjlWQawvRjy6SZh0DVMHoSRUvYw2OgNnoy/MS04ZWHrhoY8qe1mOodicqXWSd
	iqbpgnzeVl+HjlJaCfK93RkuUmlXJ0YFuCmGQ4A5naxUmZe0xWXqjsiD0IoGn4vL
	kpCQLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118f81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:12:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so441498785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789981934; x=1790586734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=;
        b=JYzBxcYxr6Elq18ios39SwviynE2t9Uex1WN3OQD3olJbzG4HcHucKrrN4lVQ0VvZy
         AzRex66Mgkm1lzr2iqDn/CKZaNyVCDZTBaMhn6bFy3FE27EjolmNtt0K9w6RO/kzkriT
         jevoKOKVe4JfuU6+l8z0aJvjRbe9kgtqJMtOGZ5gOlLPOA+/wduo2sSimuIuPV5jVJop
         yjChtoUTGMDOjckFpYLVt8SE10lQMP4YUbDdN514lxhbZYQ+dc58dhNY0ki9FBs9mdEC
         GHOFkBNNuS6/ajcER33WUaP/5/EnKJzgvD0wXDmjwmsaspOOpxEyUKYuvuE2st0Bq3Nh
         INbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981934; x=1790586734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=;
        b=KW8dG69ZbMig8afQBC9zaPmr9hP4AvQmGaNRZakVs1kvfdYt5KliRjQuOWsDixYF5z
         kp751rdNqwWSbtVKp5g5nZ8eYFNjK87JhGk6kePgzYHYBLSPK6bajH65dmLZvvlnBAVX
         UJWoerUbdyX9OVR/HAcFxb4ar94v9LrRw5rFArQY6ngRVCxq/qGFgdqgbZzad2A6Wa1k
         OurqJcqewxWzCBDN82nmhcmRCnRGH0oRjw6xSsca7SQKjiU/eLxQrXJKPCJVuoMfWUFe
         XzMxBMb1C3N+e76X72K95sJG3oZhwFfZ4RalyQGgeHSaCjcAAf1VSbsXp6UOL8jbgX3I
         NLCA==
X-Forwarded-Encrypted: i=1; AKwUvBx1givhXjWtXWMuqziqiwlGBjTP98E8NuGAbojH3D2KILTqJCWuLW11Tck0B1x8TmNGdzRPGihVDaT+RHI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKNeZTm5S+zzVT8u0pA+jKWH/u9ubCUkXstjj7wlBe5mxpblfM
	7MLWMR5u8EfvQ6EOMakvz3iAj2qBH9c63gDoiTOjrNY4Auwfvl0UcSzRI8d/oU2ph3m8wXDVxxU
	qw3id7aelG2pgHGFo9tBTWzgt9V79c93guOvECGQQTWMozppm4qkyt/+p5F1rBf+xDqY=
X-Gm-Gg: AYBFou0HX7qHMBV7hkV2d2VvaXc9ccoHoVppUo0TfpjVVnfX815A+lzLyeuqh8lNYe1
	ycnBdSXDtIHafo9x8FmvUrAXpNtXyzoTYseh2JhX1RQhZSVhwQiAzFIyn9NtjNHNZ6+6G3bsN6V
	BAZ0jT5J6mVZQPwBoZFSDRo+07b59iuTDel3av9s2Rg70Lgy/2QpSEotZ/mT5FJR0OoaDCKw3+T
	1XDTxSHt1yhipUpIppTwa5FAO5k4D/CoUw2ly1HDf4FjmQs+SPgKEG+wkhpOCdhAKrsukUmaOLn
	hgBHOgTMAle3xZ/w+EYatcXAPQuQiH2wAvH1o2CsTr3SlPq28pAOOd8RURm8HiC5dJBXlG7AYCW
	MfRPGxTP0WDIc6b4PeVQVRKxUew==
X-Received: by 2002:a05:620a:4707:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bf5554097mr856778785a.16.1789981933618;
        Mon, 21 Sep 2026 02:12:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bf5554097mr856776785a.16.1789981933272;
        Mon, 21 Sep 2026 02:12:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcce144b1sm350038535e9.0.2026.09.21.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:12:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kees Cook <kees+treewide@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] gpio: it87: Remove const from labels_table allocation type
Date: Mon, 21 Sep 2026 11:12:10 +0200
Message-ID: <178998192701.38701.14119171190275640686.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917211125.i.966-kees@kernel.org>
References: <20260917211125.i.966-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -UZdtZ2ZJC7A1MIYiB39eMfpU2cd5DjN
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab0f4ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tgKY3BxfLQft7ZkSydwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX53UXjWegs/PQ
 7bKAVlGb/VykOiziq23HULAvMKmiw/c9ffjd+I4/jbw5zl4b3a1nmV4A4+hynGFjXFguWn+FieB
 zBHAq/Oyjk97aTnFdF18HVM5ZjZF042NjzkqlG8zjZQZDZgOEMmY8Ga+1+BDcERK9c7zBg80kC3
 lWvCKCBZNMG1utt80Znlmpnlh7ozeNLsizyhel6ToR7hfV/MU8psJtJ2/wrU6Uk8ebYxogIJcAH
 YtZUVgvWHC41tOfMfFNc3I/3oCGo79ufPvk0YhXXnOHWTKt67tae6Q0Vx16oYj1fEJVYUNLEGmN
 KBF3gHZ0UfgXmphhPT56H3xg6ooGaIoK5UsMQ2i/XvKBLQsa6gukyMO4Xy5LjZftTWAGT3k3PAk
 v3gTznsugQ/WsPSsYqeXOhdlMh2QjuThECXwxZFToqGe/gB0V9ucdGnCSZRonP2BPUsiiQslwQ4
 JjHsgtSS7z27zZXhzHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX5qdlN0F93d0G
 QOmZHwQaNL7sv/g97T0uMcf3WP8vPtMVgA5tJUAYNxoUBghh+5Ymp8QzScMUla5v9zeshXb69xW
 Z2VXSAXKst+3NdR83CFoKX8IhoWvSpo=
X-Proofpoint-ORIG-GUID: -UZdtZ2ZJC7A1MIYiB39eMfpU2cd5DjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210131


On Thu, 17 Sep 2026 14:11:26 -0700, Kees Cook wrote:
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "char **", but the converted allocation type would
> be "const char **", which is const qualified. As there is no general way
> to remove const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> [...]

Applied, thanks!

[1/1] gpio: it87: Remove const from labels_table allocation type
      https://git.kernel.org/brgl/c/24715edd98ba62840214a35137ed23e611348797

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
