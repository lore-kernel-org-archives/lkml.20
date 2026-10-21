Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577283;
	b=IJW2LYSts6Jaybw4gMNz4GMTiiiz2Wc0+dvKUxM40zWi4iXqnRgSeseCS/iXq487xb45
	 7pqQvjlFVOtEFRvyLZKr20ABLf6x29oQPnP4vuDKLsczHnI0Qd7fRNjTRmXosRNLp9Vqv
	 nIQbBbYh7xHgevbePzMyPXeWABVhav/BBJ00SLWFFbohWPZP2ndsqkeQ7il0SNyAQddz0
	 PuRiBCjg5J+RWLFKU7jsncc7hpfB4qKfJ4WXVAqxFgRMHfXqSmtrFjaT3AsQPnmchWXLo
	 m4pu4eTGolBh+kvgVwVu290F9w1YmlcgrYPFcRYdRQWf8sOD4BrQy9fgpVwol9LqAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis;
	bh=jXm9xLCKcJdiijo1krCekhMqSFULWJOFFkyzDCZrNCU=;
	b=aI15ql/HH1uR0MJ4dMwYUcqlVxsOseahL5QP6qiVPemrB/0vbEWx7BquyBpi7esPAvkO
	 YVSLeODM2aq+UVmyPT/J0TidI3Gto/Hr7FOjFuUOYDv89DUfBo0Q3yBPSY8d6UCp1ycF5
	 r7mLljDr0NXZuK9JwmOfc3ZJWPVP/ClokfQ41XoQzLEor/VayjVI/K3toN9W+uzSr7LPm
	 RxJYJKmoYPteRnyZK9PlcQ+B7giinbjKCU7NXrUHAvboR9fSRnqI1PoaonqyzCwySvg3W
	 1+uZiPkzLWIV1acCj8jNjL9PDU1oq0xVPc54xZOTrEOSnx61ZfEDb3b/gA6GPVxw28w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=d+wZ1XqP;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FE3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=d+wZ1XqP
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Tge2674780;
	Wed, 21 Oct 2026 11:07:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=j
	Xm9xLCKcJdiijo1krCekhMqSFULWJOFFkyzDCZrNCU=; b=d+wZ1XqPcKObbQryY
	z/iuJx1UuQDZZu8Z0uplwSu3oFkFKB6AKtx8pKEhbgkXHoEpRGSPWp7V2ltcyShV
	oDTEpzBiI88IlPj44YU3tWSZRCbNE1BdB0wqkfqJjf8P0p0bG4SG4tBxRD2dfh6B
	xD/qZNbd5EFOvsUDe0CE9A80rKUNYZPuayMFUyejh9cZSNP/UGQrLrKfRmUqVSJZ
	GCm5gBMgnVud2h8HZ8wwTpSLLxv3PMAebMJLqY5zzAL8DyM+VDce5AdA9iBe8dGH
	Q4ZIgUkJrCW3FSIH2Orn1qpNdlnU+0leHAzYc7RJjg/g0Cw0Ejp5z3CJHivpPI0/
	g1hMw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hdvkahcfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 11:07:43 +0100 (BST)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 21 Oct
 2026 11:07:40 +0100
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20261009-b4-improve-logging-of-unknown-freelist-ids-v2-1-5e6c3f63370e@imgtec.com>
References: <20261009-b4-improve-logging-of-unknown-freelist-ids-v2-1-5e6c3f63370e@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: Improve logging of unknown
 freelist IDs
Message-ID: <179257726029.217387.271775620928362253.b4-ty@imgtec.com>
Date: Wed, 21 Oct 2026 15:37:40 +0530
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
X-Proofpoint-GUID: lW888u5C85wJ0PvoSeXjr4cJV74dWny0
X-Proofpoint-ORIG-GUID: lW888u5C85wJ0PvoSeXjr4cJV74dWny0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9X4j6TUK5GTe
 V591XMq0jChzTl+gzhsqpBzVdcPty+J3/hSg0Pr5FkhqLpQ7hhWRLGyxNHOUM3W6ADMm2jVrvhX
 Ofc/gM8O4npFKNrWQfJtX9WEUaUaB8YLZVl3c8M4XFtJAFpYGNqbI0kWufN/xFc05dmynFECnlQ
 M7gIHQUtnIi0bUdLGEkB2Tv2hdB0cyHk6vwalZOk2MTwF2UZwNp6e/2Q+caL8Hq17+/A0cevGSv
 TBEearyqp0O/p6aqrDqxpXPD7PXIso+ot9n5BgSwqOfNMVuYAYByZc7Fq32ekzs7UWmbBfmM430
 tT0i6HjvgSNv4p0cTL0QJbwNUKARqQ4prccTL6cmxcbg34ARSrzoVPgJWLlmOLw2YcbhvaSFQa4
 HTI6AeMdW5aW3hG5Zvz/j6vOxENFe10+D02kwPnW3YtlymqCOfWdW7fuwnwgMbEVzTA4jdI1Pzx
 12qzgk6nU5D4MILC3hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX5r646lanVyG8
 1XDa3gCk6Rfw3kJRYGg+FJwN3Ny6uM7GkSRjBtk7tnV16ARNM7c/xqvoSQE4t93Y2Mw6h1fDJVa
 98O43SId0PCC7F4PilwdJcBB+qOS5+o=
X-Authority-Analysis: v=2.4 cv=eO+GH3p1 c=1 sm=1 tr=0 ts=6ad88eef cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=wyhv_oTX6gE_ehOD5bEA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22

On Fri, 09 Oct 2026 14:04:35 +0300, Alexandru Dadu wrote:
> Log freelist IDs not recognised by the driver when processing freelist
> grow or reconstruction requests from the firmware.
> 
> In the freelist grow request path, remove a WARN_ON() which is not
> particularly useful since it is known where the request came from.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/imagination: Improve logging of unknown freelist IDs
      commit: f4fbf95c82ea6c3673bd5de38931f02474a38e51

Best regards,
-- 
Brajesh Gupta <brajesh.gupta@imgtec.com>


