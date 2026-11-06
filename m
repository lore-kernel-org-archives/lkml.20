Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929461;
	b=zBr4DLIph40z+arA9xIz30sUgKcJZjrmsDWHNtNBZc3Z4kxPWMpR94Se5sLTVSqtBiTk
	 p/+lTEsDhHuH0YLG+H3nDfAZuAMdFsAZU9X2SlEj3fbmLHFxtHJL1lWvE5y8XW2EXiZP+
	 oSYCIrWiiEJhWFOr3u3X8fQAbSyXUiMa4EKUE86Lkti3rF0RSMpWf+2qrivAqRDKQQw+S
	 ysg/ellE4niSxMOCdbXlWOhEfJbL1NfY6pS2zFPkSWTyNCumG+wlFbtUP/KHZ2LdYtV7y
	 6MJQ5B4CAmzoZ346hI8e1HXf8vocrM7Aks/ureGJA77hYgMjL14J9WnZIXaCZvsrnEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=;
	b=vZLfgJ7rx1BJx7CZGEDgR7uH9sNJI8YdCq8wvGryaefV4qhB6a8x6LDE7SPN1vBxJZ7G
	 /lDqprMZjlXDvwaXhAE+xAwjgDWnQhHLgyD6xfXLbsk+v3fFMUxRY4mdbGfI696E+uSIP
	 PUZw61UiQ480swPoTUHb0fskKC475Jsx3SIGVES5KeHoS0FUY1ntcMrBGuUgMKBWQp9Vx
	 kinSMbYtGkvvw/0PCdvrlm3u0/RxYGDvwdjs/ACDaYJ7MoQjp4qfgZou6+ZBE1SMYOf1w
	 v/5Cg/J+qTwWo/gDlC9tGHxGasZ1k8Z9PUN24Nwqmf9BiozJNNgBxDF0rLvxSgDzwJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlUPnCan;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXfrY1TN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1879606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1879606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlUPnCan;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXfrY1TN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nembq1309165
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 01:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=; b=mlUPnCan/3t3mFdM
	XIvjGzAN+I3x1qdwJJQx+3awsqILjZuI1ZghcbCCK66tgFHEObxlulzBTz9NPYQH
	SvCHKGVWsV3O+subaeoZ3c80z9481k6WRqh9gFQK4Gt4F6ZKBFLhPp75QCnfqzTK
	eECytNZHny7X6i0DibGwbSqQrjxcO2VqDByUT3zkmVUVUvw/JyYez2iEIqM6VGIr
	p6cMOMhFp3xc1tz6KxN8T5RxyLtpd5HU7hZBeuTa+QiO+3SVfkuXukkgNsPZ5gv+
	vATTggsAnapLKdi/KzWnH2hUIlhIsO32X80zCnn0VGP0rcWQ+cmz/H2VEYR97sWa
	laZLdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p98b74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:44:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so166055eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793929455; x=1794534255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=;
        b=eXfrY1TNTptpi/JMR/Ha0SmFpmUbpHh0eLUEOmWTcyQhsN9feGqbJfLbQ5zOq4l2ST
         +Gwy+xfmad9vrdgMxb8gsYAuWWC42c6/tdYRPrk157f7O4KAdhlk2ROCVuo84LRwbV4n
         4W7+mnP2Jpfi86SGHJsl9sw+u/5qms9FplN1j8PsNSs0JvnIShMKXY2FEr2ce/QOeKQz
         pVVpnSqcET/X8T/lafXOpEV55i0B8veX/gsFubPiT1jnJLoMsmeeD9Z5wFAXbgwVnl+I
         EXR77OnYwoUX3rNfUFYIhzL4ygPVRi9rY66+n7VTyqTY4yhdY2dmOYN+EXGg+BXhqT8Q
         0sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929455; x=1794534255;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=;
        b=TB3M5ADZM23oIkopia71dS9j3tN2OmR1saUFHNbiHL3Gs1ZRbbFYeteSkjCWr1Olpq
         OCxc5/2HsDTb4AvpdZH5xxM6Czui2r+X91LXK1GPdiq+4R8z68oftaqM5u/fo0OrBi3m
         6WrJC+tKAaR2GnPyqffAGnkTbueMCPY/jVbKSO+za1A+L/JqTwOsXhzZ17uH/8n9sadX
         9Z9tDI/Y6MU39gam4FDDSbwlc2qh+0aZR4iYIxwW4ti7JqeFrvQNZ6Et9njLyIi3AZPa
         p/l1vdQJnsnFFsKL7sApz0k4uzEaFsyTqdwyrMbgVjb+F6iFRW13H935yP3RfU1W1R6T
         z2cw==
X-Forwarded-Encrypted: i=1; AKwUvBx8d0fQmjZ7B7v/VuRgMurH9EgZAWiUpzJ7vuoSfSxn2GiPV7Y1JACUOnJLQIFb2MiBVCUnJxWVDJG08fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QlfohZwZI994B1AH8TpTVf6LximN0hlyBOT3lUhbIiIXG/wmm
	GT6QOJJTNVAoj/2OGOZCrTcC0CIOQbj1ZzyNfqYcb2Z4sQDT0SyCd9f15OtcxKTZadwAg2GyxSP
	9Cb8kVHaOiMrB8vMlOFPCHUe7aPjKaLeusvQo4Hy67JIT4w+qWighcYcb4FzcXIw3c5BTqpHyuv
	8=
X-Gm-Gg: AYBFou21v2OPOzS9rl1ViAyGTzCarkG+GaNcmq5SJhUsW9frpTctsWKEai53biWYWOC
	8YUtuVgXaGRpC8OFSjsZm5bm4WphQZtGEcFbx81Ta+hJDwHYhUuEqY1OqZrs6y1YPvDFSTheAK2
	b/1iJN7lRDynSZyEaO/QzcX4tvcameOu4gnkAFioyffjAJ8EhcHpl/Odyw5HT7jCWlt4oFdYZ4R
	DVLWlZa5lMvW7ZNNwUkTCji1XNdsvKd+n2Zh6ssbBiXPcOnzBfA6HrEW5p8zbkGNUo4GYz89iDK
	YvGfJE9oZPIaRzU28QTMdckqoqyiroq0cH7r1DvcIZPW+Jyc5pJ1UfRGg9Arfu0aDYusJ9zqkNS
	z2dfoefGS4kIEssy8H/sMACjuvmA8gVpJeezjk51ia/olveUG75WLNOY7jWVmco9w8rOOVF30bo
	Pb1+eG+VYJTfUTqW/Hq3gpi42Hs8BqEg==
X-Received: by 2002:a05:7301:9a8a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36f772fb22bmr1199238eec.24.1793929454291;
        Thu, 05 Nov 2026 17:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:9a8a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36f772fb22bmr1199203eec.24.1793929453503;
        Thu, 05 Nov 2026 17:44:13 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm1338870eec.13.2026.11.05.17.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:44:12 -0800 (PST)
Message-ID: <5abf5019-590c-4ea7-b732-d50a287b4c43@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:44:11 -0800
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
Subject: Re: [PATCH] wifi: ath10k: Fix potential CE configuration leaks on PCI
 probe failure
To: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
 <CAFEp6-2xed2JR-kX2a3cbTTtTF3nUX7rNS0hKMew=tn72Tv1Og@mail.gmail.com>
 <AIgAAwCVLF71acoERh*Biqob.3.1793862443170.Hmail.202321181@mail.sdu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <AIgAAwCVLF71acoERh*Biqob.3.1793862443170.Hmail.202321181@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nY32yQX5lVXmnhX6KVGH859rwloqqMWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX37hsD5h3B/mp
 gMsCkzObF7p/FXTBMCNc/M6qceR+RsvppXpWti/twUKSF4H7Aty4OJO/3BDY6xn8lwUQWgwgrxe
 HHz96ZQ7gjEU2mvHvn+KgpM7lw4zndoSyCMNvTsChir2xZ32zgl6E3lLxec3I/WugkrJ1PGwiNk
 ehSHTjzWMo13traojga2QiTsaABceSO7SA+X1wJ7q/nXjLYI1Q0MQvoN6i3jOLdmaqJAKoFglvD
 Wq7Uh02wKuycEGZgRQRfyIbBD0dasmoeeC34MrPLMIo6YuJbvw2LpeSz9Ig7prHLMvVI/WPwXcN
 ONj6n32wH7xaNaWpP0bnWsGd7KsSn3jmFlnQT3u0+QJzMzaCVdbPshiXo/F/oD0TjOsPIwEQm3N
 IYOzLgHzSQ1njwuwcUDT1CKV79hyMZ2twIrIsr+NMozgEX2+tsuz773l5/beC91ZJUvDTXV438Q
 35sZIiUuWfCTJa6fM/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX2TKTZnOg+Oj1
 Ny/Wcu9vjKOFaKkYhlnaFSXymZxyprFytp6FCWleCwf00AYNNdlJHpp6g+WHbZfNBLbk7N8iRgP
 RHvVSGJt8k5eam4x1J/9OdDUg3FfjTc=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed30ef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=LnX6OugqW4TfWTdhpNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: nY32yQX5lVXmnhX6KVGH859rwloqqMWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060006

On 11/4/2026 11:07 PM, 李广硕 wrote:
> Hi Loic,
> 
> Thanks for the review.

Please follow linux kernel e-mail rules.
don't top post
don't send HTML e-mail.

Note your reply was not archived or sent to the mailing list because it was
HTML. I only received it since I was directly addressed.

You can see it is not captured in the thread:
https://lore.kernel.org/all/20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn/

/jeff
