Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727192;
	b=kr8vaMQLjC34ql3sfgsxKnozu6UM3ayY85lJI6PdrCo+EYZz9QGyuPCzWSpy6sM4gnzK
	 qB9Hui5zg3zXNWavfZ3yoE5mt+dYAEWeFP3lWt39EGuLqn3haj1GetcryYo/z3Tg/c2GC
	 T8NY+pPQH6W9Qin7Ys+6zsXi8/BMKCXM4fQbnZTVodD2641c/taT+r+Eo9M8Ipt90j9kb
	 t6crA6SW/dKMWTHAxQfMD/wym1q/dfIbLmY1Gv42B5B/njRty3/eb1SzPjwlRcZV4Yp/C
	 YTaDWT3UL6nsu+NykS9D5iBYTXo3PCR+29FOLQISsEnmAEHmX7cVTUVHUJfPS4oxkHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
	b=caL63Rj1fTTs/ND4vMhIvJ9UHArue3bUyLlXk8swI9u0fXzTq8VFuEVo7OcfINqaIAYO
	 S+awQ+SlCdksC1AEo13UF4rZhKicKihntY00JkseAKUmcuhvBMd9UiG7amekbCH4f2KYW
	 z1KvyYDGZ6P8wpgEHkeEn1sDLdZQtRaVsUgQ4Jz9z6RBHDDmXzV6h4+f2wPJ3iPBBfE4b
	 EW7jnnBgA0xVW+DyMq/HFzsaCA4a+30ezODjb/TyNZSQ97cdkQJM+5yQ4ULZ5mi4JH7E0
	 rPbLhNs0LNLZId6yoR5Z+7syjbmx5T99SGs2pAlveKe9UiS+0ipTS7Bg/XpLjynYimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2YgrPrk;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547B60A380D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3547B60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2YgrPrk
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702fd86d674so2341286eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727191; x=1795331991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=w2YgrPrkqUsnRysCkNMt3GErNmxcugHUhCjZJugSCecv+b145Mg0blwX9XY84sOBNZ
         kHi4poF3jcKjW+SLuPUNnpRvHfw7fg9sdry5lgGZu/27hvwM5i1rl7t98kY/dGs2VooG
         RJytCHNMMaKDvgiStjN+6n5nho0U2El1KaOixb/8s53a06CXKSh5AAQc/QnCkhemfnTh
         Cd8T6pbZa7kuLIpYgJo92wipYNH+qyfEaj9nPqmpsjz2dmYKeedxVWEOqafLBLfCkMbd
         EopS2FBcglZdJ4oAxwhXjrriBhDUnO0GHVm6yy6AkPHAYGInCeZcH3p4fEoBjUe1GtSA
         bNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727191; x=1795331991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=Qh7uD9IZrtyIcDjd+eIUlgvDRxq/mH7Fz4QhW63oG0m3gbDGckwtCXtx4Lo19QAe1q
         RlKrqR/16SnSeRBESbeYHc9W3l+zaFaFqWAhTAyRncRQ/yFhkmI9q4TA8FkY7A7o0uSX
         kgXogd8nv5uqHeM4RtAMOfv8dWRr2bQ9owrXx6tjOfLXIkfGd4qIAgStgk5pyR5YePWP
         SiINl3q3kcVRZQQ3EHngRxUoUMIhx6bpNGoYCkavwpAtZpBfVm2yNrWoLq1wKxHU5S0J
         kXv+l7UlKVLgPD66nbjphGY2g+nnw38nZVL4ckKPs7qRZlRvHA28Yu3t18IVB5/MVvM4
         Qo5g==
X-Forwarded-Encrypted: i=1; AL+hErFXeOGDlOZgC23bOG6r9nlAJUZAR01QRQZGOGjPsjFmVsvPAcqHqXjX51qn8t2dX3KJXs2Eo06OcjJde4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ede/4KBSSEql/CBPikwXIoafEYQSmgXHykDHtllJKbYqZpp9J
	mtbKg1mnRY/JX6yxqsKgl5TSut5/z5IIEaop94s55sM4JfzLQ5yuVdpK
X-Gm-Gg: AYBFou0+rjYW7gJGrdm9XTbZYdxC7zPNtcJz+BI6jeDo/+uIzATB3AzjlEd4kYxsKMF
	RME8pO9aB5RA6f1llpF5TscIn+A4XST2/6P8bqY2+8Trtg2NPtOFRyWj/EzsVdxShGGG46NgOEQ
	Yv93kHgGUNekTJxwQNNlkxLs2SroaJZPBUJlGc5B0C5QAvE0vbUa3tJdjMTLNAcrtum1d4RQyCo
	EwNz7ipntT1Ubpo9ipZJ/4r14Y2g5zJDMeIwgramvuMibM8Vk4nbM6uzf+d/q7XRPiV2gfO5amD
	nH+18plbfjUuUCRRrMZ/nMusXaR0WQLZdfE1zb1Pf9jptQcGjGSOjrbj8iKU8Kae+OyR8q75hkq
	hzzfaRO0lhM4HyQlw73Xbdf3ctlWummVGP0qODpdTFwwEzJvWxv/8vAdhU226FqyVRMXXryD/ev
	HB/PLhHXyQC+RPMeAtQ1gUfFBHTdxTA8VgAmqwBWxtg99n0V9Fw7fuFuW5B5BljxPBYqeH3XYUv
	COM+2Kh+UZXu27D4+h+gXSukyB9zwB+GJrmhmLxTdjRWP9Rgwn807HWDTMCJGC4hP7tfo6FZAkG
	Y/caFhZ+Hin1ANvGdQbAbDOFg6EinTZmizdiNKWBrsMhqUZ1SOHq0Izs8FYulrOZSws+LCzz4Sc
	yJaR62oJLcK9IGwhD9Fiot/DeveovT50lgY49jDrHFmIzC1Px4HDKSayFK9wGequRd1ECAzzNxk
	RAGllhBNORej1yuXca39dnQePoiP4eXW1CFmGOf5m0mL/qaigGnKk=
X-Received: by 2002:a05:6820:3385:20b0:716:bfdc:a084 with SMTP id 006d021491bc7-71ab50d4472mr2939790eaf.60.1794727191190;
        Sat, 14 Nov 2026 23:19:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:41 -0700
Subject: [PATCH v7 08/10] dmaengine: dw: drain the tasklet before releasing
 channel resources
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-8-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c602ea01cb83..56a422ba14c1 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -419,6 +419,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1062,6 +1066,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(dmaengine_chan_dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1087,6 +1093,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(dmaengine_chan_dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

