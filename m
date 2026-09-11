Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A244F56D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114553; cv=none; b=XtKBzy2aHL3KBR1gV5Z4dMmiRfg/N/5kQXIYEmJOeQER5sN+03XseVNtBeU2bmMNOR9S+fcawOVZDx+N4fKoTUgz+HKqZFuqPg0zrb1RSO8hCIobAvwGyXsMhIrGn5L6rMjJo58qbMbC9ZHYPN7vdbLNMYYRPWPlbwBK8LcTyaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114553; c=relaxed/simple;
	bh=J6q9EHrfbJVo8kVqCaYkGKEF3G1EcWWL4QKywVpxoO0=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CFe7cmCeyZRwa9kdB1ouklzfv6Dy2q+H0z1oa7gdXXMZCu5+jgFKIKEetbyBsjFWSWJW2XDtG4Oorzzl0cfP4kwQ/XbFIqnzIqQh0LRsDNYuqv2bsxdeZM0m5/+bvvjY04LzXBrX6g56eZZJ+9K2x8i6C7Jqrn8GzuVbqOJgaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=BGyob8YM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="BGyob8YM"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so688991a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789114550; x=1789719350; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rF31rq5u2Ejrgd2GDHtEaw5FZnwlakbF/ays9ggaUPw=;
        b=BGyob8YMIxRBck1yY+FVKozfN4OcZ17/rHcdHopvCs41KYlnhvyoocP6u3TZTASJUD
         9GxB4PcW4qXk8boTLkCsRILDH1HzyMVYw4ZN0Qij5OUr0wiNsngAmhqOGAMo3j7lXXYJ
         S0UYc7/8yJyfE4/pP0GfsZUYAnTg4J6YyxKtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114550; x=1789719350;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF31rq5u2Ejrgd2GDHtEaw5FZnwlakbF/ays9ggaUPw=;
        b=bIBPM8GXl9SNGVlArQF9j+QF487RKiy/6z0rS0vE4ILAHUboKu425CXlknLTRpsX+w
         LIffr91bkndwKMF7wJdyvS9JkhYQvHzQsGwxJtcVMfEEjkfVsRKIp60SNGgIdpeUSQjM
         bihXWP9oWR4Z6W/RrmAScT1NGXogfrMmdWhjLygmy9NACvnI8eJ/12M1HtuJrar0cvSV
         7nzct28jv0+VvDNWwKkuE4+LSaBRbfhQQHegi6h14Nyz+NNJLhitKCTBMD5jtl2P8VeT
         HbCwYmaeaFQL4tYlzlBa6/9SdHcCg3y5SY+7HG1LsDkGsW8PNWzEIF8zCJtZ3IBp9iil
         /q5g==
X-Forwarded-Encrypted: i=1; AKwUvByFfJRoMuZfVC+Pz/fw2VoY/aX1NLA1kVdYzLbuUQ/hMvj1lmHhu5HyKJQiP9h5fprJ1XfYaYDPSu8ztpY=@vger.kernel.org
X-Gm-Message-State: AFuF++l/gHnoF96ZbAiLWzZ03IM9+0n4AlgInxgFKHQ5zeKDGiSadXon
	+BHnsUtUGzJzfl+d2HEZ4q3/SG/vTlSN/gfS27HXVM9uLZHxC96dPGhXmWyC/pi9Pxc=
X-Gm-Gg: AYBFou2NlXVhdtEMswOf9wjK/gagkuJacMdhYgyMUU06P91tDj98Ay4mWaR7oSxobL6
	Si6egKAaGgUZ+xO9NVV0v2PD5cY4csLFo0ua4TD2hlJ4R89iI72AXQZfAa0D0iQhf/ExV0WGWxn
	QI6gFMsqvC4hmyqHXuh8OUz4bfwfRMlM3rsEeaSwXKD0OwvzuLQ1IMzw+2/PL4K31g9TGShWPOV
	S54XvGX1CSUP1MzT4dLqkAM5mG1/OAr04X8A1g0Hiqsx7KWnCyNaq/jFks38HxJnBWUcZI/HzzG
	SMOPnrG8GQ2sARfKbDYhHBlKC2hsMT62h5XOrJb9Qmmx1lIbZc4E5jPzvbuwR3DVcRf1cDZ6c71
	tvE6cm/DxdQoXgGMfo9N7tzXYrcm9+1torkhHBMa6srBvgkyYOu0nZQcRt5cZC9wBLHOM2pkgXr
	TyIRkDQ6GU2OJ6xa1OprgJYNrR/wLWAuLMSnTZoC0hlSu+r/gTNencMSlRuSNO4sRiZkWfcxg1z
	6nt2Z/m
X-Received: by 2002:a17:90b:3d87:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39d9bd951ecmr5459367a91.10.1789114550542;
        Fri, 11 Sep 2026 01:15:50 -0700 (PDT)
Received: from localhost ([106.101.10.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm3534834a91.8.2026.09.11.01.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:15:49 -0700 (PDT)
From: kimwooseok <5mghybrid@khu.ac.kr>
To: netdev@vger.kernel.org, theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 17:04:46 +0900
Subject: [PATCH net RESEND 2/2] net: macb: Use all-frame timestamping for
 PTPv1 RX filters
Message-ID: <178911388671.25348.11008812384009904081.macb-resend-2@khu.ac.kr>
In-Reply-To:
 <178911388592.25348.177462085059763031.macb-plaintext-resend-cover@khu.ac.kr>
References:
 <178911388592.25348.177462085059763031.macb-plaintext-resend-cover@khu.ac.kr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

gem_set_hwtst() accepts HWTSTAMP_FILTER_PTP_V1_L4_SYNC and
HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ without changing rx_bd_control from
TSTAMP_DISABLED. A successful request thus disables receive timestamping
while reporting the requested nonempty filter to userspace.

Handle these two filters through the existing all-frame fallback used
for HWTSTAMP_FILTER_PTP_V1_L4_EVENT. This enables receive timestamping
for a superset of the requested packets and returns HWTSTAMP_FILTER_ALL
to describe the configuration actually selected.

Fixes: ab91f0a9b5f4 ("net: macb: Add hardware PTP support")
Assisted-by: GPT-6 Astra
Signed-off-by: kimwooseok <5mghybrid@khu.ac.kr>
---
Resending as plain text because the previous webmail submission included
HTML and quoted and rewrapped the patch. No code changes; the Assisted-by
trailer now names the tool.

 drivers/net/ethernet/cadence/macb_ptp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_ptp.c b/drivers/net/ethernet/cadence/macb_ptp.c
index 51659bb..2ffc46b 100644
--- a/drivers/net/ethernet/cadence/macb_ptp.c
+++ b/drivers/net/ethernet/cadence/macb_ptp.c
@@ -430,10 +430,6 @@ int gem_set_hwtst(struct net_device *netdev,
 	switch (tstamp_config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		break;
-	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
-		break;
-	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
 	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
@@ -448,6 +444,8 @@ int gem_set_hwtst(struct net_device *netdev,
 		regval = macb_readl(bp, NCR);
 		macb_writel(bp, NCR, (regval | MACB_BIT(SRTSM)));
 		break;
+	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
 	case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
 	case HWTSTAMP_FILTER_ALL:
 		rx_bd_control = TSTAMP_ALL_FRAMES;
-- 
2.53.0.windows.3

