Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611A3815E7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295915; cv=none; b=fZtMl25P7/eVXXSvQU/7PAdw1tAk4KQwy0IlLOD5VKSrH2YfVSwRvm+7db+2CBqEZqrWuI5NlUfr7WyyuzaHD1mC+qiehlNwCE5jQokQ/DVymMLaOKcZHnLZngLO68MzFBvEKpTOowcFaCVwr9/CdMffXiDHydyWWanFMTCcF/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295915; c=relaxed/simple;
	bh=AcLJVPh5bsY22FolYlElmAvMMrXr0L6cpCT4O/STT/E=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PUnzk5ZATKGuGSXh8RJjKaIWuTSv4fd947fXWgEytuPgy3qLuBX6Rr/y9+B8ha9jICcSGkht9uh9zm1CxyXFeLcouBqU/ptur9DvsaxdRe5FWDyDVoevzrNp8OAfQEeEfMvrq69nUIpS9eydlMDQlItVPXnLm5EKskpFQkcx9k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=T6KCGIKW; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="T6KCGIKW"
Received: from [IPV6:2a01:cb08:8a81:6d00:2cdf:9e8f:ec02:2a70] (unknown [IPv6:2a01:cb08:8a81:6d00:2cdf:9e8f:ec02:2a70])
	(Authenticated sender: eric.valette@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9BF7A13F86A;
	Sun, 13 Sep 2026 12:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1789295911;
	bh=AcLJVPh5bsY22FolYlElmAvMMrXr0L6cpCT4O/STT/E=;
	h=Date:Reply-To:To:From:Subject:From;
	b=T6KCGIKWSrch7S1rmaxEXQ7seS3PdoGWD6DZ3o7tctJsP8CeU0ispJf85GK+LvM/k
	 F0jh6nbM2ckn60gG0P9DON388j646WoA3+gjXeJZwLZTM3Mza4bQvoVMlRxdnyvhkS
	 eCkoGzLvvSWmSWJ33v9YO2TGi8fWvd6GOTCQxM2qBHA19/Pvn1W/i7+e22ZVuWHZGc
	 k1L/tG1bat5Wo0+7Pu54gqWPOauyQ1N+mNg2WKzRYaPsZfFjgNaCMaxFM7nwpLD7qJ
	 UI1ac6rqNFuU5SGFd7KQdfafPiAilBQa93Wbpcli5AqxajHTs4sxdbptsb3OGNV4Dd
	 osUrjBIDVkJOg==
Message-ID: <da773f12-3e6a-49f7-a138-76ba0f11c72a@free.fr>
Date: Sun, 13 Sep 2026 12:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.valette@free.fr
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
From: Eric Valette <eric.valette@free.fr>
Subject: New rtc boot error error in 6.18.51 probably due to recent change in
 rtc.c
Autocrypt: addr=eric.valette@free.fr; keydata=
 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
 wycNoa755G2xgOMORgXEMg==
Organization: HOME
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed than when booting 6.18.51 I have systematically this error:

[    0.462347] rtc_cmos PNP0B00:00: error -ENXIO: IRQ index 0 not found. 
I do not have it with 6.18.50

Probably due to this chnage :

+	if (cmos_rtc_platform_device_present)
+		return 0;
+

after in the boot I have the following rtc realted traces;

[    0.462353] rtc_cmos PNP0B00:00: RTC can wake from S4
[    0.462425] rtc_cmos PNP0B00:00: registered as rtc0
[    0.462446] rtc_cmos PNP0B00:00: setting system clock to 
2026-09-13T10:32:04 UTC (1789295524)
[    0.462467] rtc_cmos PNP0B00:00: no alarms, y3k, 114 bytes nvram

PS: CC me I'm not subscribed.
-- 
Eric Valette

