Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930190;
	b=M3D1u2eo8BN/3iptNWurBwKUThp8JL1ZUijYx0zqA9juvSBmZSzQurN6eaq2hkZoPv9l
	 st4c5MqG8mTg1nKgtqas+REwmY8zpgOdlxcp7GZsyeLWU/jZOzH+TzwEiKPxOM4zKzOmB
	 2lZ7uw+E8CaxS5VE2RV/lpFdi/+1CGB2QQu3d/nDG5xu/Hm+SxUubpRpbwaXu9Wfb4MvR
	 q7vTNKE/fSyAYLFu5m4l233p+vVaf0hsc2fELUxltf8UfDCmJBn5psixQCD+0kuK+Zya0
	 iPPAroMV1njuPJW5mmBZLSLmg1+xWMAI4+DX6URtSRnbyX3E6Kpw2Vxkk0qCwUf3ESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930190;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=0cPHivte9C68Wu6j7GY28jPv9WJaN0mbSSRDmTHdvBA=;
	b=ONhGfeA+SOiD4g/4AdXFpPYZRnX+j44OISSHF6pw+Su5PdB2Vjf1gp4gCfIwO/5kdkDD
	 owBYbMN43n7ZnD9zacp9ghH0iGEU+rbOsPgUzkmUDtaH1ZCFJzlsm9tmM1FkPbqpTFzP7
	 d/YEul7FuOElzHO2i5HsShHlQQbm0qBWxVAVY/URtqOW2YvAYU2NfmXtwEwjt5k5VhVCn
	 y4VoID8oDa53UZjNlG0YwaAkVYH91tHSO+F8QVJZL1q1EIY3cLuxFIAU1hOpG28CSEYmf
	 2YL74kx93CUYuzZ1P6wfx3+YZQC9Pnj0xULnCn/1HS7Tp7hRNOhqr3Rjvs9aOTSFA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=fCfhJ9VK;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BB606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D01BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=fCfhJ9VK
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261106015626epoutp039cb411ef4528bb5ce6021ac7e51c0e3f~lUf-7Go9s2599525995epoutp033
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:56:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261106015626epoutp039cb411ef4528bb5ce6021ac7e51c0e3f~lUf-7Go9s2599525995epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793930186;
	bh=0cPHivte9C68Wu6j7GY28jPv9WJaN0mbSSRDmTHdvBA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=fCfhJ9VK5GUKbq9PUdfKjnZiFQcQ0Jt/WGLrUXB1mWBwXKt3mglqS4tOdApxlFY3i
	 rr9Lju7YN4ejyCwVPC8mMvwN6MuI7of546smjxsar+ikU3scEI/PU5AXVc6ACSRsUT
	 EEltVc3k1fCBNWBAyCFIsVEO2qTZTVSxzsnthA7c=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20261106015626epcas2p2057b62b064ebc81dca65da68de728ea9~lUf-j-a8d1979119791epcas2p26;
	Fri,  6 Nov 2026 01:56:26 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.199]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jLMjP4vjfz2SSKY; Fri,  6 Nov
	2026 01:56:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106015625epcas2p1b45d5d82e8ba7a537907e4413d8f7547~lUf_sydrb2122921229epcas2p1Y;
	Fri,  6 Nov 2026 01:56:25 +0000 (GMT)
Received: from KORCO164647 (unknown [12.80.211.160]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261106015625epsmtip20b2361f2ad5409774b3751600c6c0d89~lUf_nAC3A2852128521epsmtip2Q;
	Fri,  6 Nov 2026 01:56:25 +0000 (GMT)
From: "Kiwoong Kim" <kwmad.kim@samsung.com>
To: "'Bart Van Assche'" <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
	<kwangwon.min@samsung.com>, <hy50.seo@samsung.com>, <cpgs@samsung.com>,
	<h10.kim@samsung.com>
Cc: <stable@vger.kernel.org>, <stanleyjhu@google.com>
In-Reply-To: <ec1d1fd7-b832-4ea8-b3f3-87ff3d361d80@acm.org>
Subject: RE: [PATCH v6 2/2] ufs: mcq: poll OCS after sq cleanup for device
 management commands
Date: Fri, 6 Nov 2026 10:56:24 +0900
Message-ID: <000001dd6d92$0787dc60$16979520$@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4JEezrlrww6xOutvb1msxx9OBXQGtTH96Ah1toR4BCq9oRAMNKrw+AYvKPY+2n2CX4A==
Content-Language: ko
X-CMS-MailID: 20261106015625epcas2p1b45d5d82e8ba7a537907e4413d8f7547
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105004353epcas2p1bd2370dd10156570c69f8f80da3cbcfd
References: <20261105004333.1097899-1-kwmad.kim@samsung.com>
	<CGME20261105004353epcas2p1bd2370dd10156570c69f8f80da3cbcfd@epcas2p1.samsung.com>
	<20261105004333.1097899-3-kwmad.kim@samsung.com>
	<8939a53e-1b21-4dd9-b65c-cbe03b8b72ce@acm.org>
	<003701dd6cea$c396cd10$4ac46730$@samsung.com>
	<ec1d1fd7-b832-4ea8-b3f3-87ff3d361d80@acm.org>

> >> This code also waits for the interrupt handler to process the CQE.
> >> Why not reap the CQE from this function? ufshcd_clear_lu_cmds()
> >> already does that by calling ufshcd_mcq_poll_cqe_lock(hba, hwq) after
> ufshcd_clear_cmd().
> >> Calling ufshcd_mcq_poll_cqe_lock() before reading the OCS would
> >> remove the dependency on interrupt delivery and match the existing cod=
e.
> >
> > Because a successful SQ cleanup leads to OCS update, which
> > subsequently leads to raising IS.CQES when MCQ is enabled. I
> > understand your idea with ufshcd_clear_lu_cmds, then do you intend
> > Ignoring IS.CQES event in this case?
> That's not what I meant. An interrupt is generated after the status has
> been changed to OCS_ABORTED, isn't it? Has it been considered to wait for
> that interrupt instead of polling the OCS status?
>=20
> Thanks,
>=20
> Bart.

Okay, got it. From what I understand, it's a loop to call ufshcd_mcq_poll_c=
qe_lock and check OCS.
If I get yours wrong, please let me know.

Thanks

Kiwoong Kim
BRs.

