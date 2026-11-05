Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891511;
	b=FRoMN12V7d+1d33gz83ck0HR9IEpRri+CxlmULIBBE6ET+p63a/sIVW97zApGexPQOtU
	 b6Unjs4eyiWvi+SQ1QZ5yQJxZUvFrUie0WJUpNkqULnQea2H2P7WMSRqGLItTpsbYIUxU
	 ntlVFgo1bwrUoXHKE1LPC+HcqCEvwF2FpZ315okwiuj1b0lZO52cHwmOcZR96ZIffJo8g
	 zZqxMcrCgEOAYF46oZYVTalbgvwmU/G+0M1F0QyNV3JWOW5kp9QG/NxZ0qNBzgRJk6N/B
	 NoxOVdjtzMqwNTVndgRdp30ULeLouYiAazkRgeeKm3CVPtRVP9VDX0zb3CIu2j3wKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891511;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=6bxWa9BhJ936wj2QTmk50qV7AcXRwA1UfxmnMBLdpAM=;
	b=Zr++rMi7fSQLJnjQwwq/6BbNsLxLj4vmGd4DBJoxpZgEkP5KP/D6NshQUq4GLd/MxLJv
	 M4WioMyifbK914n8qNbXX020IIDHbnUagyG3WVuHQSkkMyybwzs7bgXFqXLQuiMNlrI3+
	 CZN72vWOTrDOhizhbqkJSlMhfpPOEzQJIegERhdpdnKuEZLNloNgbqD5bj7Ov9u/OYLOa
	 slI+GbrEkSUe3IH5waLvW4XVpuusX5y7ysd21cWPIuXnoskV74bfyX+RSt2U3dTGK0o7w
	 +XXlRjndczVTNpiVLJz3t9yFsw5BjmJ/FHoBKGMKKXturv+7TOPI087ZIgS5qrsKqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BC606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6BC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5ESS6D4164510
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:11:50 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrqp21qy1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:11:49 -0800 (PST)
Received: from twshared13996.31.frc3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 15:11:47 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 8E6E42E7EC6F0;
	Thu,  5 Nov 2026 07:11:31 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261104030720567AV9nG8iiGp4C0YlWIDDs7@zte.com.cn>
References: <20261104030720567AV9nG8iiGp4C0YlWIDDs7@zte.com.cn>
Subject: Re: [PATCH 0/2] nvmet: fix configfs attribute validation
Message-ID: <179389149158.2132554.16810927122814072564.b4-ty@kernel.org>
Date: Thu, 5 Nov 2026 07:11:31 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX9DKmD9YOKIoT
 RFjaAPqUq2+RhBZqk4QK/Abnydu5tHQ8osMFHXyr9zNqoo9zawLmG+y+14rwCGGV0tXD1lj7oWT
 wVbrV6pTSlJZkCTs2fIipo42nsf5Gcs/j6MSihWQwiBT2RUmOT0d07Zxc2Z0pEzWa1XxiRVshF+
 RAQftgzJgxriME9bI3aey54drInL05THdH4MFXleS80//rzbYT7GTr7aDMBxzrJl8U7H9R5rt4o
 4/8xRe12KeZH5bq7HZL6wh6vXZaCUp/5IjsA/NBgDGK84h0iLkn4mKIZRfnwwrb82McENpVOnXZ
 zpO7oqxiwFB1d4YvD91wEsXyOh5WgGGJa1bZmryAAPewofyhod7VB79Pcljw4w6ecy0vSZPyAwa
 T3npvt+7Tikz2viyqQl3l4b7Vyyj0/5xmjCqH3BdcB8krCuALVKJ0zQXF2NZ0ne35WfMEX3QFzl
 a5T1Sr2W1lLdHF3NSMQ==
X-Proofpoint-GUID: N00o9q5rsVaFAnnjnmBiu0EsYzjKnlPt
X-Proofpoint-ORIG-GUID: N00o9q5rsVaFAnnjnmBiu0EsYzjKnlPt
X-Authority-Analysis: v=2.4 cv=L8mI0OT8 c=1 sm=1 tr=0 ts=6aec9cb5 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=9dzKPAul-E0u2g9dFJgA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX6FXEXlDaE4uN
 THT+D0duBiRfz9dEmRfcDw0M26N5cfTZRM9KcMLcRj+gzojAViKuefIV3poB/YcCvYAMdo7TcCt
 DcJKtt3hmOVL+PaV2IZaji04Zi66AUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01


On Wed, 04 Nov 2026 03:07:20 +0800, shao.mingyin@zte.com.cn wrote:
> This series fixes two independent configfs attribute bugs in nvmet.
> 
> Patch 1 fixes a use-after-free when attr_tbkas is written while a
> controller is going away.  The store callback walked subsys->ctrls under
> nvmet_config_sem only, while the list is protected by subsys->lock and
> nvmet_ctrl_free() does not take nvmet_config_sem.  Take subsys->lock for
> the walk, as the qid_max store callback already does.
> 
> [...]

Applied, thanks!

[1/2] nvmet: take subsys->lock when forcing reconnects for tbkas
      commit: fb205953868a7f29317ad619366a5faf2bb268a7
[2/2] nvmet: bound the traddr and trsvcid configfs writes
      commit: 21d6e9f2fb79da2a516901697bd562c361ed6160

Best regards,
-- 
Keith Busch <kbusch@kernel.org>

