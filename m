Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10137C0FF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244995; cv=pass; b=NnvTcYt0wlNBSbkCeYHVq82fsaeKVAiGqRm4an25QidCkuqmieQ+z+E9VO7rgTrzKfjL6d6Ye8E1kubr5Rv04Fny/FCKDPZFVCUpGYq+2Pwp2Z8WQB7h0vhewu1TMcSaGVVj6fCvadKwSSkgsyP7hnk/NiCCW5+DDLgrWBBZHss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244995; c=relaxed/simple;
	bh=/ikQ1kfuLVYm8B4nlxAmsk7qhp2ROAhGxUVQKgrQezg=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBhcgXMWyVpoHKiywqFuZ0AexZrpdFItgQY38KbUNiK4RUvU7D5HsDHsnntB9e7+NjPmaxE9IwtEbx8wHiNBF+Q8pm0yOgUa/VBLMMfFmF0kQJwh9wLAiykGJRX4pG+XglibCLvIxcoMtRDDlJuDFFzNVmdIDjx8QO1cp2LaIBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=KGgTrb2x; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="KGgTrb2x"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e907853eso2108267e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789244990; cv=none;
        d=google.com; s=arc-20260327;
        b=DIqaec6G9e4JkqDYfh6g9fGcyRL0GLrvqxEki8nrIxW46YAJ781xBtkZlyvDuMiT+Q
         E0phvuAj1Lv0RkioKupy6CorvCO/1TtPvbvsDBbVCLA3J5SKuuUXIUeCmCHKQEkM+ebB
         CvN/qDYM6JhDcIzK/R5jD9lkKgdKg4lBXJQ+Got5T5eolhP1sbiG5Z4LTiO9TrvYUnWb
         bHR80xFxfDsQNxEp9VBUkpVV9/GB7/gkzySqNL7XT7RSjTHOTDA8Gy2N5Nxjp0RQmp11
         0OF9WGe6FK+aoEBxghzyLUw5P0E87M4A7xXbWQ6REhQCx3vSFG4CcChH4+8w7e+0KtaF
         gr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=mpGBWL5dTfQk5mc1h0ZVvwGMGlDDwNb+lFBx2tyur78=;
        fh=YAc17qq3cZXoh8gdA+SF/U4Sz4GgJ+OEGxqm5h5OpWc=;
        b=IWRiZBl8Qap1NZb86VuHK3Z7TiiyS53TKtl1Lg6xgfWFMl+BTJw20QKXz35eR9QDYn
         sLvrF/EmN5WL8jG4De31/mQ5vuwsHjgiP3/uo/0Vhf4duS36zsFlgs5s3zkZMeiHb6W3
         cJqYjBykZYME/fFQ4FNm5GUVrr06DQ9dAcR5jnrsLgAkjob7Xa7diWdxp/UqUmL3Y63g
         ZTutLGhyVA6ihisC82+4pxRKJL1ZwC3jZ3rxQWEm8aD25mqEydBFqj3l0fARtiISmMxu
         K5Uw3EZotGUV6Q2sT22MHmO52gpXkjhKULRIeZG3UTeA17i+X0X5njzL2h5QtApnamth
         tGSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789244990; x=1789849790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGBWL5dTfQk5mc1h0ZVvwGMGlDDwNb+lFBx2tyur78=;
        b=KGgTrb2x/73gOqhKweRBk73/sNMjaMiBA9capmyv14/lEvXdE1Ec5CcLTuY26ukVdm
         xrwsu/rnfekNPmd0XPr0ZJ3lkhmZwO7A6JNJag2AiHYZs3ZnsnZyqjcvzKdWfmgzAQ87
         1ax5XkKLhCGDCs8QvA5Kb8UKQgVj/hKZdHEFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789244990; x=1789849790;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGBWL5dTfQk5mc1h0ZVvwGMGlDDwNb+lFBx2tyur78=;
        b=r2onnF1X/XzHNqbyYhosM2+Ou7418BNMMxZ473BEgqwX5BMR35n2kpsC4PQwe/l3qC
         WSxSBHSKmHvpQhsChNPU2EVYznW7ABT3WG+Op3rVt7PVt/QxIp2O3QU86MpROEwGMb+x
         uZs8nxYtC5rQKbFm7NV0vjgHhMG1B/Upjja9q0GwY0qktlylkDz2gn5fubEoHYepALv6
         sAof1QDF4KzMVqN1ZQGw5odAlhOWgUgt22+M/1UvjTP66QpXAe/Ik4sYxSREDlLqxJpY
         1b7s0lSJu+6gUnj4scTllSZcBJ/sq4rBt3r3ojpdnV0STFHZKYE4914Zpuda4OQCkizH
         FUEw==
X-Forwarded-Encrypted: i=1; AKwUvBx1bSNz66bc2SSOETXORV1jmp8cXIcH7ZctaH/ZlqGTUEAHcYDxcKgiQsJyIHvWlYekHtHGATBeQZYUfhY=@vger.kernel.org
X-Gm-Message-State: AFuF++m46Ze9Tddxl2cvayakat1zjAe24FFX3ub/Xq7NCUIysOXBHg51
	iLp2p0T2Mib/SU/kl4BoOcJKE09uq8Q2LOopKfTJLO9RIwUjVIdRwKQ6Cmds9s/HbVJeivTLzB/
	vQ+KZG+fgWLFO6Xxuykp7e9XXoPcgjommGX45rsyvrg==
X-Gm-Gg: AYBFou352AWQC+QLlsk8YG2zs5xqYwk1D+I6NyGsDIXueybVfBki2GFPNNMFsHSLpbo
	OkW1iI65x1G79Ltv6lsmrlqxBCqJItJh4NsonoeHfKNJ4O9uSq+i+oxWjidLFX6aMwmf0w11FTG
	RfKc8VfOweV0Un7RnDj1yAkhmQGiuqnOJuY7xOL2f3EssvfPFV+yxASBoczZ9f0g2a4RFSskbst
	YnSm86gZ9KLP8J6+lB4+eGWshv3iRnSfM9OU1a7d5EjyYryXx1aKVJxE5PL/ueV9pxvWGx30sQb
	n4/2lfv8+uVHB+/uX/EhuF62KnLEdA9TqcD8AFF2iH4blt6IV6Y=
X-Received: by 2002:a05:6512:224e:b0:5b6:183d:2a72 with SMTP id
 2adb3069b0e04-5b8a029db1emr2087880e87.18.1789244990207; Sat, 12 Sep 2026
 13:29:50 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 16:29:49 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 15:28:18 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 16:20:12 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 12 Sep 2026 16:09:51 -0400
From: kimwooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com>
References: <CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com>
Date: Sat, 12 Sep 2026 16:29:49 -0400
X-Gm-Features: AcwNN1Ww8RECxvFUbnTVydmcsxe2gffbw6SmVBK6pP8Gb3uL_2aWnXSQENYPC-k
Message-ID: <CAH1Bc_wnBERR3YpFMon5+dcci846d9k42wb3bC7=LuN9ZV-FgQ@mail.gmail.com>
Subject: [PATCH wireless 2/4] wifi: rtl8xxxu: unwind incomplete receive startup
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

rtl8xxxu_start() allocates and submits RX URBs one at a time. If a later
allocation fails, earlier requests may already be active. After a
successful submission, that allocation failure can also leave ret set
to zero. The error path then frees TX resources and disables RX filters
without draining the earlier RX requests, yet reports startup success.

Separate pool allocation from submission so an allocation failure can be
handled before any RX request is active. Introduce rtl8xxxu_alloc_rx_urbs()
to allocate all 32 wrappers, then rtl8xxxu_start_rx() to submit the
completed pool. Return ENOMEM for every RX or TX URB pool allocation
failure so a partial allocation is reported as an error.

Once submission begins, keep ENOMEM/EAGAIN failures queued for retry.
For other submission errors, rtl8xxxu_start_rx() frees the unsubmitted
requests and returns the error. Since earlier submissions may already be
active at that point, route the outer start failure through the existing
rtl8xxxu_stop() path. This drains queued work and active requests and
cleans up RF state and TX resources together. Interrupt URB submission
failure uses the same cleanup path.

Fixes: 26f1fad29ad9 ("New driver: rtl8xxxu (mac80211)")
Assisted-by: GPT-6 Astra
Signed-off-by: kimwooseok <5mghybrid@khu.ac.kr>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 99 ++++++++++++++------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c
b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 795a5ec2f8cd4..1932a9ec1970c 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -58,6 +58,7 @@ MODULE_PARM_DESC(dma_agg_pages, "Set DMA aggregation
pages (range 1-127, 0 to di
 #define RTL8XXXU_TX_URB_LOW_WATER	25
 #define RTL8XXXU_TX_URB_HIGH_WATER	32

+static void rtl8xxxu_stop(struct ieee80211_hw *hw, bool suspend);
 static int rtl8xxxu_submit_rx_urb(struct rtl8xxxu_priv *priv,
 				  struct rtl8xxxu_rx_urb *rx_urb);

@@ -5832,6 +5833,27 @@ static void rtl8xxxu_free_rx_resources(struct
rtl8xxxu_priv *priv)
 	spin_unlock_irqrestore(&priv->rx_urb_lock, flags);
 }

+static int rtl8xxxu_alloc_rx_urbs(struct rtl8xxxu_priv *priv)
+{
+	struct rtl8xxxu_rx_urb *rx_urb;
+	int i;
+
+	/* No RX work is active until the complete pool has been allocated. */
+	for (i = 0; i < RTL8XXXU_RX_URBS; i++) {
+		rx_urb = kmalloc_obj(struct rtl8xxxu_rx_urb);
+		if (!rx_urb)
+			return -ENOMEM;
+
+		usb_init_urb(&rx_urb->urb);
+		INIT_LIST_HEAD(&rx_urb->list);
+		rx_urb->hw = priv->hw;
+		list_add_tail(&rx_urb->list, &priv->rx_urb_pending_list);
+		priv->rx_urb_pending_count++;
+	}
+
+	return 0;
+}
+
 static void rtl8xxxu_queue_rx_urb(struct rtl8xxxu_priv *priv,
 				  struct rtl8xxxu_rx_urb *rx_urb)
 {
@@ -5900,6 +5922,44 @@ static void rtl8xxxu_rx_urb_work(struct
work_struct *work)
 	}
 }

+static int rtl8xxxu_start_rx(struct rtl8xxxu_priv *priv)
+{
+	struct rtl8xxxu_rx_urb *rx_urb, *tmp;
+	unsigned long flags;
+	LIST_HEAD(local);
+	int ret;
+
+	spin_lock_irqsave(&priv->rx_urb_lock, flags);
+	list_splice_init(&priv->rx_urb_pending_list, &local);
+	priv->rx_urb_pending_count = 0;
+	spin_unlock_irqrestore(&priv->rx_urb_lock, flags);
+
+	list_for_each_entry_safe(rx_urb, tmp, &local, list) {
+		list_del_init(&rx_urb->list);
+		ret = rtl8xxxu_submit_rx_urb(priv, rx_urb);
+		switch (ret) {
+		case 0:
+			break;
+		case -ENOMEM:
+		case -EAGAIN:
+			rtl8xxxu_queue_rx_urb(priv, rx_urb);
+			break;
+		default:
+			usb_free_urb(&rx_urb->urb);
+			goto free_remaining;
+		}
+	}
+
+	return 0;
+
+free_remaining:
+	list_for_each_entry_safe(rx_urb, tmp, &local, list) {
+		list_del(&rx_urb->list);
+		usb_free_urb(&rx_urb->urb);
+	}
+	return ret;
+}
+
 /*
  * The RTL8723BU/RTL8192EU vendor driver use coexistence table type
  * 0-7 to represent writing different combinations of register values
@@ -7408,7 +7468,6 @@ static void rtl8xxxu_watchdog_callback(struct
work_struct *work)
 static int rtl8xxxu_start(struct ieee80211_hw *hw)
 {
 	struct rtl8xxxu_priv *priv = hw->priv;
-	struct rtl8xxxu_rx_urb *rx_urb;
 	struct rtl8xxxu_tx_urb *tx_urb;
 	unsigned long flags;
 	int ret, i;
@@ -7423,14 +7482,13 @@ static int rtl8xxxu_start(struct ieee80211_hw *hw)
 	if (priv->usb_interrupts) {
 		ret = rtl8xxxu_submit_int_urb(hw);
 		if (ret)
-			goto exit;
+			goto error_out;
 	}

 	for (i = 0; i < RTL8XXXU_TX_URBS; i++) {
 		tx_urb = kmalloc_obj(struct rtl8xxxu_tx_urb);
 		if (!tx_urb) {
-			if (!i)
-				ret = -ENOMEM;
+			ret = -ENOMEM;

 			goto error_out;
 		}
@@ -7441,31 +7499,21 @@ static int rtl8xxxu_start(struct ieee80211_hw *hw)
 		priv->tx_urb_free_count++;
 	}

+	ret = rtl8xxxu_alloc_rx_urbs(priv);
+	if (ret)
+		goto error_out;
+
 	priv->tx_stopped = false;

 	spin_lock_irqsave(&priv->rx_urb_lock, flags);
 	priv->shutdown = false;
 	spin_unlock_irqrestore(&priv->rx_urb_lock, flags);

-	for (i = 0; i < RTL8XXXU_RX_URBS; i++) {
-		rx_urb = kmalloc_obj(struct rtl8xxxu_rx_urb);
-		if (!rx_urb) {
-			if (!i)
-				ret = -ENOMEM;
-
-			goto error_out;
-		}
-		usb_init_urb(&rx_urb->urb);
-		INIT_LIST_HEAD(&rx_urb->list);
-		rx_urb->hw = hw;
-
-		ret = rtl8xxxu_submit_rx_urb(priv, rx_urb);
-		if (ret)
-			rtl8xxxu_queue_rx_urb(priv, rx_urb);
-	}
+	ret = rtl8xxxu_start_rx(priv);
+	if (ret)
+		goto error_out;

 	schedule_delayed_work(&priv->ra_watchdog, 2 * HZ);
-exit:
 	/*
 	 * Accept all data and mgmt frames
 	 */
@@ -7478,13 +7526,7 @@ exit:
 	return ret;

 error_out:
-	rtl8xxxu_free_tx_resources(priv);
-	/*
-	 * Disable all data and mgmt frames
-	 */
-	rtl8xxxu_write16(priv, REG_RXFLTMAP2, 0x0000);
-	rtl8xxxu_write16(priv, REG_RXFLTMAP0, 0x0000);
-
+	rtl8xxxu_stop(hw, false);
 	return ret;
 }

@@ -7820,6 +7862,7 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	spin_lock_init(&priv->tx_urb_lock);
 	INIT_LIST_HEAD(&priv->rx_urb_pending_list);
 	spin_lock_init(&priv->rx_urb_lock);
+	priv->shutdown = true;
 	INIT_WORK(&priv->rx_urb_wq, rtl8xxxu_rx_urb_work);
 	INIT_DELAYED_WORK(&priv->ra_watchdog, rtl8xxxu_watchdog_callback);
 	INIT_DELAYED_WORK(&priv->update_beacon_work,
rtl8xxxu_update_beacon_work_callback);
-- 
2.48.1
