Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754497;
	b=P/tXNerHwiWOFYp5obqAVPg+yjNqhzg2VWWBmPAIsS3yXi9xNk+1HFGaWZP/3TCAqqMJ
	 R1drxTbIAz0E6e91w0q8gQ1ilzReYz+AV68JSrLvciX9+bzE0YrBqvRg7Ugo3E3U4sM+E
	 IS98qe60DmLWdUCM1JivRw+4oFsz8tN51rg/zsOCYR27zSOInN5gjL2rZK+JjF1Ua1KSq
	 wc0HU79LVZPzADxl5pyNzgy36Ya+ou7t87FFiN17ThvMgecOcYK1OLmp+Z0OPXcqiavTt
	 4q7LqKiHufdq8w7FuTtYRiR6JYTVUE3kbyJdfYnsPrOthrINCIbOD4eBb+qCRI2bWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754497;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=QIbRduFPpCg49J6sKBw6kbel4NImvjAYuxGSKO+X2OY=;
	b=xdGsWYugSlRSDt9tdjKo1El7L5MYL9rp99mkL/KZPhrJOXsifxtAllOeau+06Sd26xg2
	 +27RsGgEPhCtkVDSKD//QXCZFgL99oZO+FLthegf8bHHlbGjgA/J95DN796N+Uc3CGRbh
	 cKoyb6hrDX/Jh7WXM/faDjQvPD/Y9efMIAiRsKcHY18+RID0t3KRRtfmBsrt0PXZo0rpV
	 vKFUOvTAqFMNDC5vzGgjjnjNKaHwIoSk4p1+nvwWrKL0dy7MZ+v38gN6qj0Hn9w3ujvpw
	 psE8lCOk7y5aQlnFwC4kSbWjDFIS7n8s8j7vT+RIHL5RTf4N4SPRWV3Elv5iVM5TUvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=s6zkJ6f+;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F317E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=s6zkJ6f+
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jB0vq66w3zMlRG;
	Fri, 23 Oct 2026 13:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792754487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QIbRduFPpCg49J6sKBw6kbel4NImvjAYuxGSKO+X2OY=;
	b=s6zkJ6f+zClPkwezqXZnc5Y2cp721EhnkKkyh5KzYL54RHCjspwPT5HVVOXbCEjAj8Z4gf
	ynIrfiIlVWlO+xMjfXGQggnR5y2QJwAVEnSyTjGgurIUTLkpM0yoFBnjn1rgrVYoP124Ob
	L0DDnQ8rXBYLduHk9xEnW1bCqlrO5TPtCmTK1xRUSnuvYjMDGGDgfpHW1NWZk3dXo4ie0n
	TKe8N4USqFrxbyD4Yqj9zOBJxW0vFW8kYslJfBp1ZdJcjo514ARcvUUUMNFkT1YqCTe/tb
	tvhFvDiUyWVOkmTDGxytd+XtZT7Q4Wm5HXADirAGxv29M3NOCmTcfLsfuOTdfg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [PATCH v2] drm/client: Don't print a NULL firmware config mode
Date: Fri, 23 Oct 2026 12:21:25 +0100
Message-ID: <20261023112125.2855499-1-hugo@hsal.es>
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
X-Rspamd-Queue-Id: 4jB0vq66w3zMlRG

When some tiles of a tiled display are missing,
drm_client_firmware_config() replaces the connector's mode with
drm_connector_fallback_non_tiled_mode(). That returns NULL when
connector->modes has no mode other than the tile size, but the debug
message after it still reads modes[i]->name. Accessing a member through
a NULL pointer is undefined behaviour. Today printk happens to get an
address below PAGE_SIZE and prints "(efault)"

Print "(none)" as the mode name instead. A connector whose mode is NULL
is skipped by drm_client_modeset_probe(), so it is left off, as before

While at it, drop the extra colon in "[CONNECTOR::%d:%s]". Every other
DRM debug message prints [CONNECTOR:%d:%s], and the double colon breaks
grepping the log for a connector id

Sashiko found this while reviewing a series that makes the fallback
return NULL more often, by also skipping modes larger than the client

Fixes: cf1d0180f571 ("drm/fbdev: Fallback to non tiled mode if all tiles not present")
Link: https://lore.kernel.org/all/sashiko-outbox-173425@kernel.org/
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Changes in v2:
- Use modes[i] ? modes[i]->name : "(none)" in the existing message
  instead of a second drm_dbg_kms() (Thomas)
- Drop the extra colon in "[CONNECTOR::%d:%s]" on the same line
- v1: https://lore.kernel.org/r/20261022114356.669988-1-hugo@hsal.es

I ran checkpatch and built drm_client_modeset.o with W=1

 drivers/gpu/drm/drm_client_modeset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0080a8e9556a..67f90e5d1512 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -754,10 +754,10 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		}
 		crtcs[i] = crtc;
 
-		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
 			    connector->base.id, connector->name,
 			    crtc->base.id, crtc->name,
-			    mode_type, modes[i]->name);
+			    mode_type, modes[i] ? modes[i]->name : "(none)");
 
 		fallback = false;
 		conn_configured |= BIT(i);
-- 
2.55.0

