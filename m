Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979613;
	b=rd0bMMrhrxGk+yaR48wsKOQmbFc8ZDIC8Lz6papY/qqeUrZBzb918XJ2oietnjWJQhCH
	 o0zdjGUMgjYHF8qbmPN3fL+oNVXU9Zp8pLVegYo4N5qfcpivwkEgZFnzHA5K8mQAlV67p
	 MbndBCMjHRJrzeNO18WwbPZb+j138YkXe+1fEQN+Wbr1tJEDluh2ZCnEoq6pIW8eyjE5U
	 1FdtK+FznGNeiMWRiwplvk6Z21sG10uV/SCVLhuIgWYQFPG83jECBfWKMaExqKzOJAgHE
	 CSb469rjKWknA5hpbfrbyaN3cWVebvpG8NsRaBA00FDWBkCCUAQbFmt73DlkyOdQ2xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=;
	b=uGu38g514Sv0qumqOg2fJeVOJJWnLgKoYs5MoX9XVNYi45HUqIWARzwF1HIu7m5H6LBX
	 fChMXOOt72LcHvS9g4/IS0uEcjbdxB3dwnPZAtQXBDOzRUfiu36ir97tZZ/RrpDHqiKvk
	 Hk3Jg0fvGVfMQmH42JIG7nckaN9APDBkR3jQOfJ1YEaKgcxxsyxZDBEOS5fBjZqfReaJT
	 gow++dI8Qyv47vD/NRDG6IXX6/sljiQZorAtCklLi98QR8Vp9v5tpsXnZtm7RzCbts2al
	 5wwWRC0bmxbepTL4HIhoW59pBvbv/1eaVJLYKwAAMXxpOHJGnNOctNPztrYxYkVMkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8d6mgj9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSeMddYy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2236606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2236606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8d6mgj9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSeMddYy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F04Fq045217
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=; b=W8d6mgj9Xkbvou5B
	6zbyfM/9FG1ErD3c9jAku8uNrC6wEFv+bHfvgA4d5+9vKUFJIBS96tuHZ+oy+V4o
	f2o4R5MEtmhWyh6FFgOTGBjpLyYjnX4geVw+il2sKKbBqUwxmzsl0zgPFokayAp+
	JS0nUzYOrHdsuGszqCLJ2N7uoCwgBp9X070z7bvn5ZFT4VZCmAYJnICAKrA39mTz
	8rCmqeC8WeDgCPHPN0oPs7omo94oiBMHetrJmAoB0JncSuI4H3txlAtgmH5Or1Bf
	aHWDGjcrvr8IEQ+vyGOMmpRvYOXvnhjojK569ggLkIDwV6kfvMwcBHOwU5/ppKwn
	0pYfOQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3cy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:40:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso795464eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979611; x=1794584411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=;
        b=ZSeMddYyGcMoKKvl31Hq1PCCR3JKKpQrYGD28E8nTEm+3dLnkxcOnsS0WcNlAVpLth
         Q6OhY1mxkrQ92SV2nqYf9qudtCjEUBlOUGAqiNINwnAUai1kzMPkdrbu5+TdLZWp1WOt
         +9biB0k+rHumkfsR/l6+zeggzmUDBoViMzI09WtBt2/nrEI/GEhS54W6wJA3x2eaprDd
         Zyrl/JziblZFW85cC9+8fVwEZgaDJcOyguO82gSCKXVqPX00/wmHNG2tXVmV8f9/l3pp
         danFqHvcaFIQHLkZNt+J+hSFE/MydXViGhiGrUZhil6CIOFa9mFLdc5kn5ZDVcAs9JSt
         TaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979611; x=1794584411;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=;
        b=zeoUCv7kaR9FOOJUl04L+Vkhud4Z7qW24g8YAvG5rXIFgN9DOup+r2hpa019Kif1WN
         LsgS01WewjMRSD2MPvUAkPEFgkArv9XYIEOO+NldlgzA5HfACmsiAaeGEWJaj3Oi0J9X
         LE03M9W3RuTZbxBsKmpdg+lJHBLAh9mFjmnsiMtrBHc1IIdWZUX8o0LSbMGUxvJxOLwp
         Yuvjp3z6oIKdQzUVIV/lOCgsnLoSNc8M7GZuwlLz7teC2YQptrEGDqbxl+vzbTaEXbEX
         1wxw9g1IEsuWRHp/DooDoay3e3VMK5JqFsGaWsd9NQVXmtWq7D5QUSerLeT557JIjhAe
         8MKQ==
X-Forwarded-Encrypted: i=1; AL+hErGeHTjJPI2DNNLjPNdanWaWk7ArVodmGDrJWJN9GfTXqYdHTQ56PXQC7jbO+o2LaTKa/KoW+c3VToWFHt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+q0bDaqUzmvvZhon4cA16Nk1lFDuMO6Posf6JP6O0gHBXntq/
	E/ahSzuBYZnKlPNkkj9pkqFJ0Cj3YnXy85UJaB1xdr9DDMlfZmy0th1wonRbY5UgGQZo5X65Rfu
	2sxhOQoHAFzADbVNF68Q9iP76oIR/SCGDqNKt0L83zdQB/n7APTrJrvF94Lb6FtBcteg=
X-Gm-Gg: AYBFou34fsp2X8yMVzeYIdquulG1QuiKDe3NeIPWfvJrgh42Vt+zoyq2mJtYn2pZuiP
	W9Zgw3TSFcm1ncQj1VDc5/WxL0S0WCl/ee39JfZBxLCnmP+u1+zXPYTFPoqmTdAswWO6E0rFBo7
	+duTz8+Vzr4COn7NFz22YBA0P91pCdrGK7a5pg+ZFwP8IFFPEnKPQn1eMtuKX1Yem/32/Tez/aK
	6Tnf4IX0H7Iy3mLtyC9M8Pn4xkoBXzoafY7RYDxyEvZ7r9MJ3OAJNy5UIgcodUB9ez5ynoWCn/H
	JN+rB7Whlo+fmI3Gbgk19rmuu3Dd78xi2TuP5QilwHNq9RzGbv+Wnuygnhg1QzSyPVq8C8EQslQ
	clyZrWMTBkhNVgd4pzba+YjYg2OaqFJMMjHRKiDGLcs/+rqTPFbwqP2B1HBt5SELSFBx0kCjJQW
	x/H45XPgbpSAoAttH3h2LSYHeznTk=
X-Received: by 2002:a05:693c:68c3:b0:36e:2626:4ace with SMTP id 5a478bee46e88-36f7398b906mr3825474eec.5.1793979611098;
        Fri, 06 Nov 2026 07:40:11 -0800 (PST)
X-Received: by 2002:a05:693c:68c3:b0:36e:2626:4ace with SMTP id 5a478bee46e88-36f7398b906mr3825418eec.5.1793979610314;
        Fri, 06 Nov 2026 07:40:10 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm9851246eec.13.2026.11.06.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:40:09 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
Message-Id: <179397960950.1195422.2420449019221399402.b4-ty@b4>
Date: Fri, 06 Nov 2026 07:40:09 -0800
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedf4dc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZoQ-0plOPn13Fw6eG44A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX+KTkgW8MiKWG
 Hm8D1g6uT1OPF1+G1Bly4GIuHO074fQDRV/AWWW5rKMoxEq6gyRcJQvzb3LDsMllw4ytJ51OLNq
 dZfLFPs5ccd6MaIpnVFubnnyJTQ1d1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX+WaNCyCXB71A
 3GfzA+DaYdKHJSNyFmnTCvDs+/zMQfWANR0kEJkA4P7X1QTcmN5B/4JrXaf/exx0T3/FIdIsZwj
 F9y1nzquxIv5QiodEpqeVQPcez28THljw06zq5SaeMopf5o6PyzaPtbQ4W55yhy0aPWtvGC7rDh
 pEPEmtbxUaQhrYkpmso8HbsdN9axA0xKmhONHRwLp1FNiyUqOAsahdQnDTfPaf4iKRoCEpdDbDV
 Jp118y3BguBiMuJBTnTM5rUEnXz1yrRWp6l83SEGbtnn17ojfC4BigB3XgRCdFEEcNL7J/8aGFW
 zqtpEjJbRC1BBWR+tGlnBlKZDD2yn/QEnWIoF6nLaxemQZ7qk6EOtmzTfSZlL7bGaIpQ6V73zkM
 TgRivz2+sSCaCeWkS1g5TwIHEyPc89Kk2ydMv22po5yM2c+xpE2qp+qwxw93qYo7cUtAXc3iJpN
 edovn8DgjCSgScDchfw==
X-Proofpoint-GUID: EhuK3NMSTCwrV8UhFl-crzS6rkd-zfoG
X-Proofpoint-ORIG-GUID: EhuK3NMSTCwrV8UhFl-crzS6rkd-zfoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062


On Fri, 30 Oct 2026 08:19:13 +0100, Krzysztof Kozlowski wrote:
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.

Applied, thanks!

[1/1] wifi: ath10k: Drop unused qmi_elem_info arrays
      commit: d866eeb11be24c7bd6fabfd7da158ca8c16bbbab

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

