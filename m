Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353694A3864
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947198; cv=pass; b=HIx7tCrhnJWvWm4Tc3+yjh4TCn/Lw600FeAhg4wwE9UUH9wC9I5fQ9iLY9rXpK0RyqY3qtjEubP99JqB4Z2OekEw9ipYRcMdHf+fToW5uNfvT9PTyCayjCge42v9XBeMS9oYtSAlhPni5Bk3mBkUmSlKaEMEJ8zqUoEqI3AHl7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947198; c=relaxed/simple;
	bh=rtc4I2W0neXfjG2Mk3+xO4PZrj0tXMXOGRF6QZh7oNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=noot1hJTugMqoQQ8t871KFqK9kJ76s4VQxLRfSE5IxfViWeZqJkZ3IyYw8tHudQtljjs+FVxRVvN+SHveANG7RPSaWgShv+sIbOTnfU160feEyrFrIv9HIJbP4H2YJUKKHk0w7ij7q/nR+vLviTjODkE19ttmMwAJtXvqseT9Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjyUTBzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NruLwj6l; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjyUTBzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NruLwj6l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692DAL4p2008674
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEpMA0JjPRqWoUbHxm2V96T8iNrtnkKOUULUqASLDZU=; b=jjyUTBzA0r3m1Qlc
	srXGtd3iPqrX+IX4qpNDVKBmQTMR/PoEO/Y8otwzMyBe04Szkq5X3KmHc0En0jin
	F6TiRKGZVUnYBU/d2dQJro7VCzz7sfCbifEsBbYbv9c5Fk/XrAVE8icvSAAzWQ1m
	e/ZFyucCLlB5z/PIan9IJtWCaX0+etL7Hqfu80GCAYtU4/RzTQ9rjJSf+rQbd9d+
	IyZlcuiYZ70K3590jH3huD/WQYsY0xyDzKnqKv2BuLDCRe3wJLAnAcIgpeI11RvC
	KrWK8pjgJA+tJWRHuiEnkW01Rvq6argbhXHnog/GxdtSS1wgU/lUPZo4MLbM9Hp6
	3TBZXw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj00kk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:19:56 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-892be308686so102799107b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947195; cv=none;
        d=google.com; s=arc-20260327;
        b=Fx3N8IRerWO+rkoLPzy8v9uRcBTJPWc47bKwtGgksCJmsbGcEBG8vLcDCL2AiFKXhr
         29909B7OXRo5c810CCmKUR60csZRKel/my/jxMaqDaWsD71Hmc7L9h7SyJEJdzS3jSD9
         lh/L2XKPeMyx2R2RsM6jiygM7Zizj1LVUWDpIv+Brxk6iV0mrPeaEjBllz/muBBi4Oy7
         kPRazRIbXR2tVCu/Uh9EmSKVRsInHEa7ZnsRxYr7pLlXwrmJ70JKCONIpiKycwFw3y8C
         /oYcMfUl2x62ZfhY9s2MME0wy+00XjPHOP59ZXg1pZMaxpI9VyX6hHIVuNjUvqKGTTeA
         nBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cEpMA0JjPRqWoUbHxm2V96T8iNrtnkKOUULUqASLDZU=;
        fh=IImXrP9L99NK/+w7DmypiI3Tw0h3I6TT14LB/Mrb41c=;
        b=EWOh1GqQBbsuKov45I29+EXRhTEUlLMz/A8nbPZHZ1Dp0j2y8FakCBUVlFtieKVzYk
         LnfgbwC/YThI/cZ2CEDuyyQrUV2k67ivDvbxIzh/9wjnSDccA4hd5hzzh7dGcQV3lxpk
         PXfZVJ56R3XHbxVDEtKevnSv0+6XmppjgYgueZGi7rC07jTdH0DTKRmmUnpuEgOrgpiY
         JLGZ9mBCfdjYjWHUrQGipOzR8YoQSlpKgF0GMXfiu+TEM0tCwtXgt40SgZStcZT230KU
         Qga1VIPG/6TNjlCANJWtRz1lP7hzh3QaFC6kIGAfsMxCV+/k56fbdv0wS0fIcNf06JQX
         SHHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790947195; x=1791551995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEpMA0JjPRqWoUbHxm2V96T8iNrtnkKOUULUqASLDZU=;
        b=NruLwj6lS7JjV2mMXURjo1rdZr3G8YoNmH9KKbrOoO9mLApdEQ/0Ck3NmoNxZ2nEUJ
         ognAvhC3uhr5MuFAaVZPYpu5VOBr/ppm1GQZY+qrwZClMKJXUOBO4IY92iP1AiW0YrOh
         3vy58SNrMcBHZkJ1rjXtFQSAdrea8ekBZGQbV5vQk/hPRgBLP7ME1v2tr/nMWjbllEry
         ZpWdM9zqzk2fpn+JFHplbnFNfdtj/6IrnzxPXaRiGDpLaqGw8IqAinZU0hMkBHf6AP48
         hMCzzjQaY4GThUCofAVu6E0sTC5duX53+UzVSILFenP2Ox65j6nFVLauSfLTn0lUecK+
         UzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947195; x=1791551995;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEpMA0JjPRqWoUbHxm2V96T8iNrtnkKOUULUqASLDZU=;
        b=mWZhmSZrGi9OkrLn6EDDX8duHVBJTxTddWTCUJewwJ/3Q7PXazfeUILm7xVjm4tl3s
         K14Nn0LIbs9MniLFc/LbruAUFPkPm5IiYR4FNTO4+WJ4NceXwzM3ncfgTgikJxMZgOBg
         oOCmMAN2FN3p15zsS8gj33Rn0fOzqJhp6AUnkZIh6DC1GPGFKlboD/eCu8QkP7g1iIr7
         CSrqrOxmyKEUlylfml8z+/0IFVshdF4VV7VAR2QtPQMBxwMtrEF1i9kJ5dLAUcU4zAVx
         SaDLHV6Zt1ptvQVNhM9a5JbpdQv3VX83iSSdtrzd42hi9qjCzK0qGz5gUIjJ5fbeuHJ6
         q36A==
X-Forwarded-Encrypted: i=1; AKwUvBzr9kz5bVQ6lAaILl0FK6z2nOd1rJlCb/7l5GEsqpdoXJkaa5FJjg9BOB4F5x30s4Mo9EOsPcnfy/bVJZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKMOFc99rXPBaTwUhz9zQ3YynJd9gFWeVK5TZeSFmsoQRrE9P9
	nrfmWfT8OrpV+R9Fst3uWj5x5th8AHJ5a2b77mKmmIhbCQe4X8ni2TcVt6CniNCOHnQ502P+q1G
	igErlOqodFEp4zvUdISrIU0EwcQSQyOJgYpmmPYco0PTDLofb1LvGrZkVJ/BG+cNQ2r2j79IS6a
	vZjZQJn4aIRBWxqmu7uY2uu3btclr8wx03Tjgr79Eqgw==
X-Gm-Gg: AYBFou0jNl8ogSpocv4kzEPD6JgAo3dWcCD7mjfHqkrGOolDYVAY7BmIekvAostrPsI
	8w88veGgTAoX5NZ9rX0VhbbAggsPlQjTUBluvqsoAUKZWNh8phkMOYghrBOmnkPH1Bq2L1L6ZYL
	u5OpMtLnqLCtmwPEaRxIrszm7IlhfKAWVjp32OiicA4LXXi9dxTndmPrg=
X-Received: by 2002:a05:690c:4f09:b0:8ab:33d2:1553 with SMTP id 00721157ae682-8ae399a5c2cmr10779567b3.19.1790947195553;
        Fri, 02 Oct 2026 06:19:55 -0700 (PDT)
X-Received: by 2002:a05:690c:4f09:b0:8ab:33d2:1553 with SMTP id
 00721157ae682-8ae399a5c2cmr10779407b3.19.1790947195103; Fri, 02 Oct 2026
 06:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904134732.1072541-1-mahantesh@nvidia.com>
 <20260910161124.1561170-1-mahantesh@nvidia.com> <arEiHFtNB3p6g4WB@sumit-xelite>
In-Reply-To: <arEiHFtNB3p6g4WB@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 15:19:42 +0200
X-Gm-Features: AclHuK9Bb_57qi8tNaYFfNTw_y4EmDWk1JbzV8LgwHbPeh2rOth0Y00qCx1oMO0
Message-ID: <CAGgiveWF4oGhvtuGYyYeoN2jw3xUCGrZsGKpT7sC7yN_x2Oeng@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: ffa: support shared memory offsets on
 large-page kernels
To: Mahantesh Salimath <mahantesh@nvidia.com>,
        Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MyBTYWx0ZWRfX5849JtbbeIgm
 Ew/NzxAApPGRu1EedNi/Rgz8SvfQpbv0e8RgYS9taVsUFgb1fUgLAThhplr0ob+IJFEucm4g106
 1dOyRMnKQ+3iY6f9NcRKBP97CxeFjg8=
X-Proofpoint-GUID: uSlzIUOGJLhIPkSoLX4xz-zLXL_vBgzs
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abfaf7c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=_bwLWqMKaEQuuFKEIS4A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MyBTYWx0ZWRfX8rAxATydbqjd
 4Il7oLJzzpuNWZK17P4MkjkLv+sSv+h5iU0HTtBBDjNCb38YmxXcTK/yKwb2SosQrzVs6ghitfY
 /3wojoDjIBsvaCvmEixYGXmlMf+o8x1p7O3HsjxSsnBEKN6p+WrvYnIosdtMzipD8xIqI3GYo+8
 dTE/w+Ni3gSNeZc59YtyNGHfqV2JhCqq4w3ZOL+MIJQRCV3TweqskR5WdVejLgQH9FHS5YSfmVL
 vdGtnGeYOi2iE14nM81YeOLZfMRajHXCQ2ZZTq6Mc+ksHfapXVbEBNDb4XH9ZY8JLtwF4rJ97VR
 Yjc3nY+JVILOAZu9dAnNb+svjM9+1hJaKeoIqQOsGA3YMidjvPCES+EAWDR1DBhgMib0j58oESn
 1RB9rdfzo6v0qn/JLNI/i8Iv4+/0opKagywmbKiKjMfQKseWorxSIVrK1WHnT4Fry7qVr7RqqpU
 /XlgOkjC2i5/xAcPzTw==
X-Proofpoint-ORIG-GUID: uSlzIUOGJLhIPkSoLX4xz-zLXL_vBgzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020053

On Mon, Sep 21, 2026 at 2:25=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, 10 Sep 2026 at 16:11:24 +0000, Mahantesh Salimath wrote:
> >OP-TEE FF-A memory objects use 4 KiB pages, while the kernel page
> >size may be larger. Consequently, tee_shm->offset can be greater than
> >or equal to FFA_PAGE_SIZE, but OP-TEE rejects such a value in
> >internal_offs.
> >
> >Do not encode the excess page offset in offs_low/offs_high. Those
> >fields describe the logical memref offset and are copied back into
> >tee_param->shm_offs on return. Folding the page offset into them breaks
> >parameter round trips when a memref is reused. They are also ignored by
> >the OPTEE_RPC_CMD_SHM_ALLOC response path, which uses only global_id and
> >internal_offs to construct the shared-memory mobj.
> >
> >Instead, start the FF-A descriptor at the 4 KiB page containing the
> >shared buffer, the same approach as optee_fill_pages_list() in the SMC
> >ABI. Store the remaining in-page offset in internal_offs and preserve
> >shm_offs in offs_low/offs_high. This keeps internal_offs within the
> >FF-A page size, maps RPC allocations at the correct address, and
> >preserves normal memref offsets across repeated invocations.
> >
> >Tested on ARMv8-A with 64 KiB PAGE_SIZE. OP-TEE OS ran as a secure
> >partition under Hafnium (SPMC) over FF-A. Verified registered shared
> >memory with tee_shm->offset >=3D 4 KiB, memref reuse on the same
> >TEEC_Operation, and RPC OPTEE_RPC_CMD_SHM_ALLOC (xtest regression
> >6007-6009). optee_hello_world, optee_aes, and xtest regression 1005,
> >1007, 1008, 4001-4003 and 6001-6003 also passed.
> >
> >Fixes: 4615e5a34b95 ("optee: add FF-A support")
> >Acked-by: Liming Sun <limings@nvidia.com>
> >Acked-by: James Hurley <jahurley@nvidia.com>
> >Acked-by: Dave Thompson <davthompson@nvidia.com>
> >Signed-off-by: Mahantesh Salimath <mahantesh@nvidia.com>
> >---
> >v2:
> >- Drop helper indirection; mask internal_offs inline (Sumit Garg)
> >- Keep a single ffa_offs local in optee_ffa_shm_register()
> >
> >Link: https://lore.kernel.org/lkml/20260904134732.1072541-1-mahantesh@nv=
idia.com/
> >
> > drivers/tee/optee/ffa_abi.c   | 22 ++++++++++++++++++----
> > drivers/tee/optee/optee_msg.h |  4 ++--
> > 2 files changed, 20 insertions(+), 6 deletions(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Looks good. I'm picking this up.

Thanks,
Jens
