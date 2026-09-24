Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA53382FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236647; cv=none; b=UHoYERNc8op2ofHVsuzlF1dV+om8e7uTCU4phmIdHywUbhCrnUuWKnHHsEkqu+qqBOR4Y44NrbeSu449sVAYlo2mETKw2LzCynIEh0XXjWY29yTkoxOx1jnWI558LDjiOfImXyuiijAqZZTNwuPh7JD/+GbsLJRoOSjr4YqD6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236647; c=relaxed/simple;
	bh=HcXaDz5KCiX2wRs6pF4PPkcCP1k1shxEJGxo93Vesck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6wIzNEQQooBxWrMg/V1EjlIWgCbfSw0cYPBGsDsIBnDTAQXdH7MHj2OmFPcJeZnRiZ3/QV2sQCP7oeOgNC6dWEw336Hi+lTeB1khawV5RwVUVitVX1so8YU+Ft3Lc18CqgOh09ZW7YHO5TCPGwcnfzr6mbPFvHIok5qwWoGJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oo1VqYwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anv6H6Jv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oo1VqYwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anv6H6Jv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5f9jH2279432
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B1KraGaFrLufIKtIo+iDUvbQ
	2uJXNY7+zBo1hgqcENs=; b=Oo1VqYwBPFQ3domiq5wFNAbS80Pr4QJt0FKuaRJ6
	lJjtc0bJQSlO1pvn9TqdO6onCUIfw8AgSdJ+xetIjY7F4PVdSjWaP1DXuu4fNj4p
	aVuWI21NdNbkNXgfIIB604sz5ApHhHOx2g7Gif3/pyqMote+wi0X7P8gEnWi/uJB
	dDA9yED9e/0g1UScS4GelwgNkngf8pybupmf+9lGuhqJMBmu2W4lHRjBzCe/D7Of
	FFOYaUIcIHw3vax4tj0+yhz7HLuwSGPN1ElKQ6oJUf6LHgGNEAdZidSAqPHaBAKh
	NTVQK7T42mp+Getc7cYCBk2O6MmUAtkbfvVtMqYnfLAuKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxv09n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:57:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so423432985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236644; x=1790841444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1KraGaFrLufIKtIo+iDUvbQ2uJXNY7+zBo1hgqcENs=;
        b=anv6H6JviGmT7vEPTU63QiCIBuRL+aheFql7kcg+FDZW4LYkRvx5ZLta294LoFud9M
         wOklUYr3BcBCgC+H/QwD/Retiy7yjgc0iiIXONRAjEKRYSBs9bnEjRhMxvH/7IA3alLB
         NvtXyESLeF/PGO/iaiqMCiDVSha8ggUkHwuZLEz8+ugiDdV+EWrogwTmbMztLqhsld0B
         zVcOI0uTdSvQbifCofrOseLzCid0WreflrnOw23NwVAbOC3jCY2NEaxp68WCkMacSIGC
         7vqZi0m7eI4ITzcDBYyc9pEQ7ifFM1y6zHQ42nuX7JUBE3G723mEx//pSGo+6lviaa6a
         3GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236644; x=1790841444;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1KraGaFrLufIKtIo+iDUvbQ2uJXNY7+zBo1hgqcENs=;
        b=iJkgTupAA+didhkICuG1dftk40zYtAhutRgzfO0Kwehdv+ArUyR9rqdEe2pBYyHm+e
         laMiw0Qg+ggwbN3mAZ65WR2yJQpn6ge0bYhpmgUzpbO7fwdfTakpZyHz6OnfC5ZmYzoB
         pM7K1bE01ekjBKgwDJFXwC9a7Pm3ol5BYonzInE/LzPdMkFWJxSpRtfr8vLMTwP9Jmzt
         c73gEAJmpBoXha0GWmaU780e70ZXQWkVv45KcqDjPsy/Ahi+G6VqZbqUsGWcVoER8ZrF
         SGEhkYPmLfhhzAUo/0CskW6LHmhlYHxvEgjf5aINh0vb6r557u+B+KWVK5qmCjNPenhk
         56+g==
X-Forwarded-Encrypted: i=1; AKwUvBwfm8BXnnjtLlK7Bk9SBnraIsg933qNvvOqDtpgom+RymDl52Jpe5NF//fio2+6JR3GpZrRtLWEozYUtPA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1xdYzfQOVryG1tl3wlNBIp0l5Zh/X53Sheb5Z+NDj/X8LkL0H
	OhWmA5v62nE3zLVLK8dMKOA9Xg/BRyss/+t9A1HACs3NVl4Ne0bz7R5mJVso9zHNCVT1BGAbhFq
	HjQFfjkCQGMRM2GpPS0I/KHqsLpzXx+Y0/JNpymB9pSSjJeWLfs66GkZtgAruMf7ckmc=
X-Gm-Gg: AYBFou2tFGJsw6j2Wvq2Ouq9KgZepSKUyK7ToLsn0rm6hUDzFzvtXSG13jlRYZqOt2T
	x/BGg0BUqn3CrJUlDXe+LLTwcZEZU06+AN4IGQsISQ03Y+5wIS2f+YSZE8urxWEM2Y0LBmBJEt7
	GfpcBFDn3T++UUifsP3WKMSFhGhm9tFuWqvx5UC1jsXsFXgpo965QparZYnmAKTjelHqRi2MHUX
	LhNhp1AK1Iy2PuftajVRvzkrQL3VMct8oXMnEeltq/LjaryJe7zq0/3+di8is10jO5OKhef3uLu
	QnNxxer9fON2zCsSCHSKQZqliBdH8lnwVvxi7+hu7+uxKkqn3Bx8D2LVNhrug+2xR9V5FyrXzPi
	j0bILWSvDlVwXUA==
X-Received: by 2002:a05:620a:29c8:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93c3640435cmr182070285a.54.1790236643791;
        Thu, 24 Sep 2026 00:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93c3640435cmr182037985a.54.1790236636558;
        Thu, 24 Sep 2026 00:57:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae53dsm49769305e9.4.2026.09.24.00.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:57:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:57:14 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, maxime.chevallier@bootlin.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH] net: stmmac: guard FCS stripping against runt frames
Message-ID: <arTX2kNFGXLg7vdn@lore-desk>
References: <20260923162339.1375698-1-qwe.aldo@gmail.com>
 <arQ4dVkI9llhXCDx@lore-desk>
 <78724445-4c69-44fb-b82a-1f9275e37e9e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35r0MCTMsnB7aZOv"
Content-Disposition: inline
In-Reply-To: <78724445-4c69-44fb-b82a-1f9275e37e9e@lunn.ch>
X-Proofpoint-ORIG-GUID: vvCTkELpRJ1YitVdvVf-rjKNwLbnM85s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfXzTodUx+RWTYe
 IpgGaHCcU6RcefEw+x6TZMmuMHVOXNuORj5Q/yi4rcMNqBZvEgNyTT26Px5LFA0Qf0G/DCU6xsq
 u/J7VyP4uWtUL4IeqQ9wEbeCTjEZbxxRC/i3JN8Ff/T/31G365gQQb4TnCYWo5qV1RnqfiwwLnu
 BtRTKWM9QNQ7zNeutgmvCT0pgI7yLuXs1sf/5BiFab2Cazsfd5/wsEKhM77nDAiZPmJEenu8DHi
 ICUUYhfBvY0XI5B6SON/bb2qz3nfqIJVJaTnhqU0CEEN5hOiqRfjZuqONP2ocSgzL+2nTejrtqv
 DzLCBrw2o0XQE9vSUfShIZsrh9rkaqooJrsxzzuaMHLyhNZnpKwoAosoGa71t58tcrtWMXW+qSV
 jj/nPVrdJR+9L1ZhizE5xcckOoISsSiUXseP+LM+dkZC1q3bXqQbdyniMghUfds/pI8LJtAusfd
 RLgxld0oi8YHzDXldkg==
X-Proofpoint-GUID: vvCTkELpRJ1YitVdvVf-rjKNwLbnM85s
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4d7e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KVXIDpKRKy7ce-yJhUkA:9
 a=CjuIK1q_8ugA:10 a=u9Tfa8qlk6M8Y1NLbVIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfXxPOn+irFe5WO
 WRdkmELyatUYtoL/sAAlj821AASpH/sqtp3XDWd/9EBOujPJSAdQLCqnBS8Dc2vu8a6FybnqC+4
 YzIMV9EJahZxvtZleQ9IiNICPIKL7Qk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240033

--35r0MCTMsnB7aZOv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > @@ -5808,10 +5809,10 @@ static int stmmac_rx(struct stmmac_priv *priv=
, int limit, u32 queue)
> > > =20
> > >  		/* ACS is disabled; strip manually. */
> > >  		if (likely(!(status & rx_not_ls))) {
> > > -			if (buf2_len) {
> > > +			if (buf2_len >=3D ETH_FCS_LEN) {
> >=20
> > I do not think this approach is correct since, at least theoretically, =
the FCS can be
> > splitted between buf1 and buf2.
>=20
> We are talking about runt frames here, so less than 64 bytes in
> size. Can such a frame be split over two buffers? What is the minimum
> size of the first buffer?

Why are talking just about runt frames?  According to my understanding,
this codebase (at least the one in stmmac_rx()) is executed on all
'last fragments'. Am I missing something?

Regards,
Lorenzo

>=20
> 	Andrew

--35r0MCTMsnB7aZOv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarTX2gAKCRA6cBh0uS2t
rJBuAP4nU5clgQENSyBlnzWzn8AMHbSqn2jOuJvlgtlkekrq9wD9EZ3PQdweW0zF
We+ngFGarlY007Y9aBFBkMttXLF0Kgo=
=UxuT
-----END PGP SIGNATURE-----

--35r0MCTMsnB7aZOv--
