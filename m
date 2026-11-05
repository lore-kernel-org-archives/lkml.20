Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880302;
	b=xPPMzw/XsLXqKyxa7qZgd3dfeSJyN1fWxMr4TTwrxZIOYnTJTCKJVRlMCIFLXZIlnMM8
	 V2+8E5SJnIqZym/kGYutqp+cXtB5JcpZI+G0NiTLLrAA0Kavapjb3LzkilNxmXcGKyjhy
	 L7e1jlliwulumPRs1iVNQXjFZKeVdLHpzp5q24qAVD3+GOl9Zhk2dpRYTf5R+c0rbeNT/
	 kj47kfS1w4O8gVWIpHXgzhgP7MeNekRiXEx9F8fFf+SkbzPbxD9TqI5fWE8I+3GKeHqAW
	 +CqcQTg9cYCHJ4wzJGqSjAsjWoqARtTu3dGA6RMSaIhogww2BkUKjEXZr7IbctUFJ0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
	b=WsyLPUCn3lzk8XT3OqYLfS8tf6cBiBxluvdyVlIOw4FuLV0HbQa5gDau4vhUgHDSoc2b
	 zsoQ4Ap99WUFlydVYjL8d7ODDAf2qITIXwDJXBG2IXRwrA3viyxxLDp6+q3XdyjlMxa1H
	 5/WKkagwwgKbVwigwKsjicWyZefKpDcrsVdK2Ljymnz84tK9WM9/+AViysjzoA4ILxGrc
	 dJumSSomQSs7cVG0TIi9EXMAejno5zMVvFBZrsSlX90ZYrGKdRpmkG+NVVyN+9f6k8AZx
	 GkIXAuj4WeRdi4JiAxjA/4jpn3Q/jVKEzWHQt0f8ch1y9dN5r75KiCJQGbwTxxhAnEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E834606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E834606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJ8I082990
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=; b=E4jv8heEUFra4Irx
	2LpEY24X//cT4epKu4S0xpuQ2kL7vX7QChcNDd4SpgbJqeNdKyWI70uhpcK45GgG
	7r1F2PjO0bCo3sGRvM2Ut8K6CWSyOknJGwbtZC407BmD6L7i7MnrYy6NZmLat0WD
	QRTvUQdd9Gapuv5R+XW9TnUduCh21r3t27gSSIU4wVkRE1axYYJyLPeuGMScyIBI
	5QYoR9oIKL8OT8Rmto3DfNH2mBe8t28zgYst0BfQuD0ZbCcOUtKESMh2qRHcTeXQ
	civAjC1WRh2sDqqDhLd3dPi9vwXJlWYsSiJCLocxz3O0p/KlAtGjgAAeHTXMsxjQ
	gGO+3A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0p5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:05:00 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8468290b866so2510554a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880300; cv=none;
        d=google.com; s=arc-20260327;
        b=jL1oh/FZEHgpUwK5cqhAdl7n6iN8sgCy0kRqGO8rKBAlABaF90yD3fvBRiB/SLSvj3
         fUxQIsN/KR1jqnMXEvTHTb0HYbwzdh2XXj+T6cUsxEpgTLYuqE4vM9PDX7xuI/497BDh
         5CWUoQDOiLCNbQANVMEBhTjmc2ln8o5P6kQqi/h+NIpMQMb+fwe3q8dMbBXPticxsBxl
         klzw53bD1dB6M57qazanDaWJwKRRpcciBoPTfGghuoLM+TghNpLjTZorTw3UcXZ1RAo7
         RExCt1482IYnjt1J9v39X+zgDOZNEF3Yg5Dyvh+Ell52OndODHYNLgt6ElmuSsFj0AcX
         OXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        fh=YhteisH0rmP2yrl+LyQrUEN+kSbQJDXAmmGKmhUMB+0=;
        b=expCj2P7ETG0votD4nfPOjD8IDiqmwAV7gjgqiEQQH5fr69BfWeC0O2V4nPDj9uxL1
         mxzSE4cs2o7T59fJ2ZVHHvBR6u8O0t6SPjTtazKyf02AIdOa8b3qdZcbWUfWSxVjbkzo
         D1edDTBwJ3Y7I06rwWPvZXV3jjs9Fot9WkJM9N1bpwJXzSzm0VPV+FunEFOi85703n2S
         ndcLDXSHSOevEBeqPx1wrPzVj/2UyDKWK3kDX1DO8XIJZyhADPHfWMHP9SvDPCagiumY
         9xLSfdZXnzKNNdwOdY+sTetDy6NPrDIwpygfcUNzD57YALOdcjF3NFoJJdSmvQMW0+ir
         J5fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880300; x=1794485100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=KqeK6u4b9wES1D9XLtYAwi1N7O1h1xQ8YegbJvwQ956ZQlvjfeUOtxAclXTs5RzNRl
         /hv8h2wqXL4bj/PX9Hupo11wrGhR3xIQZu8E6br/TYREXTH+k3ooaAeWRfMdRexcUQC5
         2A5zjP5QF2QtX+oQpDBJD7WLE2x4zGHXodmkPOTuOR99JbhPKD9NrRshremKiJKukDee
         flQmdIczu7mCQwlcyUK89ruBAp+VulEK82a9oNG2j2Kt62IbIxELcHvd4vU/n28qRy80
         BLx5jJoX6jFIxr3rtJXV4Q8EQaXqlfr8iGpuFl84CVmD8Xuu8RjJN0wUrTSoD1iWLARU
         40pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880300; x=1794485100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=kyrghryxgazu9u3GCVmoMLgk/dkq1AyZOUNt082P03Eyt1UGoUe7nkA3Q/eo6a76ZM
         kSeX9fJY7Hr83HJxqm40UKl05tJyK2+9s8OwVbs+4Y0GuI3Aws2o7qT+wSrfrjey/fqD
         HGv5AndU0A/yPQ3G9CUiBCIiWbv9TosIUljyacJ19nDTqRCA6lugH1B3zXoyf4NQy14P
         kAdyQ0Chrh8p4otnhndl8KragObCX0l57CXOYVKuZkBybI/G50vvei+4CWmA89u+35OZ
         3k6tnUJl45t3v8SUtvfNK+f/hdM5I441KE5f6RWWyyMJXAtCJG/WL6kNFbZHxst2lf1h
         kltw==
X-Forwarded-Encrypted: i=1; AKwUvBym8AxVNxcQV5cbwEWlNWWNdACZva+0NIB9gcq4bR9ElzT1kgx/8Oh9WhurMdl/QNMX0kMQtSjlP0WOheo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q0v5hBZyOq3Jmeq/XyxX0PKdw57P0gvwHNXGbhULF0EVSCY3m
	f9HUwEbV7xntDY39vX1X2apNWp4NqT4bHhZG7sF/QEEMKmM4ujSzi+xCWBlt8belUAaNa5ET1oc
	JB5yhlUSTDaa9/EaRWv+WWR7z4ycTl1PGzv4Qq7I9hUS1iH34kk//vBgVtXQbkbpxw3e10/Ci6j
	TfpQI9MMx19P1MMlE+ebXlxc7gOrYjK6Df9cFAusR/Pw==
X-Gm-Gg: AYBFou2PSPWa9SOPhrL7Dbjc4rzt1jmwYGOH73+3DAVIqZ7ooJxKV9RrC/mMgGnYlsW
	TC3sM5XS7mzw5UQJN0z2cumaggEKGZ1OKsZwLSDhXN3WGTapkqcEFzeUAlUYySpJbT7UTqwa+BN
	FvfjSPuWVlNoconn8sibwWASjpOp90f3haGXnVu1RnVlv14x9qx1pf0Y1mYQmbIdNXcRKmh5idQ
	tiyBAp1Xzy0hP9CEer5FWrE6uehZuUlPj+zrl2t9koK8nAxXfHG9b+ge6NP3DrnBVt289twoKE=
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id 5614622812f47-5640e09d416mr12461365b6e.65.1793880300256;
        Thu, 05 Nov 2026 04:05:00 -0800 (PST)
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id
 5614622812f47-5640e09d416mr12461323b6e.65.1793880299813; Thu, 05 Nov 2026
 04:04:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:04:47 +0100
X-Gm-Features: AclHuK9rhmN1T5uyjSFVpg_P5DvGeB0710y7iKzLARDbFg21rI25jjD--irSqx8
Message-ID: <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec70ec cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=gMKTrDL_i4-E7wsZRbUA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXxp9jJjAlEvAe
 1SgXRauRZPullWdCVOZEbzu8ylRon83Llflpzgv8PNlhw2s+0Xh/u9AxML2QlZPAXijopQcuw5I
 LGC7g1nF3UKzoolAoqQaYuVeguhGOmGAkQSPIa+ptj4MGrp1iBypkH9A4J5VBceAOLaTE+4hY9r
 MRKcJjrXsfkRkxqczYsbPQvWWkMcRzELPeVwFBfUQpK9sb79c3Y8p1mo10MS3FsnH0V4tIo7Rhy
 Bb/S0bqnzZmQTrawYodeopAqKVPnW5a3fmr5yVF/wI3ZjcvYGT4lxgBQN8HD4vCeASk7yIiVS6i
 Z0pdtjl2LyN/iogICojSqbscMJexc7UgdOH8sQdbLhtIhgxwhVquaH+PNZ8piPgSw4vrzB3Gk61
 8FJ4X3OGx9GYkSJiBC2L/pcOmmRXKbfXjLHqtt5lWv4liR2LfNE1iiugkiKiJFeZvOkq8RN3ASM
 tMt+qG1QTyt4JE0h5GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX9rWNR//OeR1P
 xeZZTczr/peJMtcOoqrqe7bdJD8jw9DSi6XTx+/FR01DiqJwPka+EJlcBqUVRpZOzHgkLjCuEHI
 ZrJyYsbT7MZHhMhsmizfIKvLTAJpT8s=
X-Proofpoint-ORIG-GUID: 7Z5UJDb-d5o20CXW7tWQJOkIAYSWw017
X-Proofpoint-GUID: 7Z5UJDb-d5o20CXW7tWQJOkIAYSWw017
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050048

On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:53, Loic Poulain wrote:
> > So some chipsets share the same IP blocks, with some block/phy
> > instances disabled. As a result, we need to decide whether we're
> > numbering based on active instances or on the actual hardware instance
> > index/offset. If we use active-instance numbering, then yes, it should
> > be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> > port numbering is intended to reflect the hardware instance offset,
> > matching the register prop, then @4 would be more appropriate. It also
> > has the advantage of directly identifying the underlying hardware
> > instance, without requiring any additional driver-side mapping. In any
> > case, @3 is incorrect.
> >
> > That said, since the bindings have already been merged in its current
> > form, we'll need to preserve backward compatibility when addressing
> > this.
>
> This is the input port to camss, so how is it called in camss, not the
> csi phy?

The CSIPHYs are connected to the CAMSS input ports, which can then be
multiplexed and routed to different CSIDs. The mux identifies its PHY
inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
connected.

Regards,
Loic
