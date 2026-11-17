Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907694;
	b=AlTwT6dUwE5ela6/v98ykofDHNCY9b2+ABwsTms7qgCL93SmKbnAF/PLHRIRsJhMLCem
	 lJmG83hWzReCfUxa1gQNr59rKhuXpoKMKgNJJcqbkThcg1xhXdiZ5J7A6uLAv5JCYNH/b
	 7VkVDFMPgSS4QlCCJjTvj81pecD68rhAv9Z2DOQp14SpHhzD2ayltYpCBdepQwpK8z3Li
	 zL6cwmom+C8DY3srw0Q1+yqAlxhGRg+ZIEkZxyO3Ue3GcH25OaVRXJ8S7XX5O0l8oK8u3
	 Tkca6MssDHi/0IqJjASUm3eG7TW2kf4IvXedHCkEFRGlQ3xBYZp60bH4i+mg1TaTFeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Message-ID:
	 Subject:From:To:CC:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=d8sOk0x43WSILP9MfWYP7qgMe7uUQwafssmLoeKj6k8=;
	b=QTU+iHlc5hjRSNuKwJkCG2M2wuTlEDkrgT4pdcm21b1rIVv6LEdfTR1H7jR/p+CuscB4
	 0luzd4TdBH5hTXc567ySem615MuI103OH39JuG1ZMr1TvOJzynXvZHkPiDBk2dYTAm3tr
	 0A82gBrPT+6cbTGsNSeap10RW3wa8D0CxhdVepfYQQ45zhDjTSSZqXQ/bY2bDp/QTSriw
	 +RRrwJpZB8ybB7IFmshM5AaOenW24FMOCUw5+eLaf6p75gJZI69CiXh4ks88riYd2ij5h
	 Cfu9094lkojf2dA5TozxDK5zBOPM3GOb3FppA4gqQBZsI/qnJF5we6B6R8z3UddUPzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b="sM/NDTzO";
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21562606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21562606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=sM/NDTzO
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AH8efab2136092;
	Tue, 17 Nov 2026 09:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=d
	8sOk0x43WSILP9MfWYP7qgMe7uUQwafssmLoeKj6k8=; b=sM/NDTzOSP81bonow
	0MUZsKzgAdJUu/Ls/RjW8AEqHaA9CdjlilK18XRZauC2I4JiSxl5UD2IwEwSKIhf
	M24L9fwoSHzOK7sjcdFgTzdgia3QsEuY0+lekBUm2RM+1NV4KyjsnaZlyb3VYnTQ
	ZTd+H1rtGVK0LpdxBddINYxUj6OJ6W566lXD1RFzjlz8IVJUtvma1wsMuieHV4th
	oMCvcnG61XveSf8WcwLk5d0FMEBeHH+JmHv3bj/st8+f+xE2Z/EaGf+A5NeCM/W9
	3oER96VmZIHfifZ98KaKxtdjMeiR7xVsWUacfsns6OB7FgdKwQ1G8OY+8eErZYyc
	saoVw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hxestt2j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Tue, 17 Nov 2026 09:27:51 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:27:50 +0000
Message-ID: <023177c465539fa87c8ff08ab0ea5051e75547d8.camel@imgtec.com>
Subject: Re: [PATCH v2 0/2] drm/imagination: Switch the GPUVM to immediate
 mode
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Gyeyoung Baek <gye976@gmail.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Brajesh Gupta
	<brajesh.gupta@imgtec.com>,
        Frank Binns <frank.binns@imgtec.com>,
        <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Date: Tue, 17 Nov 2026 09:27:50 +0000
In-Reply-To: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
References: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: 4ywLvArhZlLtsY9sGfHZtQ-bxjvldLib
X-Proofpoint-ORIG-GUID: 4ywLvArhZlLtsY9sGfHZtQ-bxjvldLib
X-Authority-Analysis: v=2.4 cv=O8OsLx9W c=1 sm=1 tr=0 ts=6afc1e17 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=c92rfblmAAAA:8 a=bC-a23v3AAAA:8
 a=CcRmZogvfuLsyrlAmdEA:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfXxjfOJTU0ZBkU
 uJ3P19BR6tnbALmqp48mAm2WLUQXPhsgTcAcMRqSCHgS1js8SJTpf+Xjb/nUUZWt3Nw7HdROHSn
 4+k/tQg+Q9zyTS/yiaiSnNAfmGhHxbvyzqWLOv24MgI4GwU9HfiVrtgmHEVM6K3971t4aqRfxi2
 GgTSWymNXiPVNjBfDaJq4aIpS4ZTH2u+E6PklgZhN9TZgxa8a54+X/pY6welRYRXIJM9PThiDIB
 30KhuKDyM8Ys7x66cvvjXCplwXHAuDKYGjhFDEaiEbnGN2a/y1BnLvRIvygVtmbFVzq6ILtR28A
 L5wJnOiG1P/lvxcNZWmkZiIAjUN/8+Hs4SLADlLQ8VD+UM/rkWHbgG3W0gMk6xfvvcdYYIGBY/2
 rnroPHnIFWYBewix6qvx24cLWZ25eescEF8rtC4LI63NH2J5qo8m6tbg3eW+Wi+7nFUUgHMXFUn
 YAob8DlhiZGwwiVMVNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfXwJ6EO75QBBQ1
 GenBilQib08oA9kDEoRCVN4/289UtocwDBPmPrm4bIyauFJQ9gqvwpXoHq40Kt/7Ro5gG7Anhej
 2ktAk0tZsCGc0Ak9GyPmwd14X7A8jMs=

Hi Gyeyoung,

Thank you for these patches, and sorry for the slowness in responding. Thes=
e two
seem okay to me - I also run IGT.

What I can do is to kick a run of CTS with them applied while I'll look at =
the
series for adding the VM bind ioctl.

Thanks,
Luigi

On Sun, 2026-10-11 at 18:45 +0900, Gyeyoung Baek wrote:
> Switch the GPUVM to immediate mode, as a prerequisite for asynchronous
> VM_BIND. A revised VM_BIND series will follow separately; v1 [1] is
> linked only for context.
>=20
> The switch also fixes an issue Sashiko reported on [1]: the GPUVA lists
> of other objects are updated without holding their reservations [2].
>=20
> Based on drm-misc-fixes (depends on 196d4d10c1b3).
>=20
> Tested on BeagleY-AI with lockdep, KASAN and failslab enabled:
> - All IGT imagination tests pass, including pvr_vm_map [3].
> - The fail-nth reproducer in patch 1 no longer warns.
>=20
> [1] https://lore.kernel.org/r/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmai=
l.com
> [2] https://sashiko.dev/#/patchset/20260817-pvr-vm-bind-v1-0-0a0f21be7d38=
@gmail.com?part=3D1
> [3] https://lore.kernel.org/igt-dev/20260930125057.1837788-1-gye976@gmail=
.com/
>=20
> Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
> ---
> Changes in v2:
> - Patch 1: drain the vm_bo that fini() deferred when map_init() fails.
>   (Sashiko)
> - Link to v1: https://patch.msgid.link/20261011-pvr-gpuvm-immediate-v1-0-=
5b298dfce4f8@gmail.com
>=20
> ---
> Gyeyoung Baek (2):
>       drm/imagination: Switch the GPUVM to immediate mode
>       drm/imagination: Stop locking reservations around map and unmap
>=20
>  drivers/gpu/drm/imagination/pvr_vm.c | 82 +++++++++++++-----------------=
------
>  1 file changed, 30 insertions(+), 52 deletions(-)
> ---
> base-commit: 6ccf996a0dec1852dab94ad865f27b4904750e12
> change-id: 20261011-pvr-gpuvm-immediate-f7ea8edc2e7f
>=20
> Best regards,
> -- =20
> Gyeyoung Baek <gye976@gmail.com>
>=20

