Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF7381EAD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789946227; cv=none; b=Y32MjHAhacdaT72POhkb2q5fYtLdusuvqwbuQOpPZi1jy8Yhb/N9KYf9lltkg/HUuNF+auDMGJ5o6dYZplX58I/ny6/qLyccOdZgwmZYNk2hmprp8l8w2V9bmR99GObFnqOl2s7rtiuTbURHbns4CHfS9vUeXIwba6XK+LSY/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789946227; c=relaxed/simple;
	bh=HjQtqfvG/2IzJgW73uRZCzU+jKlJIucXQNYpvz8AbKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gN2zZaUQ6Ca6WpQzcJ7awRw/6crUIQPikfxhzyt2TFKsmrEu8//hk6NTJng110kJCijDtdQ+tMVK82xWRTK9IfrHtbVzjl+SMj9jzeyE2x4f7wfhEQJnLLhASrD3fTSErE7aeUOkxrcsP80ytp7/VXQ2JgJrq3bChJwh/UwLNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHLf5U/0; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHLf5U/0"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so3447855b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789946225; x=1790551025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ6Y/AxXGrJfl5sj56UZBjmnGLvXYG7/FDw1r/y+iCQ=;
        b=PHLf5U/0ygNG+fLDFp32DP3iwYhf7sJWI1cHdrOr4rHmYXjXUO4G6cjGYplcoC7m1a
         jZYs1h77Fldp6aBIT0WQhlwXFGo15t9wGpA3BudeOKb82OMwNTc8lC5XPHZA+ye5Z2Ln
         MQkJrCzJznQSmYaCUV0hHzyBFvZQeu2rZQjDc5Ei101GhdJJ+rUnLlwD/yekNZKTahqt
         CFB6xWmBlFM6eetYIltiZcIfdoRT+d+bPddAHW1GzWT1Lmn/3MkIxmEiqR5DDvKDfNzB
         M0+7uWnEWxlLSPjf8wjjtb/+LT9veEhTgRpslDuum4WA4NzlqdnKzlrmMOAVzUfa4dKl
         TeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789946225; x=1790551025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJ6Y/AxXGrJfl5sj56UZBjmnGLvXYG7/FDw1r/y+iCQ=;
        b=xKqAU7VJCL/Tf/KPTW2zuhwOUBubU9NYKiFrqzjwrg7xbNR24nbNB33T4oS8uWn3wt
         3tr5V7xSrJ+wheLhZKjy+PURe93bJ94ECT9boyxsanN0jVa7lsI4LPeVTdxSeTf9j4lT
         9zbo0IjMoL1X+Yn+XdZWqtDi852002AAe1a/u0Oh9Q3zXr7/Oqty0pk6sCnoiwvUuzi8
         NFZjBJZ7v3Qva/2/sFgKxlca+YUhQS1xwPlULuP2Tkek2S8R53oLAmQ50HF/g6Bsjp3G
         XziD+0xfrHWjoMbNpnQtFGR3CEsiDgWaYYYb5zQMvMJBzKe04TOa2lzwt+tPtibgMNC5
         zeLA==
X-Forwarded-Encrypted: i=1; AKwUvByLIUZShSRN6bqi2luFfDIVGE1KUFkI5DLK8VSHZLakmb32rYyH1yvLSGZDH6+WUYm3uIuxDNTVzGT6uww=@vger.kernel.org
X-Gm-Message-State: AFuF++leJ0yN03rCe3A51Lyork/hke06rsWlopPPtHNTTigCNMyldOyB
	Jy5DcCCZI5jplOF/jc27M6G60hINyGoWomLYSwDtdjfrrIsz4CI0F1b+
X-Gm-Gg: AYBFou2PWkUQ3y9GpJDadYRTIiEJDQ3OjBVz/0SVvNByiGbhOrq0CjlgF9iFE1IBz+t
	RhggbtNmcibg6LLt3h5TOmHvz2sQ2vTmmhQIT2vRvzK8vVkM+2B7amcQmUPr3/UB5YxlNDElKdS
	dY4csfBliuAIQgTis8CTYi1K9Su7/MrTVH5EJxbrUb0tv8jpEo1jdSFPVMHtikSm0OlJfLdowBz
	cbtJnFPT4g2gh72LnRtYdva8IK8KYqLMe2FEXKZ1YfgyT38mz69xrAdovP76aeGvJKIHXdqyS15
	SIXqe3o/zIxH/hoRSOHdKD9c0FANmlBgD+5M0/6h1fJpFTIIjCTcj9HBd8cQzcMlvQ7RjxKH5IE
	pLNnVrBCh1gRlOaUZhqTNWZ3tZIPpGJWrUScdXYLwR17Rw0z6EELco9PBMlfd+fQcpMRJiXZzmS
	tALZ+G/W5/iiSSMjtzfCMY8Od3x8eUkBIkJjWsrb7Z3S9/uLftR93ThVINAtuk58xjobcubuTiW
	T6QDG/KG2VHu96KPaQwrCqhsV9vAu4NVZ5tIkrNSjHG34uIc3Efl2agYHQmgc2yloryq5vrW9eH
	VqKG2vonQc0=
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr15526458637.16.1789946225352;
        Sun, 20 Sep 2026 16:17:05 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72acd1813sm2530392a12.4.2026.09.20.16.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 16:17:04 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
Date: Sun, 20 Sep 2026 23:17:02 +0000
Message-ID: <20260920231702.110963-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>
References: <20260919223518.3890208-1-benquike@gmail.com> <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In usb_enable_endpoint(), non-zero control endpoints (where
usb_endpoint_xfer_control(&ep->desc) is true) populate both
dev->ep_in[epnum] and dev->ep_out[epnum] with the same
struct usb_host_endpoint pointer.

However, usb_disable_endpoint() only clears either dev->ep_out[epnum]
or dev->ep_in[epnum] depending on the direction bit of epaddr when
reset_hardware is set, leaving the opposite direction's array slot
pointing to the disabled/freed endpoint.

Clear both dev->ep_out[epnum] and dev->ep_in[epnum] when disabling a
non-ep0 control endpoint with reset_hardware set, and update the
function kerneldoc accordingly.

Tested in QEMU against Linux 7.3.0-rc3 using dummy_hcd and raw-gadget to
enumerate a USB device with a non-zero control endpoint (bEndpointAddress
0x01, bmAttributes USB_ENDPOINT_XFER_CONTROL), verifying that both
dev->ep_in[1] and dev->ep_out[1] are cleared when the interface is
disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Dropped all changes in the other files (config.c, hub.c, port.c,
  devio.c, sysfs.c, and ledtrig-usbport.c) per Alan Stern and Greg
  Kroah-Hartman, keeping only the usb_disable_endpoint() fix in
  drivers/usb/core/message.c.
- Updated the usb_disable_endpoint() kerneldoc comment and commit
  description per Alan Stern.

 drivers/usb/core/message.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd744a9..0cd6dd2b6334 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1337,7 +1337,8 @@ static void remove_intf_ep_devs(struct usb_interface *intf)
  *
  * Disables the endpoint for URB submission and nukes all pending URBs.
  * If @reset_hardware is set then also deallocates hcd/hardware state
- * for the endpoint.
+ * for the endpoint (clearing both ep_in and ep_out pointers for
+ * bidirectional non-ep0 control endpoints).
  */
 void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
 		bool reset_hardware)
@@ -1358,6 +1359,11 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {
+		if (reset_hardware && epnum != 0 &&
+		    usb_endpoint_xfer_control(&ep->desc)) {
+			dev->ep_out[epnum] = NULL;
+			dev->ep_in[epnum] = NULL;
+		}
 		ep->enabled = 0;
 		usb_hcd_flush_endpoint(dev, ep);
 		if (reset_hardware)
-- 
2.47.3
