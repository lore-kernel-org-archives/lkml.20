Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A84854E6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256388; cv=none; b=bZu6ACx+dVVY5C2JYLKuYfGvaZeZF34u5EySCj+6MSMdNiiqpO0LnDamDvv21BGooy6QtEe5GweHKUcuMEkYhy/ZU7/o2jiW4OBG+F78ouu3KdAcCnI+rhNDD6Xar/Naanmw0KKMZMDv2hNn8k4SiV1jf4+lvn7MPSQYDTasnVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256388; c=relaxed/simple;
	bh=2fwFBXsCvJQtbhUN4/amk+7T64vZD0K7vq5LMOgqQ6I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=geI1Nv9ZoUBqq/RT1pk91TWj2AtxnIDoVPHuQqTJWX/XvS/H5Mnv8GvrhQhBgX5ATnyBDjtm/F7Fa+jQ61zw30hIdBL5G92w8umUhvVRD/mPQZkK14KvCTzefCWhZu1IXj8wdZqFQ2vazow2ecOwPErvEdORfUPDlsj7yUxlY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mye103in; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mye103in"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC6Lnr2028082;
	Thu, 24 Sep 2026 13:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gwpARK
	iQNnpgf81tDX2md7RZxQA/xVzy0a5NV+C+Fz8=; b=mye103inZqYrHyL69VTQBA
	aEk0iyS5LCx1miSbeJt/enSakQWqMQVOWTePpCun46rfhJod1AVQUqyfnYlyqMvQ
	D1KJxUBVybo9j57sUIp6hJABBtHFnNxk7h2+iJcu1WmcezwY2Y6EfVWcQHMAbLMP
	uFrOGU/UHeG0FmSGNGsDWhtDUhWhnbk/XojNQLWZvIBOM7uaL09sg5XeFX5pZmFE
	DLAR3keX8fTQVfuX9mpEw79jD+CB1MaVN4oiMvOOpwhtIT+MCrS4bnxpUUlWHNuc
	SD5C8XheXgM1BsQs+CnragHAinEMdF6+zsY7bZBUFjtjSJLRqEeCmvaqG5WZv2gw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1rpym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 13:26:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68OCHYD72061443;
	Thu, 24 Sep 2026 13:26:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gvb8jx1ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 13:26:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68ODQ63q43581846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 13:26:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 293732004F;
	Thu, 24 Sep 2026 13:26:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D3DF20040;
	Thu, 24 Sep 2026 13:26:02 +0000 (GMT)
Received: from shivang.upadyay (unknown [9.39.19.125])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Sep 2026 13:26:02 +0000 (GMT)
Message-ID: <a18fbf8f3923f14215006a23a5a94dae63ab3ae9.camel@linux.ibm.com>
Subject: Re: [PATCH v4] ppc/fadump: collect dump when CPU_STATE_DATA is less
 than reserved
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
        adri.vero.dev@gmail.com, anushree.mathur@linux.vnet.ibm.com,
        chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com
Date: Thu, 24 Sep 2026 18:56:01 +0530
In-Reply-To: <arTuiz2iOQkPdHwT@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260828094942.2439404-1-shivangu@linux.ibm.com>
	 <arTuiz2iOQkPdHwT@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: wVOix475_KU8V2_XIJ4UU-t0I4Z6HeUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX3Pz844GeKK41
 ixIiaRSEbQ2XAp3dy62052i/DQ49tc7nF0Gzyb7gnU0SFIYoeFFy9UB9cmiVKvM91FG0kWO1NWN
 7KtG95s0WslX+bYii4t8nf+lPYCmLMdyHlbXLzOD9cWG/TKa+zwtRiokhThQrzkao18O5z+KPGe
 ITuBxjVVW07ajerHuZ+ry16mrjU+ekQ3U5rVf88jnGNZNwOv5jhhvQ7mckAZfK31UDz0Ub8ON1J
 r2RQ2DA+p6XQLdJiU5NfI3EiYU6O4xBKj1XVR/CMRNSOpEEndtatLTNe/BQruZZEle+ozvcJcDz
 ofN55prhBdShzM3hTdI8NIXQBsJYhZ1uf18eIDgzGehTdonxhoQSe1yoy1CnICoktRm4wgCO/ld
 5LSENzjyFTFFmlDHeORtibO+/b+wM1EM6hZ5NmHoZqPc907Z7Bu5RKXfuEVRDThiu1btlcPZnz6
 Yp1A0YdfyeQW3JvejKw==
X-Authority-Analysis: v=2.4 cv=O/KsLx9W c=1 sm=1 tr=0 ts=6ab524f3 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=5BmOn03dfxg9LWZ0LBYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfXzb3MKBOFYzyr
 mx1kDb11idXRVZLENdAOL36ANhA7Xy3JZIkfmWgWptHtL7HA9AlRS1o45XEgGdMqFtn0e2V/8Ev
 rGijqIWb7bAQYh/+N1dUthn9oIiuqwI=
X-Proofpoint-GUID: mNk1XpUK_s02Vdcn8pomy1Q2iB-qdEqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240054

On Thu, 2026-09-24 at 15:06 +0530, Mukesh Kumar Chaurasiya wrote:
> > +			 */
> > +			if (!(bytes_dumped =3D=3D source_len ||
> > +			(type =3D=3D RTAS_FADUMP_CPU_STATE_DATA &&
> > bytes_dumped <=3D source_len))) {
> > +
> Extra line here.
I'll fix this in next revision.

> > =C2=A0=C2=A0				pr_err("Dump taken by platform is
> > incomplete (%d)\n", i);
> > +				pr_debug("type -> %d, bytes_dumped
> > -> %llx, source_len -> %llx\n",
> > +					 type, bytes_dumped,
> > source_len);
> > =C2=A0=C2=A0				rc =3D -EINVAL;
> > =C2=A0=C2=A0			}
> Can bytes_dumped be greater than source_len?=20
> If yes then the error is misinformed that it's incomplete instead
> it's corrupted.
> If No then shouldn't the internal check bytes_dumped <=3D source_len
> should handle it?
>=20
Yes, It can be more. The wording on error here can be better. I should
change that in next revision.

Thanks for your review.

~Shivang.
>=20
