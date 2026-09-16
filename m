Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AB4AFE2C;
	Wed, 16 Sep 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558634; cv=none; b=powj7D5RNhUOfXv3gBFdTECS/eXTHkk47rUepceVIIW+0IRXT+S8I6lgP/JjwFu7/W2OOzcSb7VzEEWs7BQT9ufUb0sHE5KvdbAOa9TcKX0a+KTRQu0JPdkyM6+C5Cwdrejj/Ql2Mw1P9jt7K3EY8Ku8WaUafP6gKRJke13LY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558634; c=relaxed/simple;
	bh=cHF9JW+q4r40XE4aSQ50y15lKPe36Xbow7nP9rOrvKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWpyIxjOdiIigudYej4YMl/q/wZuTJdvb4MVLkyv1dsAZrxuvNxWjIyjznKnWDUaExpN0Mhr0GXm5bDYAZW0q9Z/UdGjHiNmI+mpWJkVuwJZa6KlNQlmSIxZ+bolYUXkjty/Jl+ydGwUZVvt75crHJwMRwYtW16TdDuAiK1gKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sXEgOoC8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uED5qevw; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sXEgOoC8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uED5qevw"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hlH0d2vt9z8tPl;
	Wed, 16 Sep 2026 13:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789558609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sxxbp5EMZL98v93x2yFAPLLVAeHdqAsEPbwrqsn9Pxw=;
	b=sXEgOoC8gDLK+uqOhfPosWkDFdpk6h4R6WHrGPCNu7EGuCwyXbcqOF1x6wFd9X2EfzNwpl
	nXrpENhhnPiVQeGjBrIIgog669bhnwDN1CVfv+aCvMJgnrtQ07Z0cpPd/xxE/R21PHl45f
	A2MNWNF0Wyoel9I7xPNwce40HrnF7y4PKw/aa8zfyi80IlzKvlM48q2BsS5zz2Fwpn64j1
	9Wr50zWgh9JNV5TYs58RZMUfc8m6YMuXIVGOa7eJ2lM2rOKilnNU16RPNtR2rjBzYYanH4
	RALlvf33NiaporocvDSU0bBDIEAPO+oyXvOnh4jCqkMdOrQWV4uu5eqZze3rpg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789558607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sxxbp5EMZL98v93x2yFAPLLVAeHdqAsEPbwrqsn9Pxw=;
	b=uED5qevwCj3WdOMsXa0C+rpbSj6spYZCWCZzHx++SfKTnO3jOXDkenV/n0j14fjMuhhIER
	CGAO27S24Er5oQHPC078JnQG3JCEsCc63o8q0hgsYHyM8kjvlEOI8WpBZFSwISm+XM9m+/
	OeEZOLH6agqj0KrRRZIjPTGWnW+s3cQIb17h1QDiYr+dgbeuGodnWT/vY87gc2Le8+QxMV
	HarQ2e3it5oD83cv6hd1XpmrwqJt4CB1u+yFvhrxHNxGXSFUPY90zJAObrqqbwpVuShgYi
	+vY3vMDh28yCFe6Ji/EcXnOh2EBi/b2rElHRvKHTXUdhSt1BQmrby86+kYMyig==
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: doc: Fix bracket
Date: Wed, 16 Sep 2026 13:35:24 +0200
Message-ID: <20260916113524.304863-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ef6yoojp1h9meg65oeetk4xe3ahmqwi3
X-MBO-RS-ID: 3b14f006816aa1485a9

Remove needless '{'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v3]
 - removed the change of the placeholder

[v2]
 https://lore.kernel.org/all/20260904120737.758809-2-manuelebnerli@mailbox.org/
 - rearrange lines in diff
 - fix commit message

[v1]
 https://lore.kernel.org/all/20260902150510.706055-2-manuelebnerli@mailbox.org/
---
 Documentation/sound/soc/dpcm.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 7b6aeab3c..3ff13fa4c 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -358,7 +358,6 @@ The machine driver sets some additional parameters to the DAI link i.e.
 
   static struct snd_soc_dai_link dais[] = {
 	< ... more DAI links above ... >
-	{
 		.name = "MODEM",
 		.stream_name = "MODEM",
 		.cpu_dai_name = "dai2",
-- 
2.55.0

