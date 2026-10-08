Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D848F01F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503085; cv=none; b=OkPnWgK/Vc/vQ1A/gyqMC7ECO19lIlGFzqjPuTgBVRzLSBModf1yzRhZ6j3LDlKIeWlmttWjR3NmFbp3UNtAYYbxc9k3kOvnymv+YK2OQbFmsbAruAbMX2uCJiFmz+c1s6IBABW0uFBdNkNYhIZdr9aDVoywTzqB5z0PTgOSqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503085; c=relaxed/simple;
	bh=BHUASAgxdtHe29RtMt9rZt05kgR71uPLGlvPp+uOtC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ1KqTVFfhU6jpqdtNcLtQ0bV0A4X/gV2MyJzGqEbfzU09PtT3ImI6E0GQo1QmLY8/8Qq85iaD1g7klJ54lw/zkQEYnYanXd/X0YYTkRRxW0Q0o/uk1TsA+TTEvCUrjO3BSBU0dSKg/Un3WVMbaRm/7vGS5D15wG50xeMzqMNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=lWymsV6u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OHDxTtup; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="lWymsV6u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OHDxTtup"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AC0647A007C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 08 Oct 2026 19:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503083; x=
	1791589483; bh=R3ykc0Tb6wEXssxLherpafpiw6nEuKSHBeR/h3BcDbk=; b=l
	WymsV6uyCdD2r51SdH70pOCrdeBpwbsabTf9ErBVm0WQ+D5sy/tgGlodV+1ZqIZK
	NMAdjs97cTKooiu1KqJNkflLK84495xGrMiQNymZlSq1n6bsPs3jxjtTX5ldyJKI
	+2NIg8TZtHsPnVqRUUKTSpx8B1HlJLXbBUWBg9oB4eMcRNEjvF3lI+2HkWC80fKG
	4gpuixZ4P8JhjOpicLoCkjMXrert6X0hDh1So1fP1cmiaLZZHsZedPZzqIcJfYzZ
	xY4BteEDrjL0kqrUiEIATCtq77diYD7qZXZ+8ggOW5b6xu1fyb1jMgjHzUSptgbQ
	ixnVQfCbe7V5Mo8clgSvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503083; x=1791589483; bh=R
	3ykc0Tb6wEXssxLherpafpiw6nEuKSHBeR/h3BcDbk=; b=OHDxTtupt7Ta2jqUW
	bAse4ZCZz19Av9l4MLxURH2t4q0z2hclCRicuRk8Q7KgNXkzfz9KjpXHPhIEs4Yi
	fp29VeVTHf9ndXU8TGSTEXpkHwP3+2SKWjDKG73mv4YQjjHc3vf3gekPtqCXakjq
	emEWapKYY8jua8vGarevB0IX3MlDNgVtsARZZaseHpKUWeF2RVS2M7s+UBS88fGj
	BEwC9lRuvir3inEJV4JzWoOK2Wd359OlKMqMRR+RU6OfCrGXLsynZapBsNh+OLFJ
	1J7O3UOdvxaaLlD/rlbbHmriBGeWsIgMZ+UPZs7tgZSLWtG7E1K7fCIwMzzi/fWp
	SpYOA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503083; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:sGn/DH+bYMG4tVA3n5yJvuOTnwHfDUt6meHqJ5dF0lg5Z2u
	AduEcbei5+uTBVcF8EvOQe0j9+u7RJpSJK5ne0hwyBx7cS+JN4M1978ONqFEJS6w
	TEumWUNCfddRoYeJ/srS9gCRVLYTbYQwqaVJf/QhEU5OJPd+SKa1f58h5xyp1mSK
	pA6oENYNs71A6kTgeKHze36zVR4QRrFMpI9cdNcfrMzU32NvUNRpj3B8Uf88RwZZ
	HJ4D3g/exG3w6iuNfXP4JwBAkfY0XWwgcPtq2vs2OcoPwOHkz920gTBgzg+EIr0T
	h4fnFwrxfRbF8M43n3w2Hnh11cCwQPrgSHqdQ3g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/PKXYwDp3OqTGVDw+0WYaVNVgJ0SPmLJ4rW/8V+b2ZA=:BHUASAgxdtHe29RtMt9rZt05kgR71uPLGlvPp+uOtC8=;
X-ME-Sender: <xms:6yrIaonkCcRnezjvJmvb8oTgLBFGZeEu4eQwbB0SBwtwH4b9Fy3ElQ>
    <xme:6yrIalytr_-bf_M2jTvzhjkB1RdLd3Uq4PJ28WKZ50tCvO225OEVcffVVE8cwEIG1
    7oNIzEJiAxmtpcyIqbfEe7uHWraievJeLBwcbP2duSecwXAVbj1CxYB>
X-ME-Received: <xmr:6yrIauP1Izar7NaCkc9J7qZBjYn1eCmCyl02sT9PXqOJUQWJ8VzKs_MWg3fv7m9YuYC4q3OC6wAYaBX4z7W_9cI06IR_S7L3vdW4eWmdzkpnUQ>
X-ME-Proxy-Cause: dmFkZTF7JX0JG9MCEB13OqpQL9yUnaoAfX2M5Vmh4LONjcZyW7y0/PtL9bJ43jIUGZwkTn
    kMkWTAZbL4siLtSAWA5uZY6IPs+EMf4iOQSNvCVaDHfg7AcWi/++fu9fdOZ0YLqax8meNt
    FqWDfhQtRuC1g4SrDlQlyIlR26k9x6WmEVt+QHruT2EpiOkonqxpSddqcHuGX5RyiqAn5M
    3xnSNQLFOP0P4OHEun1jefGJIBn1ho4euIOWkmuSdWg0D6kOxmPgyL+sATrY1RBuVRqNjR
    Um3IRKhNWGgbBkorkJtu8kngSSHz8XeTJ7fU/HpZ8c16322jmbLQRakq0/3kziBsA7/upQ
    yQzX2fsMjkIe9eXKGCOTRpAqvQbtJYeq+QhKcdO9aDGsaNvm1q+ahv4ov8I0uataQ6UfqA
    WYzSINZzj1X55U1/2hjkUWXePoLKO9U5MjwqKFheRVlTrJIa6gDetZefaVpCq6K58VrT+5
    yrjlYMDhfj7vNVTVXP1lmqMl8Q3yL1CXJ8RdHTK8HfAVW6pmmwiCojOhNn5xQMNMvJCuJl
    ITQ3/jBtfJT89FftLyOn7tW7fO2h2emTrrlzS7hMpgty0aNcIMEeAfpTOHxs63A9qqIf+M
    YbOX5GeEKdml26ntYKfqGR5gV5IWOylUAWAXdnE0unhdCtMt409iytIwqKMA
X-ME-Proxy: <xmx:6yrIahSPFYEpdwZ_07pPYiWkk7NA0psZfqvrxsPFXAme6YM8Jfc_WQ>
    <xmx:6yrIakaWvm5k1phA5Xm8VuDBXmetePGT9SxpHCV8cAg3rPyKG1gApQ>
    <xmx:6yrIam3XglDnYbvSEkCXrFY3wPWYGHilBaDpdm8evoMW10hXfjri0A>
    <xmx:6yrIasWvOyhAyRnUcRLB2FEumapamrGjjXko_Xspd2kbEWXb26TD5g>
    <xmx:6yrIai66S8S0h3zgwTmIdOEXUR8triXFWu-fvx2uBe86i3vAOGBetzrW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] firewire: core: use sparse annotations and lockdep checks for topology map lock
Date: Fri,  9 Oct 2026 08:44:30 +0900
Message-ID: <20261008234432.251412-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects the topology map from concurrent access.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-topology.c    | 3 +++
 drivers/firewire/core-transaction.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firewire/core-topology.c b/drivers/firewire/core-topology.c
index ee6b54f89859..512b7e4473af 100644
--- a/drivers/firewire/core-topology.c
+++ b/drivers/firewire/core-topology.c
@@ -474,9 +474,12 @@ static void update_topology_map(__be32 *buffer, size_t buffer_size, int root_nod
 
 void fw_core_handle_bus_reset(struct fw_card *card, int node_id, int generation,
 			      int self_id_count, u32 *self_ids, bool bm_abdicate)
+__must_not_hold(&card->topology_map.lock)
 {
 	struct fw_node *local_node;
 
+	lockdep_assert_not_held(&card->topology_map.lock);
+
 	trace_bus_reset_handle(card->index, generation, node_id, bm_abdicate, self_ids, self_id_count);
 
 	scoped_guard(spinlock, &card->lock) {
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 0c492e4af971..4dec03340ae6 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -1263,9 +1263,12 @@ static void handle_topology_map(struct fw_card *card, struct fw_request *request
 		int tcode, int destination, int source, int generation,
 		unsigned long long offset, void *payload, size_t length,
 		void *callback_data)
+__must_not_hold(&card->topology_map.lock)
 {
 	int start;
 
+	lockdep_assert_not_held(&card->topology_map.lock);
+
 	if (!tcode_is_read_request(tcode)) {
 		fw_send_response(card, request, RCODE_TYPE_ERROR);
 		return;
-- 
2.53.0

