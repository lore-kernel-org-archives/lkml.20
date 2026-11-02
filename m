Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629216;
	b=skanEEdIP/J2MIU505gV+yehY+tY6dd4QYsltRmG1w+cMDW7JMiUhJ1MpiJqxIV2atdV
	 owVxMLwR7cvwNSsldmxa4tmoCcpMPnb+IRXX/x/zHnuU/m61M2x+i/cp6cXrsLQg0rx8o
	 07WHcodeQiKlfBRcYFEirasWr1+9A2IF5Ht261kSFfxbm49F9bL2dlfuk62pyIIhzPV+d
	 jpRNRKmhBMRZAYqem88i9gIYXasUQSBZCfb2Y8ymPXhV/d/u89q0/wCkRY2MRqTbBt2uq
	 it5RA+27brjDsDgAJwfGDeMeiQsM/DTCEX4LEoJigBrZKmEgwGwxYv45Jo9ShnUUOEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
	b=YcAkaqbQrjLiJlbc7z0y/i3xq7Ukx3GZrHfEX12IeYwAwIFi1YX/e7Gsg2sp8+uZQyu2
	 3sUYWjKYR2yDdRDzsVt7qSTwmjfyf/FmiIwa9iAune0ib8aslq0ONLboRLNtqapu945tZ
	 cEgMG9ABEDvl2ntKMMmCA1lYeQoJFIsuJn9l+StV4I4b3TuWq5GhdQ+Df8/bJI6bB0qmF
	 V33C88ziTN0NUH7lM8xJh1MOkxpghw2ZF2s+SEiUgVqL+epmGa+rBo3gHr3zrtJqJzBAZ
	 hyxZyQN2XGU6m6USssT3XeMbXnKywFWellhWgWAUYc9yMJ8PJilxha2cKADlb6B1rTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2832606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2832606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpdH5452821
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=; b=W03LZuFx/ymfbxYy
	QVP+06O8DYB9kyjyvU10sNWQkwlZUwHbMBEV4DNqrndrH0dduH1BGYeNyGFzh5wg
	P93HcCgSCOYes6+hXxjz1VxN8jOL6F5q7fdOdeth9pPfBRhyED36Y8jXkdeAuI0P
	ADPuDK1RBVj7bhKzdXYMyZaJ6dahYZuXHGxhAgcz0/wk2uQpMHUBAX8AAC+5DKQ7
	Tr7zUTFzyZIhLi3nc1Yb+FaIOMWj3TmdYzMHv2uxORrUhI2MEeDu1NZdWoohP5s1
	s+fzpZIVqhbifIzGt/L7X4D7e22sFm7F6hKkcdupAzEAJZNfJop76iVJJ2Wry+KX
	hHgauw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rp0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:20:14 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ea2c058e67so4477377b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629214; cv=none;
        d=google.com; s=arc-20260327;
        b=mz6zHep4u+ZKFQz1Zwl+C9KCK9EYwxAfpeoaSGKgZt0PZXXu60zF7/Kd6ty3n/PSqR
         44us5W7X1GoLc2bmOwLtnHqmRhNTl90FRkZLjvUX5d33C8XSLPrAdTtikmQcAio4WIln
         O72XDuzot/Vv6ODsPR0XHc0a8JtZt9FH86Hsesit6+Ox4jAzJXkLvIPK1Eb1Lhrlv8SY
         6ORdkb+pOrTmmqKg9ON6oiJMkkWcv4CMiwbjYatnoQsXcdcmp7YnVu4dXxvXITl5X4gO
         U0/rMIRoziRGjpFnN/pHzEAW8qlJP0ebAmI1oGdolaoIgM3lYeEEat+rZK4BAscB8MjM
         Z10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        fh=GZkXgLLKh54mYVM9IB6flP9CQWgbFIn46x3s5wCoR78=;
        b=ZXjybcgvL81b3Yhh8M7fEzz9HhhCihvYVCRgSxbTy+jQeZMjjmRW22Y/LVKH6uAyR2
         tZ7wmJ96xMjvVtM4GwkKEr2ZPZWBKzVKv0CnsOCaGyuY0ogKJJiexH8Y0Wt7kjvy7BkM
         kAi9af5+rtyHEHDprmdT8ZrpstoC1wBwsHOzNWkeMUeGJiVRykHiVVeKIrLwjEUllLwI
         YNi0S8YI1xJrq/qSCwsndSKgPe1ZPGV2TL4s52j/TrH/D+odM5x3qGT5KWJYPAdJHvjT
         wyKzkBp6uCpNfiCxqYae9tg87JNs8u222/jglVVUjD3ZEHbFnbLga9DpqUAS4NpjmAiJ
         sUsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629214; x=1794234014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=OIH2ZGYnpFvjQRv2iWuTrSmuyrv2+dqgkMyhDiuZt86z+ERrpJxENnaqvHG26SbvVZ
         deKCnN+ZKlwe6KQM98w1LKoLYJk9QUavYa6dEodg+HDzMMn5gm5QAVS3hD6CpQqRTwXq
         pLi/lMONKf8rT3NXuN080bqQAEhVo0uv8AS9UuGQirZysNS0fljWIH0XY8RiXYNy6eMG
         4C0xwgZAVwpVJ+YYs8thdefQd+9s4yciodky8UnRTemcYfx8T4dY3uvibwrLUAs7swK0
         DQDzYfW7UQ4tGzcMOzArFYQsh/69GY9VK2kWSR4ilGJZQLWoYTI9vbLkmP6dBju/ScF4
         M+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629214; x=1794234014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=Z1bQvyo8pOlP9kjrgzRfuJBoricbfQ+Wrvx+uX2cx912qrk30nT+bq4vjzT6FAyHVt
         QqhRSTGRBPXBeXsI+yK93klYBVwM9coKm7OWsp0i3sKtVDt+3gHfCMO99HAS/lhx6FHG
         88je//tBwWmAYobd0dRJ7crt54sipQo50QLAs0Rz4lb2fheGkaHxsMv+a5nRovRorkwp
         V2ZnL/ID9fCEas6OXtZieYg+U4nTIOsj1ZvVJy/A9l4bRTIlN+xFWqtvJepPdoZx/331
         CDxokY/49QVn6LPQboQx4bTI+3x51t2rvTbJmfeY5iiEWHFhgRFob7rA33vmOffThYCc
         3Rww==
X-Forwarded-Encrypted: i=1; AKwUvBzd0Ip7wqzKMp9CtU5j4Yk3pIQzx+EJH2qJprNklo0rgxDTCCJZACFiilAuaVEIttHcVvS1ycUTdWtG5o4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPdUjyueaj7ZA6V8x18CSgWBU+ycImd6xSbEu3U1ATD2aEJ4Bc
	+v06DWJTpZpYM7P7TO17+v5hEaDJpvXQzoPKEz+AtzPhGIS9tNLokJDkYeIXFpZerxEW1WuUwUB
	durKgZX3u7WMxSiyJ0KcTtNw9/yKbV4dI3TXJWlrxI3Aetcu6e77w3Xmsggi4nftlAXCbf7gZIe
	zP+g/EJJFaR0lS8RgzpM3pjHQoTI43My+05ufY3aTYTw==
X-Gm-Gg: AYBFou1up76YYvf2Ugr2NIX5O/4PkJYFQhpqvmIgjAjHKQAkgLhwkfUbivKFFH+vPWK
	2Zgn8f9de+u/WiOzm6nx+HPR7BXbNf2n1kBhf5jSlGYNc4RDBVL48dyJkyJYrcvyv7aPfJHHgFn
	1rooJAyGcd7ALWjXcrTffHEOxqWF8Jp57iadpziSKb0KLaknC1lblWCb14fCjoCx8Bjb9JBiljY
	BV47/t0BbjB4NChcbTAtZYo5q9pVCG+U7QDfkjpu0uIBGGrca02FOdbwpG7KTThDVgvQ+y4EEs=
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id 5614622812f47-5640dcb93e5mr6416259b6e.28.1793629213718;
        Mon, 02 Nov 2026 06:20:13 -0800 (PST)
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id
 5614622812f47-5640dcb93e5mr6416216b6e.28.1793629213180; Mon, 02 Nov 2026
 06:20:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:01 +0100
X-Gm-Features: AclHuK9ZOhS5EjLam-kJywbKLlgi5wGv4m77X5Yw00ydy_7TMI2tMaQ3gudROoI
Message-ID: <CAFEp6-34V8YQM7WVQ1BHDnb3vOv2MmPxAw8N-H-wQMe6xCnxKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: qcom: camss: Introduce CPU latency QoS
 during streaming
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX2J+Wigzpd9V9
 6olvmfu5u9+YMTnTcrmTZPoy6aidSXHRQ5vayPNLkdpy1ZTM2QozZn4Nfj2fkEKpC60UDuSI2Eg
 ZuBNX/ZNguqYZeeBldnamUGFUaX/iAWfTg3oBsxkrioZfpZf8AxSyUhsC0yUQtEcPaA3po4xT2p
 8QpjbDeFasP9Vet6kAa3CVHmvoO9n2UkFu+3VZTTi2vajQe2beP/T5hfhOVw+4VFMCN8aR5kEbc
 SKDk/NFgifFXGxc7hyE5c3XfQ8OBgnwJG0007iIBi63F3zKfBJPpnNBsnh920dVtwabezjRpNbw
 /mrKMHuD2SxuYbUp2sjOfohNqc0pUcdZvMTn6SKcRJYCjMFwTFzKLqu6Dh94k34oO5giMOII2L3
 5zp/yRh/s1Bro/GKkgkKhXsVg6XAiJ/ZWKHwJPQNASUzKbrTIbH9IID5RIZED5uuTkSvuzvu1+Q
 UGLy39dgo5e24bfBJ4w==
X-Proofpoint-GUID: 1hy-ldRu6W_VOxD6uWuuDYpuvSskCjlW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX5SdL5GLh+bSg
 98wpny5BpIYMojPxeSMUnlm8kJReX+6VW1ozBjkzkbdFezLssnFYufcATcR3kUAyH4Fk7r1x6GE
 GELYuq/AbPcatoS3u1fZvjQKGyEOIyU=
X-Proofpoint-ORIG-GUID: 1hy-ldRu6W_VOxD6uWuuDYpuvSskCjlW
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae89c1e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=j5BrblYcdOSYweWB2fgA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> On a quiescent system - for example the X1 CRD booted to a simple ramdisk
> rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
> interrupt for buffer done could be delayed until after the SOF for the ne=
xt
> frame.
>
> Fiddling about with the interrupt bits, clearing them and changing the
> logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besid=
es
> "felt wrong".
>
> Tracing it looks like this:
> <idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=3D1 done=3D0
>
> Tracing with /dev/cpu_dma_latency =3D 0 looks like this:
> <idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=3D1 done=3D0
>
> The second is the pattern you expect CSI SOF followed by data.
>
> We will require SOF to track and understand which data-frame is correlate=
d
> to which camera stastics and parameters frame. On an ordinary system with
> several things pinging off at once, WiFi, display, keyboard you will be
> unlikely to hit deep idle and hence unlikely to see the long exit. Howeve=
r
> we should design for the case where the system is otherwise quiescent wit=
h
> only the camera streaming.
>
> Choosing a request of 300us - 1000us seemed to work fine but cutting the
> margin finer, similar to the value on IPU6.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 11 ++++++++++-
>  drivers/media/platform/qcom/camss/camss.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..52bb19f5fbf3b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5834,6 +5834,8 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>
>  MODULE_DEVICE_TABLE(of, camss_dt_match);
>
> +#define CAMSS_CPU_LATENCY_US   300
> +
>  static int __maybe_unused camss_runtime_suspend(struct device *dev)
>  {
>         struct camss *camss =3D dev_get_drvdata(dev);
> @@ -5846,6 +5848,8 @@ static int __maybe_unused camss_runtime_suspend(str=
uct device *dev)
>                         return ret;
>         }
>
> +       cpu_latency_qos_remove_request(&camss->cpu_latency);
> +
>  #if IS_ENABLED(CONFIG_PM_CLK)
>         return pm_clk_suspend(dev);
>  #else
> @@ -5866,12 +5870,17 @@ static int __maybe_unused camss_runtime_resume(st=
ruct device *dev)
>                 return ret;
>  #endif
>
> +       cpu_latency_qos_add_request(&camss->cpu_latency,
> +                                   CAMSS_CPU_LATENCY_US);
> +
>         for (i =3D 0; i < camss->res->icc_path_num; i++) {
>                 ret =3D icc_set_bw(camss->icc_path[i],
>                                  icc_res[i].icc_bw_tbl.avg,
>                                  icc_res[i].icc_bw_tbl.peak);
> -               if (ret)
> +               if (ret) {
> +                       cpu_latency_qos_remove_request(&camss->cpu_latenc=
y);
>                         return ret;
> +               }
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0d..7564a7c46fa24 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -11,6 +11,7 @@
>  #define QC_MSM_CAMSS_H
>
>  #include <linux/device.h>
> +#include <linux/pm_qos.h>
>  #include <linux/types.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-device.h>
> @@ -141,6 +142,7 @@ struct camss {
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
>         bool legacy_phy;
> +       struct pm_qos_request cpu_latency;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.56.0
>
