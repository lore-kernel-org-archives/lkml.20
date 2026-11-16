Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845923;
	b=I7ATc6Oc0pO/b/DsLaS0ID30pstizXZoefc5lwYv5ZQ5fS5JRnVrIfVkSI6SoWnn/+QO
	 Ckw7BlH7MA+3s2pCDYnvzgrt1U7AeUJyfr5QDK5RDHHits+0UaQwuKXm6NGC51xUvKDN3
	 c7WGGwVNPfpYs2wuyF1PdkR+ecBGPyoNIAKWqD9QbiUQxD32f4OpTUjDNqO4dFQ+y/Ivp
	 nmCn1nnJigxqa4/4QH5Mm7su+IsxEYeuGWFO06TjWptm6A9D8uQJeM8glVr/CWjjHwaD5
	 Kxj502hE5cj2PnUHdr4CkDySp90TUk+wIABPFuiK74JlxMSNZmwFUAZ4yR/6e4KCFkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845923;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=es+zIQRw7IaTBC32drouG0t5KhieHio0Lk9afbuliIQ=;
	b=t8J35xtGA3V0OGgXlkLU730+rbI1faRd9bxnBFJAYfwtNkbRAh90Dq7NoITIwK1YdkKP
	 E7qGhki4gwiCd82nWaPwCVJwoyBVT1APIeWdy4R6crunjwM5d50SST1usd8ljxzmDzD6S
	 e4fIbBXniQ/6PBTSyrYNxSY7Kl5I6CPrYDL/QepU4fjf1RPEwKmBP1zAd2dxyvsYxqZ6s
	 SSJtCE467gMJ6Bf488TqQuscuHymH3ScPbSe/Fin398aiZveN+wMcytbA/7WJTDkLgxkv
	 rvkdPDp3yQdRXGZrtcBOoIJArMlyL4XIFBh32MFys8F9/tAN7hb6juaqS0XlVDDLaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BF606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5BF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIg5j2653387
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:43 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxnmcsyvu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:42 -0800 (PST)
Received: from twshared26372.02.snb2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 16:18:41 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id AEA4A2F08A7BC;
	Mon, 16 Nov 2026 08:18:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <hare@suse.de>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261109225914306SSjwaKCesNqNUj53kLV1R@zte.com.cn>
References: <20261109225914306SSjwaKCesNqNUj53kLV1R@zte.com.cn>
Subject: Re: (subset) [PATCH 0/2] nvme: use the parsed offset for DH-CHAP
 secrets
Message-ID: <179484590971.648177.3828440087409001566.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 08:18:29 -0800
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
X-Proofpoint-ORIG-GUID: O0jTjVHsx1cZlut8tt2_86-Cfwp88HD-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXySdZQmw1KQK5
 3D9M15Ho3+BZV+SzmoBJKx8r6y5RmGaa5Ws+NV3VsscdFgXmFmEOPniHTEcZAJH/EJZhuanKwEk
 rG73rwR0Px+IhfyhY7F26N1UPJvnaEA=
X-Proofpoint-GUID: O0jTjVHsx1cZlut8tt2_86-Cfwp88HD-
X-Authority-Analysis: v=2.4 cv=EMKTQFZC c=1 sm=1 tr=0 ts=6afb2ce2 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=Ru7rdtjBa1pdOxYo90UA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX9SUYQhi9uedP
 9TUJV+CPhtAdInHhnqg8gXUc47m96kpOP5hncR+wBbF2suRsLMq+kbDk3oU2GWol/PQPxir3M31
 4WUrAX01tJG8k3Q57UrrzyZXpceaMWgaE28BRReeuqSJ5dwPsO2BKW39pP6OocaEWtEOm0T71mE
 bIb2nsLv+Mv8EFP+lwwqzpIiU5cA41IXhb36vWuyHSIJN4UfHDGO6cp0YerXyKs00W0HZV3O/kk
 uGc+fL8lQ4Z2LyQfkXUVin3cyxGEhXsMTG43DO+x1RVuowNR0gJWzPIp/zfSZIzh5s5XcP/UW30
 pThioAiUQOs1le8OjU/F8A+gmmQ0RnD3/dM2DMtHeDkJ35dhFHBq1+ht64ngM3H+LbFTUwoCaEF
 LcyUQn+80sAOJVtqkWG18LbKN5TYC6vOIN/cZiEeKN7mBKdea22khWPdd6x6O70pqnZRcUaknP1
 Rlr3dAnv3M4TCXSRrEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01

On Mon, 9 Nov 2026 22:59:14 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> Both the host and the target parse a DH-HMAC-CHAP secret with
> sscanf("DHHC-1:%hhd:...") and then skip a hardcoded ten characters to
> reach the key.  The prefix is only nine characters when the hash
> identifier is one digit, so a short but accepted secret makes the key
> pointer point past the end of the string and the follow-up strlen() read
> past the allocation.
> 
> [...]

Thanks, applied to nvme-7.4.

[2/2] nvmet-auth: store the DH-CHAP key offset instead of hardcoding it
      commit: 62dae895f986f7459fea1deebd89a0bce76a886f
--
Keith Busch <kbusch@kernel.org>

