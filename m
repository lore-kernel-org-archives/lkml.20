Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981889;
	b=2ilTBAkV2nzSCom/+y2m5tg6AhTGV/vfAIlTiTWXT4zw7SYJdJxEoTBnCborsdKRnfVY
	 ECc77ZOvm4NJN2JMMaqsusa9RS2lD4Ajyvhjt8GJNTv7CLV8u4ILcoxsyWZKxdAY6vT5A
	 PMtFpZvqlrPJLLxHn2Gs5qJuSdSqBKPh0McYPIVq0nhF1J4xOkknKgwfMGq+dpmKYQjfn
	 BSLnZg1/7UEuTLaTKZNCo6x4B1UwcQLV1ftekiMLksPXSlY++p8zQT4BBtrd72PsWVVgn
	 L/2pf3B0x5SW96ERffk/RteozM2OTOTJxGVz5wmAYwv5+CV5c/UCGRlvL+A27Wgb4dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Olb2PHgsBhMTLDa7xs2/HL909OsHQObSPGO3kPeXsXk=;
	b=LGJ8+vq8+qADixRny86S80B5lSODF7RGZbcBgOygluBUdT33Gnhl4FHZt+VbVk9VZVPp
	 qL9SvdBOUSSs7Hgf5tXcvIHfWwfzJGgMY8YnrgB5e/QnrTcHyW4+skZCvB8HrQIRYXZ5R
	 SAV5885/OMNnvZjeAP5sswu5h3dtCll8/p0wIeVAHWLa/2kRvdUG6oIf6BT3B/hg9BYsd
	 Pv4Habnp1qg15W66XKLuSzFqwLEFJuduH2jsawcg4g+f8lnO87xMZWV2g/bFUG/CCy8q0
	 40GBxQxVhhByiPLPaaF8li4jKs9EAsmgrg4Ek9+o9eHA3ZhL4ZU8c1JxK/rhg+RPAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="hgTjL/Ji";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QUSmsZCt;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A2606D828
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49A2606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=hgTjL/Ji;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QUSmsZCt
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Fh8lJ2566645
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 11:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Olb2
	PHgsBhMTLDa7xs2/HL909OsHQObSPGO3kPeXsXk=; b=hgTjL/JiqI31WqgneDhZ
	0QZb7smQM9Dx2axu7QuG9gkXMcso4fLw4hbRvQ+6XLhZCihsk8tJLPqkDIzn4wvw
	UwbrCe0GGDAEAS6TBvTWOIkBaw3gFD96cUlIjJDQe+7wjiIjtuoehPb2/QHPnhLh
	QNADb6psCkQBHvz7mYa7mpDqfcD7fILBRKTttHMNN00NDpnvSOREow5wdekasHkt
	KkyGK3Hms8JbRenQXE5fun5v2w2Q5HbyxZc9ZuGU1p67q0xd3tECVxaIiXcACp78
	ZwUVRm2DX0dEybUju7gtJaU9IV5vGoaxXN401XU3gTTEuxm/wqNjEj6XW+3o0pyo
	rg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pcch5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:17:56 -0500 (EST)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so292242241.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793981876; x=1794586676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Olb2PHgsBhMTLDa7xs2/HL909OsHQObSPGO3kPeXsXk=;
        b=QUSmsZCt/RQlqjl4nZA3MPJhGb9f0YQlG1cET4a3SSMHs+U2M2inWUQLEhrS/8rahg
         zwsy3iDL9uJ38ZOr7aC5A+9oA4qwzf/C+MHFjEncz+wwxYwggCzcffcPOunowa07182i
         9knyGK0ys/noZbQ78rgInWoGyjFxatM/R4y8Nb7KhJ6kPWSTQSycVa+ffPKflmaE8m0F
         apm8udn0ujmswV5I/JLEAKf9rCXKc229P5TRvm/f6Zu52oNM8ST7DuMwnqyw7Ag0eVQN
         rGiSExtdFZ3Y7xCEAssDQuB6FlebMgtRsDlgNPIJjePp8vjBnjXL6HDeplU0FAOJ+tPX
         ai9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981876; x=1794586676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Olb2PHgsBhMTLDa7xs2/HL909OsHQObSPGO3kPeXsXk=;
        b=Z5sD76Kt0oP39yGR74n8rfy9Eg3+J1Cp1ZGPzxni+K6xZVJ7BM2RJxTeuTbm7rfn2B
         TReCQ3SAyKmOMO1A3XKSHZ5g7w/Z0iWitdy+i7DpeVKNQUXg74WI35flcv6bmZX0SXIH
         R0ry8TaNMfv7vbOoLB0i8k7oTZT95iGUt7JwCi5BSq/vRT/rDnEnaaQ/nn/65aNTnGgR
         7jMfvTggHUh8CLI2O5YKcWzd0nTfLB7YxyTzTO+CX3TmMxoUphrFupuRJJBiyIJTqez0
         Me92iX94S/MloaCtjR6MwwhLdw1LTlenVLjuWjHxRp5NPiFThdL5HvXZsPKuaGZtUg7/
         gFGw==
X-Forwarded-Encrypted: i=1; AKwUvBxXdV0zBfALzusVKhl5gqTW0r7PuCle5Kc+o4V9DrsJk+NL8SlaxH3uNK6xg7eoNPMLs/eYsfkchR6kUHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85f8dw755CBDps+YdOGvGmcuWAJFprAqoVlOw56TE+gsH4rRQa
	CLDBz0Snbc1ULBaURbNgRcC1XLtpgplMabuDVBk4csHecDjIdxVBvtdkjBgkuJzEIGE0zw5dja3
	0trVfV/cv6rcNJt3Rw8kLOF8qYyp4WLiIZURbqWLgoBHT529Yqvv5yj8gN1EaeA==
X-Gm-Gg: AYBFou27u8QP0Ta9m5kIS6106i/9VtIVYRR/uVBGgvbPmdWl4dSf8s12Pq0jtWjA5/A
	dmdr+rGEaLKBLn4IJMXer5mfvb0yGut5ohA0LSmYrcvHeLq3NGeJcNGHXLJjjAhgMx5Ye+/VRnT
	W6jJX637VFkWp5tDQBbRgpWHPONVpHtZcP6gMRnAtLwf9JokxgwG0RXenUEwIpxlvm4UpOOvJCs
	eVr4bYPmvvF1uu6hwIsNHA4DOafIItXbUzwK+qXDdXCVKfxWIetTIA5daAKLvZFPHcogPMgJQQS
	RCuruAWuwrlimd74pD6krJg68ce7Kji/mGAfPrwLHUS2t+5wvg3IWxkq1PNLfLel37BDLzbsybK
	+XqwAB2Z0dlxnGZLvcCACUS97CJj8ItF6Ab7TdPa9rQLR1f/OZEKhzS7JESndRP7JXAMfPWhE3v
	6cpLnMqTrqG/DAx3xpdOg5IIt1unrFq4KN6w0uOvjtoKI1EvbsYfvtXkYU4JzCZpzCTDKyyL2u5
	3pTrj2MZhjYEaYYjE97hQpOqdpFOmxiS95KqTW/9HPZcRGToggg7pD7GRvrAs5L
X-Received: by 2002:a05:6122:4b1a:b0:5ea:f1eb:b9e2 with SMTP id 71dfb90a1353d-5ecc4431e14mr1609534e0c.19.1793981875718;
        Fri, 06 Nov 2026 08:17:55 -0800 (PST)
X-Received: by 2002:a05:6122:4b1a:b0:5ea:f1eb:b9e2 with SMTP id 71dfb90a1353d-5ecc4431e14mr1609520e0c.19.1793981875395;
        Fri, 06 Nov 2026 08:17:55 -0800 (PST)
Received: from [10.206.221.57] ([129.236.225.236])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64a5ea5sm1678794e0c.4.2026.11.06.08.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:17:54 -0800 (PST)
Message-ID: <c0a08333-c236-4e41-867f-d94bc34ede6b@columbia.edu>
Date: Fri, 6 Nov 2026 11:17:53 -0500
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
Subject: Re: [PATCH] blk-mq: take quiesce_lock when removing a queue from the
 tag set
To: Nilay Shroff <nilay@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
        Keith Busch <kbusch@kernel.org>, Ming Lei <tom.leiming@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>,
        Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261103-blk-mq-del-quiesce-lock-v1-1-04aa29a481f6@columbia.edu>
 <b7d03393-79a1-4457-8ddf-e0d141e4b3e9@linux.ibm.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <b7d03393-79a1-4457-8ddf-e0d141e4b3e9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Y_crrUzbE_1OaNsoYI7V6MBaXaXxiQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfXwZNEbEKSLxi9
 ZISIIrfsmi1BSHZs99H45CoZ8hDU04fQdwb6+9oHuI5h0HxmS3VPRTO3Awqk4pueNYkxgC8Rt8N
 xANcF+/PjEQAktjjzfojcDpNL2jRmSw5WfXmwiEssvTts/hWKFPBG+L9TUNksnaIWypn3Y9E7AL
 4hlgHWoD+/jkHc4ym+vHNg1I2AYhqhpJimVH5UQ4c8quSE8bjAnR2LfjMiuUS19A252R9IwXKwh
 pgzXstM4tLP0t3SiX2xamywFkHnb0zQ5XzHX4Nt2PoMNiGyzO/ExnDyHXXpitlHTxHmrf2cY7UD
 kaqSLSQhjbfH1SagL38P9w5bRCK3oQpMcSX1OR7gRDx22XaQwg58W2Mzq8xzhSGV/awePDIYeiT
 Ki0oxTBQkcsoaVs9z2LUFwqLVX+dyniJFjp6j1lJG37wfBRsuNtJAL/ZNgs2DxxSarKQNtCGJ2C
 Ec27x8uVNe9BAwgtizQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfX4KxG6pgAcKuD
 +7HnJIw7vDWCJs4P2Vn1qWtdU3v1UqEssM6SKjsp2LPiQHugK3e0PpqHNmMxSOCDKzvXKzPZmht
 T8GY1lrCzF7wxyim2/SPgjhhDqL8k/g3nIBvP77kTldtW3vKTpGK
X-Authority-Analysis: v=2.4 cv=V5PoQuni c=1 sm=1 tr=0 ts=6aedfdb4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Z1ioWkiWWmTAar9A4mwgfA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=EY2qA-gEnykLEDzTMWoA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 0Y_crrUzbE_1OaNsoYI7V6MBaXaXxiQu
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=10 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=10 suspectscore=0 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060064



On 11/4/26 8:19 AM, Nilay Shroff wrote:
> Now that set->quiesce_lock serializes both traversal of set->tag_list
> in blk_mq_[un]quiesce_tagset() as well as modifications in
> blk_mq_[add|del]_queue_tag_set(), do we still need RCU protection for
> this list?


I don't think so.  The quiesce walks are the only users that don't
hold tag_list_lock and I didn't find any other reader of the list in
block or drivers.


I'd like to keep this fix minimal for stable though.  I'll drop the RCU
and add the __guarded_by() annotations as a separate cleanup.


Thanks!
Mani
