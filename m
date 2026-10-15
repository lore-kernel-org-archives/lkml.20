Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BE51C35A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066455; cv=none; b=cHmmPMyMKRTyaaJ/qHNf4IWZ9skZh8p/dZrKPnS+V8tlVWymhoqS+ZoEY8+RzuaQQwMbMmp+jdr4ZlzKWgKOcVZpfzi28aJOHifAN/IPCZ5d4S9arXMv933qdCq06qOU5bJxMy5ncgOXOSZ4uloD+cGvghPkFDas7pJ6d0USuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066455; c=relaxed/simple;
	bh=HMD/MqislT+ok015FjFOa4vw40MW8NG2ykoeJZWTAjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMjAibWho8dr2f+lJL9I47u8h2DdJf86t8GkUtJwYh33ifFn4m60Yk36tm0pxHkzoYWxdQSjuM8UND5+MQ8f7KNo+lADtHEonUG4ETVyeojm4QKM1cZGvYUBbdtTUpE4IIahSfv4O6TAmluAJbG6ICRU3+/arFcJEkQr4LwWYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/1PJQJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRUNu5l+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/1PJQJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRUNu5l+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOIn2114143
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=; b=R/1PJQJVIj5pxKc2
	9ReaE1zVz0yl13E4DPBOQjRdtmxFfS6Nm2d7i65Au35ba6qCBoMPyvcOiGC80SdP
	CjkO0zKgQDdI48NGL1JtymOvqxaW+/5yf99LruTdh+P1UX8Zdl+Ch2K7A/B/STrJ
	BBIJ20KsdqDCn54sJDoFKvPlv75k5tLgrR1JlNwmJO1cCL9c0TYZAvaDhBp0um5n
	Ah6A1Mj39TMqKrDQvcn5f//MSpuVMaBUhXGJ5qLbVDosbRNF9K4UdNNshanx+EaA
	Zk6SNgYXqNKZzYdrp7ZjwfpTEJ9FruoOjTedaqwLJ2MUIbrP5VaV0/nBxLARGFPE
	WnqLxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyay4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:14:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so83652585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066452; x=1792671252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=bRUNu5l+rvR5aRQ3iko9IS26oK94n4opSENCbxOFI9jknUrZnbuZ3oUDPfHIh3gFxa
         vukOl5v+ZS1X4zPH6anYX/xh8mA0KQIKzE87+w+diiscvD/4acqn3Ixlj2hmkf5xmymv
         T70pFSeTQmD4XmZbT3E7J+2Ep/BWSkMvQv5DdOjD9YEWRZf/MiwjsF4agwmpN0vrNoZo
         TUxqy+BrtPK6+3dJ1mRpPEcjjv4GQiIh+skzkCRC4UimLfNTypIp2I0bjU/AXdo+gy+I
         1bScBsFi1vEh094YJo9odoUmxb3E30L1BCsjRXlWjXEq0c+l7PaJpYw8VxJ+hB8931QL
         kiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066452; x=1792671252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=aEjbK8xK/fIosDFREwLxVUu33W7MZ4UvWECLOAtV9XNVzM2ArUNnF1C+m/cVAMEFAd
         YhDn1j0ZUSyDnRYnbqK7PSXSSG5+XlEge27nU0q0GSgous4PDTo/bmKs+uFNZMH5xp6+
         +97LWjI93PWLtrDNW90C8X7/Wxvpux9OcM58eFj8L35b9GVlwVM64RucGJ/NI/czy1Tg
         plEB85X+BCvPliClTA5uW+55vCTHazzwDU+Cq/8nzstrQ7XFivFohufxbUM8NMldbiJz
         VD5/dQjgNQ0ZVxTzkHmcpjTK3QWC1f3p5FmnOinpX3CQ7Xlnj0hp90mHZ+zfHuPMPIWJ
         RHBA==
X-Forwarded-Encrypted: i=1; AKwUvBwXsr1T8sKv7/qcJs+wr7aK/2XC7QbHOgK8zdCr7R3j/ssuLti+YSLeQtiaSmlGjAStKKIHR40V5Dl29U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8voyTZw8HJerlTp8GaR7t/0hj35Q5cCf1ZfDoJx96L4VX78Xi
	R6hkmfZPVmvBcqyMtQ51cy96kDdvdX32vas++jTDa7/gM8kgrHf/ElWSPApP4TRIh6W+lW5xj/4
	HJehckVdg3JfGX997uuIdT39akfZhJs+/4EL87h+/QKm845sUeWC3L5uVjPyz7JkTKNE=
X-Gm-Gg: AYBFou2T7FC2cXo8dgxuBuf5upjbVOobjfT5j+TDXj54qY2yFGPgU1Fs6h1/0ISy6/o
	hxRWcp9YZ36vHQFBYKufEsj0H+/ccZWuC8SV3gkDktrEHmiarzJ9FuyxWrph4ZZCEJFPCqX/V0Z
	fbY6ivBlHPRYo7mv/uM2wvyA/48T11uY4jgbDlpCrOKBtvSvKCDRydskClav33k9hFL0OnAMjfS
	++OreyRwgZrFZPRsQuVZhhUG3FR/o/u6nwrb/8tiA317C965oSxdcQu09Mu3Fua+vVUhyXjsMp6
	4DyAX8jmUiHQY3Sjpa3igKG9IChhRpjGres8Vp+vTjbEVgzhGNQoL9vtR2o6Zw943+irrqkurID
	6FQZRyYyp6c96TnXdbFyZPQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499464485a.5.1792066452489;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499460885a.5.1792066452035;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm116373366b.52.2026.10.15.05.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:14:10 -0700 (PDT)
Message-ID: <95de4517-d8c5-468c-8df8-649827dfc130@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lYhn5Olchj8UmjVCDbMk_mKHHjBhE0Wu
X-Proofpoint-ORIG-GUID: lYhn5Olchj8UmjVCDbMk_mKHHjBhE0Wu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXx4+CjmTl4fkT
 WH7w+bb2AJYJFBCWyUeY98g1d0opT+lO4NSghklmS96zPpHWgMqpmRvv4B3XtqqsAgvdWQcJi5U
 moprLae055vNIMwETiyQwWIfNyONqXA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c395 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YqG07dkmy_oNa1g3t2oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXwUuwFgRoyExx
 Hcb87dhhymjlBbeZRX7JwTPVUFW97Pgjq6XrvCeN+de44qbwg1CgaEuEh7rrfdQmVvwU4MUsHJ8
 bBlcUdhbIuHZT2vdGYScTYaTTziIF6U7/SPIwNs9eNdj4K3c6Tebe07IYiGROEZTZ42d0luOSw6
 E+t5kc4TR2Qez0m2a0Hu3zqVfvWRLmFUuB7od5H2PNYDWwdOC4qzZIqvmS2HDBpcgoVhziRAWii
 7txXPfSO55fh7ZLXBsYtQPOoN9nU/tDazxNpRqUNM+5jJBNjfFqeWIx5930NnWgIl6KSeIY5CXv
 hCkGXJDXNfmTa3EXuDa7hykptxQhxeNGyrMrQiemGTrn8DHcZLjaGkYdGqVpohClnTD4WHHupzM
 CBNRs+Znk9mwhyO2X8EC/Tf2syawBJAwcLj9ZNWYQmzQO7V0YPXCMH+vd6rPukAvYSg+Uy+bUeC
 /QREmmEgJAw1l6slgsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 9/10/26 6:36 AM, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> Use the TMM fuel-gauge profile values from the downstream kernel
> (`somc,initial-capacity-uah` and `qcom,max-voltage-uv` on the 4250 mV
> bins). Akari also shipped a BYD cell (3056000 uAh); a single
> simple-battery node cannot express both, so prefer TMM as on the other
> TAMA devices.
> 
> Voltage limits match the fresh 4250 mV profiles: 3.4 V drained and
> 4.245 V fully charged. Aging bins raise max voltage / CC-CV up to
> 4.380 V / 4370 mV and are not modelled here.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
