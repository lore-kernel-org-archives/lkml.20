Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981626;
	b=PLE7yjAOoQX69u+vBJKxheAEL1GiP4uIa/P9g8U8MB6rHR+hlkV5jX+ALvH5EzzeWZSx
	 Ytak3gikBOCqXF3ASnvaeOAdMdDHkIBhpTE7wZyzSGRrBgY263ZZtDSB1+IB5hHe7Z318
	 cHUhQjJo5Dy0MpFaS22gzfDkvgI6tRR8FkE5SnwWhi3QVklNjt/S5zAKh/fEiA0wvScfr
	 YPFzJxpgT6boK5ET/L3yCOExJyevPwvpTWlsGD3sLDVTfhXNp3VLSR48VsjgmSN2/FX+p
	 3p3Q+flIsig44QlKP9gNWNlLQDlbME8WSGeth2swQU2XJutkyvvIEZKsep3y6eZLIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981626;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=bybJ74v1qaLFWWjXXCxTlpKe40sCyNMaTyKfkM33dek=;
	b=ltqOfk5bfT0gpcK6wE1RWsiuRpUgcnaRU9nqobsk/c4zxQm9YUOg6JHFPNIrPA6J0OK1
	 Zyzm/RvzlmEl0CfFsBtJL6f/beGro1GyElQ/Az8nLcaN3pQyLs8FilEBQ6j2RmSgB8BQM
	 +MBygidVJmBVSqHhSl0/XyPWzoEN2HFMUQo+qnf3ZT831oFqOE6iJklNwNeE7VI/ZUYSv
	 sb3TyDafFYUNUvDpNJv8JaU0zCp/5w+QXq/1rhQ617sOf1lldP+M9lylMBBDV6B96/NZu
	 LNMsD4+M3/j3taYyKfgaatNnj8wlLUM7+b6G2P4rJVZ1UKouPWaR28Sb5c52Lwj81GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A6F2O391024418
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:13:45 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hs3r0vq5g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:13:44 -0800 (PST)
Received: from twshared119346.16.frc2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 16:13:43 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 505BB2E8C4A3C;
	Fri,  6 Nov 2026 08:13:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <linux-nvme@lists.infradead.org>, Yingjie Wang <1075151112@qq.com>
CC: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Marc Olson <marcolso@amazon.com>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
References: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
Subject: Re: [PATCH] nvme: avoid wrapping admin_timeout and io_timeout
Message-ID: <179398160932.3651019.13151076267565610184.b4-ty@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=Cucq4X4D c=1 sm=1 tr=0 ts=6aedfcb8 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=VwQbUJbxAAAA:8 a=tWdNHjRbpVsFhML1pWAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: V8RZHtQ0uxhF56xJfAmU4wNuCjjNDq16
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfX7Pec8gUEZf3J
 9j5kA2osIbcOzswJmPmDYKaSwgj1D/hiHx78Un8NpnkkwE3U5ac7f7m4Mh/WOhBOFzVw89xFfR0
 Cvk3YWRFXp/NQl9Y3YJL3zJb83N0phI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NCBTYWx0ZWRfXwShF+xxm+Qw3
 oeQIE88wL1HVPXYmQi5o+sVZh5ShVi8yHbkGDvFrvRHoC2jw+fAE1BoeaMXnKL6MLe4jae4Yh64
 EqpTdl8oD8i532jTdTbXW1omjWbzRVbYs3Uq2VfKzMfLjMQeg7VklI9Moos+senZI/5JTcFkJpJ
 p17nDDt7r7HhfX5kcJZLsCYqc6Ff58Ea+TuGjRT2n8rGFICEK0DeJo7kIsxZqpt+2X/PlDR/9iO
 ho9JhWbY9yf4xMDgRot1SJjm9fdWi7cg1jxsDYFjC39jlJFZ8jS7qCrj8QlHx+NBcJ/Eq2AOLxn
 /e8FsbYUB7PKlPk5O2seAuXCSyx38TzR45YQy9o+GuCjm3ErkwFd/9rNRwUYLpE5YlUgRPlQ8w1
 w4ouYMj7sBhXJPEzlzJ6pbwJMsCWa+2mcGti47FYlxns6qa0zsSK8BH9iYJJMS0k2Alhg8g92JD
 d25BAD8qT9u4BLPbufg==
X-Proofpoint-ORIG-GUID: V8RZHtQ0uxhF56xJfAmU4wNuCjjNDq16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

On Fri, 6 Nov 2026 14:25:16 +0800, Yingjie Wang wrote:
> NVME_ADMIN_TIMEOUT and NVME_IO_TIMEOUT multiply the admin_timeout and
> io_timeout module parameters by HZ in unsigned int arithmetic, and
> nvme_fw_act_work() does the same through secs_to_jiffies(). The parameters
> accept any unsigned int, so values above UINT_MAX / HZ wrap. With HZ=1000,
> io_timeout=4294968 becomes 704 jiffies, and a controller created afterwards
> times out I/O after 0.7 seconds instead of about 49.7 days. On 32-bit
> systems, results above MAX_JIFFY_OFFSET are also unsafe relative delays and
> can be treated as already expired.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme: avoid wrapping admin_timeout and io_timeout
      commit: 4a5aeebf1a00360bcc53c9e29fcd8d47aefa4c1d
--
Keith Busch <kbusch@kernel.org>

