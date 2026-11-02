Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582408;
	b=cajiwdXgj0el2qnnHtv8rhD+KBF1mVqEKJid2DQPNPJaSehfYKRtgBtOVG9q99amgPjK
	 GyRPAVqOn53sNEytoyi42WE3Dxg8v5Z0Oloxb3tYdwnMeP/HlPezC1GQEkxTasiTrbkJD
	 ojeMMNwXrcrVaim2XnibxugwzVXAfzu7mo/13V2WeLilOHIJGhnU0c4EK49T1qU8ADA6h
	 W1pCkQY07ndoams3Jqr1PBYaic42nU7rBY0FKUkCK/ujnpsr4UY0+x5lWO+866ZjGuPav
	 rkqtmNUCvo5eVXhzGUi45e73Y5uN7SxKFetOs1pbbFmh/TVehgdEtyOrzC832S+U8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582408;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=45c0jE9HbkCdxpNTN8bnPDNo8QDvZYgC9R9p9K09uiI=;
	b=GtQn00umg9+Xy4VW5kU5yGHeL6FkcUfN4Jr+MXUS0K4NkfTki6Y145cEXcMCnfbV7r7S
	 qWsjgLasP74hol1408mb92SGA5I/JRTAjcK4kVhvkXnftBfnbjfREZejdyA5zgXu/Sqqn
	 Gr2vkOvSMVBqPjG/CN/MPOcD310pK+beXAc35153HWmOxQAn75Yq2YhOmrZRZayo/fJWI
	 jA8b2jpqma0a7TvFJ+GQSVKJl4i1JXVCd6auV8YnckeEanVSxhWJwLRzOV+TKSPZml+3k
	 cjrw53hU1QViopu2WnV2UdT/SJtCaquX3ieCSurVNwHzQdkSrk9z44hbri5IBAFkPig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TBpEvXw+;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E814606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E814606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TBpEvXw+
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261102011956epoutp04dfdeac7fa3a7906f5c6a5392eb8e84ca~kFa-rUjj91155511555epoutp04u
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:19:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261102011956epoutp04dfdeac7fa3a7906f5c6a5392eb8e84ca~kFa-rUjj91155511555epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793582396;
	bh=45c0jE9HbkCdxpNTN8bnPDNo8QDvZYgC9R9p9K09uiI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=TBpEvXw+eQcHTgYbRPLCH7v3jCI+B0Rrm0JynVRSYTaIouxC1sdB1B9vXVr3lYxBB
	 YIQBIyDMArHp2CkRjDNWxwi5Ipp0zV2rgOjeZAwREoLv1KNtmKIfNB0tXAec8h5qCJ
	 WthrGvagwle40tS7Wqhn+Y8pHoiag6xdESiLt2W0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261102011956epcas2p4c07a8d4d77f017588ab97018446033db~kFa-apy1X1402414024epcas2p42;
	Mon,  2 Nov 2026 01:19:56 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.202]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jHv582yf6z3hhTF; Mon,  2 Nov
	2026 01:19:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20261102011955epcas2p1eee400f7f34ac4f375b310edcf5e5472~kFa_teMAf2392223922epcas2p1V;
	Mon,  2 Nov 2026 01:19:55 +0000 (GMT)
Received: from KORCO164647 (unknown [12.80.211.160]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261102011955epsmtip2f37bfb1c2eedea39030867a8cfaec312~kFa_oA2UX2236222362epsmtip2A;
	Mon,  2 Nov 2026 01:19:55 +0000 (GMT)
From: "Kiwoong Kim" <kwmad.kim@samsung.com>
To: "'Bean Huo'" <beanhuo@iokpp.de>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cpgs@samsung.com>
In-Reply-To: <101b87d76029565d274ae96d66c8a343cab910d3.camel@iokpp.de>
Subject: RE: [PATCH v3] ufs: mcq: fix dev cmd abort path and add OCS poll
 after sq cleanup
Date: Mon, 2 Nov 2026 10:19:55 +0900
Message-ID: <000601dd6a68$44e7d510$ceb77f30$@samsung.com>
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
Thread-Index: AQHS6DuEV2CopjC7B98uMO/T9TG5nwKNTbBWAxtTbRC3AbkXEA==
Content-Language: ko
X-CMS-MailID: 20261102011955epcas2p1eee400f7f34ac4f375b310edcf5e5472
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261030111051epcas2p225fb4eb84bfbd747782b5641f3831053
References: <CGME20261030111051epcas2p225fb4eb84bfbd747782b5641f3831053@epcas2p2.samsung.com>
	<20261030111045.982094-1-kwmad.kim@samsung.com>
	<101b87d76029565d274ae96d66c8a343cab910d3.camel@iokpp.de>

> I think this should be two patches, each needs different fix tag:
Got it.

> > --
>=20
> I didn't understand why here there is =22--=22, this shoudl be =22---=22?
I just tried to separate two contents, but it seems like I made you confuse=
d. Let me remove this.


> this is another patch, and OCS poll patch needs a fixes tag too, for the
> MCQ abort support.
Got it.

> Kind regards,
> Bean

Thank you for your comments.


Kiwoong
BR.

