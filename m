Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5C40682C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445276; cv=none; b=Ap75mLrgJ6Z261870JLtGH0eBpdSXS3RS/ul9WcL2fUc38zG5cRCiFgstqFvz5Tiv77r7RMoKp8HHEUTMtQHXiDvovi3BWDpqo1KUFxYguU3WSYDS30iNaS88Z6FB/eiit+JzGRv+xSNHnglRSvKiuHF8o7mH6QXpndkaRKNs+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445276; c=relaxed/simple;
	bh=OdSISjuIqSA6RYepZAaAaCWjG77KrftE0lv66a2jXvw=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=X84/a/VG9FBzR+dN87vSh6sBqiTiUocrWb05wb/ZfCj6BhS2hEa29xb1R0TMoY09YdmozcEDNoy0H6J/06+TIANwUT6+GwT8StNJ41K5y5EjLNMzQAfCBHhQnLWVxGUhiFfArvuyGK+f8UGVeUraXE0nJYbmNQVUEDYr9b/7ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NcPihEs1; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NcPihEs1"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260915040752epoutp0462fd52cbace43be6ab5934e4e0a0ab6e~VYv6dZnjq2249222492epoutp04i
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:07:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260915040752epoutp0462fd52cbace43be6ab5934e4e0a0ab6e~VYv6dZnjq2249222492epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789445272;
	bh=OdSISjuIqSA6RYepZAaAaCWjG77KrftE0lv66a2jXvw=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=NcPihEs1TfRQ59cHSonA5j/EPpgLb5qujoeUpgHgdid70UIm1yUmsUNrAZDCUy+Ia
	 3y5W8VNIoUB/8pnv4BkBA2Ic+oxjUC6Mec6qHDovDwFJlAqjwa3lfdNJzPWuhe6WWj
	 n0UnRs4e5hXqsunuUxePIzUzDowkkVTsQJ5hMkGI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260915040752epcas5p47fcc897074cf61be2ce564034328bf4d~VYv58on9T2618626186epcas5p4W;
	Tue, 15 Sep 2026 04:07:52 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hkT540Vs3z3hhT9; Tue, 15 Sep
	2026 04:07:52 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section
 to filter it from traces
Reply-To: maninder1.s@samsung.com
Sender: Maninder Singh <maninder1.s@samsung.com>
From: Maninder Singh <maninder1.s@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linusw@kernel.org"
	<linusw@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"kmehltretter@gmail.com" <kmehltretter@gmail.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "elver@google.com" <elver@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Rohit Thapliyal <r.thapliyal@samsung.com>,
	Hariom Panthi <hariom1.p@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260915040750epcms5p6e4690c118a20ca82e53c239c8129e29b@epcms5p6>
Date: Tue, 15 Sep 2026 09:37:50 +0530
X-CMS-MailID: 20260915040750epcms5p6e4690c118a20ca82e53c239c8129e29b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768
References: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
	<20260914103218.1125401-1-maninder1.s@samsung.com>
	<CGME20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768@epcms5p6>

> fyi, this choice of subject may cause the relevant maintainers to
> delete the email unread.
>=20
> >=C2=A0=20arch/arm/kernel/entry-armv.S=20=7C=202=20++=0D=0A>=20=0D=0A>=20=
Those=20maintainers.=0D=0A>=20=0D=0A>=20This=20is=20an=20ARM=20patch,=20so=
=20label=20it=20that=20way=21=0D=0A=0D=0AYES=20right.=20Sent=20patch=20with=
=20correct=20subject=20line=20to=20address=20ARM.=0D=0A=0D=0AThanks.
