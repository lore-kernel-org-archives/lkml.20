Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76B3445AE6;
	Fri,  4 Sep 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523782; cv=none; b=NNo2jx4n7o1QJ/CawOdHe28zFEVUrR+LPVscb8Iy+gRxvAg7+mw7xq+SFKR8hESLKiwSRhJfQFR5l8LIcLrQBB/uVvlh1/mcSHPb4bzjO7/nOjAytDJ1QNbE1dMTJEekXiU/F/JvsohGAjCLu3TcLma5w6sOx8ybE46qbCUyMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523782; c=relaxed/simple;
	bh=oUqTWfg0uYkgF4Oeg1kgb97pexDzPojJTSo4Bkqpuu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRfiXruJS0UOC5PI2KRuxE2ir0WZjHfGoDmJ0UVgu4gVUYeDz2XbB5wE/DUANI2znSmlRWQNsW2pPRhJz5HC82NjZzpjAllA6eAmR0ATwphkuud8vUW8dzrBQ9dWC3VX/d3tZGyyVpDo6I1b0i82jmRduNfL1Ne4QE3uqNlQ6ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F4s2lhNa; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YTXHdy26; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="F4s2lhNa";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YTXHdy26"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbwJ12JFTzKvwt;
	Fri, 04 Sep 2026 14:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788523777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZB+QJUFWxW7RrnJvtyEYwIJJ2DAu3VwyMr0me7eVuGA=;
	b=F4s2lhNaEqoYQiXnVkxOgyIiMALeKxbA8uoFNHNjLWVQlxskwnHFZictV2XUtYZFSODJUf
	+q30u6gpXj2nth3TeCuTRxr/rnOIHzAAAgOYpXF+ap+QxbJkBTmPwSUitaUUE/BnjX7xSt
	5K53Qj+VrtqhtQpLV6lSr+HIvvra+0WqUZwd2dRZkM9/5nhpm62/ltA3LuyrZGd+P/bwMX
	1bUxwUEKqqCXI7H7P+hxEvEj2HezRWLTtArI2z73YrxKSpLDvhDG6AdpMLzRZ9lJ3NURgt
	x8ZFT23ouLPnXTo0QErXhLoILidjLJTteevy5Uc5x0UIkph6TqRtHOVKCQXCpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YTXHdy26;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788523775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZB+QJUFWxW7RrnJvtyEYwIJJ2DAu3VwyMr0me7eVuGA=;
	b=YTXHdy264vY9+JhM4akiJx/i9/2DMxeOixV1cWZTl9g9cQEUSI0BnFV/G9NcUY6jVfeH6u
	U0qst1C0fqOgNfhOpE51k0JPF9HDXt4JkcB7Lx2iX5OQUf+VUsC2HagZcCOvXICieGdvbt
	5WSrbk7fzqHgOBI+zTYX/RRwxkdgNIW08II33FYlymEEfdh+CCCxVguUGWqF8gHqTbJF9N
	xEHZae2BcdVZAXr895/pJujcOEiN3jR7UiVHIISjY4tSQTPsNZwVS9VjxheuQHR957C0Xh
	yUAoOx5Bj7Sejm4v+EQbtDKTCqPmLv2/yTz2uc1Wn6EtgX8J9pNY2WQPRXyXIg==
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: doc: Fix bracket and wording
Date: Fri,  4 Sep 2026 14:07:37 +0200
Message-ID: <20260904120737.758809-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r6dwqik8389axh3uzgq1ms3ddand66b1
X-MBO-RS-ID: cf44966832eedcc5d17
X-Rspamd-Queue-Id: 4hbwJ12JFTzKvwt

Change wording to make sense.
'above' -> 'here' in placeholder which already is above the code block.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v2]
 - rearrange lines in diff
 - fix commit message

[v1]
 https://lore.kernel.org/all/20260902150510.706055-2-manuelebnerli@mailbox.org/

I guess the line is to show that there are more DAI links _above_ the code
block. But it's already above, thus change 'above' -> 'here'
Let me know if I misunderstood.

Thanks
---
 Documentation/sound/soc/dpcm.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 7b6aeab3c..0302a89cb 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -357,8 +357,7 @@ The machine driver sets some additional parameters to the DAI link i.e.
   };
 
   static struct snd_soc_dai_link dais[] = {
-	< ... more DAI links above ... >
-	{
+        < ... more DAI links here ... >
 		.name = "MODEM",
 		.stream_name = "MODEM",
 		.cpu_dai_name = "dai2",
-- 
2.54.0

