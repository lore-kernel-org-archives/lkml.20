Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5494B0E28
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395578; cv=none; b=ofTaKN7CNM3JXmlUmwCBjWKVAKTbXfqr9dqeFE3VMkR6SodBi34TNm9OjyLyaPsfCfi3czGsI1mYW4zBAcxbWnOp3KI9LU28LmGKKDKIZU7WPglusSRX7++nXe2eFTN4NSGkPIvrzIc/kW8rlAiElMk/snsDOWp2NR0JJi/YTGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395578; c=relaxed/simple;
	bh=uhtxMQ0fKAbNPofLk84gSjQ9sJxGeJ5klNaWx5ma9IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EJkm0xI1vzwd4kgI8KRT8CZP21RjCzxGI1pkFU1Uj2SafFryYG3eU5hLN2SqCSKRbsXrGm4CZylmpeA6imRl0qcEVLvW//0cv6qSLCBzAjUZEAdht+oFDZpROtEAX1OvM2c1mWa9Q0BGd2iJBm1EK4EAsupTe69UjiyMnoa4VM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=WNuV+NxG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="WNuV+NxG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53391022dc0so21322041cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791395575; x=1792000375; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d3zIfpdGBSQTp6Jg+3lyricoE8je8WFz2Mt+j1XHJNY=;
        b=WNuV+NxGTGt88QZ7mzjmoYdepj5/F/qfIa6lLZFPJ7LM8IvPfRyb6mIvqQATvqlhyu
         23u3ozWxdZ2OzgindQmBzP4+HYWK8Ko2bQTHmP+ownSH8fmHIi0cMzBilZWW5nvrkLpT
         ILcelfz5qp4iyIg7CPoDwCAkhtK6ftECHJQlF/iNjAjVEw2dpZqf+qH9gO+Gdk6InN9g
         gAqbXY8agAYJQWTXXAqcMZchSDuxaARzH7QVd8yeK+B3qOieyKP3SldevyOvf4YubKZM
         0WYCmY+Q8J1diw99Dod6xIeqgBPLohtWroBBCG8rgYyPB1DbkOxZsQCDTwMk7WMSSser
         owxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395575; x=1792000375;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d3zIfpdGBSQTp6Jg+3lyricoE8je8WFz2Mt+j1XHJNY=;
        b=bAX12OJM404u3dneaeC0vIzN8aWyYlxmPdQGDpnw+FnEz0ug8x6+ZeJsZEGaKJL0oL
         5fxYlvVidw/6cBN3PVe1yBYMbIWtNQGR0mnXyPiS2Jx0k0EaYRrup8cKf6iqQ46Ml+qG
         vKYE7u2Ehnc6tl/NlghYNaXg1ZcoVdcDoaBTS8SCJXi5ATGLptGh0LNDXJSxA5wd71xR
         KBJFcriVqUrIGjDwyeRfZZBRz6+59pBY1ZPiLA/cwuiAuVUbCPNE7AyuUVjtoe/mYThH
         RliBTwqZ/Iba+mmU3YdPMuUd1+bjSdKCBKzyNtI6MMWTkp+q0vsWTHpdOKzijBMgQQpD
         GdqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw17WEYJGbQtC9ErWCQKDI1ModHL4zP6STvLDf+Z8JMfYEq5c9RZpwph6ppKx5V/uEQt/ggkUn+W/R2NC0=@vger.kernel.org
X-Gm-Message-State: AFuF++nOp6bSQA3dF3pruG6E7xHSqkl0QOD0nickGMhuMTJoRIPCkIcO
	yUDO/43RAzTobqg390YOa0tjmVOBZPio7XfeRztimmnNe2g8Ae+sLv/jH9/P+8ubVZgsNlSgWnM
	igw6FLeQ=
X-Gm-Gg: AYBFou1t2FKSxr1pDjxNuOXZ79HR6ZkpSIldeaspqjdfA8obxhfwr90uGSXxd6IiirU
	8SfIlk0TCDONDPuePo1+jxvOJe7/3zeuWG6eboM9ih9uBpsZZ2j77iHYKrQmCYSR9AGQ2wRrPWw
	Dk+NXZ87q6KvyPIQkE8oZ7HbHhA0qZxeRxm2NIyDTevaCo7LD9pQlxE4e0XdWxpaQLa7QrE1vBA
	ZM0LHc7tv5t1gR8ftJtbJ2uEapQCgu5PiCiFBC78/JMfL09Ub889B4B7aIbR5OEKQT6gPKgb+m/
	+4S1j/+Slm5HhCNlprE3w3Nhv08tCFWGbP9s2OjZ/jyYQ+m4hXiznuvWlDu+PyV378+YOQeWRZL
	aGCn5TJGy+IN7fzix5XytGZlWsZjcbroSbLLJaNF+on6qLEqJtimQZUWFqNosKxqrEsPZHq4rNG
	bsdZzkREtQELp9j3lwVlUFh70/dSkyk1dj2fjp9IB6Y2LzpcTPFcWdy/Pr7nC2L8Zn36itynE4b
	CNVgQ3gpqrRlFN32kzzcTSKiw==
X-Received: by 2002:a05:622a:17c6:b0:535:1b18:202 with SMTP id d75a77b69052e-5357563d9f8mr47366621cf.16.1791395575210;
        Wed, 07 Oct 2026 10:52:55 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357211719csm25028491cf.16.2026.10.07.10.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:52:54 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:52:29 +0000
Subject: [PATCH] aoe: pull in the headers each received packet type reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-aoe-short-packets-v1-1-db5155f7bb9c@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIANyGxmoC/2WMQQ6CMBBFr0Jm7YQCFZGrGBdtGWzVlKZTjQnh7
 ra4dPle/n8rMEVHDGO1QqS3Y7f4DM2hAmOVvxG6KTO0ou0bIXrUEtVCyHaJCYMyD0qMc0enqTs
 OYpBnyNcQaXafPXu5/phf+k4mlVZZaMWEOipvbFHPUGtZ7/KvDtv2BY7wDHinAAAA
X-Change-ID: 20261006-b4-aoe-short-packets-f3e7d3580849
To: Justin Sanders <justin@coraid.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791395563; l=2933;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=uhtxMQ0fKAbNPofLk84gSjQ9sJxGeJ5klNaWx5ma9IY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QICch1SptbjdEqliDJi5bIfqQFjyvXfuQRQghFUUBpL14qU7EZUB++3LF5qv0bdlru6xEHz9eLY
 I9yG4e82eIAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

aoenet_rcv() only pulls the AoE and ATA headers into the skb head when
the packet is long enough to hold both.  A shorter packet goes through
unpulled, and aoenet_rcv() reads the AoE header from it anyway.  CFG
responses go on to aoecmd_cfg_rsp(), which reads the config header
after it, and ATA responses get queued for ktiocomplete(), which
skb_pull()s both headers.  Ethernet pads frames to 60 bytes, so this
mostly takes a virtual link, but nothing stops a short frame from
getting here.

Pull the AoE header up front and drop the packet if it isn't there,
then pull the ATA or config header in the switch arm that hands the
packet on, so each path gets the headers it reads.  This also replaces
the open-coded __pskb_pull_tail() with pskb_may_pull().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
Tested by sending AoE responses at a veth pair.  Without this patch a
26 byte CFG response and a 20 byte frame cut off inside the AoE header
each created an aoe device from bytes past the end of the packet.  With
it they're dropped, and a normal CFG response still creates the
device and gets an ATA identify back.

Thanks,
Josef
---
 drivers/block/aoe/aoenet.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/block/aoe/aoenet.c b/drivers/block/aoe/aoenet.c
index 66e617664c14..cd7c735bb43b 100644
--- a/drivers/block/aoe/aoenet.c
+++ b/drivers/block/aoe/aoenet.c
@@ -131,9 +131,7 @@ static int
 aoenet_rcv(struct sk_buff *skb, struct net_device *ifp, struct packet_type *pt, struct net_device *orig_dev)
 {
 	struct aoe_hdr *h;
-	struct aoe_atahdr *ah;
 	u32 n;
-	int sn;
 
 	if (dev_net(ifp) != &init_net)
 		goto exit;
@@ -144,12 +142,8 @@ aoenet_rcv(struct sk_buff *skb, struct net_device *ifp, struct packet_type *pt,
 	if (!is_aoe_netif(ifp))
 		goto exit;
 	skb_push(skb, ETH_HLEN);	/* (1) */
-	sn = sizeof(*h) + sizeof(*ah);
-	if (skb->len >= sn) {
-		sn -= skb_headlen(skb);
-		if (sn > 0 && !__pskb_pull_tail(skb, sn))
-			goto exit;
-	}
+	if (!pskb_may_pull(skb, sizeof(*h)))
+		goto exit;
 	h = (struct aoe_hdr *) skb->data;
 	n = get_unaligned_be32(&h->tag);
 	if ((h->verfl & AOEFL_RSP) == 0 || (n & 1<<31))
@@ -171,10 +165,14 @@ aoenet_rcv(struct sk_buff *skb, struct net_device *ifp, struct packet_type *pt,
 
 	switch (h->cmd) {
 	case AOECMD_ATA:
+		if (!pskb_may_pull(skb, sizeof(*h) + sizeof(struct aoe_atahdr)))
+			goto exit;
 		/* ata_rsp may keep skb for later processing or give it back */
 		skb = aoecmd_ata_rsp(skb);
 		break;
 	case AOECMD_CFG:
+		if (!pskb_may_pull(skb, sizeof(*h) + sizeof(struct aoe_cfghdr)))
+			goto exit;
 		aoecmd_cfg_rsp(skb);
 		break;
 	default:

---
base-commit: a3b346d7b1730db9900bb9e17f5bb8ea27e6ae2c
change-id: 20261006-b4-aoe-short-packets-f3e7d3580849

