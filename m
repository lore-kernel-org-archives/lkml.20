Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561164;
	b=VUjaG72n6Ma+DpqQRM9qFqQZiltERVoBXEkUq6sk3A/6mOaZtcdCc4C4JNjdIYMXessH
	 FWHSyqWWpYLFlUR18E3RHD8OFyqHUNjOG+obiHKVrfI0oETcXqEz5He/DJNr2r/tt8Vj/
	 vFZVtH4bv7fUvh4M5oXC7xfOAY32/e3FTgY6oTLPVAqUzYFV9RQDh+4md9OaltIVcLk0N
	 Cr3wXYIEsl+i/KwoSqpsvb2Qk8uvZsm2k0uMlOU+l5ZjUoKOpjPDBd0PwmQVhkgt9eSRS
	 pqMx4qw5n/1vvMgO82Q/te5uiiz/AtzmPVcJtlxxxED0hwa2qurCYHpDsxDFlJR5fzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
	b=UFJTWQNtz9NDufiLwwjowLdf67Csz5Jot6x2AbgxI2ySRZFy45Lg4GnmT3oNCWtIO4cq
	 htKVZBbGQ4I8huymRhifa3QJIWgHeeYdOE00vHffvK3eRIgWbYntPmyl2dCzPyeYFQXbI
	 jyytT49kIVAFkmB+BitptcGamqDql1a+VCX1p9FADUbb+CAtxdweH9GgNDgatXsJ9LMpZ
	 MV0XDJgIYQryjiKouRgyX8MQf4E3rkalqmvQA8VmpYg26tJ6pR2xY6KIbwAzhwZ4ncz6r
	 YcfLUhezeMVqM76fDgvqEjeAB7f2LPSxDl6K/M+6HXO7fx+2+ggOyOaBXkXT5G3z3qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKc9w+kO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E286606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E286606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKc9w+kO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3720addb068so1159414eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561164; x=1795165964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
        b=iKc9w+kOgcZ6kHWSLJTWyRO28KyLicx5hWqtuPQTZYVk/9U9+dsp7J5yPjzOuEqcQi
         0Zgk5pzt9wES39jIDhru/ZQFiybBB9HZqRcBYzc49BepAO+JB2Q6t9kMctknW1i2YG92
         97kKy5XZTD3bil0XRd+SmRpEtIwhJlqqriE/FND4US96dNspSKPRAGM63pEFzDoT/Pqf
         BTxmGFM7AoOHC8+Zp2W9hie6DVIXPqNcLxfWOUHse9ot18KE/Kg4M64m/pCbSxwk8eAp
         lWUN8P5VcwWvPoBCEaHuTn6mLixLvPz1Vha5HmSZNmol7lEcIfIc5Gvdy8m5NAh0quRJ
         Z7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561164; x=1795165964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
        b=idJtd4Qq0VY2oWtmFRmnJHaPpTxHsgd0PtDC8XzCHJo0GM7T/7aApcXw0LCZM/Xero
         2bNL765V/ODfhGYPuqJ9VRYjDjbM7aXeaUqv3J1Z+wqWtnUBIV12eZWntIXszX9QncBW
         0DzMoSaPg3RnJeEzeLymh3CyB6EMZqae5xQnrv7mbxysGXQiCUON6M6tKYdR/Ww5T4mb
         yklfr2j6MXioe9jqBojM9PT12J/m4il1lCYGkqvF90fBCNKI79uLqsTQbAwNMF8vH9pT
         R+5o4dCCEMIG8s9HrGUxJtUcf1iWd51k3RFktx0EYglXPLyGaGytzZj7emQ9KI0HnGC5
         fwUg==
X-Gm-Message-State: APuU4Z9d+2yLNpiLH57Xy6+BcOCnxGhDdTZnIRUQH4tpeSC/O19Ekdtq
	GRR/f7i3rGH8ndrfod31EMEhf1MA20jd+PfsKcMVoRq7p/zepoBotVMo
X-Gm-Gg: AYBFou0lYTJwgVvkplXKAmblXyjHNYjokyXDcD35fHlCef3SZydi1oeYnvy7VvtVcNE
	zECONC2fJwTNk02oOO1KgR7hno0dDH5xqxF27V7lTQQTBFfEqyt/j0Cd1ajT2NPcEEz4d3HeDxJ
	UCHze9cShLZP9Hl6PdBDN/EoeszRloCJbyGJh1Cj39F2yQu7bphz+e2MjrWY0gmWm9h7Mik6mq7
	DoHpdHM17S6ijjInwj116Jz0a6StQt+enmWymkU8w3/WUq3dv9pUKrG2svbU0fxRO93FDQpO7mO
	8I3kklIS6LM/ssClAIjnSlSexpea7YMnDeEpoFPsY/KT6JL1EZAicSB+sDBwbNIu5LX6XGdKvOx
	BXr2lMszsr3oUA4DUN4axkC5diw9lxMqoFA/1T3VzrQfnPh1lP/eAsPhggQFxAqos7ccxgwtwp3
	aTQZxawHceBjUvOPNNCelyOvrCM39l6vDD3CLwmnfpro0StAdhIEM2W0vhWbuCQ/Hp7d62eoHsf
	Ghgk+rnGb9ikQnEit0Dte3o+6GmauOUlqiMcG0K7K6Rhp+MuqK0dsYDCXlx8S+bljJK0bQtaKG3
	iskEPDswF43fSovYsS69Dqjjp0yIXHCALexDo5g1OnP/R3zJHUZf
X-Received: by 2002:a05:7301:1705:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-37965f9ea5bmr1635524eec.13.1794561163503;
        Fri, 13 Nov 2026 01:12:43 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm5442356eec.4.2026.11.13.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:12:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: compress: Set metadata_set only after successful callback
Date: Fri, 13 Nov 2026 09:11:59 +0000
Message-ID: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the metadata_set flag only when the driver's set_metadata()
callback completes successfully.

Previously, the flag was set even when the callback returned an
error. This incorrectly indicated that metadata had been applied
successfully, potentially causing later operations to skip metadata
setup.

Update the flag only when the callback returns zero so that its
state accurately reflects successful metadata submission.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..9b53282e0192 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -796,8 +796,8 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 		return -EFAULT;
 
 	retval = stream->ops->set_metadata(stream, &metadata);
-	stream->metadata_set = true;
-
+	if (!retval)
+		stream->metadata_set = true;
 	return retval;
 }
 
-- 
2.55.0

