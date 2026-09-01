Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519F1F94F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244067; cv=none; b=K31xNVUAGmAhH+BZbbBNmWTuifw5BEEpHdQrAVXb/fJWhIXIcLaAcVsuykFSrpYhtVu82vvNp9ubwH+N7H/rmHWaxB34MnECjagaUkUVaptmhsEbSFQbo6n8aQ8jLBlDQbvPmKu/n5evK1FopVO9MHbI7wzbd1tf11c5BTTwOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244067; c=relaxed/simple;
	bh=Y8mHLOx+wtce4RyjabD41CDuaKeVNU7DDLvuPxHWvL8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=FJoxuLTWsQ3XcSVp7x1bYZmJEMt7gMr4v9mM1dO+W/yK30kL0ZDzjE8JLwPrl9Wv9kdOkQC68RMlmIvKeRkbEyHp0IyScAdxCCataRFTpfy3dohCL2Kq3QuE0RyUhilVchftcnxWN6iVvMbUhHbiSgrabCI46P2VStjGq2KvEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrfNpzlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlWCIECr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrfNpzlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlWCIECr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68143cVa1646656
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8mHLOx+wtce4RyjabD41CDuaKeVNU7DDLvuPxHWvL8=; b=GrfNpzlpzghtucaM
	4VmWm45cf784zPv+cB/aE1qSk5TnOrNSEIA9m0nQlC8yEikDlZ0kkWfvJaleZ7aw
	TinVPtmWErrkA7Nxald54RcG2dgtL+rqr/a9gbJdwOaFj8tJbp1vUCdTtvTCFT3s
	WmDSaUNAMZw+f005dyb0aUm0N2wjccBVycJ/wsRCj4Rg+rKR7KUH8F95lJeCOjW2
	d50psYJmPPHjALpkxAt+hvlNqs7dRNNWI72fO9PVAyIVCtmQFAFpNQPjXQXl4xQu
	pVOT2abvKwF7QX2Fv51uj3qhZCgFUnd5us9UWLkDMBHpVt2H16TJdHHmLKV7S/xg
	vW4i2w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0fvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:27:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so6261323a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244064; x=1788848864; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8mHLOx+wtce4RyjabD41CDuaKeVNU7DDLvuPxHWvL8=;
        b=dlWCIECrmuhhDxIX2Rcn0hc3xJK9+uieWPTgQwWYgfLROjhR7MRmCzsgUfJtlAIbsK
         Qi1VZ5zhY6ksMBWqn3A9M4C6y+CdE2Drm4gbA/Zrzz6XYhu44N2ZeT/9JwJ73fcqRcjp
         D9EHKwvi8C/d5EIih5Aoh2Z04DCc+tXVKdja/EskEqv5qxqLBiGpyblhcdZ1S/CCwtPs
         ENHyTkcnAM+B6zCSd33jjQsJogpWraG+d2O96WWuaNFJHVUb0DUkUMuZPCnGNsIn1ML+
         SaZnl7wmqcYeMXq/Lj2DlNK+XhfE0Wi+6LfUGvdYomjRObXGEsQlSZWkBSZtmjnsqDia
         /KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244064; x=1788848864;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8mHLOx+wtce4RyjabD41CDuaKeVNU7DDLvuPxHWvL8=;
        b=i1ELnC5JbXolaWyO5wqt2Dt8Ooumy+pWDjnUF7bgtfrVbO3U/+rx7LDl1vfz8fMhFG
         Ap5h9neAnQRu59GSd8uwhsPUawSig4Pp/fYdIq8yXdc1j01MuVV8ptDOPv7znAQwasfA
         FgNuOxjVDlIUxu8t/xaS8d1LVnDepVGQ3E24aiOol2QGNqo32E/4JsTs5Dyk/aMRtaC0
         nVtYlA7y9GEp1PwWIhETipu9HvB+AboA+LNXAAPuiYZPdEzfc6XPkgVpeABTS2f0SRDT
         BqI/1aCYCIs52TpacbYE3Il/ncSm18QiA8p6mCbuF6/oAWWqUKzWQLWZ2t6zlK+E6uGP
         3tyA==
X-Forwarded-Encrypted: i=1; AKwUvByBwm97V/iZbhQM7YLKVBy4hC740EpTnR1gpXPhlds5oSt0Q5JiBMub0w0aqvUwEJG+hZiv5XCqxxlIz1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nVubpVcbhmhCuq/TEEwUU/Sbre2IAGrjShCcfGo9MKP0pIFYN8
	oye2OfwZSRdXEAXahE7+T4n8rpeZnxnqUVz+Oqj8W8phFv6JE8RK2efJC1S2GaKKsGiwks852ua
	6J7ALcGwzARW+4MjQxN/487WA1C6QYUN2+i06uzm5fa1OucbNtuNjzKsFrmmAaL+764M=
X-Gm-Gg: AYBFou39TQJTuwi0XU7/W8nbCXGut9/ta0hYb3N4kxrv/akvxpmM6pZwhHX5sR0taTv
	RhsNatHtO0dBjBQtTAMf4HQdX8nlRuWVOnsn8L9kTbkXjK1O0rPXNHIW1/YsXC88tZK+WhfVx2W
	XCEnVeu8AFhgU+JtqidUTFyiRiIpekTakI7OOKKBAKHQ7TJQuCjKGFTCW0jnpp3FobnloFuTfQa
	0s9vVzytUARqAER8MpP9gfX1POhmtDHq57WFS3JBisM1sg5pr1Wx7M07lCqU8VcVzs0EPKoHlQR
	h/vE39NMuNrjG3+khmu6HXoHRm9jnBsZpqxM8j7Lg6b9PWSF7HIYVrFsK4cXVNH6+YXd4nT+CM2
	7KZPdBG78P2EfKmbNBtJPikhp/M5tT/4PDFMOUruo9K1m06YxLF1sflXCVI26PwqLx4f/CdQlX7
	DI2IrgtQqp
X-Received: by 2002:a17:90b:2ec4:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39907d659f1mr8222171a91.13.1788244064146;
        Mon, 31 Aug 2026 23:27:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39907d659f1mr8222111a91.13.1788244063600;
        Mon, 31 Aug 2026 23:27:43 -0700 (PDT)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm21558039eec.2.2026.08.31.23.27.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:27:43 -0700 (PDT)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: "'Suruur'" <suruurism@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sean.tranchetti@oss.qualcomm.com>, <horms@kernel.org>
References: <20260829170656.15548-1-suruurism@gmail.com> <000101dd3986$7f498b30$7ddca190$@oss.qualcomm.com> <CAFkjbpACa31H6z3rDYmwB4z1S65soGA730uZj__bS3TXctWXyA@mail.gmail.com>
In-Reply-To: <CAFkjbpACa31H6z3rDYmwB4z1S65soGA730uZj__bS3TXctWXyA@mail.gmail.com>
Subject: RE: [PATCH net v3] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Tue, 1 Sep 2026 00:27:42 -0600
Message-ID: <001601dd39da$feb82e40$fc288ac0$@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKQ4MYU1OYF5H2fefnV2nbrvGeKVgF8JjdFAh+8Htq1NRQcEA==
Content-Language: en-us
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1NSBTYWx0ZWRfX6Tdqv8OiYJv7
 S0vxeRe57ceAx1Ks9OZnsJ/luyAPyzDB5LjDqodzwIV4bmY/LCDGcjiFnhRhMl6fmVrQ6/ZwvOR
 RHHUT91arPWKTXYR6Eax9kxhL79Lk7E=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a967061 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ya-tavI9dP6_ZX2sXwoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: i8rVUaYrQ8bgCzLS3oJbwchS33uz_g_c
X-Proofpoint-ORIG-GUID: i8rVUaYrQ8bgCzLS3oJbwchS33uz_g_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1NSBTYWx0ZWRfX6KYtQjO+HV3Z
 vcw6wv8sC/N85uIXcdFlwfKQLLS7oKY+EUQlcsZF1cIzWHEQkw0C7g77v5gv+mqlXAH/+wYg+08
 4tbyQ5rMObcWExcKsxwT0U4hFoXD5Hh8ptR7bT3ctv1VCnYJGrnqJZPaSbi4lrW6XxgH8R2cttZ
 8iciQ/UfueAhPksPauEUx/kNIarW4aXb4V98N1o2diThPaDPORHV8TxCz32+yJi8X0Uxn7F2/ME
 5Ne5yPjFPHjF2GUA9k4rpn+mufZVgJmH9vf1mhvgtXIJINQ0M/M6TBbxluNENONPbd50AvCftYT
 TndJyIJqSuH+pXNGXfpUuYy+rieIv2IcW4G04BJCFOkzh49Ev29ziMslAvVll4+pML0RPdHPAjZ
 0gECFTF9xFhzWpeasI7zO8ENGDaeiEYn4eqTl4j85FzrGoUASe+hjkBbYma708QK60YwHr5mAYj
 oPVRbEjx/FtOZ3hAjJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010055

> From: Suruur <suruurism@gmail.com>=20
> Sent: Monday, August 31, 2026 2:48 PM
> To: subash.a.kasiviswanathan@oss.qualcomm.com
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; =
sean.tranchetti@oss.qualcomm.com; horms@kernel.org
> Subject: Re: [PATCH net v3] net: qualcomm: rmnet: require =
CAP_NET_ADMIN in the real device netns for config ops
>=20
> Hi Subash,
>=20
> Thanks for the review. Here is v4 with the comment blocks switched to
> the networking style per the netdev FAQ; no other changes.
>=20
> Thanks,
> Abdifatah

Thanks, please send the updated patch in a new mail thread.

