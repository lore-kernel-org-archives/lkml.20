Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.156.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904667;
	b=ro+VDGx2V4FYZw2l/5xM/ILPGc4BRDPo4bHHVurD+l1fuQsgP+B1f2skVpVjA4mSUxMe
	 RY2M1opz681L+nC6v2UUsABIh7oeh0XPlP/7K3alkhCMcebHfN41SRdt0fSk02ubIK2m+
	 fLuLbyqx1nJ/gJdIz4UHDQjHQVlDSIAAcIjG/XSilO2ydaHhCytKLYNdUWdSlmXUsDw5X
	 g0qYkLVMAOE8JK/4FC9r3mJIk2fs9nQC3FxilgKaBToqSya1NA/TIwk0+2P3Ce0OMti1b
	 nW5dj5hLTOs9FQLZGLovjz/UoYUoS91UBpHxDUHFlQgIMbex2Y2DwMQ+rPTGzcJCWFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=0NyQ3KOq2IPC0mUMVnsSxP/V4cdHHSPZ09DQRrw1hbA=;
	b=VIn0BDjEi5PS0XB7Rb8qUW+X97fXU1oZnwP/FbAI1Z/bH37d12XMlcZ3GX1TqdZIpsQO
	 N8Ec9uRdCZarRWx0hz4a+yDz7qGpaQV9xVblS+K8E6cdfdODCLSvLXW93uUMaoXzUSf6M
	 vkNJR/eYGPUq40heXu71OK4GnR6leLEez+9bvk7A73KO8LwaGBmuJ9HTt5LkLqb6ShTVE
	 Oc95ujq1jTZILbygJQgHT7x1znyHoY8qhx71kwGmLw5WXYdSHayB/UPrE5ZE1uHWomJWX
	 /zqW6dgnSqnYKigSH2rbG/STFID+RG5QUB25f/gSIqzvJ9zYA9t4aEv9GAsOpmiHgUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b="SGLwG/ed";
	arc=none smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C12606A896;
	Tue, 17 Nov 2026 08:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C12606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=SGLwG/ed
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2cfUl379231;
	Tue, 17 Nov 2026 00:37:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=0NyQ3KOq2IPC0mUMVnsSxP/V4
	cdHHSPZ09DQRrw1hbA=; b=SGLwG/ed2nRy0FHgJD9B3d0RPtj5u2eGBKEP1ayhG
	XCYKKUJv+LvL10FmXkLM77lTRGj43u90FMuhBHGRHJ8UC7jrhLBGxOlPVaQC8Bsz
	EzjNOwewTR28BVUTPXHOgVF0PW3r5giFBmh775izlWNwQcK8A9ikp3l89hVZfASH
	xGBTjGz7itK9wuId6CUy0D9LOmMkQZYAiDBsEiS/dM3orPCMlG3XVMuSb4tX0Lnf
	aKHNWAiWegCf2TNyLvC8SzpMRF+U3I4obVGRQw9YVvdJT0hgSSVsnuTjZ9/gpk+7
	qEeSiSF83Yh72XaAnb8lPnylaVsdSxtGJ0ZVl4jkf1QnQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4hxr1k9nyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 00:37:23 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 17 Nov 2026 00:37:11 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Nov 2026 00:37:11 -0800
Received: from rkannoth-OptiPlex-7090 (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id CC03F3F7072;
	Tue, 17 Nov 2026 00:37:17 -0800 (PST)
Date: Tue, 17 Nov 2026 14:07:16 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
CC: Sunil Goutham <sgoutham@marvell.com>,
        Geetha sowjanya
	<gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Bharat Bhushan
	<bbhushan2@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] octeontx2-pf: Fix potential use-after-free in
 representor teardown
Message-ID: <avwSPI9boSsUEtCr@rkannoth-OptiPlex-7090>
References: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
X-Proofpoint-GUID: phVpIgttI2A_VWfw3tIMwlMORsTXlcz1
X-Proofpoint-ORIG-GUID: phVpIgttI2A_VWfw3tIMwlMORsTXlcz1
X-Authority-Analysis: v=2.4 cv=DKAacCNb c=1 sm=1 tr=0 ts=6afc1243 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22 a=M5GUcnROAAAA:8
 a=XehZxDDCrJQRP7pbnkQA:9 a=CjuIK1q_8ugA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
 a=wU6CqTgRoXS9cGK_lSIY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX0lGNNn8yVGFQ
 wTJ2od9g8YJsmBhFbKBD5aYVjuQ5jlt1GpqoSfAh+SrDt2YD+0s8T+PeTXGNL6rp7De7KaSre9a
 DLgNBGNmoFgjgD1dE6zj1Nfx2Xjs+jk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX5XLTLHPuPOre
 UJCy80eBzuEq0SLtowTFBGBSh9Bt1/0SG0UUujixc9e3M9JIT4v4957Uw1sr0BxUqTyPOkMsSU/
 fYLfCJreIyr2KYGxwqywqyZ/meTPcK5oEy3PJ1oN58C2l4fkXiVjzyRsm+z3CLC/oKweE+kU0Lh
 6IDu9rWWikVRzfonis0BW+mtq4r15AdDjsVW38Y2OG51dJ8+0x/DT6VtJoHKgON/5TMx4K+Iqzy
 UJJh3FsPl5gPItwA3MMcSHkOm5UQNB65NU2Gd/T2iotRpw48tPArm3BvM+hhjI13Bm25zLhRtFI
 OcJZaSgVQW0w1d6PJr5MKkhs2yanLbS750OU81njbehGpDF9mCeSbRj8HwFNd1EH6axLSSqdRWJ
 ZamFkHnvoOm2xuxs66xCAEf3KJpGA7aFMFczRnfYJdi+/fNlIwS+KLPe2SvT/zX83TrSjiMGjYH
 TAeLiVfNvP0/rQGglNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01

On 2026-11-16 at 19:42:10, Guangshuo Li (liguangshuo@mail.sdu.edu.cn) wrote:
> The representor private data resides in its netdev allocation.
> rvu_rep_destroy() frees that allocation before reading rep->flow_cfg to
> release the flow configuration.
>
> Release the configuration while the representor is still alive.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 6c40ca957fe5 ("octeontx2-pf: Adds TC offload support")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/net/ethernet/marvell/octeontx2/nic/rep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> index 0f5d5642d3f7..662da7fc3953 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
> @@ -638,8 +638,8 @@ void rvu_rep_destroy(struct otx2_nic *priv)
>  		rep = priv->reps[rep_id];
>  		unregister_netdev(rep->netdev);
>  		rvu_rep_devlink_port_unregister(rep);
> -		free_netdev(rep->netdev);
>  		kfree(rep->flow_cfg);
> +		free_netdev(rep->netdev);
>  	}
>  	kfree(priv->reps);
>  	rvu_rep_rsrc_free(priv);
>
> base-commit: 2e54b3e187300893688c2c7517894f5d96732e05

Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>
