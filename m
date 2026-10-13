Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84652CCF2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919192; cv=none; b=iGPvNKpPzgF6e7Wa6UMA5eyehRbe31dmKrta5voct+vaZqvEPczjkM4DbA+6ZaQalEuia2qBk7+12OIBoeTjcWgGFLci9UpubeZazsA3hRRfjaY2BURz900ypDOSgjSbv6e2GEwJ6kwIV7voatnTQjYFw6xxwDGJ3r9XkiB+JHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919192; c=relaxed/simple;
	bh=gIMYuS9JxR7CPdiCa2tA60WVNZMmxDlDk7M0OBLgqkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+gDqsSIdSUKnICuBE/roVLnBIslKa7xIsS7J4ZCGjJQa+TLsypMkL5WC0s8d1V4xBGtGRHv1iEnVAX3AF/7gsY4bRbiZyLhKvUaWilWQEgL+Q9X3RekxdZXCh7OPyowQzI0jmLKmayR4Ayi23mrQh7d9apklqk2nFGnyXQcwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJlO8KcF; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJlO8KcF"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df5e315bd1so2285758eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919189; x=1792523989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ye8Z53vHx1EFOnkJGmfg97MMg0sWXfEXyW1OqzDyMg8=;
        b=OJlO8KcFaiEJ9lDwYyzG5TxxXC12aPyIkDuFaOQOoyBV58DOrmfiR+XEKSVWGXW5DJ
         KeZojC9RjJSPzmi8sB3C0h2PAT6j/eL2j/4S/l7Xpr3Idjm9EmdfS8geUT04MK59LQhY
         lOrQm3zAQhBhMzwXxPlj3/vLTMdtoOBcH5AVGQuHDCawc33WlQND1lGmCtku1uFV+4AD
         AcLV+Qjc2YPnW9jsHn+rh8pBKuQ9Q4vrFR102SrAK52szslUHouwcRtyr40e5X3INgSP
         qAhuNwJ1oIjnlmrrHNj11YCoPv0MSDcvMpM9rsUcCck+fx4x9GlpW8Xr6W0+kv19HNbH
         Epfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919189; x=1792523989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ye8Z53vHx1EFOnkJGmfg97MMg0sWXfEXyW1OqzDyMg8=;
        b=kvg5WAvQWINZTAfEN6XIRwE1ww9jZmL5hnpYgrnFMsLKCSbHPhnLqaMN0htPlKuyrS
         tIWI4Pu53w5FAIwTkFJC5o0wspbC5OjcAbYVvf1MOX3w791TCmW/euxvgomHRXtYA5nv
         VEhEMGxt4UeTUp8d/lPR5S6gD08XrvAOzFz5Rgf7LS0tfn7ShhP52ZantUkuaaXXpRrt
         IvyExwKzSAS07DX0Z55Bn6TEMw6EEdqg/LZtXfqwe9TDv/BXn/Zgzt2qxECCFwoFsf7p
         4sb5sznVwp+pHkHbrmqDUMDwmQbTmxFhOqsifbvL/1LpkOZzH3CwLTUKnJ8Nn2gwWzkw
         KU8g==
X-Forwarded-Encrypted: i=1; AKwUvBwu4y+XfQ7y3eP79qrVhpTOf4UqtkeUJsIfYOI414VIWLvFUOeP3WQU4Rs65NOktPjU3DE/TY7fiz4ojMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs7aWxIgtV4mG16LQtAYGqq8K8dBt8tGi8mfbw/Z6Dh+n4ByRG
	J4MqvpRoJDHcjjtP2GiTZyaNN3qd5nBw+HeMIra5lHJAlTRVEofgyOab
X-Gm-Gg: AYBFou0Us3rFbg4ThGo4lYl+NjK081hZNOqCquPFsTnN0x72LJnBSUs+KDBmfaw78Bc
	84EpzWyfqS4WzXUMl7yvoQt/BIryiTuQ0lgaJRuqfugodFPfln9X1UzwbJ1xfebeP/3SeBVply4
	fDk6riHfNfqGkC7xlOePv4IqTG1+SQIfBjhJnI8quEM6HMSrHCQUrC48yQqGLz0DtdFTLhvwqdE
	8YTfaPIjuG8RuFf4flZqtRlLnApqNrqMs1bb+GlcUJy9H1+w5z08zJdZgX2hSXHtYWGqGQ27X8I
	4w8UmqVDb4zqtYwJazpgY5KO9Jz9B8tMyQVM0SNkta2bIPuQqOlTBiL8am36+fAGRwA3AEYidzB
	fUOrd8AjmM+t34i2Syroc079hWaRFqwd/P43CBtTsubQlkQ126JpFGftLyVXtfJbq5QoBfphtpq
	tdSzRIyLjztNQ9cvngg4XgbiHytdMwDnSC3LB/5ePbcVdbwbVJKsrLiziJnUOWDerD0beUBFpA+
	6YsOrGM6f9Ic4VA9NYIHtaooaf6IAFDBdn1oG17FqZ6NEqpz/PMh5EGmUbB9qfuykxa1P4ujDJb
	7j/YX3s+smD6GCd8cnOq5i0XzPgP0FMO0Yi4vVhJHysnLQnqGYw2dq6GEwqMUiBJg7UleITL14s
	RPUm2xhWbdl5rLOGSMr9h
X-Received: by 2002:a05:6820:1a0f:b0:6df:428f:f17d with SMTP id 006d021491bc7-6ef0e9e3183mr9476815eaf.15.1791919189604;
        Tue, 13 Oct 2026 12:19:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13280507a34.18.2026.10.13.12.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:19:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 13:19:45 -0600
Subject: [PATCH net v3 1/5] ptp: drain virtual clock sysfs operations
 before unregistering children
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ptp-vclock-sampling-v3-1-d3ee4ea62fc6@gmail.com>
References: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
In-Reply-To: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
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
n_vclocks_mux across a callback that needs that mutex. Skip virtual
clocks, which do not have this attribute.

This race was found by code inspection of virtual-clock registration
failure cleanup and parent removal.

Fixes: bfcbb76b0f59 ("ptp: unregister virtual clocks when unregistering physical clock.")
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

