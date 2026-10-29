Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276843;
	b=mlII3PpO9Rbi3NL9FX/Jvn9dBs6J+n6dVS+F5hSZDiFidOd1ChQjZa4sqDPg3XV43Q0W
	 uCahKMQoYmUlhYZIB9g5baoV2Fl7R4UhiA2Ej73bCM6jT3A+qIYKyJwuMGtTcnfEH40/6
	 pCEB5iDSxRTrEDZMsyiZy4beJ8HzWrAA7va5RB6UfHQc19WszXxg5001jhuuULE6FAt3S
	 +uaxaszXf7PIFeBMdXLtnQHBVcBOOpVXUEpP4cmBe0FnBlSctkS6EXFea0Fq4PNdACFyx
	 E+JINzSajbdBt1fa1wYGou00dufPn56h+3h6FUlLI7cOMfd3bW15/N1NVn1kst5PxxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
	b=UY8+qmM09/nZvcmiXzpkZDhVMluW6rR/YHFZxRW/EEvxcBJChqZ3SI3SyBB1x9SfEsu6
	 gpYIE1SB+pfvTBONshxFJlk2sFW/3Yu82v36mKW3Gp5OBIyAl6MR9+sLuFOLdhuK/ZYbG
	 H8TjQv/3kbZDVB8AcSK6+evNpseQw2jK07V04MxtkcqLsQxrIZNyLrZ9cEh3wphrFr7zh
	 R670ackYJqMsh32XrRjmJ1ZQbKm25fApF8SviLwOaPd/oWEQ57Nn0L/xYuRQt5Ya/9haD
	 itusoVDLkRzIqpjEqbdOaQc97OLIfN9BGzpwkszKTt9uuoriEi3UTX4lJXIRQ/QvVuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCdQFuvA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxsoYMq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6F606A333
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A6F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCdQFuvA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxsoYMq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jjF3607048
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=; b=XCdQFuvASFXh+8rQ
	oOalrMlz6pRA93tAckZW4YxX9TE6+WhfnTsmQ7EVc/lNrFsUbVlzKYCOCG3aAqhB
	qezpYjrJVS2Gkz/FR+4oKosvN1aBSmSM0ya2xQQz42S/WhegH/uB2RqEUn4rdgN8
	LqgLa2Xz/s1geaIJTxulPAhnIgSZMr5nD1mACiX6FFiRjrSp8Xs+cG3BWmevAjWl
	c4u3+fjmo/R2Cff5S+hBzl7UU4VXbQfIwVp05CPMlGqP9d6nQExtlpvDjyAvwAPX
	uEIPHQfXvUArIqZ2OqUknqtqHTlHARY1VkDVbjQxbWJyKHCUNlSdtHRDsAsXHeoY
	6knizw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgfk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:27:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so8279669eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276831; cv=none;
        d=google.com; s=arc-20260327;
        b=YwKSpcAcqcQ4e3oJRSSBRzJn3c2WVcuxPzyKZN4qxm7dKV3MxG+DmMw9F+CYDHOXgC
         vT3BNan0kLwtXaWTwYzqm1bl5WaOIyXR0WO/YhwUfY4jCxWggQ7m8VQUjJy9FfNu119u
         NVO+VjD8of6qtsrSE19oF8v7f+iGWGdwSzro7k4Bje4ApvvV5HHORmi2xaBB6ixm6El3
         WER4vPhmKaQ7OnuOmckpqF9mNTZMKF/0X3cmkhsJeQ0wlagrcyeoWjM6sKrSTK94e1uJ
         YJLJdjzBnz+5IBrip1lsZfyvt6pcIvpB4oV7EVJJtZW/avDPIdbIB9HPu6PyyhAjTbus
         w29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        fh=TAgO8VKrchzmV7Jyl2NoWyUvACt24Rq1tC+fASjs9Xs=;
        b=qLJ+kURtLcRAjqVtLFPywZkLjsbLlk+F4Nd4fs6xJvVcjQIkXTKnKPdDUBplkNzv3i
         83Mn97BooWxRhxDOgWmneNj3Mvo3Ubu9fIjeTvoVPQllzPh+uxDtqqqo9AgVe7rZLNbE
         amgqsynrsXslAN+T3qBKRJuxjSDDoJ/K8ogr1ST9gXaE910Pd3m4Q3mAYMg4iUydIICk
         RwwvfmiF/dwXUOesTh4tNSRi43LL6cQC3yVepccZcQSWkOqjRqQkn8VEGQtiLw0CzWe4
         Ay6UHH64/8nVkmfUxAiFZJY0yyJwAE+Y2Oh4paRYwy8W8YVW0E4AQRH5V7lNXkYXzXhv
         ywhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793276831; x=1793881631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=LVxsoYMqHYDQ6kpnVtFAtmv7+tKGAxgkaYIIvzYm8sbLQIV19Blu+/UZ6MBICMLv3o
         a4ZSqisTfZL4c2a7yDS58iXx+RqPyriexwX5csRMdSDyn6WfG8Q7atck7pGaVs1OGEVS
         YiNPxCmt1DU62nAk3sLfLQhuEWBVORrU4r4nmTxW7zVcAtySGLRuTT7bdosc2RCXfnOE
         yH+Lm817LWV2ES45zA6q5tedUnRsgmPfBQ4MzVEuTrbsVOuHay/WcrOdKWuPgQtrNfj3
         sLmEco0BY7scuVAjFh8qcWBXXXDT/f9N5qh5p2SvDFntZgN9dQMhHj2h4g8z+tAEDFeH
         5BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276831; x=1793881631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=RDGiyGdcDkK57yps8jN2hcEm89t0/Bk1lZSXrYCrL9j3rkYFPBpRCUoak8oL4uyhBF
         +GT7TwAvTC6HIoFB+uORe4uj6DnF6SBIlj0pkvLCJZxFAPDwvie1A7vrZbseNTCb95IJ
         4T+9HTwKjEFeVeWgRkVtYEvaXnPzSpk4rFAOUg1a7dlLBaS1QNQh0bQVsrLtX81g5AuD
         VvgZTfBMOjJcJFtSUtcPeh8S8Qn92QTzu2sk2L57ovPGloCenDCuQlGKiS2vOw1wUGU1
         WQwc+Dk5SeOQVXKpQWxzsb7XjOotvRdvYanjJkAdldt51iExCp4xq+EEi74uSP0RluQw
         02Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxFe77ihXYK4OB7htAlh9GMyyBIS7Chph21oXD1lBkx90I3vjLH4mNUotF3yl0NUGurX/hI/geOH4XrUBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxCvYfHX44oHu2Y35l9klSmSO2rzGqBNYGY5K+Iwj4I846JGRP
	p3k4cdk9xaSFLFPRXLQXHEfG2YCbTXEIz9XbrH9ghSqNiCULnG+gK1Y8D78nIUVK4t/hldsQjQJ
	WQ1mHE1XLM/i/uxDdKZurYW/JfCdhGMO/Z9n4LVLB6xs6/aDu1vjw8x3B8bZGR8cfUeoHDrqoTW
	22X0w7nyujFeHmASQYxjkcOO9dwpQo3jTDHbbN/r50HA==
X-Gm-Gg: AYBFou069Omc7FgHnX6eYVjsK3hznZgaD8Qt0cWVxkJ3DMUgEPF0xCqNYV6q/Aod34x
	P0vY9BacB0wrA5aIr4MKC3iT1kUsRdDLWgCo8ZrpxViLZI5+djzhV56sLUZ6wEF5eIhZN0IAoCY
	zpWeD3fUYkpIoJibUZ3XK7yo/gCcvqXxaC8UN3AraQyTyH6BLAmLCFHEtODA==
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36a202bdba8mr7838943eec.4.1793276830561;
        Thu, 29 Oct 2026 05:27:10 -0700 (PDT)
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id
 5a478bee46e88-36a202bdba8mr7838905eec.4.1793276829977; Thu, 29 Oct 2026
 05:27:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
In-Reply-To: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:56:55 +0530
X-Gm-Features: AclHuK_K8FAHAaVvZrkLzUN4-2TI6UfFRWFLq4Lv-UCwiDI74MI7EZMWtDjZvCE
Message-ID: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Himanshu Chauhan <hchauhan@ventanamicro.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX6gMd0dLUP0tu
 rzWV9XbPjl8j3L9gY08g0Qwv+AcksJFjeGzL7ehvgbLPaZUatpB8QwwVRZYGiO8RyVAVwCZogoJ
 k31doC5sWqr4DzJYLKMdPcULBnZSt+RAu3yyB6cwrAQehX+6t7UyJsGN1uhZI8wmWlZTynZhtDR
 98qo2zzlLlD6NoOosPJckAbkn/9OPBw45ayBfzW+5zRIuX/YGENEgewsw8CwTpyA1TFwpo8cYTt
 gQRprToa/ic7OfVYoqx1ulgQ4TiLEn0TuJSXgrWoMOnWLrAuWKh1zU6SErgjailZ+ko/TUXEaiS
 ELIRVTGeacfj3u69jwdiebPvw9DeESNYyzQIwL3bySFDqdV4OH1vOqiemwASpZlhl6QiL0+84Nz
 Rx8xLew6yRte8d1wICAQwB5BTPbv58lENATpS4Vtdl1n+lel/SCxnfNmRcwqQZXFOqDCi0ZDzwO
 lQTJSiurWzpNEy4gn3w==
X-Proofpoint-GUID: jh5YbkQX7YaZioT4ko6EYfEqx_rZ2QM3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfXyn3zSSiLqkOs
 n9QBeEQhWo1hfZTKlRjEij6UTKeGFYBVNEnlQv9KC9ql0FH/+DPm+TT2eNY4GAq1SlLauWbP/Lr
 Qql9tAdOHUakkVfCOvENv8yDuLQpHp0=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae33b9f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=B1sphXeUGUYvUChdj8sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: jh5YbkQX7YaZioT4ko6EYfEqx_rZ2QM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290048

Hi Jassi,

On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qualc=
omm.com> wrote:
> >
> > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >
> > Some mailbox controllers can complete a transaction entirely within
> > the calling context, without going through the queued TX state
> > machine or a TX-done interrupt. Add a synchronous send path so their
> > clients can request one and wait for the result directly.
> >
> > Controllers advertise support via the new send_data_sync() op and
> > clients opt in by setting tx_sync when requesting the channel.
> >
> > Channels bound this way must not call mbox_chan_txdone() or
> > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > reject them, since only mbox_send_message_sync() is a valid
> > transmit path. The client remains responsible for serializing calls
> > to mbox_send_message_sync() against mbox_free_channel().
> >
> Seems like you want to use mbox_client.tx_block.
>

Apologies for the delayed response, the past month I was travelling
followed by the Linux-7.4 merge window.

We had tried mbox_client.tx_block method in the past and we had
found it to be not suitable because the mbox_send_message() will
use wait_for_completion_timeout() which crashes when called from
an atomic (non-sleepable) context. Our existing mailbox clients (such
as system msi, clock, etc) do mailbox transfers in an atomic context.
Due to this reason, currently we set mbox_client.tx_block =3D false &
mbox_client.knows_txdone =3D true in all our mailbox client drivers.

Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D true
still does not avoid the spinlock serialization enforced by msg_submit()
function which works fine but adds unnecessary overhead and prevents
parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
channel.

The SBI MXPY mailbox controller driver simply sends messages to
higher privilege firmware upon Tx using SBI calls and when the call
returns the response data is returned with it. Also, there is no Tx complet=
e
interrupt. The higher privilege firmware may forward this message to a
microcontroller over RPMI queues OR it may context-switch and forward
this message to a secured domain (e.g. OP-TEE) to process the message.
The higher privilege firmware takes care of the serialization and also allo=
ws
parallel SBI MPXY calls from multiple CPUs.

The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
channels since this is already taken care of by the higher privilege firmwa=
re.

Regards,
Anup
