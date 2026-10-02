Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF174477F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930462; cv=none; b=AgL79EeWqjuSti2qcouppmRGH7JEwdW2cJ4kYzuQK0mDTq3QoS9O2Z2L7yhjFNUsQA6u/P0FxdrFaOHYEFCj9uk2+dJvuMQyWaAJnx5SS1IYKuXdNfvYCpu+KPFv+ESNU0e0cQd8sfgEK7oFT033C6yL5aD1kiU8/fA5P4up8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930462; c=relaxed/simple;
	bh=g3WQYC9inDBpN52heydkhuKN+wu9j/uQyOu98dyVs18=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTxbp2chWdcPRgS2ekvWjJnPD9oJVR+kROK8Mxz5WRrbYrPSTZatupkzm/ueGZtntvbQNXULnqAz0mYH4d2xxCQTOeEOFBs0LeX8EwQCt+MOBIik0NV1R71PL2SeIgk/VNf7tai87mZZsnEG6bkX6JiNN8pM0kN3uykd30CWz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+XTzA3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/MisG4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+XTzA3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/MisG4Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jF6p3415718
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 08:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=; b=I+XTzA3+iRDxGOSA
	N9/9ZBRzW2HXfCTAgVwjZe24AnIhhUaKp0G3zfrQr2YFnpI7ViDv7Hi/7K+dZAEa
	qbQe6bmSKZn4Bns3FZ9pNcVJN1//Exrhqp+t/1dW86qQNbMc8tJcagKBjFRPJ6Ml
	yiWGxKiVSEVgdWizKlR+BLNaoKKSEFW4wRLsT17wMMlXlCKsAaXmhDKxyfg3fe7+
	8VPCDHi9Pkr3imA/unPMcsjZ+R26yh+te1hedKCneUMgWYvRzMYEQyjIqtsiOWb2
	Xx1onrV3oEtZv31ruToPiyZ1ZNcVocEtN9CdCbcclX3ZfHYMwAYVmKCFHQ9kv5LH
	vl3JVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxead3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:40:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so557658a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790930459; x=1791535259; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=;
        b=N/MisG4YZHAt0Wst7HdEyZT0Z4i8Y+wuDDlN02eVIIkbuhSbV4b1c7vCEyq3EgY3+/
         WpbLcLT8XRTJzJmmhYOR9++Xoi+7gRQk7TolhM9z6VMZ0Auh4WbgMzBs+XTspRl/BQtV
         FO97K0rMQO6ZjcLdY8t0zJMToeAsgWkXIDYF0G8kgIVhdTftTXNRDtqUYbflLassY0hq
         fCUrjod+F5IPBR+wkesXzxDyvsXEVPn2aSkNXSR/BiSfuSo5Ax7YCTI0kWJjuLAC6nlO
         XDFAAHG5EaONyf6WBglEXdG8bnW/WzqjHCRzTubkqDaciNjxn5VBesSy7IDKmwkHR1TF
         NUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930459; x=1791535259;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=;
        b=vjX/GN+Sr33x9uNsN5VASvnpK/gK+mLu0Igb3bVAwlWyvGGwJk+r/Ag3A/p5HlxugA
         y+Haqg/Na+JaPL9bsb2EVCKzTUQxJxCXv6iMWj9kIxWZDsCQynQjQ0kAlQSwH8lT6IyJ
         3HptEZkldFk5dN10Lo1W+2XAhcbOFol07cW5saWICzN8QsWF+9aJ+2jVEz/s8OgvKl1W
         R1JDy9xFFz8hNPa+f3fwjI75WW5jqYImMGLjc52q9S4jgcMc70kXKgCTtJq9ezjXZcAO
         b/KS5v40mihGphA7iL2Wjibh+ikIhV8b3Pq2qGyM+NhaqUtqRfDrd9zZJROoTEkjdNR9
         eUnA==
X-Forwarded-Encrypted: i=1; AKwUvBzSGXsz36WDTM33wKIPoHEjlX/WVD2vSCewzvFDvFMBCBojAFKeFPgo/GyR3QjtnzDyrbfGV9BOvti3CGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQJw7uEDZkbf3NclOTojcXNhY2Yn1K4czJ5OHGIhgIXVbB7Tq4
	BsZA0nCvYt58fSqbCD4LHFN9liKoCAeA4GNdxu9/xUwxfJuzvfJhdgLf4E+Hl2nko+WgAN+OMpk
	risVGci90DjCOKa82xri/Fv/MwhlK7E60hXMYc4KS7kCer/qH1zZNXkB3Q+0vR444Iew=
X-Gm-Gg: AYBFou2VBUdhOqSSWowB2TKqKuCT9Kd+aULtKN2twBZEgQhlxAuwtmI3iLaLzfnZgw/
	EtPkc7n34XqhZ7YRdTiDhfyAKIj/cv7/wJPZP1ZUqKa9ehdF+EbPke/a1LzwjWc3CNn6ngVe0Cs
	R1GvwkKpgsOmrkILO6vho1dpOCzPwTFFjhxXDNeC+vu65pbk/SSVfWQMdT3yaL++D7rDBtNmgTV
	uNXalX1U9SeA2jY5u8Oq1V1WK0gSrikf4IHREGbu8SZUVkPVo7j1z47xbAFkmeHHQxc7hiAeXWJ
	GqHq54ohlFudn/DJHBk7SPe5fpCHrcjX19JzRKQAQzFLo72VirXRfuT4GNUVjhbbOke2kBUpc5F
	Ugcvv+p1gAywh
X-Received: by 2002:a17:90a:d64b:b0:3a4:6f87:c0cf with SMTP id 98e67ed59e1d1-3a6ce84bc31mr1544719a91.53.1790930458845;
        Fri, 02 Oct 2026 01:40:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d64b:b0:3a4:6f87:c0cf with SMTP id 98e67ed59e1d1-3a6ce84bc31mr1544697a91.53.1790930458256;
        Fri, 02 Oct 2026 01:40:58 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm3397134a91.10.2026.10.02.01.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:40:56 -0700 (PDT)
Date: Fri, 02 Oct 2026 04:40:53 -0400
Message-ID: <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
 <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf6e1b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=9U0Ts4Z4qhTHMBCqQIgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-GUID: 1Vi3t3mZ84eu7HTc5oMd9akxSdLUt1FB
X-Proofpoint-ORIG-GUID: 1Vi3t3mZ84eu7HTc5oMd9akxSdLUt1FB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX/10Gel4CWoq1
 owVu1dnK9kcQZnC1F8ji1U52fN+PzK7so070Nwu6GTOPaGjpBGjvKQTlCb77ynQ1TQcx3ePzkhH
 bQtpixse4Ieiwvc2h9OrDr9DxLbs2/LGTkzEQQNYhQm0/DROXc19GmBC7vQlBKlDNTTKcUsUUH3
 1gaOfE6N5+AopjzC8dlAkqXJ6TxhMik3zQ/Eobo5P9wF/Z9jQag48WS9+13RTwjxoTz76kGYtBO
 4CpBXh83Iztv8r3jCO6DBF7bkHqomlrGXZBqRrGThlV2ZChRLkzFgz1yROSFBKrnK6JbDK0F7/B
 xiQpLFTQcjQt6AXv1MOeEJsABGnUE6+giUD5LM0H9r/8kKUFNxaqsWCPxtQPCGD3KD1F1tDVjfl
 wXrSM5xqv4859675/Fam7e5F/zX1KYtSt4slesDWCrQCFI6mO4PYfGRFTMw1BtuIEW6wUAFQZ3R
 BJhfKQtp4KYEdb7im6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX0pli/JhG3PlX
 wZVAAJxCg7ov3QXIVOm/ydS77M7s08toRIDpI+Iv79OMsxwNMU1rRbudyhRwDRN8kDMQVydmlnk
 X012yl2zOzUbQhjcS7tR0jJbFzbYAzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020034

Hi Radim,

On Tue, 29 Sep 2026 16:00:22 +0000, Radim Krcmar wrote:
> 2026-09-20T03:18:31-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
>> [ ... ]
>> +	int cpu;
>> +
>> +	for_each_cpu(cpu, cpus) {
>> +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
>> +			return false;
>
> I think that extensions like F or V might be present in the ISA, yet
> actually disabled in user-mode and this loop would misreport that
> RVA23U64 is present.

Only V has a way to be disabled by user-mode, through
prctl(PR_RISCV_V_SET_CONTROL) with PR_RISCV_V_VSTATE_CTRL_OFF. That
interface is questionable, and obsoleting it was discussed on the
RISE Platform WG call on 16 Sep. And I plan to take this to LPC26
next week in Prague to see what the community says.

Besides, since you mentioned hwprobe_isa_ext0() below: actually, today's
per hart hwprobe_isa_ext0() doesn't honor that prctl(V OFF), IMA_V stays
set. Refer to [1].

There is no way for a user-mode application to disable F/D.

> Is there a reason to diverge from how hwprobe_isa_ext0() does the
> extension detection?  (has_fpu() and other global checks)

Anyway, back to the RVA23U64 isa_base bit. In this design, I mean to
report the per-hart RVA23U64 base, which is derived from hart_isa[cpu].isa.
That bitmap has passed the validate callbacks in riscv_resolve_isa(), so
it "matches kernel configuration as well as correct extension
dependencies".

There can be a mismatch on a system with heterogeneous harts, where
has_fpu() is false globally but this particular hart has F/D. On such
a system Zfa and Zcd are still reported for that hart today, which is
the same mismatch. Same reason, because Zfa/Zcd passed validate callbacks
per hart.

So the isa_base bit RVA23U64 behaves like the per-hart keys do today,
while IMA_FD, IMA_C and IMA_V at the top of hwprobe_isa_ext0() are
host-wide. My take is that when user space queries over all CPUs, it
gets the intersection, where RVA23U64 is not reported in such a
heterogeneous situation. Per hart, I want to keep the kernel config + ISA
string truth.

[1] https://lore.kernel.org/linux-riscv/20260725001614.2578617-1-tchiu@tenstorrent.com/

Guodong
