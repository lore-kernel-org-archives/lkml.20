Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457439;
	b=B9EK3t7wZd11tGaT2YN4kF+9WbpNxv1Vjfgse8zJuu8sn1joTcjnat3MGiKckMXHnfEj
	 dj0D0daTC1E3zHdITA/QoQ0AX80Ogv1oqcby2nG44+1mhXsM5KzRqW7gvQkkfNW8rD8d3
	 FqPgjo5YfHzCbWIB2ki96jTs6eXmPtBw6vDx9i/boRLwW0Bc9febsgmXlqEJlod69cN+p
	 52LBruBtFumk6S7kfjHzETA4vRcJqHew1lEP+Y1Nchg5tnNnolQCLzVcz6mhY8usSkMul
	 8aIkU7syO/+vij3U53+xh5q2Sv/VTmoeeP6P0LSEUPfuNRtHXX/nnFTWwyZKzK6b0tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xzXprnWZsrl8hInvox3fTlIBkQxfMeeuam1opijn6BM=;
	b=mGUuCDK6OUh6dLtuPgH+9NeQiz6UZaezWZsmR2O9lZL0kojcB28E40zM+yBkiWPpgbNY
	 ur4+lDfBIi2IK5w2ZJgA26efoT/RihlePnfqt6qOP0d0FujswO417mMKu828VXA9sHOR0
	 020uGsHGTm8snzGKZbjronjBJ+TfdvW9hsBAAwT88QqjQN1j9JPElK5uCMBrGs++JMMOV
	 7ULG5aNEuWrqMIJXwJjg/PEH+XJucZK5VnUAUIYZBnEUepZdd0PDmNNXlFnGpo5sCmcCG
	 3Yh+BZWFQwm5FWmu1Do8NbAnY3Ody9BJCAXUaNVMZFukrH24R7jFg/AZ6xx+FQbp+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gHIFt8h2;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A01606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A01606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gHIFt8h2
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1319392a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792457438; x=1793062238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzXprnWZsrl8hInvox3fTlIBkQxfMeeuam1opijn6BM=;
        b=gHIFt8h2LONsrypiXfLyADfT94rkd3ScfVZkrc9yn7dEoF+vVt6HdUSRu6eXCd6QQy
         2l7jm6lNGfscVObFnTr1LxC9lu6KRRjUmjAPrrT34nMoqCRR5Hhndvl7UJ3lq0ICancP
         RLQUvOVoXIDIMueoOkjf7MBRlNllTmrmkreswF9/7QHMAupw1p1PQfkYz30iK5B/9Ex+
         TiX2tvDArGeI4SqKCnGugTY/Otih0cT5L6ikZnpyXanBv8inA3TuXWhqyHI7SMXqdpys
         XT+rv1eZ84+AJi8jgvITukF3dJ7ZKr3uz3OUV54ZBHjtrdl4j3dWMrPh02BFX5RJ+ZUG
         z/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457438; x=1793062238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzXprnWZsrl8hInvox3fTlIBkQxfMeeuam1opijn6BM=;
        b=UxRaXiX4gW8ogvqpVU3IzpZgU5B97dNbH/ueUDraMk7uVWfvD895MuUgMXxK9JRbBF
         IELOqMEJ2/pwCIkID7OzAFjqciVXqfYaBNylsmUez2SMunlrxR4GigzLeG5kzRRW1iGz
         gz+blZGWFrOl0ABo2EpxyPVi4ftLKvbA9B5bhxjWyA0BDjzkOX8effSaY0ZfGr6sD2hK
         bDslZ4+9McqmcMgrz3nvnBvya8IzmtTrUERz3Kj+fw+SaaAUCLbuZkYXNZgMckrUExtY
         y/aAraJEfbnSlFtG4w7zBKhOjxhrf9/fmssSUmQuidhNCvsBBc5DNVZ9IToG0bJunxbi
         hbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTKx2FA5tfig+OC51WZQatmNunThQ92vc0zLLg+Bln0fIxJU/l4QAU9KYP/YGb0jBrzmEMJHrmPSyYwns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHTsycElrBnf7ue+Fb/8cUBayCd1q4kpCpze0sDkUeKCOZ8bGe
	EXonioMINW/7YZqVXbnl5azOkv4WH0QNf73vdk3rtRNcKtgi1/rC7NGdf6Ivy0yhp8Y=
X-Gm-Gg: AYBFou0vY9U4I3j8LdBbVxc6ZuZwnVbkHQGP5YJLIzW1SrFoAHmXI+zsla0XlF/Yaez
	ieew+ESdwX/AK87ishUHhEMiO/A1jA+pdvU68HqklvvZFWiLu+CnuWJLfsBg9XbbAM/gUxAx158
	VFcht2HEwaigfuLEbuRsg0AikDXPF8DumzRPMHHOxdflMQqTkcatvcglrR2BttO1LzK8JoxvI7q
	j0sbirmjlVMy3ViZDeVoHecb4TZCJy3JUrGLTpZZrrovivCY7ugksp5Xzg772wqXy9j5Ly5h/RU
	pfzXP7GKF5r/Q1ptJ/ygYS0+UDJOCKgZtpqWtXe8+xE9+5xc/XlUQdmbBwoChszY2ZaQNHyD9mY
	wQwAu31hvUoUdwGRuhAcChCZenF0KIb+AFpro9BogDsj809kocGWuRrTPh0FdTiaKftopWo1gWp
	C37VUfEEbZhVJsSyXtCB7GY9q5I3e04k7l/VTPXHgIUYN1DdHyXrKaU7lWkp+XOCRr74Zd8ti4r
	fEFfq4MSaXQ5dSg7a1F6mId9+se8Q+ergNDpW2r7daed51ItrMfSK5y2Djufso=
X-Received: by 2002:a17:90b:57c7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3aceed9ff39mr7697793a91.29.1792457437781;
        Mon, 19 Oct 2026 17:50:37 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm8520499a91.2.2026.10.19.17.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:50:37 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 1/3] wifi: nxpwifi: guard the 11ax response handlers against a detached command buffer
Date: Tue, 20 Oct 2026 09:50:25 +0900
Message-ID: <20261020005027.1105121-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020005027.1105121-1-yhlee@isslab.korea.ac.kr>
References: <20261020005027.1105121-1-yhlee@isslab.korea.ac.kr>
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

nxpwifi_wait_queue_complete() clears curr_cmd->data_buf when a
synchronous command is interrupted, but nxpwifi_process_cmdresp() still
hands that field to the response handler. The three handlers in 11ax.c
store through it without checking, so a late response oopses.

Check the buffer first and return 0 when it is NULL, as the sta_cmd.c
handlers that commit 068986fd6f2a5 ("wifi: nxpwifi: detach sync command
buffer on interrupted wait") covers already do.

This is a local denial of service: it needs an interrupted synchronous
command and a late response, both on the local host.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index dc1e747383eca..7e9127ae2f421 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -205,9 +205,13 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 	struct host_cmd_11ax_cfg *he_cfg = &resp->params.ax_cfg;
 	struct nxpwifi_ie_types_header *header;
 	u16 left_len, tlv_type, tlv_len;
+	struct nxpwifi_11ax_he_cap_cfg *he_cap;
 	u8 ext_id;
-	struct nxpwifi_11ax_he_cap_cfg *he_cap = &ax_cfg->he_cap_cfg;
 
+	if (!ax_cfg)
+		return 0;
+
+	he_cap = &ax_cfg->he_cap_cfg;
 	left_len = le16_to_cpu(resp->size) - sizeof(*he_cfg) - S_DS_GEN;
 	header = (struct nxpwifi_ie_types_header *)he_cfg->tlv;
 
@@ -346,6 +350,9 @@ int nxpwifi_ret_11ax_cmd(struct nxpwifi_private *priv,
 	struct host_cmd_11ax_cmd *he_cmd = &resp->params.ax_cmd;
 	struct nxpwifi_ie_types_data *tlv;
 
+	if (!ax_cmd)
+		return 0;
+
 	ax_cmd->sub_id = le16_to_cpu(he_cmd->sub_id);
 
 	switch (ax_cmd->sub_command) {
@@ -584,6 +591,9 @@ int nxpwifi_ret_twt_cfg(struct nxpwifi_private *priv,
 	struct host_cmd_twt_cfg *twt_cfg_cmd = &resp->params.twt_cfg;
 	u16 action;
 
+	if (!twt_cfg)
+		return 0;
+
 	action = le16_to_cpu(twt_cfg_cmd->action);
 	twt_cfg->sub_id = le16_to_cpu(twt_cfg_cmd->sub_id);
 
-- 
2.43.0

