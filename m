Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846999;
	b=y/6q1wdJ9jjlpbNM7sipgxmehwD5pEeCH0kcp+SD087R+y1a0Loq3eo1eeDfMq8G931Q
	 045vMkxm9PSl8nY90UR8ygkK4HTxssijmFv1OGBMHNlrMWdfGmh7GQmgr8mUjNurx3Er+
	 IgZbo70/xQA/ebA9cu3dTPPh6OobyyCDZ3bmb2yhh/LGL2+I5wfQol8b5bZ3L61Phkfxp
	 am/RQlgIDT1Giq4QohwcsEUsSexyrAAnUWOk5/QURfAKR1vOP9iQYNv6JoSnh945ZcGan
	 9UEzirotpwGCkUsOWu+wW+mEFUKSkxMzJnGC2cjbkyjPSsY3AOAiiPXt7HVp+ZEPGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=YLJoUU89ZGsCK2NZO6kWkIJ/kxhCMvVuD1RYH0B+ixs=;
	b=1s8W5Ek9NHI388jZ3bjCRhlFqpzSKf4khs+tIoROhiz8r88XQS8KPVaTM5l7eP0aQUa9
	 0o8UgOCEuMxXUADJ4erkhxW/3Y1NcSnQkF/3IOfPGpvuOkNYaoKp8Mm3JcNqaOVcBcWjz
	 vqOAiJ1BegzMGlzzEr67b3aUoNt2nvow6z7dl3qKYupgyOePsRnBkcMgJpxt3evlW7mas
	 +0rVpo3lnKHpvvS7D6cSqgGkj6NCP5LByqSjTslwTpddbdSBl6SEZY2tE6xzcZy2dFTmd
	 yRTYLvBZmXz7qU4wakf9pMmngw4F0Vld/cpw1CZRAh15BrsZf9PxtVdZgODS1ZQC1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=v3QOpWh5;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421D606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F421D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=v3QOpWh5
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AGCQd1H4134120;
	Mon, 16 Nov 2026 16:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=Y
	LJoUU89ZGsCK2NZO6kWkIJ/kxhCMvVuD1RYH0B+ixs=; b=v3QOpWh5N54Uhr2NL
	pmb1gtAphcjISPZC3MsPqD0/xpH2wstKlcbf+CUMDW3kw73ogVxZz+JWNEho821i
	nEfRb49OzaIPr0GLbdxhQR2ct9qzqloG4CBOv24HX92/91pQWf3izQGVk+eQC6gB
	7thsc6theYj3bqdviIWhVXwoHJfAexOMR+K33mWQAETglPm4r8zHD1KGBjNd5A/g
	6fqTvvUr3kV2/eNtS22uxPIEORaFw0Sv0AhcdqKdOlUSZ8rpBn2StakeFJOq1tbd
	4yeLFxaTUVNJE25vA9ZovATiD+f5d4JXTaei6RvrDKBon9AwC2aBxExfJoHpfbBE
	nqJkg==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hxestsjep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Mon, 16 Nov 2026 16:36:20 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.4.178) by
 HHMAIL02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:36:19 +0000
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
In-Reply-To: <20261105-document-drm_pvr_dev_query_heap_info_get-v1-1-b899401606e4@imgtec.com>
References: <20261105-document-drm_pvr_dev_query_heap_info_get-v1-1-b899401606e4@imgtec.com>
Subject: Re: [PATCH] drm/imagination: improve
 DRM_PVR_DEV_QUERY_HEAP_INFO_GET documentation
Message-ID: <179484697973.410388.13422245137747065489.b4-ty@b4>
Date: Mon, 16 Nov 2026 16:36:19 +0000
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
X-Proofpoint-GUID: 1HpDm2F3_kQp23M7uTd6pQPLuWsuAYOe
X-Proofpoint-ORIG-GUID: 1HpDm2F3_kQp23M7uTd6pQPLuWsuAYOe
X-Authority-Analysis: v=2.4 cv=O8OsLx9W c=1 sm=1 tr=0 ts=6afb3104 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vO48zYV2LvQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=jSLtM6S-_AGHOE5eHdIA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX9L2fGalIkrve
 P1cfyKfJrXbRNSBZ2UZ0jxui/f3nVal+c3AlAKQx/tcNdttBn81AhK1EGkqc1hgLJNbiq/p0luA
 3Tv7aenu0UdqulQB/ZPro5X+FmxuM3mvpNqdPxrdmV5rPshVqNPHL3fpgWRhYD4G2LOTFISMbda
 LXUiRgXwXnvSvVdRiGKryQFUbKXHys6MxCdwVB14y99ZymQ4L5ZhxH6musTkqyR13JexC+cHoiG
 wJcHX50HlA493K1xY+zrhEltFwfd8yorGvLxsuExFV1St/pP+a2sFMuRb2IoOvUKB7BxLFn2vHB
 mexPDZ0/EvyPzXyZWCY+kNCgKrFTLpjfOxnIaHaC6S/VKNP6YsdCXGX5T+Vyf8Ac42Y+TwdyNpI
 7GszTePFAWaOzSjmexienE7ZPIiQfUcwKL82QLunHhtKlm7Y+w9dxR+1xZCzwkBK71VcwOHbaFF
 prYZjBl3Cb/7rZlI+pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX8uTyPd0PgRB7
 79QUQVigU8hjiIxrmKKWBmXLMpRvf3R+Zd9HIiujRdsu81Tx+xKwxtipNwD0pj94uA5sSbPTVam
 OTd5VLoptbGuxcXnZCgzSqvDS6g6p00=

On Thu, 05 Nov 2026 12:24:23 +0000, Luigi Santivetti wrote:
> Add more information about how the array of drm_pvr_heap is filled in and
> set expectations for when userspace and kernel run with a mismatched UAPI
> header.

Applied to drm-misc-next, thanks!

[1/1] drm/imagination: improve DRM_PVR_DEV_QUERY_HEAP_INFO_GET documentation
      commit: ee1e297216f300160ee91dae0b53b3a42e601d1b

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

