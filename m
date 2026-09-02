Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F74A43E6;
	Wed,  2 Sep 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361468; cv=none; b=ClsE3tNl3rBRYPwgDeXkZtz3vZTlPHTvRwiHcnHX4DYfidxUZg4r1OPRdHwjFJUHc5L2NabURsvjCItAj7ufueZRWCtTkMqeQt7llzt6XgTJH7IY8GMBcihGNq/2LdnErUwb2iw13JfsOTD13hAI8tmpYi9RFTOqbMySmLgeXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361468; c=relaxed/simple;
	bh=im94DVWZ0Aif6PW6gjLHwppZIEGICQZ5GzmUEIfDZg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=anEVQsKYUrZ54WuYhvuVC6t038zHieMS7AC5oR0qx79l6p42mzAKnLDv8IHP/Gi3K6dVuBR5WlkU73kIcT+Gsno3kCGBuA+aZx4rh4eFTLEFURh1TuNd3rgKKTNrtwVmHEcGaCFwE1KtyxZHVr9shaiy1tjOb0p4tcTSpnOz2zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TOoKcc0m; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FSFPQj+w; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TOoKcc0m";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FSFPQj+w"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hZmGb3tlsz8tCW;
	Wed, 02 Sep 2026 17:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788361463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UA1Cbp2Nct2X21vt+WfH57GW2d+OTNeGuA841+/ntHc=;
	b=TOoKcc0mjIoUbmgYbMdoDpgX0E7PGnCAMjiVSdkALMzIw7wMb0lu/0x4mvxdtaR14Nh6Tv
	MKgfoIxGL75ooxU4vlTf2PPY2cEciq4l/wV3Jyd3S9KcA6NROBh4O9acQV+wtUkTr8d2Ea
	jY5Ht3WYubdAGp9qkLMkzws0D2eGgYPqENPJW2FR/6NMDASMHd20YWsvA9vqm7IOYxat6Z
	A6TqDiFKH4yIRJw/pIUSIqZk8f2L0g2B1mdr7wLG59oiI6p/KxiSC94JPPtDgWr4a6rNk3
	YvO9P+wVEmPU+wJiuIPgz7rnmGTPRGz65wRZ/Dvo6by7onXTNU/vTWuyIU2nzw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788361462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UA1Cbp2Nct2X21vt+WfH57GW2d+OTNeGuA841+/ntHc=;
	b=FSFPQj+wwd0MPURnyqEfUzUDwEtxoiSHgzdOQ/fOHBZY68eUryMQmSDhx70pcDtqpC1i4S
	1WkEVgvFO1x8cycv4/FYMAgKig0PRxVf3WMMT8cs8l4FVSEsdC22wD7Bq2ASNngCtvOQvO
	ZsIWxtIye/9ylhv0HhELTDHzlj3ExxlbPt+fezMZgFotmh1OMHm1Ixf7HROBAJBFde1ktq
	VLNW7+d79u7kRzeJogCO6Cnt4CcWkogszMfMzjrS2JeJW6qajFqGfCsE07yvYji+iodDep
	AQ9NtR7fI0CDY1bmnUtbFdmIABsuDstoY8fYfKzs0sjFbsT94t8Zl0QwFtWjrg==
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: doc: hdspm.txt: Remove bracket
Date: Wed,  2 Sep 2026 17:03:23 +0200
Message-ID: <20260902150324.705863-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3qj86dayii6kg7zkafsjs6xyz6ikyrhe
X-MBO-RS-ID: ef866ee09f7ea178e0a

Remove needless ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/sound/cards/hdspm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/cards/hdspm.rst b/Documentation/sound/cards/hdspm.rst
index 5373e51ed..ee157f351 100644
--- a/Documentation/sound/cards/hdspm.rst
+++ b/Documentation/sound/cards/hdspm.rst
@@ -367,7 +367,7 @@ Calling Parameter
 	  note: each playback channel is mixed to the same numbered output
 	  channel (routed). This is against the ALSA-convention, where all
 	  channels have to be muted on after loading the driver, but was
-	  used before on other cards, so i historically use it again)
+	  used before on other cards, so i historically use it again
 
 
 
-- 
2.54.0

