Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687A4AEBC1;
	Thu,  8 Oct 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487571; cv=none; b=mOHWJBHTwBYkbKMtDQ25wa/x9fRN+6xJMYAvaQTK9yN3WFtyAyGmxo4EfHe7uP/MgUEceD3EO/Utry/XqkSZt7k+FVbdP+/vSfbLJhzLvXIpsMTlgUyZaFHg3M8fkW12+/kAGAy8rEg5kqGEVLCQaEcgtPT17W3BsGGDAE9t8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487571; c=relaxed/simple;
	bh=CKAuxGhFzVbfqKLSL3xwlaNaLXVXMi5yqKpVUMxsvaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n67jE96JuWq1ihbldSkcHW6PQyvVoqRo7TqZoZXW35rjcjcljw0GV6+fVdzfX5i0dK1nPsIyGSQJAyEHTNI/MT0OFTzHsc0VmTo9jN5C3Ui7d+3Uu5Mmrt9wyp1GqzIJFupZjP7TMPQ26TcmiEAM4HcHubnNy6ClusE7lZcEoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C0A021C40;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 646E71395B;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] ASoC: fsl_asrc_m2m: Fix bogus compress task pointer assignments
Date: Thu,  8 Oct 2026 21:25:48 +0200
Message-ID: <20261008192553.300025-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 9C0A021C40
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

When a creation of input or output compress-offload task fails in
fsl-asrc driver, the task->input or task->output pointer is left with
ERR_PTR(), which is non-NULL.  Then it's handled in the compress
offload core and it tries to release via dma_buf_put(), resulting in
an access to a wrong address.

Clear the bogus pointers properly before returning an error.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4bc40f328f58..42b0e21f281c 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -475,6 +475,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 	task->input = dma_buf_export(&exp_info_in);
 	if (IS_ERR(task->input)) {
 		ret = PTR_ERR(task->input);
+		task->input = NULL;
 		return ret;
 	}
 
@@ -485,6 +486,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 	task->output = dma_buf_export(&exp_info_out);
 	if (IS_ERR(task->output)) {
 		ret = PTR_ERR(task->output);
+		task->output = NULL;
 		return ret;
 	}
 
-- 
2.55.0

