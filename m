Received: from mta60.mailii.org (mta60.mailii.org [78.129.155.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537E457E4E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.129.155.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708814; cv=none; b=BeBFmj97J6Sjxnx3TfnWf5ahkNHd5M9Y5BYaIo0LBh/a4l5GXMytWdbnHZMWMb2ItrCoHEzTQ4zyJ/bhRMUO4t01ElQrBoKeu2t0uwVwAUGyJj4KnrSsWvuO82PvDIe5P7QjuK1EDFCA1wZheInKx65++XJhQu88fuOMeVcnYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708814; c=relaxed/simple;
	bh=SxwSMv25eTuCuDzqT+oXMhDuJzq6X5zQG6MCMNM704w=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=tcRWKr7ZCIKfy9ZlavF/SOh9BXIATQfuXgUwp7XtfMLTqcTKR0vI+2pfbaDX26cM89yD5XwBX2JJ257kX2jcoRFG9WbjsBWWwheTSFql3CBOYH6IrpcX3V3MoOR8qUo0lWeupw9qEx0zZ6VxHMUkJLIUC11min13AvBuFPi0zsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net; spf=unknown smtp.mailfrom=hajimohammadi.net; dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b=CvpyNKeE; arc=none smtp.client-ip=78.129.155.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b="CvpyNKeE"
X-Mailin-Tag: 95.217.242.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=srs.mailii.net; s=mail;
	h=to:cc:date:message-id:subject:mime-version:content-transfer-encoding:
	 content-type:from:from;
	bh=hc8wlzTxw/R131/rAzS/Q9hLy3CyUifQLb/EbQu8OyU=;
	b=CvpyNKeEvMcx1xPVC8xq/d8ZGCWz4tu+On0v6CSPwxsu3fr7K8TM4/q5Q4RdvaFBE7kZokMMvwumO
	 7QO+3FYIjdsKzQ6u9ZVm9W7qLJEitLdQU4xgFkziNBHgibzlN2mNf/MIav9yLcNOk0V+hJq+EJL7NJ
	 G+SmJZHxbk+zX7tU=
Received: from linux1de.centraldnserver.com (static.122.242.217.95.clients.your-server.de [95.217.242.122])
	by ukgw.mailii.org (Halon) with ESMTPSA
	id 345d2547-bc1d-11f1-ab49-005056a23964;
	Tue, 29 Sep 2026 19:18:24 +0330 (+0330)
Received: from [45.252.182.9] (port=57798 helo=smtpclient.apple)
	by linux1de.centraldnserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <info@hajimohammadi.net>)
	id 1xBa48-000000004ab-23u3;
	Tue, 29 Sep 2026 19:18:24 +0330
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
Subject: [PATCH v3] staging: rtl8723bs: stop overreading monitor interface
 name
Message-Id: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
Date: Tue, 29 Sep 2026 19:18:11 +0330
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: gregkh@linuxfoundation.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1xBa48-000000004ab-23u3
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: info@hajimohammadi.net

From: AmirHossein HajiMohammadi <info@hajimohammadi.net>

cfg80211 passes a NUL-terminated interface name. memcpy() always reads
IFNAMSIZ + 1 bytes, even when the caller supplied a shorter string.

Use strscpy() to stop at the terminator and bound the write to the
destination buffer.

Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
---
Changes in v3:
- Add an explicit =46rom header matching the Signed-off-by identity.

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

