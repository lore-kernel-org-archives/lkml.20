Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715995;
	b=bmee0k3go4Uu2881OSw9WLb0sOkwd8wfBG5kWFWO/LK18ODn3kSI6sjfuOMJy628IvUP
	 hb/axv+UrJYmJxW+WMs5naEth3TRcS7D40OwknAbhY0dcpNyWcu+zwafao4IcsvOy6eKB
	 Qlm5sp1TnXFdg53T459E64PZcM4rksiomyk9IGfTrgkVy+hMqFETleBC/wx5Rs1O6s8Ds
	 Imcl+Ud1kBW89FuZPabb+mMfhtehwNHSjFG6n5lEz74In6vmrXKT8u5Pnz8g2WHttLTaR
	 4cxawO7HcmpQZaY1tqILjNVwdarfaqPYhyJl1BbOgOwEQ+/LTdXDxMIh4BdhoXvKu3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u7i19w/BqN2CSb0OQ8r25Ir9YAYIrDO0AqTPKoTJ81Y=;
	b=UcSaijDstO/j5fPNkWlHfgtmn8SAXSo1uHTZshgxk9zwQ/wWKw34UWN0xmZQwWEk/E+D
	 7sEgjSUezSSQkjShSfKTbB2DPTzQUTy1GxOHiuZUVEKiIXc7RSuSaO57Hr4m1Yg2fgqna
	 GFGJhLY3oVeh9582BQlSvZX0Khqd2JN3b1abtlX0Rg0wHrXDzhEqiWvbiFZ9X6LOWm76v
	 8rRt5wPTGlXiPBrm5NXy7nPyKUHGnc2inhaP3mW71qIsBXlryTcEOQ7JgGyBtUKf+OTQb
	 K4CsUjL3FJPnWp9FJM201jTJaP9KHc8p8wdsRQxOqL7tD1ngVqKBu7AWcWzcVKOb0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qdLGrGhc;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xJ2pCk9F;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDF606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BDF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qdLGrGhc;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=xJ2pCk9F
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E2In21183714
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=u7i1
	9w/BqN2CSb0OQ8r25Ir9YAYIrDO0AqTPKoTJ81Y=; b=qdLGrGhc6Lqg6v6RBDVl
	jm8ObdFsmx0WZJz++7yFKqgOMJbOPwGu8lrWvnpbC5+CE5vhX3GbRTM+XlZz/Ef0
	eD3qanrJ/8Ob/6n8lCtMerNfc5Rp0m8mm0qUS2TSe4ssO5TJtRoXAga0+3xL31Iu
	IZuNywKqdaFz8jYq0wG4HaiRDSXSbEKNPq8gPs5bucB09zpDksTEiPjpsXs8TFpo
	42j+X4aeps8RH/YcYuaCslVg6yjv5nwLxIgRpSpdF0mLGcfBrlmlWFZMUqMxaX6+
	Gyia35PszWVIsnlS/z9M2hs5iM4c9ZgAlPNRhiKpDaswxVq+oII+eCr/TlkFMWdf
	5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqbjw9ss5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:26:33 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso927401085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793715992; x=1794320792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7i19w/BqN2CSb0OQ8r25Ir9YAYIrDO0AqTPKoTJ81Y=;
        b=xJ2pCk9Fzuqif+ecKnj4jgF0E3OW2b2iOnrpEePOIvwcQyWChvpnJ7HuSnMZkCOLbE
         dEQaAYyzz7m9woLGNabumxDilhrkwPHkMVfSS5V0sE5LXC0Gli4S8u4lngCD0pufNdPr
         0uxMoImQYYqq5jL/3JxtJr39P0R4HleXMz/oDH2wh+5IKLziAhSz/Q1Sz2tT93iEcYv0
         KXlzHrEq60N1ylZcc139yVTt3C8w+JUAiCRmYxJVKcYTqVF5XflFUT8kZNe11mcwkGAP
         SNhGp6T0QXHtgKGcTobvoXFMOPOfEjxe3JS6036ekyElvoODgQ0nSNfDfVlFRhJF8JE3
         8iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715992; x=1794320792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7i19w/BqN2CSb0OQ8r25Ir9YAYIrDO0AqTPKoTJ81Y=;
        b=WFM7c7nFVC9A5I9K4mqcLaLRoX2UUg45mP4HQl2lXj2U/BMhKAsTmOkGxd+4PvVpo6
         +lyvWzk0ccswzcMbgq0ts43p/rw0bhfnkhCV4MANKJ/Znqj99AyE5a7sYERIQx1Q+10x
         25XuaKZDxQuSAIMBrxiiX90dBb3QZOb0LgvjtEM+s2FBI/VN1SX0ycPYuDWUfCxkkymo
         EEVleqY3PCGZIbmOgNgfkK72Hea4v3FuioEJpnKHQHAERs3nz2yyJKvWsLlNeg8x6g7u
         COH8n00LwlrG6Cytx9Z17qq1SjBwvgfK5gBJACT7En/F5Dsbm7yHvU+JVTtMXBER3Q7n
         BCtw==
X-Forwarded-Encrypted: i=1; AKwUvBzmMqMiRsHdSBvkDXEMG8yzJljXuz5CtwjLn3Asq3oixNyE9AUtPDUg2sImbLydfuGDyt9f2KhgbjSc3aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+MYF54TVZKa2Exjv+IIIPfNLVDwLouKHDQUzp7BTdarnzsOb9
	lZuqN0/NhOImkwq6JHrBuxJFiwOqEqQYx0HDRxPtY3nug9/k6ZNpsWsXHnWjowPkARVwvbEHxXL
	k29RHtxG0b7As148sGVsQtMAqsFemqlJbJuLVNSXkEMYlylDcGznNYTcVNqd6Fw==
X-Gm-Gg: AYBFou2jUG/cdPCMTvDpXfOWfHk8c6VFTfFyURAGsjMkINgdJGgxW4m59jyu5QCqZgZ
	NtPBDtMGQLFzFWB9a/thQ2/xsoZokfAgBcLcjdCJyfd/ZOS13y/HEV9wShZFIRJ/Jz233pP4kGF
	Vi7dirdScBhSohQodcwqvHHInKfYXRwXRhdmn1dt4kU8JDxQbEVh6Q2r3uESAN8StbEpv7CITPy
	QTrxT5/LKk12/7wUJ+Sbu/FB0cx4ZZ+WjrLsCabcBpGbwaZ6gksyzaK6akfL0e8wsQMAJEqgvzx
	VFVj3KBQQ6e6gDH4P1ZivRXgqCtzc2Mr5mnQUGDjG6VUYVyt1d/ZxxNeyz4o0O53NPf5JbbH0+G
	CIvrNaJVnvFAFHOArjhcfUnG3qdxDsehdiffjaKYfXd9biaj+ACGQcUC0V0oeUPed7Vt/YfiMjx
	p4o0rJyavY4yDp+aL/vuGV1zHBTISBot13q6U=
X-Received: by 2002:a05:620a:170e:b0:93e:c12c:9b6a with SMTP id af79cd13be357-944217eeb8fmr2142959185a.69.1793715992699;
        Tue, 03 Nov 2026 06:26:32 -0800 (PST)
X-Received: by 2002:a05:620a:170e:b0:93e:c12c:9b6a with SMTP id af79cd13be357-944217eeb8fmr2142954685a.69.1793715992225;
        Tue, 03 Nov 2026 06:26:32 -0800 (PST)
Received: from ?IPV6:2a00:a040:199:85d9:1574:610d:e406:d9d4? ([2a00:a040:199:85d9:1574:610d:e406:d9d4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm4319299a12.15.2026.11.03.06.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:26:31 -0800 (PST)
Message-ID: <50e0ea38-151d-463f-bfe3-3873a7ee08c1@columbia.edu>
Date: Tue, 3 Nov 2026 16:26:29 +0200
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
Subject: Re: [PATCH 13/16] squashfs: copy cache entries by folio size
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
 <20261103-squashfs-folio-v1-13-7b0fd4d20882@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-13-7b0fd4d20882@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NyBTYWx0ZWRfX4JM+f+ly+l1g
 J1ybArrEMn9TFyZe4LZQ0Uox1S2Kq2Q51BQ+YtY9VLgyTBykR7IqCUverXE/jT/PGNkHYnjx0tr
 yP6M3SkJSAcGk3VkNWALTCtGJYoYFqOswmhWlbNM9vLijJmGetSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NyBTYWx0ZWRfX9zrDcOPcF2HD
 bWbdphMNtZffJ16qfcS9dyPnmmvTQyQ/jCtZfWi1F1CKP/RiCguEge5UTrlEI+YuToCShPtDieM
 /phjYxeCyhrxE2dwhpsiRvy8Jk55ehQ+HLgg+n912NJVSH6hge1dLdGYM2GMZtxAg5UyRgbPocy
 xz4eT6elE4ZQAv4guScTpbt6fh3ShAY11tVjNk9Hxe65jX7wzho29QuG6KvKbJGb5Hx5qrCD0nt
 Z0ofWVrnvuD21x9uMJWVc7hniSWhFPIXoYkcwRQEZo1GEm6PGFyzjHeHrmo52fthtgwVCAjE1Va
 xwLAfbBZWIP4ruJ4VrDroeb+7fHFJiY9o6HjRgSn4UGu/nU660cqPDgUoORUpLe+oArnWOWTJGp
 iTTqaZQO1ryYzT530BWsVrWOt/picImMbQ5YxrR+oNcoKTOSzaeKTWQnT2TM6hgaRt8e6LvMiAV
 nKeKAVh6AVUdKVXihwQ==
X-Proofpoint-ORIG-GUID: fvOQ66WnkoxVzvd6pVP-n24Bp_ikZ5f6
X-Proofpoint-GUID: fvOQ66WnkoxVzvd6pVP-n24Bp_ikZ5f6
X-Authority-Analysis: v=2.4 cv=Y5ttIReN c=1 sm=1 tr=0 ts=6ae9ef19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=cZWmesU1qsY5KjGXGPYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11955
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=10 suspectscore=0 lowpriorityscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030057



On 11/3/26 8:17 AM, Tal Zussman wrote:
> squashfs_copy_cache() walks the block a page at a time and copies
> PAGE_SIZE into each folio. Walk it a folio at a time instead, and copy
> and zero up to the folio's size. Use the block helpers for the block's
> first and last index.
> 
> squashfs only uses order-0 folios, so no functional change. This is a
> step towards enabling large folios.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/squashfs/file.c | 60 ++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 24 deletions(-)
> 
Sashiko had two comments about this one. Both of them look real (one
pre-existing bug and one that can't be hit right now but is possible with
large folios), so I'll fix them up for v2.

Thanks,
Tal
