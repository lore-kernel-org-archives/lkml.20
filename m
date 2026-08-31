Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DB53AC0D9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155199; cv=none; b=LRbjZFhMd90pH1cdcuHq3tOqAyY6atYFLWT9HAFSEQ1lImg/XCwwozvZNmJyzEAX23SGnIF3P0AtUd/iKiqsxcf/xi5V+GypYnYnM4fwEgNWnZlbF9aHMxSjhkZGJZOTAiC8XqHq1vcaAbqMsJMj3lkyZoHLn3xYsxwrahkST9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155199; c=relaxed/simple;
	bh=2SIG03l0reg2VYns4LMyRg7qlZrAz5l3My7Xpaw8Q8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grGP2jPmYJbEy6c8o352pIO8dRWpQxDUZ35dFIlToZrZBcTr8sR1CrV7nIFTggEekUSbyKKWTKzN6PxNrd/Cn/oOj8s7BguggUkZ0c2ntjnWrnmdlVH74uI1boC5kvRlP+EbHc9G7tQb9yj4IigJ/vLqasyg0mxorm1kzUNUS7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPmhisgy; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPmhisgy"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so2080886a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155197; x=1788759997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7Yz+YOY2+16/lpuKvY5IjxeWag/EA2jCZBiex1Smc4=;
        b=qPmhisgyP+ceBJU1xMtDo6lJsRJpP5sAhAlChfH0xJHFQ13gfpM7lC+bhR+tjHRe6m
         Gg6gyohX3r2yeqtp9Qe4jB7jVxncmR++VUX2nvFVbPfF2bo6eIhF0g/uvgVda5lai6tq
         Dg2/zZEYwX/nFeKy5SRmpF5Pu2qvIhRUsSXy/gm9JhlbTDflxTPSsj6IDC9qGKqpU50G
         DyRYj8X1bPyHUtz70J31f43Lh96T1gKP0mqCXzRZqVkpvuJlg58Cz2eDiSNiRDg4XceJ
         jvR4FBgpTDtCPQw9BU2o8dqwv1e4FXA/EbHM+hcGmi0V1V/XXllCLrtKwly0ooh24JAN
         SpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155197; x=1788759997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7Yz+YOY2+16/lpuKvY5IjxeWag/EA2jCZBiex1Smc4=;
        b=ArlxmV/fFz1FZ8/2lNMXJmWuJxIblyPMB+wWcB9O9LlcY+hlNCvtl5IVbYcHCOSWWh
         jyGP8N7fCKGJrRywZhAi42Bsd+E9JhruuALmrAnZnQKIeHnIYLXgZGdKWSh2L97FWszP
         0czUMBfnZre5QkR13GezziXudLJUTeNeZZ9oGL4tk5JVQbb/mjmn+I3cjl3/zunEb0jK
         bvQS7R9zMKa3mtz4URIaJiEEnN7MZN0mv2OUyg/FfpNqh/MLtbDNKeEUkXHq2/c0DoQz
         30mAMB/HQDQ/82EKKYQD86LOu/nNIq0n7NYoAGYilTO0x+KoD8qC8Tegi97ojqfEK+MO
         1myg==
X-Forwarded-Encrypted: i=1; AHgh+RrKp6/I+AVaFRYAilQTrHmMscIAUahkx6expv+D9bbooa6Uh5AW07lYXsJu7R+Hc9BaPUV84lNN+kuTvJk=@vger.kernel.org
X-Gm-Message-State: AFuF++nmjKAPIb2P0q8ofSaCi5W1gFp8xc6QbGKaNwSDQvf6dIs78dFC
	rF9OrSOhoR/H46+I9I4FdzCmirRLblY0i05cM2/LnrZL48ONUWtPJLUZ1gIpTB7D
X-Gm-Gg: AR+sD13Vl3bkMStbDLwj5x6uoBzTAwQHoBugIhGCvnYy5gkB2civyvEIQiEFYhOprJR
	8YwKICG8uXEXJWxTMY0/LkmuXFeziohsHjj26bPj+ZBpSzDuofGmUfT21af47GQkHn3xViSjqPb
	R5SHUpHng4xDuzJn/W2HRS7KCLAkBw6w8vo2nkAbipyAj/Wd0K86gyUKWwRbRtCgdpX/v8hIDsl
	EggtpiTBO7db1rkff5dqZhSvXBBgTjuTwZpjPfsq/aNfJTFaBRRhF85SNaltyEy/Gv3RaaBSXGY
	XqQRW8uc+0U9OQl14hGb+MeIZ++/VVb3jYheOYlR4GRWzIvaKOlWdVwsyaQzn8m+dNQ2+10RqZc
	z87XC64picMo6ntZ39gRexk4u5iocTOwDK2zuDqTs6v44sf/2rOK8SZsT+VzPIqwjCNhgWULbL4
	jh/8BbCxJt3rnUSCAirKUxZ707Cm1XyjLTh6pKeAvJMFh7/NsL7LNnOdmmtA3wQqeWL5HGCm8PK
	tzYDPdXyuJU2PAJnI2hoxrHpW4S8EVlS+WZiCF7c8ccQodg4lnN
X-Received: by 2002:a05:6a21:a08:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3d5d7187981mr5135057637.2.1788155196875;
        Sun, 30 Aug 2026 22:46:36 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36aeb7esm3642714a12.15.2026.08.30.22.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:46:36 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: netdev@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Stevens <dlstevens@us.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] vxlan: use one headroom snapshot for neighbour replies
Date: Mon, 31 Aug 2026 14:46:14 +0900
Message-ID: <20260831054614.2069896-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_na_create() samples LL_RESERVED_SPACE() to size the reply skb and then
samples it again to reserve headroom. A concurrent vxlan_changelink() can
update needed_headroom between the two reads, creating a TOCTOU race. The
second value can exceed the allocation and make the Ethernet header write out
of bounds.

Snapshot the headroom once and use that value for both allocation and
reservation.

Fixes: 4b29dba9c085 ("vxlan: fix nonfunctional neigh_reduce()")
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 459f19f7071e..e5a92d30113c 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1947,13 +1947,15 @@ static struct sk_buff *vxlan_na_create(struct sk_buff *request,
 	struct ipv6hdr *pip6;
 	u8 *daddr;
 	int na_olen = 8; /* opt hdr + ETH_ALEN for target */
+	int headroom;
 	int ns_olen;
 	int i, len;
 
 	if (dev == NULL || !pskb_may_pull(request, request->len))
 		return NULL;
 
-	len = LL_RESERVED_SPACE(dev) + sizeof(struct ipv6hdr) +
+	headroom = LL_RESERVED_SPACE(dev);
+	len = headroom + sizeof(struct ipv6hdr) +
 		sizeof(*na) + na_olen + dev->needed_tailroom;
 	reply = alloc_skb(len, GFP_ATOMIC);
 	if (reply == NULL)
@@ -1961,7 +1963,7 @@ static struct sk_buff *vxlan_na_create(struct sk_buff *request,
 
 	reply->protocol = htons(ETH_P_IPV6);
 	reply->dev = dev;
-	skb_reserve(reply, LL_RESERVED_SPACE(request->dev));
+	skb_reserve(reply, headroom);
 	skb_push(reply, sizeof(struct ethhdr));
 	skb_reset_mac_header(reply);
 
-- 
2.48.1
