Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595291;
	b=ZLnUGROAcRue4qBa08CGYt9carVKTjBM3cTPD5rypxDR93jf/6Z8/UrNQRRWqLw/kOU0
	 M2XBPfJMawaxYW3d1U3v4k5GGp9QgMfM9ICeNbEyBHmFd2CvLbtDm5BKXsT09SgeruF+D
	 3R/8++eZ7FJCI7OQe0V1vW6L9LwrQdjrQhkHqgiZbcUYy7xNNuolIoajifDHpvxwv3F8K
	 xvv/UWcFOD1o6sggrn927cIENIezPtLGNZjAYifLmZcyp/Fq+AVVzWVskYurjtHbIf+fW
	 6TkJqiIIysVRXKmyaQO1/u3MEl9GF3I7QkBClotoopQKYsT7DJbLcnEtvc8NSF+xqzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
	b=jNAeQxE1gbQ2BwiUkLiLJFD6TzWf02YHzgtzixqgQCfJvaPQxUSQtiTckKKjjwPqgbKV
	 rxsv3qRZwM+C2fW9KinugJVaQCgLHWtakoJgPz8MFFetqDO5yA9TglLFamZzH1GaHGcdj
	 7d5XsOSd1d49z3O4y9PAGQydEBSz2acoFqY5pQhD4Nc3s/4YOhxjXiaq4lcgm9HUwLdvX
	 PsJLmsuVEj1/pOfFnmvXx4jhTq2ob5WsjrG+QVDKpS7exDDqIK662TUrVEZZKQPen8LQj
	 pExU4VfD8RKE+uL/ClPvy6C4JBXsYEZf4utaM7UMEgVK8rOpxpefEH9Uc9lcrQnxMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OL5xFrtM;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC70606A338
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC70606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OL5xFrtM
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a76f63b243so1637612fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595290; x=1793200090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
        b=OL5xFrtMjErJRdSKQEUBMY60T4dNxi1k0X6hw3RVvRjMS9VQlsTv383JOK/OSFND39
         e28RtA+s9BYZdiFdelXqqP1mTMVsqyg6ddIO4dNMw1T66yImgMoEJuoHGfe6tTPMIxlM
         LIS0jEgdk34C5pCKZA0eOmIL7viX9PvCYeWaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595290; x=1793200090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
        b=C52YzicUB7J89cktCdQFDo91wrxAHCpIRcCvm794cqEBykZMO6c4vnF+b+f4z6Y/7a
         TLpY4ck3g6LxCKEQZUSbPb+jzkBtjj4bHT4nP5Sz49+lsW8kOUBO2Vx/mmnv9PvQU/Ez
         Pk+80GnHNkVJaXjKq1xgCG7deoejeI22SleiSo1W0x37yr6XV4vfvKe3W/KElssvwu4T
         O8GBrfFhqiCaOTbqYzJShlZapFdX5W/1bPvhFO3tPuUFkmSeurHuWoel4aaIDSzx8X1r
         B8vTy1gdqb7Nbo/5uxvy02Z2FVY2WaK3jEsVcC8vuREmgG02h5AFozG5qJa4XMxA9iXA
         3KmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvSDZdBV8YCvfvedQ9elqmQnMNknPFb8jIiJF/JMwQWIx2YbCBwqEkUbTh97Wq4NthLpuYF2JiTlhnGb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn39GReBfaLjkt6hBkgvqSH63CvmjrSehnwT0C7/nOirXcm99e
	bUohY+1YK9l1SKjt6Qv4sWFkc2uDTxPlmlwcOrNUAKQVRp3SII+Aj8sMKX0TZhOPEg==
X-Gm-Gg: AYBFou1lu7WhmZQdL4iVIYvVojBNicOCDxJfvtOpaws29PzjCaoPgN2dWC2TknYLqXQ
	zdyKzYr49ssswhRwQ2aKS+/g9sV75uOMVWlawm+v32T3UuHfdeuBNT6Eh+xKD4O1pVwMmi1kg8p
	3BHffRoFxLjYRBlGPKKk3hv+tBZ0Vd87DhmSc/fGCXV7aGgjYttM+XhH2my+BvbGoTjHzcr2lOW
	6D7nknNgnI0YxweRftlD1r//K8z0onIcpM6FaOvWysk0Zf52yrzGwMSHVaS25plne6EbwD1TKel
	3mc5YdybGM8zvEWzaHtVmypnQD1BjgV4xbM1yhzgTDSJWJJ8n7ThuMu5Q2oKY1m+G/xdUOcwVcl
	lJntVy+sNdB/VFwYfaF6zIg3f6rXL4GiRrzv8fPIttiAv6l+BEQwV2D/hDvq5k0imhsNGhQbWwH
	HdZIGoiAlaYbL67uqRxi9Z2H7ePIHbhrYTsVd00sXhk+vygV6WBCs3D/IGVMgvgXart6syMESXk
	iPlQothGdmSgwcEW1+J3TpeNmPe8sXTFqSzq6qDifomHT46n/pK3o2QTnCmX/5tAqHoE0wX/RzZ
	TMsYpitdnttpNcA2Lb2tKxk7QXvxla1xBtocR7M3/3eU
X-Received: by 2002:a05:6808:1a07:b0:4c2:a312:f0ad with SMTP id 5614622812f47-55353a9aef2mr1312261b6e.8.1792595290146;
        Wed, 21 Oct 2026 08:08:10 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:08 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	"Brian G. Merrell" <bgmerrell@novell.com>
Subject: [PATCH 1/6] usbip: vhci_hcd: protect urb->hcpriv with priv_lock in vhci_urb_dequeue()
Date: Wed, 21 Oct 2026 09:06:56 -0600
Message-ID: <20261021150704.3129446-2-rrangel@chromium.org>
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

In vhci_urb_dequeue(), urb->hcpriv is read and priv->vdev is
dereferenced while holding only vhci->lock, before acquiring
vdev->priv_lock. However, pickup_urb_and_free_priv() in vhci_rx.c frees
priv and clears urb->hcpriv under vdev->priv_lock without holding
vhci->lock.

If vhci_urb_dequeue() races with pickup_urb_and_free_priv() on a
completing URB, vhci_urb_dequeue() can observe a non-NULL priv pointer
just before pickup_urb_and_free_priv() frees it, leading to a
use-after-free when dereferencing priv->vdev or priv->seqnum, or a
double-free of priv.

Resolve the race by deriving vdev from urb->dev->portnum (matching
vhci_urb_enqueue(), and guarding against portnum == 0 in both) and
acquiring vdev->priv_lock (nested inside vhci->lock) before reading
urb->hcpriv.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..3196ea80e7c2 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -704,7 +704,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	struct vhci_device *vdev;
 	unsigned long flags;
 
-	if (portnum > VHCI_HC_PORTS) {
+	if (!portnum || portnum > VHCI_HC_PORTS) {
 		dev_err(hcd_dev(hcd), "invalid port number %d\n", portnum);
 		return -ENODEV;
 	}
@@ -899,34 +899,35 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	struct vhci_priv *priv;
 	struct vhci_device *vdev;
 	unsigned long flags;
+	u8 portnum = urb->dev->portnum;
+	int ret;
+
+	if (!portnum || portnum > VHCI_HC_PORTS)
+		return -ENODEV;
+	vdev = &vhci_hcd->vdev[portnum - 1];
 
 	spin_lock_irqsave(&vhci->lock, flags);
+	spin_lock(&vdev->priv_lock);
 
 	priv = urb->hcpriv;
 	if (!priv) {
 		/* URB was never linked! or will be soon given back by
 		 * vhci_rx. */
+		spin_unlock(&vdev->priv_lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
 		return -EIDRM;
 	}
 
-	{
-		int ret = 0;
-
-		ret = usb_hcd_check_unlink_urb(hcd, urb, status);
-		if (ret) {
-			spin_unlock_irqrestore(&vhci->lock, flags);
-			return ret;
-		}
+	ret = usb_hcd_check_unlink_urb(hcd, urb, status);
+	if (ret) {
+		spin_unlock(&vdev->priv_lock);
+		spin_unlock_irqrestore(&vhci->lock, flags);
+		return ret;
 	}
 
 	 /* send unlink request here? */
-	vdev = priv->vdev;
-
 	if (!vdev->ud.tcp_socket) {
 		/* tcp connection is closed */
-		spin_lock(&vdev->priv_lock);
-
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
@@ -948,8 +949,6 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* tcp connection is alive */
 		struct vhci_unlink *unlink;
 
-		spin_lock(&vdev->priv_lock);
-
 		/* setup CMD_UNLINK pdu */
 		unlink = kzalloc_obj(struct vhci_unlink, GFP_ATOMIC);
 		if (!unlink) {
-- 
2.56.0.212.g129ede20d9-goog

