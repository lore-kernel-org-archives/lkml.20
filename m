Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE535E955
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124757; cv=none; b=qIUv3+mhktpl2wJLsIHg2rcMQz+tG4kbXRFKlPTiVmwQgUkh6gz7kyb7TH1dSALc6BMV+GVw2fiSv2cwkINAuXmPjT3x7ykdOGK3l7Gx3b46Fqe+zoDEKOUXFTisMFfgAC8L2pnen1rEOmICIBeyoxGTPoAXygcy9zTBIKN/MRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124757; c=relaxed/simple;
	bh=p0x3i7T/RxJVoGuThfamGRwD7CghCOEP9gza4S5L3y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFw13jsz/VFduudzhWjd74vTdG8BCeRxvwsVYYA41uRWGndR0CQ0II0nYAnzipJLtTj17+bbpSHB4tdy8DpbpCoywdExeynaJ4oUWnY2barptJLcmq4i1VdW5jaRBwe6INBoLi4O0DK0nqzHKEDZVDStkz+g0MKmboUpTTdH+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Toefbp1C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Toefbp1C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a813079a55so447756a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792124755; x=1792729555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NjascJlmAL/rXDM10mAvnCXgy0lONG3ZAo9QK6lWOM=;
        b=Toefbp1CczGg27b4WQ3RSa0cWLW0g4jIndM2HFQewqxGYKOB3OaRprdXynJC5n8TWo
         13TYM6swIN5OYCXwt1yC0OVENSxinXkFr10agmmqUsnQf3yL/mnJAzkxjZMrcZwUlMT+
         gRAzNA5EKBbz1xEo4kfWZnMiXfUb48kdCOwM2Tq92hVtMnT1HsnLqggPRAldg/SZpV/O
         K57Qpyoqhy7XFUHnJGZi4AYBeABZGUjBEuI9tkif6g5aXQGTM3KjkslUvu+Q+2fEUYfc
         Amj0toRDwtB7zg1kEuattJlbxjS2hxFxS0GMO7vgtMMZwASZhSzz4GlCfz7D9D0nPXzU
         40rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124755; x=1792729555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NjascJlmAL/rXDM10mAvnCXgy0lONG3ZAo9QK6lWOM=;
        b=ebDh0qK+MOVhpRIfmD3xqVKCbmJK77u2yuUZ3HT9bJinCRdP8dTud9DOitM1iLPl/r
         KN33uCRB3bTcxprXLpyYXUGw2Wpx4ZWv6RrpIbPbeS+BhBLp5zgqnvxuRUHb8VEn0FhN
         +nn9d79MV4jacHZfJ9BXr/S1t2T6zRzuOlYDQ2WOE9hf4tIaoAUJX/TmB6YMRdnjNCB/
         wW78SAMRz8+D0ZYBZ7Z9/plsr49uN9fn+Yp0N1obmttPoUgSoGivD1C8GfGavL51af9Z
         jTvq76ktvYmtBRJs7JC+3nJJscN6XJnTbT1DGEmq3RsCgZ1RNThWgT7eMzNWHdG8IWMi
         WHKA==
X-Forwarded-Encrypted: i=1; AKwUvBzm5ylAZaH/sjl4fYBo4NefbYWUqqEd26bs6Z3ubBjeXtQXy6MbQm0PEMVnBo03mL8PLSdoVOs+knFeyFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2V5HBLl38iSlu9KWzjooGzXMn/r5SpL54gi1udCErndXnhE5i
	Q3hK0tnotxKAac42/37caAHUqrwHEJhh9xBjhNMKDcJWNRcZkBqpfcSZwYmNSV1MRBU=
X-Gm-Gg: AYBFou18qn8wHBZRUwJRiRcMeJjY25Z/aSvQrh9p253x6Rcqkmg5rFN2a0BH27kgy9k
	li9yX/WCvxi3i5p0Cj7PQKbMoHWYI1v1EqF2I9YvElHEKmBr0piMm3klch/Bg9TpEvwfnWYYasg
	UKn2MDi/ALGBGQWoDhuZeY0SUZM7H3tRbXoNFbTw1Smy2q7H+VZpaG2IRnJPJLJzQwhoTWsJBM9
	md1G8p4ncyiKkWo2gDQjKkYb5V0FMVaZ+FgcCVbszvwEXOEiWsLjz7J8NHpDwj2sxnjPfUyPEBs
	WL+cALfh6UNo0Fdhr/wtSANjEocJYqK9qt3XxORJk0nxCisaxEQ6q/brnLU/SMMsNS4h02DEOtH
	WNEkwjjj5Sr75hzx2klks5umeZnQFy03QQarw3qKbEUf98jnIsxNRxddCgRYEPZgGG3X7cDcabQ
	TSZ9uEZSWGvcxIDUrjJlvb5YNm33v9Qlnwsdmnz7ODtvxZGzCHQuFoZdqG8ApwR3rHd9lq8iXhj
	OWqvQ==
X-Received: by 2002:a17:90b:3146:b0:3a4:9416:a2f8 with SMTP id 98e67ed59e1d1-3acbb879edcmr1595043a91.9.1792124754870;
        Thu, 15 Oct 2026 21:25:54 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b761bsm424443a12.15.2026.10.15.21.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:25:54 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 1/3] wifi: nxpwifi: guard the 11ax response handlers against a detached command buffer
Date: Fri, 16 Oct 2026 13:25:40 +0900
Message-ID: <20261016042542.773945-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042542.773945-1-yhlee@isslab.korea.ac.kr>
References: <20261016042542.773945-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxpwifi_wait_queue_complete() detaches the caller-owned data buffer from
the still-current command when the wait is interrupted or times out:

	spin_lock_bh(&adapter->nxpwifi_cmd_lock);
	if (adapter->curr_cmd == cmd_queued)
		adapter->curr_cmd->data_buf = NULL;
	spin_unlock_bh(&adapter->nxpwifi_cmd_lock);

nxpwifi_cancel_all_pending_cmd() keeps the current command -- "no
recycle probably wait for response" -- so a late response still reaches
nxpwifi_process_cmdresp(), which passes that now-NULL pointer to the
command's cmd_resp callback.

Commit 068986fd6f2a5 ("wifi: nxpwifi: detach sync command buffer on
interrupted wait") introduced that detached state and swept the response
handlers that dereference the buffer unconditionally, adding a "return
0" to nxpwifi_ret_sta_get_chan_info(), nxpwifi_ret_sta_hs_wakeup_reason()
and nxpwifi_ret_sta_robust_coex(). The sweep did not cover 11ax.c.
mwifiex, which the detachment was ported from, has no 11ax or TWT
support, so there was no counterpart there to compare against.

All three handlers in 11ax.c dereference the buffer with no check:

  nxpwifi_ret_11ax_cfg() takes &ax_cfg->he_cap_cfg and stores through it
  at "he_cap->id = tlv_type". nxpwifi_set_11ax_status() declares the
  struct nxpwifi_11ax_he_cfg on the stack and issues HOST_CMD_11AX_CFG
  synchronously while bringing an AP up, so this one is reachable.

  nxpwifi_ret_twt_cfg() stores at "twt_cfg->sub_id = ...". The twt_setup,
  twt_teardown, twt_report and twt_information debugfs files each pass a
  stack struct nxpwifi_twt_cfg to a synchronous HOST_CMD_TWT_CFG, so this
  one is reachable too.

  nxpwifi_ret_11ax_cmd() stores at "ax_cmd->sub_id = ...". Nothing in the
  tree sends HOST_CMD_11AX_CMD, so this one is guarded for symmetry only.

Return 0 and drop the response, the way the three handlers the original
sweep covered already do.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index 96540914f3cf6..d15495a85d2ba 100644
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
@@ -582,6 +589,9 @@ int nxpwifi_ret_twt_cfg(struct nxpwifi_private *priv,
 	struct host_cmd_twt_cfg *twt_cfg_cmd = &resp->params.twt_cfg;
 	u16 action;
 
+	if (!twt_cfg)
+		return 0;
+
 	action = le16_to_cpu(twt_cfg_cmd->action);
 	twt_cfg->sub_id = le16_to_cpu(twt_cfg_cmd->sub_id);
 
-- 
2.43.0

