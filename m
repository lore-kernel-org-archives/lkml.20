Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402101;
	b=EdmSoXE5eAXxTm4aiimguZ2bAd94FiZ0hMtG+Jm0jKRdlCjbYNFCxZFwwB4Ek8Fs0lHq
	 onvXKlvPpt0iDT0n5TEHW8zmLiYUD6mDzvC5BidFrFZLibuIFz6NIEKLGHF3ebii0LZEs
	 WP3dJ4EX/sXh3xbGnF1BM9V6k4iU4w7w0Iy4eus2cE9ScfjHsSCDLv0n7hHb3Glnxixly
	 znsa5gkVRI47n9oh+t4P/j393UtaB6HbWVT9XsjRnk3xsMV4CKRLltfRJ7SsGbNvsTsSw
	 X3jd5Lgek4asKpi2WHuOR1xer54nuz8d+oZ+ItXfq579rDU8jH3z2rt9xY3o3P78WIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
	b=rG9iSGg9/vLfQkaED/vXQTHzK1RtUu8mbjYgtRSlAnhfxsVPv1AohZG0uyjlxLjChOGJ
	 w0cj64F4DO/qfqNI8c1Wy/x1wSBTFUyvVud/9KIF0pk0rFoLw3xfuKNVZiB/J1jI0en6U
	 8uhYewtlSwO9ghGwYYIJld1f0T6kG1rXtyC5nrOwuFzUqNmmB7X+QQrQidi7RKCbpTN5Y
	 Bpw/SJ/sQels5rVcZvOAy2C2cXAiTxZ9eU/N4o6Xzz6WqXGAjqaeTb/jeX5ab8Vx1EgBy
	 /7tKnusC8F2YAQ/fD6yqe2hSEsfTsLWwFwhRg7Fu9FOX4efPRd2uyb1nXYO9XJcTaIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D5C606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZTLp2975973
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNNA5DINfFRpf2eORoYgUUVl
	bLJUUgtkmYcnEbAYKiY=; b=p6q+meWfh8pxTAsOPcNqXBXxXBRbH+GJDC4uiwKA
	LJ5hYTCU3/k1FKYji7ugZnbHErDA5WuhE5KzDaz8lgoup47Kf0aitPgAEw3rW0lp
	tMtswTpUYDD8q4tClQtiOBprE7ZUy4pXagV9SgI+lMAfwYQfVHVebO5KPPIcUnid
	chmnqaobA7mVsL+v/gdx+NJL5U1KFoj9M4mB1lr2ZMcQaWN29IzteadEmIgwVhrK
	EIpAcU2xW1xN36ygYXdO+5SKN19CrB5t79dsRs5D885Pvk1tYO8MeB2FCyVs7Qv2
	wejjCK8v+qWke5jhjykBYz7/jQCHfyyuSVzlG19XahwgNg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbvj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:01:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so2680128e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402099; x=1795006899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=ahN0AjmkD63PvVgeHmTW9R+4V623g7CKUjFoxTx/rILg6XoSPLCx7vdHPmEiblcs9+
         OXFKV7KwAzlj2DLe0CbFaW5Bl+jini2AbY9yNuUlleNQsjl8UoD/rLmNakZWu011wDRz
         38XM8LokSGsfwigtXiC7FcGwIKOc7I2XZxri8d7jzBWcGK4gC/ypzwPsIgP4XWflydYe
         RvqfloJW/9ugMzKTVIOYs+R/w5gem1fhgrJt9duQl6Q62scnAmDmH8VUXAEEpO75agNy
         j8BI4XUxTGkuy4yAazi5PoyFxyec5jlQglS9mkW6IXcVyjrruY5FmAnPRdATuGlT8Bjm
         HNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402099; x=1795006899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=EeHQzuW57LGARr8iQxIA7gzSrGMVv7NBKZFOfo13xwtKi0rrsp3IAVlPRl5Uiaq8U9
         jrtPZf1vD2QwgvD6HONAg4WOmEcNXG8SM7uHb6qVydWAguzwYmM4u7I8rFJyaQQOiPGh
         TcaDaYcsQ6m60NFmS2y1XfhvuCZElluupDqY23TBpl2oOpJFai/U5qFcEW0dYfJ37Af5
         XOeoj3n9MGoFNLsLK1D1lLj8ut/JbUj+aZCx1BqBodSE6zIfLgqu5/fK2AJhX9Os1m4E
         LIoUQoqjVUanhr1zzIdvifa4g7eYNMOfJr0e8/CuqjHZg7u/w3BAoXkF3e7mO/ohCTiH
         GeZg==
X-Forwarded-Encrypted: i=1; AL+hErEYu8ALzKE8wTv40vnHfun9lPzjUSERLzQu/X0gq+B/ASu3lXzr+BtSlksJ8jgIjiUglXRhL+AV0rixRGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NCh2riT+LaNgu3lN1EtPW+t3G7/nelphsfzgFDtR5wngd2ifI
	oln4NaEaVf+I2yOx3c4idDvfqbmM8T112GtN8teXKf9DGUKRSO8RXYnZ+JiPfh2ItuB6nuw5ijx
	Xez59trAzOo6EBGC9jQ4lVc+79R7SDjpY/r9M/QolXS+xaHABw09HujUfI3PvG7/mcAX+DN4/xz
	I=
X-Gm-Gg: AYBFou0RPl5xQTCiiVzp9srGs7qsXFVmyCY2MtKY95GuX/mgM4B2nP7/QmoRBSvcAJ0
	ji3oiS4CVUDq+EsXqOxAR6zMDmYFn/p30iez1UR/LRk8H6HldFq9RqkNqrPEw9gYg8WB1gl3c9C
	QfRJfCYUxWtXkZ7fTg0Oi2YeO9X3KwA2AYLSc43w2SvMTnEg1x2yn5RnbwoW/lPfX+mB2rQDLdM
	ftaGJYtMn5/X7A33ReDh4c2O+ZyCbh5iw2PBgNuhJ+Gk3gy73DZMB32aN6FSp4dT0hBTFDjJD1U
	l+uVIubwGlsbpid7tqTDfaoHIbONCo3zBtZStVBE+t16RMJSoY9zN2YPJ8xVcMgNYngS7gGl1Wo
	ZOFmjtIW2ekq/iDR1Twm6NoaBZHVxfHVCwk3CX9tNJwP+bDV1aJeXwhBjWalMetcyqJ8sX9P8Ku
	P56w00jq2b/VGZRFJLqTij0kP9xZAlJOLhkwJwpllsY0r8MhXRed1NHgsEM3eCyw==
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672583e0c.8.1794402098892;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672510e0c.8.1794402098347;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a657sm947505e87.11.2026.11.11.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:01:37 -0800 (PST)
Date: Wed, 11 Nov 2026 15:01:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Message-ID: <h7j7lyl6d67xfdw3gyabfngpurumbqd6fkcvuhyi4juashcx5r@egybwhfdaonn>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX550sXisABWDh
 Ugmi5z4ZB3b+mjVm4nHuvdGAx3aSwTdxEo1fZOhmcKMZaJ0QKvkMLiUqztA6hdRYArMEmyeBx2v
 payRRjuoxBOEKb8Yh5FqDmKu0wYXTcM8hDRbBK5FAe5XFsFEYAdA76UDwHcYGFlNZhTf6VxTtjX
 tzotHrTKGjGla+JRutIHVrLlMHPJ3WcMeeK37dR1okpdems4Y3wRpP2pE+nIw+lvsAdkj9CMzXo
 XAop4smHsPaqk0+f1oyeVuAYHEVGiCnL89dvGh2Kqi2Gvfm9DtiAa0fS8Op/V2MrHSK7ucpn0GP
 Z198gepX1tPD03/6wAUWm50axQCYjPlC2QhqcVs9sS7+gvkiGlsdkngEEbZpROkAiIa9PeIZ4jK
 1SdY4CaOQi/miUD8O2Z8xvA4e+SuBkI6KqxIJ2wKVWciS7XjPI95xkuAJYHuQ6K9UbbRyblIj/6
 WqMEoueYkkxfmMBh4mA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46733 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ycv8Z8E-TvjlFfbjzzEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: ldOKOc2GZ3mnoze1ea45rT6UZA7inv6r
X-Proofpoint-ORIG-GUID: ldOKOc2GZ3mnoze1ea45rT6UZA7inv6r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXyr5w+Tcxg17J
 OK98TUyCaUVeWdqBLceCJexFyIvVaLBHh5VJ4qGYfQ3a6Y4dEVh21p+janZQ2idPiGhH+D2aNzc
 /YOgwZaSgNvr8B4CxjOC75jytvro91g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:23PM +0530, Vikash Garodia wrote:
> The series adds support for recently introduced property 
> "iommu-ranges". It adds the required checks to error out for cases 
> which are not following the schema definition.
> 
> Iommu-ranges was defined in schema with this PR
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> The patch series is being posted as revision v6, since the patches 
> were initially part of the media series [1]. The patches are moved out 
> to get review comments from iommu reviewers, which was otherwise looking 
> as a media series. Happy to move this back to media series if anyone have 
> any concerns. 
> [1] 
> https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

FWIW these changes are also required for the DCP display controller to
work on Qualcomm platforms...

-- 
With best wishes
Dmitry
