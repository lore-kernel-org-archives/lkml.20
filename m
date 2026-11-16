Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842237;
	b=0IQgD5qQjWJIiA81CyhHJLvNDZr+7ZrHVhNK2vh3nUT86F3t2iR5uL4fK5M75CaRrI9f
	 BF9bNic0MbzY4s82dExPeEBIw+N0uEoSYji1pzveINvRYLsA7tAAiRJ/kQOb4b/wDCcdu
	 n7zcRspETHZAJeAOm4O03O0n7DCA7r0vzBeiM1frnRVWw5h/wSE18we99rwTfoJ46+0pW
	 gN2gVVscbS0ZraewiDbE4z7nZ8IIt7WMtKIyQ/Gp/Vafr6ovZvtbyTroc2i1TZkj00EBl
	 XGWZKMKHFymJYu3oW1LgsBRS1Bun2Nl3316qGFhqO3BUHh8MfukuB0iDShJqA/fszaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842237;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=hV5sCbDd0ZFxTornQGVjkDTm2qomq+v0V1DGbkJbuFs=;
	b=hvEMIUxvr0C6nt54l7HPpP6dsHpyrMdY95aUi97fMRIePg+N9FAl3Jx/Mh56wBWUwUS6
	 JpAJzWPIn0ZGk+4Lt9ThPb9Ocq/lkf9BV583lQKxTnx4/epCtaAgqTB1tRf4xl00N07Lz
	 uzqW9pFo0gByTZ1CweBUc9lMt9MGnx3RZvanvoDswA4L4N2KtzTsM9fr3kjlG6dWLmONP
	 bQd+BzXwmDPGu2ZAvcnTqI2RQN06JWomU+WTdS0sCNymPnH56SVO4m9ffJ/YnemctW9Re
	 4Zz97nMyGktn8J6zDdk9uGQtS7WfuHKK2PSQGMQok5GsFPut4kjBr9UX8AVJowHrjOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CA606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19CA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBxolg2317469
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:16 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxqtns4rn-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:16 -0800 (PST)
Received: from twshared25295.01.snb2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 15:17:13 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id EE54D2F083077;
	Mon, 16 Nov 2026 07:16:49 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <hare@suse.de>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261109225914306SSjwaKCesNqNUj53kLV1R@zte.com.cn>
References: <20261109225914306SSjwaKCesNqNUj53kLV1R@zte.com.cn>
Subject: Re: (subset) [PATCH 0/2] nvme: use the parsed offset for DH-CHAP
 secrets
Message-ID: <179484220997.249619.15316434155149388009.b4-ty@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfX7JJGyprJE4jY
 2bO1TT7usLuGP3pD699neH6+bwq0mPBP/bFfwKT3tTZpBqs7zp2FaOwD1jpGlrmamAoSaKlAbzf
 9/AyW6dVbOx9lH5Ddmv1dxVVEkbnl1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfXwRl2hCtt6Eix
 4A/KUGMDSzbdaveT88F9j2nekW4+Pve2KJnp9GTKqAnpD1XCFF0nnop3XMr4IP5A6P/0bNC3Ncb
 dMqMNg1GNLnfuKN658Q8xiczU+IDPEDeUS+BILE5DwvrHBUbXW3rv5MgsO4PBhjvOtjuyi576A0
 7w8oDLX/kOCw7s7jd6o+OKug0BipR0NeQHmHK65kUavhvAetUd5FOswdvAgS3RMkzQKbnDnJVrA
 kW1sFOqa1xDTuVKkGXEDVxzaUEhQkU2g/eGqwK1t670dbnDjBfSXOjv6UV9oq6YydtK2Juz0dbP
 siaxlYHO+P7lsV7+s16QGWbwd9w+UCQcCJOFDZxj2yWlJ72ry+21GK4MlHbv8yZuoIQ/OnHEH2Q
 FPr3qTij0vfiX1w1DWZlEcp0CnBDDE5W7E+k7HZK6BIhAp/0V2bz2DDKo7+ZBQcVlAvRzKiMMm/
 ADH5Zbp0XisL23srJ2Q==
X-Proofpoint-ORIG-GUID: 87JA9HdmzabTeq4tbu7y_vgrZ8yahPou
X-Authority-Analysis: v=2.4 cv=U6cHnuru c=1 sm=1 tr=0 ts=6afb1e7c cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=Ru7rdtjBa1pdOxYo90UA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: 87JA9HdmzabTeq4tbu7y_vgrZ8yahPou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01

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

[1/2] nvme-auth: use the parsed offset for the DH-CHAP key
      commit: f7141618d5d0b51bc2a64961bab738a0fe57e83f
--
Keith Busch <kbusch@kernel.org>

