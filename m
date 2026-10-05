Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D9247D93B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225942; cv=none; b=Pcxb2m1LREt1DUjkdBh/7iFzvSGFKZ0Axq9k1Muam6VPK8jEtgviZnx6kv+N2lNOrWPoNHH97OibPIpt7eM8+CNbPUkpDm9cFji+xELw/wCsOh/4lBK/b+AxWjR3DP/cXMHX1+BcyFo9MOTlFQEvkkI43iP8ZubzUpXNmxKl9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225942; c=relaxed/simple;
	bh=/h+8koXUUsdQKP0RwTv+R2Nxq9QgsEszDJyQBR/pIiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJHnAbP+pmaR0rebPoEHIvbh+Q7HpvfqJvzenMbqQkqZUfxBiRJTgZ5vrpWGHBL+e7CGjpiwicN1+blFlPGV2mWAUCCfZ2m7yUADaXE7PEZM8mIO2Y/eegVCbyyddUkAWQtdLTpnhPslK+wAZyi7UlWsh8cei3X2ZuQQi5BadMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIovJ5hR; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIovJ5hR"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso1666805eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225940; x=1791830740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrGPbiNv0gSEfWGQCcCEUzUTBouQOxhgNZFLIdd6cSw=;
        b=hIovJ5hRLjRrBi5jnwTPYOQDiAAh8shvBjIn5di4i56ahf7++R/zjQc5a1sGNaui3L
         BSXXS6jzeZ187LSdTHXIYldkEA9eIUVvmkK1BcpZF+LYBmy7+RBCE1/URjcQzyNn8qgH
         bIHZefhJpzpPxCSftTM7X/GXgxJCLvVpoEzfrv+BxjBO8uAlchw9BiHW/3uGJMGc44rl
         rprY6kU+y+zGII5sMJG7BjAtQ7G6Q91X1RwuueV6SuW/3RXeK0MXvZN3rKUZxc3H7ori
         dv43uYzvqlyoKHTirzUAgFfg5n80UAFvZ42XxtsmRSy8Vc5OE2Csu/hdmaGQq/e0X5Jb
         Djcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225940; x=1791830740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrGPbiNv0gSEfWGQCcCEUzUTBouQOxhgNZFLIdd6cSw=;
        b=k0bROx98VpCrMK8ez0pBiizMUolR/SDqMkn9+cV5/CA9hGj8+Kdb80sNSVSNDz6YX6
         W+llGqD6JTCrDOX57iSnBVz3tMy2ItqN8tQHRxFD4SdkegCQLe2jxA0bpF5ynTY/RriJ
         Vi73qf7qXHKZxM8lhgpYOO4u/T1Gehl6VFy5aCz11HBLOMryw3eUESjRoWpxd4Dckulm
         wc+EZEV/wr5SWa18tbQnYKpnHEnHXK6RNOIGMta/ZlUtRLP4+jThAQwg16IwMqmFPgI6
         vvJxlOfCW0SEnNru8DpT1PFa+ORsf0zdfZsrxpAJM9OISx37K/YIPa3P+tT+vbK4Psri
         SuMw==
X-Forwarded-Encrypted: i=1; AKwUvBzNlyxn8CgvMib9WjQqmohxTKPMZrMAFz/yEOH+E53zHd8tgRHr4YpeUGcG1lolwdy1bA8oWtVjB7j2of4=@vger.kernel.org
X-Gm-Message-State: AFuF++mLXvzXB2GpR9Xz6IXcBnmv820Kid9byAJg39qQYkO918XbK14s
	IezK5h43G/XjaOmN2S2INLtjEA7CpVTYedfUJhl91yL87a8LTACAX15H
X-Gm-Gg: AYBFou2H+a1Y3aWYtHalSUsCGL3dN+/Vl5eYGYGKeHChYDxPJtXvFlqj/pRT3YkopnD
	fdiDgANkTs800GjlsGGloqPk/HJZAz5a4X/uzjw/pnZbKDGhvYjJv0db7u1Wga5DU6kIt5ED6mL
	gFT5hTiIitD7UQC+1yE97tM7Vcgi+oeKcdAtZxgxzQxj6k/1cttdRT8iz8YAsw1xBHleKWOuUI+
	7P8XdaWOR1CvhvJdHTNO5sXzjXikd/I+BtpKfQs805n1BaMPFfGwa8bRaaGVJUHaS8bBQY/gluH
	OBckNjK8JtosOU5lNLQPUxMxiHoc4lXyOIooVZkgoQdZgTZrvmoFLScCtJIHCAPM+zMQWYiyI6d
	JYVDhYhSxvglGIkonUZL44d1UtWBR8nVlgM3jp1C3IF01ccpzA9clXiN67Uf4jaa2NV5Rbn5iYG
	PqopW356BJafuu37I9QgMn0sei+Adt6Y9vL40D+Z5IVikFY7uhO6esnQ1u7tvlnCFTtaIMt51Ng
	9+7Ihc7eNIm/XFGZkjP4TWjvHai9mrYwebB3chy/xpyP1EwWaXnBC0IAhVdI7rK/SE1fQui8IsQ
	mKYWhikrJegdv2EPvCUIXCxhfosoD5otC9DMr8igCulH/2hW7lJCimBzkVsuhr+rCtsM8EdMNnG
	GVSXmdJGFFj0a6ZMD8Diw/CJGj35NCaM=
X-Received: by 2002:a05:6820:4c82:b0:6c3:19de:d1ef with SMTP id 006d021491bc7-6e09d5b8bfcmr6793892eaf.20.1791225939610;
        Mon, 05 Oct 2026 11:45:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ead0dbsm10666593fac.12.2026.10.05.11.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:45:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 05 Oct 2026 12:45:33 -0600
Subject: [PATCH net v2 1/2] ptp: drain virtual clock sysfs operations
 before unregistering children
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-ptp-vclock-sampling-v2-1-8ed12d4d10af@gmail.com>
References: <20261005-ptp-vclock-sampling-v2-0-8ed12d4d10af@gmail.com>
In-Reply-To: <20261005-ptp-vclock-sampling-v2-0-8ed12d4d10af@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Parent clock removal walks its virtual clocks before removing the
n_vclocks sysfs attribute. The mutex taken by ptp_vclock_in_use() is
released before that walk, so a concurrent sysfs deletion can pick the
same child and unregister and free its ptp_vclock a second time. A
reference held by the device iterator does not protect that separately
allocated virtual clock.

Remove n_vclocks before walking the children. Removing the attribute
prevents new stores and drains stores already running, without holding
n_vclocks_mux across a callback that needs that mutex. Virtual clocks
have no such attribute and must not remove the parent attribute when
being deleted by its active store.

This race was found by code inspection of virtual-clock registration
failure cleanup and parent removal.

Fixes: 5d43f951b1ac ("ptp: add ptp virtual clock driver framework")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_clock.c   | 5 +++++
 drivers/ptp/ptp_private.h | 1 +
 drivers/ptp/ptp_sysfs.c   | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 4111342d64f0..47ffc773065a 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -508,6 +508,11 @@ static int unregister_vclock(struct device *dev, void *data)
 
 int ptp_clock_unregister(struct ptp_clock *ptp)
 {
+	/*
+	 * Stop and drain virtual-clock creation and deletion before walking the
+	 * children. Do not hold n_vclocks_mux while waiting for sysfs callbacks.
+	 */
+	ptp_vclock_remove_sysfs(ptp);
 	if (ptp_vclock_in_use(ptp)) {
 		device_for_each_child(&ptp->dev, NULL, unregister_vclock);
 	}
diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index db4039d642b4..ec8633126d6b 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -169,6 +169,7 @@ extern const struct attribute_group *ptp_groups[];
 
 int ptp_populate_pin_groups(struct ptp_clock *ptp);
 void ptp_cleanup_pin_groups(struct ptp_clock *ptp);
+void ptp_vclock_remove_sysfs(struct ptp_clock *ptp);
 
 struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock);
 void ptp_vclock_unregister(struct ptp_vclock *vclock);
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index dc398c6b7528..53388b123198 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -263,6 +263,12 @@ static ssize_t n_vclocks_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(n_vclocks);
 
+void ptp_vclock_remove_sysfs(struct ptp_clock *ptp)
+{
+	if (!ptp->is_virtual_clock)
+		device_remove_file(&ptp->dev, &dev_attr_n_vclocks);
+}
+
 static ssize_t max_vclocks_show(struct device *dev,
 				struct device_attribute *attr, char *page)
 {

-- 
2.53.0

