Received: from outbound.st.icloud.com (st-2001g-snip4-10.eps.apple.com [57.103.76.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64584A2A53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529580; cv=none; b=h3YxnBICv1sBOIpWLBNSE0+NX8YVr1NKB/cvR0kiWE0hJTEWqfnNnco243dh9OKxa5P0wzEEfczJCBso3PhsIJFkMMzERjZLixU2xXeOyIIJrOCgKglMFXR3iZCE25agjKoX4wu0Tk+MpGAFqE6oxW4kv1h8qOO6Wc7WUXcPLrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529580; c=relaxed/simple;
	bh=VgBvH93mH0IC13H2YfZ9jhlu50FzkJ/RjD8cujGMrnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FIKHZocdrwotoLeRIJJssdPe2lBT692/Qvx1Rc5INdhfPVDj4Wo8Ed5YRSJOSZj8o2D5GV9wf8zPFKxVsCCmjmNeJu1NPlsNtDZoRUI3cLRuN1NE7JgOIIx/LMuZtucLvtHQ6T1j+PC8ojapUHybWcMPRWcG6Yc+gRRbrLlnfhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=LzjGXE4V; arc=none smtp.client-ip=57.103.76.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="LzjGXE4V"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id EE4FF18011B5;
	Fri, 04 Sep 2026 13:46:11 +0000 (UTC)
X-ICL-RepId: 01a06cab-785d-7a6f-85f9-95a8504f73eb
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBKHVwPXxxBDUwdXAFaEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDlUXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQABIB1wEXwRADVYGVAJdCkUUSR4dXg5AAlw4QwRZBFxBFx5BUxcfSwBcRVAYRB9dHWYcXABWAlw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1788529575; x=1791121575; bh=urs3FkG76nAm9xvXTdR905liXWMLU+fqwoh1flhPN1Y=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=LzjGXE4VaoNWWrNEKa8pNOqo/dI4oraqKUTe61fmbVU50grKEGX4FY60UyVF4FeegKfpzyb3JPtdspUt3UWtn5L9gkSnQ94wOGUiImoVefRD3ofwqV/LmhNl1rVZLEO6x4Zr7Y+sQ2lWMVn9YJS43eR38AuILRLjtT3nWC2MavcqTu2bQ6+V1xeuHXqpa8F2pdcKq2vXc80CjCxzwMBJxta0Mc7ExuIzX4rZOFqF26vsmoffhFPI2dYm8Pi+NRsnNjIL7nGz4cSibM40yGkgT40QMM9YT0EuM+LjmvjWoxyJu6FuQEBwCtves5sP3gTeCIbZOiKU6fajtCpxlcE1wg==
mail-alias-created-date: 1575045973000
Received: from 2a01cb0a80256b8bfbb9c8b6ea0a448d.ipv6.abo.wanadoo.fr (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 3050D18011A1;
	Fri, 04 Sep 2026 13:46:10 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Pierre Pinon <pierre@pinon1.fr>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken 1928x1088 binned mode
Date: Fri,  4 Sep 2026 15:46:00 +0200
Message-ID: <20260904134604.595685-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNCBTYWx0ZWRfX2bxhpqVjLt6Y
 TH/iYj6AEtFjwuOgSTdbxgWVHqoBI7UOuSAIyOsGXQQP19XfINrjHrSx0LCvvnyL5RTp2RYn3UR
 74tNdkM4xLqc331UGMe2gw6qDs1qz7iUs9/xbD3EPCY5tASiN945jRCOMyq5LCgKA/vPVWkDKSV
 gQrQedPym2t+pHTNAf7N8Mj9bQLnFhtey6gqCOoR7k6HBeFtn3XzHMDiX9qrUFedb55/X/D3p0k
 5MUFoFXOodb7ors6UZkMHj8OZN9qFETaYPOWDWpNUU7gTWZHwKYfpnYmwXYInU6NKLLI9ByjTEp
 qZQTGMpWECrmo3yCa8gT3iAHv3XPe1l6LEj7pqMz3zY8BVV3kKya0J7tfEUypY=
X-Proofpoint-ORIG-GUID: eW0XShWqupeDLLVRzibJKuxG_bkGTIuP
X-Authority-Info-Out: v=2.4 cv=Usdu9uwB c=1 sm=1 tr=0 ts=6a9acba4
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=A03RO5IS4k1j_jX9zugA:9
X-Proofpoint-GUID: eW0XShWqupeDLLVRzibJKuxG_bkGTIuP
X-JNJ: AAAAAAAB0DiyBr+8w6lesOPX6xj+/GX1UwFOX3LKElunZ+z1e1USPrWv5JFCOanN48ZCH9W8MCBqNc4rjCupQ+bpPJswXDumncpRdOw+mIIXlUbF1ARZP6WretX7v1Q39bTD7oYC0QKlVINGUF7wWkLR/Px4nbknBx7ld5qx46REB+NQEYQjWQo1tnsW5/jJxlNFMFu9qbLPDUUlJzCNCzWefeIoaRekS9gSxFM4NyAx1fyzxrMClb3emgpTMk+otm8flT4QpU9n8i4HbO83uIZfz7AxORjV++BN79ObNQwuuoZA5A3Pp2GWfuCtpz3C7b0pNdFVrr7zwDCcjPzjGr/B8kMXwo6N/94P9j17IlkSq7B8WlznRM0KDOammPgeNBQVZnfmgmSDJ7AwDyWGJKfRTpxk83ke8aHnX/ob3iJGKMtRNg1Y4SLDiQzrTYniEfNuQj/vbneps0U82nESfq5+wm7TNMRaBkBOeyRRXhzx2gTF9BSxsPrtf7nVryNFcjPwMElZJ7lNRE0mfTXp3Sl7EbIgqPe5q/v1JFT4fcchpVcaE7rXTVwx7uUI+qVU/iMdZphadJXmnQYEdDUhmGPfY1KVzKExHMXZSi5hiXsDcCnuyR45xO8QPQqnsRLZIBWILHaAUT67QUHJx6PPWMd40OxpjvWBz9Lqb9crAGqOlTgSW38ZfK19wrV+atFBBIrbLxa3PERZ7AqYOF2X+yhs81n9bRFOsPVE8L1J5LY2jYiilNFGUCCMUo3vfQH3hgb4ydIfnGbFMS6O3tuQq2rjgiNBDbj6X80bj0PGJiNmg7rbWpqLHAjnVAD91YTFCwll3pXGCrY3zTj9d5Fi5mrnRJ2YQ8An/BOGJmIg34QbxVPo485gs6UTUMohlYwgStgBjLH9uR5N/LsUKJic0hvwwhn6nikxjpH0mDwnG/IJBsPzj5eR4r+33I8TgRYKPJhtkH2gSYQnsxUwQsM5Xjjf189gbf3
 UxRA99LimA9CeiME3moYSGWwG88rXoSbjYNsXG45W1eLf32i93MCSEHyTWvdFQaZla6sMBywAnHc34vl6cXD4Fwvx5n9Zc7o/+wqAwRdBtbC64lmfL21HCnlB20NId7xoMpC9krP6MWXhqyV3njQOng/Sjrg+JQpCEQ08sxuPedCBF41C4Jiec1G3268K0PelHwe8PhCY0TsjTxXhRnOkyC9eRDVt15liJnyEdC2NpCSxcac0j6cZEqdaOr5yMxC9DvwfCgtn7bljl9b8AkUHfm4GmypjPVH356gvkRgzc6Ao4RSOdp8P8xtBAB7eUgHyyevx/l4fRynCn1bUPI0pGU88usK6ZR60eMIQfTngMSQ=

On IPU7 platforms the 1928x1088 2x2-binned mode does not deliver usable
frames: the sensor emits only the first and the last line of each frame,
and the rest of the capture buffer is never written.

Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI
lanes at 1500 Mbps) by instrumenting libcamera's software ISP to count,
for each line of the incoming buffer, how many samples were left at
0xffff:

  3856x2176 mode : 2177 of 2177 lines carry data
  1928x1088 mode :    2 of 1089 lines carry data (the first and the last)

The raw samples confirm it. In the working mode they sit in the expected
10-bit range; in the binned mode everything outside those two lines is
0xffff:

  3856x2176 : min=59  max=81
  1928x1088 : min=261 max=65535

The consequence is not cosmetic. libcamera's simple pipeline handler
selects the smallest sensor mode that can satisfy the requested output,
so every capture at or below 1928x1088 -- which includes every resolution
a browser asks for over WebRTC -- is routed to this mode and produces a
uniformly saturated image. Requests above that size use the 3856x2176
mode and work correctly.

I could not determine whether the fault lies in the mode's register list
or in how the IPU7 CSI-2 receiver handles it; the register programming is
unchanged since before commit ff1f5010a96a ("media: ov08x40: Remove
common register settings from resolution-specific table"), which I
verified does not drop or alter any register for this mode. The 4-lane
binned mode (1928x1208) could not be exercised on this hardware.

Until the cause is understood, stop advertising the mode so that
userspace falls back to the full resolution mode, which works. With this
change a 640x480 capture on the affected machine goes from a uniform
saturated frame to a correctly exposed image.

Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
---
 drivers/media/i2c/ov08x40.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 3de06e19803c..7b10780f25eb 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1318,27 +1318,13 @@ static const struct ov08x40_mode supported_modes[] = {
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
-	{
-		.width = 1928,
-		.height = 1088,
-		.vts_def = OV08X40_VTS_BIN_30FPS,
-		.vts_min = OV08X40_VTS_BIN_30FPS,
-		.llp = 0x960,
-		.lanes = 2,
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
-			.regs = mode_1928x1088_regs_1500mbps,
-		},
-		.crop = {
-			.left = 0,
-			.top = 120,
-			.width = 3872,
-			.height = 2192,
-		},
-		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
-		.exposure_shift = 0,
-		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
-	},
+	/*
+	 * The 1928x1088 binned mode is not exposed: on IPU7 platforms the
+	 * sensor delivers only the first and last line of each frame in
+	 * this mode, the rest of the buffer is never written. Measured on a
+	 * Dell Pro 14 Premium PA14260: 2 valid lines out of 1088, against
+	 * 2176/2176 in the 3856x2176 mode.
+	 */
 };
 
 static const char * const ov08x40_supply_names[] = {
-- 
2.55.0

