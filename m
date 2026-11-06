Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981630;
	b=fFo92mVEBivTPrMM/XBudE14q7PwWbxtq92AeDgFRXPcv87jlFAXsUYKJeaG+wZzaynN
	 A9E8S6kfmcPdootMQN8W+2RWwWsUxGJHBy1//7hpYVx8BmGELAy8vCw92k1pnNMyHqGpm
	 mx6rqMG9rdRX/9SS56vWE8Z7RVFgPLtXW5dthyYkRFO8HFrOdgLWPdUI05UYxE5axCmbN
	 4RtDWbHMoRXqIlaF+wXPLZNQZy/gfqtJgKOEoTMjbE/qH7bWtjMfQ+YsV24WvcUm64ynA
	 voHD6yXoy6JwU2hn/jJyst/a338F9eJxRcu41skw0n4lcee9JLyfbAI7J1WTdVLpuAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981630;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=obMKEwgEXqw8e0jQPkLIcV5XJ9Ah9zsZW5aCZOT9O9c=;
	b=ZudbrHkQ4OIQaozyR0mljJIKIjgIeFR8D3qfBxACrfuDYKf6IEHaZ4oXncfZ1I88M1fr
	 ihbas6GhHEfNpZZPYdCNZv9c7ce8L7jkAttHUcMNBcHE2Rpiv+Ttl9YbG/g6kYJWaBwMF
	 dMtIzP9ArSRPixpLbeQxsPGWUdqlBwstN2U2YZidFsXp2nhIzfz1yZL5aRTRG2BI7LG16
	 aK6qetHZgc3klSzosrkMdq+5RhOvlSigOw5zbkmWMf3ueVNxOWs9rmmjDStfIW2mKCAW2
	 iwIrh7lO/+ymcH43cPO+IfxaTPpAF/TsgVrB7bcpHs31gDBnrMCr7Od48Mt5dOfN1tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78306606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78306606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A6F2O3F1024418
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:13:48 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hs3r0vq5g-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:13:48 -0800 (PST)
Received: from twshared119346.16.frc2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 16:13:43 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 8A9752E8C4A3D;
	Fri,  6 Nov 2026 08:13:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <linux-kernel@vger.kernel.org>, "Smith, Kyle" <kyles@hpe.com>
CC: <linux-nvme@lists.infradead.org>, <axboe@kernel.dk>, <hch@lst.de>,
        <sagi@grimberg.me>
In-Reply-To: <DM4PR84MB1590C08CB556D28CBA707E74A0772@DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM>
References: <DM4PR84MB1590C08CB556D28CBA707E74A0772@DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] nvme: Fix potential gendisk leak in nvme_alloc_ns
Message-ID: <179398160956.3651019.17847243207833237031.b4-ty@kernel.org>
Date: Fri, 6 Nov 2026 08:13:29 -0800
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
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=Cucq4X4D c=1 sm=1 tr=0 ts=6aedfcbc cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=VwQbUJbxAAAA:8 a=rLEU9whwvvocQAz3oXsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: H8O3svOfBS5hhRf0-oApJM3dWfXBaT9h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfX4cGy4NKeGQby
 OEPVdEYQ7kqr53K3BXYqbebqPKfuoEG1pxmoLLmeB5TDPj/3IJmESReuzNCkvvxoEqwJuWc1abQ
 Ql2OkaHCLVdFpfsDb0b+fBOGlycGoJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfX5zcwHcyLr/A0
 X3U9qL4l2b3isBTIdj2HhY/HVth3SKHR/yISP7Od9RPQ5NFgHSHSZxYoXdFOWykUWVtNRm1v0qF
 YI9Mbr0T8qjJSpmVV27IOZ+ry18Y60njw13kU+46KA3Qr6yAIVuYqWzHOz9R8EuLMWP//QxFOl5
 LxYHPS6Rlo3NI90hi9lAi0arXAARH78GfhnZGlBi2jSQMaDljbre62TzU7S5Hzf07ClTnJeBcZ7
 mT66lEZhHNK6dmdCd1TMp3/XrdvE94tw3QP3R6+KrKKvR4v1MvIpz/VAW7B2WLcQXEYDBd09f5R
 0//G5A93u4nLQvvYX/eF4dDG28yNsmMoHHPXyF2FSgQm2NrT9JGB+hDuvODeScWDHckDGUNyE9K
 8BFrUipvShGcTgPXAa+WY58fxcYD05XtoypdB6OuEpDLEcbhQ8lkp6GGwB2GIu7iKAAbl4lxi8e
 v7gbkKtxsJPVdAJp1aA==
X-Proofpoint-ORIG-GUID: H8O3svOfBS5hhRf0-oApJM3dWfXBaT9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

On Thu, 5 Nov 2026 21:54:38 +0000, Smith, Kyle wrote:
> Multiple BUGs were seen after the following sequence:
> 1) ctrl A in subsys A allocs ns nvmeAcAn1 and ns_head nvmeAn1 and sets
>    both as live
> 2) ctrl B in subsys A allocs ns nvmeAcBn1 under ns_head nvmeAn1, but is
>    interrupted or stalled between nvme_init_ns_head and healthy return
> 3) the namespace is removed from subsystem, triggering rescan
> 4) nvmeAcAn1 completes nvme_ns_remove
> 5) nvmeAcBn1 allocation returns through an error pathway in nvme_alloc_ns
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme: Fix potential gendisk leak in nvme_alloc_ns
      commit: 1e1d36e7610fc2c2c425ea246caf8ea0380d5fd6
--
Keith Busch <kbusch@kernel.org>

