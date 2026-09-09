Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64F223323
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929708; cv=none; b=n0Zi5KO5vsLEzWteuuQPrF8JBAWldHDsWr7/9PFYUyofamnH9AFfRUY9mmBbRuRev+wHdDJ084tGZewjHXNDguhigRsgyM0eAhTp6sQMdTWyYi5f2VYjD/iMtHz6jiJ3sKNzSmdC22wPA7s3BcT5UsJuxWopXJItKaN/qAQ6Fuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929708; c=relaxed/simple;
	bh=K63hzdR42RVsXbKrMuxzuWUlhwFldARLSy/yOzMk5vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGdN0QimYsLzIcIyKD/VpS2uSrTdJAZoQmwggUjmc+y9QY3xTEOvj2yL+qIqPXoGQlk7SPu0TOTe2picY/DOkMDsQGbkv9lJGDElCxz7yRgIwOVQtn0wvIgE4jO8FYXIgtIUnX3VYp7JsR241fcYXZ4fyyMESL9JWoqU7pbINqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEa+DBxk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEa+DBxk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5cad1a6baso50864065ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929706; x=1789534506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtXPc9l4G9cuCIzezvpEqoPo81//PhfiTYKMse4zr28=;
        b=gEa+DBxkhxwW76KtpO4EgJM1ipk0uh4XGAaYpFg7HFiL3GUp7nuU/XjyXUX3kD8j/Q
         KTL0ireLUSGjYHRMpIqxwzDXRSE7WICV9EMppdk+3iwaxxs54wSZSZeGyNnhUubhAIlc
         dcEtiOhaAgKXXkF+z9NpaZAUWjIoAKH0qv6FSDXk21ZSGSRSLmWQGWR1tuZfB9pe9ukf
         QU4Z7HDWmlgYGpHtHdW9JZ7HWHDY+uuoRIXgIYzyI+dVndWndGyvDcljDaVgAFOpifKv
         mRVHmEhNkRrX8LvqNFWhS3CyHiz1LBKAtji6HENhulwRjT05coCMpUtKRC5Sy+YZfAwR
         mBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929706; x=1789534506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtXPc9l4G9cuCIzezvpEqoPo81//PhfiTYKMse4zr28=;
        b=HLSdm8rWQTpSyUvDw8xTEgBh2aIUdD6VFpSCdSxBoc+hQlqjIzuNCah21jjV/1xQPp
         F6k4GAcodF/nmsuVg7HsIJqhIBKM9hQd0Ve8+5K7i/JShN7ECmuINjS17LrhgNKbqdO3
         HFBE6B8V+FE2vONiTRdwhdw+v4/mL6uNBjwLxrG9WAbawn3Y8lxe1Zp1ngc2dw44kPKo
         SD3/DlplsH93tx1Wce94WmX9bGz0G3qpNGD/EALCIa67OGnSD1XDs7ly/RVVUdI0DrxS
         7e7UeECS0mc6tXjGpxTizXo4/QdWrrYO/MI+J/nKBLbb0jLeUBas64Ag5lDY+YlJV4NA
         896Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkMyTDSfpgc89vUm2Ogmq0dqE0TeZaIPMq7SdOM6FKkEHGucbnzelz7zdfoxXGIKDOeV8uWXBiW6Nu0dw=@vger.kernel.org
X-Gm-Message-State: AFuF++loRUagSDWBTSPDN2hui/jmQuuL9U8Tloj+Z8KWwIUFtZUA/7/5
	utKTM+OXgEj9pblxKjumJMakN8+UU/ClQ1s9eLqwnhuak1ITnIbR2uOp
X-Gm-Gg: AYBFou1PY6dEbhpIQmRQtz/eRNl2C6p3oG9X9Ten8pKEnrpbBe59jeS4UXhSlb6IXLG
	3uIfpWX2uK2YoYfjdRqro6s345mC/SAM6fs1KLZZqkVObEH94O1igVTd3RIjN18ReHmMYSeqHeZ
	/XpKb+WkuFC7UaxD34aWvH1ZypdLMCsw54wxotIz4DDrNyRlc4V+f6XSxg9WZvGdMIR6TcjvoEM
	+j2OgBOHIZ/WHoVPXYhbtjsUThW0h0sEjw343YlwCGqOBQ9ROchbRwAvEL9Qr4hZD8yvbbJI025
	vySB+rd+XRR001ybbEJ4iuLEVpF9+Yb7yBHpcwnrdLvwA16RzuZxgJOqQUi5Tvk+8dl3liUt51u
	TFWh8k8V/KNX9r0VtltGhQ2tFCQKXE3GgvaB7wmesNkrnjN86vnNcsb+W3ctd+oyB+3EWImDfZs
	uDhlgY3knr3N39+sEQnCFOYo36fqyxnw51HWIrNUW+NYm6kJV35Vp6QDGw7cM6jtzl9C5gN/alU
	C1UL52N3ejDsotAdVZYN18rwSnKDzMiRlQiC8hzrBYVCRhXNuC61pHVyt6CO9haKVeoIcsPJf34
	Difc2EPJx4lUj5I=
X-Received: by 2002:a17:902:f68b:b0:2cc:864b:539 with SMTP id d9443c01a7336-2db12495a80mr474088295ad.6.1788929706292;
        Tue, 08 Sep 2026 21:55:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 0/3] net: xilinx: axienet: Fix IRQ error handling
Date: Wed,  9 Sep 2026 11:54:47 +0700
Message-ID: <20260909045450.16176-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes IRQ error handling in the Xilinx AXI Ethernet driver

Handle errors from optional IRQ lookup and preserve the original error
codes instead of returning -ENOMEM.

The changes were found by manual code inspection and compile-tested
only.

Link v1 : 
https://lore.kernel.org/all/20260811034715.6034-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20260813042012.17631-1-phucduc.bui@gmail.com/
Link v3 :
https://lore.kernel.org/all/20260817105241.63345-1-phucduc.bui@gmail.com/
Link v4 :
https://lore.kernel.org/all/20260821123249.41527-1-phucduc.bui@gmail.com/
Link v5 :
https://lore.kernel.org/all/20260903073252.339250-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Split one patch from v1 into two patches.
Changes in v3 :
 - Move the lp->eth_irq check below instead of handling it immediately 
   after platform_get_irq_optional()
 - Add error handling for platform_get_irq()
Changes in v4 : 
 - Add Reviewed-by tags
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.
Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

Best regards,
Phuc


bui duc phuc (3):
  net: xilinx: axienet: Propagate errors from optional IRQ lookup
  net: xilinx: axienet: Handle optional IRQ return value correctly
  net: xilinx: axienet: Fix IRQ error handling

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0

