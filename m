Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822331;
	b=LtIthJQ8NyBZZ6iPjcwrxmhZjasxHUk2rvP3VQbFmPNmouM/mDH+16GjeS24ZHNFALQw
	 DLdAECw2alOtmIMYGF5WDsryQljX6kkUhQx2w6kD3iprPrzL69oTshJhnReaj3WAj/iWj
	 cpDqBEL9ybmCdEDCgYfEq0NOosr/8ZEeKRPhLu+E8TQzsIMTDyaklY64wqWo0E3G4J891
	 DqTZgM3BYWWsg+V658nVVPZs9uGCikvFg0UjQ7BUKMWg1/UmVmaoailun6HXFy8s4Hqy7
	 Afg/18hwBGMtIOurbsFxjpQz8i8X8I/N3g3l0IVWTvKtPZGHlA3PGAUhgp6eNKIFWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis;
	bh=uwlku+mx/ylkmsooxeq12CxejkDxtyGY4wsS07M470A=;
	b=ISUWxFGxSyyBqSzO82C5TP/7daZbiTSPo1bwxpI3T5TDCOBFHcZJZfXi0gjnp/oG6seT
	 B17yWaj7PL2JDCkviNHBcqLRHT6rf0HncOUm8n5tWm9Ja15vyicJi0ENUgB2ZrFY5KyDk
	 i4CamKAJR0kw2U5a1nj02QIV1e7p2sYNncUHuAH/B5hX8CMDGMPrO8DivyKcgdES5ARE8
	 YTMKOP4ufGudLjfngYNK6Prk6+8q1F2CGFuQs/rFeyAtJTf1ESvcQ/pbwqUbc75+qSYQn
	 Cg7SJdgf3vqaoCpem+4gyuQpr+QSQR4yCUjL1OtYBWTyiKP1g5t/kvIxl91d84fERMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=tqoJfQzJ;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D23606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=tqoJfQzJ
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AG80UB23603101;
	Mon, 16 Nov 2026 09:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=u
	wlku+mx/ylkmsooxeq12CxejkDxtyGY4wsS07M470A=; b=tqoJfQzJwwC3PkKZ6
	gUJkD/4crQpXNH1Je5uJyrO4D9iz3nHBIoRBWToowjrg+/qa2UTsNlnlwM/IAbtN
	sl5adeS/XDQenKnWaJw2bSS5RcXlKEXIlkRcC9fglKtGdsBx9ht1DhTHkT8G+JoE
	cGM0sgfiUeUo9trithFisTod8oWndfK0sOcJuPBZVQJ1Ka9CIBnsVs/XsVrMZudj
	pFbJUqQ3EREQNhHk4KopSiBkxhDaEDRvoKN0ekQfDG3aa51SC3qPA3wA9GnuATYA
	Wt5z3A2TMki20nbhq3vIXvdxnT2FXpNw+5dn7a76wnI9MlkiSL50cdRSeulS2LUp
	r+c4g==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hxgky1du2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Mon, 16 Nov 2026 09:44:56 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.4.178) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 09:44:55 +0000
From: Alessio Belle <alessio.belle@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <frank.binns@imgtec.com>,
        <brajesh.gupta@imgtec.com>
In-Reply-To: <20261104-minor-improvements-v1-0-cc976128538e@imgtec.com>
References: <20261104-minor-improvements-v1-0-cc976128538e@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: minor code improvements
Message-ID: <179482229566.106842.11479170967882718232.b4-ty@b4>
Date: Mon, 16 Nov 2026 09:44:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfXySgh7owXSWF8
 fbKJEWdylZryqmvX3bUIBQ+kPmb04ZNIBvu8B5h1v6RZNcMrfhAbXAYQI+I70mdYdlFNbd7T/zK
 3qFMVJ6FBpkhbEZqeQeGeyOuNdDVFTlOoPNAx8ysOof4kfz6pgxi3tOGhnTsM6nWqhFXyYK+hrV
 OWG4/2v+17jKiktsAzIStnma2NChbv2WW63mzvJwps72sICl00S/jLLlZnO2VNqHG++MmMLe8n5
 m2XCi4ync8B6WoJYp8GDzlpKXDjsodstCvU9+i546l61SAZD9pTjip7t0zEM4geYaFzDlDT2AvK
 4yCU9Ng/ly6Qi1FM9yeBiDGVEwCEJzitR0p9GISvXwNzsdFCd8dUkFyWs67RIV/iHVXjv0HTCO6
 xYqnQEM4RHYHRh1YCDs/EF1fj+1/0Oi7zUDwgIneDSnyroExu15JpWI5DhxqyL0xfhV1ga/4JuH
 K/P7Q4hgFQeEdbM+80w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOCBTYWx0ZWRfX4jGMzxYluZm9
 wpGi6mLQnsRwqSC0iYLWU160ycpkx4wZesjP+uch43hYcBlAAmdkGTMfdh7tuqjm4pq4pSC22Hu
 l8/+yZwXcMmjxEfPCN49xM3w/WwYA9I=
X-Proofpoint-ORIG-GUID: iimnhAt8x2W9wrvm1wOHYRQEDerupV3T
X-Proofpoint-GUID: iimnhAt8x2W9wrvm1wOHYRQEDerupV3T
X-Authority-Analysis: v=2.4 cv=TbsDJhQh c=1 sm=1 tr=0 ts=6afad098 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vO48zYV2LvQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=CDIPUTPqv7TuzClm3FwA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22

On Wed, 04 Nov 2026 19:28:15 +0000, Luigi Santivetti wrote:
> No functional change is assumed in this series.

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: switch to inline init of rogue_fwif_rta_ctl
      commit: bf17b99b1139ad6cf8fe15852761f19de448414d
[2/2] drm/imagination: drop unused arg in free_list_create_fw_structure()
      commit: 4a6c269a742fc4de2d72cd1d291175186ae8d435

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

