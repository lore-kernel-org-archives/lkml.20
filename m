Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6433A7D63
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462335; cv=none; b=mxj0lse7Z0xnF+t2aKt6/ng6MPne4IUOBGSdJjANGahrq0ocNn9hX/K9Liz4fksHsy8WpLhxXcMdMZ/5LH2nvv5R6wh6M3LbgZYT2Zsrmy3OCwZnoAYPDK5NJvm6rim8TtjSQxm49seO84wB2sCQDp8cx//ZeT4bDy7nft9eiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462335; c=relaxed/simple;
	bh=3vu5IgZjS4aHaFef0fdkVv+N6KWwN+MCe21cR5/ozSk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KNat3ylNGgtf/mmFGllbOVgMQKz88P4nsCC91V+YUqocnpycgearAZA1vzaaSPtgozkZC7RFIP3o809sXZBr3jG/G3dXhypcPLkEYou5xZXHnRFFC298SBUL+IVnSkrKvQLc4sHy4+eplQPloN4Kwvya1tMYtcnchZ+cOjZcviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=dtilhep5; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="dtilhep5"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6a4k93169952;
	Tue, 15 Sep 2026 09:51:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=o
	jqrzLSQgvNwbyxhFPqHN9G4s8nhgGD330YVtFpo9CU=; b=dtilhep51XDMRzmsE
	siRStnlZM5DR22OLBav3JljqLp7Lk1PG9hupQBWSVb/KbPt9f+iPOKUVV7yUThS/
	NPjA5DWdeDRyuAYiF5ZBdrEmaPAWFxd557Fyac03Uv0/rp0xEXW8T8aHg+1obc5K
	YizvCxUUSvlwynIGyYcbCbEf8hbazY9s58+tFDMLSj+n3j0g3cZlWP6FCMc0tzdT
	0qXY5cWEaDNKr8sGfBldOiMnzLXkDgHPgoHi+rvc17qKt+sKDMoaeYhp1An4ZMGs
	QORitH+yGAl6aROK6cfuEvro7C4L7mLjFgAY51GF1hSrFTiWxoEXUsiAlXvlCJay
	4u+Jw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q257e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:51:50 +0100 (BST)
Received: from np-m-daniel1.kl.imgtec.org (172.25.4.227) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:51:49 +0100
Message-ID: <16d56cee0036a41f411df0efab03bbcc8e964da2.camel@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix PowerVR UAPI constant references
 in kernel-doc
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Karl Mehltretter <kmehltretter@gmail.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
        Frank Binns
	<frank.binns@imgtec.com>,
        <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Date: Tue, 15 Sep 2026 09:51:48 +0100
In-Reply-To: <20260912063021.43076-1-kmehltretter@gmail.com>
References: <20260912063021.43076-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEyNiBTYWx0ZWRfX9N6Fen+3ce7X
 RFml4NAsjhx+VltZpTgO08rtl7Oboo7hdjN39Lk3b721RhLKf63SERWDmg6zaMXc+nplABZvIlP
 EkY+eOZ4EpdOqx1gOXmDfk8ryZq8sU2Ph3mi750pm4sDIUtNM6WFBQyxhKC5g7c5SP95w7T40G4
 +D7lTIninAIXSoqbyrMX/BOjZXMrdtnyaBcQpfSBjGMzAR9hTxGySC7IgS8xUWjstUvRIERqpsE
 tiVWqoHguDK9Q63XVyASlPsKiWYiHwmrI7vLd2T2w0gfp18JHpzzu34jSlr/P0rh4Jhc84webKs
 8MiWtMKmgjWZ73qQ53O3TZbl+Yd4EH3ajRHEYjgMK/UlGCd9oScmNs4turqGfvtEPKxhSoiwi48
 SCYFomrKKgXzkTEwPFdCPry2Qd0PwPh/dv+a5P4fSNEBp6Lp1zZzNeLuwwzMzUmTobpm1Is1Mr+
 GvzU4QEKOQEf7VBSBBw==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa90726 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=eoBRZU4O7WcA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=W3PY7I6eilas62gTvYoA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: aATtVwXbJCY8xcvjb2LEViVeloasbcKV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEyNiBTYWx0ZWRfX9bpcl2S5W2cj
 3bXliQ+guvR/ZYgm99iws2tq6y/V02F6wpkeT2ulEN9Ww4+H49pJ8uZn2Lr4zQ5kCoDQE99mrxt
 42YTnEJU6BqfiaEQ045lB8dfciZmjNk=
X-Proofpoint-GUID: aATtVwXbJCY8xcvjb2LEViVeloasbcKV

On Sat, 2026-09-12 at 08:30 +0200, Karl Mehltretter wrote:
> The PowerVR UAPI comments contain misspellings of the enhancement query
> selector, two buffer object flags, and the job submission ioctl. The
> correct names were already present in the UAPI definitions when these
> comments were introduced.
>=20
> Use DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET, DRM_PVR_BO_PM_FW_PROTECT,
> DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS, and DRM_IOCTL_PVR_SUBMIT_JOBS in
> the corresponding comments.
>=20
> Fixes: 1088d89e5515 ("drm/imagination/uapi: Add PowerVR driver UAPI")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>

Thank you!
Luigi

---
> =C2=A0include/uapi/drm/pvr_drm.h | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
> index
> ccf6c2112468f3f53b093bc298dac2bbbfd35e6e..d97a69b83cc59338b7aae306e4dfa13=
20f07
> 1a2d 100644
> --- a/include/uapi/drm/pvr_drm.h
> +++ b/include/uapi/drm/pvr_drm.h
> @@ -231,7 +231,7 @@ struct drm_pvr_dev_query_quirks {
> =C2=A0 * the user mode driver.
> =C2=A0 *
> =C2=A0 * When fetching this type &struct drm_pvr_ioctl_dev_query_args.typ=
e must be
> set
> - * to %DRM_PVR_DEV_ENHANCEMENTS_GET.
> + * to %DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET.
> =C2=A0 */
> =C2=A0struct drm_pvr_dev_query_enhancements {
> =C2=A0	/**
> @@ -848,8 +848,8 @@ struct drm_pvr_ioctl_create_free_list_args {
> =C2=A0	 * @max_num_pages * ``sizeof(__u32)``.
> =C2=A0	 *
> =C2=A0	 * The buffer object must have been created with
> -	 * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and
> -	 * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not set.
> +	 * %DRM_PVR_BO_PM_FW_PROTECT set and
> +	 * %DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS not set.
> =C2=A0	 */
> =C2=A0	__u64 free_list_gpu_addr;
> =C2=A0
> @@ -1277,7 +1277,7 @@ struct drm_pvr_job {
> =C2=A0};
> =C2=A0
> =C2=A0/**
> - * struct drm_pvr_ioctl_submit_jobs_args - Arguments for
> %DRM_IOCTL_PVR_SUBMIT_JOB
> + * struct drm_pvr_ioctl_submit_jobs_args - Arguments for
> %DRM_IOCTL_PVR_SUBMIT_JOBS
> =C2=A0 *
> =C2=A0 * If the syscall returns an error it is important to check the val=
ue of
> =C2=A0 * @jobs.count. This indicates the index into @jobs.array where the

