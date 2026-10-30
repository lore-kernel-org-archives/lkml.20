Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334204;
	b=Gz3j4ITil4yK6S7JMNMNaFLJ8gA37SUqFToAusfogvBZytFP54qW6VelT0GYTz8YZKN6
	 OucWDVJjNpJAISsfcYPEUtgxicQYT7mAUbEPXivlp5byixGW71Pkpxh7eVkCjuDnsRLlm
	 F+dSujKtS2o45BwnBSWj+TIaXgTd86FM6IQGVWSTMuiU/wLbkJvJeOIHZjTqeimqxfrxW
	 Bm4vJKGuRnYk6y3f/DK9HLvJAE97mZ+xZu973B47RbTR3U8S+Zh74okDykcGZ5RZw0YVi
	 PINstCLEY1NAVRU4qIEDdRxh0L+027qYtDlDA2Skxcl4LtjoLePy5fruQZUNZi6ppvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rKEjNwOw3I9jkzOc5s+g5EecQmWBKoMG6BVKkxwXdEc=;
	b=aUm9xWBC4sEtH7/lORAbh27tbL4etqpENMP+A+CCMPeNzmdZhh5EIWFEACT81x6zkn+m
	 5GEkF7jt0prJykckEG5OQl/wlDgQ8kV6vGzHna/O1cXkK9DZPqvkYCTcA21LMJy5UFMEI
	 SfHfYePY22l3edn1JfTp0FxuXtpc6DdHf1VOJCSyCmpdnIja/zE+sMNCiBzOxPMLp7yx8
	 /Hw3C5Bmw3+RtAhLlQ3BzXteVxsbY/u71UwpmkuXHLtYKFCTVgyFzIbi2gqV5Dmrj3mfV
	 RwqDo+WlPPFPTlScUW2Ipp1zOuEcnWV8DuTm9il0dTJ9/EJ0z1Ii89SKSBHfi3W0uFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=FghjVlFY;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E22606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E22606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=FghjVlFY
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df7f544919so180510eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334203; x=1793939003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKEjNwOw3I9jkzOc5s+g5EecQmWBKoMG6BVKkxwXdEc=;
        b=FghjVlFYMvCfSv9cB9Vtqen3PR4e9RoJraqGcWvZLvfGIXkiba4JQG4ZHkxRfkJrB7
         ZZ7Iz7JBADqcS1Krbw8sHeuFsn7LyEp9M5SDI3pVtLjr2HGPTjO/eWBpR/FoYeMy1pHX
         VkbIEYRK2Att2oPTJrEM5YSDWz6PvE5xtNKRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334203; x=1793939003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKEjNwOw3I9jkzOc5s+g5EecQmWBKoMG6BVKkxwXdEc=;
        b=ImjZ4bVpxzL7BEZSGqamqzOkUpnNTg3J0eVwyI9Nh7NQUb3dURxOvXCWuKLdk3Bky0
         FSdPBuksk86cCBauFeI+W50Xti1kwHoay24z9Y53Ar3nTJuI5xHLeGHb/5bWtkFfzo5u
         Matqgp70GJZ1ttOXXHfsmevI9Kg+xD91q7JZbvq6wZsoD5pleAavQn+WeN86/ly6QjIm
         4kjpVbiw0O2rVlZAzfK+hwdIU7ljXhOpAx9wXlYHbNxem3wMCdCmvIQVYFqQ2pbfDCmK
         Y7PAW/mBf2G3v2L8KkRE25Z1WV9cIdw6PnBTyQs9MtQdYK6qN3fUGoO7pnAYqOAx2B0X
         l1nA==
X-Forwarded-Encrypted: i=1; AKwUvBwk7AnRM/8d5H0JmMEgI0QtgGd0Qf6YxCW49VK1HSH9xx1Tcc3N1PQdpqrTuoLLfx60MwH/mDd2wBNs9xQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGN5Xe6Oo3xPZyesTUgGlRLs4DrYHpLkSVer5i8plkKK/QqePb
	nSDIzdDeuJGJEc9sRNJNmAKv950GTsxc6HK/4OaD5tB/+dOcmcilgCPlNMbyC+pZwiTZqFA4dUI
	PS5uHWpI=
X-Gm-Gg: AYBFou3ff9uys99re2bLvm74fDaHs89oYTt6vXTjUcsdLOmWSLgZnyH6QSjILpMV331
	JkzlUTMTDzk+MBqHLt9OoDfLtQQ8QpY1lRbGfgFbHdxFCcN9hlUwylY8NEBXUGvN95PPjH9QleX
	0CTyIzPXNKlvVFj4UI5Ox1V9TRMmA4NCEUyxNSpr9+X97ChKf8Pee14x0eopTuHuh0VGR+6N/hN
	Pl3FFCJgctY/LP6oHbChRVXoK0oBaWm6ly1tWdFEqBXnw2sLMfTP/ZAVPiKdoRRFaT0SFgTPwkc
	+kzqoWmm6EKhHCPPbpVFVm9+I+WPsa7KqrdfKf5jIKgt3tOadpTffx+5LqGvWkSwWcEUpfd+s5d
	ajfhqhYSb4JCKP3CNMFuQEgjeTH64u3PH4ZUVOYZ5Tr3qgzLs8K/0NiGAwV6EzgqFxerzO8iZOY
	1n0XfRetZrvAostDfXPhJz7KXjRErYyGFEwjf5vMSNE/+5JtR5ek5zQ6q8bomKNCEhpYf3f/VDi
	RE31PD/VUq43GY3b1akCmkAkVP2fUyz0q0UjZOCEwXpSvrRqf5CmCgXF3ldGdKbPm8n/Bx5XPUu
	pSqImRtr+JfF3sr/Nsiwh+4be1c+KLKm5egXhn/7HkSaIqXXupiiuZyOU0Xf1yf09Cz0gsbq5Sr
	siAdEIccRVyO/GpkJPVcmdH1Pfv6e7A==
X-Received: by 2002:a05:6820:8599:20b0:6b7:46fc:1dc with SMTP id 006d021491bc7-714f29af088mr598492eaf.59.1793334202967;
        Thu, 29 Oct 2026 21:23:22 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a84854sm1052342eaf.2.2026.10.29.21.23.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:23:22 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-sctp@vger.kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] sctp: avoid requeueing pending control chunks
Date: Thu, 29 Oct 2026 21:23:21 -0700
Message-ID: <20261030042321.74407-1-kylebot@openai.com>
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

The T4 and RE-CONFIG timeout handlers take a reference to their cached
control chunk and submit it through SCTP_CMD_REPLY. A previous transmission
can still be on the control outqueue when output is corked or suppressed,
or when sctp_packet_transmit_chunk() could not append the chunk.

sctp_outq_tail() then adds the same list node a second time. In particular,
re-adding a non-tail entry can corrupt the list without being caught by
the insertion-time list checks. A subsequent flush or association teardown
can walk the corrupted list and access an already freed chunk. The T4 path
is reproducible by an unprivileged SCTP socket owner in a user/network
namespace, with KASAN reporting a use-after-free in __sctp_outq_teardown().

Check sctp_chunk_pending() before adding a control chunk to the outqueue.
If it is already linked, release the extra reference supplied for this
enqueue and leave the existing queue entry in place. Continue to the usual
flush so that the pending transmission can be retried.

This also covers RE-CONFIG retransmission after sctp_assoc_rm_peer() moves
the request to another transport and starts its timer. Keep the existing
timer handling, corking rules and data-chunk path unchanged.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/sctp/outqueue.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
index e92fb9da4647..a5f9f0fcf5fd 100644
--- a/net/sctp/outqueue.c
+++ b/net/sctp/outqueue.c
@@ -304,6 +304,11 @@ void sctp_outq_tail(struct sctp_outq *q, struct sctp_chunk *chunk, gfp_t gfp)
 			SCTP_INC_STATS(net, SCTP_MIB_OUTUNORDERCHUNKS);
 		else
 			SCTP_INC_STATS(net, SCTP_MIB_OUTORDERCHUNKS);
+	} else if (sctp_chunk_pending(chunk)) {
+		/* A retransmitted control chunk may still be queued.
+		 * Drop the extra reference and retry the flush below.
+		 */
+		sctp_chunk_free(chunk);
 	} else {
 		list_add_tail(&chunk->list, &q->control_chunk_list);
 		SCTP_INC_STATS(net, SCTP_MIB_OUTCTRLCHUNKS);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
