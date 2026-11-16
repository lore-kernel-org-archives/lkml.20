Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842754;
	b=cTcz9egQJwd6DItOvQZKNKCFt+XM+BS1a/scGSEzIYEgDvZQNEzAZg6kPe9Z1bKcvniD
	 XLnvlyMsThJFP7cRFyRjuS7wFM+N+BdxCSasU7BR7xchaCsGqL6JzawhUVxxF0w9EyXDm
	 zdJK4nciYSAH4CZ7jn3CdUGZJaLailJSzPaFH/hWsUFoKVqyJWKOs8XTOBchNzJeyLXUU
	 lWJo+DXJx+baXkUG5JtgROWQb2sfqL0/GN1GU7Vg332a9UAlWWbhIVC86UHtqkxPnkdOQ
	 1Xk4TozQoEsyY4EqYl74XvmT1mC4+QfuFBo/kLNQRrIsHGkbpgzqYiCj2az3bSZz8zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
	b=QAyPUjroq2ypfU7utBHMLlsVdZDSBiRJiU96yrWeq5S8Pgbvc856EKygllWC6KYY7RSe
	 sz8cTBvtNc+Akb/A3ogmbVuHAc7AgLKIkmnS/jyVTz3QFNfpeyr8WnFMoRpGSerhh8q8D
	 ojgDU83FuPL8xENAMMkieCYDVUH15Ndg6XfUt8YUgZ+FLtuzMtYR53ZPCLkzh7h/Es0xi
	 Geu56sywS2WslXakKxWZPpcfQLKVTImet1dSbJgr7G5DVA01EDsvNO/iSUtDESx12p72d
	 9J/6xtDn9Now45P7ivDSoLEbrtouNx0iZGNGJsTR2cKiHT9UKORmqCSUmqLx1Odef+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbUtLH7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="euJ/AU+b";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C39606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C39606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbUtLH7O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=euJ/AU+b
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrbpQ1727406
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=; b=dbUtLH7ODDImv+Bw
	dAblIO9ciBFvJM01OilRUZIJwj70ECzP4mQgRv8DE8gw0HL7dce33Uh1HvO3bmyT
	oLF06MErMam++wMysOBBuKiQC11f4tx7TdWY7uEIdUd0eMgT2uOc5ScpCvc83GkG
	w76XSAXFTEJzj+MD/MyHWe02QkLQiahz3fMTM+CRbEy6ifV7GHp6syBng4AwrXwG
	PjuXitasCYy1OPk7e1bfUTPHP1N6VboMyxRdUPeBaAMCMqydw+QN2KcMwSXB3yDM
	k5az4nruvYU/NIY8WNVVeYt06VYHcaMNoszsKlfqEt4CuV4ShuXiD6RGMf80ZJn8
	fu5meQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqh515-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:25:53 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so6968347b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794842753; cv=none;
        d=google.com; s=arc-20260327;
        b=Qql5JK3eSYswk48loCxq3BJeIUQMSCGr1qLjgby7D1FC2PmVugfxV305KBqlsBr/MS
         49zdHprFcPUscK168fI3TxoD5NFqHA8fmEMCIM0LmE7LbLrc8fKa8zTt9ShP5p+2Ho20
         CH2j7WtLHUCK8AcClfh7Yh2rIM520XJr/p67y8yiMsayIB7EXU6zAkannmnafb+lSyqw
         9ksJPkE2o0/itfsm8/axSadk1so2noU2ZFrZOWBYmfJRooJ3zALDychmpMmIjNiaIlYf
         7tcBDY0AENb6X+eWHi5IQgNwI9GiZJoJ7FrgkY6PvWFYQLTDVblu08mEgNK2GUNNDIFy
         krtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        fh=PqeMRjcfNb3keI+YcTagQ+aawOyagdbBFk4C3zUXodk=;
        b=P/ZdaGxc7RWst9kUMQ/bKV1o8mIyS8HErRWGIx1ItsFy5v2Sty+QmBM0curS+GaOnb
         xjevXbpACGXKoJuDZjj2xwlVVOCK/ded/xSgYhlEGxF0JE+ICrFH+Tf12U4Fs4kKEZd8
         wuXG3azMYJRtdp5y9W0GCwWVMfRp71kw7WIlyauXH9fkylkF1MLCbBQCjfkh5v0E0q5f
         XpTExSXr3HOmXgOR5kpVBkdgTgk6Jejpaxt5UaS+YK7cehTokfNuW48nlON0BXEIBl7o
         hUPNrDsFbpanpmzxq8UFXsnJe1gtggvyTnLJmL5pkJPbaYcrJIPoC5ASv5qGVMK/zhec
         B94w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794842753; x=1795447553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=euJ/AU+bewWXH2xE2I3h4MaIDLwtAFccWYDQeasFlYT29e0S43/2UYfY/6mTZID1L9
         0h3elnmhUUXoSYKTmKBKTbtMdl53oL6qOV+Gr4Tmfd8cAnH0YtyXnz4GrQnNGVV4CU/j
         DHKEI5k8u5JIdQY4PunxgCIewh8qQPub7+jRH3DMBVQmKYpAA80BhXb0PQ90Cg/1rukq
         ujHfDPL8UUfKNU3uKwCcJ7V4p2S+PAODpwiz8MhKHEyH8zNVoroBIEKajQIS7VdWVK1a
         2AYsKw4fsSkUFHNMWlVfuNzKNfguPg01GGdqlIfqSK1P7SNJuRRVE7WtWB8onbUd2qeN
         whDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842753; x=1795447553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCi0EFeQTWCwCeRewkBP9kQwiHR/Y8Onl1tBxX1t6Qc=;
        b=2ZEfrc2tDdQZy1gdjwOdgRiAjuO1hblmhbuUc6Lfn4gNGaLPVZqrVUOdw5c7rtwQA2
         92L5WisXWy23aL3SnLscDyxmb9se4adBnzTnElnqPp30BFplQxIuar9swzVq/9JjN6z6
         YP9AAUQiC2FMnY2ipVp0u/dwQkJLO31VxpxbpUV9NDx06vpx/h16hSRU0IwBIyMpe/T1
         ra2M/BMy9AtRdwQLIbhN184VlN2gaA+2q7ietqGs2vTwGwapWwhInw9fto/3x8Ci/h/d
         lfaqAE8YH9Wwdz4NH4bg4khXFlsMb2paTNA9+y8f/TnG3WP3iiHUORLY7Y1Rv7CdDsku
         qOrg==
X-Forwarded-Encrypted: i=1; AL+hErHt8Paopx85a8k302GedBlQHhji6/5KtbjQCtasopUIgjEgjzYDWEWcu+w7gvehV7ZYJEIZpSvvdAUFBSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Gdl/S7Qr4ZJ/Kf9qjW8uQk3BGoSBcPJsaeflDnXL6QO73f5R
	kWk2lOQQsOXielFabZio+X6BZ12u8Z21IkIxkuUaasxWyt9tPMKB4OUv4euGdBNS6dv+PeVWSbR
	/SS1JrANUEurH8ucLcf0Fbe/X12Vlb3/NTvNYCSWNPiI1PHpgmoJY6qhbLAP60xMj6/S/rkBAXN
	YHEIQKMIwKGZnzF1wXRVYgQAbLkjhkgn0HDngKHXGrIg==
X-Gm-Gg: AYBFou0jxxxd6bLagymvR0XE+OOU6kFgQMz5Y0dTx79aY5bIVoLas3PoeTyY52fONya
	a76rSwkJU+MwIAJJvzK3xb3ccQRjaK6GsyD2IAyv3yrkb1faJinVZlgwsIhMrC7VmB8B3xdvzzk
	MXOot0RPPOPOxbbCsC/4xejp4jKH9GCCUyGPjvV0dVIbJtL8qyFL+bsj6MWA3bsPJYJEHpTtkou
	xJAnJ7DhleZXKIEigM10mGcXeR1lY/dfdFX5ptXQpbMBrh6oLcg70XZtdhExNXTzRrg99THXsw=
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id 5614622812f47-5734e8b3fb1mr5344820b6e.35.1794842752573;
        Mon, 16 Nov 2026 07:25:52 -0800 (PST)
X-Received: by 2002:a05:6808:4f4f:b0:573:4e8b:1f5c with SMTP id
 5614622812f47-5734e8b3fb1mr5344784b6e.35.1794842752120; Mon, 16 Nov 2026
 07:25:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101164247.258200-1-julius@bairaktaris.de>
 <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de>
In-Reply-To: <20261114210506.787342-1-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:25:41 +0100
X-Gm-Features: AclHuK99qyYiTBn1w_wsKGa0k7udgWCX78Nskst2jWzL_EErZ3zuCac4Z_wS87c
Message-ID: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: jjohnson@kernel.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb2081 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EBsIc212XWC_7v4aTzkA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: P9irMsIz5Neh4lWSHE4s6vE0M9JO8att
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfX37hGtSe5LSsB
 c24alyjFfr8tdc/h/J+OAeTvm3Lw/YgivcrOAZmjohEaq8TO17XwYNwWz7p1wTOO7ZrHpnS+esa
 btBOFAJ1w9y4Rbg1pu6TbwQ824ZGApJxdbLdh/2Ddsc0ohgG1f1vBlx1nJ4qoSn7omnjZC9wfbb
 kSs7w01lnLUsN4mXwcQjFHlnnfGnCWqWSgoYUuQX27KH6TW04o4HqKWAYteoRZm7pjgDvVxp5yq
 MqKo4Af2wtKod9NiVP6sms4j0I820fpkRSDUJI7F6c4bIfhvuxdLO64/nz1VlTpb6D6RMmECCd9
 3JJcc34uQ7St0x0CpZMvxFLoP1kQ2UdWVQufj04BddDQRfjOErUYzOYvfPjQPRZ9PLeJ4C93bju
 1r1/2vX85biGvkuHbvZTTpBKX0tCEpIvNglZN/faoKLv76zEmdoSrvysxqSoF46A/9FmpnCWKL8
 bDqMtesX6YeYPJZL+sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MSBTYWx0ZWRfXxqHzD7wtrgzt
 WThepAX8XIsYheWHO4tzrBOB8TBT2DGHjnBQf98gxIiYHkDp5W8Ei9wlbT/rvzVwY8M+7S9YwVX
 an7ErloaT+IO+LYKuRpIhmrDLuuG0I8=
X-Proofpoint-GUID: P9irMsIz5Neh4lWSHE4s6vE0M9JO8att
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160061

On Sat, Nov 14, 2026 at 10:05=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > > -           ret =3D pci_enable_msi(ar_pci->pdev);
> > > -           if (ret =3D=3D 0)
> > > +           ret =3D pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_M=
AX + 1,
> > > +                                       PCI_IRQ_MSI);
> >
> > Why not simply using pci_alloc_irq_vectors_affinity()?
>
> irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
> vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
> msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
> HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
> run) against 36891-37590 with the hints (three runs). A calc_sets
> callback allocates all 8, but group_cpus_evenly() makes at most one
> group per CPU and the rest get irq_default_affinity. v2 takes the whole
> block or one vector, and keeps the hints.

So, from what you say I understand pci_alloc_irq_vectors_affinity() is
the wrong API here because it sizes the allocation around CPUs,
whereas your goal is to size the allocation around device
CE/capability (8 vectors).

Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
And why we re-introduce MIS support and how is it different from
previous implementation?

Also, you should update the comment/kdoc for
ath10k_pci_per_engine_handler() which says MSI interrupts are not
handled there.

Regards,
Loic
