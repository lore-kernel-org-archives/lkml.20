Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D321360EDE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845522; cv=none; b=qCz86iTjG1xUdOT6lHlvDjCm+QVeWjHV7BJeBUHXjWAcYeUcWGKTY2ZnajaqpUfJkAVOGvhrVFyWU43KK/7sNCW/sTbav0whijPd38b6yurF3sGXG41bbLNxIpE/IbfQFMPl4zMfuRV14GAGDRUt1cHBjcaAhPIyMHq/RIPGUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845522; c=relaxed/simple;
	bh=iwnWeb25yE+rfN9kEI49A4U/Q/LIF6dD2bDHyg4G3r4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TosQ0mZTWWrdAdlwTI6czUn3Y/yq1A9HHHh7omZq6HuQj6sc8o6vsJGPut446YrMCSe2JAx1UCAdqjRwHWGIVTMxXAtay+GFg53LgeTbVAbVnejYcCIY2cJxkz7PwNSd76WN7HVdA7qyGCsc9FwVgqZpIe1Kk9LpRi7Uvc1L9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=mrhfo5Gl; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="mrhfo5Gl"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so4363686a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1788845520; x=1789450320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhTOX+3txKjY+wR/I/V3MXNzBLpDrt5vGG76ZNsRJD8=;
        b=mrhfo5GlwTXyeDvnjGyeWlEDWgj025c3iITACc5W7RBSILRY6+HA50cIMAlo4YUwnV
         5OFEsTzL9VoGMLLm4rAJvvOsOLIVOX9n3/bUBgyHA5Hn3A1LUN1XXjCJ2F7quf1S5yTZ
         PP0kvsiBRxXENk9JlJQMLrl7+tpi+zpCHkCsdoM8ALO1SWH15TMwcpwkyvht1AqUGzYY
         tUt/2+53T6A9Dm0J31zWOHaIBwvZreTkQU+rsPcadT0Ozq4+iYhURnm9WuZvRABPREeK
         KJw1pztvtdqf/HHy5xwYXK09LiTECnkpCVQ7Swa50uJ+R8yodXhHLqajmtlC7VD0Zz+x
         G0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845520; x=1789450320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhTOX+3txKjY+wR/I/V3MXNzBLpDrt5vGG76ZNsRJD8=;
        b=ngV24KEJO+mDdm8z4t5SHgseF0kvUy4+TscrjvY0jfA/FasJns2/PsWFa/zBTc4yxY
         Bv+7so5XRDpSEsSbcx0OccSarzhu9FizXII7W6zqfg7Inwx6oK4z/i24DGyWnYNgHohZ
         QLQGrnPOCudgeSRPRKHMaPOiHUydruM0RomYMdRMBblG55PaDjS1jlwWvmLV9sHRYDAk
         b1tGDRvIyW29OMSeUmh2Gg2h4XnQOCr8/FB023FAntE32PT6jsVSSB770Ihk/ZvaRNts
         QrPD3B4i7P4I+YpD8XFddHdE+wFFWu20xv9Ten/LT/fQnrtbqz5lzZAbxaokA650Ct/u
         st7w==
X-Forwarded-Encrypted: i=1; AKwUvBx5ZCPcoRaDYRiXZyF9DO4VafkiSZ0lChwidEZC4C5MwShBbOf1SFxYzy2D0p3vOm717MryB3JxFpiPOX8=@vger.kernel.org
X-Gm-Message-State: AFuF++mFdUrZxCMT5rMxvI+3LM51FUOMBKHlJsYbc6MDc7MWivWb4hnF
	K2UcYVcgb7Lc75ja24ayU3K11WtPLpTgUDEAFnLVcwI/BqerJ9aTussskZbQp6ohQg==
X-Gm-Gg: AYBFou3bFnbnYv0vyNy7xP8+iqQNL4IWixxoYVGDVkKlL/v5wtAKXS1rlFnQA18BYOs
	QqeHhhEtgsU/hN0FkRFBVhYpPHK5YoUx6sXQJB7yOpz88RxM3r7pHii9oSop+HrRqB27uFPCDkA
	MdRbYfebHW3/23yf/BpbeY55GOQ4SQhxq1PvtoQq6/L8ieuqColwJTAebt5g/R5ygmkyLWe+BFf
	G5lL6xGNUvqYxAVysFlO/VX4Vwlt6h3TxeN5nc/nqlOpls3oJ5s9KfnZpQa82RRP+efjSqOP/l4
	HfuLr7ylpiLAR/D2MNTJyB3+T+NE/7IQqULoYAgNbxBb+tRRm8ZL0Zey47aC2wIxsqRvgNL9apE
	5FmiZjUM7PMpEWtYwLKg8af+OYcVl1aQS2nrABKlGRCrs0Dah3eoJX+U30R6lLj2dIBpwfVc0at
	xMGO8sp8WxIWEg5/Losp6vtHXzZYqM7xPvJkuJWClJmXvGeaXhqbWl5siYRDGPhYRulTf/
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr40465578a91.1.1788845520117;
        Mon, 07 Sep 2026 22:32:00 -0700 (PDT)
Received: from mimolette.lan ([58.136.73.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm31866443a91.12.2026.09.07.22.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 22:31:59 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	netdev@vger.kernel.org
Cc: Richard Cochran <richardcochran@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net] net: macb: fix ordering around PTP timestamp read
Date: Tue,  8 Sep 2026 12:31:45 +0700
Message-ID: <20260908053150.28694-1-jjc@jclark.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PTP_SYS_OFFSET_EXTENDED returns system timestamps that do not correctly
bracket the PHC register read on MACB/GEM. On a Raspberry Pi 5, the
returned interval can be as short as 37 ns, while an ordered register
read takes approximately 1 us. This biases the midpoint used by phc2sys,
causing CLOCK_REALTIME to run approximately 0.5 us ahead when synchronized
to the PHC.

gem_tsu_get_time() reads the nanoseconds register using the driver's
relaxed MMIO accessor. On weakly ordered systems, the subsequent system
timestamp can be taken before the register read completes.

Add rmb() after the bracketed nanoseconds read in both the normal and
seconds rollover paths, ensuring that the read completes before the post
timestamp is taken. With the fix, the minimum interval on the same
Raspberry Pi 5 increases to approximately 1 us.

Fixes: e51bb5c2784c ("net: macb: ptp: Switch to gettimex64() interface")
Signed-off-by: James Clark <jjc@jclark.com>
---
This uses rmb() to preserve the existing accessor and endianness handling.
Would an ordered MMIO accessor be preferable for these two reads?

Reproducer:

#include <fcntl.h>
#include <linux/ptp_clock.h>
#include <stdio.h>
#include <sys/ioctl.h>

#define DEVICE "/dev/ptp0"

int main(void)
{
	struct ptp_sys_offset_extended ex = { .n_samples = 25 };
	long long min = -1;
	int fd = open(DEVICE, O_RDONLY);

	if (fd < 0) {
		perror(DEVICE);
		return 1;
	}
	for (int batch = 0; batch < 40; batch++) {
		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED, &ex) < 0) {
			perror("PTP_SYS_OFFSET_EXTENDED");
			return 1;
		}
		for (unsigned int i = 0; i < ex.n_samples; i++) {
			long long bracket = (ex.ts[i][2].sec - ex.ts[i][0].sec) * 1000000000LL
				+ (long long)ex.ts[i][2].nsec - ex.ts[i][0].nsec;
			if (min < 0 || bracket < min)
				min = bracket;
		}
	}
	printf("min bracket: %lld ns\n", min);
	return 0;
}

 drivers/net/ethernet/cadence/macb_ptp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_ptp.c b/drivers/net/ethernet/cadence/macb_ptp.c
index e5195d7da..8209ec190 100644
--- a/drivers/net/ethernet/cadence/macb_ptp.c
+++ b/drivers/net/ethernet/cadence/macb_ptp.c
@@ -51,6 +51,8 @@ static int gem_tsu_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts,
 	spin_lock_irqsave(&bp->tsu_clk_lock, flags);
 	ptp_read_system_prets(sts);
 	first = gem_readl(bp, TN);
+	/* Ensure the PHC read completes before taking the post timestamp. */
+	rmb();
 	ptp_read_system_postts(sts);
 	secl = gem_readl(bp, TSL);
 	sech = gem_readl(bp, TSH);
@@ -63,6 +65,8 @@ static int gem_tsu_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts,
 		 */
 		ptp_read_system_prets(sts);
 		ts->tv_nsec = gem_readl(bp, TN);
+		/* Ensure the PHC read completes before taking the post timestamp. */
+		rmb();
 		ptp_read_system_postts(sts);
 		secl = gem_readl(bp, TSL);
 		sech = gem_readl(bp, TSH);
-- 
2.47.3

