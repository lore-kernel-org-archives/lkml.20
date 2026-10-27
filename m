Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793130455;
	b=TzPZlzp5xmLiSfeY/5jSGU/WgynwDBGVT3OaslGrHWgDd60840R6wKVMx6PW3PbfNnuT
	 0y00wd2tHbDm54B0R/cwtGVySpagooB9lbR8Y0UtE9lDwNYL+aCiZsyDqIqn/6Edc94PZ
	 YSgQTEdjxWUoJ98M4XyTOi4X5aE4UUW4X+cDkwLOJGuozGCTqVGVmFim/T+Gr9JR8zk0d
	 VtYIufFgcq/ulFOYw9wc6ZWyAnS4XdBJlJt9S8nNnPYGWPKs4KMT4Jv8lvLI/oHRRU/16
	 0UsSx5wJwIbutDv4W/mH5NpFV0lAwHmFQinicC5lZzX3WrimJnVULZ10OOuXyrq8IhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=me6FYCM5eDvC62XQltr2B69i+y7XDQa8ZdXTfsp7gZA=;
	b=MeN4ru//1ql+Ve/KNIC/mWJO8BOSsat6yY2fw+r2hMhRgr/kEPQ6LYONUN0S2Cl61JUk
	 tqMYQrWxYarwQWPZ15p8Q6RoChOxkQvQkxDXtr+hQDDp48n5CmPGhx8s8Fjy1IzRx8ZJk
	 xcKsxn5X3L9+63N+/w3Q7ihvvqYXXLAbqM1ugJ3gsk8thOPiFTLb4umCluvvSREt1cMZS
	 N/QMMYenV28jgWC3UM/OeyTrSveRwfz7I0vm/f2U94u2UNc255a7jWBvABkW2GSxy+Kl4
	 te0r2p+jB7SZ2vJ2zOKAq78nbTVhI2WZw9uKqJpRqV3zGAdSIP2FysaaZID+7mrM4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMYKl0eC;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA89606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA89606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMYKl0eC
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso282031e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793130454; x=1793735254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=me6FYCM5eDvC62XQltr2B69i+y7XDQa8ZdXTfsp7gZA=;
        b=aMYKl0eCwlrlsWWOEx/HtuKgHbE0iCfzEOJ7PUIjA/gfKdHEJ//njtWtATgA7XgmOE
         +ccSz7MSYMjTwoi/5eohvLjuv2IuCbFqGU3DSXpyd3tS2br4pSPoeQacDTcBeV9tIDRv
         A2K2eft7oC5pgh7hCQZa2/NKNQVISLMv5+81zqH1+ZinYW/MhEw9R4Qps7WloS11WuCH
         RAU7pGquZ/X5UzPXGDklCy5Wcz4p89qKG2JgP4Wfshlmz7OmRG2O81Elnwt615I2VqeS
         fhee2mOvn/kQMhmPBx/Opc6yjUPvxny041so7K1W36b4r4DmKzRqWADu5OrceNdwJIAj
         VSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130454; x=1793735254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6FYCM5eDvC62XQltr2B69i+y7XDQa8ZdXTfsp7gZA=;
        b=nLjGyw+nfkMRSY55HNa1YpiRtZkA3wRoxwasSwYzWwXpibTkXKTQRTGsvsjp9t2Ssw
         Vgdjz/V2EfTY4F7s6wzW9Z50ajoSwqER7erECuectjaIWLs8/QxoifKyyiXuls1LW0/w
         MbSsEqsEp9hxbJqeUHrtx+oiMhCZORi5aTznHOyKJjxbUr0DCrtjyPDDig2BVyzSjMiw
         JBzvv+HeRZatiUrBVGH1fhW7JXZPfTOcUqOWV71d9vshDk9STT7vrflAEvHsqdpa06qd
         WnHNbcnfFdV1wQPazEEma8XjDG4pU0/Nx4CwR2rcdKo4vhamrnoo2qGy/KU2HT3jclwt
         Ei1w==
X-Forwarded-Encrypted: i=1; AKwUvByZIuOZTavnvOxvijMc2JEBVVgTkLPMmw+5ssowMITFA1Kbqifb6MdeQ1GyuoIRe4KhElwWLPB5labHCzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhKtAj83FJ8o2Emq9Xo0bbrF9H4+UEXAcRHh2CZEt568fzOHzO
	6yjOjAFRLwTfeS0Teu1pznF8//znZm+DuScBLKUa1/EWZJ4wRUL8aNWW
X-Gm-Gg: AYBFou2rg2XJGwVsECJGUSMO+oa8U2LlUt9plp2ZpzX/w7nLROuoNFO5YpyA9lOe0Aa
	30stKviWkfMZd6ARnyBhw630vN5X7bxog4G+LSxaJ6cIkohsi/cHP2DaxsjW0kK00IdtRY1EZq1
	yXrEGc/P4/S2PL2T2SPFHYU2MvQZe6I1wNC1w2JFfvtPxsZkHfGM9DK5YiUQWZylS7qkvBPGye3
	ZbbJ/Qi3zvb7LaVhJVcSBhpStgQvQoW4wcL25PMjtPOFh+Jt6WLbjAGQfBP25ElRmrIysgS0Zrc
	gqAQ/bPYlweQiUi8oBVKzIN8IVekSgbKfGyGnoyVvDsiaXqqajhq7/BLuqa6gZH3KTaK++LaZJp
	xOB1NIFhyoFwB9sYHz4BEhT9Etv117/RoWEBsFyl19BmAbPQ/9WEa1MFUDjkXQs8AJ6kmyrW2Or
	i02jw7L8q0b0djpuymOoqoQftVsmOZSqtextVP5htja2vzeHILYHXH4DrmTwlrVmSwfMXQcFfZF
	7wb7ongtXDOCZI5m5dTr6La0vmorvDecdKaIfcsxdVqDI5YZuXnKWeJsOJl2OEcMCpAHEi7AUzF
	VIv+loM8gpM=
X-Received: by 2002:a05:6102:440c:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d039fcfd46mr168471137.0.1793130454126;
        Tue, 27 Oct 2026 12:47:34 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:260a:a9d6:ce02:aaa8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3973caesm3466801137.2.2026.10.27.12.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:47:33 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	hare@kernel.org,
	sgogte@purestorage.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH v2] nvme-tcp: fix request PDU size when header digest is enabled
Date: Tue, 27 Oct 2026 16:47:10 -0300
Message-ID: <20261027194710.334495-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
and startup") the I/O tag set is allocated before the I/O queues.
nvme_tcp_init_request() sizes the PDU with nvme_tcp_hdgst_len(queue),
but queue->hdr_digest is only set later by nvme_tcp_alloc_queue(), so
every I/O PDU is allocated without room for the header digest.

With hdr_digest enabled, the digest is then written 4 bytes past the
PDU, over the header of the next PDU in the page_frag cache, and the
target drops the connection on the first I/O:

  nvmet_tcp: unexpected pdu type 159
  nvmet: ctrl 1 fatal error occurred!

Queues that a later reconnect adds for the first time have the same
problem.

Set queue->hdr_digest when allocating the controller, together with
pf_cache_lock, so it is valid before any request is initialized.

Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Changes in v2:
- Set queue->hdr_digest when allocating the controller, next to the
  pf_cache_lock init, instead of reading the option in
  nvme_tcp_init_request() (Keith)

v1: https://lore.kernel.org/linux-nvme/20261026184621.29276-1-christian.aurichzm@gmail.com/

Based on nvme-7.4 (aaedcff90148); needs a504cd79b167 from there.

Tested in QEMU with nvmet-tcp over loopback and parallel I/O: with
hdr_digest the connection failed on the first I/O before the fix; after
it, no errors and the data matched, also with data_digest and with a
reconnect growing the queues from 2 to 4 (attr_qid_max).

 drivers/nvme/host/tcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index f876375dffd2..2209586f3809 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1948,7 +1948,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		}
 	}
 
-	queue->hdr_digest = nctrl->opts->hdr_digest;
 	queue->data_digest = nctrl->opts->data_digest;
 
 	rcv_pdu_size = sizeof(struct nvme_tcp_rsp_pdu) +
@@ -3098,10 +3097,13 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 	/*
 	 * The I/O tag set is allocated before the I/O queues, and initializing
 	 * its requests already allocates the PDUs from the page frag caches of
-	 * the queues, so initialize their locks here.
+	 * the queues, sized by their header digest setting, so set up the
+	 * locks and hdr_digest here.
 	 */
-	for (i = 0; i < ctrl->ctrl.queue_count; i++)
+	for (i = 0; i < ctrl->ctrl.queue_count; i++) {
 		mutex_init(&ctrl->queues[i].pf_cache_lock);
+		ctrl->queues[i].hdr_digest = opts->hdr_digest;
+	}
 
 	ctrl->net = get_net(current->nsproxy->net_ns);
 
-- 
2.43.0

