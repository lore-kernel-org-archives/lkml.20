Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60D37C0FF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789244980; cv=pass; b=aeUDgO+jZwQ9buv42KcjsTgyiqZSxtcGKZu0mf+DHzt2TwZsFiIuRHpWwzfZtTTSsyNjGapxKjMebzJ3mmonnG9NIFI5r0Jnbm10JDx73eQmt2fL1c81KMMxv08hXDPxaUePjfX8PgeZeBbw5tQFPVPxx1KuQgM+6aYe5XHYHrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789244980; c=relaxed/simple;
	bh=3Z+rnR6y8+XrskA3hVov6v6LoLFko/3oEz6RpE1l2sc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNoBkpVusWUrtB3lP28iuNEl9dC14p4f9UjqvXr2lLzwACOItEGYTZOFl1y+WRzbxicohVPllbhR6g6BwlO9dhoJTqtiZl+P2R+ABb6Q57rQCC86EI1FaApIxpSMPMIVzeVhQ3+eG0YezAebDDDnnZ/6o51X/kNUXXQsA3erBf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=HCKv/l/h; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="HCKv/l/h"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso754608e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789244976; cv=none;
        d=google.com; s=arc-20260327;
        b=rdYZobpfO7UWU3e2N4Hq8xHNFu1r0JQTOUryB5F6ENLuy5Dgx310RlroKFIaGaJquH
         EzypKo16AiI0H3w5RoYg0D0qCXzRx7o9zCpVIUPjQNx26SI07Y2nM+rBiHMjSMg3JRf0
         YEB6+H5HsA2u2Nazc6LJiKaCGNMNkYxjrAz8VDXxINJv4NDgpz1CslzVd2KQq3f0ujbH
         jnbNALU3YI8FilFnSi8KLYFcYaBmiafUcU34e3H1+Vn73yk+SRjJDLT5xZXCGeRJCeHC
         SpIfqPRdYf8mZBriAIPzuMFSwGt6XbIDysQJUATmO+8+aK2jxKCArxlvaM1N+djH+uhr
         CNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=RLAp5n84PhWI7Xy3vjJ/UrGvAVQA5MGrxcUoi3gqi6M=;
        fh=p0TJfVnDwACqMYEnuCGHZfGGECB3n0BR1bRrF1Fvs7A=;
        b=Kajrvn6u1gpK8rNkx626hycsiuvTajYL2Vrvr1KzhFj0mx424aRQ4ANagDNi87I11q
         d1u9WrrUg5Itaou6w9ufTC6UAUbkIjmmtmYGwdgJ6pkph/KO9uFr5fyeGE8A29WoZdmf
         7SwKlnHZFRdUnIf8BT70CUidSUSiLqTZ4Kzf+VP5TCPJlapcwUf4Jr0GtsR5n86pPIkC
         M+xmt5S38j/1nJ9/3tr8oUFbwoD2ic2Ss6w459RMCafQA4vyYQYREWZtqbjnD70dvyDU
         rfqzc+utjcLYhysmQUoIXmZmdr5qTIhKZHAI/LRFC+xmKRhLKmVEGlBPjdfF0ixTJ/Un
         /9mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789244976; x=1789849776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLAp5n84PhWI7Xy3vjJ/UrGvAVQA5MGrxcUoi3gqi6M=;
        b=HCKv/l/hkCjQzfrjvoD+DjKKduw/oClZ0SeZ7+jb4B5bSTkRxrwsKg+sFyHZjbduWE
         GO0GEVroFAtBmLJZemKgMUqd/5uyxZhWv3s+qR0BCNTzeFoyd9qoRx6FoWmGiaIJhCy2
         /VDY4K0M0rtmhW6ME/BZ+EC7tbetD+sFj7DPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789244976; x=1789849776;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLAp5n84PhWI7Xy3vjJ/UrGvAVQA5MGrxcUoi3gqi6M=;
        b=bUFYn9Nsrr3IymCKezw0Z/Y2EyyFuTE8atp76atItqx1caa/UULFx+X4RztAOr+AAM
         IAY3SSzAHO7kENzz2S/sQAKxwV5zRE88k9Qh8ZjCyfVF+IekXmKBoQi6rTLUrvNpiwAb
         P2Km2KKMgneEHzOCTsfLEk3uU2+Iy2PojGrmL7KN9PEBVFQfeX5oytB1hEk/adSdTktF
         mzWT573oo/EcalsDmG5YiI/wTbIDjXgm9YvqdZl4qoAzTikkVcyfEIp0YpsjZKGBEMKD
         v+URp+NHwztoduhgGwr0Vl4eCCecRqIW0hfpf47li5WIgYQRuetsVPJx4SIS42QzrNCB
         PqAg==
X-Forwarded-Encrypted: i=1; AKwUvBwQbfpB50IeRkfHzyc6raVYjlUq1vTQQM7L6C58OVTvXO5w5K8mMXCaLW1gEMzE34p8V4JNnMQuRBP0Rac=@vger.kernel.org
X-Gm-Message-State: AFuF++njZRS7yWtc53qwTsSPh//7uqrgarSaBiOVAtqFuj18ymSasv88
	qVkc/mLhgIrD5H5N3b58+4+9Uhdlt+31TdsGfZns8FcsRtWXBTtzg2KCkGLbavru0UPTiT0MJ9x
	1IneJxy6Mm+g1AXz3cSdMbF1Nzxp9S2oMuuCYQ8pNqsAvCxt3os8m
X-Gm-Gg: AYBFou3tIAGBn8M9dOpJ5NX4gUlIn8Yf5ILLS6hq1OmS1s3lZGq3m/Nfx04pdJrtB3S
	1NayRLvsossVqJ2feYE+dW+zf5ySAimPorROcjTKXgLIowOofxLbK+YscRUt181+0++Qfc6t7x4
	6awAIFvyPWMWMX78Q+z0noFzKAHDZi6YopfSHW6QJ40e0AGt+dALN+tebunQW+LPeKL2txIlQn1
	EpNy7TmJPSYNvRS8QRwjVlzpiq0viS3d55ysQsmVcqKih1CctBV3S0B1sbsVlOSj+Ila75WRWSZ
	9TVEsbZouaWLgyVlpWmm/amAcUNvmUlabCK/bBvACjDjQHj699I=
X-Received: by 2002:a05:6512:31c7:b0:5b6:186e:b79d with SMTP id
 2adb3069b0e04-5b8a8efb04amr723267e87.57.1789244976231; Sat, 12 Sep 2026
 13:29:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 16:29:35 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 16:28:14 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 12 Sep 2026 16:20:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 12 Sep 2026 16:09:50 -0400
From: kimwooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com>
References: <CAH1Bc_wBUmmNyzF3c2H1aFBRBbAPSw0hR=1MnPOAcCXypVL_Dg@mail.gmail.com>
Date: Sat, 12 Sep 2026 16:29:35 -0400
X-Gm-Features: AcwNN1XLCOa6gaClJgemEvFiJiVPSixm8S5rZ4-E3hZh2AQgrnsujY7tPXvHltk
Message-ID: <CAH1Bc_xSxOrEUjx11NtTE9Y6WVitF8K0mVws8s3623C8O=Lpkw@mail.gmail.com>
Subject: [PATCH wireless 1/4] wifi: rtl8xxxu: free RX skb when URB submission fails
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A failed RX URB submission can leak the skb allocated for that attempt.
rtl8xxxu_submit_rx_urb() allocates the buffer and stores it in urb.context,
but if usb_submit_urb() fails, it only unanchors the URB. The RX worker
queues ENOMEM/EAGAIN failures for retry with that buffer still attached.

On the next attempt, rtl8xxxu_submit_rx_urb() allocates another skb and
overwrites urb.context, losing the reference to the previous buffer.
Stopping before the retry also leaks the buffer because pending-request
cleanup frees only the URB.

Fix the leak at the submission failure by making rtl8xxxu_submit_rx_urb()
responsible for both allocating the skb and releasing it when submission
fails. Free the newly allocated skb and clear urb.context before returning
the error, so neither retry nor stop receives a pending URB that still
owns a buffer. Remove the caller-side skb cleanup from start and the RX
worker; those callers now handle only whether to retry or release the URB.

Fixes: 26f1fad29ad9 ("New driver: rtl8xxxu (mac80211)")
Assisted-by: GPT-6 Astra
Signed-off-by: kimwooseok <5mghybrid@khu.ac.kr>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c
b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index bddbd0990de72..795a5ec2f8cd4 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5864,7 +5864,6 @@ static void rtl8xxxu_rx_urb_work(struct work_struct *work)
 	struct rtl8xxxu_priv *priv;
 	struct rtl8xxxu_rx_urb *rx_urb, *tmp;
 	struct list_head local;
-	struct sk_buff *skb;
 	unsigned long flags;
 	int ret;

@@ -5896,8 +5895,6 @@ static void rtl8xxxu_rx_urb_work(struct work_struct *work)
 		default:
 			dev_warn(&priv->udev->dev,
 				 "failed to requeue urb with error %i\n", ret);
-			skb = (struct sk_buff *)rx_urb->urb.context;
-			dev_kfree_skb(skb);
 			usb_free_urb(&rx_urb->urb);
 		}
 	}
@@ -6596,8 +6593,11 @@ static int rtl8xxxu_submit_rx_urb(struct
rtl8xxxu_priv *priv,
 			  skb_size, rtl8xxxu_rx_complete, skb);
 	usb_anchor_urb(&rx_urb->urb, &priv->rx_anchor);
 	ret = usb_submit_urb(&rx_urb->urb, GFP_ATOMIC);
-	if (ret)
+	if (ret) {
 		usb_unanchor_urb(&rx_urb->urb);
+		dev_kfree_skb(skb);
+		rx_urb->urb.context = NULL;
+	}
 	return ret;
 }

@@ -7410,7 +7410,6 @@ static int rtl8xxxu_start(struct ieee80211_hw *hw)
 	struct rtl8xxxu_priv *priv = hw->priv;
 	struct rtl8xxxu_rx_urb *rx_urb;
 	struct rtl8xxxu_tx_urb *tx_urb;
-	struct sk_buff *skb;
 	unsigned long flags;
 	int ret, i;

@@ -7461,13 +7460,8 @@ static int rtl8xxxu_start(struct ieee80211_hw *hw)
 		rx_urb->hw = hw;

 		ret = rtl8xxxu_submit_rx_urb(priv, rx_urb);
-		if (ret) {
-			if (ret != -ENOMEM) {
-				skb = (struct sk_buff *)rx_urb->urb.context;
-				dev_kfree_skb(skb);
-			}
+		if (ret)
 			rtl8xxxu_queue_rx_urb(priv, rx_urb);
-		}
 	}

 	schedule_delayed_work(&priv->ra_watchdog, 2 * HZ);
-- 
2.48.1
