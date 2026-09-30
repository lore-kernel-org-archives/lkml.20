Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964437A49D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760034; cv=pass; b=cmNrUKSNDl4DdEPPDvPlDX683BlahLHQc2x0+hLFrvIc/m0mEXSGN0bUh4MeoJUVStZp9nMCjf6pDhV4ev3Os0EUPqZZhmE20a544lvaXEoVB+tA9Vp8Zbjh/3tPnCUQ77tEHn4XGNztwATY59PiQJoh1xGrSohOlhSYR/HekD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760034; c=relaxed/simple;
	bh=C7nj/SN7aM5XkOBbeD4RxwRFjpE3jc8JoF/6l0m6azw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW/K/4jhgeyHE34Umj7k8p9p6LtAw61OGGh4LRfh2NRfozQ93FT7jFe2z/JmtK2uYmTZiOPmpjvYKz3tOAv0yPDwctyn/CdfezELKfMFljVoDVa3oKiE6CkEpzAsI3Te+4TllvQnGlgwuvo1DYLwA6uhf7aBaU/xMVutS59j1Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0+ErsIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXUGB0hG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0+ErsIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXUGB0hG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWQt3489199
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPoikiBYO5NXXA1YDb4euULYj/GMIMikR+EDZceXnz0=; b=X0+ErsIHQKmpcMoq
	cY7nspCnSo/VJmG/U4YR6MAWrOWRu/uLLvTT2KNeiNZXdr3VvNDgdWKBTfFPFMAB
	knLMEVZ9LbvhZndKGdKxWRMwWELWcwo6paFxmucqTU7x7N33eiQvot+TYJFab3rz
	QvBm1gXZymZ5PNfhOmsj4o/CUd51AAmtvvPW+hfwvjjc3Bfuz37IMmet52jDowH2
	Uv5lDsmLQFfZhdhqwZWvtGCAZPCtwRboK2oJ1fHkKfRxVJApMIMTg8mtb1qKHcVs
	PTuutpQIwtDIfufDaZ86bhOsGvKYeNhx7aezMaalU4nDgcbQC9Z9hcgWbeii67b1
	HXHL4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97ufce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:20:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so1183412b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760031; cv=none;
        d=google.com; s=arc-20260327;
        b=Oqe3yCoSXO1X3DwFxKyEwDrbpNbTiX6cU5g9S7rgLoAszJRRa7QKWUl7NHRxJUYXrg
         hRIxhfS5PDNsd05IM7TS23pkv4UbJ3z6Ud//5FFgiU611dWAiEm2jrvSoDAo/EiCKN3w
         /o2y3fElcjT5jH9WDo/HSVYC6Zfxk/4w7JHoCoiD0aiZ9VgpRw1shBYpqNeH0OEKzph6
         wj9NCghVPTCW381MYBuiwXM/awb+aLuLBm4UXa4wIUxt5vegKxpvtEdG27CRdvN2DhQt
         50QQUD9VFctISuRpsev3U5Gw9O9Tmz1s2JMmDxsNs0nSRGn2OwJn7JHMYK0rJKY6r8em
         mHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iPoikiBYO5NXXA1YDb4euULYj/GMIMikR+EDZceXnz0=;
        fh=dFz+Fa4ntFwP0g2UMFHj9Hi9n/wwZwXlN7PLoDXgqmI=;
        b=fuiK61DnWkg2CZQlgU5zWg5c05CHpLv9NrzlKGLg/c/qVOJW4iBEpOFNnFtjE1PcKN
         GCzkdOlQKuhlXKOEudIbNq3UE9cLLx8d5mii5qJSxmHqFh3DGOuYSYTAfHFucFj3+U7n
         evkn8Jg3h76bQi50PPK31rTOnz25GDINAENV/RGHspJZg2VDT111mLf7oDtn+u1OyzOA
         xl/8HdjsKxoCJj+Un/E+bLYg73b9WoSLOED2ricvW6gljYxfb0NAT80U8oBy4YszBkmI
         2FEW+C9aNzSdtpCBl63fBE/5pKTocL5fFimdCF37qGyYmeLBbckImevdpgIguYy04xPy
         b3eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790760031; x=1791364831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iPoikiBYO5NXXA1YDb4euULYj/GMIMikR+EDZceXnz0=;
        b=QXUGB0hG9SdqbapPBJnKBdfp6sAMyw5ClYArTTr8VpBLxCFApoTryrTJFm8/D1D3fj
         +NrKpp5sfd4FSACGzi991gurRURYi5ZIGk3fhTQ/jhjO1FBVaBeUyLN1y8pHlKrDCmVH
         0EpRFruypwB1YeAlGWH6ZHQ0Y4LHio97XkvJH60oCT1HaaMfdRhoNU7v47zLMbRVjzfd
         Osb/ZN7xeUwsykCScH/Tm3aGqiDa86ILuqoqytlVoQMGTP6jfBAO5Qsz9u7HfqP4IA5q
         tdXKZ93U9OAYbLXmfVH788TTW3r5G8fhJ0KG5+Zzae98L6yyl+gYHB5lyWWiIzpR5LA6
         cAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760031; x=1791364831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPoikiBYO5NXXA1YDb4euULYj/GMIMikR+EDZceXnz0=;
        b=xaH2QTjCqsdkeKQhVPV9yXNfD+XnLsRtWHCJmnbov0exqv2kVJEPmA+Z9tJaLlT696
         yla2rPqkrTWbZ9TqsxHMV9jpdYWGUH+JuaixbS5kHok3TgEdroTbk4UZWT4iy6nUa5vX
         wawKQrPj+StVjyBd5tJve3varaaE47GYS2YC2HSj46hLqY3Ebem5Q+dW+WePfXZ7I1+O
         zFZG5yWzK5PxqlvdAvJceV5RVSqQu6m7tY3MVKopWJHA2DpUAXaXyyIO0N0dQbGjbW2P
         0tfxA2vdXaNSjMv7s5iZPkjssSZ8XXEN/T3v9avdUCPFgd0fVuf5f0QbWrv2CMe2Z/ur
         3lhA==
X-Forwarded-Encrypted: i=1; AKwUvBw4S8Jiq9490z/T2bQd26JAjadLErNNra//eZwC/iqTP8A0hOZErAbp6QqUX+zU5phV266RfkSLoZARg6M=@vger.kernel.org
X-Gm-Message-State: AFuF++kyr/dKo0PiGbTejF7W/EFUCq0VQYVubUTuERE3rLfxyYuYbFQX
	O7iNkru9MOlwk38JzL++cTbUcuEesRjyjVWyT+z4q8fCsX5x4LtxjVyqdcY+rdsqk6FMdRu+xZB
	7uLjJ2fN/C+Ea7a0cBLu/44rbvL7OAF4dJyDYv1wL9naBsREt538rpm1QGNgyLUxgRLpncfaKQw
	e5hkObfQZhpgMUIpCvGPUkMFUiG7PdcH9SDHd5znDo/g==
X-Gm-Gg: AYBFou2MzXMvDGbNH9cUiz8eX9Y28kb8dP3klvKfDRgJE2v197Y9gbqUMMxJ5jtzwTJ
	o1VMyVebFIGtR3VMvrOU1/XNC5/G+bIdXBhXg8V/FNMhptvbLRKxDn+yOpiXWsMB59norjKH3pN
	h5MwUVPHK90kIipvNvZ+vtdXSObej0e+NcOuzIv5Qwegq491wljG7gX5eYyQ==
X-Received: by 2002:a05:6a00:430a:b0:886:29a4:a00 with SMTP id d2e1a72fcca58-8874b357ec8mr579680b3a.47.1790760030645;
        Wed, 30 Sep 2026 02:20:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:430a:b0:886:29a4:a00 with SMTP id
 d2e1a72fcca58-8874b357ec8mr579659b3a.47.1790760030158; Wed, 30 Sep 2026
 02:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919100408.113979-1-ngocthang2710.1999@gmail.com>
 <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
 <CAPx+jO9iva6YnKba8aEuOHURiZKjh2+wvhfC97bZ22UjGsXgNw@mail.gmail.com> <20260929161228.128616-1-ngocthang2710.1999@gmail.com>
In-Reply-To: <20260929161228.128616-1-ngocthang2710.1999@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:20:18 +0200
X-Gm-Features: AclHuK8jHONrdOCeZsLZItG4tKcWfeOo22urrMSWFA2-DdVmhUDJGdy_KmDXg6Y
Message-ID: <CAPx+jO-FBNsZFvfep-2SpqDFm3kYA=RpcF0CZx-kj0XH2juijQ@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: reclaim the request before freeing a
 timed-out card
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Raj Ojha <rajojha047@gmail.com>,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: LQvZrfAJONNkqlsRft55Vddtq-X0ejIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX8dj26AzraS8f
 A68rFIwKbNTgavY75QW1OLaPVTBRp0SgM8e5bDvDbaOTV8aZOgOY1vXSezksSEsvSC98H1/Lbrm
 ACxEo3omaOH50ewIjqqh8qAp+oJgZOzDDSOXKWzFbQa1WGbjDR4m17uYH1QlWKVAa84GlOA0RPQ
 3UL05Wmvh9dBpGxXxZ1JsPhF8tc+SgCQhThuPs8JjxONgunKN8DHJtYDqRhaPSjygPWN5KHzn6e
 kBvvhhaQMqfC4kHU7seUugIgS4V/+DFWzs8wEIm2gbzVH+57Um+MZcJVRDh2O99YVQuouhnmMPP
 ZW88AD5HMP5fNU1NljJbdkjXHfhRJwGsFV1/2RIiAZp5oUCK+BDBi+4xJxoTjilcvDSOfyUPwwT
 5d22Jf3MPGDkOPsIJKPDrgRsShyxwbe7172/7d+snDfetceIbcWRwxFNrAi8Yrv84fqwM2pPx/F
 Nl61Ql9EzaIloU/xipQ==
X-Proofpoint-ORIG-GUID: LQvZrfAJONNkqlsRft55Vddtq-X0ejIT
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcd45f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=KUFF4FggBersskXqLM0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX+7b4YjQXAjoE
 veKPKSOL2+4qhz1Rr6ks7/9jTIti6Imv5iumu8O+VusAedQr8R2UwcfuZiHG3hdP8I2fkcpShOX
 JMOFGctkE/x1jy/ILUn6Xeav5yfybkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037

On Tue, Sep 29, 2026 at 6:12=E2=80=AFPM Nguyen Ngoc Thang
<ngocthang2710.1999@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 12:57 PM Ulf Hansson wrote:
> > Reviewing another patch [1] for the same issue, indicates the memstick
> > host drivers are already managing the timeout themselves. So, even if
> > your approach seems reasonable, I decided to go with the other
> > solution for now.
>
> Fine with me. Raj's patch fixes the UAF in my reproducer as well.
>
> One concern: it is effectively a revert of b65e630a55a4 ("memstick: Add
> timeout to prevent indefinite waiting"), which was the backstop for the
> rtsx_usb_ms remove race that 99d7ab8db9d8 ("memstick: Fix deadlock by
> moving removing flag earlier") only narrowed.
>
> memstick_check() can still pass the host->removing check just before
> rtsx_usb_ms_drv_remove() sets eject/removing. Its next request then
> reaches rtsx_usb_ms_request(), which drops it because eject is set, so
> nobody completes mrq_complete. With an unbounded wait, memstick_check()
> never returns and memstick_remove_host() blocks in flush_workqueue()
> forever. (cancel_work_sync() in drv_remove cancelling a queued
> handle_req before it picks up the request looks like another way to
> get there.)
>
> I reproduced it in QEMU with dummy_hcd + raw-gadget emulating an
> RTS5129, widening the window with a debug msleep() right after the
> host->removing check and unplugging the device during it:
>
>   INFO: task kworker/u10:3:65 blocked for more than 20 seconds.
>   Workqueue: kmemstick memstick_check
>    __wait_for_common
>    memstick_check
>
>   INFO: task kworker/1:1:33 blocked for more than 20 seconds.
>   Workqueue: usb_hub_wq hub_event
>    __flush_workqueue
>    memstick_remove_host
>    rtsx_usb_ms_drv_remove
>    platform_remove
>    ...
>    rtsx_usb_disconnect
>    usb_disconnect
>    hub_event
>
> The same test on mainline (500 ms timeout) recovers fine.

Okay, I see. Thanks for looking into this!

So we are solving one problem and re-introducing another. :-)

>
> Since memstick hosts are expected to always complete a request, I think
> the right follow-up is in rtsx_usb_ms: complete requests with an error
> after eject instead of dropping them. I can send that as a separate
> rtsx_usb_ms patch on top of Raj's, if that works for you.

Please do, that would be great!

Kind regards
Uffe
