Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E53CC323
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983666; cv=none; b=FXI/YEP8gsS9cejEdiZFMDJoXSOsNoKRSkoBs7uqa1OefbAjbMBM7oPTmS15RqKUtMQ9VFj2pCjIqZumFzMYG4R3CjfHAbt8j3r7L/Ki9ZGXr5ICuWr+203LsPpBLoROfcpiH42knXl/wOM43C52f5aUXpX9PZFpt0nEfXebiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983666; c=relaxed/simple;
	bh=bsg7KkTXUuj4zmsQ2xg1wjV3ed/QjHe34DfPmmkzy80=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TZGb9MXBXCX0pRxKJu8BskYFlzEgRSAV5L4RVfb+uCg2HD4C1aH/O3+KJgGR6zbRptWe3R5ktwRfkO3rJYc+iHOApHVZYhCabIZb28E+CHwV2sj/ELCaoCOZ9Jhyv2Cvi58UeSmfNp/99DE9lMzAk3fgHRHz6H+iwh8nNEP/M0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Vgf+HEKM; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Vgf+HEKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788983658; x=1789242858;
	bh=OAxJGZvdXXjAjVNeFXKBK3YaR7MjqBZfZJYQrzMqJOk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vgf+HEKMDqqW/xZQlTy+6SYfgHFmTl2Y8phPbcsB1Earqhv/0UPPWKbcpczWatF3N
	 ASksUerJovvYo0DXIDAuu8Bhds3ctJsW1TWQyePkdsureZCvejCns28yXOUgO5tqH5
	 8qJIBD7LVBIz7HNH2s6SBI42fyAZC/nnIlwHr3UHsVIefbqYGI60wePL6R6rwABOuv
	 86Tblk6SSMXrf7+TJ/hjZubGH3mzO/Ovn9C0gMoBymw8jWUmuPmVXk/3GyejNRXg8Z
	 /q2Fjd9JVHiYCe4DCxDDL/tFR41DbZhoFcTZt/2lx3o0mB4ktEcyIm6U0J7gMSNSGq
	 Z2KgbYFjuFLBQ==
Date: Wed, 09 Sep 2026 19:54:13 +0000
To: gregkh@linuxfoundation.org
From: Balazs Moro <balazs.moro@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused NDIS definitions
Message-ID: <20260909195344.353880-1-balazs.moro@proton.me>
Feedback-ID: 220707583:user:proton
X-Pm-Message-ID: 64ceead91d25686ccf3abf8ab7ee6c9bd006dcb1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

NDIS_802_11_RATES has had no users since the driver was added.
NDIS_802_11_PMKID_VALUE became unused when struct BSSIDInfo was
removed.

Remove the unused typedefs and NDIS_802_11_LENGTH_RATES, which was
only used by NDIS_802_11_RATES.

Signed-off-by: Balazs Moro <balazs.moro@proton.me>
---
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h | 2 --
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/st=
aging/rtl8723bs/include/rtw_ioctl_set.h
index 768e4868ecfd..020b143f36be 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
=20
-typedef u8 NDIS_802_11_PMKID_VALUE[16];
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_8=
02_11_authentication_mode authmode);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep=
 *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/stag=
ing/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1476..ff2cee2f3b99 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -12,10 +12,8 @@
=20
=20
 #define NDIS_802_11_LENGTH_SSID         32
-#define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
=20
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];      =
  /*  Set of 8 data rates */
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];=
  /*  Set of 16 data rates */
=20
 struct ndis_802_11_ssid {
--=20
2.47.3


