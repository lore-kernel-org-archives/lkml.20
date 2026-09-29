Received: from mta60.mailii.org (mta60.mailii.org [78.129.155.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D3556BA0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.129.155.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708264; cv=none; b=o07XfTn9Mh8s8mM4taU8qUu1YVIdBl+RxgqSO81cEk/jO7DmJ8JVKQjIZLXWGM5y7VU+CAHxZ1HHr2tfinYPma8sgqh9hHcgGm+ueWL6iVQ+J/VTsEXVWleHS2F7WdAiRMjk5CShAraoQVzkqPZOp/XJOMzvHrCf08MH9OwQkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708264; c=relaxed/simple;
	bh=ZZuYlR4CY/O8y6zH4iObIxMo1JGpnVJ1lwA8un3wOvg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=sZ4Y7WvS3aLvntyFDrQYVj4Lt10zgYP3YpXQxNtlqXZoEfWYxljcT/EVxsXSFKWDaW7sajvNDIYw+lngARjWMC7vIy2zjBCNLMeCub2qPVMKHM8phy8WD249E6i7heKcghx44ub3jAzzu9cw4lw2a2MvzVMoWNFd7CO07XqVNek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net; spf=pass smtp.mailfrom=hajimohammadi.net; dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b=igRT6x0Z; arc=none smtp.client-ip=78.129.155.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b="igRT6x0Z"
X-Mailin-Tag: 95.217.242.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=srs.mailii.net; s=mail;
	h=to:cc:date:message-id:subject:mime-version:content-transfer-encoding:
	 content-type:from:from;
	bh=hLsH9GVFukdGnmqQW2B0IqmlgxYFwG1y30U5GRBtfSE=;
	b=igRT6x0ZgjeWjxr5ZH3b0eX/LpaPESfjhM5+wbJt3/faPTTGThHgVFehoxeWg2HEJ/DN0bLUp1P1y
	 PTOgEEGWiidYTs82nPJ/UdiIvE7S2DqhvAkVdm8YFVH1KsNBOvLsGGC2iPTk4e1d5GYwexeSxE323s
	 6zE4kLnN0qPV3IOU=
Received: from linux1de.centraldnserver.com (static.122.242.217.95.clients.your-server.de [95.217.242.122])
	by ukgw.mailii.org (Halon) with ESMTPSA
	id e966bccd-bc1b-11f1-ab49-005056a23964;
	Tue, 29 Sep 2026 19:09:09 +0330 (+0330)
Received: from [45.252.182.9] (port=57590 helo=smtpclient.apple)
	by linux1de.centraldnserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <info@hajimohammadi.net>)
	id 1xBZvA-000000007EL-3A7d;
	Tue, 29 Sep 2026 19:09:08 +0330
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
Subject: [PATCH v2] staging: rtl8723bs: stop overreading monitor interface
 name
Message-Id: <C482A227-333E-4400-9D5C-764C1EC774A3@hajimohammadi.net>
Date: Tue, 29 Sep 2026 19:08:56 +0330
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1xBZvA-000000007EL-3A7d
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: info@hajimohammadi.net

cfg80211 passes a NUL-terminated interface name. memcpy() always reads
IFNAMSIZ + 1 bytes, even when the caller supplied a shorter string.

Use strscpy() to stop at the terminator and bound the write to the
destination buffer.

Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
---
Changes in v2:
- Send the patch inline instead of as a MIME attachment.

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c =
b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1..8f5032844 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct =
adapter *padapter, char *name, str
 		goto out;
=20
 	*ndev =3D pwdev_priv->pmon_ndev =3D mon_ndev;
-	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
+	strscpy(pwdev_priv->ifname_mon, name);
=20
 out:
 	if (ret && mon_wdev) {
--=20
2.39.5 (Apple Git-154)

