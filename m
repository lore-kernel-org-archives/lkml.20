Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16A331EBB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400485; cv=none; b=FsqVCo1xsMLkr1jps50XhEFPKGHBdeLr1oBMaQzeluXewsaLwEBwxfC9yGEmuxcf/xpbjAkRyAQ1Lj05FElwYPcu5ExSolJLWcOJNBDX03abJHPoaOghaVXScI7MEg797zSMHfAKtg1ahjHHg9NF/nRem4NaEhxrGjsI1fmefkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400485; c=relaxed/simple;
	bh=0ZGR/YgV7OEk+X+iRefjExBb64jGwBcbx5DVUTJVoAg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XBUzLEAE1EZFLdBl1+tceVcTcc8nkOH6DVkV36/Oz2aTOfSiOBBRJgkPbzMQIduA+GCB2qEt2E5JDZsoDYHHxNm0vUCCg5tIEMTflJa+gjk9um2DP1cCKsdG99Zfu/p6Oq5uaSexUYAiJRC84+dSIMjBwotEj9+fFVLgaSIq+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvUCi7X0; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvUCi7X0"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so4218087a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788400483; x=1789005283; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBi3aelOOZxRnPRZaGfB7u7SxHHBTXTNxhOMaECeb/c=;
        b=BvUCi7X0qY9cbcJ/T/U191iVoL2ri7i4pZcdjAey4HBT8Fq1VBfnUoKrSsT7gOTODx
         LGu9qifYqZuOOzADKrAPxDuZh3Ree6D2DDnYzko32Ts5oWdYUoHZChdemNpehL+NoqxW
         4mwVTcsx03/VdXNeCtMkhugjov3avIEIWJLro8NyfEFkU0YgplY6fNRRquQA0MXcQQV1
         SUkEktpQDH/67nt/XtihA3MBOZpjEu9FwOwRKD34M7N3e7TCjIxFXvHpgcqWPlwjuhVE
         yWa62+ddOmc9vrxqbubzKs0aQ/AQo9jFpcQZXcC6uJ4fhklJN4hteWhIhPTrNg2VoqqA
         u7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788400483; x=1789005283;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBi3aelOOZxRnPRZaGfB7u7SxHHBTXTNxhOMaECeb/c=;
        b=pq+V3wfa/+SJh35rFcUy7JfKoNH1KI7GnepD8OVJ/i6EbmXqYYZuLO4JB/e6YUxLMq
         CnrOReEJhuPJGSMDzJpAyIkVnDwt4KWNwr2sDF8x9w5qIJl87tWbiF41j7ggp4EKpskO
         TIYxMwxr3ca00rOJm+cnRENS20/NKEKceJEf+BhAY6JGnRJ/rYTn0OFwl0FjdeD+P9p0
         hs3Bi5dSIxi5us7TfEDiahPtR2D152BxnsisBkxuU9GP2qW+YgyvnpXbHiPF6Zz50A1A
         FveKgMO8u8BvENt9/XnLtVaBnCXIByvFs2KbiEQFZk18tCXWsGjsT9aznjkyz4RwzebT
         FkJw==
X-Forwarded-Encrypted: i=1; AKwUvBxxuKc9sIG+0ncgVMxF7pZ344Xrt9YWzNjtu1ygpN7QwqZhqDewpRjfFT1Uj05kUxZ69+OiU2/uOmP9uj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lglEViZ9fBKZRtUlztR0w1zghWz2wLdL5Sy11GysC94i9I3wZx
	rKeDXGR9b7giI4HDq+t1FQg7FN2kpyP1ezp6HLk6thGt2krJC/wsX8/MaJPqqe/xzZa15q9cpMn
	tdfN8W2EeKg==
X-Received: from dyff15.prod.google.com ([2002:a05:693c:804f:b0:30f:45f6:de06])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b81:b0:398:9be5:b41d
 with SMTP id 98e67ed59e1d1-39aee2650cdmr12947171a91.24.1788400482836; Wed, 02
 Sep 2026 18:54:42 -0700 (PDT)
Date: Wed, 02 Sep 2026 18:54:22 -0700
In-Reply-To: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788400471; l=2864;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=0ZGR/YgV7OEk+X+iRefjExBb64jGwBcbx5DVUTJVoAg=; b=DHstgDkJJZM05Winbe+XcggvVy1V0AGDZoQau5xfIK5izXTlRkTxUuLq2iH0U8nNF3DHv1suD
 HHeuTBel5EDCPA0CSgXCAqfdW5OVt39YtZ3wj9a3m1LbnLoNFQNAMdg
X-Mailer: b4 0.14.3
Message-ID: <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
Subject: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="utf-8"

When a system is completely unresponsive due to an interrupt storm or
deadlocked CPU cores with standard interrupts disabled, a standard
watchdog pretimeout bark interrupt will fail to execute, preventing the
pretimeout governor from capturing CPU backtraces before the hardware
reset bite.

Attempt to request the Qualcomm watchdog pretimeout bark interrupt as an
NMI (or pseudo-NMI) using request_nmi(). If NMI registration is not
supported on the platform (e.g. pseudo-NMIs are disabled), gracefully
fall back to a standard interrupt via devm_request_irq().

When NMI is used, enable the NMI during probe to balance IRQF_NO_AUTOEN
and register a devres cleanup action to disable and free the NMI upon
driver unbind.

Assisted-by: Antigravity:gemini
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 drivers/watchdog/qcom-wdt.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 4eb1bf979012..2849dcb1f717 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -52,6 +52,7 @@ struct qcom_wdt {
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
+	int			irq;
 };
 
 static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
@@ -74,6 +75,14 @@ static irqreturn_t qcom_wdt_isr(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void qcom_wdt_free_nmi(void *arg)
+{
+	struct qcom_wdt *wdt = arg;
+
+	disable_nmi(wdt->irq);
+	free_nmi(wdt->irq, &wdt->wdd);
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
@@ -256,6 +265,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	u32 percpu_offset;
 	int irq, ret;
 	struct clk *clk;
+	unsigned long irq_flags;
 
 	data = of_device_get_match_data(dev);
 	if (!data) {
@@ -311,10 +321,25 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		if (irq < 0 && irq != -ENXIO)
 			return irq;
 		if (irq > 0) {
-			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
-					       "wdt_bark", &wdt->wdd);
-			if (ret)
-				return ret;
+			wdt->irq = irq;
+			irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
+				    IRQF_NO_AUTOEN | IRQF_NO_THREAD;
+
+			ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
+					  "wdt_bark", &wdt->wdd);
+			if (ret) {
+				/* Fallback to normal interrupt if NMI not supported */
+				ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
+						       "wdt_bark", &wdt->wdd);
+				if (ret)
+					return ret;
+			} else {
+				enable_nmi(irq);
+				ret = devm_add_action_or_reset(dev, qcom_wdt_free_nmi,
+							       wdt);
+				if (ret)
+					return ret;
+			}
 
 			wdt->wdd.info = &qcom_wdt_pt_info;
 			wdt->wdd.pretimeout = 1;

-- 
2.55.0.970.g62bdec98f9-goog

