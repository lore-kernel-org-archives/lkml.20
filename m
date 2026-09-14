Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD9481A9E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400955; cv=none; b=SlwbsPsiPU0UwwiW+16bTL6SMC4mW89gZFuIpWo3xEnQ9qip6EvrXXwygsevQcUY2xP5sJCr8cQmzRrprvvVxHR8cHgdsFWEkToVkxu7fUEzWwi/dMf4dSlTiZcf19w1AO9X9i4qAvsqy0CYim3P16jHFtSE8U2HAWFsCrWBAUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400955; c=relaxed/simple;
	bh=WhOx9QQJ0+90FnI3xhwk/OMh4IdZwLjGa36ZSmeeqkA=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJ8NNlRyKA4Iwjggwqb9+P/htCcPIdhDX7nW2pcmyTk2NmAOlmsQxVoFcl99jTPysPAXe5FGgHYs+FWPEZ+GkRRHhrW7of8qwLRQieLIz5j7rXw1I+6fX+UB4yYRbj/7k6zMo1CZm+Z68rX074nNR88tPIDpYM02LbRASftfNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=a6cjG+/s; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="a6cjG+/s"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED2v1B1288895;
	Mon, 14 Sep 2026 16:48:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=m
	UF/Ra98guzig3RZuwrW+hNCU9WCPGfza68st1QuEI4=; b=a6cjG+/s1NSXx+Loq
	dhKgVTD8+NLqXE7MvtEPiNVaT444zkyeYO1wMmR4qFO2yYjopPZ+gxXkr3eSLsgf
	6gIX7xVCHYp1rBUERR1if+2AWSRJlA+bDkQG+kEgWbTLV3jYH4fSoXnGreKn6QWh
	84y9EtZNffGVYZqX5cmG3ui0h145r7AlSsRjIw5n3NsdkNB3MbOSn7QmhY9SnFmT
	dxXixh4Lrblin0rr+zWtiA2wTlSffZM06+DZjxrLtgNQun/DjsQjoL+XFELNXLZC
	+4C3pkorY4kVcJDS5IFFVAbJFlEGsNcFsLt5kChspdU9nAaluZmlcWXO8VD/4Aoa
	7M6Fw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gmw0q1k3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 16:48:51 +0100 (BST)
Received: from np-m-daniel1.kl.imgtec.org (172.25.4.227) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 16:48:50 +0100
Message-ID: <15d778836df7210e1b751d080dfc4f8efaedd9f7.camel@imgtec.com>
Subject: Re: [PATCH 2/2] drm/imagination: Avoid initialisation of unused FW
 trace buffer pointer
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Date: Mon, 14 Sep 2026 16:48:50 +0100
In-Reply-To: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-2-7e10274384c2@imgtec.com>
References: <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-0-7e10274384c2@imgtec.com>
	 <20260910-b4-avoid-init-of-unused-fw-trace-buffer-pointer-v1-2-7e10274384c2@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfXyk3THRLpjflq
 +us2LlwLTbdYoj92pqkkKYDuvr4gDmjbhUaZh/9jer7JhN9EQUYDpUegLNc1net8HGpLoIYItrV
 iQX/1LvS92gzC1PLOLBjbsXcQmH4J6GV4JL/gx8YA+5t+FCOU7pAptWz9ODYjncYkwHyERg3Wmz
 QacccmWeV4hzID9t2Kwg3v9IXSvFioN8m6RjI8AJzQaBztplJv0YxUL+VrHvkQ7jt/WSYrAsCzV
 fmX6BIdi1yrKoyXkaYg1SmZIM87E/zvcLQ57obfkLkZ4uDBaaiBF+FQT/giplVj2D0FHuy5V8IK
 f+dorLpUyh1JElXtGeqAAcGT/mmREhnQX4C91Dqjv6R2fECyDATfK1+OVJUhAnXD4d9z+nIypPy
 +PxCbLII9KxXMB1jvdQzhSr8o0sxWOYgj3QMM1akEPfFyHM6mCl/CKxgodKuKz7amsF3d8fQ1UZ
 oCcyaqYApmqxj2iSy9g==
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6aa81763 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=eoBRZU4O7WcA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=8nzNZubVmXRpspvsKngA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: TMnFQODR4MLb5nJCM6N6mkqL2noxtRkc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX4vXKHuDraLcD
 /rxLleQrxvA32iH7OOSmMuP0LMozTFR2/jZYUJk1LfXGChT83ih43NVh7yDCkN4FABXeDz0z2gR
 kDnbWfD6T+I5BiErPyubOWshCtdwr+I=
X-Proofpoint-GUID: TMnFQODR4MLb5nJCM6N6mkqL2noxtRkc

On Thu, 2026-09-10 at 10:56 +0300, Alexandru Dadu wrote:
> From: Alessio Belle <alessio.belle@imgtec.com>
>=20
> This pointer, which is part of struct rogue_fwif_tracebuf_space (a FW
> interface structure), was initialised but never used to access the FW
> trace buffer - only the source pointer in the initialisation being
> removed is used.
>=20
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
> ---

Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>

> =C2=A0drivers/gpu/drm/imagination/pvr_fw_trace.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> index 6bb5baa6c41b..813b7b0c8d4e 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -101,7 +101,6 @@ tracebuf_ctrl_init(void *cpu_ptr, void *priv)
> =C2=A0		pvr_fw_object_get_fw_addr(trace_buffer->buf_obj,
> =C2=A0					=C2=A0 &tracebuf_space-
> >trace_buffer_fw_addr);
> =C2=A0
> -		tracebuf_space->trace_buffer =3D trace_buffer->buf;
> =C2=A0		tracebuf_space->trace_pointer =3D 0;
> =C2=A0	}
> =C2=A0}
>=20

