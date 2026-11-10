Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292837;
	b=O4G1t7lWVyqoNfUoBLPZJ/sQr1Jh9QXjhEu0z66ix2wFavwg6i2Utf4tp/k1Wy61Umop
	 +pbynC/TtTy/CxMm/n2wZKXLQZpPUaVTPPgfbdFSpOQJQrgLkCboliPjwlEZ8DibmnXV8
	 4DSNNG0aqpTalAa4sQbadi4l7t19kBbdhJGs6kvy2UWR+LF7JsapMAJ3hbdHkgGD+wiPF
	 drR2PSnikbvY77eWC9kJx/7xMT4b3kVMUZC/OPBtus5MjLQEfTdCLxy+CpIBnAZSiDS1K
	 NHmdyp2N1p4RGgOZx0dXcIAG9YY3ta6qWqKOGq+DfzCbxiKa9WOqEXHcMPW9WDc7Rww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2YXFXOLWasRraLHbzcR0/nRTNi7YWsnW/5yBPnyszuM=;
	b=qG+CFi/Kps3rfuEp7SkPBVF9fxryA0lbDMiSjsf7s9ijnSKmOlU9qxfR9+Gqn1h1YoiQ
	 2Ndx2HZ58bE/V8m/M5RBOgMce5aDq+bwZ7m4dW6bjg3UIq783vMTYdRtkgyWUk/3RorlN
	 alVGC8+smOAEERbFHVzOJIqVEeacqgqgv7ewlTaibxJrye13OAolV39u0Y0MeUvN2w07V
	 vfhJirOH7ecQxGgHb9MTipg4t2M/RcB5EluuONJGiYSRjGdn1BYFzz30/Wp/m3fgX2RGH
	 KQLHph2Cv8C/WGJ7nLoGcF3Je++Qyd04tioFo9yWs4cNWmO4UyQAZ35AXWBsjBhebpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+3XgXQV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQMPaCSB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E60F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E60F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+3XgXQV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQMPaCSB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9oP2919661
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YXFXOLWasRraLHbzcR0/nRTNi7YWsnW/5yBPnyszuM=; b=n+3XgXQV+vm2jsiF
	v6D+XyPVSHiAKzqc9QxGWRT/zaVbTIK0VXg74PTAtbKaXP4ynkFiNmuUbRez03+T
	fWFCUIrU8r9inImLvAgaf0TGqi6rfCamgjH8aFc0QJn69ZGXbOaDBnyX8CC7fxym
	Iy8lTkYHNpIlMh0YsK2eRH4hFrbl6gyLFKhBvMn/rUka6343/s6pxdFGbgOsqPYq
	Av8HQJhBYVUKLylq9yDTQV/sUJRjgs8kUi7LPEBbU7EORVXtWrO14rEUbhD1/+Sz
	QG1uh0IIhBOQTV4hX5qpX8rOFNFtdPX2tocdmAL2PCU+yzQRCWk/iCV5CEm1J2CP
	aEYTVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg24he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed121d5161so5456465ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292834; x=1794897634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YXFXOLWasRraLHbzcR0/nRTNi7YWsnW/5yBPnyszuM=;
        b=gQMPaCSBjENvqLaZ7fMaA65Ut4+0yyGMEx4A391iVBcd1CvrKmK8deQ1Ybu8XGbNQk
         lEvNRJ9ZImo4V0qNTV9OMxwlsI0ewTBUzH84NMskfDTuHAPw1KZjl1IUKy3T9KX/w1mt
         c5bpfslgAaC4VEMXSY+iQbQGMR/9EhGMIFZx9d5es/pmiIuNYIUDqY9aNyn0V850hP4g
         miHguzCV+cxR79ax9Oi8NfiPcaRjjxRLAs08Rez4JZoOBjF4qbNywuPE7aE3R9Wn/+gy
         470mD5BUY0L0tloWGA7NzG89kAiw/ghZi9NrLbTZCn44rYVgi3dufSTC7bLxzd7WhLSj
         LE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292834; x=1794897634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YXFXOLWasRraLHbzcR0/nRTNi7YWsnW/5yBPnyszuM=;
        b=pD7eI9Y7LCIvb7/sGn3vU/BAyipmXTJ9rJlELLpXdFYJ4YIoBa6p6v7f1zJfTOtbk2
         /7wYUaSG+kp0P3fVsE8DKtA9taP/CHJgqVtPRPivKYTyKuJzeUHxrm3s4j9I9FxcTpvW
         Msz1v1pC/sjBAVbFssZYUNFjvFGS7iuhGg9+ZallOiZfQWMmnm6nf6Hy4mx+Qory4n46
         WchPsvuj726zE2jvUkL3BscXzJEkwqrJnnnZDPvRFREdCoVA/Q44c6V/7OeINOWHnkdt
         W0sGmfjlX8IbhKeaPmL8CoTwN6wSszQFQmOMa4r9pbvZOtMhY3tRs8y2Us6WgS4DIx0+
         cEgA==
X-Forwarded-Encrypted: i=1; AL+hErGd2V0wiWCmoD1n7LsKuGQiDuUN38KGzZwgBqY6AKXD7j2Bvs6Km+Mt03Mp/s2oRwqMfVioSSJJ7Tv8D6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jOr/sbjBRrDDTdVNZuuh9jsERb7onNF1t1JXYwiX0MkYcMeLS
	ARJ3+40xZ0DlAxFpY4hV9cii3AqbKwsNLBfB0VnCuee4yZrklYItyrZGs2A6M+QdwMHfOoKk1fh
	6cjAPVd86VBf/Ky750rG2PgdKi/Ph5MeRIcoa/kQJDwX2T0gTgA/6O8kij5wOfr2QNug7fxaG8D
	Y=
X-Gm-Gg: AYBFou0VqRnGLUjXX8TvKd/HPiPnpLbRit4hBurbjt/duD0lOleUGkue+FdeETb8L/F
	vCKCwtzl5uCnW6Hx75rqHhqSyAS+F/Ja8qGbcV9/f5lML/bnksfisarWzm+i/1otxcn1F2V78H+
	Eu3UsYaRdmAOjV+oRGLk2JS56UZNokd2Qm1vQjGgsggsNlceSZjKdSurBf+8XtvrZYliaiDEduO
	2m+R/IAPFk9yz7qLPRXKjdFmFa7AmnXJMDkoIPxR5ZwGzUVfHfXpl+QRIWlnnIV/e6SvhT+o3Jv
	ux0F1ayNHjADT2WFP7CLNNP/1SvBApcFWls0+Lc0k8KBpGoFQaKFzvgzlgx7WF9Ne6wHnCN03FA
	6clHkKJh7P1EOD6xKvj1cD0qrXSD/RTU3BIvlM9BULF/n4BQG0I4Dd2pSR2BcxryflfkxPKglnJ
	aWTFN+x+DWtExkey1/GsQCHPXwq2dz0y2ZbHJulw==
X-Received: by 2002:a17:902:d484:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edb88420e2mr27024775ad.0.1794292834404;
        Mon, 09 Nov 2026 22:40:34 -0800 (PST)
X-Received: by 2002:a17:902:d484:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edb88420e2mr27024465ad.0.1794292833881;
        Mon, 09 Nov 2026 22:40:33 -0800 (PST)
Received: from [10.249.8.192] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d773sm5153645ad.20.2026.11.09.22.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:40:33 -0800 (PST)
Message-ID: <a367cb8c-f2d9-4188-9397-9a46039be14d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:29 +0800
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
Subject: Re: [PATCH] Bluetooth: btusb: Use DECLARE_FLEX_ARRAY() for memdump
 segment data
To: Hex Lindqvist <hex@freenixos.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Paul Menzel
 <pmenzel@molgen.mpg.de>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261108042008.226295-1-hex@freenixos.com>
 <b83e0172-2f64-4e28-9750-1a5fb3dd6b41@oss.qualcomm.com>
 <CABBYNZLJpDXTPmE_=rJ=J3oUMWRzybHhut4y1kPTEU8y2AKKiQ@mail.gmail.com>
 <CABBYNZJdeHXP1XjYcTwUdCe_SFfxMETpSQbF7t0FHyxY4YfZQQ@mail.gmail.com>
 <20261109225632.1227242-1-hex@freenixos.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20261109225632.1227242-1-hex@freenixos.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX7jRAo7+xL43X
 E005PUllWTM8M3AUUn9XEMm5Z6nvzyj0x1YGQnQZxeM9ijUxEhJiF7eGFQ8UNuY9PG+tr2baXGl
 xDCjUq0PjAYVbwWw/rcpyV13siwzfk1N/8npk5CEZrAv+e371FZkaAwWnivKnlDI4v/9wEBRW4V
 utfB/B637kPPHhw8xbvxS2+n3rmY0Nt5ITXBwGCDxLZLVVKb2GwdStzBmwnplyIR4fQkvRBngI2
 ryxflrSrKtdkyVZ/Nmeqi7Nt1yF27YM9RWQyd4M+b2KxbQvQuJsf42R+OckgbM8McHZQbPvEjm6
 0bvAI6Sl6XVh8n+Xpi9Oya8dGEpjMn6iWEHeRVqeHV1LCQOn7rqUD0IfSKRQpCbbLk/+cgOyTid
 ctAMqb/R7yxiwycyPv72XuUXSy8AyTJ3SD0tPKWwDJs4TXDvLovhKW3aQH12ouNMuBpvA3BQQCV
 LB3HiA3M9+9nuW9Mmvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzISONiTXnznl
 WLe+OMcJl4ubiVy1j4OPTVSPdc52n03uc1J4sEGyo0C7YA0F+mw7X7I8x5VwUSQpoq9tM0KaAr0
 vCcVISDqGZM+I6TRWqGCK7EVkYgP4f8=
X-Proofpoint-GUID: SnmCvHCwPD5z-V5bV-OR-TMosVg1vtBx
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bc63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=I5BWN5-QX7drI1OoIp4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SnmCvHCwPD5z-V5bV-OR-TMosVg1vtBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

On 11/10/2026 6:56 AM, Hex Lindqvist wrote:
> There is no build warning, with or without the union; the patch was
> only about the zero-length array being deprecated. __counted_by does
> not fit here: the struct has no count field, and the segment length
> comes from skb->len.
> 
>> Maybe not DECLARE_FLEX_ARRAY, but [0] is not recommended for vla see
>> the Link tag, in fact the first_segdata[] does follow it so this needs
>> to be fixed anyway.
> As Zijun says, segdata is only an offsetof() anchor, so it can go
> together with the union:
> 
> 	struct qhci_vse_memdump {
> 		__le16 seqno;
> 		u8     subsys;
> 		__le32 dump_size;
> 		u8     first_segdata[];
> 	} __packed;
> 
> 	#define QHCI_MEMDUMP_HDR_LEN	offsetof(struct qhci_vse_memdump, dump_size)
> 
> The header is pulled with QHCI_MEMDUMP_HDR_LEN, the first segment's
> dump_size with sizeof(md_vse->dump_size), and the kernel-doc gains a
> line saying that middle and last segments carry their payload right
> after @subsys. The generated code does not change.
> 
> Zijun, would that work for you? If so, I will send it as v2.

Hi Luiz, Hex,

Let me give a unified reply here.

I'd prefer to keep it as-is, since:

1) The union maps the memdump layout: for the first segment, a __le32
 dump_size (the total memdump size) follows @subsys, then the data;
 for other segments, the data follows @subsys directly. Hex's
 flattened v2 is wrong for all non-first segments.

2) The current definition builds clean with W=1 and passes
 checkpatch.pl --strict, while changing segdata[0] to segdata[]
 causes build warnings.

3) The struct is the simplest and most straightforward form; it is
 only used to parse memdump frames, so it doesn't have the problem
 DECLARE_FLEX_ARRAY() solves.

