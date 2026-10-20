Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502940;
	b=Pm8Ct5X0GurANSrrIMfZqkzQHZq1Avesa4PMceEcS23PXCnAKSYSqcrCrA4apV0ya8rb
	 1TAtFZ+3Fw8l05GIri1hwqTMeGeo2x7LeMuvU907Z/w47HlSekJWRfVjzr2d7V3sn+1VW
	 sJ+7DrCRETew/fZYmn8eSLQVTbJeleX+IzerkK91/HxuaYL7cS3ZzZpP0WEpctnL58oxx
	 F4XmkdJc1GkmGZk1Dc+nuAEARKTdy7eZ7v6iy/JPmCeAdghsq2ncIUIlxYmclheJbhBmo
	 IABHFTuOAE5OlxOMBxplvdnhqt0GkAQPhfGRxDHyeL1/oZQdnkWxywfArxXZi/BDDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
	b=mlhRzjLbffE7JzS2pq0oQ7uRlfzTRuWBg3bD7vDM6E6RPY5SILGMvJ9sVyqLRRgEO755
	 R3+SAi37m48d+VExtKbnftQs3VbtWoe2sBI2s8PI290tiAkL7kpm9aTXPGMvG+gMpVJqq
	 M+iXEhfKEJuGqQutW47G6dRFcyth+iY8hTxmo1zEe/p3LNzv84lEDbs39aKTzUaCy6wUy
	 zxDojKsC48ZZOXPo5qb86vrOJhpPawfNvl6wj4Ko4EKBgxYu5FUkb6ibE1F0TbarhDkdf
	 Br3HV/FtfY60oocLTLyktSiJ1WwrLxpwumIg1vXbeJNNNoNVIIWTpKRnyMIIUrNAntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUpuNFga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEWOHXbN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5701606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5701606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUpuNFga;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEWOHXbN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAENe1429985
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=; b=KUpuNFgaVxdtDKc2
	I2dDzcn1Akrb0hWrkgddAbPFLSkltiP5lrk+uBuO6fG/lAzTVoUkFT1I0otQdp9H
	9aURM+kUpmaVOE5C6SBlFPHSXdR7F8upQaQ2uUTBVzSobv+Su+KtZ0ebaxabF5iO
	SqDcuukONJ+CHJ1/LUe4FMW6cbyHvwi0g+0O8GIqWC9CfoN+nYlDMz2/N56VJ1Ab
	5NTupjeT0cnAQJ1F1QDQNUq8GPsXHq63VuZkhybH6a7HHBXna/WhV2yxxQyKoo7+
	6PqV9ZnwOECwNCWBbQLEblQUMrKUvO5APUsdx+7oGJu3UhzBUXKR6xthn0sF9m84
	qcra1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qamw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so564945385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502938; x=1793107738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
        b=UEWOHXbN3SXM/kokrB6PpgPlv7/Q8DhA7clRfA1aZ9poNgoeX5XP3BOWdq7se6q4Wv
         JHa5kIVF/snpnbK/RlT0OFw71WM3O5Alfh5jWns6x/Ea1xzoa1ky/hlLZ1Ee4++mhbd5
         dRW6aw6ujTRoyMJhzCN7RfdSKn69bIVYPOA3+Y5buVhpVDrAtZ8lyui7Y3BIsgh4a1Fe
         BGtXUT9Xl7Q5tXkpZrZOonWtc/XylSjRaQR97KuwCVN1fcMw8ZDO0OkZzFMmBx2XpMaI
         HB5OiSo4hUzu1wKIWPnJEXJiBVwHpia13UWscg+La2ntTytNpEjZ1mg6eJKW4vyciJwB
         Qdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502938; x=1793107738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
        b=fHdUqaGXj2lIzpdq9G5z52EKl60c4g4KShWeMbZxS+diSk8ML4ex+PQeVbu5V2ajG6
         ObjvNi1nOzWDGSzdTTkeTs4Ogrr5SynXgF38QZHTXoCqj3O/vfUAG1eQhlCL0xswAV8+
         DDZc5RWbPFoB9kugE/zbYh22/BX1tH6DDFujDtJvp9klC2fRQ0JipnhS6VpMv23jIcPi
         LBAoAG36lUrodNZ8fb+ILh0BIVDISp1xAnRZxD0PJRPW5Lunl+2/8FlbUESB/VXbl1p4
         k9kPUheLnOCD1c1+c0WmOAhTcstejIWFuo0f09xPIJfmUdG0Xn+nK4EurF7SHuyM1bOm
         ER0g==
X-Forwarded-Encrypted: i=1; AKwUvBzS5up8hVDx9PxH0n3e8zHXULOU3CqMsl+tgdjA9Bmfw9b3SNgIUB2+LoBBNA2PxQkYm4Enr0i48bZF604=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4xtULG6R6HE6UTpdlsrcWrjORAXzERwkCMIbLQOsDVUVtumlI
	241kGWa412IvgJHt3pKz/CZhU8YWwPnWBbhE3xZph5Yw6PrRVHzsTWO4d44JvYD49OOEpUw5tHk
	ydOQ/m21RjiLcGj+KzXazVlI0u/jdxWwvC8xaHLAKCYP8oLCrW9KGX1cQ39rlLC+VJIo=
X-Gm-Gg: AYBFou0bVpbMphXfFdvJ+jQa6P3VvMJtcWgUJmYTnDXacH0o0Bpz2Bcc2UcTgpYouiK
	T176vBh1UHKGrsPwib5Do/PQ6uoQxXGX8QPkmCh5yLU3DJZibQI/cmxy5vfIMaP8sqA8Yiqv5IV
	59yfMF3jyQD8H3mXaZFUI+GzP+tuqnqg2dhQsmBlWdh/nmacLiKUhf9F1OS5HmY02ogC1ZB7P9k
	0GygQfiBVqL4KxysL3IbKb8ToDkogPk8MA6EjjdT1Lsiab5AX4/4gxT4GQdBm1W22W4b2Wbukq6
	f2/2/+ecvezrWNSMMIgfNJwnVUz4KE31spOC4/wte0KPfKWlKSnvW/zRqa9NtMmXuw+AAggMff9
	wBnqpSxZVNeyQ8oiA2/QKEvVLG10=
X-Received: by 2002:a05:620a:40d3:b0:93f:4f87:4f5e with SMTP id af79cd13be357-93f4f8751a0mr191653185a.72.1792502938245;
        Tue, 20 Oct 2026 06:28:58 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:93f:4f87:4f5e with SMTP id af79cd13be357-93f4f8751a0mr191649785a.72.1792502937823;
        Tue, 20 Oct 2026 06:28:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fab0b9dcsm4429835e9.2.2026.10.20.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:28:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Handle direction register read errors in IRQ paths
Date: Tue, 20 Oct 2026 15:28:52 +0200
Message-ID: <179250292927.34033.5879344425589033751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
References: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-ORIG-GUID: S1E8R32lpnzverox6LyX_kdygsG8Agsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX4/nwY+oVKaME
 o23sSb3QlQbNuqeMirXAMa92htsSvm+olREl5trtGOoa6YHJ0AST6H4BviuhtGxHRuEQUAItBVi
 1VwX94J9cVamShYdIVhGcZmralqczSX8wd5A7Sg3jaN3Z03+GaeglQmhvo9Xaf6LGzTLmYGpmYB
 5hwPkj9WvO70GaSTp8D36/O/K+nJWxfJIT4hHWFmMaXvF6gNCBZ+RWO1wmeXIjXBOO7zN6RoHGj
 +XY5v2GatpWrnswLVkPi17uBtp4hXDriNc0oYx3hy4KTcmFQxJIvbhkmQNqm9WgYVUWfS1n8G7G
 OCYt1iC7z8snGr+uUc4J1VNB36ym2R0J8Rn390eYYhT3QYlzI8lcC5CjXPPxIxUdmCNKaICyL+G
 SOkdPaq0DXhsnNzGsqAtE7hlo5qwVQLl1HVVUmr6CuxuRKafJnh5kmbrH3tLrrWNVp8S3fJgYuw
 9gbbPqcEN/TyF1MJvWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX2qAcGXlmaEYa
 sLhbF+QyZ4gfmRpNivUBs1QUfe8xMeuEnFiipWO8Tc3H2y9AUZoCnKhzil3Wl+nUrFdOW5EF4Xk
 E4lGqcpvY7FLM/asTV2ZCqOhiGcmIgc=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad76c9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y_VTxXPCLCIGpK0l0V0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: S1E8R32lpnzverox6LyX_kdygsG8Agsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200053


On Sun, 18 Oct 2026 22:20:03 +0530, Sahaj Chaudhari wrote:
> Three IRQ paths ignore the result of reading the direction registers
> and then use the destination bitmap. pca953x_read_regs() does not populate
> that bitmap when regmap_bulk_read() fails, leaving the callers to use
> uninitialized stack data.
> 
> This can select incorrect GPIOs for direction changes during IRQ bus
> synchronization, corrupt the saved input state during IRQ setup, or
> produce incorrect pending interrupt decisions.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Handle direction register read errors in IRQ paths
      https://git.kernel.org/brgl/c/a0fe269293509acdd93b9cfb3f46636f7b91b33a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
