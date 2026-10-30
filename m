Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336403;
	b=11JShElfCAxpuBnUV1pnouZ76e/ha12H7SUHy8vDD/rWILPgPQ+uxCUJXbskisBXaCsl
	 PbG08GliU3vTEnMG/6t6EFOTF3kSs1I9JyYx0KrxQtNXET+olq66Aq8z25lk70atem58r
	 /Va6QropevTm53u7p9hxLYHAHiYWQhNwNs8sswMK+GYVEWlcQ4XsSB1YVnHAHnuXbn2no
	 jsAN+6tAsf2Vp4fB8o8ZL1PmQP77XOJnrdJl/NkbZqJG4o829MhiPPa+BYWDjeCqt88NM
	 EWZ2lDgyKZPetxEP3CPuSaSp+k5e/IqbPc6irf7eS4cZiWUARpebju5w8ve9H8RNHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=O43DouaR+6QC59kKBqLDg9/2ia0lX3P10sgZIeVmCEY=;
	b=HHy8zr1BnEGo5FMkTlO495n3c4sJ24K34jJzAp9+MQDhXq8dDAFQ8+3n9S1boJwZlmEE
	 i7ENrAaZskpnQpvC/0pmntN6ZStV8HbgFBCdXBS/gc7FRkvBLzr0Jemy/HYtqzQHFweoq
	 /j3sqmdpvPJjurGI3fBsbjvIc1TMeStIDLEsv/HvG/5R9/8v554vew92FIgPiVCta9o+R
	 aHD8QCaL2dx2yji/IolW8dbxKwI5cx9CrqoyRMVFf8cWivcPPEd1JDJF8UjvOPxhFHQHu
	 egel3TQRFIHAuF2izAv+uibNXOwauyGeF4IOlnpdbbwyQWisfchgW6LxgixAmWtkVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fQST8scd;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fQST8scd
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so296945a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793336398; x=1793941198; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O43DouaR+6QC59kKBqLDg9/2ia0lX3P10sgZIeVmCEY=;
        b=fQST8scdnI4f8qfDPFCkUgZkblPWEVB3+5WDBdwZoKCKTMyVCakqweog0+0D+FVVAv
         h9sgeiQD0KWrrfWMs3AcUWAXG0rLxTEgt0fpPGFETcFrRegOBzy+n1+3BulDCRpnegWR
         4LC6pGRlwY6nWrk38vdYVRMrOCL8mmWBOPnHcYoIaGI+xSzMB3aqoUftUTx8T+tI66xe
         Y5eZrXXn03cyuFK299ELhBRnIss1IDgXV14LuAYT0Jylfvfv+AZ36dj2BL1K0g0dyS6V
         yJ96//juWUgOZqDkYPYTwkzYTlusmxHkd9aCjXpOhYZGFv8FrgAf5DvSDTBChXyKRThd
         Ic6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336398; x=1793941198;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O43DouaR+6QC59kKBqLDg9/2ia0lX3P10sgZIeVmCEY=;
        b=gzMg/U5A+YtSimVSGraeNMhFh5GE+1wQHS3/rIemjau/BlCOTJBF5a2F+79oTGVEgd
         K7h8JlZ0yX96w5meEn9XI+nQ2CXF1BgJIusKBIDaNkYcQ9JraqA1IwYOXJfYydcmz84R
         lnjCPEEM4/EMSVvukPqvi5fMaqf8nvXC5WODruHUCs5ZvmyrEXb6QGZVjmiXWVVIMx2P
         JQjikqDVKpIDVKLS8YebU5UF1M7WRZ+S27QetC3bnFP2yoTkRLjMkNWfvEH+GLjxFtO3
         WTC8eopLwgeLQ5ZEleMh2jJkUnT6Cspl7DTupxGA8SsL2s5JEylQv3+XqBWOHD3jvHT+
         /NcA==
X-Forwarded-Encrypted: i=1; AKwUvBz4vzDJ0e6T3J8Vq5LRASEQBJjHmc3ikdaFFIRCNblhcFll1p28ptA71W09eCAMzcBM9Wk4Eqyn/30jAA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJC9EI6AvZllAdAns1MUegIJxJbhepG0fdRGDgWWHSQmxBU2G2
	RzOC43Xhvkyv2PbVbgB1t5riOQJhIVUyx+efqydK+oJ9wmfGuyK1DJmQNEVhSTF3JbaTQ2B611O
	+FOTob1pUMk+OlFVAuXfvBacxL/WdBAmilA==
X-Received: from pgbj18-n2.prod.google.com ([2002:a05:6a02:61d2:20b0:cd8:c6c2:d403])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2d0:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3ae8981bf57mr831249a91.35.1793336397445;
 Thu, 29 Oct 2026 21:59:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:29:46 +0530
In-Reply-To: <20261030045947.3049598-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030045947.3049598-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030045947.3049598-2-vamshigajjela@google.com>
Subject: [PATCH v4 1/2] spmi: core: Rename spmi.c to spmi-core.c
From: vamshi gajjela <vamshigajjela@google.com>
To: sboyd@kernel.org, abelvesa@kernel.org
Cc: abel.vesa@oss.qualcomm.com, jwylder@google.com, 
	linux-kernel@vger.kernel.org, vamshigajjela@google.com
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Rename drivers/spmi/spmi.c to spmi-core.c and build it into the
composite spmi.o object to allow linking multiple files into the
spmi core module.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 drivers/spmi/Makefile                | 1 +
 drivers/spmi/{spmi.c => spmi-core.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/spmi/{spmi.c => spmi-core.c} (100%)

diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 38ac635645ba..190d560f692e 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -3,6 +3,7 @@
 # Makefile for kernel SPMI framework.
 #
 obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
+spmi-y			:= spmi-core.o
 
 obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi-core.c
similarity index 100%
rename from drivers/spmi/spmi.c
rename to drivers/spmi/spmi-core.c
-- 
2.56.0.317.g454f8302e1-goog

