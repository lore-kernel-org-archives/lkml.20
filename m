Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958213;
	b=212b7m25BMQlQom/G8RkqH/W1oOVbdqzrizKeV5t56Wxx0H8qD9dQ/Ut7ssMFRP2W/LN
	 g4EC/FguPyyquhRl8Gw/5FbZr5vKvqDwQRcD9RJHkkUhEbZ9ezxw+yBEF2czBCQ75mYsC
	 +NgHQ1A+YYdHwxKDIV9SqMh1enw8QS+tHAyTSo29dmS5EmfNnRambjjZykjXzgPk/SQ+t
	 WamhfceSOb7F6VHnwKg3vv5XjpeN43rIE0KoEZfokyTi/MKyXfJSOvmH5iUUwWJ7HvxAP
	 6EbPRdj3k/kKp4zAJAcB6WXwhbDmSt1acKsdhtayl6uEYeEcvob2EkHbZqt9dWv4vSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
	b=bD3T+wAQBUpXUYvh4I8MJg7gzohG8jKTE0LNlRhUsu8sIFQV5IWkTVXFcsorlLcKgPS+
	 kIQ+D56UTzgjrxNhORk+E0+mHbasp+YdWvxj3MG/2YkN/BLnVpqeKsegbJBV++vbzHzNd
	 kXprasMOPXx07ZQGXE/w8qe8yk1avsUw0j51ogJJS6uIXHMdg6vhQaEbcG0aQUmfX0UqB
	 4YWNQSMu5reHznnNmEc+KW8RRrFZq6bDbqtGnCuEoxoRRRPh941pVrp+vek5PQgyWOVSV
	 7nUX6YBQNUHxahC87OTEOzuLrNmuCj03N55C0x/Zqmdi2Det9KoNmDvElDn3vQF9hhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Djh+AL/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OhvJ4FX7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC498606A920
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC498606A920
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djh+AL/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OhvJ4FX7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RAfY3243938
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=; b=Djh+AL/+2B4ZApp5
	yOwfqn6TlwAScj+d/ugY0FXMbUgR5g1+1rMHR6RvMAOf+hJ+Pttm/UrErNDHFHDR
	qOtM8Wz7A3XlGzghzTJzQMqdWfDHxkwp1WDVthuV7/Ff75La540KRE0FciQU3lfZ
	sTZT5grtLChD1vzby7iSkYInHjgOzAtG5NBGUR+C8DXmcTHDy/nVbLUhgF//OwnZ
	DXl4YjsCjlQKErrNql4OQs28tb3jGUiWLi+LQPxREIGjHMPr/0rS7CeWlJwyRHnk
	JpHcanVHutOof1g8hfUqKFfehC87yP2NNbKrc+dH/ObaL86I0deabSRSmD/jeG5U
	NC1P+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa250u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:43:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945b0154705so72397885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958211; x=1794563011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=OhvJ4FX7LG+WpvGluyN2NDNGy6p/RL8XW7NM13JYzS9+8MEvgAZyuA8kPovD6e88/Q
         RzUAWFG05nR2I569LzBZPcYZCYFD09f+N7JyZH3VrMCbapWfF+fl1b2I7p6HBuQPqmkl
         Mz0YTIU/q9hwRa1P0jg3yGT6A76mzyRlerO9Ex/Xr+Ruy4xOHrVYg6W3ZCRfuiKyoozQ
         /zMxtNgA1Qrgz7hWcjT5EDmZAKATMBnv35Uc50ktpPUyVuwsmpEfAt6tlbry3G+GdjZg
         rlU+R7fWsVi5usvcjPRZT5ytwI6b8Z5CYHambiWBax1LwKBXjVQQClKEc9mf8wToqsb+
         MPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958211; x=1794563011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=t94A2IdcwTiRo6gruBoV3BSmkoUsMWobFwotEPDu6fYbrdNHqmtJSknG2V0mGN0Vzr
         wCrdsNoBTIGEEBk2+accf0FR5cYZyeM/Z6E5OB6wtRNIkwCdQeiFRWLYHVKCXAjx418T
         TGyHDTEEzR7PsD9nH34ULm61ApJqNxI4DFf5argiL4NiwhEjD1g9OjfbIiprykXQEwjb
         twh6lp3zgXONqRnsM/lQEeZV/InrmIeQ0ulpvfypwz8uQdrSJSutuSWorJIEbIm8feW9
         q7RyAWoM6nPNI4RYdd3NfblDiesDaawryB+FP68wkgLA/o55EFLkgVSng6m34VAnm5Xb
         3EWg==
X-Forwarded-Encrypted: i=1; AKwUvBzSBe0LcoXxjH9zTKSVNpkQ+AnwfYH4x4oXjhEjngO2a8isEwZcoWJsfaSLRbl9fBYx5Oq6yLa0D/sCVx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6S1uBWDzKoaQ7zxKmQ3Nm/PDTM1udlQ8qI8lVWDRsXlsjqCke
	5RRUTE4lTH8/oXqAIvWZTVZTzn2TThsztuW0YVVd5HyuBxX/DWuemssJ/6ueuIrB+xT+JWUT160
	GopFiwXScnYQSmdZYuNRIew4aMHSdl76YuFDxykB4gLdxNAhAGCe2Kou1K1Y7olqFfKc=
X-Gm-Gg: AYBFou0TZa2faVwwPZdEeqCRYRwJXpZZ556SQ7v/vmpOyEqSv5+M2tDJDoUG8OO2bUi
	v3Ehem9oadxjcW8jCK987AoPxxMLZKNBZ7PdKf6eUVmFLc0/DC2dW90nhs4azd2EK6D1o44TR7Y
	v99ZAwRmf46HmRW+MsklXSV8bqT4+MaAyMMAsrepzEoimawvbWpV2i69p9LoUTG59vpz4Z+XB/Z
	z/JjS0eZdC6PE100Mr33ax2vZztwXrEilyNcRiJ28K/b8poippOwsmkuokT7OWANTxeXPdoRwkJ
	0OtwSvrsvyEMMSENC3X/fpALj2ejXqIF8VDNmEJKwVfZyObTSCo8xfUhLZ8Wx/Z1x8CjMc8T2gr
	8Z5ACeBmhs/eJYKyXyzxec337lqbRsi/BxzpbRmeK/VGBIWn4x13NQA29nkmWfJExfhbiTu1Quo
	JL
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244268785a.83.1793958211215;
        Fri, 06 Nov 2026 01:43:31 -0800 (PST)
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244266685a.83.1793958210720;
        Fri, 06 Nov 2026 01:43:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm41299075e9.2.2026.11.06.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:43:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Isaac Adjei <code@isaacadjei.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpio: mpfs: reject unsupported interrupt types
Date: Fri,  6 Nov 2026 10:43:28 +0100
Message-ID: <179395820571.6762.15630695302653081248.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
References: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
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
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aeda144 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kmRQxf5D32N2tAlX4cYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX7GsP3CPH7Gnp
 kGcWTvEFIewz8cJBzynbcQEO3SaSNyufquabHg+mO//xmijR5Jc7o2+Sz5xzPNJz6l125FywG3s
 3OhOxKbWe1R+xTOGo3tmWQY4My82/a0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfXx8NZi/1Jj1zp
 ftkdLkN+ON92iRiCLT4vC3S4rX6yRz6jQ5OoLhtQ8WkNVFH697cxTWb8kBphx4hyxsV08MIE4iV
 iuwfgZBvzT/+7JMRvqOpEVJIAmxLpyGbQg2OeQSG4BvnNXwWWej3vsOZOdUUoA5rWnjA0ny/+nb
 9gxMaBnLe7/jrA72ymo9KwacTNW2kbwQ+Se9P/5y1HyXl8B6C1mltVitQ7/HecWzm6eNQexIPLJ
 XMAArz2RHE6FpB/77CztQoJ70pSiGBDBUbw/54WtpEqSI0vXwfddblA/Ovz6tiyWS3+W/2TbZhy
 zmG6UkglpE7s2ZQJusg17PH+S9pICzAoXi7Hf8ctH2hf37n+p/4uvyenyohXg+k4OqzDh2mSKFK
 uliorQ6jjcf4k7t1QUG2tljz0K6z0EADWoTR/1Qlk2NG0xN0dhzaDwNyQuGQ1FF/rsKTJnGiWKS
 30alYLrKzS7U2VyYXJw==
X-Proofpoint-GUID: LSiHc6e2MZSD5blErqOpdjb8LmF9Zei2
X-Proofpoint-ORIG-GUID: LSiHc6e2MZSD5blErqOpdjb8LmF9Zei2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038


On Thu, 05 Nov 2026 08:16:51 +0000, Isaac Adjei wrote:
> The switch statement in mpfs_gpio_irq_set_type() does not handle
> unsupported interrupt types. For example, IRQ_TYPE_NONE is not listed.
> 
> When an unsupported type is passed, interrupt_type remains
> uninitialised. Its undefined value is then written to the GPIO control
> register. The function still returns 0, making the caller believe the
> operation succeeded.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpfs: reject unsupported interrupt types
      https://git.kernel.org/brgl/c/cfbd01eddaf5bfdd4f53560013fe830571a186e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
