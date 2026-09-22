Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB2538D98
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075168; cv=none; b=pvhOwtxJAdIXiYnvIPvoFL97GWX1hd8wSr88kb8U2j1WQ1zCQdS0j3Vt2t7Q1kaNwTGqwB9y5yFF/hMvtu7nBoDyBoBBh51e3b8hyCtiqpmrhyxvL/Xxw3Ce+hVRzEVzvdQzlepl5MenaQHHmwC0enpuBxQ/n6Cs8r5JBN7Ct8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075168; c=relaxed/simple;
	bh=s/0O22UlvHKYSxa61UAVvdf6eqtjzPHamDIakwAoE5Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FWXtUvo6dMHVWwWNVAlm0iAfs/Dza/7Zbq6cuge9wEY8Gv7kRLVxblpaadJClAFtkrSUPz2N6aaBhWiw6/PQlvWNTytWnLBob0IFUN7ZVSJI+cRBNf3Y0o5Sr037yL90pIoljPtuvq0iuzXaev70zGYNzAmGOmTKfRrp2RxVcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WY1rGbem; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WY1rGbem"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so54739315ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075166; x=1790679966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=WY1rGbemVvteaE/3BhtWu7EVmN6LDsMw5vRyPU7xONN3QZ5w8FMRRxjeFENfk1/SmU
         +aohFLMK/p2Lxb12GX4Q+NW2WbigXoTGWR9Ym6cJkdJdW63TQc7rXfaCB9tZ+7cKAeBd
         MEQePu65OtnWFP6v43/hrE61BrjVJsWb7sTXkX0jmJgMInkCaMwnmtYg6yCNaB8TTFnn
         e/PTbzQhFYZECylMksKtctUb0prjO8bIh0jVKG/VvpXz/amGB6NqI8FxQH66cg1jBeuj
         mqxG0InWzb9DtL7PLB+SAP+4a1KBgdIK6E09L/4yoPilX7alN6qAsF4aj+XO9qqwO8Hz
         Qvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075166; x=1790679966;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=zAVOxHm6L2KQM3OO5iIwmKES6Nh+V+ElGmhkPFqR+0e6DNwXwUYs1J0/dayvraFjA7
         69aN87KyeCeG9mLD/0f47kzu/mxxGYagt5v00Ek0H1bNSSCrC3Rrvtxnz0n45ZzVxMfu
         jhTe+s8AU1katcR+9mNmGbES1FmdbjTCnwy58bwavKdzGYUtLN4QidBrA+wN3qKX/w3n
         9ylTiNhzVrdjTcJGMd/Q+GXonT9tTMkoBpxmIjgVI4BIkw3MUwV6/7wop9goslyfXaCw
         qqRV8HHI/XZaG6AWTwToP4+sBz09nHy3lI7qYoL+xwlyfsCd1bFEj9/UX02b+0gKMs+Z
         fI3A==
X-Forwarded-Encrypted: i=1; AKwUvBzw4fQOoM4/NvsEQN2lpPVyuN145CyVwEMKR0KoiyOUXKsdTHlmERkN2Yf3sGgemv8ykVJZybvzVJI7SfE=@vger.kernel.org
X-Gm-Message-State: AFuF++lu2F0AFz4WLTqAWF1xlA7qkNaVhNN6sZyj9twr1+oT9eIugVJa
	gxFt4UyMRHtEi1pBgZ356kqfUITiaWq3xYr4F2KtYY/2UmnyFsONUCOcyE33xTKn7gWk4nGISFV
	h
X-Received: from plw15.prod.google.com ([2002:a17:903:45cf:b0:2dd:b2b9:91a7])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:984:b0:2d9:438e:b70d
 with SMTP id d9443c01a7336-2df609b194dmr9585075ad.1.1790075165400; Tue, 22
 Sep 2026 04:06:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:06:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922110601.1959213-1-morbo@google.com>
Subject: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the "configs" pointer field of "struct
tegra210_clk_emc_provider" with the "__counted_by_ptr" attribute,
allowing the compiler to perform runtime bounds checking on accesses to
"configs" based on the value of "num_configs".

The "emc->provider.configs = devm_kcalloc(...)" call uses
"emc->num_timings" for the number of elements, which is then assigned to
"emc->provider.num_configs" before any accesses to "configs". The
"num_configs" field isn't modified after assignment.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/clk/tegra.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3650e926e93f..f1034e14c1a4 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -170,7 +170,7 @@ struct tegra210_clk_emc_provider {
 	struct module *owner;
 	struct device *dev;
 
-	struct tegra210_clk_emc_config *configs;
+	struct tegra210_clk_emc_config *configs __counted_by_ptr(num_configs);
 	unsigned int num_configs;
 
 	int (*set_rate)(struct device *dev,
-- 
2.55.0.1082.g2b9226bbc0-goog

