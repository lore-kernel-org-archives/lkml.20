Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794910492;
	b=cRW5jv8+ip0YwA/aC3r6Lprf9VLQb2fdqP9FmV4vYJKiGdd3+BNioJ2wsMUWNfJ0uN78
	 2L+RH+EFXgwcKY2TRAMeoX+UtbvrNOAWunGsYoO0Ymybtu8+QEF7ufxf5FJQiOgupixFf
	 rM2rVUc+DeoSZg7vuehsCvWu+vVka8uHD3/We1UiXRTRoZf5fCPZMY6w1TcwwIq2vUadK
	 IQ4zH76Fw2hdeaSowAthnr8tPi/4ObUOLNi7AzpMKhnVaZb42kX0Pjad/9RyGUDmz1WCT
	 sSffdAeJXncELvojul4aNBf8LSznv9gk09L33xThmH2nxvwZohSu6Sp0+I9gskENGvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Kb30aQTT7vQoKwFr/85AQT0PymI0DebtoKXcgbf2t2Y=;
	b=lbVNJVmL23XrWQhcoGDHbK05KkoRxJBf8kT6LH3CX9uemaL26ONRxT4sPylP9+cxVACB
	 A/mH82Y73MLpz8zmhiM/0uyoL4JHmLVn9Sor4fDcot5akten4dJKn6tNbIcZHOM50dWLq
	 ke6kxADpyVe69UZ64+sKq37wEqwfYKhWe83IeGrHZ0RQZ7vjU31820S8c398tlJ5876Bq
	 d4ES9L9rrJOMSGcAunKMGmlldd6hRt7GMD29JJAQu2vn/4IxIgw+ImTgJe9dKsjoo/y8B
	 bELNL38Ep9ei/VTI58xA/BWLFfrpQUKsdJi0cXHGPqd6HimhLQNFXOBvzTyHMGoAC5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=O+pXFUVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CA606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=O+pXFUVP
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9E249205A3C;
	Tue, 17 Nov 2026 11:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794910489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kb30aQTT7vQoKwFr/85AQT0PymI0DebtoKXcgbf2t2Y=;
	b=O+pXFUVPo+kpTwZW2ZwYmMy52PU3m5QGupIEr4FuBsmds96IpSHzdZRjihK3TvmooVF3NB
	rh0vUGHC7i6aEpBZWa83qVSFhl7zYv7xnscoHemlyCaASkc+Cp7daWwSwA84uIwZAFDpty
	CuIZ/066r8JLuU73QvCXAuXqb+9+cgIp2K121bOUDkJTVXPZMSqhuOSspserWhoO1HGGan
	gWbIiLsXbsW8Vfa7p+AQXtTMvdMUf1POABg1n6ULC9RSbddw0/aJlQbg5PcZHPbuuzZSz5
	xXflkwhJ9T4ZLwWJOpwGSJcHpQHS7yRlu0Y/2ZevQsNbACjyJIGyct6xgkhaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794910489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kb30aQTT7vQoKwFr/85AQT0PymI0DebtoKXcgbf2t2Y=;
	b=MOaz2zwH4+UfA5uNEpBTSqsfW0MVWWkGp/mHsYKVuURx8ZgBE27iun9GyBn8WZCEPgW9Ii
	FQOyKLOVzVcCJCXs9U1AHsbPVxDBAW9p5XrssYGlm4vGQwR5WhFyXY7/MIa4XYQMYIeH5S
	YNgtUXZ0q9k91GntZyvcu/FDgwB59G/wQl0DPIMv+1xpdXOzLe49aDNP+Ep3vE4e+joMjg
	eHJ1YptCEanoqSPT9b4DffwyaQVWTd356MLDglv/Vua5XniRXFciHA3t5xcpAX2wqOQ0CD
	xvRv1+kUrKOwyk2QiSZ3FNsR2yfTmTtoDwP9x3vCxfqtg2Vi6FO/2TwvPRdg8A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794910489; a=rsa-sha256;
	cv=none;
	b=NOY9YNQn/LZUNlG5laEORxnxmk9B0+IR+5DkVlfXVTAx4aVGKDLaW4wHYlM4VecmVcIb3j
	zpW+M/GaUc17x6S9Q33cFhbTyu6u7mnULPNmcovMh4E7sYY7gDh/OpEXz5TLey+3cr/JOw
	y2wgY8Cy4EUp5LgbszTwzQZi1nmA9lzB/wTvEuRo+b8AmSIOq1XS29yhpZc7mdAKiepGBh
	Z1neUPiJNTaKn9eIHiZLRiWiSGN47ek8iXWjqxxUW0oDxJBCi17C1ZLVv3iA+YIDouwnGQ
	L3qew9GSYjBCjZEF5M0EBIEvbOHCRnvIEkjPUdK3U9Aaf4JvJ/YqfFVEsMoX5w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xTGDB-000BPg-07;
	Tue, 17 Nov 2026 11:14:49 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 17 Nov 2026 11:14:47 +0100
Subject: [PATCH] MAINTAINERS: Update reset tree location
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-reset-git-tree-v1-1-85185b891ba3@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIABYp/GoC/yXMQQ6CMBBG4auQWTuJbUCEqxgXlP7isEAyUwkJ4
 e5UXH6L9zYyqMCoLTZSLGLymTLcpaD+3U0DWGI2+au/OedqVhgSD5I4KcCxvpeh87FqgqcczYq
 XrOfw8fzbvmFEn34X2vcDrB2FNnIAAAA=
X-Change-ID: 20261117-reset-git-tree-d784ba2d59b2
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.16.1-dev-53874

The reset controller framework tree has moved to git.kernel.org.
Update the maintainers entry.

Link: https://lore.kernel.org/all/dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de/
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..d2490d2a5a89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23960,7 +23960,7 @@ F:	drivers/thermal/renesas/rzg3s_thermal.c
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
-T:	git https://git.pengutronix.de/git/pza/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git
 F:	Documentation/devicetree/bindings/reset/
 F:	Documentation/driver-api/reset.rst
 F:	drivers/reset/

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261117-reset-git-tree-d784ba2d59b2

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

