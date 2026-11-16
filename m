Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842238;
	b=Bg61YItGgrKFnrO5L4sZ519NY/kL/tFfyPGQDAn8QB13XHb22inxVChTt/LUFRDiMMjq
	 Radq1KDrSwyMNGB5V8/Le3dTX4pXsug73qrR1SLWet9CQidS8TXDmOy55sBkkzk8B31qP
	 SCw1b3dVaEI+rMKYyhSHAi0prc2HEI4KEzlTz9/MaTDaTH2QmRiyJwLt1cWXreNyG+zBl
	 l1bbo6ZBXfQbh9TpR0PxFShepdoSJMzY3MWoi6LhY9sBNND3UqrVjJU4AI6atKT7IB94g
	 dsTctinwrQZ5PJtZqJ+miccw8UaI/SOZvWEWzqqmSysQM11v01Q/CA5s7T4Gvq59MOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842238;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=qLE+dNHMVul46wdjyF1Bg8i6YNmerSwnDD32qfigVg4=;
	b=pSPoznNNRy0s610oX5Qzeq4Wfr8qsJE0dpgZMx6kM8QNhCiHC+Z2wYzl6XeIfAWMyiUP
	 3/9R9t+iq1SLtj6EUdXl3OQV1if2EFfYTW7SWXI+iChPc8C3UXyJSUkYHSHu7PF3FZm1x
	 JZkbv/a5VpRoRQEFoiCJacnUcl6b64sWMzCskjmjOKCwRmWN9vqbqg/C2xANvCdPEKB8i
	 SbmAdw1vimRTs5Ozn/KzMDruQzNwx3v7MQeSa+Dpve4Ew9OCaqeSfb9XXooOGDQc1XjoW
	 HTOws4FwGg/pUUyJs964Jk/hHxeSxbuOzJj8zN1epwbxjn2lROl558+TVd/apZB7HmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E305606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E305606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBxg441804983
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:17 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxp8hhy1d-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:16 -0800 (PST)
Received: from twshared25295.01.snb2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 15:17:13 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 3A6F42F083072;
	Mon, 16 Nov 2026 07:16:49 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
CC: <hare@kernel.org>, <hare@suse.de>, <hch@lst.de>, <kch@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-nvme@lists.infradead.org>,
        <sagi@grimberg.me>
In-Reply-To: <20261109142428.2612-1-sreekuttan2156239@gmail.com>
References: <20261109135536.2772-1-sreekuttan2156239@gmail.com>
 <20261109142428.2612-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v2] nvmet: reject invalid write-protect feature values
Message-ID: <179484220923.249619.10986402925266130295.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 07:16:49 -0800
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
X-Proofpoint-ORIG-GUID: YdDqgFNE8tClaxsdz9nwwxr2DpiR37iD
X-Proofpoint-GUID: YdDqgFNE8tClaxsdz9nwwxr2DpiR37iD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfX55W79zGoVZBR
 wtLKxv4GjnkIv+K4Va0C8ZW8QlDr1vyJe1gP7zl5hAYFonwWcGIdLzC+/9wLZGSPuSEZJGeaYTn
 xVGC2BwXTEr9jo/95yLMgI7SC6aPuyizdLsiuTej6qxzYj7C7cVDWBbo+uujS3QzEvAb7HZctpK
 jb3zzHmIiNsRdZPgiQZNYHFZl8nw5jRTBuJanHc8+tABLHeJQPbNie39knSYVouywL6xotrljk9
 uBQV+vYuCl2Or81xzPw2hVsxRV0yEY8dQEwH+HPBgvBl5kx84363sXGbDw87FqZLZe6txqSHrM0
 cGycEArdSQ6i4ARrlLqQY97jl7w6dM3WENUARxzI++56iIALqaAftAqb4yVlgz6P6EPtEaDj2q3
 UpceLpzQ4DaOgeTCp3MK4C8sSTWs786R7Yr/copHuNf34DoAOI2EzD9jJHXh9L5p9rOHIE65Crq
 +jXl1iEjs4pxLMQfqyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfXwgFN1+rSRRo7
 elLQcsZA6L5uHXaSm2wWvdQ/rFcFbu/AikKmvYdku/81z6ZzpEQNuEzG92gVND6fXQdGVM0gc8o
 EtVNEepgGQQfBXtFpZZ9vz8hm8AmWhM=
X-Authority-Analysis: v=2.4 cv=J+4/fwnS c=1 sm=1 tr=0 ts=6afb1e7c cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=VwQbUJbxAAAA:8 a=0lR0l2LAFdUcI9J53v4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01

On Mon, 9 Nov 2026 14:24:28 +0000, Sreeraj S Kurup wrote:
> The Set Features handler for namespace write protection currently
> accepts unsupported values. The default case in the write-protect
> switch leaves the status unchanged, causing the command to return
> success even though no valid setting was applied.
> 
> Return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR for unsupported
> values. This also prevents issuing a namespace-change notification
> for an invalid request.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvmet: reject invalid write-protect feature values
      commit: 21f0f264962358f3af6e08805b21d32abdd0e35f
--
Keith Busch <kbusch@kernel.org>

