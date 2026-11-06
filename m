Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983312;
	b=1uhOplDCShRKd5IDprdvWFMXtAUv5hutmF9zOZKTd8gSA1/Ua7vxa9BLOOUFi1LbMZkD
	 rXxZ57MFBghIREC2c9fL1mbvOfvaTyeFMBUjRmVeXawgAXa3hGfdyjzq8/EtMOrlQ0DHJ
	 SUrH9tfH1tCr286gbUmzFbzo7VXdQFiV4EsZxymorSff/EEWlr8d0ywO8ETbGFT62f41t
	 lnOyiZDy1ibTNrWT/FrqqSgaaF2e/WEayZxH5yJHprCxIOTuus32SvyEkC1OKw+VweemC
	 IY4ejBJDIQk+TSU5Lc43knHIfAo4Hm74wqTvdZkFYWppFiD/i0Kpnb4+5tk+3Ir+eIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983312;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=Qi4tRF3VXUVHtFMLZxctH/E7kZ4hP3nNCWedSjBpTnI=;
	b=Whqk9w3TIuNpP/NQWaMf3IqMI5vhXU/gnIpTKxZvKRWHJ1KVbKBZv5JCTwrB7iSMa0AJ
	 Cb33aFyxmE2v6idr2unhOjq+Ao2LTq5IqVQIWX/e0bdjnuRwzgCH21J2b9aJ1D+VDSN5T
	 Am91mABxI0iUACDUlyWSLw5q2vs6ewOWC8FyNhf1oygS9C32XlHmyn9h+XUcOebmgF4S0
	 kr/7Zpe4RFvw0Fw7fWyYbLpV6Vd6ePGt2mcr/3Ykt4bPTDvb7CYRDA7Q/9mdkoagsl/ac
	 v2rb9AexIDFzItvXyY4p19DU/mdJ3vUqLXXvBIzFKbo8TOdxztbFg8q3ZdY+EgcrH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA731606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA731606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6GXAKx1068471
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:41:51 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r6n56h-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:41:51 -0800 (PST)
Received: from twshared16865.02.snb2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 16:41:48 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 1111B2E8C8119;
	Fri,  6 Nov 2026 08:41:35 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        Yaohan Li
	<shunsheng1218@gmail.com>
CC: <mkp@kernel.org>, <linux-nvme@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261105114149.970315-1-shunsheng1218@gmail.com>
References: <20261105114149.970315-1-shunsheng1218@gmail.com>
Subject: Re: [PATCH v2] nvme: stop asynchronous event work before ANA
 teardown
Message-ID: <179398329505.3869217.16360449942486789550.b4-ty@kernel.org>
Date: Fri, 6 Nov 2026 08:41:35 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfX4Juq+d9IUqtx
 dDowXSi+0OpKEjoKXNAaB/PS/plwFQ2iJ+2px/fRTDYoHx+dbEgptQ1subEq/SGN5twkfyGJIP+
 HCsstqt/7ZGuDH9fz8s6sVVgoieYBNUZJSMWS+B+6oMFc5XDTT4cDarHIDEe+7ybLZzxqqf/kwJ
 /XUvrXuJjJDDB4ss4CHzwwUk9b94H4HLhrJi5NS+rjJ4FWWvVLUdNs6icfGASMrSKQBsuk6SkgD
 diYebK7TY452Ln81YfG4EcKplqu8rIlIInaJ4AEOfo6tMgtUNH+hkQXk1rBUVcsN0aj8yCVX9OP
 nYbmcCHfwgeUR5KQv0kCY3iSqbmFTuzFoIH7EG2qQWsLb8NVKWGc1isAWHPnffKluJi0xGae0iA
 IQ+QisDgDaGmDZ1zc21gmPvPeROenqUcTyqPpbR2Apg/Kb+nD5azreq9IqFGkdMNIkls5485xKV
 orbSoDNOhsjzSTmXH0g==
X-Authority-Analysis: v=2.4 cv=IsGL47/g c=1 sm=1 tr=0 ts=6aee034f cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=VwQbUJbxAAAA:8 a=NhGQEf4IzQLqQlViRykA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: vozk-JcbFGRHUKzn9KQgnm8L-WgrS81k
X-Proofpoint-ORIG-GUID: vozk-JcbFGRHUKzn9KQgnm8L-WgrS81k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfX0UFUFb+BqMvZ
 HaQiC+LkgpbUAhO13onoYe4nw1p7SkwZaVw8XyscOytzKA5RgCDd5OirjHQZGH0dUh5M8bsogrH
 ymAB6jiw2k/pkajYSidv+/QKYD6YAyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

On Thu, 5 Nov 2026 19:41:49 +0800, Yaohan Li wrote:
> NVMe ANA work has several producers, including ANA AER completion,
> namespace scanning and failover processing.
> 
> An AER completion can queue ana_work for an ANA notice and can
> separately queue async_event_work, which sends the AEN uevent and
> submits the next asynchronous event request.  These work items access
> controller-owned state during asynchronous processing.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme: stop asynchronous event work before ANA teardown
      commit: 9b657c565984f28976b1e471e3ce2f81cc269238
--
Keith Busch <kbusch@kernel.org>

