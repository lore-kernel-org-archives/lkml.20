Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F151CF76
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175836; cv=pass; b=JZLdmQqvBJBgNLF9iumlE9sjqEk3+tzJ8MVszkL8BD+qnOe77OJEyGgBUn1JRQt8BNaX0qtmxbywwYFAJ5+Pc2aKuDg2/7D+mYRDuZ2wQDv+E6szAJ/+YtxfcMe0XbdWDHesKKTNOeVmH/NM+idEgMD6mXifOc+f3/enzb22DP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175836; c=relaxed/simple;
	bh=QI54wB1ZRIPwwHHM35cUuk4h5p328r5xKjYJPlaPtMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P10/l4/LTPAVBNRS8vr5zWfu/DYhsN3eL3/q12tO1lGwUl0X5vZ3ZhkQdNTU+vfwn8+IIan/GHHnOR81tZbiHNLD4/m3X2BXZh6UtE9dUlDFUNboLRAOHGISeQkUSmKr3ukcE+wZh6SwFTtdBErsyFdJ/DLp7W+adcoUS5A9tSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEl3D4b/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBF7HmFL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEl3D4b/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBF7HmFL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKpAP2056305
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=DEl3D4b/MaQwai3J
	Rc+Ru+AqBDlYi16WsBv2QLOrZss1Lb1ZCPQaal+Sle+OwKskQ+snUYVyT+yNJ01A
	F0EN9a3fIwy+dh6RNxn0j0O97M3Ghajsv9xbNbmZIefIpu6tVOh518WaktBrsTao
	6oeuHsh2TUYpTtNu8TvZJ06p0huj0qVwZHVOIFqNXV2mYmroJ2YVyYD+mNDEY2PI
	WEpk+pNxxufNYo7Oc+PmbtPBI5IaQRShwKSfQVexsbeZpIm5nyFeain6juIhH9OA
	hY3neNnzwcAqrav+o2rbpDeQqiwC+IhDhfPEydTnYmOV0kgpTGZ/E/Bxmx4bY0uz
	XWNVLg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0fth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:03:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a10c3de1baso912537137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175830; cv=none;
        d=google.com; s=arc-20260327;
        b=C1a5QEEdvgR4CjuJHwPn9MApKIXgwRW71k0COEIzkx2KqUH6BK7UTn0jYDnVVU83RV
         /66kUMyH2Z6nm7Bj54nzL8Gufp6VlYlL3Pq21MDc2R9iGfJDyc/8fwQQFpQbScs2qI/2
         UapPgSZbav0TERIlm+lnPulVSUFTtOQX6DiBq+wL2GiqkihzvEki8oLmktW+uglKiDuJ
         gf5n9RQZLNneqWMNy1kvkS1q5E27mxh4Rk3Yfbm2IRXNe+UoqPTlVIOk1K9pXtD7Jxh7
         VwMgU5m6Qq4mw43vwK39KN9bklVrwZubGY02rSoq5FksZEPE/7Qnmz79ZjdeWxLn/CRa
         GuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        fh=hOptPX3ZHOgJuZ+sR4EQQmrscyVLcLB/BQL8gJvZ7wQ=;
        b=sA+bZrgbOeBCAVGsX0L+LQ0/zBuriZgAkJxghIrauEWijxIPvvczwO4G9agwpMzRpW
         AbL2LrE20yw0AXEV8VHKJ7AuqVC0dI0N42EstIx96w2uRqKB5pLSHOexkJvC/pCDwfpo
         BxfQhbeYET6skzjiegUAc++9WNQYor7iXsVjnC3bDv6rXcskgpNL25RgWwbKyQSScLYx
         8ztutOPtLD59rQ9J4uHsv+XZ2n0lBhQ8K8SobKtOeA/fSIn+PyiYO+tar2pkfDA+Mu8w
         WLYFjxv7K9R/vEdTrhOfdAWaytsFTDRdxGs9RbtPOxJOBa8bdsoMiSg80BaHy4trayna
         LIXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175830; x=1790780630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=YBF7HmFLoLt9wb9ovBAKGcbCe1sK6Inl2TvkMT4HFvH0FlMwe2g1WS9m1uwoJNUQpb
         BBobsGcKl1RF/WfZ34wdXzeIeE6pRDuzRXDaR2+dlGLbCzRCw2DO3ZycN547W59IrJ9I
         qknpHmnruLWrbs940qIT5sdcwnBywQ03JcoC28s0+j55ExG748/KhMBQ6QwetK6pZK/a
         TAt3JIS2u99z1vhqh9yZrPyFz+j5oHU9qilf5BqI0A+IFbeh0iz8oSjf/SwT/BEBmkJS
         RTHvcu4xLf+B9TSp0/MYSlgnXsI/VtI2ZaLSY9ZRpbR8CnEYuttp9oC1oj/hfCC8q7Kk
         z64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175830; x=1790780630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=LYTxD/zcnajYRs94h2KPgP3/5k7BVZxyACrE4TcCwiRJ0OGtUNOWWxJ8/mLA1fvN+J
         MNVtIfU7rw4sCR7Ebr7TJ9Bw1Du6E2b/kKbQ3Qb5p3tRpIU+TJQP2Q2B6/iK5LLv9F/8
         PMZa22r28GkDkPgk+c4vbcdC0klxxjLnM/TZu+PGNiRhaYaqJtaiZwCFt4K4Gx7hKgGJ
         6/MzkvxfwuifhxZebeLcnKu7Rg9z/Om0tZf3kszRD8kYFxYhxsuOUTrlslVA9p15keg+
         yNwgtfIYKFeDQX/b/Y1e7PLdSiiQEKorpjRGnDBgyjSX5dfDKvKhPs8y2DIvKE70RXG8
         f7cA==
X-Forwarded-Encrypted: i=1; AKwUvBx0dMn9H9jvd1bOAr2f3BVd4E0LYUbbAMRjd3xjeFoteWtQlrc5yUv2SXjkSGz8HkuKF3aQ8UrGPuX+MHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m4YlYuZd5pue059gb3SsYz/1jofWDDToTsUZXOM7bk2Qx5OMr5
	PEx4kJsj6GPgnnAH1ZN34dR8lrtZ7joORpNatW/jAkAnjLu6Gv8DLYenO/E+4Tw46OxbM5Nk4TF
	1lqCAvPAcIwyJWs8d0/uLUM4pOrVTXFm+0ggDatDeyv3TIURCwIEPh+jU60efmMw129fTKPn/aO
	5p7n3M6OF3rEhyLPcd9AF59Ni4Us/HkPZHTKZhz9BdKg==
X-Gm-Gg: AYBFou2IkazvDhJtvGYkRNsgh/FK3ItE4KQeLXrwuE8o+V57io3bduHRG9qluBVXqY5
	xVgRPZ8zF1Xe8Xrqmmi762d/i2ApwkTy0qhxy3CnyZHXNVLFiIKb8M15hxFAYZatiEKU/4Su24U
	/Ukrayloi0YHgpVIoJbKEj2Hrsu1nZwGiYv1Qd28Oz1EwtRnbXfSFhBhZErA==
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7ac1cfb78f8mr2788534137.26.1790175830189;
        Wed, 23 Sep 2026 08:03:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id
 ada2fe7eead31-7ac1cfb78f8mr2788466137.26.1790175829576; Wed, 23 Sep 2026
 08:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
In-Reply-To: <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:03:38 +0100
X-Gm-Features: AcwNN1Ug9EBugFkjb8PX3BJuksaN57IKAVy35yQBrKwT5dMg_Iz0UHaPN9Wobrw
Message-ID: <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX/Vu6jpz2A1Uv
 ogrk+1wES45lDaFB6bKe7gcIXn5KYR78+gvMW1ij4u1x/9Pr56l25chlPNqOJ4d/PoFcViC+lSg
 iGOQTDnhWM+EM45cLuB6jarW/yoL1X9MHZHY0JaWlIs/CGrLWHNZOB+n4YCp7cCTkx0sbsHPD4t
 vfY+4xHsgwO/Thjih3FoPQLUgCKxZxIoC+/GP9JCByu6feBfbaLl47HMWHtnOQFGV6rT4Dh3omG
 z9L7z2BGvUUvT7xhYq6Wm1ZAA1cKnnjJ/HKQwjcBnA+ZZ3WPrP0m5DlBik74rgeBIsb/aN31v3q
 N8Ax9YYWjH2RA41MIth4W2Rtk2YPUQQwp0tgQ0dRlcHPfx2FQEugF9eczV39CDTKALmvM5yw5tq
 M2SFmFJxI1hD1KRx5Jht1YjquUVA1S9HExd36DSdpEgA5okVBlM0r9sIusVqB7wAtjb271kj4fB
 Sa+4KLIyI0folW/6jMw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3ea57 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=astPFzNtX3-rckHXrNEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: dBwsrr7FSMR7wdSkZz-YXJny49Bw3xZ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX/8oya9/o3gEh
 uiZGUtYkFyhqQOCH9xJcTtnekj63Oq0cNvyI5/So9/8OKvQ9867C3fHQKRkJVnKTdM4NQG6xeas
 K51Unmf0HgnpmpVwkjBtDzmXiCNzLJM=
X-Proofpoint-ORIG-GUID: dBwsrr7FSMR7wdSkZz-YXJny49Bw3xZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > +
> > > +/* The offset is chosen carefully to not collide with the node ids a=
llocated by
> > > + * the remote nodes. All the remote nodes use node ids in range 0 to=
 0xffff.
> > This assumption does not hold up for QRTR V1 headers where the node ids=
 are 32bit.
> > QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely lar=
ger than
> > 0xFFFF.> + */
>
> Does that mean we have to go back to my endpoint id patchset?  It's an
> option, but a quite complex one.
I'm not sure. Last time I tested the endpoint ID series was its v5 and it w=
as
functionally acceptable, and other than switching to sendmsg(2) instead of
send(2) and sendto(2), it did not require much changing on the user-space
side. But as you mentioned, it was/is complex compared to this one.
>
> However, what is the likelihood that serial number would clash with
> these host node id values? Maybe just adjusting the comment could be
> acceptable.
The chance of collision is slim, but still not impossible.
I think a solution would be to treat qrtr_host_node_id(idx) as the
preferred id, not
the one that will actually be assigned to the node. And before
assigning the nid,
we check it against the radix tree, and if it exists, we try to probe
the next available
id (so an IDA). This will also require exposing the nid to the user in
sysfs (i.e. /sys/bus/mhi/devices/mhix/mhix_IPCR/nid).

Thanks,
Youssef
