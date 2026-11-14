Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699761;
	b=R/IOci3UQXR2sL88BQCrTzD8rsKJn35Wi4JFGci/z23oiVeDNJKgvidvNxkUaHXantD+
	 YX+YcBktIFQ7m+oCbOeCFLV/oIwu+73QZYE9mMaNTEGwN31fEcD2D8SP98C+x5iaFrofc
	 WZJ7nKGfkXW0Wl5Hx7MkA7L9c21ctYroFCo5rDcHShKVKzCgf8mvwbFlIDYsU1tw8PtbZ
	 8IPqXUKhYsOchnSOTGFHr8My3xASvQD+rPLK+Z2DgtBzwQhmXggvRku6SJ3pAtPET1pem
	 9nUugT+GCfPwU8Tr49iUiH+7/9ScsZTXoCp7DHjLDkMnd2vopazrClhlN+Qh8JMGt+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
	b=zSoUO4iorlEFwGqqDMJkO/T4gbtUllY2RRbAMm5GyyACNSHQzvv21nOIUHpQ4/oT5txF
	 WpTnSFcGrK0nlvqUXacVcFx4B707f5eZnh+85t6nurdncoNCuS6joc/Z7y8JUJ9w1j01Z
	 vAPOBCjmaL6j60XIPU1I6SufhXrv72tPdeLQdnMYmAjnm5icSGOEC0t4Z4rs6GjUInh4x
	 WAvLuFeqZLuF+myMJ9RSkS30cm0ftQezu9McO2cqdevUsu0eXaHetbCFNu4wAnGaAidH0
	 D6e92ZUuCWtbDlnAypdrYjnA9tqwA7QozXK8v9qP3CIRA8+eXZuIsw6pCV4L3KWcidw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482A606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B482A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b37951a397so375264a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699760; x=1795304560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=uciOJSd4DLcxi5tp7UFydIx3C4EhdZs/GAMHtBiuSi9pmmcpWyswkIexI/S6kLR2N8
         2Le90ZgKylQHdTleR8Xv9Yd0HOEGCaGaHqfZhbtT5RcbpIfz+e6uxDSV4zn+VdBKsvyJ
         d5q7TTht46VFaKlDsBUY736imYOS3xY2du73MdusYM6SCH6Sm6Kjl5zyYFuwaJ/zUWO6
         Lr+yr2laygQVKQkL9Yl+9lv6KhyEjevj9HDc5vaeiZVKIl7u1R0/Fepb7MTpcJ/hP+bz
         Iba1z6IiUxKqXfUAO0OU5MibmUjXTcQF3R6YyK6jd/n4EIpxa49XxgKwGqSDZIOmsCkl
         M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699760; x=1795304560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=TRanhDWRtnqTc5fHCHT0dWoegSzOLzD4FxKSQb6XJ/tSPBkC/rnxQO4uvRmE60NRzr
         w5KTO53Fu1QtxtF6zmREJtP39l91ODvOUABIdI9VFNelcICxFaJ2/FvqMskz7bQdFe5e
         Cb4z+0Nh44abyB+WCbntsn/7BEZaUKFyM3x1ksX+pqtZksjw498nOSRt0uD3VErhLHdT
         oGbgw7nTkixYRs7FvDzGd40qE0G5k1K3wA7hlwA7P7tLQwD3XcwZfhx9T955ZAw0G6ac
         R8W8qVoghGklmVbLAA4ueyOMVDB1pa7AV3hKjQDX9+T0BO/TEQjBDI2yuvl9dcNHxIy6
         mR7Q==
X-Gm-Message-State: APuU4Z+cBnjW65rJxoL/YzB660BdlQlGpyjDJAnQSN4JentuJZRCaM4d
	xrHiwtT0LhFYGrYMUoGKCnwik7FDzCXpP9aChPNqWFwoC4K2sXVoORKf
X-Gm-Gg: AYBFou1Qodums9+4rpt6DVatM+TV1XUIDP/GnJRCEQ2g85BLQ87NjS/9mn5cUHbML8A
	Z4nUDAiQagXY0k/nr3gRmcqqLNXI5PRy1yOfGfwB7fyPJGYStfffiUEdTelFSQY94qCVcfzHXqM
	5gxxxhnaSS8Sj/G/iIbYrwEgXCDNCWpcBnSTd9yEElniC8YxbCy485yllpGA+pPeZprrU2eiDyH
	fGNUuCahuu4D6+94xycS22lKJvVtmc6QcCk6W5kl1Ylx5bIm9Q7YLf7RCXY+oHcyhEM4///yxik
	mTrg7gr+y+2coKO5L4bKNEKkBkUXiHOiwcAOOghiV0AGj7zrwkgjs3t/Z1+knFkfCOL7vmS98YB
	uAn5svJCpCoetU1BUpYG8mrfLEeHFq9NPoggtNah8EqJJWl/kuu+1UICgSdinRSvy5IUKu/5F20
	AvQn65RHdmE9gx8hPCQ9KVP8Y5ct3OqGfHIA7sSrz4jCJKNVxWqcrnYpCKAaTg6/qmOBiM1cH5u
	g5atj6BVOiNQ203C1fLWvAyEGK/z1ylMJ6UFCpcuK7WbCzlcUCZagExNHHZfEymSBD3QEqeTaG5
	tmUErZu4YJOLcVgKcQyOwI8Mk7fqqvKcjGe19B13UKXddQ/pyClMfgKMPDiV9sMaLIeyOXn2GGU
	F0oo7NW8yLx1JndeyUhJVfKMpSo9//JHmFZPABmy0agrXdsGUMy69pOVBQBKV+DTuCCwsuC02FB
	RF3w==
X-Received: by 2002:a17:90b:4b92:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b1b0b57de5mr6751003a91.14.1794699759981;
        Sat, 14 Nov 2026 15:42:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:19 -0800
Message-ID: <20261114234222.88337-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

