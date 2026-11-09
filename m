Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190122;
	b=YvooP9M01+80AifFX03bw8IWhkZyKz29arigv+K6vg3mM/gNlDREGl7LtQiDjfJj98nU
	 2m797Ou8fY9x2XWi4yI66WUDc9l+ctWAtXJ9ssqJRL0buHPuGifv7Q6UoY03Xvne2H919
	 fYHc23TA4U5ovv5GaoEQn/BDSGLGUnqI8nx+f8A3pnm/dy2lW+U20Qr6jIVoq7wiqxXK6
	 1tqVgsS9j6dos+Rqo3sUOueuBYUsp9pw/wSUU3c5OyZ9fnueKf0qDb9qBo1XsgsnnRn2F
	 m6FrplDN4PCvG1n1uY9YxMgJaqz+FbgUt30DXV00GZ2FB7wZDKOwAr4Yl2jVcnl8k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
	b=xzLuppPzL9OeYtGnSBSdODJLDPBsNVjc4FCQzTlDn5sZag7CXM7qxGacQoaByr1Fp4cv
	 do/Z+S8XIULE3k0OX8CjmXyBbwSa/7eCoIPLfIi3rlN72Pu0pygaPpUPvls4SLCiiGCaK
	 Ifzj6J9RMuJNtna2r2wTKpg6zxidV5VG0xKUezIPNHTs592i0zSmhRpBlj9jWh+s76umG
	 ksUInnK0R2+5ESVzn+B7NsMP5WFVywrYfn43NdbkbT+wHu2uptM/QBYwV48V3SxU+jpa1
	 QMFxwacTh9l+hDGJ/F868GCcazCyeEhW1WJxZcUtYPQExxhu1mLBeVo0oUIVbFru7Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EowW530X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8F606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A8F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV4VxcvZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EowW530X
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H5Ss3850033
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 02:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=; b=PV4VxcvZEc/NHdbF
	Oe6LhKn5icnqW5+Pd29eXIRMoHDKJgo7vqPhqzCjBKoamE1IyHesxWtw8WJUy4A7
	nZj0prCqfgPFPYjAqVJ6n+xedd9+mcLSUMNV4r3kBHJB6X4d62lKmLufjT/yU5X4
	E9ITpZu7Cbrle+Cb4OQ79RGZWppKr3/1mEu1YTjiXNhAaqSyReX+uvnbyrhXyNxZ
	XO965UFxP+TVR1AuYo/LaWFzh70zJxUDmEXSYJhD1uX4xfEcSPgGnPcNOMSa66To
	M1R1ED9Eo5NJjhQ1hu8aZHYF3/5+Ghw4ERO4WDr4nTxUHFLdQt3352KUDeT2+Njc
	/KuFVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4kg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:08:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so365248a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794190120; x=1794794920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=EowW530XLNDDckQu1n4OqnhAvUfkb1YTL5R+F4LKT4/G/6EMGN7JfUpGcBSz4MGnbq
         NmJWLTvsBeKRP/FFQsLma21OLpPrJby8uiHGBttgwz2gyg7dBXqYPXIMBzrBTB4TjnyI
         HwwWPx1bglSjw5fs/+5W6vgXvwQePo5V8VKkspirveQ6cgoBpkd07+KF1nqD2qUZJBPS
         iRMbM4YCg/w1M1XcOCViYkuLbPp2A73umeHp12MosYmm4OZ/FMkoIksEy8tia6AGuxf6
         f0Clm6mNhdu8yB867la+zW874y2LDAawTdOZNr5pK9BgBKgIY0Vs2Xo6EQgJahz7fZup
         mqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190120; x=1794794920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIsILu38RSpIB/VQtAXT+jlGCK+QgBbfByzV7rqh7Do=;
        b=tGMhDi4GLDrrlhllYN9IeAg85FnIW/8uN7ApijTSqGalLq6u1BesomnBwKgSSnr1mu
         fiTBqeVgjO+Fqu3pIYGPZr1HLwP3ft1FkCH3ZSfuJWT/ir8ziDz7evHHPEavJaoL5CeH
         taWMeURfHep18r6bOh6NwknbZuqwhKdWP86M7HCc6y9JYN5CYiqyqqJ73TQY7n3grpTO
         FK48UkNy29TcdHPbOYE/PMsOXXMrWfhWSSu8SKJ43vI+TX7bNawrHX9T0w9KEwsWv5Kp
         4n4B5aRMZcv4qyvwijhc/wX+KmR+ugF68Wo8JA90C384uQsd2X/3s0j7tFIa8SiepmBm
         Ffaw==
X-Forwarded-Encrypted: i=1; AL+hErGV3u5grG1RQlXRyOOaHsNVZs2XDP3k1lLmoSj4150cf3NdgYWVpFT5NStR1BAHXcSZVwuIUXS0tTjucN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gsTEHU7JW08XzV67VENqI/5ieUvjHWRZ5G1/Xr8VXbap5KQ9D
	yzHZGkOpvS1t4rcZ3+XuLpDa99BLQRxLF+gGVmJB7ssRyGryT/fDrfWyqpr9/RSExG5Ep8hAifa
	ZD4tiL7xo4ZzNiROD3NLF5xDh25iyB+9huUOJ/M3RV1+RKveXuUPDJKkekJ6w4lJBMEg=
X-Gm-Gg: AYBFou3pH8CkCNuYo/tuLOICewQ9v5SZeqb+ZIe5xzvOqaIYgrmraCpJqy9ReBSOfks
	vllvG7SnC1NbP5yVUs/KKcruQlfQSLBx4qyMYwHaAT3lD4qhExcyAY/CWvt8104F41M0tYPZ3Hm
	dEAgI2omqrEi8XX67K3xdhsIU+yT+l38gxPa7/LMcsG6yNu5BVPO2TzZkmDpduYd2rVQddfnZGm
	Z16MsQ595UwgStPcLhYmuCr1I2rNQQKm1gJsc5CskjmUDh6Fwivl1ZgdLSnp5I9NCv0jEJF+gWu
	MS2OzFa+e1ruwz7AnGvl5e/p1uNKHa+DE1VBUqpIYd3KniuPxTfyW+O0KvNKQ1CRBuq0RmIgxJL
	+XUKptyGDba2kGXPm+Wfjs0g2yrHbkywBv0nSn0IiRCI9HVKHxHVUNpoLljSbLgFlIL2HPpB1Zl
	lfk8lPR/WZQVV/BTzfEHkiRChr4pubLKxqDTe6g5/MVe7+
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158725a91.34.1794190120350;
        Sun, 08 Nov 2026 18:08:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c84:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b12d373624mr2158678a91.34.1794190119715;
        Sun, 08 Nov 2026 18:08:39 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm4779025a91.6.2026.11.08.18.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:08:38 -0800 (PST)
Message-ID: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:08:35 +0800
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
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <au2UzljzfMaiL7F6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX+CJEqOKBsP3L
 NYQnMlrMYnAkHUQ+/8mxEiZtTlW36hQEkENGsN8ZrmMYlZeGexNxk7QKDoZrveNUw9USVLf8Iup
 BOTA35dZHORNn+E6Q9vYQHU2IX/Prhc=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af12b29 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=wpr1R3xn-rj-rwNLJSoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: ITo-3YnKFFG3qjWWfJzxUi2Iy03d2iEr
X-Proofpoint-ORIG-GUID: ITo-3YnKFFG3qjWWfJzxUi2Iy03d2iEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOCBTYWx0ZWRfX4mz2OuEItL18
 9xt2Ik+DkHfWjrwW528eyDuu2oMVH6jElG35HwololV4Qb4eLDzhykPV2oFFsORyjxqv4ek3eEU
 z2hHeCkCUZ8se9UejdDmCe/pfO0cPCfI8RQHRb3DdMC/5PiOeR0FHyv7H+4PiG3IvfXCYJX6+al
 Nlqmwr2/XoRosoYTxsP34rTV2xoX19AnldVUmlTxm2/Gt+csLuH/Ax1Nyd2q85dx7VQQeBCvZq6
 urd8EjCvUmbMqaAKRBnU83OK+8row4raJW9GYrsw7HBjL2Uv4ypBQkaKaA5Q7rx6weBM8ju3+yS
 LRq9kFNIIc2VACmNsuqPwAr7RBV3yq14GqvPCZTTbVOTmhQHOs1PjCYAw2MCsZSvXNhspFz0rnc
 18eBhXM2w23AFBHor2pphn5gFfbH3fWDXl+GCSoVqcnsJDbwj+R2zQ2jYx76A4QWe2ywmZIOkwB
 +tMGddDCPNxYqGUenjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090008


On 11/6/2026 4:50 PM, Johan Hovold wrote:
> [ +CC: Saravana ]
>
> On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
>> fw_devlink detects and relaxes dependency cycles automatically, so this
>> is not an error condition requiring user action. On complex DT
>> topologies (e.g. CoreSight), this message can fire for many node
>> pairs and adds noise to the boot log, even though it's primarily
>> useful for debugging. Switch pr_info() to pr_debug() so it stays
>> available via dynamic debug when actually needed, without cluttering
>> default boot logs.
>>
>> For example, on sm8750 this produces 125 such lines in the boot log in
>> total, 80 of which are CoreSight-related, e.g.:
>>
>> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
>> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
>> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
>> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
> I reported this elsewhere a while back:
>
> 	https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com/
>
> Are you sure it's not the coresight bindings that should be fixed?

No, Johan, I don't think this is a Coresight bindings issue.

This is the mechanical result of the standard bidirectional graph 
binding + fw_devlink's direction-agnostic phandle scan — it will appear 
on any SoC/CoreSight topology using the standard binding, and there's no 
alternative binding syntax that avoids it.

>
> Johan
