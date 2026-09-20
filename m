Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65344064C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913442; cv=none; b=i1ipORU2P3izsl6+jOw9BNAyxvvp7oq9P4SC+CRS7kJRdMT71p1IIznbGHRMfG266RnpscoLyxSyMRyi/h8/zy11uVkavGNyJpHFccyTrMqkxsVzxoCgJXJGh9zE+QoEHzI/WbNQ+wbAUQ7UtgwEEM6JNvT2BUwtyAex+zAhVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913442; c=relaxed/simple;
	bh=g0aJZztRp+qAQyM0A5YPxH5IEdM1p4Pkz7B4fewG/mA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=JGrz+sToui2zL3hqwWuzOvVLBI9ZuoBJk2uee/U5YV1IyyrEtyrJEOKWsv1cCz61nqLEhRQhCtoGotDE2GgVg4QhhkdehIoUyZswNBfBQnEttKXksajRCNAv3V5y3E4wDGWhqqs7Bh4jIYry4/AdRIzIT1sS8l3hhvXn2svhjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=I2AIiBS5; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="I2AIiBS5"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hnpCz2f4pz8RxM;
	Sun, 20 Sep 2026 16:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789913423;
	bh=g0aJZztRp+qAQyM0A5YPxH5IEdM1p4Pkz7B4fewG/mA=;
	h=Date:From:Subject:To:Cc:From;
	b=I2AIiBS5aMEtn+1RBABb8vta0FQogWK/G3wUWcENHEMvtj32UVnYPTB+TOMu7ig2N
	 ico4L6gYBYri/DQd8hdeJMU6xqNFiJvNAm8vKUzZ4hQ8yYX4zNOUzEqBsjmrYOFlz/
	 hVrftwh4wGrv+bf+wsfBuqZ1vGjwltXc4Ww3ql6RA9CcImAXydHLCQrISVEfl2oNjA
	 vmWH8E/eijixrp55a4rkdkgzmG/YMmH/2FV5VwiZhNCn8DsbNgmg9vyczNwg2XY0ap
	 RlM9ac5/spXNpBUaX+4nDi1VqjS2QbXEbmwFeT76xeuQUdvP4ImUqjQ3Uc2xy1harF
	 6FlWrhAoYnttg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hnpCz1xlsz4xM6;
	Sun, 20 Sep 2026 16:10:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hnpCy6HN6z8svY;
	Sun, 20 Sep 2026 16:10:22 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 591725F99A;
	Sun, 20 Sep 2026 16:10:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1f3e8e4b-2060-4edc-aa58-d2b7a68280ca@leemhuis.info>
Date: Sun, 20 Sep 2026 16:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Quick regression status pre 7.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Content-Language: de-DE, en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178991341458.1567507.12774179324905470860@mxe9fb.netcup.net>
X-NC-CID: +y4HBg8gQpV032Ap2bzHyOaq1f9pjclUvEd6eqI/ovzl6zpcNtE=

Hi Linus! Here is a quick report about a one regression from the current
cycle that I found worth mentioning:

* 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
[v7.3-rc2] causes resume problems with various ath wifi drivers.

Three subsystem maintainers recently ran into this and two asked kindly
to merge a fix for it quickly -- among them the ath* wifi driver
maintainer, as the culprit made it into the ath devel trees. But we
afaics haven't heard anything from the net maintainers:
https://lore.kernel.org/all/20260909055846.16539-1-daniel@quora.org/

Would be great if you could merge that fix directly. To make it easy for
you, I'll send it as a reply to this mail with all the tags added that
came up over the last few days.

HTH, Ciao, Thorsten
