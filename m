Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008796;
	b=tt1DUoTwFxJ882zMpq3kY8sWrDuEB0n6gMraPpiEgXM9kln6lWmnrm6OAOdMTEwDc3C4
	 c6GFc/Mb+t+y42iKI83RdJ7Xp5QXtMiJjAPNQVUjW2HTZY6XGbJXVZcp6pGRqYXw7K9Dx
	 +nLqBrcKZhQhaNsV0IxBY6UnfWGKW9Xo4p2kYJRYoBdOH5ydWm43Y9c7pEWPODHQ+A7HJ
	 mNSR71jreqx9U4XKVgBavZwR3jiGw15G1EcbvdKnqJx7yFEIC6hmL0A4P7uX84+tovQ9+
	 VC1oBhHFDKW7wvJDrfD/dxmUYtVbM96uV4aJhw883O2U2ZcKtQVaU3zsPSERvTvVy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
	b=trFVbpZmLkLB761oDmEEuTlmsORxMuePL5fAYeHZUHEuUwqaKx8LpPIHp204cwSjXBKX
	 Nvoo/PDq7tJD6RGHRaD66Eppo+rsMpxDZTPZi7G1a/Xb06+YkfxGwaJlWmtDILnqO5bTW
	 3tnwNoK6+lBCFqGsV918eh1xvRHgrta0aaksvkZbuKLZbYHlQpF9sdMFqzp9oo4P6j+yi
	 6BT1NQPj6SGJB6OF7FmGAxyRNqt+6zw9P+jwMbR3kS3ko4soOWndQbmxoInl301otcjHG
	 juXLrFSOBs6lsWehEbbKb8LV6lgFRr/RhpuwPMtCfPcP5rJZtlBkMxABZ5ITLaWZ/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4A606A8ED
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE4A606A8ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auOk2255122
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EihPl48XyzquhIbKjuEyAajD
	35LkfbvtwIfgKv80/jQ=; b=duOPPQmSNBtx6zhy2MyD4npHJuJX7Gm6wHBXP8ce
	gso6SBXwNnKeARLD/e0CobapPe+Pf7ies1PCMX8l0Ug5iwRxIVau+SXTqeR4fsTE
	bPqNxK1Bfn5d+FDp8KiVM+Bp+TZkWsYiaO5Dxo3FHoaEt9Yu7ndZYJNRki6RGyau
	e9TqyPtI9Gei8s75Mu/XbJ23qlTZsPaJIRg3qr0eUH6Wvuq+DaaJU5SFPTDHFggF
	7OibQZR51kSYWjQNBxzIW8c0qzGWVc8rErJCz0VI/N1iO4JE5O3EbCK0hg/I3CsL
	BG8uaN7ChjqvVzPqPBbYVSwVAksgA7o7Ey9Rzt7q1IwiOg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nsps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc48fbca26so406613137.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008794; x=1793613594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=Lq4wGaDOBpVkSPMT650pzVDZ0ZdqcSGrAoZzfFFdM518fJR89ZIGJx6eXL4yL13Xrl
         9oCqAU0R7kUVi1UhMw8akonpcHbyZwFuJSqb2u0tKGPC3YAvtla7H51NOZadFUZSmL2Q
         r16hd6Nxd/2pcqEyFFpl+3UUTK8ynsmIJlWYJhXm4y/6UIroUCCKK5bS4dQlsFUeRuZD
         +7dv+Yy+eyqDqM0WLJ19pWBstqB3OdBiZ+hFQNu63MhCIR9KRwPkVXUIAerjgns2bfb6
         l4jF9umI9ok5cQKWo5grKI3y0p/QZRQ0T53+Wdpe+LNpYXhCZaRkEVf7sKuP/riR2oQH
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008794; x=1793613594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=U9xKw8jjgTe8lQ7ZYOCzDn9nkB4ciiNgoEtXjgBvwYQiGt9TJH9jOCC6g2sMIbT0yw
         9khFoZqMgX6QaJYVROwtjcAVomgPMlk++Sae/gp6k8tE0jgwW3vDIATYr8cXYd/PkckX
         +5GrKCKa4MX5RWHF7CZwM/44TiUDXUXlIicYmJrwJoXb5tgGIPv/963bonkYnPH0fwKb
         dM9bW6IWJ0GxghRjFSKC3aKUbZyaY3TE0bt1Hh3Dm98nRywBuKFuYLXZmHdRD1N9rnNk
         t45Mich5dQBuanzuCUWvsY7BVJZyK+nLcC3VLV5qxQQL1uvk3qf5OK2+RBu7xsXEcHJB
         dvLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp/1pPIv3lxkg8gRrUbuI+LdujYibcfCjju6DBi6eWlH+9C0Z5QnBgNzyeMx2FjCQWMzukn2o9TZE/vl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkpWsuEgc7Au5LKCa+pKZyzQvWfcQl2Twf9y3/q6HuwEqwLIFN
	WwVLlt0xnEpZz8tiOKGObIrhBp8p+wIWndx7mLgM469A9IjF8YVhagTEzkUiIK3aZzCONU+wR1s
	54YlbAfq9rIaWlOFxuKcXuN1uBr/+lUMTeusvoaKPe0ZOe71EpU2fQG+E3WZ89eiRtq4=
X-Gm-Gg: AYBFou1oL4Q6418uMlHH/6ra6BKz1WTWaeZ2x0QxayOh6vT+lrGqGHK4Wfs0ZKxnSGR
	JI9XhO0AdI+X7FrRRdkOfGF7kAcBfvT004N2/vcBk8ux6UUQjYeza14dNCvpD8lxXDIA4s7IglM
	uKjIARZwGBJgk+w1zMKeWvdKEyDv7ITQt8kR6SbDU9GpCLIclN0w1Fo3baV1m7lxTHgjac8iHr7
	URvjfp/59L+r0ORXBCLwKNej4BiKrvs0tzEjC2cd+/E4ZdtRxquEeJ1LQ/rIkxJIyF/j+adQcuc
	ol7kN7nZndCHhRNmtX0l4AzuARivXypm0ZYI57fF/82XsE67B7oRupNhqORx/5qpN1LjwjADcVY
	8NXEn9Z0IlrCMCU8aWWCdAcBQK7OeKGYJP2J5mAL7x/WaccGr74hcQ4JiDMzmRBbzj6yvZJvEUH
	wM2MdE9ktBCI5b
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586647137.17.1793008793925;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586636137.17.1793008793315;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm16973671fa.14.2026.10.26.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:59:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <lisaligvjmnnib7gm6klab77jfzyagn5cx5pix3isodu2cjvrr@o6efvpyte5yg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-GUID: i1WdOpdojXzHkJbfZ7knIGHtPXcuGa8v
X-Proofpoint-ORIG-GUID: i1WdOpdojXzHkJbfZ7knIGHtPXcuGa8v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX5uh2egMrSK9g
 HRbr/j7QKAfYztwq0NysZxKfQipF+QZYWgX6shzkRsGiYixX36HRcpeaTDDOnX9hDqkf21WHi6O
 JK0y6guUVdSrEKSJnlIcvI7MoCBEFqY=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf249b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dTofmrguFlo4DCddnn8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX1Ur7STd8Wf8N
 U+EBoWa07rgBLlx6xbNX4QBqj3Xlp3yfKcRgvZ1kEL16KN9QrFuGU2d7n6CNF4kwYEGPFQ4n/MW
 9y9InLc6bC4iT+8igxj9E27i0c4kXasz88P5WqMU4KPxdwW1PcNV6DlndqNY+x6ZgFi47kVdALP
 bEf0ADs3ypa/ziblvCxbe7oh90HDIAdtJKCXVUkrMrwNMqLRhBIirR1QdV5xcMVyOFfYBhmWXgp
 NFfd+rkWr0hSjBjJUJc/upr/HsbijQMsNf5Ghupp5UGb8Acy4wi58xBzY1VHNHi4D+h4FO0euS9
 PDV4WncIdAA7LTt9KMlE9MRpGf1wz4tN0Bx8ycXApgphrhNg28pn2Y4rLF/BnfT/9U+37NyKmbr
 Lpplw+/Bre0NjsEoYib43IojB1xf9jhQAB/MWw2ue/90YwrooCK03JNHorkmgRp+wxnm094k6zq
 j0wyAtl2KXW2Ku9ssCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed

Can it be anything other than the DCP? If so, how would you identify it
on the Linux side?

> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
