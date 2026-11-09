Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239796;
	b=2AebnDTmhfXgN49fovIQl6W6KovP4jHearvMgxtVM69+M5RLaKt7YA/8e1axZ8p6Nq6X
	 K46lFQvaD6U2HVJ9Zl2QceyzVlfJwwWNjWYg7c02ZpPkp0IVlC+n6nJMccU1nDSJFeam5
	 ynnt4ocaSa4CloVaY0LZ66ppiMQPeVw0Eq344H5/lD8dpAMHDkJeEWmiJzS7QnzvJZwEC
	 rbdtFX2/9eLOraFw+1jLxpIjhCC7cq/vTUxfuhgINi8+sGlG53ODlEvKr4uxW7qDi4Eoa
	 bIDBn7HPGbCn0x1lxmVV4lzObPye9xtNMSbjXjt3TcolZw0JM/Z5F2X/P8Jtd52rhVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID;
	bh=ub4W/RbE0pCbIxx5Kt+BWv/BjrLzOeNWH24Ty0SbfZA=;
	b=RsLd3TF8BnFN99qntxh+i4nGcGUtsOiMMWfZOcV0wHyf60ZTJSUdFT/N9Q7CaaeqXLe9
	 oBXU7cdWhdwXLiAwGyjuWICoMwoDklckTGrFOP9e/5YD2lUBVtwtShuOe+E50S58zmN5E
	 LrVHDiVMimE2h+ULwEj4tFFGa/YIyniVDwoMH37Q0CWEWn2EGLKTUaFD6pLXPA2SfSftD
	 0LLmbNeJb6su33Q+sJ5fV52c1CgFEhAvEoOwEVwxT896Tou98tPrSPrIofXQcDKrNEYpF
	 dIDs9lZXTk6trxfKwV7fUN/Cui0s3hYD0W/CKgQA2FhqS+5DG0QczJCUw1btjhKPinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=jfmQuB8W;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A3606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=jfmQuB8W
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6A97AFPY2070716;
	Mon, 9 Nov 2026 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=u
	b4W/RbE0pCbIxx5Kt+BWv/BjrLzOeNWH24Ty0SbfZA=; b=jfmQuB8Wk+dhQjm4/
	aY1qhgJsGI1Delz4BJTPk/BEYmWBfkatvzvbDs1J+eExcMN9Engcm7db+pTLSRgv
	tVt/NRxJAfZJz6kgdapslnFtTWSNk9UBVdqOJqegWA5KpGnqp8ZxoOIoPMawA0BL
	YhYAWiWP8veFGfPrQf+BE2j7fJDe2VM8OaGLD4/tLsxbrrTgPfMD/4ymNSKFWVqX
	4X99GXcRUcmlVX/EwAijUHgNKVXjvL/HFxhB8K+8kImp8LZn6+x3AuHBMRHvfO78
	lydOSg04G8h9WR0mfgIBIzBotQxLMEY/4RpBD+Y3hFUrSi/3UZTID1xi/ttXRoh9
	IBZ2g==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hu8pn8aym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Mon, 09 Nov 2026 15:56:17 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.8.171) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:56:16 +0000
From: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        Gyeyoung Baek <gye976@gmail.com>
In-Reply-To: <20261109-b4-include-mmu-defines-only-in-mmu-code-v4-0-20a857dcbbbb@imgtec.com>
References: <20261109-b4-include-mmu-defines-only-in-mmu-code-v4-0-20a857dcbbbb@imgtec.com>
Subject: Re: [PATCH v4 0/2] drm/imagination: MMU defines updates and
 improvements
Message-ID: <179423977642.219837.12947609406304968231.b4-ty@b4>
Date: Mon, 9 Nov 2026 15:56:16 +0000
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
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6af1ed21 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Rd4DrVCMV_EA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=4uCMMe0gVBjtOtVTJnUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfX00iA3aW7q4Fx
 /JDrTAWEUcEB3I/Mq0IDnFirUiCdSTWcKs5ESh+Hb09ZpzV7Qb2ZlKQdORh26PALjqCJ1XVE5d2
 +Hl5KkPvsXxRXAT6Mf8PieteN0j4iWAgvfNizG3F+RponKHxIRbd8U+1Kl9RkC6/ZAR+dk6Wywj
 yBzug8SzGCbZyB8GvNvCrSTZZUd2NT0w0yS9Cm9IMlCV+a2XWwJqYMftY2tB6hMIVMiiOx09L93
 tqA3L5+FJxY2wOPDY0bTLjJ8OHxWzwxq2OqO1wX0QMyZ6bYN1AouUmKaRhoymSTvjfGpheKd8mY
 decW3/MybY8THxm7Xus15KiCcHLo7Fg3a+FVdHqmYhRA/ZWNjmNxMexTOZKlFtzwl9B/CAdQoBg
 EdphAetrEHCtH/soPymwk72ONGk1Yas9YyaSGZzho9w7X2PzEh2q8v8qOGWlEdK0chUAsqD9Biz
 Ms4HSpm91h2cSu1Fsog==
X-Proofpoint-ORIG-GUID: w-lMVLw5PonFPlce3xV7GMkGzf9EO55G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MyBTYWx0ZWRfXx8iHJ7LzPE3f
 CgnQaJJ8g15Xk4ueKQMnqE9T5iTAJGEbDIAP7BPH629LeDHBPsTd0B9VG9jsv0RYYyppxB6Ftc9
 VeVvyJQ9ZkiDxW5105oirNggLvWNPcg=
X-Proofpoint-GUID: w-lMVLw5PonFPlce3xV7GMkGzf9EO55G

On Mon, 09 Nov 2026 13:44:50 +0200, Alexandru Dadu wrote:
> - Restrict the inclusion of MMU defines to MMU code.
> - Refactor MMU defines to use kernel style and access.

Applied to drm-misc-next, thanks!

[1/2] drm/imagination: Switch to kernel-style MMU defines and access
      commit: 588831ba403aabe7774a07eb92c1e9451dddd354
[2/2] drm/imagination: Don't include MMU defines outside of MMU code
      commit: 8deaade4a5a4ff635df91e246e42139ab2b33f6d

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

