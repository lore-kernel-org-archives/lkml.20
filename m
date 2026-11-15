Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725409;
	b=fJjQIRRIM2jTkwG1kPOwcF9iXgWBAKL2F9BOuMaQ5+P9qxwX/8wYDPQJ8/ZEl8Qg18wj
	 Ft1R3RbOcR0n4p+gY6zD3YLW5+IyGWkoPFs64ENJHhxXH2JZ8fR4rXGgXcbtAeMl8GS7h
	 9oi62j7Qvt9x1ODYY81Zdzjb5Pyt78inmc9/azp0ZxgV6hOniSsipVKH+XZiaoH+rlOY3
	 shjfwnDxlVnXIQl2AHjDPIVBuQpV5ph9gZWoJXvCDaoME0hzOFtgFtliDU4s5NlAcap6k
	 DoXW8002B5AtED2VIHeTwvbi9o3dLEgf96gQXNRfQ3iJQe2WnyavrvIdETEq/yAUAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
	b=FgF9DNtkwLVY0ZhTxnfDeLUm8neC7QE30oufJxgOj4BAXlW4oywg6I3p1CkQ7FkUFmy8
	 j/mqzh1u2D9+iz254IdzNw62CxUW/cKa59JsSYHqmdLdlkzMjYpAcJItTmfpOat9coQaF
	 Q/DB8RsD7EmX3FoT+Mh1EJi4W4m+fKJ+BqfAnxpAsvnEDUUlyaoML2tE3KpbBTv+9/Fwh
	 m2rzHnj96K8QawxQo6S26X+oovDPDz43JL8q5fC6ySrN9vcRp95YM2BUbyvbgXXg39LvT
	 GWo1s3A1x1aqi/MPrrJdyNjxUJ7HmalsT0QDt4NxfLr/T5ScbEiU6uqSeQAYiuT1Tvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNaLg4zh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA60606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA60606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNaLg4zh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF4SFJr112704
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=; b=e46aqNi+2m8qj2TI
	mP7W+9TWSufJ2gq2nnkmdklX5kA9OZkNI3GY5GPUO4UXJnLUtlexFO2s2qkxQPP5
	k3qyYg5J4hltqx4HN8r7lBGCfN2O9+2aSn6FCgzH84yCNZJ1N4CPpior9hNbSAlb
	IeTxVfDak6qnudDPm//6fAyos1oXzQUrJdeajC+wOVO8XNmVTpEX/2dJ1LEbQDRI
	ulEgpQ2y801Cplcy5BonEjQnHRKDNeTYuCQEuKtLfSPKWr5EeSQkJ8wok82EVCpM
	YR7o2p0ufoBQ9JRa7JYAnh4Qq3FQ0pI2chlh/15qWMEO9Ez4qjw0yWj2BJvkJzUH
	ZuFMDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcad6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3789768eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794725408; x=1795330208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=CNaLg4zhA0Ixuy/NGYTF0cvHnbOUVoEC/bUzDlGRFRDhRzdQY4rdIKNkO2J1ryYBQI
         J90E6VpXciMWEOoNJULbn2aYm5lX4Bu7YJW6qBg/jDVuMlyFC54MUk8MG1UYWmGreZGq
         GMUMG9xpW7Z8LOLtOZXLsLzhZd3ky7uD+uBXLpawtFf+zZRXmN9di28bF56goo6PaLgr
         WLOjNEhZ8//jrg6XU0OevbuLT/uWNbu9JFbkwFLK/CJV98aDs7E169qJP6cHqPPHq5T1
         rfAEQCgC7R+7WptcYubq9opxOTbUTvtEm2pSSJqddmUm1h5odX7oDgkiFNFGMRZj9e6O
         DL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725408; x=1795330208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=IBXpI/YcEDGLkiqhaWVLR9ziu3meJEFP6IHr3E+gJ5GtyVqyBNz4bQDT7lngzkqPbh
         ZrV4mP3SutSlY6UHlMCk0b9luG8nqhtPkZAv2q0uai2rmihdNwYd+Q++xSETzAyx2ZqU
         5x5j5cKeIYBlny4bXq/0EXhadxpaOQtLdTelmGTIH/vpXdPYcShsUu1z/ctUk+DlQLft
         TZhQAJkdObYfevPlnFjIqjT0vP5w/y4awttZU6oDeI6W/1TdWpqv8hsgLwfMaKB4jX2B
         sWhyT7RIwXu175ncAtIvj4CvMcpE6tO+gkJuzLki5MMDfWUDrBW8bMA6eCpV2qYZM717
         U5ig==
X-Forwarded-Encrypted: i=1; AL+hErHFE27URwB+U5bDCwlxChFYsHFtTwba6mZVdAWfOoZ80x87v7pWJYCP+8rKdJce5YcpqCvlUXlRbylS87c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x2MuVvnydY3X9XhBKn2UOwMKFVBlw0KcUdNDY3GZvJfh2cTN/
	3XehQNLaivRSN86V72gqCbT+0Gm9aU9xFCEdJLDjnI9YgigSO1e6ZXi7aozoCB5aBeVcdYR0vsF
	ptiWQXNReGCFJ9j67uG6KZOLj/niDuYHorJ8EExLN4hmtATcMy9lpbi/LMCieoC+v8wY=
X-Gm-Gg: AYBFou2BuZRjrfGz+xezVle9Adc/ktmV4pDOonZQQ7pk1Mall4ZoxmazhzfWzaZCQX1
	GT9ihQsadIt6u18yAi/TBUqjAWesSJm7I0/egfjwHtv7xQPMACkHV6reobkhI746JUOHyzEcsMV
	Dd4nUE7cwtKNF0kicdbGn/5qcuU06ct6BwPcoCzDR7sau3D4sh14BsqOBdIgX+9InGebyKWj09y
	W9AcIBPbe3s87uHX2qZ9G5Yj42dTJpMKQa6pl6SccROtbVgJn96MG9+HoHaUYdYcHZAQR6Vj8o7
	94UTNWMFKzzXPn7q5IoPU/3G8rgbPUbZ04HKchECSp4GKzIxlKFMGJXdaVKpKYgx4iy3/nwNSO/
	jbt+mcI5gbp6kQSBaCwIJu+85iesoyAcxCHd/S2a1c4qou6GaQFPIOc7O5rzGyLSjjRYCNL7kS7
	mY
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149319eec.1.1794725407522;
        Sat, 14 Nov 2026 22:50:07 -0800 (PST)
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149264eec.1.1794725406608;
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm21907314eec.12.2026.11.14.22.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Message-ID: <a348ca35-eb03-423e-80f9-4a61a25439c9@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:19:58 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX84fGLuqJM6B8
 4gbi5RdcyBXTA0LMRO64FLceDwbJyKu7NDwruFrD1JZRpQbY4d1w5boeseHlJUjlgXPlJjvV/FA
 msdWjBjFjOl85PRFiM1h6kyKJmwFlFM=
X-Proofpoint-ORIG-GUID: GrUDyTz95Zjpg7RrLw0aLmMYrvi2pLC1
X-Proofpoint-GUID: GrUDyTz95Zjpg7RrLw0aLmMYrvi2pLC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX4amIt1o9Q+54
 +YEGDoukwgPKDm/pDNVPPtE7TShaZVvUJdDvS1mIwTiNu8vaRExpbN11CLParkXRy0QfyeddvWV
 qJpo14EjLFgMrz3hD3Jc76msMHvg5k6Q+d0XPVtVJeOZ06fCuFFgDUCDJbl0dx50t+ImOskBSKi
 gv8EV+b4MGoYq+Jb3Dc0GNYQaj3HJ8E9OSF1tNq1+yeXPoFRBC5/3w02+LFHG9sLALO4jlzOoVk
 A5QGqQkXyIhYvYAWR4l7dQC9+L/xhopE2va17bFE8C1HXNF36t1fU6gKA+L5si8hpINeNbuItPz
 Gho2tR3kaSDhBDw90S9GWw4keBGKlfoAePmOvobdf4RQvV22J7P4MT52/oTvL/HgnSHQo5D+pGn
 IBCW+GSgeo6Bs9wgOaVctZ/hxzx+GXiKXL55dpv/XY1GhATYbPGu7dtnR5gBEHfvdcv9hs9wDXO
 B6KqGrJS1TG88yWDAhg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af95620 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=9TA2UkIA_kddnzGnNAoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150026



On 13-11-2026 15:24, Loic Poulain wrote:
>> Limit the allowed ports to port@0 through port@2 and update the example
>> to use port@2 for the third CSI2 PHY connection.
> I know you put this in the cover letter but you should probably
> explain here why you think it's ok to break the backward
> compatibility.
> Even if the binding is recent and we don't have in-tree users yet, you
> may encounter pushback on this.

Sure, I will update the commit message as below next ver:

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding. There are no in-tree users of the old port@3 example yet.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

-- 
Regards,
Nihal Kumar Gupta

