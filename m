Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595295;
	b=lWzzDglJ58qvtfOHELdREv0D7yLrFIDxGuI3vJHUqGhfNW7fLex16EGIcrh3elgK0fIE
	 dYMIMot4U3G+g9woP0UGVgx6a59GRRtQhYzeKTBODCUlWPP3cD7NRM7ydodfofUL6cAPw
	 sAAtfo7ocPFKuoEUbKnTBayP8cGnUNGwRVdd6rvUSeOpebRu7LclawPTL0ffS+1fNxgPT
	 z6FdoyHhn9XjoJDP+kjRhDU56nbr+bXqkU1+MridY4MmyFJpRSUbWthp5hpRlXHu3uETC
	 4WiJD8xDLXo2goG0RZtE6moAOiqTa3xpxxBuuiH0MRJbnsZkin+a8m5WZvZeIfcO6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NWFTTPgr6a+7/Xni+URiPpkEFmXv3aUFnA25E/9kZnA=;
	b=lqvQ7hyrZp3C3YY2FBO/sXu6aBSLE+hXwuD7GbLXNXn187Yr1+FY6saVVHapIx2miANL
	 xenZ2O+hvoujtS51zDjpCDhp+VgWYI3ZyOiOFYOJqMCVdRWjhIMHonA32VieIWIdBB3yf
	 o2P17fVUKvWzaeMlhRdTElqTWRp4KCjJC6i/3ctuLwrgOu0+nZqyNZbhd03EIbbvenEY5
	 HZ1we1y3OsTuX5s+aANDiBT+CcgSSKRQePkhaFUzZNp8OzkJ2XEISv8ybf5ThJxDlY9Ss
	 1vpwVvTRuJj2j5US8mkI1O4pgMflBP4leM0JUMKdmFRzqbWlsgTLzOxf/A9jeMkfQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="VRw9ap/L";
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D6606A332
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853D6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VRw9ap/L
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4ed6d69bdfaso439754b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595294; x=1793200094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWFTTPgr6a+7/Xni+URiPpkEFmXv3aUFnA25E/9kZnA=;
        b=VRw9ap/L2nzXSpfuVECaED5SiGKzFhRhiTN8tirM7SB1f0HWTYkpdgSAZPsJlITzBP
         s5TLr1myTR7vjGhRCcE7JrsVe4tZF0dOpUW8R0e9Aru3+qD7fNZsaj6G4A5Ne2e8Rv5+
         9D5qhSNtI5e5t8o1S8GmlkNuYZ+4S1SNUDSAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595294; x=1793200094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWFTTPgr6a+7/Xni+URiPpkEFmXv3aUFnA25E/9kZnA=;
        b=ctl47BgDjdj/FRRE7TsjEEO/XG7KiwIqYU+fI3DfFvz3nILCJPOPMENJnq9NEJicxC
         1N26PcNjZzZ37Pvlt0ESRCXawzBGFxlnyDObCDqISeDBIYpzEuWO9dtF7mfGx+dqvn1v
         5QhmIt0j5HK8Ukee8D7D3PGfH5naKkkEDtZl3sAzAMSxFZxbGAIR8Y5hgoWElESVXbSs
         X4yBVOL0XAafFHbE1I6HP1qV9Y9MO3RH1/bjcwILL9US1QbMXrJpccqIQe+PL3L2WmC/
         dk/ZGWred+xQPSdlavrh2YBIezhudNWKqITnt2/3ZJsZAow1zMYlgzurga9PHdY/ItJe
         ge8A==
X-Forwarded-Encrypted: i=1; AKwUvBxaqFBTeT/XmNHoO0/SzAwPGsjvWpCLty0OYaljnQr5voNhulPli2Xs0YbZzVmwDb4Gm8SnB5y1lCDSZto=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMq/NPC1YBtqA26BW90zCiOWsjIK3t7yGdlMv4rTZH+oAHWRmM
	Rx/Nyw8P+qfRs1j+MafRUAzu6yR6S/xbvGtpXGtmkiP9UOhtmEnvWl3hBHLT7urKyw==
X-Gm-Gg: AYBFou1d44CtaESwnLcg2G/FQT1BkjqdacX0HSgO6GGeRTr7a2ADwOC0meQd0xZ5JiA
	JMlcWlCrPvEKg0FyFNHkglbV12kG8cw71PPYJD+bzAgWOtnZQKSrW73Vp0ED7xfq4H55R1cqVP/
	mqeF0Q5YuxQUSsAvyHE3ltpDCLGDeJrVysMqKJC8chWjU74FemM3p4rQeCfyPRj8jxIc7TU4sz9
	593BMt9v179BNPlh/pbJVjO6lZHtioOx6Zf3wHIsuv47yHsFZbUttJOOLQ9zKwh8jsIgyYHOHkA
	qEhirFPyvUG0XHNYS5iYhg6i4M8T6o5W5+4poTpXkdS/RAev77VBEtPQxwUDPVbto3HVs1EiqYC
	U1/qsageoi+z3O0EAALYFLCishJCf+L0cKFrkPnIfgXfOJDm/PLp63sAZYBo72qFwF2YJsl3Lc2
	ryRR725iUNiTpJvQ3yYJRtN+PLQvzuWTJEtXeAX36FuqpQxHkTwkKOXxDFXptX4kZjeE3z8Mxxp
	iSiUcR2BBsZQY6GiLtIb+T3gZlcdsnzSRS0wKYEKtW5bte7EsGQRAIcYNwNXVt7H/4Cc1vwOoU+
	Kstz+Hcm66B2c7uf1vk8+iNM89w6BaH3MIXYk/TjebGj
X-Received: by 2002:a05:6808:1715:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-5535d4e12bemr1568864b6e.14.1792595294486;
        Wed, 21 Oct 2026 08:08:14 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:13 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	Suwan Kim <suwan.kim027@gmail.com>
Subject: [PATCH 4/6] usbip: vhci_hcd: clear URB_DMA_MAP_SG on all giveback paths
Date: Wed, 21 Oct 2026 09:06:59 -0600
Message-ID: <20261021150704.3129446-5-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
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

In vhci_send_cmd_submit(), URB_DMA_MAP_SG is set on urb->transfer_flags
when urb->num_sgs is non-zero so that setup_cmd_submit_pdu() packs
USBIP_URB_DMA_MAP_SG into the wire PDU, even though vhci_hcd never maps
the scatterlist with dma_map_sg().

Currently, only vhci_recv_ret_submit() clears URB_DMA_MAP_SG before
calling usb_hcd_giveback_urb(). If an URB with scatter-gather entries
is instead given back via vhci_recv_ret_unlink(),
vhci_cleanup_unlink_list(), vhci_cleanup_priv_list(), or
vhci_urb_dequeue(), __usb_hcd_giveback_urb() invokes
usb_hcd_unmap_urb_for_dma(), which sees URB_DMA_MAP_SG and calls
dma_unmap_sg() on an unmapped scatterlist.

Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
pickup_urb_and_free_priv() (covering vhci_recv_ret_submit(),
vhci_recv_ret_unlink(), and vhci_cleanup_unlink_list()), and also clear
URB_DMA_MAP_SG in vhci_urb_dequeue() and vhci_cleanup_priv_list() so all
URB giveback paths clear the flag.

Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 6 ++++++
 drivers/usb/usbip/vhci_rx.c  | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 78ea1fc7906e..522cbaa6eb0a 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -934,6 +934,9 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	 * CMD_UNLINK is needed.
 	 */
 	if (!vdev->ud.tcp_socket || !priv->submitted) {
+		if (urb->num_sgs)
+			urb->transfer_flags &= ~URB_DMA_MAP_SG;
+
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
@@ -1045,6 +1048,9 @@ static void vhci_cleanup_priv_list(struct vhci_device *vdev,
 		priv = list_first_entry(priv_list, struct vhci_priv, list);
 		urb = priv->urb;
 
+		if (urb->num_sgs)
+			urb->transfer_flags &= ~URB_DMA_MAP_SG;
+
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89837..7e69e4b1bace 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -42,6 +42,9 @@ struct urb *pickup_urb_and_free_priv(struct vhci_device *vdev, __u32 seqnum)
 				 seqnum, status);
 		}
 
+		if (urb->num_sgs)
+			urb->transfer_flags &= ~URB_DMA_MAP_SG;
+
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
@@ -95,9 +98,6 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	if (usbip_dbg_flag_vhci_rx)
 		usbip_dump_urb(urb);
 
-	if (urb->num_sgs)
-		urb->transfer_flags &= ~URB_DMA_MAP_SG;
-
 	usbip_dbg_vhci_rx("now giveback urb %u\n", pdu->base.seqnum);
 
 	spin_lock_irqsave(&vhci->lock, flags);
-- 
2.56.0.212.g129ede20d9-goog

