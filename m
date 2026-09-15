Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F23E3C53
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485259; cv=none; b=XpCCOwnfV22HsORwSweNwUXZPzdVcKErLidHlde6zb0fDJhS+6wc4x/GUB29qINopevrlkeGYhr67aKNEyzYsndGoHB0JV6VxTeb652ObFpKGXPBJuEf6EwbauoXWEO4OU4Tj7JAPXcUgk4//hhh7HCwaKBa2pajN+G7Dfd87Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485259; c=relaxed/simple;
	bh=JcBufx0sUKyf4eXbkJq7ejrRDn+vxhbslJlnU4BmOag=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=BJdAQSZqD4KdZMhbQR68AaYfxmPLgDDaw02C7bC4gkAWQyMsd2KLh6TVdaAKJgJ499cVB7OfFQFXd2jgyU50Nvvw6BOLjKb9SWkXlGxKM9yuFMyegLN/BtCjzpiASxxt2Et4ARmRzEt3itmeh3G1zZDSrJhxzmvRLZVVoS3+my0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=jEcL5cdp; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="jEcL5cdp"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFA5L54098599;
	Tue, 15 Sep 2026 16:13:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=q
	j/r3fgW8Isdkdf/XC23o6hAyABbc/h25tHRYCNDU6A=; b=jEcL5cdp+WZilb/ra
	0AZQEUTbrXmWVvk48ixAmrTD2csXB7C/rNG/bd1axVsgyVfjBadUPduNo0lIOPma
	25+rLGDG8m98zoy41zJqISIckQdmSBq1Omvz0UQ7c9GtH0Ty5phzSFcd5vRecAUV
	k7Hj/9GERuEStai/QX3pzaWqtQkqyjVfwUm1qmhDsAUnezKhm6GSHWGdWhvpzKeA
	tGxSwDcP4w7OsImTRXLebtF8uL/Rz9ZrDx/5rwvnkDjqN9xKQGn4mWSosjAZW8cO
	WPw9elyMab8gguM2Rl+nOEa1pWkER7arYZP21CSEPtQ0fIyM4LnV5F9D/xfc5aZ7
	XaRUQ==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q2e3n-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:13:42 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.60) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 16:13:41 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Matt Coster <opensource@mtcoster.net>
In-Reply-To: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-0-7e10274384c2@imgtec.com>
References: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-0-7e10274384c2@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Firmware interface cleanup and
 improvements
Message-ID: <178948522129.153878.14998918131309775012.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfX8iwZFaVnwgQY
 ahNKbweKSbsJwWNVLDrxEc19Go4H5TZjKK5tKYMuXnnOS0AACZFiiMz76iUY22KHBw+/AM8ERy1
 8nYrx7Fy26IO+LOQigCmeQpseAyI1GOaxhv7mPmX3RGbbpkPK+lSUPYexay8JSusTZvyxTWLWpZ
 1dQ46OIN3erVQDVdlnaVflLSu2eITN3W9yjLWP7+KC+MnGoY27lLu3h/MaN8nmudAHV1IpMbskI
 E10RmRr4PVJPtnEFjgu9yWwMvkJTwayJloR4oGmubNqz1E2zb8YlGVgR0gUmoKcAHh2iTXkQ6KY
 5XqkFN2YMckIHwpQVKozYEuOG/MKh6mbt0GUZD299JN56M1dTkE5bMKhoONef+4OzvWGizjnxBn
 WJPG/X443rlD6HHxVLvm64Jsj870I8jhmVY6o/Rkm023BQeMSeTbxZYHcbkproYsacNSwNbuvTc
 YqtIH8ZvGLCCBoEdrWw==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa960a6 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hVUt1O5AELcA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=xeOyCs4oyGzV7JhTlrQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: RLbHYDb7B7kKRc137LcEzYIAR5t5HOcA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIyMSBTYWx0ZWRfXzJQGvhTZ1owG
 po/0tu1Ovy7a4la5nG20cHK8/B4aamrdx8dcuudBPyXYH5Uhwnxc41ssyi7r684vu3wFepVxDyo
 iSXrhUY0Ghhgt1GOPRxJdazb7JEWSP4=
X-Proofpoint-GUID: RLbHYDb7B7kKRc137LcEzYIAR5t5HOcA

On Thu, 10 Sep 2026 10:56:38 +0300, Alexandru Dadu wrote:
> Series contains cleanup commits targeted to FW interface.
>     - Avoid initialization of never used data.
>     - KCCB member initialized in the correct place.

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: Collect KCCB initialisation
      commit: 05cce7f9b638536c544328ea135edb864f503aa5
[2/2] drm/imagination: Avoid initialisation of unused FW trace buffer pointer
      commit: 109f4e9010c37966d59780f7c76064581064b7f2

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

