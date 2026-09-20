Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B13BBFDE;
	Sun, 20 Sep 2026 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872842; cv=none; b=HE0mCBiSUOq8tTdpvCN9EXST3m3cAz3HM6h8urQbjp8s+NYN+BeCE/qHk2Tmiz6Cn5T90cVoq6bxDFvlABFXGKmHHmuSiTreo1Sg8Xa+fTB+sAJPHgZ0ltXnoBAiDJiCFbxEyEhwXh7fh3eS9mt5KLV5AOAD9xQNDaljPxcvaf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872842; c=relaxed/simple;
	bh=QK772IuNDSIhYHEC7Nqrdy7/GXOjWjMTQAFjhiiZO50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUD5wtJ6Z/dK1Po3qJL9JcP2+nxzVO4Jj4mSQYXFvwcCSftzb5o97cc71ewfRxFdbOVgMyZR4QkKLE72usPMFBImnyyBurnopoxHO/7i/8Sltx5Z/zLFlVZG3zqYCbk+yrgtSFkIoO+E4rD588zUTmamoYKL6u3ds/FWTEQEei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AcM5cX1G; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AcM5cX1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4s
	GBVsc5BIiE3XRWisrdYb25o2CkpkldUArEINlZz4s=; b=AcM5cX1G2hJCYm+MbE
	iBWoImdxB+Imdpz0jX2agchgGoVROeP9OiSKaC+kWXP4iUae1A0kfAOuK6Gt64oz
	OfMiigxDCkBN82uV2UEnMsNizxDHzyBE1gRCtFOWc/L/I6KmjdrfBeQh6gyTE64U
	2HDmDktV+blj9Fplk/qhcka5U=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD33aGZSq9qsaQrBg--.118S3;
	Sun, 20 Sep 2026 10:53:21 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	Kees Cook <kees@kernel.org>,
	Nikhil Solanke <nikhilsolanke5@gmail.com>,
	Thorsten Blum <blum@kernel.org>,
	Kean Ren <rh_king@163.com>
Subject: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed sublinks as Gen 1x2
Date: Sun, 20 Sep 2026 10:52:42 +0800
Message-ID: <20260920025308.2358862-2-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920025308.2358862-1-rh_king@163.com>
References: <20260920025308.2358862-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33aGZSq9qsaQrBg--.118S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw47XryxuFW5Kw1kCrW7urg_yoW8Kw4Dp3
	W5ZF93WFykGrW7Xr1fAayDJF4Y9F4SyFy09FyIq34kA34UJas8CFyUAry7KryxZFW3XFW0
	qFy7KFZ8GF9rX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pii0ePUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC4AFB72qvSqFyqAAA37

get_port_ssp_rate() rejects every matching sublink speed attribute whose
link protocol (LP) is not SuperSpeedPlus by jumping to the "unknown"
exit before it looks at the number of active lanes.

USB 3.2 Gen 1x2 runs two SuperSpeed (Gen 1) lanes, so the matching
sublink entry advertises LP = SuperSpeed while two lanes are in use.
The current code therefore returns USB_SSP_GEN_UNKNOWN for such a link
and the USB core falls back to USB_SPEED_SUPER, reporting 5000 Mbps.

Handle the two-lane cases before rejecting non-SuperSpeedPlus entries:

  >= 10 Gbps per lane and 2 lanes -> USB_SSP_GEN_2x2
  >=  5 Gbps per lane and 2 lanes -> USB_SSP_GEN_1x2

so that a genuine Gen 1x2 link is reported as 10000 Mbps instead of
5000 Mbps.

Signed-off-by: Kean Ren <rh_king@163.com>
---
 drivers/usb/core/hub.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..50f14dd6a41f 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2866,10 +2866,6 @@ static enum usb_ssp_rate get_port_ssp_rate(struct usb_device *hdev,
 			    type == USB_SSP_SUBLINK_SPEED_ST_ASYM_TX)
 				goto out;
 
-			if (FIELD_GET(USB_SSP_SUBLINK_SPEED_LP, attr) !=
-			    USB_SSP_SUBLINK_SPEED_LP_SSP)
-				goto out;
-
 			lse = FIELD_GET(USB_SSP_SUBLINK_SPEED_LSE, attr);
 			mantissa = FIELD_GET(USB_SSP_SUBLINK_SPEED_LSM, attr);
 
@@ -2877,14 +2873,28 @@ static enum usb_ssp_rate get_port_ssp_rate(struct usb_device *hdev,
 			for (; lse < USB_SSP_SUBLINK_SPEED_LSE_GBPS; lse++)
 				mantissa /= 1000;
 
-			if (mantissa >= 10 && lanes == 1)
-				return USB_SSP_GEN_2x1;
+			/*
+			 * Two active lanes mean USB 3.2 dual-lane operation.
+			 * A Gen 1x2 link uses SuperSpeed (Gen 1) signalling on
+			 * both lanes, so its sublink entry advertises the
+			 * SuperSpeed link protocol rather than SuperSpeedPlus.
+			 * Handle the two-lane cases before rejecting entries
+			 * that do not advertise SuperSpeedPlus.
+			 */
+			if (lanes == 2) {
+				if (mantissa >= 10)
+					return USB_SSP_GEN_2x2;
+				if (mantissa >= 5)
+					return USB_SSP_GEN_1x2;
+				goto out;
+			}
 
-			if (mantissa >= 10 && lanes == 2)
-				return USB_SSP_GEN_2x2;
+			if (FIELD_GET(USB_SSP_SUBLINK_SPEED_LP, attr) !=
+			    USB_SSP_SUBLINK_SPEED_LP_SSP)
+				goto out;
 
-			if (mantissa >= 5 && lanes == 2)
-				return USB_SSP_GEN_1x2;
+			if (mantissa >= 10)
+				return USB_SSP_GEN_2x1;
 
 			goto out;
 		}

