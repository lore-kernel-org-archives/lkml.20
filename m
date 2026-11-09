Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240718;
	b=Z0N+XsNnCpAhg6YlBfIOj8MWCPnDDfDRekkqfl5xguUQCZ+3NeMkDsMNHNGIYRoawR1T
	 GsA6lwcYeETP147TTdyyo0cBpUkQu5B2CYvG1K1/4yOErd9UenafCOBfvDUkxPcTAuuk1
	 gA2unybA/0uf9dX5uuRUNybms7nyecGRPl0qioovrl3FWzb8wqSjg2DUw0GriM5Y89VGp
	 8xakq1m/QevyYFQIJ74VcaTfjhEyj1oEHMg6T+6YmXSx0yvpJFrp//55dm/LZgYlBmx05
	 GhhYi/5qCBzSL0gqjHkr5LKQD6+hYwo7bY4Rd5bDDj+700wZnPDT2VRh+6CWbSUbang==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s55H9DSMdJyN+6U3pMx20ccRfM/FfrmdAeX1so7Mbts=;
	b=G+blOnbl8SoI3RBhqYTqG9ffCS9fllwL6ld+BLwmSSMPm/aqTZldhGeY/R2GpNWsw4YR
	 XAEDLISD++MtQUP3ZDRyQVt8TBR5p2M/5drVh7VmEGd5mC6C75dFCoPUsNSl2KtZBrh+F
	 b1lbxfhBC/VEE4HEaFn3JwQKWMOGISyaMIKRm6dEBI7MY0ixuk86atz9t89aiyY0m3nl8
	 GApWIv/R76G4iZvRGjjskx5bDnMvhC8UHxRvicjJhd2uEty/PG1JmDtc/diUYJO/zy0Ge
	 FmqZxAa5LWj1lJmL8u0rcnxKKtX+7C/PFPAD6t0vkFnauZbnSTaadiSOm86vb6pM89A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhGcte0Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J4Xsd9jB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058EA606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhGcte0Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J4Xsd9jB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEoEW1322908
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s55H9DSMdJyN+6U3pMx20ccRfM/FfrmdAeX1so7Mbts=; b=HhGcte0Qp7wY23ZN
	C0FSBCegN49thP6q7OSLdjtStxTFqCRYbpOfLt0nQecHaIkpWgy78q/+Ve8bx2OM
	AQTdrftOxVcYB4lPy3P+mzV32tcFxjJhM3XzRBKRnjoqYbjDTu+anV1zmsmxOH91
	yOq6cAWzquayj/TTFptm0THnz7ez0qJ/6tmbXGL1Z755XeHISDy8VeDN1Lj12KrU
	gYjnsfzlsuwB+BZt+h10YWFPh0Xf19aJOSnRWgHmzzynL+LpuR/NbHPYuwrdz0N3
	lZto0ang6UhDA3Nt0iR9Da3ROc3rw9VucmvHyRTcqXD16k8n1+yNuWU2xZJwQWTW
	ntpUZg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrtuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:11:57 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a88d53c7a6so14238827b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240716; cv=none;
        d=google.com; s=arc-20260327;
        b=e6UAWR4outlzGmMlb13RXPF8V08fRfeU0zxljZkuPkTLxhcC+GHrxirFVfo2iM5BUI
         KB2ltipJe9I26qvYo0Of/veiSQ9X6HRvsEgM5nLU+UM5M+PYNZA2KaeSjsHnibbSJ+1c
         RiDG4LTA2W8hX3rHoz4+Tph+YXW1r68vFfhFuGuFKcXvAEOIkXVAiOcN8rqxDPusUWej
         gICCOspOxNVBimWin95Y8CgDELz0748FHUr/5KK82WiwBKb9i+j418mj2GNFQx2C5BJc
         j1mkUhonnbqlzyVJo20iV/pjGxdFQMbTVDwZd8jsthY2hvFn9imTNh98jtZHeaXWYxvX
         qI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s55H9DSMdJyN+6U3pMx20ccRfM/FfrmdAeX1so7Mbts=;
        fh=27TcTZ/EQ7x/QeVg895OcPbGSeTHBr9CJXjrhUUOxXI=;
        b=XJga6Abv5PMPopEA3qocMosz24I0ZVNT9dR5JqLppV4jHh6bwj1psSMYJuLkZAZp2j
         arg+h/eCzCCxRjIoU45t0Vk+Uayqoc5bC1kwiE5/aqnPqLGyYMNmympHCSlUqWbVAH6b
         7LVyGXPQtedAAJYz4bdZF+qdgs5KCGOE/pam+B5si39KZ0fECjxps0i9w7HQW2afzcDh
         UjlvpSQSOFhiTg3EUPFoNjoAKDM5LTa2Cou2EZHL1RglOUjkhZyRIV+a47m6/wzU+lOH
         jvqdTBiajVS8Is+KFQokKCq8zzyewGPhEKvVwAfpkV0lyT/y10R/So0EuwJ93YpYp5Gj
         CXfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794240716; x=1794845516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s55H9DSMdJyN+6U3pMx20ccRfM/FfrmdAeX1so7Mbts=;
        b=J4Xsd9jBIoSjY9+RyiJSFANoUvLvE8SS+7wL0fJByYClqsVbHG4VyTmr+zZvRypCBE
         yH38+RVW04/RisEAFQdKgC/ReUgsZd6mY0G3piu4Qp988w2Q5DmyGI8B8f4jyk3eLUfR
         TN28kOfwJgCec/+jpJgUODr0+yhQKToXvErmkvCcI9apm1rCg+DWoUKP/5SCqcGR+CjO
         5OsUusuvRXLCiejvmM4dIk6zaKIJ6QSo+vYQh0gcIgTvJL0xfI6wzpKsIHvk+quDezfM
         rgRDdCj28wMiE4u0Gbu0K20F4c2IEf8FZ1AdmHTlcJO6DjOE1kAfiyCb/iJjRIFRXFqE
         8Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240716; x=1794845516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s55H9DSMdJyN+6U3pMx20ccRfM/FfrmdAeX1so7Mbts=;
        b=Y0A2TCavU88s/+Kilipr6HGRyaGwvpSfUmhnL3SMxqr9rDmgAMu2xWKe6HFQ68YGIa
         s6jx60BG8KKeqBKVtFAFVuutK81HXs+EaTX9M3YY2+T9UwTHaFcsmA1i6TnFD1i70dej
         yjPRcN5hAeaL/oldBsR8TmCGjyaA4j5YBjwWxp81iUt4cU81PjYsHFhxFNMN8GgtO1GA
         LY8eSI7ZukZ3hUD41uqtd2O6jOzmTd01C3ad+sQGudcmN0EKPYMvpgwAEtUXutl5i2/k
         urtxRaUFsrvpvQ9QLR2lNc01CmX/uv5L2db4+e0JhEpejZ5T2qYjIgxWpzsM4C3ifx3u
         6i/w==
X-Forwarded-Encrypted: i=1; AL+hErGGz7PHUP/bfSHNzLJYLUUNBXPnpT1p6prcC3JZST5XLVdEfzANUdR68LFOm3cXGtP44O42UIvXC+Qrj8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BGNbVNu/y35bNP4ZurVgsdYfEnqQZJ5LfmRrEprcdlUSVa/0o
	zyN3Ui2tNVz1fU8fg1MCXMCU49mG9pzKzPyuJPeSgbWZHP29GaeIfYp4euKA2hUvyCwB7CHwNmZ
	TnXMAsIjMHKr+Yv1VSnaET/7V2Ct2OkHzRsvC5W1T+8qm0uHTOV8IXaFtBlsikdjxL2OY43m8Vg
	NjWNtsvkz4qh3MNijgy8xJMrR3qFa59otBdlhMRC+Xhw==
X-Gm-Gg: AYBFou1lpJaMEXYwdjCa/kYdxistkZWQdveB9h0oVM4CGRY66fC195Nu/bf45tGycRj
	W3kxmUKUcpULeO7urUUkQXK9OUB8IrN8c7e0sV71yu8A70+fDoKnHMRynZCsZRB+h5rCForzr1v
	znEwSJmcBm92JGQfce8divyQfMqSsJLqelLJtwJa+jk9pYKLAByPDPDnOXMgJJZ/gN69Iy7g3hl
	wF0/ZS5ztU4pmo6yk4L5Duirqbgk6LEcYth6ZkX
X-Received: by 2002:a05:690c:e650:20b0:8b3:2eb4:1423 with SMTP id 00721157ae682-8b36cac2f01mr16022217b3.25.1794240716195;
        Mon, 09 Nov 2026 08:11:56 -0800 (PST)
X-Received: by 2002:a05:690c:e650:20b0:8b3:2eb4:1423 with SMTP id
 00721157ae682-8b36cac2f01mr16022077b3.25.1794240715815; Mon, 09 Nov 2026
 08:11:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260806060727.191-1-getshell@seu.edu.cn> <CAGgiveVEiVqxVO-B0kxW9uCb43g2ocs1bgEZLWpVq=+AERaevA@mail.gmail.com>
 <avFnybu7UDEdva94@sumit-xelite>
In-Reply-To: <avFnybu7UDEdva94@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:11:45 +0100
X-Gm-Features: AclHuK950jimtjNEPKF71997ib44N0__-ACIHjqESr_H4Xz7V2A2clS6kzX4824
Message-ID: <CAGgiveW_WuG9E7ZGuEEbr-bW8haUPmw+h_5PDxzPauBH+z=mBg@mail.gmail.com>
Subject: Re: [PATCH] tee: avoid accessing dma-buf shared memory after put
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Hongyan Xu <getshell@seu.edu.cn>, Jens Wiklander <jenswi@kernel.org>,
        Olivier Masse <olivier.masse@nxp.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NCBTYWx0ZWRfX1FwkvA7n2lpl
 4MXtubA5E2NRRSgA+NuI+X6QCPCzt2bBNzzN673OCKawD4RDTJe66f/0EbrheFiLrE7hnJOzVTJ
 Yr84Cnr2MAo++07W7kijT8HXcTlabdtJO7jMuyw8a6tsvtIr9Je1ZJJ1HPpUsVBDunFBclHAG9U
 MicvMFLX79fgMYi0tFUemGnLCdOCnsTu/PnV1W93vPQV3dXHZtVV8dEaSCYJZOfzsB5t+8t1evq
 095aqRKiOvwYbdSmtwNhfQ4s/9sRj+m5SEGwTxhV8Qof45O8rOh/hG9yQACYGlWNF+7Z+miwjI+
 Nh1IoRznKeMoZy17oCJK7bEeF8121XOleZOoLikR+wAUUWgbuydXtPNcqO8MHgjupnKSZuMQmhN
 glJ8RxXJXP6LXL1r7+mA56rbD7DcpM16Q9bq1mYGiUCyJaIf8z200Tb409XcHVUEzkM/iZyse5v
 elxmR0bhw+3kXILWqJA==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1f0cd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y-31G8drY-iPl3fTMagA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Hm0ICRKy4g3cfIEpeJpub5-uivtj7bRd
X-Proofpoint-ORIG-GUID: Hm0ICRKy4g3cfIEpeJpub5-uivtj7bRd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NCBTYWx0ZWRfX6MHMkQAePCFf
 pEqsoZ9SXRQBSkBuFwuNfey8/tUOX7MTwSazhIUJwGB1Ty0rik5zdcLVB8+ut40zy9OOmcFQe4G
 AJtWJMQM5DjQBCovK5jOe6Mf5nL7qT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090064

On Mon, Nov 9, 2026 at 7:27=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Thu, 05 Nov 2026 at 13:56:51 +0100, Jens Wiklander wrote:
> >Hi,
> >
> >On Thu, Aug 6, 2026 at 8:07=E2=80=AFAM Hongyan Xu <getshell@seu.edu.cn> =
wrote:
> >>
> >> param_from_user_memref() obtains a temporary reference to the dma-buf
> >> tee_shm wrapper by ID. If closing the shared-memory file descriptor ra=
ces
> >> with the ioctl, this temporary reference can be the wrapper's last one=
.
> >> tee_shm_put() then frees the enclosing tee_shm_dmabuf_ref, but the fun=
ction
> >> still reads ref->parent_shm and ref->offset afterwards.
> >>
> >> Save the parent pointer and offset before dropping the wrapper referen=
ce.
> >> The additional parent reference keeps the parent shared memory alive f=
or
> >> the parameter list as before.
> >>
> >> Fixes: 146bf4e75eca ("tee: new ioctl to a register tee_shm from a dmab=
uf file descriptor")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> >> ---
> >>  drivers/tee/tee_core.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 1aac50c7c1de..489c39d5b35f 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -397,6 +397,7 @@ static int param_from_user_memref(struct tee_conte=
xt *ctx,
> >>                 }
> >>
> >>                 if (shm->flags & TEE_SHM_DMA_BUF) {
> >> +                       struct tee_shm *parent_shm;
> >>                         struct tee_shm_dmabuf_ref *ref;
> >>
> >>                         ref =3D container_of(shm, struct tee_shm_dmabu=
f_ref, shm);
> >> @@ -409,10 +410,11 @@ static int param_from_user_memref(struct tee_con=
text *ctx,
> >>                                  * list instead of the shm we got with
> >>                                  * tee_shm_get_from_id() above.
> >>                                  */
> >> -                               refcount_inc(&ref->parent_shm->refcoun=
t);
> >> -                               tee_shm_put(shm);
> >> -                               shm =3D ref->parent_shm;
> >> +                               parent_shm =3D ref->parent_shm;
> >>                                 offs =3D ref->offset;
> >> +                               refcount_inc(&parent_shm->refcount);
> >> +                               tee_shm_put(shm);
> >> +                               shm =3D parent_shm;
> >>                         }
> >>                 }
> >>         } else if (ctx->cap_memref_null) {
> >> --
> >> 2.50.1.windows.1
> >>
> >
> >Looks good. Sumit, do you agree?
> >
>
> Sounds reasonable to me, FWIW:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Good. I'm picking this up.

Cheers,
Jens
