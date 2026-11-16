Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808885;
	b=W8PfdgQ5Li0NvPcBzVvFdbVw0qD93HxSQWY3nyjzg/jSF4aP6R5YmNwlQ7YAFzmqvRPz
	 8PGoopai1f10IugoSAnw4XBw1KPp5lSWKPMe5TM7+7tDFaIRN04A8pWerZJPS6fU5YdVf
	 nLZoygr17XVhJbsfGgeYIOkrisAOec1pHrt4dj+gnex2UlH1q/cc/jQzG8/QB5c315cDF
	 07GJs10Q0qw0kGBTXM7kWqUVJ6Z//nmaigzftDPrY5jbQWOZu5gp2DUDLq/hxvBE4kPit
	 Rc7oEbY/EknzzPeeCYypxiQc4yv/Zmct+Fh9XIufgiEHaxMrJYjzEJvGcP0AMtHTQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
	b=ctTSgeO3MkCJgTfTchji8EYO7i8K3imu64/6qh/Jb1vHwRRB/Eedh8H2YaGicpH5dXgd
	 ZXuJj1mZ0lJcsEQf6T5TinakHhPBIBdm/mk0QKou5p4S53eEv7eNV1dgFGrHUX6BElqyv
	 kUHlHc4fQuJWIDkGEopn5TVcFN77TY4iw989Qju4bojmJS9Lgr+9+2zN4LG/12CQkjePJ
	 KdrzPe8qN1SIgg8O8HTABLqymP3WdfbNh7OF+iE8oq+uuv7/Y2kR+eZNtWFCaHny0m9rd
	 5SNis1LChjBHC6n8+DtDAQx/taUR9dUmWK5YB+aO1YTrmBaoYyy+1r75rPVp92hRIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6XvqaeA;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9C606A88F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF9C606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6XvqaeA
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-862b9c2e78aso498571a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808884; x=1795413684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=y6XvqaeAgMOxYv0v8BB7+Wu+UQNZFH/xHAgJzY6HQs5trUXn9HrQwoV6hmuyfNtHJX
         7SEKNSqCmxYdkuBRDBVVf/m2o0Qg3wCBHg2OLno3G76gF5Gidwichtd7mT7hur7dVMXc
         KsIH3mzgVeH2G+St3L+FgaDAjz7g7OPFSQoHfuawetr8ORMR7rLv7rfQE0FVo0ZiOtFX
         2fiK5ks4kztI9dPuyd0Mx1kPRsdV/mBi8CyygzmWhPIyzsbn63wHyvdwR6UP6ohWIS+y
         tafeS5MukjdHDPJJh3qMikD28yi5kQUWA2Hisc7/PdRDXsKIwG6OGkINMRIcmGM422UM
         KdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808884; x=1795413684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=NQaHISUKXQ9uO7SXoLQG3Jced8GbcaQmYF8N60G3I0fABxZ6WJEpd9XV6v/ZrvN4nu
         dRf71XEB5jY5OZ2xt1dcJv5VLHugPnWnMc2fVkTD2NRFD66B1BofUVyFMjf02RozbtUp
         8v01yXOtcXsq6nn3ixXRJB6rkHWbQO9ZdXnieHBsBQcnpTtEB4iEx4z5ZjPYr/x0AKwj
         ieKzglq0cVGnNidMihRrV2dMGqGwbDzrnTS8tfoSsFxK01UOUS+yRq/gJbMgidq5GiRS
         ZWWD15zSNDsC29F0P13Nhmc+v86iT12g4z/HI6SmX+rqdGsWALwaeg5XvIf8TalpKg/j
         8B6g==
X-Forwarded-Encrypted: i=1; AL+hErG0On1AKefhVrIGzxrF5x4JXJkRoQyUymHwF+U0t68xrPZRZRVQ11lJ/pG08TJcFn7oa0RzU9GG1evofg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rexvS+QRXBHgmXLCmSJ+PWKMybDYMvs7X2qUNA1lWfbe6rI04
	1sYN+yZnIjNjvB6S39JXHq+YKQJ6pKjq270SJVa3xn4fT06LXyeb6En5
X-Gm-Gg: AYBFou0kRPmmy8vaaKTUh5k/Bq0VPMk9zCVbyyeLTnjGt52kvz+UvmqJ6bcyBkFOAOz
	CcK4+0BuRlQ4DCvHvH46sCYgpPttixGvdxS8a8K2qyNEirT0MVonxGUFjJgvbuL+o7u3c8IwQrG
	9cx01QNBCt7v1HoNZ2p5Tpqr7PBnOgIIP5qqCQaxb9/vVzhyeALwjuJOBS6bGCY44jNNgfH1VKG
	ftCHbwjZwRbqlJ689Bl44Qh102rMjZs8cHTpWYWgFMh9BQAmvWpdxvK+M12R3Jj4Ubnpcvujvbh
	kGo/F397xNkhDCXBV7R5gJzD3cJlOCQvgOsKsnzy98GvbNyGOLKxRi1T39rksfZQ+zgrzn2Y/Yg
	KZ5Pr3Dqs7ZdeYchk2dXrbIFepVQyHAOVjFfjVfMuiUIzSdxLPBpbr7TdHVs1BSIAfbW3YJoN0q
	Tj/LHj57nvkZ1HTdV06SDo2sXBVLLnQ2sWCvE4I0YO3Ss4NeFWKU0NYhp0qfJ22Um02NMRH0OLf
	bNjdFkf8qhemfd4/uVBUuxifUP4P+03pigh0Ae3TJjZgGgnMG9vjyuF8piwE3ry3FXQl86UrHDn
	mxlMZESUhDZ/ign7csh8yjYf0Pgva+y18AO1MfzJDQLmmWLUbDQep+Bghhsynbk943q4T9bik+2
	cV/Y4sE8CG90Hg0rU3n+kMspGTw7L2cYNofaBvshTGgW2ag7Sqok9kPspLvGADEW446LFFDrAJC
	G+tbqRu62R99MjMxB+dyd09JjYhsI1E5/wdQM+B69k+MAECyfmShM=
X-Received: by 2002:a05:6830:2b29:b0:834:b015:ae9e with SMTP id 46e09a7af769-86289859955mr8776089a34.12.1794808884380;
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:47 -0700
Subject: [PATCH v6 6/7] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-6-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index cd9a5b45d295..97098367535f 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1203,7 +1203,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	unsigned long flags;
 	bool enabled;
 	int ret;
-	LIST_HEAD(head);
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
@@ -1224,7 +1223,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+	vchan_terminate_all(&chan->vc);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 	chan->desc = NULL;
@@ -1233,8 +1232,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	chan->cyclic_restart = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

