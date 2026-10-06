Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F53E2742;
	Tue,  6 Oct 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282531; cv=none; b=byfDEbzWdqTxP4s0hDXrd538sxEvotuWEzVKX+xiHdaa5gW6IodVMX2zeGqVG8yr7k0YI4KU6RWgvCEZhOJifMUX7AQnCHDUe3wzTCyOqmq3y6yDOft2wtGMKyP7+0pgMa2HmhxqPYIYOQUvQ2m6feWOGHnKaBKv0IZee9Y02NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282531; c=relaxed/simple;
	bh=+AfdRTx1cR/olyvnRelrjVuz9aoZtfHV/xlP3g+WmQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEpTJ8i+FNrU8PG3/ruhCzZI6y0Lp/dIKByhs6FCt2SeLQmM21SqHO6jMddeLK9OqAWjFP5KVLC0ssWhRGvT9CkwfTIjb00+W+FZdQ61YezcpPs1JuB9lt5s/KlugbuKKpOnhqlnJdYcETliXfCGka/5AkzZ9q7vDJeCp2SGB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bvs3H9J+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bvs3H9J+"
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BFB51741;
	Tue,  6 Oct 2026 12:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791282411;
	bh=+AfdRTx1cR/olyvnRelrjVuz9aoZtfHV/xlP3g+WmQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bvs3H9J+Tsa5TCPe9NMtVBl6X3CajOiZORMobkPfD4ufnFTr8eOZFejL7juxN6UJV
	 l1kLa08WspIG1hhDCccNLpPmLKLJG24j/JokKBDHHClt7P8Q4uMDRh6talqQoHKa+f
	 wzNYfKniropkVQY7mlR7NKW0/Di31mK9E3wCSmZM=
From: Alen Karnil <alen.karnil@ideasonboard.com>
Date: Tue, 06 Oct 2026 11:28:32 +0100
Subject: [PATCH v3 1/2] media: rkisp1-isp: Set correct data mode for YUV
 bypass
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-1-93d3d43991a0@ideasonboard.com>
References: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
In-Reply-To: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alen Karnil <alen.karnil@ideasonboard.com>
X-Mailer: b4 0.16.0

When the ISP sink is YUV, the ISP is in 'bypass' or passthrough mode,
the current isp mode produces a garbled image, and in testing, setting
to data mode produces a correct image.

Replace references to ITU601 to DATA_MODE and add a comment to explain.

Tested with OV5640 and I.MX8MPlus.

Signed-off-by: Alen Karnil <alen.karnil@ideasonboard.com>

---
v3:
 - Taken over from list and refreshed
 - Removed always true conditional check
 - Reworded commit mesasge to better represent changes
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..4de44f6ec753 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -240,13 +240,18 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
+		/*
+		 * The datasheet specifies using ITU601 mode for YUV,
+		 * however that results in a garbled image, data mode
+		 * does not exhibit this.
+		 */
 		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
-			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
 		} else {
 			if (mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
 			else
-				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
 		}
 
 		irq_mask |= RKISP1_CIF_ISP_DATA_LOSS;

-- 
2.53.0

