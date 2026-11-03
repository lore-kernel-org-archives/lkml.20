Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711692;
	b=LN/sT5My8cUhAZDipHi36r7CxfLHZsgu0PI02MRhNJIbbY56CodytAeMrta7jgaE9fuX
	 OIZ91t/SEFAH92U/FckEyY4SFJfxsmCdTd8xkGGjfaSGHMxGvWHbQKX2WqtvoJn30DaLy
	 lvRG04Qma2pjY60R/F4BCwBXgvujDCmnlrvwYTpRgOUkqrerdbp2cOm4Yy7euCSxKzq1L
	 lNsVD5hm6xhesMqE4vpNKcin1jPQcmRv0sVnl75+KZXsVsm6dkXMGmtCOe7nWnFCONMey
	 wCKSMnV9z0UZY+19wTzx7SwXrxIwd/LMV83z9ikM2q/QvvKXPdivOzh/KxiEQ8/BM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/DdO+c8hhRiuk32rYy7zj2DQMaJ9+qPKp2MrlWUvMn4=;
	b=gTB55KKNVD2IhURIsu8r85piVs76c6vIUZY6Wgqnsy+E+VwqmYvNpLQ7ZcD5255E6G+Q
	 gLEzAsYRS9xljqLXct38JZFC48nZZvF9dBK92yv84wruEWXMGtU2LEoBLSBVGTxoFY8xg
	 DTYQAxgTAZqj1Oe0B+JoQACOFpZk2p4Gm6dh6NcJqLlSZQIq+A+/kcLHMQfVZRBxnPpSc
	 Iff4/HvxlB+W9CrOkmWpkM7mFCFkrhHSXKxpa/g9w2YDAS2Pq/xOkLONMl+oI3ETeRz+B
	 BlQ3u2IONpwGPGonbRzFTtVfGpeHAHw3g5WDKz33gQXUdWaFId/W8WUxjgDWIDkJp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viVoHylw;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E7606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0E7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viVoHylw
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso7190504eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793711691; x=1794316491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DdO+c8hhRiuk32rYy7zj2DQMaJ9+qPKp2MrlWUvMn4=;
        b=viVoHylw3O2xFHrqITHTuVW143bD5XvorRJEgsNje3zvK778fq/JxiCAd0hYnQSmqK
         cR9EDjemET3qN4azii+Cuk4YhfXECn+TXjGbPug1c2iObS7GKW6p8sHPMs8m+zcp/4wx
         ndrdxflaa266irios+ucQKW4NSEhRJIaQ0dM/RDT+UjjziuDK8iNygd4SouqNNSki3Du
         hwM5Z/OzPrRyG6JxKvq0qgUgESFKehUTkliaA4Kc8taBqCu4ttdXPKVA1KQ7P7nB5/hG
         MYsNmBviZ9Jzzz6BBsPxlVs355pApxDzgadbKPJPWbKkve6pteZPTIQe6k8mBOyVmPuH
         9y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711691; x=1794316491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DdO+c8hhRiuk32rYy7zj2DQMaJ9+qPKp2MrlWUvMn4=;
        b=uhCghT3Khja7+AAxKg2Te4JSRiw62T8y51YNZgdqNrlLiQ+tZFH7ADVkbF+OzlKS9b
         kE4hj/dHIB6GeJoUXaElNY1joj1M5zTVRPtNNUaEgx+vob4ASQ3y5mdrC91uwrZckQBW
         XeyEqKJ7dFAeQ+t7KWLAxZ/O6lqt1nHYkzBlvWVFa2G18X9E47n5cBDNlL+A+G8XiG7t
         D2CduJUenooLyS60kpDy2TWKihVnXr7/6NNYqJjCCgzvo63Be6RJcpKrhaDEE6cKjHg9
         rWah34npu/AODAq0BnaaoezEiK2d/tY/SenStlSu/eVIJVxQADxbG1Du5e+1Q4WBKpDQ
         26kg==
X-Forwarded-Encrypted: i=1; AKwUvBwir3yvaHlLMhxc1c4AoRIoxiKWN37wiT9cJ9isYoFFv2qT+7UOY8bTCetDBM3FRdK+m3Qxoa7YKRdOio8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m+PV7NXRE2fZBGx8c44d3wmSRP2YF8xipiN3nmK7n8gAy0o+T
	N5swtHV158nMRduVCioMeowFy/KzBnGvZkX3X6SyOLnKSdVqXEJPYq2Z
X-Gm-Gg: AYBFou1croL7msQ7SEcY+Wwr31h3jEnD+zzAErHVOvN70zlAnrJFdc/t0q9OipLg8mM
	J9cxTyXcTjWeSuwBknvSXDAZX/6oEyavBfqxaal1x1CSg+06aeFoZd4ikht/W72IJbAF9voufKQ
	HSoDed2k331ApokSzsT9XEocpX+iMpCEGNhAVROHJtXFB53tpipnMX6eGpJVEYGauhxHmuBD6AF
	gaI8ESs2j0hArxCT7rF7eC3YIWLZbUIPEOVkcuJ0gFwTo+KcO7Pt+V0DRd2tut1IFrVpWlZJcF0
	ZYdAtx3xXuJd5p0jvqEhiDIRfTmXlcoBfVRu9L0kJknjzTLRkjzvayvDx0iU9FGFEHxMyYyFbon
	WJDnlDcQ2R0Qj4f/lFINdBEob0iYFblYQ6UHpfzUn2tu3+l/Ji8xCtCO/UQE88rEyaJZDwqqYpN
	ub+T3X2dmYZ7f8Hsezbnm4h6t9z9VHVue/UNSrr4lpFoZ6F7CgjYs7gZLJtPy3OPmYCrXOHbHpB
	Bl/NMckZRjER6zjnkxt7FOfLoxvC0eEUvk8L1PpdnhQ2lDApS2XdDQfZELUPne2dr8xmGYvr9Yh
	JRB4Ecas7rCLyWYI0i1Lv+z3B20KEgVkfSQ7dCXT2NgwRHgn4zFwy90aIJvgpP1peg==
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id 5a478bee46e88-36a423fda77mr19551196eec.33.1793711690526;
        Tue, 03 Nov 2026 05:14:50 -0800 (PST)
Received: from arpith-debian ([2402:3a80:40d:48cf:34b0:c816:2853:c60c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm55335792eec.22.2026.11.03.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:14:48 -0800 (PST)
From: Arpith Alexander <arpith99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Weibin Liu <liuwb@xiaopeng.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arpith Alexander <arpith99@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: ljca: Don't require data in write replies
Date: Tue,  3 Nov 2026 18:44:35 +0530
Message-ID: <20261103131435.21838-1-arpith99@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Commit 0fe4573c822c ("spi: ljca: validate the response length before
copying the data") made ljca_spi_read_write() reject any response whose
payload, as announced by r_packet->len, is not contained in the data
received.

That is right for reads, but the adapter acknowledges a write with only
the packet header: r_packet->len holds the number of bytes written and
no payload follows. The reply is 2 bytes long, so
"ret < sizeof(*r_packet) + r_packet->len" is true and every write fails
with -EIO.

Where the Intel Visual Sensing Controller (IVSC) is connected through
the LJCA, as on the Dell XPS 13 9340, its initialisation fails and the
camera behind it is lost:

  spi_ljca usb_ljca.ljca-spi.0: transfer failed len: 256
  vsc-tp spi-INTC10D0:00: SPI transfer failed: -5
  intel_vsc intel_vsc: error -ENODEV: init hw failed

Only require the payload to be present when there is a receive buffer
to copy it into. Write acks are still checked for a non-zero length that
does not exceed the request.

Fixes: 0fe4573c822c ("spi: ljca: validate the response length before copying the data")
Cc: stable@vger.kernel.org # 6.8+
Signed-off-by: Arpith Alexander <arpith99@gmail.com>
---
Tested on a Dell XPS 13 9340: with this applied the IVSC initialises
again and the camera works.

0fe4573c822c is tagged for stable but has not been backported yet, so
it would be good to get this in before it is.

 drivers/spi/spi-ljca.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
index 8fd001610f67..b1babd43adda 100644
--- a/drivers/spi/spi-ljca.c
+++ b/drivers/spi/spi-ljca.c
@@ -109,8 +109,9 @@ static int ljca_spi_read_write(struct ljca_spi_dev *ljca_spi, const u8 *w_data,
 	if (ret < sizeof(*r_packet))
 		return -EIO;
 
-	if (!r_packet->len || ret < sizeof(*r_packet) + r_packet->len ||
-	    r_packet->len > len)
+	/* write acks carry no payload */
+	if (!r_packet->len || r_packet->len > len ||
+	    (r_data && ret < sizeof(*r_packet) + r_packet->len))
 		return -EIO;
 
 	if (r_data)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.55.0

