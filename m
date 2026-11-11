Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372637;
	b=Pne9MUwSDJD+VIabD50NEZNVtOPyxw3B99mMGrzoCvstZymu2+3TEj4MLnKWQHTV9Omt
	 tlrkZwis0pR9W7KZdr7YTEomC3cl8IFQ+qpGwdyBAh2H9yOsJd/iYrKVdrCcDMatihijm
	 CVV54Wjs4RnhhRRQ8i+VrOTtDwsx7NYBcJ02E9z65nBqN9xNeGCaniH6hgGkVEWiqtl6J
	 ZZca8Ev4aM6qhEqo1WPn4PJJeKxVsG2q7jlsHGyJYt3/yauPRDqxlT2AV8fLQzjtguOzl
	 CLgxO48DO/AXnBUZXiJA26KZoL+VxiQawODRyj4pDHrLYpFM2JDmnUIv8kPJpYfvhQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372637;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=2z6RcZw+0FfmTvfxA7IX1opzEG1e0lSubruCi28CNaU=;
	b=ityftkf3DVfv3ogisX9Fwa/lsxdMjLauZ0bXDUvJikVRYLF81IiWEnCIzcJfUnxRoKSz
	 UQ9KKxRp3j900VLLUhjAjaK01CR1CieTcUv+d/KGwHKSgg+eEZdYkzRs7Onld4rFaeqEe
	 6WtPiDeR83FmTY0dUS4KQudd2npk8pjGQmFZ9zzoYCHqndCnA8gS+NtPF+2VjOsQT8khz
	 Iqs0kNutmCiW3L4CwLHKrBDld7TnhWLg3cOmu0uCjvo7otsT2VwbuV7jUQBQO5J66p/6J
	 4yA7N7+kkWGf7Nu/TLyZvZ8YCQK8nAh/6UbjoGcnB9UgtZfmZQU/IFVxNAmRYBFKAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=A4pcxok0;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59C3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=A4pcxok0
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261111045028epoutp0463426e090130527fd9af24f36f35a9e3~m5GXwV9Ml2886928869epoutp04v
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:50:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261111045028epoutp0463426e090130527fd9af24f36f35a9e3~m5GXwV9Ml2886928869epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794372628;
	bh=2z6RcZw+0FfmTvfxA7IX1opzEG1e0lSubruCi28CNaU=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=A4pcxok0BGKbCEtgBaA+AKid2yaTFMI/ViICSeKRvq4d1clKrNHxTjWJ2MqKwCth5
	 qrf6rZ3mZtLicuClvuo6obGs3/lbieWczlq7OoXJIyLz6w4Xq1zjtLR6tcQHcN2FC4
	 9BEVl5MqvENgSgZFNx9u7LkczcT+G8wyrhEJPu9Q=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261111045027epcas2p325b3ab664a77cb2058b12dcc3a79ea93~m5GXPutme3085130851epcas2p3O;
	Wed, 11 Nov 2026 04:50:27 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.210]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jPWKv1yV6z2SSKg; Wed, 11 Nov
	2026 04:50:27 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE: [PATCH] ovl: skip stale entries in impure dir iteration
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From: Daejun Park <daejun7.park@samsung.com>
To: Daejun Park <daejun7.park@samsung.com>, Miklos Szeredi
	<miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
CC: Hungyu Lin <dennylin0707@gmail.com>, "linux-unionfs@vger.kernel.org"
	<linux-unionfs@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20261110-ovl-impure-stale-v1-1-1a4c2039e89d@samsung.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261111045026epcms2p63d9818fa6ad5600eff4f74deca4a6e7a@epcms2p6>
Date: Wed, 11 Nov 2026 13:50:26 +0900
X-CMS-MailID: 20261111045026epcms2p63d9818fa6ad5600eff4f74deca4a6e7a
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261110080419epcas2p24eb47374d80929645076c4d81f512c62
References: <20261110-ovl-impure-stale-v1-1-1a4c2039e89d@samsung.com>
	<CGME20261110080419epcas2p24eb47374d80929645076c4d81f512c62@epcms2p6>

Your mail below did not reach my mailbox, so I could not reply to it
directly.

https://lore.kernel.org/all/CAOQ4uxgxYZqE=rv5ZYrbyB0cYi_qS-bv_4UCbDwGJoMGg1iNhQ@mail.gmail.com/

On Tue, Nov 10, 2026 at 04:28:32PM +0100, Amir Goldstein wrote:
> I am sorry, but this is way too complex to deal with a problem which
> is not important enough IMO.
>
> POSIX does not define the exact behavior of readdir of a directory
> being changed in this way and I don't think that the current behavior
> of ext or overlayfs+ext4 is a gross violation of POSIX or that it could
> break applications.
>
> I would be happy to be proven otherwise.

Thanks for the review. I'll drop this patch.

I looked for a program that breaks on the stale d_ino and did not find
one. Of the d_ino users I read (find -inum, gnulib fts, glibc getcwd(),
nfsd READDIRPLUS), none does anything wrong with an entry whose file
is already gone.

Best regards,
Daejun
