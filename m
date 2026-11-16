Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835999;
	b=TT3TOnHYMCtGE/XLYWfQGgL4iyrQmfTxz0uXC1CF76LChJdJMM9XeIibquQD3Gfg1ODN
	 /JKLmjwFk2kjqI7qBBdUyKCAciH/wifVU749NZgZfVHjsUGBI1a9jWKXiJKq1We1Atku2
	 40rWwyTJHPpivTt5p+RwRr4HSfgIPZ55TtZfWi2ZPhHqt/Qoo9a2jrhnYy1XGgnuPAlXc
	 4iZ6vzXZ05g9MxvqXEwzHYQ0wZ8I1jY+rd2NpLB7nv4qrzPU4jY7RD3DCFZ/Kz+99UoNX
	 S6H983OufA15A8j/aX3XAi9lIijJ8ILc/oRhjepube4/Kmc5XdV1N2EbLMtObVUXcWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835999;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+lgHrIUN8omQkjb2vy/fSimmUa6BrDWEpsc2sku8LeA=;
	b=aGM85Rtf5827OPlxnTjeRb+pKkVi5u3EcOSXCcxNH7aezGA5k6C4XH2v72oEQ055ySv+
	 uVGC6L0IBacrwuEqr+53k0tE15Fw363/bAFL4DIMwvLjZFrvR1S6esL7kiH8BzAcFHcDP
	 iVAmC97honReQBqj/rjy2UEHvECggkDbRqjLiOmoV4nybBUU20n1I7a/jdaMw674ah/dI
	 9KkDNWzHKyxfT39yvZUuxhZ9VOgv6WLf7m7MMV5sGfulXQpbSOUBviz6aY0PfBDzFbC3j
	 R++14qnHhucli4hDS88z/ZYKKcoX4Lckpxy4CFXidUpw+HBSJnZpzaOS8BqkctRFEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="DSaOV/wk";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E59606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DSaOV/wk
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 013044BB;
	Mon, 16 Nov 2026 14:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794835849;
	bh=uVbIVduMXaQ//1Z+a/RTdpbY71FZgSk/ZCXtcsVSHUA=;
	h=From:Subject:Date:To:Cc:From;
	b=DSaOV/wk/o36Hzn3tj27NXKwLED87GdF6A7L/E1iDexY1myBnI82lf/XY9G2mwATn
	 i549NDQlI8McMzJSIyR7vcyDttiu/eNH9iSCxWvDGJHqtwXnYT6V4Ur1sqn7UrtJ+I
	 I75RVkd1raCmOCUSz9OqXDZjVKmg0HkW0gm3xEG4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] platform/raspberrypi: vc-sm-cma: Fix sparse and smatch
 warnings
Date: Mon, 16 Nov 2026 19:02:52 +0530
Message-Id: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBAAvxL27EKz0Sj9ivSQbDe6h7Sa1CKU/
 t1gjzMws0GVolKhNxsUWbXqPDWwJwP8DNNDUMfGQB15a63HlbFm5Bww6RfP5C7JkUujt9CaV5G
 m/7/7cHCR96dtl0NCDFWQ55x16U3HId6IIodrgGHff/4LN6CPAAAA
X-Change-ID: 20261116-vc-sm-cma-fix-4235f323fd61
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=uVbIVduMXaQ//1Z+a/RTdpbY71FZgSk/ZCXtcsVSHUA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq+wYT8asi64UqGlqgDqKUsoJkmpWIFXnlZ9auT
 Yukmv4Z77CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavsGEwAKCRBD3pH5JJpx
 RYHnD/9nZVI8FbcOg3MW7VhttNwFrsM6ke7Txh18LvQgWU7GAM5m2dSmTVlRmcpG5E3cGwV5nh6
 95KFdn3zbAVP8i2LjwxyHOwR5ZN2HusDq0rtKOsq+zW1D2Ip3ToAEjAGbxCzqYBlK4UYMtdgZmo
 1v6c45ape1infIE0QJvIRSTVzXfLNwYmKmtCE6sshn3R9hNVM12YWDAB829ztz5i0ZRflh8P2y7
 tlivflfgB62WO7wCXHSdrsa9eC0GSoJSPUHPz540k6iVPxpdoImfn0cmPz8+fGGkRAKXRF1jl7p
 TvOkofWU2ZrkmW2I4+PDeQ3gF547b9HH71rFnE4dsSOFHZ65MK0Ok8nIWpb+rZvilvfFB2EqrIe
 WKCxN9XB3vKqH04PFEeJJbRErS6HIXT065OPdynLaR7Xh8XzCdDi5OD5lrK6pgmvrqePCadlO1C
 OuZQkljkvkAUmN7xZN58j6xGNUEJCw/ptPcGOIABOPR0RY1dSkWSkTYVbhoG/cxRCRcHXri8m7e
 QyKRvmU3k6QdFC9JguQFrl9mlSKC57KYD2aX5jlQpLQsuzkPrHTwxMo1MAVWBbFVRHL3LlFSfnV
 51A7xQjCxRannLeG+JPj6n5CF2P4wCNHPtcWoiy5LS0yvA0lLfdht9UaaLMKX2T+VBvBBeknhCc
 QzHFvRaIyEdVmWg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi Florian,

I've fixed the issues reported by sparse and smatch on my series that
added shared memory support for VC4 based peripherals in Raspberry Pi 4.

My apologies for not running those checks on my machine before sending.

As those patches are now applied in your tree, I have added Fixes tags
using the SHAs for the applied commits.

Thanks,
    Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (2):
      platform/raspberrypi: vc-sm-cma: Fix get_kernel_id check, pass NULL for pointer
      platform/raspberrypi: vchiq-mmal: Fix warnings in the zero-copy path

 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c          | 11 +++++++----
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c |  2 +-
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c    |  8 ++++----
 3 files changed, 12 insertions(+), 9 deletions(-)
---
base-commit: 0cab822bca7a59667774725b83e948b71462290f
change-id: 20261116-vc-sm-cma-fix-4235f323fd61

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

