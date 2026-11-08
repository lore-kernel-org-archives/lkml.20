Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125522;
	b=2rE/V1C3fvYThaTZFq0ELzNrM2Icdw2gcyV0K+pWRRsTmjvAtkRp4xdYcTLPAZ9ZnDmU
	 Bz5KgxKLccw7sSpbGIvsENuN5JhyZKiI/Fpkh74lj7knwMv1/TjopXB8CcU8pn3wY0dsn
	 bZnf6z6+ffuC982mffo88SrO5vwktQ+BDcRA88yAddx8onjvnxcejS6XCYDdm5oORDR+A
	 LFddPENzuR/SBJ62wNhQdF2SYzYqv7DXy3Vb16VP/L17bsPD4LhNaMy/aL98TY++jFZoI
	 tBX3EeEqBKf9olmSKFvIY4C3jSaa4H82fxmOGZS7gqa1Hl3tlmNdBPtAgKiNfloyVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t4Tk+3qyBOYcDqmgeM112wYSFWr5RQ3gj21yV0GzGTI=;
	b=dDADNLX46CxgHg232Syi7xCDtwLR6oW+sVOObZFrf1qwnnlfUw7hK8qwxRvFpyuSCBSD
	 5yL/gt+o4MsIKvudybNOTLivvQonSM+QoAVFjKkGtVVdsS2G0da1i0R9TEJpODxth48QO
	 9h4Y77VencfO/e7G+cxpZ+nej0upHcfScb3ugKN6x9Uv/c6JJcgqNwdbch6dhqlgEHSZi
	 vCfj3d0jA34hLYj2Y80qPgLwTXYtxNnGtiuBZi3fnvQd2rowuiRI4YZBC6BbWbtiHARms
	 Il0Jz+f6YobmpqybaKwCpiOVPhYgAjKAcUFV2UnwlydlGsGFQ95vqNpKgVYv8Nvhrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVkezBiW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HZdEch/h";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CDB606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CDB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVkezBiW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZdEch/h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A87e28O3982274
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 08:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4Tk+3qyBOYcDqmgeM112wYSFWr5RQ3gj21yV0GzGTI=; b=cVkezBiWftf1cluh
	VJEQbYJRJgJrEC7IG1GxqX72McbwB8R9IvIHtflpsWK35UBAVdZMDXQhnMzU3NCt
	xKMWA88spKzsgT4t5kSPf3RhJlgeloLzj6jVbOJ1jCgP1ki51qPPTx4bN1KvTDQC
	pYmtKYNW5NHKU7ZBH3rGm4UHv15wWty3wxIm+6pSBgIjAWVKA04G4IJf7rGL5oTU
	FB+O6pDg31ZbkOZDeUFcakoc99DE58RsRLm8r4C++PAu25Zj7I45WHidzHjA0lAG
	nlCpYz1MFCRzSWUYi29fwboOIZ8Oc5ZLtZWULbIoNoAUlymalfwfq2pEOQd0NXZ6
	/eHpUQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6jgvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:12:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso757951eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794125520; x=1794730320; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4Tk+3qyBOYcDqmgeM112wYSFWr5RQ3gj21yV0GzGTI=;
        b=HZdEch/hw3oCCuUNg0u5aXBzw8M0KwCsbjgSaQN2knjgiMx+bN1K3z1wSccou2eppG
         r0PCkyapDuXy35O+GPZ1CWRbSo8g0UJ/PgOYThGHPVHXrs5Jux+JU4Wgp6j2eTHYjOIC
         J5K2grFFRZ2Zn2T8mzES3K/KsgQpuIbf7T9tRoFw0AmPnt/Zvdfvt1/Ql/5Niw9XVIRp
         5768qxp52HVGDdije+9IFhCUgfJqXwXSTV67/GFdu2iKvZE3vdwbU97aQUOs27QtH3kA
         +bcT+TxTmI2Asu+DKIz+NyBQbbljkDlfHgO39BVCZhDRM4ZsQL/j3/vilNjCdbYzISvU
         tZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794125520; x=1794730320;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t4Tk+3qyBOYcDqmgeM112wYSFWr5RQ3gj21yV0GzGTI=;
        b=knTHibJeXrfZiqEj/ebm0l4PM5rMUwt0E9z8EFsi9XHXEZ5+5S69o0X83qvb3CYs0T
         w8hzVC08pyXzZ+gCSsAaO1foR3mlSPsycNH/cAkC5UKsYNFS/4VdfX/WLz6UQRg3fWzp
         fM086u5rvgXjvU8qgHqY56TUrSiZOTnyAITT81c+R5QECHQuNUpvhCKMtx4sCfnfIrjz
         rQgW5gZ6YC1sn5aq1MRDH3VBO6nPXLbPvg1feVdBkg4I66LergCXog1mg4Yu6Q6AMh0o
         fWccNYV6NMjbyaaorMrazAOlfqNpjKvgZuiK+2AifKAlA2OGBpzMIobOAoAlu3b18aJY
         dyUg==
X-Forwarded-Encrypted: i=1; AL+hErHkF1L0n6POhkBtgwZSuc5/EfJQXxFz68fAobt4Im5qC3EsGZq6uKWjAf7SfASVPjmg28S1M/NPL+uNE38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MjccbH4NzdNhYDsdql7K561FT6vgBg882UlD/ZR39pIyZgsb7
	oQTjw7DwG3wrlg52FcA6HpjPWnEy7IZwscW4l3UX7281iWvehtRm9jiUfQTCjf1vIyA+AZOTUco
	toAyLrNhYe5K07CL4eUskiju0C8uL2W058G3OKYB8F9Ut3OmukCBXYK/dEA0TO3H5cnQ=
X-Gm-Gg: AYBFou0L/6BPrJ5DubpmlIPNdsU5BB1bIxxLAHoJjbUimwAVievdH853p60fjf+RPLY
	JQfNxI3f2SU+stl1Y+T0eqaoaYpJaU/fOKlaa23CzL+uS4hRvRqi7jXkJ/uE7e5KLj7jNQ/dHa8
	gNGo1t8AiPIgh2T4nV5a0HmWnj8PJu3xw8kq7Rna77TpTl1HgDT9+c22II3r3FkKYmIcddZ98Lh
	n2Ujj0N6ca8UvOS9xyefB5V6zzKIjnFGdujM25Ica4E6J7DmzkDIaQoynwNnf5MtyJg9ICdNMOK
	IyBDEI4uEnb6YEurqLaLU9EBAMzfp3iqp7UDSvHAsShissfP9NaSzONxsQRbTHQCf3glCwcrMxP
	1aZN5psge2vIkti/GTAZa5vKUSbgDwSjbKfzUFizg95cbG9+QxCqmvKkAMMMYwh6ZgZ5xtTgLeo
	X6N1q0lI0ChtmxpdJ69raRuS9SBXhMOVdjLRFoKWuPXZted2R8539+sIhW
X-Received: by 2002:a05:7023:a44:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1b39fece490mr1414836c88.15.1794125519905;
        Sun, 08 Nov 2026 00:11:59 -0800 (PST)
X-Received: by 2002:a05:7023:a44:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1b39fece490mr1414794c88.15.1794125519334;
        Sun, 08 Nov 2026 00:11:59 -0800 (PST)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm5563265c88.20.2026.11.08.00.11.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 00:11:58 -0800 (PST)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: <netdev-bot+sinfo@kernel.org>
Cc: <sean.tranchetti@oss.qualcomm.com>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20261108075727.2031331-1-subash.a.kasiviswanathan@oss.qualcomm.com> <179412493254.488859.5909018726402609409@kernel.org>
In-Reply-To: <179412493254.488859.5909018726402609409@kernel.org>
Subject: RE: [PATCH net v4] net: qualcomm: rmnet: Update MTU handling during format changes
Date: Sun, 8 Nov 2026 01:11:58 -0700
Message-ID: <000801dd6f58$d38f1e00$7aad5a00$@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFkeIhnkKVssrYvBGDElDQ/wtA9kAKcck2AuADbBoA=
Content-Language: en-us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAzMiBTYWx0ZWRfX1aBC3DJKDv/h
 uwroXPp6H+vxy0Xm5Tdmdbq53ZwomZ9RWXhgT2kNKrunS84D3SMcPmBoeZkcqG5xDJvHnOZWfDp
 NSk07qWZWXgqeAwxQ7t1m0cpak18PJVkFhU4upFKR/Y9pbvoxLif5d83QxkynAPYgxA8snWAppI
 RGbGsnb58VKeRN7CJhQoiopjLxlb09BCZl1mTbE4gTn4YjkwKAhu7l88HT+5oQmhUA6qOO4tUgE
 e9rYT6VzMq2O/D5HEUDIADEOgUAbiqpQr9L+Hi7/Ehx2BN83TmCW0cGnDVey7DP0fum3T0T+hL7
 7Y07E31ZxMEPOVTy3sp2FfKGChYL87dDRqLcQ/jnj1ej447jzamSdcqKe7sK980zMKbbb4bfT+2
 P19+9OecDPMvetWj2XMYJG/brWYsHMaA9wWtE4RyJ2RYj8PzpxYT0GweN8Q+tKlrh4Dih6GzlTC
 w92BJOj3KItfzP9D+0Q==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af02ed0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J1Y8HTJGAAAA:8 a=20KFwNOVAAAA:8
 a=wfrYX8O7EWgUh0Dss7UA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAzMiBTYWx0ZWRfXzG3TnZPU8sXO
 rnanMGrSq8bIdZqvaalyh9Hr4dNbXKCP7ovgkn5wmBxG//ArE79LklUIfXtFjOGintGnKNhkT4i
 mx7PAnu0o/MDZuBCWj1ID+4udRPNYsE=
X-Proofpoint-ORIG-GUID: Vg7fll5EZW8GNnIr0WEJIXCXnSrf1dno
X-Proofpoint-GUID: Vg7fll5EZW8GNnIr0WEJIXCXnSrf1dno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080032

> -----Original Message-----
> From: netdev-bot+sinfo@kernel.org <netdev-bot+sinfo@kernel.org>
> Sent: Sunday, November 8, 2026 1:02 AM
> To: Subash Abhinov Kasiviswanathan
> <subash.a.kasiviswanathan@oss.qualcomm.com>
> Cc: sean.tranchetti@oss.qualcomm.com; andrew+netdev@lunn.ch;
> davem@davemloft.net; edumazet@kernel.org; kuba@kernel.org;
> pabeni@redhat.com; netdev@vger.kernel.org; =
linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net v4] net: qualcomm: rmnet: Update MTU handling
> during format changes
>=20
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its =
commit
> messages seem to be missing some information:
>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>=20
> Please do not repost the series just to address the above. Instead, =
reply to this
> email with the missing information, so that reviewers can take it into =
account.
> If the series needs another revision for other reasons, please include =
the
> information in the commit messages then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think that =
is the
> case please reply and explain.

The changes in the patch are addressing the code review comments from =
Sashiko and not tested on real hardware.

