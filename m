Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386788;
	b=MD969CnQrnh3e28f3OrllrcuzkNPk3ISBFb5vlanobNsYWAC47wbaM88NKqZNhOa0A3M
	 IExExD2DM/zU1/8flg4dxvVrrarL8doBVPHJQM/mhfL0xZzmj/gGENXBq6WuJh5qIjUtA
	 3wjFamX8Omd8zVjrji2rkfjhoc5xDl5qdL8WizKECu+p3CZKlPuTz+qum6F3+pGPfqnee
	 ELyFqiHnKcEkn0sPNcXlhxalhKqAQZdDmywlGfmpi5ByTEkFF3M4SOUVTPmJyPq+ynh0n
	 6GOb2ECyDpbMnAs//Xuvp5OmGgeTYS3NOx3/+QtaCmgp1zAdcBKtsEqeX6vxqj3p6vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386788;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=U4Wnr813dQKx1sqUGEsSX6XOlK77NpwMcNsF1SKCeDQ=;
	b=1k1up6zFLivpEZNJd8FKnDxrI0hp+SdEE9DtcYhXVUuyjL2LfC4BEkG1WHN0Q6ROHRiM
	 MQJLtrVyCFPgoElXNI52f1gpEQo2MLMab7PoNeagMTgoS4q1PPiiV6IX10RH0WZWWTmvq
	 8D+nrB+FjAQh0+Eeg55NQ5akOSGt6ooe0+wnxM/SZPOmdR3PGuEprdPCcm+YTvegvvof4
	 /+VJCS2PkyoqxxoeSrxd1n2f8itxfh3TTor7FYXfgdD/wVpiHxeXJjxWfsgB7WlN5hcfQ
	 ZJqw44n+BFVWcEGjP+SPqH9g0yJapQ082GTLN3PmzfQ/QREIHrg8M9mM9Xt/0JPr57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MFwNUARs;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD5606A320;
	Wed, 11 Nov 2026 08:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FD5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MFwNUARs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=U4Wnr813dQKx1sqUGEsSX6XOlK77NpwMcNsF1SKCeDQ=; b=M
	FwNUARsD5hzciPK15VJ+OHrWLkIiSk9TtBAe2Tfu/xgDzj09ICpTT16dLpMH6OMI
	/LOwJB6wlyhGfZGxZanP6NW537Dix891eLAeZZT05kwMXieJQ/5Tmbuz+DynLChq
	Ifiy5+cQJyDNLfR0eGfTqCwZfVCYmvfivJsq9OLra0=
Date: Wed, 11 Nov 2026 16:45:57 +0800 (CST)
From: CJ <firefly0158@163.com>
To: crope@iki.fi, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: WARNING in gl861_ctrl_msg/usb_submit_urb on v7.2-rc3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBv+TuU8u4SGbbekdmEsTju82UcS4ufQl245Xc8EEuS7f5iUqRlhADGXE8O6qGhC3lDKJfD1fz9lHWIZJZCBgAkGFFo4wsjLtvyTiOA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <75dfa7cf.7537.1a1c9c9061a.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3FxlFK_RqtqtrAA--.869W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3QWzZWr0K0VfKwAA3K
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCnN5emJvdCByZXBvcnRlZCAiV0FSTklORyBpbiBnbDg2MV9jdHJsX21zZy91c2Jfc3Vi
bWl0X3VyYiIgb24gbGludXgtNS4xNS4gVGhlIHNhbWUKZmFpbHVyZSBpcyBzdGlsbCByZXByb2R1
Y2libGUgb24gdjcuMi1yYzMgd2l0aCB0aGUgcmVwcm9kdWNlciBiZWxvdy4KCgpUZXN0ZWQga2Vy
bmVsOgrCoCBMaW51eCB2Ny4yLXJjMwrCoCBIRUFEIGExM2MxNDBjYzI4OWMwYjdiMzc3MGJjZTVi
M2FkNDJhYjM1MDc0YWEKCgpPYnNlcnZlZCBmYWlsdXJlOgpDYWxsIFRyYWNlOgo8VEFTSz4KdXNi
X3N0YXJ0X3dhaXRfdXJiKzB4MTA1LzB4NWIwCnVzYl9jb250cm9sX21zZysweDMyMS8weDRhMApn
bDg2MV9jdHJsX21zZysweDFiZC8weDQ3MApnbDg2MV9pMmNfbWFzdGVyX3hmZXIrMHg1YWIvMHg2
ZjAKX19pMmNfdHJhbnNmZXIrMHg1MjIvMHgxNmIwCmkyY19zbWJ1c194ZmVyX2VtdWxhdGVkKzB4
MzEzLzB4MTE0MApfX2kyY19zbWJ1c194ZmVyKzB4NTYyLzB4MTA2MAppMmNfc21idXNfeGZlcisw
eDIwMy8weDNjMAppMmNkZXZfaW9jdGxfc21idXMrMHg0YjMvMHg4NzAKaTJjZGV2X2lvY3RsKzB4
M2YwLzB4ODYwCl9feDY0X3N5c19pb2N0bCsweDE5OS8weDIyMApkb19zeXNjYWxsXzY0KzB4YzQv
MHg3YTAKZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzYvMHg3ZQpSSVA6IDAwMzM6
MHg3ZjI5MWU4OTVmYzkKPC9UQVNLPgoKClRoaXMgaXMgdGhlIGFzc2VydGlvbiBzaXRlIHJlcG9y
dGVkIGJ5IHN5emJvdDsgSSBhbSBub3QgY2xhaW1pbmcgYSBzcGVjaWZpYyByb290IGNhdXNlLgoK
ClRoaXMgaXMgYSByZXBvcnQgb2YgYSBzdGlsbC1yZXByb2R1Y2libGUgZmFpbHVyZSwgbm90IGEg
YmlzZWN0ZWQgcm9vdCBjYXVzZS4KCgpSZXByb2R1Y2VyOgrCoCBDIHJlcHJvZHVjZXI6IGh0dHBz
Oi8vcGFzdGViaW4uY29tL3Jhdy9SelBxRTVtaQoKCkFydGlmYWN0czoKwqAgY29uc29sZTpodHRw
czovL3Bhc3RlYmluLmNvbS9yYXcvYmtjVGt4QnYKwqAga2VybmVsIGNvbmZpZzogaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20vdGV4dD90YWc9S2VybmVsQ29uZmlnJng9NmEwY2FlM2FiYWZj
NjkKCgpUaGFua3MuCgo=
