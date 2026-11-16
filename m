Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846999;
	b=PoOlkAO+KCkiicx1dm9YQFIPALyNhQnTyf0V8xPbkv4tQDIVq5BH9cinw+l657zMDLkB
	 KQbJVMaipFhaIJfvHQtcBFDjHoRw3EG+CkW11y2TMLZ7ohCfHiqmOrRNE089g3hqCPTbB
	 q3kvZQA71BaUjX2gcm5I9apV/wFyV/mV+8CWEdDfzFGEcArXj4EAPyVTbUNDc0RJGcXfP
	 hl91CxynP2+1v9TBHlQ1Svn0oxbe675UIBT3qh+lPRMTb0yfnFeqWMN6qkrQ8hLebFJWa
	 rxPkUIoCuoYfLsmw0tSUEeLtGy33kC0EJ9pc6fArQKQC1yqMbObzZfu9cwoaUXIPmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=oLYWOOu2JA+PDKk14LfiY/TJ6BXNz5oCpe3BM6ZEziM=;
	b=zeGP/iEOFYMaqy8Zbspvska/6UmpU9KIabObZX+Q1auxew7l540k7SyI1inyimm0a+lB
	 nGlRqjked0hlAe69afenLfl0AgGSQNJItQWf55XEH17LIctpipxY70S6iAy2ccm3yYvfs
	 YQ9kjonHqjAVgNT8TrwEoUBkqYpC4fEaTuUN9zVoQjmLZXwA+45VNxRUxxdmuCHilesSF
	 FlzK4FC2HzvsN4Zqrvhfc5/KiBFqPm1VWUglUzonk6Zn8tAjghxfmbiNNGX+mTf7Xg3IT
	 xjP2C6+I4fh23pPgWBZZ2vC1F8Vm83EbCAfEjDvslE4lhMdNzPQ+WJz+qYfOpDgJZwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b="R/CCU4na";
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01490606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01490606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=R/CCU4na
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AGCQd1I4134120;
	Mon, 16 Nov 2026 16:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=o
	LYWOOu2JA+PDKk14LfiY/TJ6BXNz5oCpe3BM6ZEziM=; b=R/CCU4naGhGKYr3sL
	6g7KEBhTKMvSG6d+0LtuFEIT6JLPmSZryOTOi+ic+fpPLir8cYw0k0YoEmwYhJ3q
	TrHVjaGsd0RYSZzsPDe2IzEiT16lKxMOzvjzRhofkiQbIin+xZ7raJ6jt8k82UZF
	h/kI/4Rnht+zxPr29t8A5l1Uw4javlhAVejOiE9IGbgSBw8D4xYHx3LLxHb5zJ7E
	xAArSBGWeuJMYEnzfOl+RrqE9UH5aqx+VvM6613xL5d0B+QBBPQ7MODymMPBWsw5
	sH653yTP4CtoEideftEtAfh9hoC9FN/bQgi622TsVusxe3nbADF9C4ttiDTxI0JG
	VQcmg==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hxestsjep-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Mon, 16 Nov 2026 16:36:20 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.4.178) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:36:20 +0000
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
In-Reply-To: <20261109-ioctl-query-count-stride-fixes-v2-0-228ea0e28dc3@imgtec.com>
References: <20261109-ioctl-query-count-stride-fixes-v2-0-228ea0e28dc3@imgtec.com>
Subject: Re: [PATCH v2 0/2] drm/imagination: improve UAPI heap and static
 areas query ioctls
Message-ID: <179484698001.410388.8288014140982751554.b4-ty@b4>
Date: Mon, 16 Nov 2026 16:36:20 +0000
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
X-Proofpoint-GUID: G2N5qA0zgOOBmVu-FGQZyDGS_vALrDye
X-Proofpoint-ORIG-GUID: G2N5qA0zgOOBmVu-FGQZyDGS_vALrDye
X-Authority-Analysis: v=2.4 cv=O8OsLx9W c=1 sm=1 tr=0 ts=6afb3104 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vO48zYV2LvQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=oo4XpmpVqHjgO3-tfnwA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX8ZPy6YlBa1/j
 NkFnUc77h8dDEITV+P9JpIdFliH9LIOR1eCdaBmiUgQxna98qj9vmuq1TyenMzcDB6vjansygsO
 mEJ5xedBue6fzDQBPF/0hIuF1v9szYiVHQYUqoeQVfFSU+ZYO9NdLobHLEKSXioyDhB3lFZQTm1
 wMeR8BDyU4vXTfjUkFIXtG4mdy5QU0qHQ5XrAeSVq1m7LFPUH7L1sQM8qwR3qLu/HJMfBn5Pdae
 mHspK+9XXISAQ6BEnzZ39PRSV63B+mY0w+fS1H1KFspl2BbIRPRoLXeWAk24R8JrnDv0btwNSTI
 c+ryV8MOG5pDTJvvAD3QwIVWgf+2INGTJtOHzfTRqT4YL40wPXzuJDU8c/BHt8/+i7CAuoBJ7DX
 yTqE7CQnC9g7HFY8P8QZ5XtzrsYTrsqxVc15YY6RtXkOiGODd9KErewNFSIjOLTGHEt7I8q0vNf
 qeQkjRrKzunrjqFldAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX5tPsChrvp0Ur
 jEBz9zmL/onokS8ZTSaqvILKlGFLKAbbp5Zr/8QkQBFEXXDDKlav1mBG5dHN6hcUR6Vpmjfgq21
 9TAc+VZ98z4N+Kk7m8XEMxKGE+ZfQsg=

On Mon, 09 Nov 2026 20:35:20 +0000, Luigi Santivetti wrote:
> This series is about better protecting userspace when either one of the
> heap or the static data areas query IOCTL is made as we go forward and
> extend the UAPI introducing new heaps or new fields to their related
> data types.
> 
> Please refer to each patch commit message which describes in some detail
> the nature of the issue and the solution for it.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: clamp stride of heaps and static areas for legacy UM
      commit: 2751fa2bc364dfe5599b17a1a26adf7a417f2bfa
[2/2] drm/imagination: clamp count of heaps and static areas for legacy UM
      commit: 17a180572ca50c8d38f3aa47d6fc81ce7c5594da

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

