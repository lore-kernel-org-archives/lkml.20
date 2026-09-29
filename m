Received: from mta60.mailii.org (mta60.mailii.org [78.129.155.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F636167B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.129.155.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710081; cv=none; b=E1W8Ki872eoSCaSs/j8Ae0vrF9vMzhYnIfKwq78jh0tNBy9jzCpa4tlhohXo3FKSYeBg21uY/nCwCEHQ95jI/tabIJg5IR79ZSzp9yaX8loLH9cvaTgaEO18s9bBqQfSSdeRPlsD1OdsJOpP/QZ6v9XcpxW17VBYHKQrBc/NQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710081; c=relaxed/simple;
	bh=A+oRRwQ10aiwtATv2WWoD/8rMmQLTGjw4bJpUhB89hQ=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=XoghvTLqOv4ezRQr4taYd/vj1yfJaVKoKC8goBk8RlzmnLkg++UQHJ6CePhXE1PPUoeat0PMterDEhk0nkmeUvIA6/HRQLNG3YDygVokJfNFRm2v0pFj6HXkFEOBLYtg/ppJSwgDooBYksQGUiuEycLZAT9wUpdmHeNY7iEiZUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net; spf=pass smtp.mailfrom=hajimohammadi.net; dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b=vXqg+XNv; arc=none smtp.client-ip=78.129.155.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b="vXqg+XNv"
X-Mailin-Tag: 95.217.242.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=srs.mailii.net; s=mail;
	h=to:cc:date:message-id:subject:mime-version:content-type:from:from;
	bh=tUrjT9ZMIdMQTi3Ph678hgdcX/K1AT+tm++YHIQwXhw=;
	b=vXqg+XNvuH1g7kJWQUpLMW3FhfFO0kgrTjoE/0kGjenuZv7YKRN2MgxfOfSWcCOxdKVKQU62v5C5s
	 593NGCRW4wN8NWZJdRXB1rCBf6Cozv2mmjzY0OEPzLsMZK2+sNCTeoeQO7nnNSbslj/+KfGwCtg4rW
	 /nObFzu2bY9k6bsU=
Received: from linux1de.centraldnserver.com (static.122.242.217.95.clients.your-server.de [95.217.242.122])
	by ukgw.mailii.org (Halon) with ESMTPSA
	id bf1b5f40-bbed-11f1-ab49-005056a23964;
	Tue, 29 Sep 2026 13:38:41 +0330 (+0330)
Received: from [45.252.182.9] (port=52731 helo=smtpclient.apple)
	by linux1de.centraldnserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <info@hajimohammadi.net>)
	id 1xBUlE-000000005Ir-0nsA;
	Tue, 29 Sep 2026 13:38:31 +0330
From: Amirhossein Hajimohammadi <info@hajimohammadi.net>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_8F8C67E3-57DB-4FDF-A22C-48975AE89F96"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: [PATCH] staging: rtl8723bs: stop overreading monitor interface name
Message-Id: <4E27F487-1146-4557-8A26-51F6E9E2E2C6@hajimohammadi.net>
Date: Tue, 29 Sep 2026 13:38:19 +0330
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1xBUlE-000000005Ir-0nsA
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: info@hajimohammadi.net


--Apple-Mail=_8F8C67E3-57DB-4FDF-A22C-48975AE89F96
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Patch attached as text/plain.

--Apple-Mail=_8F8C67E3-57DB-4FDF-A22C-48975AE89F96
Content-Disposition: attachment;
	filename=0001-staging-rtl8723bs-stop-overreading-monitor-interface.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-staging-rtl8723bs-stop-overreading-monitor-interface.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=203a4bea4cf2133cb8a8929be1655ce2a95d685d40=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20AmirHossein=20HajiMohammadi=20=
<info@hajimohammadi.net>=0ADate:=20Tue,=2029=20Sep=202026=2013:05:58=20=
+0330=0ASubject:=20[PATCH]=20staging:=20rtl8723bs:=20stop=20overreading=20=
monitor=20interface=20name=0ATo:=20Greg=20Kroah-Hartman=20=
<gregkh@linuxfoundation.org>=0ACc:=20linux-staging@lists.linux.dev,=0A=20=
=20=20=20linux-kernel@vger.kernel.org=0A=0Acfg80211=20passes=20a=20=
NUL-terminated=20interface=20name.=20memcpy()=20always=20reads=0A=
IFNAMSIZ=20+=201=20bytes,=20even=20when=20the=20caller=20supplied=20a=20=
shorter=20string.=0A=0AUse=20strscpy()=20to=20stop=20at=20the=20=
terminator=20and=20bound=20the=20write=20to=20the=0Adestination=20=
buffer.=0A=0ASigned-off-by:=20AmirHossein=20HajiMohammadi=20=
<info@hajimohammadi.net>=0A---=0A=20=
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c=20|=202=20+-=0A=201=20=
file=20changed,=201=20insertion(+),=201=20deletion(-)=0A=0Adiff=20--git=20=
a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c=20=
b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c=0Aindex=20=
4416d0ec..8f503284=20100644=0A---=20=
a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c=0A+++=20=
b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c=0A@@=20-2158,7=20=
+2158,7=20@@=20static=20int=20rtw_cfg80211_add_monitor_if(struct=20=
adapter=20*padapter,=20char=20*name,=20str=0A=20=09=09goto=20out;=0A=20=0A=
=20=09*ndev=20=3D=20pwdev_priv->pmon_ndev=20=3D=20mon_ndev;=0A-=09=
memcpy(pwdev_priv->ifname_mon,=20name,=20IFNAMSIZ=20+=201);=0A+=09=
strscpy(pwdev_priv->ifname_mon,=20name);=0A=20=0A=20out:=0A=20=09if=20=
(ret=20&&=20mon_wdev)=20{=0A--=20=0A2.39.5=20(Apple=20Git-154)=0A=0A=

--Apple-Mail=_8F8C67E3-57DB-4FDF-A22C-48975AE89F96--
