Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197488;
	b=TaDEwXZ6TF8WeYZlci7GJMZsE48ng35gmy5fCXGsYn0xZjNhwgOZyA2670/+jGbdMBqO
	 1sxFJQunEUCA5BO/35/k1S9IEH8Sex5E1EfB9kXSPJTBd2Dgc5tiRSZ0LSoofaLMJcgSJ
	 3o5jsyd7hb2s4c7RC2oYYLr3/U/VnUpcD8sct7DzfR/1r7x8k3XIVJUtfJk1PEuGNqiz5
	 yhvpNSR7g5CkHggXD4TlwdX9TX6FYBw8BZaomLOI9WuZjX5uPxeBUWaUGNf4tfu7kf+xY
	 NRGPOm9Ev8o17F0Y8F69lrLGNjqBj6Qg1qDv3MQoKdRUncOiE0oPKYfeNgKK9qdA9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197488;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=wD5FMo2nPtvrLWfHX1ci93C+4a9ws4m7WGRPTT11aSo=;
	b=PSS0WSU+cBpiN/ptXRylSQYvw/kRGiIpKZJIENPGn+hg6yk0XUx7HXwjDq1h/KAVDoeI
	 5meSmpn4zPMGAcHArlruKHvu0Y4CwQ0FAUL3n760Q62g8Bpui1q0yExDR5hjkJDgiEaE2
	 j2/dJqMKR/HTaN6WLNGFGNG34OdfPMi/vQDzvqB/K1StKz7qrijG8qGUBfm2Dtx0yEjtP
	 6NoLqJa+P/7nonnecYejPk+QSMlNIe2VRbcEsPXK/c4VUwJK3p9u3ptz9xSZ7yFviTGMP
	 bfryWWSNZJx0C7VxA4VGojwa7C/y+I6NexU0eSuZwLJvzYKrmyooiLEcL5Ak7DHqhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rU8ZkZ55;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E02606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E02606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rU8ZkZ55
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261109041125epoutp0427465cd5f4ef46fdf266dca8fc713c2b~mRRtRycDH2923829238epoutp04Y
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:11:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261109041125epoutp0427465cd5f4ef46fdf266dca8fc713c2b~mRRtRycDH2923829238epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794197485;
	bh=wD5FMo2nPtvrLWfHX1ci93C+4a9ws4m7WGRPTT11aSo=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=rU8ZkZ555gdlOjzK9L5kfbx2ZkvcS49hh6wh7skz+YKFL7peOx0QP2CHNj7MnbBqQ
	 Lxx0uIPS/nnOKRVMRxXobtuThO/mJqIGZWKVcXXkVaec4OtPvBZoqfChHkz16+sjFz
	 kktvP67vq/kinJxPQwY24iAvMlAJ/6kbSTJEV9Z8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20261109041124epcas2p45140975b24d56245c1bfb20b661769f3~mRRs3PoJw2413024130epcas2p4u;
	Mon,  9 Nov 2026 04:11:24 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jNGYm2g2Wz2SSKm; Mon,  9 Nov
	2026 04:11:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20261109041123epcas2p2dc0901804207c6b1fae32d3dfd627555~mRRsFx2FC0244902449epcas2p2x;
	Mon,  9 Nov 2026 04:11:23 +0000 (GMT)
Received: from KORCO118546 (unknown [12.80.207.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261109041123epsmtip201710ec87ee55488408274bcf5026302~mRRsBgYA_3165831658epsmtip2C;
	Mon,  9 Nov 2026 04:11:23 +0000 (GMT)
From: "hoyoung seo" <hy50.seo@samsung.com>
To: "'Bart Van Assche'" <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mkp@kernel.org>,
	<martin.petersen@oracle.com>, <stanleyjhu@google.com>,
	<alim.akhtar@samsung.com>, <kwangwon.min@samsung.com>,
	<kwmad.kim@samsung.com>, <cpgs@samsung.com>, <h10.kim@samsung.com>
In-Reply-To: <2ac84978-3223-44b7-af80-de59def8a0f1@acm.org>
Subject: RE: [PATCH v7 3/3] scsi: ufs: core: Limit early link recovery in
 the error handler to runtime PM
Date: Mon, 9 Nov 2026 13:11:23 +0900
Message-ID: <024201dd7000$61f0b9e0$25d22da0$@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEkM+dZWAh2IxYDFumpsgtRiqg2ZAMhLHJLAxXuZpoBUKS0a7hbWtKw
Content-Language: ko
X-CMS-MailID: 20261109041123epcas2p2dc0901804207c6b1fae32d3dfd627555
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261106061547epcas2p40541421c139d758cdc3633302634d29b
References: <cover.1793943246.git.hy50.seo@samsung.com>
	<CGME20261106061547epcas2p40541421c139d758cdc3633302634d29b@epcas2p4.samsung.com>
	<66ffa35908823d693cde364ef6fbdeef50aa5a69.1793943246.git.hy50.seo@samsung.com>
	<2ac84978-3223-44b7-af80-de59def8a0f1@acm.org>

Hi Bart,

Thank you for the review and for the Reviewed-by on patch 2.

> Has it been considered to use the runtime PM status maintained by the
> PM core instead of introducing a new member variable?

I had not, and it is a good idea. In v8 the error handler checks
whether the runtime status of the WLUN is RPM_SUSPENDING or
RPM_RESUMING, read with READ_ONCE() without power.lock, and the new
member and its updates in ufshcd_wl_runtime_suspend() and
ufshcd_wl_runtime_resume() are gone. runtime_status only exists with
CONFIG_PM and pm_runtime.h has no helper for these two states, so I put
the check into a small helper next to the other ufshcd_rpm_*() helpers
in ufshcd-priv.h that returns false without CONFIG_PM.

Thanks,
Hoyoung

> -----Original Message-----
> From: Bart Van Assche <bvanassche@acm.org>
> Sent: Saturday, November 7, 2026 6:58 AM
> To: HOYOUNG SEO <hy50.seo@samsung.com>; linux-scsi@vger.kernel.org; linux-
> kernel@vger.kernel.org; mkp@kernel.org; martin.petersen@oracle.com;
> stanleyjhu@google.com; alim.akhtar@samsung.com; kwangwon.min@samsung.com;
> kwmad.kim@samsung.com; cpgs@samsung.com; h10.kim@samsung.com
> Subject: Re: [PATCH v7 3/3] scsi: ufs: core: Limit early link recovery in
> the error handler to runtime PM
> 
> On 11/5/26 10:11 PM, HOYOUNG SEO wrote:
>  >  		ufshcd_rpm_get_noresume(hba);
>  > -		if (hba->pm_op_in_progress) {
>  > +		if (READ_ONCE(hba->runtime_pm_in_progress)) {
>  >  			ufshcd_link_recovery(hba);
>  >  			ufshcd_rpm_put(hba);
>  >  			return;
> 
> Has it been considered to use the runtime PM status maintained by the PM
> core instead of introducing a new member variable? While
> ufshcd_wl_runtime_suspend() or ufshcd_wl_runtime_resume() is running,
> hba->ufs_device_wlun->sdev_gendev.power.runtime_status is either
> RPM_SUSPENDING or RPM_RESUMING. During system PM it is either RPM_ACTIVE
> or RPM_SUSPENDED. Reading runtime_status without holding power.lock is not
> more racy than reading the new flag.
> 
> Thanks,
> 
> Bart.

