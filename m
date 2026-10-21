Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577287;
	b=gRjW8S8UU/q0E5Jw5parZPZJvJo7ub//Q+qI4/381sK9OMkwKO1vZsMvWoJpe3v5+cje
	 cbzQ0oJNbGXH5zFybd8OH5cIq1Cl2icJiP31bLwXvEZkBkejUx2+Nx4RHVCGKqKuIBDiD
	 XCKolr4fdaHLti770naz5E2bv0c1KhlCqJyW4Uq7nimpUtjKuOK79OBnZtqZVBySaz0nw
	 ZQ7dI1ryYh7lchKaX/JJmYoMnZc2cYvwDBtEA5jyLABvY1UyRsFc0ltwG++1hBBLYxCuS
	 AucVeGO+KCRzeS9ll7Mn1+Tt3H06T11VV6buA8qkx6sgDIb8E6gTB8HldtlO4PT9bBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID;
	bh=ZjB0y6fnhEQz8X8Q5VWbAkxvqxlkJ4gIZLunHjduxdY=;
	b=svnbEzrQNFIjErTXyhbOtglm7EnW4x/UPTLbofbGDDVS8Tz930+G2qU3t3GboFjdZ9xb
	 HPzTWOZOSFw8q9RuMpvZcNC3uKpfFBIncDOcexR0d4HojpMnrPh6boAk63mS49/KWPjm5
	 jvXlFkCSOTio9eHwVzNAKIQJZdBqNRdzSAU16/nhsfRaRzl+1NbUIWqytb/vqkV14Dxf2
	 uxS38CUNBF5fRpcy+0gNOiAfJN6bXCCf4XblAUKNIQVkVqj6jNn0RwUsfDM2Sa43pMgnu
	 mc64X4b+LJQz5pbWl0JYOAvI16JDcAWWV/u6TxwjxdP8AVAYv3PSnWu2sGuG7TPbL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Q9NUJYgn;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF7606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAF7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Q9NUJYgn
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA7JUV3848846;
	Wed, 21 Oct 2026 11:07:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=Z
	jB0y6fnhEQz8X8Q5VWbAkxvqxlkJ4gIZLunHjduxdY=; b=Q9NUJYgnIBqoQ5aUD
	52kZ2mBZAZ6Pjka5FPiYrtV1lGD5mPhPq0j4IR9Qzr+Kr39YbLTzZhoREMgzyKPJ
	R6XupgpU/FAZJAnJ3pRGUCOBVdnt9wF0fPKMRXPKMG8GExpyoR4vNLQAW1PaiPfQ
	0RBNnJTZ6Ou5kORWzv9hz+v7Sij4mnkBc7fkYePpz+4aJl8eB7dK54QHrF/hPnqg
	jOzlheFSChD5o94xevpyrvLTwgljTFHh0EbbEoF1eO33ZNgCYKq6I5amCaraQGD4
	GLRwj0BS2FuIXfwdxgJ3vJsjOab6DSsV+8fRzQYiUsPW0SPbqFyR8xjJcot0vPFK
	73nZw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hdvkd1770-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 11:07:47 +0100 (BST)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 21 Oct
 2026 11:07:43 +0100
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sarah Walker <sarah.walker@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20261006-b4-utility-function-to-rw-regs-v1-0-a9faca685c4c@imgtec.com>
References: <20261006-b4-utility-function-to-rw-regs-v1-0-a9faca685c4c@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Miscellaneous improvements and
 utility functions
Message-ID: <179257726333.217387.5982189885696865302.b4-ty@imgtec.com>
Date: Wed, 21 Oct 2026 15:37:43 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX7seM+IZ77XkN
 cjpd+IGtXYmiblTqrV4kwokcnNjsqrcKyQ3wUeweQ+pnMbJ4W92nofNGqMwd8jVzFYHas2b3C1I
 ltBGoJF+83o8VIpBGJ4M0Gb4LV0dkT0=
X-Authority-Analysis: v=2.4 cv=arUnmiZV c=1 sm=1 tr=0 ts=6ad88ef3 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=Ta4uftZHpNhSCKt1BbAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX00SNRLVQH2KZ
 ZrTk0Swo9Oq1rrmnUhFqeDRCj68M/05AJo0UrPjDreTrsctO4cXhpscxF/obM3g62Co9d7+sotr
 xjx5s+VX87eJ32uD3LO+UAmQ/IAeWLu/JD0cD9FrzZkbZKZ+1kH3FQbe8MWNNf+cLw7MeJOaR9u
 m+xfhMCYi2eGWKmwOMAuWYFwxMqDvOuWau3Zwe57LiuD92/e/9GDwWiJDzyHBEdVpuGWxHqTY70
 sKzBzlV7RcxEO6SZcLnQ/AD9U43pqJRDhIKUoyMsHQ/eFE8Zqg2gHEMBtx6N96fUBBJoTuN2e0J
 lWljaiTOeowomVBiSnGeo5HbwtQFXOQPlTDIRkv1hzsMcu564vC4xh4iMyqs6NMubOq6IG21Pnp
 o+WLAkHtbd67vyewsvz4N5G8P+IwFGrv2ubiNh0aIsJ/y5IwQ5ROA9xnCu7/Me8Ge1zDQxXlHJw
 z0guhwOFh/Q9af65+og==
X-Proofpoint-ORIG-GUID: gQibYa3QjmjSJm2KvqySqR5J5lKup_M4
X-Proofpoint-GUID: gQibYa3QjmjSJm2KvqySqR5J5lKup_M4

On Tue, 06 Oct 2026 14:06:36 +0300, Alexandru Dadu wrote:
> Code cleanup - wrong soft reset code removed from startup.
> Utiity function - added function to write and read back registers.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: Remove wrong soft reset code from GPU start sequence
      commit: cce6a6777bede80f5a9dc12d02e70a277ec86663
[2/2] drm/imagination: Add utility function to write and read back register
      commit: 3c2d6ecd795ca903b612a998d9ee3294c3ca15e4

Best regards,
-- 
Brajesh Gupta <brajesh.gupta@imgtec.com>


