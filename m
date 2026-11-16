Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808883;
	b=t8LpbYitKdGq38ZplSFkKRtkhnjopsKSbc/dkYeDGg8Cr+4eifVwrJqRTHWF+v2Lfgpg
	 fU9PEJ7NzbmK5PMTFQQWkWaImyOxZEzC+GCxF/J4o4veOOhTDcwkGTSoxAGMg3MoGydNV
	 H+1vj+o/SyKB1gGGt8Md+geNQDeUZ6EmtFF6121AxVyqWeU5M20X0FWaoPCnuX7nJZnEU
	 JLcsZypGaBncAl++GGhaUJY8jRZygMPe0s65jhoEgIzTITHzAwurx/OGDP/pCGUwx7RsM
	 uJ891kE3rzEo9zTT7xtTXK79qpJYmiYuDRlD0TRH7C2LLNJBEhVzBFzfIqP2YHxoVpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=zAHAYA8/YPFoBodentzw51cBRn91JFAedQTmWaD10P98dfvk/lyCcdBtngOCqo+6Bltt
	 sxBlGW0Ve2PELcXzN6LcXXSWouEZSO1+iCno4o0TtPQtKZFMbXneJdLExnOHf9vl5tjtd
	 0ptwsxRyWjWnfmTGE/2eFPF39yxDtZERzmGfrvhM0bUxtZwhzGtrNuCPujHN0DAOeNhTM
	 7W80BYFxRcOZ0aSqdxOpmrphLdLYYlAd4UHFtDeAwH/U+ZRerh920z+VL3MdlWl8kaAVg
	 ICQ2u4R1xI/EhcruMhHLUhOo4kAlayhCyxbzuJgVvA7x7iUcho7JmLV+iTkbdIRRGog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgsBwVID;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA2606A8AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABA2606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgsBwVID
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-845788309b4so1936834a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808882; x=1795413682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=pgsBwVIDHici6eujMavjEja2MEUfJMeh/TBaeGD9M+4EvBTY3zyWjpf9JRTOMyYWJf
         22OqVv4nnp99NV+q6v6NXjBtw+AthV2blL614liTUoajd/31BdCiAwL+iZtTzuYh7MU4
         IXvSMZZ5GtR/ZCl6PhLM/RLn+E/4pNAZ0b0TdL6jj+dWqI3xGtxwNUwa1fisaQSsr+aq
         g9TSvrtc4YLWFtl/4Nau4ijj6ueKNZU5IptpiL/vMkH1ydKLWwIbGY8Ix/OTWUOJGoEw
         YPY6vi4dZ26NUXjmTCYCOda0Svqqz4DquG+FTX4UeBUa2veNrjqyOMZlTuxO3aDqVYrm
         fSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808882; x=1795413682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=w3/JemiyGGVVKEyFOwOr90SifpOecUrVxMbJN+MAHDqCQrtkXaCbDD9fC2a7uy9V8I
         jxLaJEBmJidWHM/mUbAxtE8hmNCf/7EbfE1E5IJo07zIrnbasr8s+QEL8D4itshyhx9z
         d+G0MXSCka9Kv3TZQXlHQU2AdyyVyNwiQp7vibGAAMchCAv89zqoMTWNdXW2knlObype
         XcKWkS9q2c+KOZsOA4BW9aM1MZBFqsBMuNRavarlxhyVWHK9xsgDenIplPBk6NsofbXt
         wkrLANG910hscPEY4E0z0fB4G/WXKX87/Etfr+8g8Nf/pPpU1kkNqWu4aKW0LFsNwUz4
         fDdQ==
X-Forwarded-Encrypted: i=1; AL+hErHbvw6r4UMx1nfmR4zTQfZUwwYzpa7ap6TVzrZXfDgWv1yNJMXXrgYxEI+H4OyClxppH6+Dh+1gwkIHtkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w2EfyzjM2uQQtHJy00rn81RNzJuQIz9m6DK+zj5Ix8xs7hDRX
	Ii2C4cT8Z7Y3Q7TFPsVlfe8h3rgtvewAhTrDL8uqCTOnFGUnUhk49TmZ
X-Gm-Gg: AYBFou1BzCmYWla9VCrwzyxAdsvpdzkXOPoE9DUgFsajhC4cCrWDTIAn9xRLjy55X6R
	mo0giFyh51R40BgYuXyC4YF3JLUL14sv8/btcnYSbV+kW/hXqD117gqw78724eUdI30yjRhXyHW
	vMgeWCog+uPJcTwQat6d3gB+VpsrW6sXV2esdtLo1acyf1U7fa7Rz/EFgMH5ChWXAvpfoijiJ1r
	Rbr9pKC4WYSdjCWQJuLjISmJ5cxr4E+QxpgDMEAF6s/sfHUxlzbyDdVjd/nVbkDgCV868xFE5A0
	BQh+n6vgQFN0P/bS2QWcQFnutlfdYwXdiDff5azDtwvzLXa3hCjly9LhCMAbiASkCYU5A4yZjmn
	T+m/2/VXGxAXM3si/nujV6dRYY+ugAMrRg8kr1O7U5UM40QQ4YQC5H5IO0ERLW+CqR5kyIurWrA
	8zz7d4HUp4v+GTWQY9PnWaTb/FkeHkovlQHXyNph5RQyxSVXc6HrdAZ8YYebxGd0zoPUey6G1D+
	n8PNEdnxe60vfj7hU1pIe233uCBBrtSRh29j+5OKKIzC4hYM7iFPtMJBBXmdGYKQIsCJTxGCbzc
	vASos5+faLd3LGvzv4hkKBTzaeHye6rQGoQDHbTUZ68xUbF/tXVMUB4pRy5luyFkWUORbCjRuL+
	K7a6PmGvXVIfgQ4d9+mj39m+mLFvYTCbtyM2Hmr3DkRujkmn5JaoRqq47rOEddi2tsiQXITXWAf
	Hc0xSuUpgn8MPqMFacpMxFi/cgyKlERQTcrd7sjl84Tzk1UE+dNiGMLaMdS80cZqwLoYLCK8X6
X-Received: by 2002:a05:6830:2704:b0:85f:49ec:c96b with SMTP id 46e09a7af769-862898682e9mr8769881a34.16.1794808882430;
        Sun, 15 Nov 2026 22:01:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:45 -0700
Subject: [PATCH v6 4/7] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-4-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 040c12d07db2..1a53fbc951a9 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

