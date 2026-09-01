Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B6339383
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253777; cv=none; b=tB24eRTbE7LSmy1tMiXq6dzuAAAd14FuEkepeRGLi6jpFVTUetW0N6qmObc1NG+fYxWPQbw3UEqpFYcUXvvPOSJeh6ucDfMna8Da+zE8mJ35w/Gle9qyQhbTlmxeuirzHNjnCH9V/PgfzlBaTYEzduIUne/DorTCqzHeYSMvhtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253777; c=relaxed/simple;
	bh=5CTW8T/SpDQx4JzZBtps7+Yl+CTAibFCz311cgv/i+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjWe4qCWq+g7CICDoUgPYHbWZ/e66H2uV3qIvbvyZ9iqlcmnSDbxWuMHU1GQJIUx/Ki9JOMp7Z6pPWzMwyZ/AUQP8ko4/mv7KtZDQEntQWBGoym85XsEpxtbBFqXTmaR7Ni8L8Xv2iOwhndBi4izbZTmKhfsqDZcXbRF2Ys0DCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qs77gbQj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qs77gbQj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48433e9562bso485588f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253769; x=1788858569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=Qs77gbQjzrU0BsvTzTzf9mNjalnGkzbClUFQVBBidj+3ay3koDqn+5DpNWbNe0wUfH
         mQjGnz9921N8EP9aKtz/xjvXkXq+k9IzHWvoD1omVsXMH1HZzjMG82bq2PTxodj67NDH
         AG9ikpKjNIPYtJL3rkMl0DmCPI5SNXXX6C5kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253769; x=1788858569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=aj83zs9w6xU+e12Kn2Vq3CMHlAKx0Abvm7xwm57OJ2iPHtVR6sWdtk0N5g7zWk6m+y
         /ZiCzFM3vbyX92VTCEmR0dWpjywie3MbIoNHNQ6zAKR6JJ21vB/IrhULmk7eKOZndfvs
         76N/920RX3QQ34b4Bcn+kLyrdYFl98mq+XixmXKJEt1Mf/N2qqI79ZQPKruXfywe9cDL
         YpRzTvw+JDkxwSspu7Yewft6xHMgvVkLY9bkmCVLTdNWKBBwkD0bFv7O8+qRC3GxADQB
         q06oyQocxpz8mwmFSigKVl+EvOKxj0lMHEhI9nfsQBgPiKSwMru+2Yb/2rGR2q4pOqo5
         gDEA==
X-Gm-Message-State: AFuF++nJAUhWhrVyRHrJCQZyjoaaPOkWRaYHYyRlosOEUuMFKw+SFPTv
	Z3wcCnfQ+P3QHI7v8XLsRxjFA9R1s0lWwcQtV1EV8zbBsCRFtU6OMVFGLjUu+qQIr6VW9kdcaPz
	AxgQvwx0=
X-Gm-Gg: AYBFou0fWcngJ+Yb3iUX9mPGI+4DjNwGaXQSaPkEqAO9MsB4UluTxxkFLTEWaO/+ZST
	goqI7DaUNJDhvnJKvk0yl8btBQ4PkPVB5ckzg5D0lNFzd4JJ0pFgKA8bBdtFBHDoMue+hLeQK2j
	wA3vNhiPOMdQfzsn5vkr4ZqzUPbaOUyPIYpTx0dJ5iizT7PrDE1iCMDi4qocDzSxEm2z4Tr8l/Q
	nH4eLiaQsXc8fDVlVTJYHVOPdLLZVcV00XrXxX6CWQ6NYiR++pv+f2vuZwh4ERhkOunli9Sy68K
	5nrNtuuWYwo2oPHO6pkTI6ay7f8d+tbI1Yl+Tke7Db7nHRp3wPva5nc+CgxzdgdV9k+LBrjz6Qg
	V5aIrkaV4q0gjLGt2WRnQOfdSHOHpbVaGSYDKPsTz5/Zj/HxMcn1mn2l0bzwWtU/l5IvZmZX5yl
	2GB9wLDEAQ3XSLP/Me8zoYJkqkbtpoWldhzHcpqrtsI2o8Nmxa1VHLrNhuCsX7Y+XulEs+R77N/
	5j/FVyo7jTIG2ALxGebntlhZdKtJJuOp4rwBwLWsi7slnoq6Sm5zBA9+598rsIs3YihXiVN3Rzz
	uSU3Xw5TPFkKa9/p4e+M6YUrUbFbVX36SD81V38JTOmI/ExkLt03sOffBpYW9MmHXg==
X-Received: by 2002:a5d:4702:0:b0:481:bb82:3f31 with SMTP id ffacd0b85a97d-482f79db522mr40181489f8f.10.1788253769303;
        Tue, 01 Sep 2026 02:09:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 1/2] clk: validate spread spectrum configuration
Date: Tue,  1 Sep 2026 11:05:17 +0200
Message-ID: <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread spectrum configuration is passed to the provider's
set_spread_spectrum() callback without any validation, as clk-conf.c
only skips all-zero triplets from "assigned-clock-sscs". An invalid
device tree can hand providers a zero modulation frequency or a spread
ratio above 100%, and each provider would have to add the same checks
to protect e.g. divisions in its rate computations.

Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..208caf60eeb5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectr
 	if (!hw)
 		return 0;
 
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_UP:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
+		    ss_conf->spread_bp > 10000)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	core = hw->core;
 
 	clk_prepare_lock();
-- 
2.43.0

