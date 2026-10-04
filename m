Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FB39A06F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127600; cv=none; b=QDTxMeC2kNZDyuDYLO/EDj8sYUWhlvRby5HsNr2Si5RSPEewzD4NDM0Z3aHd7rWivWEbF5Srtgsibb8VVH3HNaGofxwmhJ4KI5rHSke+l7I99n3nG1RFn/aml504Z1gV/eFAY3KyD5pMHk1HYk1yWBi4UdWDOZ3VLc19M3uNh4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127600; c=relaxed/simple;
	bh=2ch5mNrtmdxQSOSuWG7L73peId4LUbCNr87Fa7anJjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOIVv7edQNEgV440TlRQTZrv+x7OEc1St+uAuqd2WAiFgs1ByTQX5WJTpGl1u3Pk/CaBU3i+0X7Sx5S5DuYZ3unkPW/QmXsyLilZbKNdt3uDbfXuIaxhs0VQyoyE9pa4RXSFwys3NhxQGMH7LpQJUNBBhozFQ1kTRhfcevkDjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9J14xJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEw3Qlq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9J14xJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEw3Qlq0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694EeH8Y3725850
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 15:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=At3ebrOXbtof0F5P/wwaDdSx
	0o6qxJSpe5weBws8clA=; b=n9J14xJJN1lWY7nq48Qr6iqgFLhmCX0YPV32RQii
	eWSplHy/WAEVZLxezJ5V5sIob28dYHxEyb9EHDSzB/fmXetCV6wRc68ROQkqDVo1
	md6g7n8mvu+/GyfN2iz52C0o7IiuWYCXWJJEoAbLRyhHZlj1qyXFr+KxTsvoPOM6
	Nei2sgYnKkVolyOapJKnya6W9uLEus9iCq6rfTHh4iAXXKwvXC2Zj37cNHALWh48
	eYMnOwtCPSPxRfdhngAdaNyKSfs4A0I4Qtd3kBvNfUlXH1fXnKbej2+aQGpo5YRH
	kI/lS0e+AhsZTgX52U3jhOsNdk/XAxhXJMenL8nM1lnanw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa39j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:26:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef5fd7934so3018897eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791127597; x=1791732397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=dEw3Qlq0CQ26qdBAdLnCKo/E9X9JSzrt3DMfMJAeUu0n6+OPYR73L2jtlAVQWLbqka
         dUPO9UJMkLSqhpnLkscoJWWDZ/i82h8QHdfIi5aINaCaIztMTf8i2ZO9+wzv3wZN1hlA
         D2n8Edsi89vrqhPwc/B5O7XK2SwSsqK1F+ZauIOyoUQaCbTgqjixdoBJ8YOvLQgYEeaH
         v0eixO2dDdzMTBkeQP0Q5k8MCXcY5DNE4cL2cb74ypsT6UXDRXO6kJ5wVY9WJhXRIzEi
         P0Hq2dz/D5dqk39F2d3hQZz0XFFhdJkleBFTA8vBGqKw0gtjgYMdAt7Zb6N0WaMBQ87e
         0cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127597; x=1791732397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=Jkin6ktLSp5ELHX5S1tBDKzlq3y8x6fCagyXOwG9DwtIdymT9Qz/5KA9RwQm3w48M6
         GgRODsL8vsdydVF+YrEQjUD/+H6b2pOX8B4KesZxpqmwPyE5GsNL29pR74BJDCE3iZX0
         HimDclYiHBk0wD/KfxwoSlwbaowawHR/B7m1PlyD7exDLrUSrZBt0/YsH0+ikaCx+mw4
         TWXu4QLpsUHnkP/a9qYjfU0VzEJXRXgN9rGW4VECHPLICxFrLCfS8bf7b1NGHLWVSk6U
         7q4TurAoSuaSYkdz5eybjlWAPZsRPELEKCkXfc6+EpZyL5KCpYz8Y66dVxCctYG2ihtq
         vMFA==
X-Forwarded-Encrypted: i=1; AKwUvBw2YzWaf3NSfrjgc0nUx/eSqMti4L+nhiJNBMYUxQYIDx10l4Kg3RKLFvzMEeaZaNM8vf6Otu38c4jS+lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdMNBcsNTDhizRS5wnqKqGsKTeJeyLe/BFPAIHkKzYihKlwJif
	WMwaMcgjn0YWBZUfbUCwcRKLBbI/ueVZALeNvda2boYC2tzypWmRKuhRWw77o+q5+O9RQ/OP1M+
	tdkx2xbqYbMlpeiXoU8CnFf96ItLEu5SIs0oTfbE5uaXLSEgcjdVmcOnYsjcgixeFMfTGSMdPnX
	o=
X-Gm-Gg: AYBFou3bAe/oKfzlr8w5NM8DGrDZRnMoehPzt4SPb3AZFMjrDm8sy813Eg29rYuA6g/
	v7MTZnwY/KP+0X5vMwnkxkmi113P74gC5F2UB8/dpniiOBp+Ud8bOx7xUgqzPI2ZIfa0E3JZo2P
	xiIP+AV2g+ApWNO529pg3OaxR/QDjy0nm5JV4sqo3mJ7act+3f5I5gl773cuyWpokVqXV5c85yA
	fGbr0hyLn2/Oh9mCukGv2HmQvjBo99ByGcO5zvlGwuR020Ih9Q2ZoTFNawM4+V7ETCVewtYjf7w
	QF95HmHnLUUtsnd/9vT7UAyxGEixcktW7oQ4vqKUBvMWO0nAv7zylPYStlzkJBGiSpLptfV16aA
	IZJwxxUlY6sUU16efLhF/l1TPqcIfrEj79zFz3vuj9A==
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8368021eec.12.1791127597008;
        Sun, 04 Oct 2026 08:26:37 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8367993eec.12.1791127596447;
        Sun, 04 Oct 2026 08:26:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713c9a6sm5600553eec.5.2026.10.04.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:26:35 -0700 (PDT)
Date: Sun, 4 Oct 2026 23:26:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
Message-ID: <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
 <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfX2xOb80kw0Zie
 2JQdr64eIaBStS5fMT13rgTSnLMRnORUQ66s8iOaQDPp6Xxd0fBM4BUICyx7Ca4JAwDD35u4p0x
 2xIO6j7MQ3ZKatBaSPQv/1lv0xFDXjXYWvhv0gw38l8JTS3NOo/z+Hj/txCgmThDLKfWSkRrMky
 3T3v7gSvzWc7u5nWz/Td30tYZ3GJB0QBq9g3tdgNcOWxSlZZE3UxGE31pZuTVyR5pLvTnFQsGXD
 KKFihAAMqcivEMfBiFakzr40RynOqNMuU3W0hIeiPeXqe0YXHlSe4IJIANzS1uHOQeddoY9rSLo
 DoTsyaYjCbLBafyhocNTUOOVng/HRO48feLXzf0J8zKLkJ/AUZiW5lhRyLVqGr6iGRvTybcLN/W
 anU7lB6vbpQch05SzCi5FcNSraW0tY77taYtyWxf18ufELTAkWF1B7afIav8auYsd4SAyMQ6URV
 f1XGOVwB9Rdm5UfKK3Q==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac2702e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NTnRRJcS9uFvT1zYgXQA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZqseUdQc9MtN2MdWuYJvp3Qkrst81xfU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfXwrAXt7PzWEJj
 8DxR/B+p1qFvryEgGqB7w4Rw/UBgCAWQllsjXdoz7sSxcZxzhQR3EQXlp5gmhiHbN+rp94KuOh8
 y9vsEGsD7LE/vb6AlACccgRXX87Zkvk=
X-Proofpoint-GUID: ZqseUdQc9MtN2MdWuYJvp3Qkrst81xfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040061

On Thu, Oct 01, 2026 at 10:42:39AM +0200, Konrad Dybcio wrote:
> On 9/30/26 4:07 AM, Shawn Guo wrote:
> > Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> > ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> > Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> > Nord ADSP for that purpose.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> What happens if this patch is absent?

ADSP never comes up:

  remoteproc remoteproc0: attaching to adsp
  remoteproc remoteproc0: can't attach to rproc adsp: -19

Since XBL no longer boots ADSP, the remote never publishes its SMP2P
inbound item. The smp2p entry stays unmapped, and irq_get_irqchip_state()
on fatal_irq returns -ENODEV. qcom_pas_attach() treats that as a hard
error rather than falling back to a firmware boot.

Even the existing fallback (ready bit clear -> RPROC_OFFLINE) doesn't
work: rproc_boot() takes the attach branch, sees the error and returns
without loading firmware.

> 
> When the early_boot path was first introduced I was really hoping
> that this behavior could be made unconditional and Linux would
> figure out if the rproc may be active by virtue of it sending
> back signals or not, unfortunately that hasn't made it into the
> tree..

The difficulty is with the positive signal. As Stephan pointed out [1],
the ready bit is not cleared when the remote is stopped or force-shutdown,
so a stop followed by rmmod/modprobe of qcom_q6v5_pas makes the driver
attach to a remote that is not running. Without ping-pong or a PAS query
for the remote state, I don't think we can reliably say that a remote
*is* running.

The negative signal is reliable though. The -ENODEV from
irq_get_irqchip_state() means the remote has never populated its SMP2P
entry since cold boot, so it cannot be running. We can fall back to a
firmware boot in that case. early_boot then becomes a hint that the
bootloader *may* have started the remote, which matches Nord ADSP:
it is started by XBL on the Auto variant and by Linux remoteproc on
the IoT variant.

I'll drop this patch and send two patches instead:

- remoteproc: core: continue to the firmware boot path when .attach()
  leaves the rproc in RPROC_OFFLINE
- remoteproc: qcom: pas: treat -ENODEV from the SMP2P state read as
  "not running" and fall back to start

With those, Nord ADSP keeps early_boot and I've tested it with both XBL
variants. With the old XBL it attaches as before; with the new one
it falls back to loading firmware.

Shawn

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
