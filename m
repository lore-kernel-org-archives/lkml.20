Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672D33374F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905624; cv=none; b=cFbeYMCEPoe46jZtBmu3Tn9meyM25O+6yruLaIbMIHqgpyc8Y4np1gXUtkHUv5FfHfdzxrK905nBkcWzw94bP3gI6aOTPAFi73egf71VUdqm2jP2G6RATPr57PS1UaI4xt0WvP6J/ma+3aI62L883dJlg2BVmcWzYbqtTGnTtcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905624; c=relaxed/simple;
	bh=QZFJXRs1jIa3OimY2eXSnENcNcpAutvLWIfd2OrCWYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oe/6xcNrdUoWYcLZnVIsB8OjZs/fwBKg8kQ7G2txfowod6EjIDC/COafu94INr2UTKJRE+ESqk827215J7Tm3kd2glEmgRTsT7/IQZO8cyUAMXO6eRWrGz/R9NFLwyenC99yDhzbP5EMcYpX78rHgvub6FhBatCVWQZQemGyJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgIX6WgY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgIX6WgY"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so19279245ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790905622; x=1791510422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hciHQRxMeIGa14gCuOC6EyPzdO3hindKkdEkIypeSbc=;
        b=sgIX6WgY0OrCBjgKaGvD2fAUFitASBRy25F+emIaR3qXOEejHnTlvRlDXFrafGdLsP
         9QcemdRw81jtyAy1KeRCwPX3r+quyQVUvC+5sVjsavNf3npaC2P6k7SjzYrHrumn4Isc
         YzCFkh14dCbBo/UrXMsQX8Zwx+kHqhDQEzo0No3qqe9ottoNTJwRWdT068Ny4dlldLbx
         3aAC3SVDVGjXo/wqOFuwWWDIOBdsC7b8pNlU2Hh/3+QNA26HrUYzsj6NWxiZiaRMEmRE
         g/9c3JcKhtAG0hH7aRm7F5fDwpTcx9wIZERBkLXTY8nTtJS99sj2l9KbDkorhTUu39Ud
         Ak6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905622; x=1791510422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hciHQRxMeIGa14gCuOC6EyPzdO3hindKkdEkIypeSbc=;
        b=cS/i85z2RVnXYzJUYrQSkafx3NgHfOaQsy+x6SG7sdPu+CZQ8iwil4eBGHJmydhX+/
         p3HnBzl2yk8O+DX1XJlKCfxq5FGxBqEekCLusUcGyOm8XLQH/69L0oEXAbfx95TwrO7w
         Zz2TYATOFJ4Ti0uMw6pRZs9jH2E9ZPJNsnsLeItZDN8VeOkzMMO1nPzPfXxoWPK0qJin
         39Wct2Luix1BvXfEU1duRcuqctzih9AyOndjjebipCHKufCHKuCmQohZplrLps4b/F7d
         0TgXaJXQtOoStB2hKjyEQ8QNPNvB6l0r2z3JzPb5Zo4mDCxYZfJtPepLsFHrYg+1HFYS
         Q3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBy4LsC114xNUNbGgJF3Nax/6W8Ouy4cugrTV5y8rySLFSwA2AySRlCwXHLr3s3GzMZGeWgxef/zBISIgNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4akkqdpfVGeiMJoSLB3EtQtZriBvHXZMwqcFN6R6nBgvRETjQ
	hdiNir8m907TOEDf3OaGVUiU4NHnxvbcO3LZlvpb0iBV5YYmxVNBRoq/
X-Gm-Gg: AYBFou0/JfYe8TnPtU9MqJttN68D4Cr8Men59J8tZZa28Yc67NrDuDEEHN5glbAwGO5
	+jNGAmBVaOWX573qPwn0PBVwG+UMFdjwQ3YMiaLVWW2MTbmq2et1QjCPvNw9+A3TYyC1XR4y72/
	SWeFDT6HQnsWrGEryiuRVo18dbVtgByn16Ss16kxVFKxfFY/Y7WjNKY4ADS8qP6frCQpxWpKjyw
	G08cEkvRX/P3B8FU/uAyHZS+yDIikoD4vAXvGy/GMUugegXQfyNhL3izJchRkgdZMY0lMR4tDcH
	2qdBa0fTQuIFqGmszo30DmGJYtq+f5cpjDUYr5rJxNUDzXY0s9ATAEcO14rTFYEr3Iz0WcXiBpv
	MzGA1tjcHNRvko2uBHWfYn7zLLDd5mBskMDysZl/jX6OBQRMrAq9KOcFDjBbfNLPd6050nhTLGQ
	tps9Xi0Jj1QvJaCmufX7DJWCF06MWbikRk0UqkMJAH3+VjWZpk2q+SoskOwBcXju4lYw8MTSvmV
	PJuW8wryJuBk5A/TZxw
X-Received: by 2002:a17:902:b7c6:b0:2df:b004:df28 with SMTP id d9443c01a7336-2e49b6d3835mr5095015ad.35.1790905621864;
        Thu, 01 Oct 2026 18:47:01 -0700 (PDT)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ceaedsm2675645ad.49.2026.10.01.18.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:47:01 -0700 (PDT)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	johannes@sipsolutions.net,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v6 2/4] net: wwan: t7xx: do not exit the TX push kthread on resume failure
Date: Fri,  2 Oct 2026 09:46:36 +0800
Message-ID: <20261002014638.47981-3-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002014638.47981-1-tim770802@gmail.com>
References: <20261002014638.47981-1-tim770802@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

t7xx_dpmaif_tx_hw_push_thread() returns, ending the kthread, when
pm_runtime_resume_and_get() fails with anything other than -EACCES.
kthread_run() keeps no extra reference to the task, so the task_struct
can be reaped while dpmaif_ctrl->tx_thread still points at it. A later
t7xx_dpmaif_tx_thread_rel() then calls kthread_stop() on the stale
pointer, which does get_task_struct() on freed memory: a use-after-free.
It also stops TX permanently and silently.

Log the failure and retry after a short back-off instead of exiting, so
the thread stays alive until kthread_stop() tears it down.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index bd6116a8c541..2a405bc74312 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -447,6 +447,11 @@ static void t7xx_do_tx_hw_push(struct dpmaif_ctrl *dpmaif_ctrl)
 		 (dpmaif_ctrl->state == DPMAIF_STATE_PWRON));
 }
 
+/* Back-off before retrying a failed runtime PM resume in the TX push
+ * kthread, so a persistent error does not busy-loop.
+ */
+#define DPMAIF_TX_RESUME_RETRY_MS	20
+
 static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 {
 	struct dpmaif_ctrl *dpmaif_ctrl = arg;
@@ -466,8 +471,16 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		}
 
 		ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-		if (ret < 0 && ret != -EACCES)
-			return ret;
+		if (ret < 0 && ret != -EACCES) {
+			/* Do not exit the thread: dpmaif_ctrl->tx_thread still
+			 * points at this task and t7xx_dpmaif_tx_thread_rel()
+			 * will call kthread_stop() on it. Back off and retry.
+			 */
+			dev_err_ratelimited(dpmaif_ctrl->dev,
+					    "Failed to resume for TX push: %d\n", ret);
+			msleep_interruptible(DPMAIF_TX_RESUME_RETRY_MS);
+			continue;
+		}
 
 		t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
 		t7xx_do_tx_hw_push(dpmaif_ctrl);
-- 
2.43.0

