Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792846028;
	b=wP/Vv1SC4udLZrXXQ5YkzA4Jf6Mi2Qdqc4qxtRTXCmsNrctnOedVvTMXySOm+7avs+Wg
	 T6KWX9bq82kuGn5d3+gZBXq5Z172DmqbOiSuxu+E35KSF48LWeTTAtas0zJoCaf1OBC/e
	 3/d7WsK8MLlDMPaP8cL4D5WN77+5RemTd2doJsMXHN4YxYg3G98R8lv3pRRX6sBIiux9s
	 fmzIrIJeZoDYT+Fe/n/YbmBVuQ3I61bnOLbcUDllDurbG6ZwTtyvlWVkZAGC0Bnq6qTX9
	 EWvFlIeJpi1/jcBBKnxLpvEuFjwD9ViZFv7lriBpbC0itwNgrChxqSDK9xC4z898Y6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846028;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=xikp4TB9spiMH2nZf5euHiRqu2S+fh2ahGiFhJdMLMM=;
	b=TmJK+3Ts+0F1D2QvwnSt2o8joZuGaObDXDHeu6kJOlxoJbz0v8bk3jmMLMLt2B+iSBIg
	 3TpEiPhg3Z94WieZ7CwB7UJc6SAjpHH3h7DvYCMwm0CqSpVFwqk9HLBVGTYuY3QPuETGM
	 NMMDFdmQn/5jjqrHFCbcfDMgdvETBo8wL8ChuFaGu3WbmPIPDSGCGBjWA4G8TW6pKeFmy
	 QIhn6RIbRos7AnwPl0P3yCIm/vX+m7jcKWXoIumynp7QhemR2kMHe61oyCRlo6tYTSpgS
	 nXwmHEA2qbvxrtNspXFyuxr75PctTY/9ych5rtsygCCb7Q7utorrcAuLWgEiB/gmJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=GMROvrEB;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=GMROvrEB;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2119606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2119606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=GMROvrEB;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=GMROvrEB
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out1.suse.de (Postfix) with ESMTP id E3F2222124;
	Sat, 24 Oct 2026 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792846026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xikp4TB9spiMH2nZf5euHiRqu2S+fh2ahGiFhJdMLMM=;
	b=GMROvrEBIf9jO8I66zoy+aNU2Pj6iMJzTZcit5MAPS3LOElJCN77scneiJMK7lKAlN+Oc3
	Zo1ALUdqUBUjxZa8YQ6ZOTuY986NWnqvLWvFVkrdt/EJV0OUmR7fw9qomBTJwHnON2EfO5
	KPb1sGfgCAdCoPjwtZ/2pk2BMQQOS00=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GMROvrEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792846026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xikp4TB9spiMH2nZf5euHiRqu2S+fh2ahGiFhJdMLMM=;
	b=GMROvrEBIf9jO8I66zoy+aNU2Pj6iMJzTZcit5MAPS3LOElJCN77scneiJMK7lKAlN+Oc3
	Zo1ALUdqUBUjxZa8YQ6ZOTuY986NWnqvLWvFVkrdt/EJV0OUmR7fw9qomBTJwHnON2EfO5
	KPb1sGfgCAdCoPjwtZ/2pk2BMQQOS00=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cramfs: fix uninitialized inode mode in get_cramfs_inode printk
Date: Sat, 24 Oct 2026 14:47:00 +0200
Message-ID: <20261024124700.45915-1-ailiop@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spamd-Result: default: False [-2.86 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.95)[0.983];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	MID_CONTAINS_FROM(1.00)[];
	RDNS_NONE(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	DIRECT_TO_MX(0.00)[git-send-email 2.56.0];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:helo,suse.com:email,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.86
X-Spam-Level: 
X-Rspamd-Queue-Id: E3F2222124

In get_cramfs_inode(), an error message is printed for invalid file
types before inode->i_mode has been initialized from the disk metadata.
As a result, printing inode->i_mode can show either zero or stale mode
from a previously freed inode.

Fix this by using cramfs_inode->mode instead, which correctly reflects
the raw mode read from the disk.

Fixes: 7f9d34b0a7cb ("cramfs: Verify inode mode when loading from disk")
Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 fs/cramfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index d4cd03f4f60d..3ebaa3b260dd 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -126,7 +126,7 @@ static struct inode *get_cramfs_inode(struct super_block *sb,
 		break;
 	default:
 		printk(KERN_DEBUG "CRAMFS: Invalid file type 0%04o for inode %llu.\n",
-		       inode->i_mode, inode->i_ino);
+		       cramfs_inode->mode, inode->i_ino);
 		iget_failed(inode);
 		return ERR_PTR(-EIO);
 	}
-- 
2.56.0

