Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE13C09EC;
	Wed,  2 Sep 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361633; cv=none; b=sl+gtd7ns6u4AQTozg9bQX0UCPquc2ekrENmWVkb4Ruv2xE1E2wylfUW6zQAoqRUX1OpncCaMeqgIlqIlZNMlAQ+iJLG8YQMjZg/FZFhJazQki4R9cdTEIVg6kRhh2Y3a8Br4llx+CQc14lEjGOOlhWjtj25g7X5j76e4D8DGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361633; c=relaxed/simple;
	bh=yCnnRcWapCdczB7keBL8DAHVXgAj6E2lTx3gTssvZwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfpT1RbuTVisGsQT0nMZROCJqV84SzD4WaqGdKKxRaLf/3rJ8LADtG5PLuKwmh9wNkveOr4hlcBoSd9JCtlw6Ft6IgL3+K8nY/UTLnr+lFEU19mp6zLkfr0njlslPDJ+lHMqlIumYVD0N4aw8WV9mdNapjNDo2u3hfNkMLiwYYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QQOJaqUg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RoM+53kW; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QQOJaqUg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RoM+53kW"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hZmKm5Js4z8v5k;
	Wed, 02 Sep 2026 17:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788361628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hdf5EyBAZrRUJofDiVc1OMKsssxX7EJQUQgIzO7EwII=;
	b=QQOJaqUgMM+65WTo8u7yZPtOQukF2Vr0DE2EI4mXADn4GhD6fVuDOao4uwhuqsF5UZBa8I
	rgNiF2t+z45A94nNYci15gParqwCga5TXjKurW8G1pNvyjaGX8r9Vf7+8/Vx693wc+P49v
	zm2I7bXUqk6j4n2yZ/RwPTFoaqziBMlm/F64nt6xc/j0PLJvNabThafu4zNIpKyG7Ulybp
	3Ceyu11YKNn0e+jGvyUkAsUbYxRX6ou1SkGHjuyv112vKNN8oJjv+X6Rzy6qZybkf8FY8q
	EVJJpU1cVkyJ4lNRZoCxyqF1U+U3ue8IjzjFAScXTJKakdz7VZRgKcrvIiZFYQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=RoM+53kW;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788361627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hdf5EyBAZrRUJofDiVc1OMKsssxX7EJQUQgIzO7EwII=;
	b=RoM+53kW9ZQtt+RlkuzsGneIZkPftWLFMFb1dqFUs1v611bTxCTZaXrmOdu4X993UNN0i1
	HHCDUuLDRIzF4xsVZIs9jXoAjGGWbTcXUBCYhIYJ49R0F4gbnnJ/nTQM9bnizyPe9ALyDO
	NdxZ0BNK3Y5VXs6bYO3qXhZ9DPhR6IrL8EkZt774dL450klg31wHxZwsOAoaDdgK8peIcx
	3lv10P9F2d8bgRJVhaNySzmsmD6e2NTVV2mNgHo+l82mlY3bQcWWTr8MAgl+NTxGL3wxWK
	G9aAEM9U7jnVVh5/gmD9fjss8HIJSVoV5rMkY53JI/R0FIAh7YeDrp77B0fBIg==
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
Subject: [PATCH] ASoC: doc: Fix bracket and move place holder
Date: Wed,  2 Sep 2026 17:05:10 +0200
Message-ID: <20260902150510.706055-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rgdzf1xa75bgbz8auhuiaznegm3gwrk4
X-MBO-RS-ID: baddc5f0cd909114df1
X-Rspamd-Queue-Id: 4hZmKm5Js4z8v5k

Remove '{' and change place holder
'< ... more DAI links above ... >' to
'< ... more DAI links here ... >' and move a couple lines up.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I'm not sure if this fix is good, please review.
---
 Documentation/sound/soc/dpcm.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 7b6aeab3c..91e0418e1 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -356,9 +356,8 @@ The machine driver sets some additional parameters to the DAI link i.e.
 	.channels_max = 2,
   };
 
+        < ... more DAI links here ... >
   static struct snd_soc_dai_link dais[] = {
-	< ... more DAI links above ... >
-	{
 		.name = "MODEM",
 		.stream_name = "MODEM",
 		.cpu_dai_name = "dai2",
-- 
2.54.0

