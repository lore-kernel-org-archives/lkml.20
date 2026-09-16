Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD05013BD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565602; cv=none; b=k1cViaQTAgd7MoCAOv7zTpK4cMBiuA67wu2TYufFIivTlxz+LJTqE1hADjj+JbqcXfA21ZoJ5SkAtE8Y9Fz3STc3N9K6FRcJVBUzeNhuVDPx5ma4cg2b+NU2RYQm3LjTRa32RTmiPeuz/WJS3BRufB5HjNxfURkTOz7uezloNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565602; c=relaxed/simple;
	bh=pSG/TrwXhQ2SDtoVxMKdzFoXta17jnhiWAGC9pF1ycE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIczubTDgA6bueRQUtAl6lT33y2INZNgm+Pgd3WTxQTuk/OETf3BHXw9db6X5hziYFGtXqgf7tEL8XhiTsoi4SQW+Ngwwbwx8grmSOUtwEaOoITbq/bEA1y9L9ihTFe4RNd6mqD2JdWiegAuCl6Fk6BcNLy9XMFojw+Vt8Vv6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+LUSMrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IajFUMuj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+LUSMrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IajFUMuj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYVhX3291234
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WSw25v0bjyM
	ImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=; b=e+LUSMrRDwemHg4p3ifF/lzSPkU
	zt8FGkx3j9M+3A7eYDS6Spkff0SQ4hwBEsrh2+vJ3NP/xNWGQDY6aiISob6rRZ11
	GKoNfvIvpg4u4rN0R4suLbisqtCokQ8WYI/FCyhGDJNsOKTlrssw5PAK+Y40FBbl
	Ostu745vptMplsHY3GwU5g33+3YiR4MfwQdR5vtI2N8COs+F8DVwhU4bmD16YEwM
	lOQakvzEkhyIQOyj/1XfRlVc3wFU9Uq4qTixpS6xp9AJWRHkRz4Ev21DDsCj9Tbx
	Hub8xbfP2NczQ6bgBtrecHN6YQ/HcE4vUdBYbAYKdacU99wfTRM0PB4UX9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfk25x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so108238115ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565590; x=1790170390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=IajFUMuj3YDDivI/ZNpbWu2zZ4zfHCxIerLxj9/qsXDpSlrfLL1GdI6bLOHPysux9G
         2jq0R6s9MbGicC42gzHmCiyDatbovPSfZV7pqsRfIVIaCTNcEa2DGYhRTN/9FkHvKQ8O
         5jf5uuZeYxJLz9lE9Kvuqd8WbIzmLD2p/vGEyAu+EZ9qkSJEZ4LVh6NloBdpOvLn/qkR
         pAC9v9L3bvwXkErSdPZg2W2HAaxONVrsTTwj42+c1kYxCZHKmD6IQHXeSZPhO5i/wuB5
         3Si4xxwt2nD2FAH7g6YQBt2DQPzX7l0mtl2Act9Zbk+6K3nOFaDpdv0mbX6Ja9lAvNJK
         PtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565590; x=1790170390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=O276s3iqolvSkoSrXqfAM1uFYBsL8TDhcAVlhzULi+Ugt/bN7lBemtmOt73Q3ElkiY
         1d5M6DKVd0LWdu2dGJMUVks6y6g70ML/jDzvP1h4r89Zgv2Oyp4dRRG/Omms0zwHb4Ro
         /w41vtlsYt4beQte85u6tqV1xlZEsbmCYlPWbptBU5krvG6DCor75i1rxexkenjYyg93
         Aipkgv6V4XA03qU5f+imyKkurrIKoMu2O9GNBBNCxM3AH7HwzFlUj0jo5s6z9vt5iU6A
         4DYwBZ8L8fWkYoXo+kWkNFZqy58KRVgyQMh89kCgc8LjXd7OpRQydKBN+UJNN6pLUVGr
         TeDQ==
X-Forwarded-Encrypted: i=1; AKwUvByO3lsP+st/0KeNILXRPzOpp/GzBQ+evdfWVBTI2PX0sg4mChQ2QwOroR86Bs1cJAZKxnDPLv8Ke2q25Fg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbC800RUwpUcbUOrIfjqvzuEhosKrSJ9s8FhtWGgjGeKdkpT8L
	OdqF7oxhO78E4BpNjPoDnD5TKKSqfaYD5DScxls7gkzphHe0hazQSVBV9C5B4Xf4qIgygPCRq1Q
	6MHTl1ALVxX+wUzzcZ5tc7V2qkRSP3EcG0oIL7aI1bisn+Bv2CfwNfj0Gs45L+zlYpbk=
X-Gm-Gg: AYBFou2p8QWvWFdVgQnqhNm+M9jJbTo0DCEh9hdsmqVpmnoDsV6xZD5TqdfvrvLCzEF
	h2uCTBFa1JZVQ0Hvh4+nsC3j6CWSQfC6AlNJ/1Op/5xWgffUeYRvGsLZeR+MPMtI81xI7bnJYB6
	EuXvX+uYmFRZi558EIzzVImokfBRr1CAlzscd4pQJsei+0KVj0w5PUxrE4l0txFa2XqvYTcVYCi
	NGnCJdD8wbP+88/a/5GyWFjtjhvIDMaYmpuP7EAt0JafSYY43wWftzw65UIE6Ms3kXs5bmCfK+R
	kbxG4DYMGIPumP1FOK+M9BfkVVe+y+aoDD6LHD0yEJ/R2DFK+XXgIjTYCf1TJ5tEzE4pwSY1Gpz
	alEPLObmn8+DCcWELXGe+ZkcG2BZZaCMM
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60389755ad.10.1789565590192;
        Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60388955ad.10.1789565589697;
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm12077945ad.42.2026.09.16.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Wed, 16 Sep 2026 19:03:04 +0530
Message-Id: <20260916133304.3720801-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqSVKL2riEdZfS0D@vbox>
References: <aqSVKL2riEdZfS0D@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa9a97 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hk5jl9konaNAbWeGehQA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfXxZFTWZAUITDE
 GAeHHgFPlyqPPyhyQ/ovRxLTs9ZDJ0YYn5dJzNBBAtMus+C805L4P8XUEhrg+9Gw21ZA9oNauP1
 gB9yMf4i6FWEa9Ii8XzHeLzpSN9v4OmspNS+cFPE52qwJRQYZqW+7iYtqxcYzjkXai1ofoBIA6w
 FBZohhLYkOX1ALRKbHDdf+5/4HWAnklgizHb6M74uiAhLjjaQ3G+2OS/YFDUnxFJFcj9h2CnaBC
 WdZO01Z/f3Ht/om4igou7pteyiFHNH5gMroLqdcmpFMn3dHQTd2f2QSNCrn/9PIAQ1t94L2it+R
 4bS2BjWuKwigsEAEHH7CHYArEaIcamPUH4p81qmV6xAeJ8FDJhUuS2zpbzKzP9NzbhL8Wntqix5
 h5cmr748qjo0A44tTqwtgZEqrLK16a1Le7rmFAQT6DChid0u0AsHXOAXoBINXUlD77/7GSPjd8M
 ncLKhqBnk1C2robbtsw==
X-Proofpoint-GUID: Y1vbFX9RBeR3pg6S1OwY6yS_0OmK7_Km
X-Proofpoint-ORIG-GUID: Y1vbFX9RBeR3pg6S1OwY6yS_0OmK7_Km
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX/hr7VVJ2v2ty
 8Sdy9KO7MYdULz0AnnfLC4mCED4G8BxSL0nLETdD+hzdCVxv7m6+X9aorwlSbWe5gCwtwcZOGB2
 9haTmP80PEdM+8H0WBGjLRfdhURcAlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160181

On Thu, Sep 03, 2026, Thinh Nguyen wrote:
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1420,6 +1424,7 @@ struct dwc3 {
>>  	unsigned		wakeup_configured:1;
>>  	unsigned		suspended:1;
>>  	unsigned		susphy_state:1;
>> +	unsigned		xhci_reset_on_resume:1;
>
> Can you move this after dis_split_quirk and add a blank line to separate
> properties from dwc3 state/config fields?
>
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>>  int dwc3_host_init(struct dwc3 *dwc)
>>  {
>> -	struct property_entry	props[6];
>> +	struct property_entry	props[7];
>
> This should be 8. There's already a fix patch for this. Hopefully it
> gets picked up soon.

Turns out this whole patch isn't needed -- see my reply to Krishna on
this same thread. xhci-plat already walks the parent device chain for
this property, so I'm dropping this patch and attaching it directly on
dwc3-qcom's own device instead, in the "Support broken suspend for
SA8255P" patch later in the series. Both nits go away with it.

Thanks,
Faisal
