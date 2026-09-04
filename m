Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73104471CF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518480; cv=none; b=HcmtGaB7P+GIoKmFbosTkkl/NIkl7WpZDiWIvT9fPO3kpCvjRcaiCunTfESiHjdWwWpq9luGfOvmpWcIdfw+UXAvdnrq7kWygITHkAN97apnQgfHf7h76cVRA4f1tIu83x0xz2SY6oWTaNki0Jd3WJBKQmfgsynbqZw2zKAT5OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518480; c=relaxed/simple;
	bh=C0egVGKZ0zFbzyKiNRp6bfje1hZj8RkZyWrinLyZmcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGz42a80/Xj5LwmXFA8Oq0HbFovd5cgRCexmk5f0d4laOYs1PkW/FqTfgTZDthGJveAw3JFDOEM8hGuD51PN3rvQ6jh09fWyImCxhBTXv5cPp5260lfDyUT+d0pmHNaPcB+br1287fBFWRH+pAihkZhZWHYrZf80nXhxV7KPJgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUafhj7s; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUafhj7s"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4f824de5dso358288a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518477; x=1789123277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Y4lvfl8K7dMiWCUbzntkn6PCAhAT9IPKbAAb6EOT0Q=;
        b=EUafhj7s/UC/qhSfQTAEf9o0CeXsy6g4Z43oRbYJe3YV2yA3ADF11M8UVSP7xSCaSw
         XU395VnOJuajfbv/Ldw2a2aqNw3X+R7bDoJ/0r3m8cmL3Yo0h21yWGX63KRW684HZr5O
         S2+MuoSi1hoLGyzeLZ80ysoiIVkEkMBK1O+N4/RryE+XAPC6xD+KjFijhxOyMZ9pjtJd
         KyB6hv7PCGmIYpepru5YQZKkSyN4FFIHPes7uju2qtTq8on3T9su1ThiL4K7nsGrHB8J
         YUg6T/Bwtoo4mMIQbZ/WuaHC1h0hsBIfo68/rxxZaKSc0qq4N72w8qe24ILfOuEbVJ4B
         voXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518477; x=1789123277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Y4lvfl8K7dMiWCUbzntkn6PCAhAT9IPKbAAb6EOT0Q=;
        b=mKmomcqlSMwvcjCftewtCHF2KoUoZpTBVDITnVJo0beMnVfae4j6OoIEGQDeI54mwV
         JnwC+Yk9unbeWMxeeFYJ3FNqU6i5dqoDrUKlofED87OOs59Pwg0HZbkWGH2T0ZqZE396
         m0fq0bBi+ZMKtPkwIWpZAp6o8/dNvgxgb3d0caSTRMHTp2gOXwB4wFX4KgpqoRV3E21F
         BixJnxDoDun3Mh1mQ4XuIlfjC78tVjL2nYhJtYn4JUzHqVsfs8pWvK7Ed8dTmu+s9qJc
         j7dbIC2sHXU73EVrx33r54OcVihI3+F/uy0f6ehASkINSAouX9imeMnSkd6oZF5VpDTj
         KMXQ==
X-Gm-Message-State: AFuF++kdvEojS58fvVlC9MdsYjwbrK7wWpTjhae2BkCnA3Oq2vUI3y9F
	a5HifizIOqaXAIzdbidlMFkqYYrREJmAQqwnMqefn/HWN0VDzxB4JaIH
X-Gm-Gg: AYBFou3w2rGuRG7arzPs8WPaPxSH+/ipE1YTTa5E5F5DBDXs45vS/4sV1HsySIw8gJg
	H/R4u4DlCFNjy19gSI/BPBSANKyOwTvJeF04aA9ORrMPQ1zKlppai9AUjRjMUopCs1x2eYJZfOg
	+gWouw259NuCZaGWmmGNUOoWWsBZ4mYGFTpHbudpAnwHuEHC4IjIHoEZFr7XLh3miVGujIBtHFR
	BGrAOxTKo0YvphJEwAtiagIxnIBXJy+QEoNXR5mytisjHuOYwxxSuWhOfl9YGJjk4UdTvuiMNc7
	NDhgTXI73ntCv5h+hzi+zOU85dLWza1yXiU/BCOE2YGxyO/G3hAn85pR5TEZn78lYxNq9NQR2Al
	aiQMes657mscVOGOKAGv8eSlzNnfWvF2hmfO9sSDtCuX1yHQUxedylSbzvWNawLp9hewS1qKVJq
	TzGVg3s3mg6VEr2lfWzOy7iBXOQeHKiKMJ7hQZMy/8ZwizQdN+oZqA3MTbM48FiDti1LUh6p4jc
	ej3Ek4ILL+bcjw=
X-Received: by 2002:a05:6820:f023:b0:6b7:8396:f3c5 with SMTP id 006d021491bc7-6b78396f7f7mr1047288eaf.39.1788518477028;
        Fri, 04 Sep 2026 03:41:17 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm5319267c88.3.2026.09.04.03.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:41:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/2] mii: fix typo "asymetric" in comment
Date: Fri,  4 Sep 2026 16:11:05 +0530
Message-ID: <20260904104107.12832-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104107.12832-1-hemanth.selam@gmail.com>
References: <20260904104107.12832-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "asymetric" to "asymmetric", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/mii.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/mii.h b/include/uapi/linux/mii.h
index 61d6edad4b94..d662c10ee282 100644
--- a/include/uapi/linux/mii.h
+++ b/include/uapi/linux/mii.h
@@ -81,7 +81,7 @@
 #define ADVERTISE_1000XPSE_ASYM	0x0100	/* Try for 1000BASE-X asym pause */
 #define ADVERTISE_100BASE4	0x0200	/* Try for 100mbps 4k packets  */
 #define ADVERTISE_PAUSE_CAP	0x0400	/* Try for pause               */
-#define ADVERTISE_PAUSE_ASYM	0x0800	/* Try for asymetric pause     */
+#define ADVERTISE_PAUSE_ASYM	0x0800	/* Try for asymmetric pause     */
 #define ADVERTISE_XNP		0x1000  /* Extended Next Page */
 #define ADVERTISE_RESV		ADVERTISE_XNP /* Used to be reserved */
 #define ADVERTISE_RFAULT	0x2000	/* Say we can detect faults    */
-- 
2.48.1

