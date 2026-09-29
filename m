Received: from mta60.mailii.org (mta60.mailii.org [78.129.155.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27153B0ACE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.129.155.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715022; cv=none; b=n/Llw/mYQQ4oqufB9j7djYosJ+NpKr7PYoxAGU9hfE4VrfmXXE0RvxV3anEvvP1DBYSatjjZSETxdKmWqur+Ms03ggbHsMFmjp24vygnFtbEZ4je45RCF4HOe18Rm0EnptIM9vKS1aO5Dl7XjSgTyS6xjR7GJNqY1KHzA7b8ADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715022; c=relaxed/simple;
	bh=wi++sukDdPnxVVbXT+JzNXYcNslN/l4C0vtpkpxslOY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=ooK7DHMbKMS12L/KB1kZMz5eT+y8I8Co54knaFXHHqRYpoAn/MGO9Qt6W4/LMrfpdT+tatvi58phXVgYd4GvOZBIakL+LqVhn+PkgPix0/5fCZjdVnodIRcZzOqsDhGIM1ilOcVOpjdTj6obIe4gAO0/0knVUHGa5PaxNPC/yBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net; spf=pass smtp.mailfrom=hajimohammadi.net; dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b=FxQFrMq0; arc=none smtp.client-ip=78.129.155.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b="FxQFrMq0"
X-Mailin-Tag: 95.217.242.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=srs.mailii.net; s=mail;
	h=to:cc:date:message-id:subject:mime-version:content-transfer-encoding:
	 content-type:from:from;
	bh=m2kT/Bips4xccD7h1FNq1w1jQ0t94+MxG3h9hpcCRCM=;
	b=FxQFrMq0qaDYV9X9gyN1sl4Lqj0sVyuI0a9p13o+G4gBqa2vRY3RCcpMp1iG83kpnwz5tSNss3BhP
	 ThA9nj6uetsPzCurbsZjySjdFQTRZaeYMoidXVybKHSdtF7U6Qxngixin5S7LeGtBfvVeNsNScIPSv
	 eE0o+trPi3dpAEpk=
Received: from linux1de.centraldnserver.com (static.122.242.217.95.clients.your-server.de [95.217.242.122])
	by ukgw.mailii.org (Halon) with ESMTPSA
	id b69bbb4f-bc2b-11f1-ab49-005056a23964;
	Tue, 29 Sep 2026 21:02:16 +0330 (+0330)
Received: from [78.154.57.70] (port=62707 helo=smtpclient.apple)
	by linux1de.centraldnserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <info@hajimohammadi.net>)
	id 1xBbgc-000000005xT-2Qij;
	Tue, 29 Sep 2026 21:02:14 +0330
From: Amirhossein Hajimohammadi <info@hajimohammadi.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: [PATCH] staging: rtl8723bs: remove unused monitor interface name
Message-Id: <71228854-6533-486D-B930-BBFD2B51D2B1@hajimohammadi.net>
Date: Tue, 29 Sep 2026 21:02:00 +0330
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1xBbgc-000000005xT-2Qij
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: info@hajimohammadi.net

From: AmirHossein HajiMohammadi <info@hajimohammadi.net>

ifname_mon is assigned when the monitor interface is created and cleared
when it is deleted, but the value is never read.

Remove the unused field and its dead stores.

Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
---
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h | 1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h =
b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index a1fc18cd2..15c14b281 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -16,7 +16,6 @@ struct rtw_wdev_priv {
 	spinlock_t scan_req_lock;
=20
 	struct net_device *pmon_ndev;/* for monitor interface */
-	char ifname_mon[IFNAMSIZ + 1]; /* interface name for monitor =
interface */
=20
 	bool block;
 	bool power_mgmt;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c =
b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1..9444553a3 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2158,7 +2158,6 @@ static int rtw_cfg80211_add_monitor_if(struct =
adapter *padapter, char *name, str
 		goto out;
=20
 	*ndev =3D pwdev_priv->pmon_ndev =3D mon_ndev;
-	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
=20
 out:
 	if (ret && mon_wdev) {
@@ -2232,7 +2231,6 @@ static int cfg80211_rtw_del_virtual_intf(struct =
wiphy *wiphy,
=20
 	if (ndev =3D=3D pwdev_priv->pmon_ndev) {
 		pwdev_priv->pmon_ndev =3D NULL;
-		pwdev_priv->ifname_mon[0] =3D '\0';
 	}
=20
 exit:
@@ -2739,7 +2737,6 @@ int rtw_wdev_alloc(struct adapter *padapter, =
struct device *dev)
 	pwdev_priv =3D adapter_wdev_data(padapter);
 	pwdev_priv->rtw_wdev =3D wdev;
 	pwdev_priv->pmon_ndev =3D NULL;
-	pwdev_priv->ifname_mon[0] =3D '\0';
 	pwdev_priv->padapter =3D padapter;
 	pwdev_priv->scan_request =3D NULL;
 	spin_lock_init(&pwdev_priv->scan_req_lock);
--=20
2.39.5 (Apple Git-154)

