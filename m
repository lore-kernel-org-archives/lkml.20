Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971666;
	b=tDKF5aWS17nP9/0y615W3jLZfy7NzBtTiwXjytbB0/5KWtKWUOsX0dJXAuBPy/k9WQh+
	 wWDpbhKavN0mvYesEHeBAj+QSGZDgWXbelTPmEdYatp4l1wci/BSfeXEDG8Ub2TSsPquC
	 vZH2NaEGsqVkRiNmTdLq9dzP7fS4BTP4tK1BU1Z2BMZg/wKtMeOrDxMQQqlE0SItoXL1O
	 wEPZTw9ve9dpIwDuKRg907tn/kQ6E+6LAHP+V+mqGxUMHvq9HR2KqQ4V3ETNmjKQJoZwv
	 BmDMRowtixk/hY9a0evQbTWHoBAGMkAfQpy+eGqQT08qMVQcMoJNQ0BD8IOGw7vdrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
	b=1Q3morWWiwlbExj+MhCbu4/JoEkwuwy78w6IjTd3+6WmghzQzwUkB27wnoCfgKjkQ66q
	 vGfkC9hs6OSStALu73PEDcQ4/cAgqTe76EeB+dw+3WuXWf50u06avw08A3JnJoz8r1af0
	 ZMOVbieyYefs85j6t/CWCLp/TujRUGjIKV4YAsQxpgwSLk6ARpZne/vUGATZwmw2G6JHE
	 UK4Uz1RxV8cN9um06SdM9l5xYK/q+vrEJi8Bli8G3Of3ziAReLgylAq8g4hVXKNM9fc9E
	 Ql4aWVZbOrhc6rvd8ZXQWr/OJUP8Cc1t7p+tdMlZpBETejPrp0vdY/tVMqtdBojWnIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG1O2Noa;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5298C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG1O2Noa
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so344087f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971665; x=1794576465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=FG1O2Noabkh8lbZst620iOY65+N2ovjDMxS4vU8qduLdffcyHgi9VgmIkUep4JrP9V
         Y8vE3yP7JUa5NdKx8LYiTsaQ6sozQhXS13pY1cas16Xe3hHwaIxSO1LAkdrbRfuBEgS/
         aF5xGwSO4FmGiP0IMt/M7HNIpJYRVlhmAZs7MsnWBlbxIdewt0TUhYjJASWFZcatOhCp
         6ipsIiQk4mXlS2JARlKgvTFih+l5Tx1sm/2Ir7Y49+RASrtfou/hr6TwCRAkxGnWFNIG
         GhOVWcHGR3llH32K6Vya875vxN82FLfMvXozd0ZKYH/lcqVRGxUX4jjbEnvfh5UX7B0L
         qmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971665; x=1794576465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=ixpG71CCmyCwvBt4pQt47XI5YHUr+AQLxsWFYmNSYkg0pXxx+So2Sd+ZmbUvP3cSfT
         3IRsMXPzrHkKZycxwZtePUayYTP7KfkFdIXlJWzpfJ869zNsYGme6K5hdsn5zKBstfgG
         gnVhmrxnvyDqjSGEEcVYzy10lpH3j6FaxrZO5Jk3CjLAdli7WAoBLHyZOWAQws2WQdSU
         ohuKd3O1OEKhmZJJV8T03xhNzjbF9yZjdOvn2xxz2l+ZM+uxTfe2geOA2Z3TJmp/ahBY
         VTA8Xo+1df+UL01+91pa6SBSVPNkxbfKryoGqpkeQN8jQUHQDiU1eDb2rmTLIiubEnTh
         oe2w==
X-Forwarded-Encrypted: i=1; AL+hErH1X90EP3vbQRU6UaElEwfeUOc/7QvOAKlNI0SRezYgY3jltUb1+hxYdgTcXNqhFhXgN2ny2ziRLExnLRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GZrbpjXvVw+ae1CqriYtL895G7BFb/7lx2bz39bv41dz0OW49
	+ZfJobwDpvm0xv9tP1X0iQ0SvPo0jOEIMNwxFx74iYeP8o10ij3C0egc
X-Gm-Gg: AYBFou3+6qEGQpMcuou+i9j86FvbnwjLP+Sra1CxZXTKeB/gRtE3hqT7aNjxKV9Fank
	hoH7Jik0Em23unlFHLdOoI+NFTgvvjQw7CB6+zBS1qhLgs4ad+9qSwUm7NTwkTF6n9Pixsizt5p
	VUqZwe4xRv1dcHlMP+2jdoz2r1QhfzGzyFlABlMfhL8q8AjfVc2ux/1WSVVSRyDSabC1h8CWbSy
	Wj+XXARHD1MPW6mWElEOpaNAAOAG5aPCDzFyNtvrSdUPeLhKMffhU3590HyPSAO6fUwPx1fft0Q
	2ECPuO4Mn42zazySA7BdxHUMqXbXCLY/twzfsLYS4q48TewZOlzLYmBP2P4YfQqknLyR1GPq70U
	lN5HKt3TPxWnZlJfJeJalMJYdJREyUWnEKFfKdzvcK63O9JBVPKAdE4JJEHYZc1X2Ku8YPwdQ1V
	j5pw/Itt4xmFunauPMPnyoQgd/b9BdYcqT68apGmvk5ziwM42I1cLKbUx0VwwfhmQ10riuOtClo
	3uNYNf4lVSkd+NP3FuDf/ompjp28nBtSN1o9IePZAJlDuNPU3o5umkpJvR1nypGoDaPAV6LGyiZ
	3mqlLa2rWW6hPG1w+hTvzyTZCNLs
X-Received: by 2002:a05:6000:240a:b0:493:1004:96f7 with SMTP id ffacd0b85a97d-49310049976mr3258508f8f.54.1793971664393;
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
Received: from salem.. ([141.85.144.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm3825733f8f.32.2026.11.06.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	matt@mattwardle.net,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Fix double blank line
Date: Fri,  6 Nov 2026 15:27:36 +0200
Message-ID: <20261106132736.32837-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
Changes since v1: removed Cc line as suggested Andy Shevchenko
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

