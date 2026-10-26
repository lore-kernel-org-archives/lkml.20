Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025018;
	b=1qoUiyko/R9eHg4Oq/2cyTASUlXCfbhdJpYIaMARNwe/tqWblBoI1zO36baD9ikNn7xZ
	 PSZffu8eoJjLUhSjXsDa08BgGFwOHhobyjgqLtDg0K0kj+Whgb3XlD/mXmvbgYa83Bd28
	 LIbSI/A1vbnPG3xvUZVvbHJPRUCKUb7OXgOWDIGC7Ecb4pmCjcrvXQr8gJROZaw27V/XB
	 HG89Tpjx6k9cay4YSuxsKTyxdTPpMhd/+r+rXb0F3YLmTIUtlF5+RWm+Y/bUWWk0EpTNB
	 IlyncWmSHyhhvPDMQzX/LjXJS6cZU7BxXvn0vq6gyi1zFZ2N0wgEtC8JYMcjuTkqFNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
	b=wg7DdBJSTEK3CmoNwRDi3HdZoJOF5WSbWlSoVTcmxDZweS7qav4eFkUSLc9JLZQg6rI3
	 q+8s7pTVMOs6VM257dhgrFQbPfAvoAG1FKWjK7EmvrFfrZ2JIrQl+kAjnz/+wGlaopKAX
	 iJ/o1OyxiPriYtU+sYLeXYEMVOYcbcS513Bz4jaY3Q4a67sgyYIOFuhhOGjeTpCycR49+
	 ioyN/rt9gWQA68cLvUDCf0xTkYeBrfhe8+j1tqtLzege/F/f9mvpQP7V//9VXrSakOZej
	 SAiwJfzm7KTxeWVN4GKl1eC+z5x4VlKg59dPbuDcuw7MQB+wxPYc10paK7VeUq2SLaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKhQwNfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkczg9gZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837F606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4837F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKhQwNfO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkczg9gZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIMC3563651
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=; b=jKhQwNfO+Zo3KeXV
	sdi5uFRhFO7ZiL5Cgj/HeYpSRjnjHykgePpbNzrXzOVo+cTLBseTLBGgZ9KFPkdt
	1fGafODS9ud19fTLAqOpq2Ae4CKl4Jzakzg+8NnpKePPy09XC431itXnrKjcINcx
	iq8jO5nc/mO44MNNfbzbB6JcQSQHHFQp/ZFzikQuvp+R6PmdCs6KbBMiH6ycJStT
	UINvpGV6Ok0OJcz5H6YESwGkeu+JiMlawbI+m7/cgWZ1BWF25CL46BBzsIR5CWHv
	KvTlkI+58lO72M3QwS/daBnE8LvKsShpYPJsdC+6P9VyDb7RafWBtRZKTzPbqx2z
	yrOzqw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91117-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:30:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabe7151daso67684e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025016; x=1793629816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
        b=Nkczg9gZKFHIOc6ug1dbluVcPPVb0iJvRR4hd8jqhO/8+ypIXK+yL9Rj3REKa3Wo7Z
         90KFev6ZXieYszZXiJhBfgVcwgmmM3xvaAdxiXxcTYE+G/iFvKNLC4XyAxVb4BydP4eh
         ACX5psc0+0HJIGwRMWVDm1nRM5PVIPvkg0wC1vVJZzfPcM8vYXHB/24wFmoS+89I18/M
         1EWLv21yr4S4HKpOLPq4aG6YNb7cRnCzhY6jTthj28UeVkyWjg/8fhhDTnf6UFZuK0vM
         4uPvS0tktz8BXrHKZwsKul15eG61oaWdbWd0METHGx30WsLNGuyYYnBmbOAE3GkIlTY8
         29zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025016; x=1793629816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMu3fnCVQwPWkHQ66Uo2nxfdvwj8lcTfKGOFI3BAhX8=;
        b=hxNsS4adlEASrbLwyerJg8RsrMKmWPiYU1kLXIV3qf2qMJEvyZs1ClyVRr5jEsdLE7
         sHfK81nsYiy5iU6fiCs1XqpTElov7z0i0PC0FvUkkmaytB+VXLO/Sf5zApJ2FtujkCe2
         VhbZc7ZBvSyL0+ND+OSEHBKmxMLFXahNHOcSxcvuZec4grLXyxT4NrwfBhqmiDJfp47n
         hVg1y2cveLmMMZlz0uBDTxnKRnwl6I3Hq0I9upIk+0TIohwhDNO2C5+j3wXE0ZgWmlGp
         cEg6PyT1x6h1YaMT1ZWG5bZwvQRgyO+q8oesH47lTqBw+BddJ6LX2yeRWbUlkKgWdzOC
         T7kA==
X-Forwarded-Encrypted: i=1; AKwUvBycAjNDL6QisUr4AVDg0ypjHTByhgy4iV5WEsajXJ+/FEAu8/I+aF2jtqChNnRHKgI8KvsrQl9x8K62924=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuXlwex2Sl5ciShzCUSR6PVwcY7ruRyJHeCSiRnr9p0EC3fZ9t
	ly6ldG869OV6wbY5gXw1njMdADo0I9iWYameZewxLXQrv3DYsSA/soEQtQcdONP0H8whGDwDeLk
	i5btCIZRUU75dC/FbHSl9vOTPaENwsdbfR44lDBu+Lxi4nakmi17cKtsSiM1j2R9BVwk=
X-Gm-Gg: AYBFou3sAd0HKRyVOjiqeRMpw0A/9QEYyW9MqFBm/eVjtFQloFqWG2562mV+n628phF
	8ziXipQ2a1qrzLGbf+yyf8QyT5zO5/mzs0NPI5N1DpDiPSjZMA/gJPyKBpTMa0tcxTZhMec8Obg
	8TqC7y2f0KyXu7Ki478o8sufi1KATnWHSXnnxiiSWGDDqk9XXRe8ZoD2w06qRRY07TlegUzCQtV
	tPvEYOqzdzSBXTVMMmw4pJYG/ck6gzqZW/RUHDgVqcsOi/VSx9W317D1x7ruvIYfVqQRdoNPkyd
	9xa9PG4PkDjpFbIYPbSQ3TEUA2SYmGujYQb4TRPkWTrogItNxpyLiy5hKQSeh44PM7EMfpqdzmz
	MnbqiT74=
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1950667e0c.5.1793025016065;
        Mon, 26 Oct 2026 07:30:16 -0700 (PDT)
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1950600e0c.5.1793025014974;
        Mon, 26 Oct 2026 07:30:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6f7sm328224466b.63.2026.10.26.07.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:30:14 -0700 (PDT)
Message-ID: <3afb8798-5859-40cb-b4ae-da7de358771d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:30:12 +0100
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
Subject: Re: [PATCH] clk: send abort notifications when a parent change is
 vetoed
To: James Hilliard <james.hilliard1@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Mike Turquette <mturquette@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX4oAp1Tp73sqJ
 h0JTGYgUfqPfLE8VVFvy8Oux63bO6Drnlk23+LIYkjBPqztlQ5nV99Dbzgrvwc+Z49QFOuIiZmD
 HFZBr97Wam3GxqFsAZjm0ufuJTBx/uNYpxjaj7DvJmucvy7z3fFnSuZhN7WbxaYZQ0ajY04bkAn
 OfhhqOuIMdUAjYKN7bxf5yqp6V2HYJwGF8/CNwIezn4ZiKNj/lr989enyFF2AyfJlPN8gwolqqT
 XnvfqSlOFAQVn3FeD5/9pSbmmuhngbGUQgwYq9UxNI+zXkWDeE8tSGrkoKty6xwiQLb8xs/R8Sp
 PAPY3xfOh248bUGuHYfERnO+UxPittL8EFtf8gE0i1dpxVXqxmDpZlfwqIc4nL/B0s7A8YwQqnV
 3PedaeBJlugtrJqNwy/ZPMVLq7ywm+lh7DiHJo/g9KzqNJr5zX6dB2Yk8hruhPivGQ+cGKWD6R5
 RPGRx+AJjjSeNKeOQ5A==
X-Proofpoint-ORIG-GUID: eDFLkRtuGcZvl06jgrMzVZoZrNhtQ88x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXw7r6oWuy1PPq
 VTpxREhRKNyl2Z6YLx9j7qudt1vo4dfl7ulORF2T1yMW5LJF3tYSesLNXMd1jcTjBYm+Fr4+L75
 BW7c1Obhr2CFrqvP9WbRWJGXjHKFmGs=
X-Proofpoint-GUID: eDFLkRtuGcZvl06jgrMzVZoZrNhtQ88x
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf63f9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IX6fHhDGAB72HcA44fcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

On 10/21/26 11:28 PM, James Hilliard wrote:
> clk_core_set_parent_nolock() returns directly when a PRE_RATE_CHANGE
> notifier rejects the proposed parent. Consumers notified before the veto
> do not receive ABORT_RATE_CHANGE, even though they may have stopped I/O
> or reserved resources until the transition finishes. The caller also
> receives a positive notifier return value instead of a negative errno.
> 
> Recalculate and notify the unchanged subtree with ABORT_RATE_CHANGE before
> returning -EBUSY, as for other failed parent changes. This lets prepared
> consumers unwind without changing the parent or its rate.
> 
> Extend the mux notifier tests to cover both a self-veto and a later
> notifier vetoing after the first consumer accepted the change. Check the
> abort notification, errno and unchanged parent/rate in both cases.
> 
> Fixes: b2476490ef11 ("clk: introduce the common clock framework")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
