Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9648A8B9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783013; cv=none; b=h9zh+bxJqLPf89dZAbo4vw8qoX3YQ/LYqpuOd/UQGofWkdb/0kXtnmGg1ahEzTvKYmFq2NVBoc9HrFbMEJ1bb/npteyWTztLe2QPEbqEq9Yz9tuqn3HZlL2QJbEE9IUUsB5a9YmeyFRF1hNdv7rv6aL4enMLrgaY59q+ryxeu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783013; c=relaxed/simple;
	bh=0MrgqhcOCuUHIiKyQXP55wotjUH9giN0d9RDb7Xmq4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e9CDSsSvNbSghPQA66n1NJjwee22LSxwTtukD9OtQXqip7Iptu7WxaJjtzRhw7kuWyKLftloEDfFTyrIiP9e90z/qErrdGyB/BjKmiQWFYNdSsRWE83yPmEcWtMgwc16FQywHsWsmZYIBQcT+pNV0tH8lPoNQJVwBbdfN6HXIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SQ4C+4bx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SQ4C+4bx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1470128a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787783005; x=1788387805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F2Fqhci2952899e2IQhrM/wQK1EmHXnIviKwRrjkSN8=;
        b=SQ4C+4bxb71rVtBqqTyMPp7SlV8sld5rUzE2ndFQBEUuQs7WcEs1wWJnE7yCJyf7Bi
         4+d+wHfQ8VuVxpSgdBrBsVl66dz+yYHcAhsXqJl6JG4USb80UV2Gkgs3+9JaebrWn13p
         gsUmJKHtIJI/c7aHiMoLs63Hb//nGJyaAkdnxra0yvIRxqJ2zbnBwlsY1vFE4PKkSGS+
         NKDsOxA89wlcDcLResofbXhutqxmI8rqWsKUv7X3QWzGB6LaXL5ektGyGYaDxUXcR7xU
         vR9o2wFRQaFgMfnKykg9p/intyt/XsBcdFKrWCPyfvk3hiYvghhrd3tl0Rck2HgzPz7W
         tUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783005; x=1788387805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F2Fqhci2952899e2IQhrM/wQK1EmHXnIviKwRrjkSN8=;
        b=R2QQQrZxqrIk1N2VVi4fG2xHIzoaQrr4Jd8UJ4OOzF+apdvCTZXtHRB0CrqKO9AleG
         IeaEvHtdIGgtq7wqESSIS1OuT4bbR0H7Le295+Aax9sGkukwGp87EAYvJI9pixY3iCYl
         JBMrk+Lm1i9nHB7dAMIRueQXK6Oy85Am8gZFYTeJTKtIBXPWgTFcWTjPRGNeCIrLsuj4
         niiy0Gu+Us/nVv3yaX/ktwyXFiTZoJLsk34+YuoctlchNysfWu/88p9Rp0/abE8orb/+
         WP+YnqdaC0pJLhpTzYDscXF/6DZRTLeM7hRpizEjje0GR6x/T3K2Q1YmP37XEzH6/upJ
         1T9A==
X-Gm-Message-State: AFuF++m9+bIJvVgIzQgXeJS6k73Rzq+rATz2mO5T8lXkAR81QvqL6I+U
	0RqDxRe9SgJsB+MOwOKHBKiP32vJuoY2pq2kFlJicXaff5e/p3uKPHcC/HG40H7ohpQ=
X-Gm-Gg: AR+sD11Yo8N8lGhjggD6w85/P1kPZtsMKtd5ZGCgJZluVcESQYFrKo9HoL4oAluhczB
	4RYb70rzMR1O9QijcKjqyDQyDCZKVLI77vacxQEAoJWw7aM7kGgZU6MXkL6YbZGNsQN1PB9k0xd
	Eh9mlh4PHyARgtKmmoXvc6zRtAS/RtVancxD0jTVKbJ/D0YK+1Jf1vuMVRZgMHIO879PICUbeKM
	hFnJlNJxFm3EIzYnldHC3Ynn+6K4BmttgoXjdfqtwdcVptnPSVET8IUIRScWkuDkFF0NyB/7WJ4
	9NOV9JWbDZXxjrLPCRBj9ZzLk9hQnKnAIVPWnQM5yQEcm+KRjk8IteIOHkXOmxnSEMnMSsw07eU
	ArwLQgpQQRGBWbDGSku89PJblJzMCcxM/urQW9g6ZlSiXpp0p1nz+NZ5JaRr6d2vUbMa9qRkXoy
	Xy3R5gaevnDc88145ncADeIXNjEEJ20dGiJadIkvetIpFRtGkecebmuuucY3pKpe8hESpZ
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr22027613a91.11.1787783005076;
        Wed, 26 Aug 2026 15:23:25 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-396b10ff06dsm30728a91.14.2026.08.26.15.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:23:24 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH v5 0/4] PM: QoS/pmdomains: support resume latencies for
 system-wide PM
Date: Wed, 26 Aug 2026 15:23:18 -0700
Message-Id: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFZnj2oC/5XOTW7DIBAF4KtYrEsEGAzOqveouuBnaJCC7QC1G
 kW+e7GzsFRl4S7faOZ780AZUoCMzs0DJZhDDuNQg3hrkL3o4QtwcDUjRlhHKCO4jFOw+DpFPEU
 3Rh0G7OqdBWzHIZdUByVjECCVBa4EYahaUwIffraej89nTnD7rnXlOURG55WIMZRzM8sTQ+veJ
 eQypvv23ky3xX9+MlNMMCXKW2699hbejb5fg0lwqm1bycx2mBFxFGYV7qiXBqRrhbYv4HaHO0q
 Pwm2FpXBdz1slqDIvYL7DivZHYb7CFgzphRdc8j/wsiy/Du8vLxACAAA=
X-Change-ID: 20260120-topic-lpm-pmdomain-device-constraints-e5e78ce48502
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=0MrgqhcOCuUHIiKyQXP55wotjUH9giN0d9RDb7Xmq4o=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqj2dbU4yVbbWM28qEi0/4SsVclLjwa/sXcnH2s
 na0g19GUniJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCao9nWwAKCRBZNxia0/vG
 ZSeyD/9rOzgHnFOnKGPCz6ZF5oI/tqeZCLemO+fie3P9DSIT8M9bUsNdCPI+KZ8DD9OU6/E21Vo
 cWTPNVfocvuBAkZXXyAfsza8tsQWoTDrJZY6mG7wvoY1tnvejCe8QMRwwiAN3Y4k5Of97LSzB/X
 lrXTUg9Qbviz1QuYqXTFKPYydUO2fCT1EJmxu65wl+i8iyK1i6np/qSzocf6+0fGpLUTqDIDStK
 qcwDWK4R+LMIey7BxFE8PC+T5EGePiAy7FngJXiIdbpzl7VdZMuHrnVpg6GdeqpsG0AVdnFZBdK
 t3Xj4r3eXgKXLLdnB3r5JJqYHDTlEZepjVH3mAlJ2kUO4gwtw+K9RO7dqyPHO9JMNIfzHrT9bXH
 kLQ9GEU2Ws4IR9s/GfET0W4OmB5zgXUTmOYFX2qDOvl0t1jdBV/+ATwRuFep5HJPDnOXo7TN/u7
 4ETTVO6kHI03mE9Gm839mC/BgF6PIqFWDaSNUfJJTKTzhFgSKeisSYBI4qXvLbj9i7hIULcbBMe
 2I1DRXUhZY71egaJYkJTXQBcq9xalqlJx8IM+/zuZ7ZB2xJG6KB/3lFH++3jJPZ5BKDHCMinjXr
 /q06aA35LV/7cEeLk0cI/xq4FYXEf7WVoVmrlb9NpSw8dBum/SN2tLF5ifnVioPqN6HMWVuiEka
 u2ro5wju+Vz3suw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently QoS resume latencies are only considered for runtime PM
transitions of pmdomains, which remains the default.

In order to also support QoS resume latencies during system-wide PM,
add a new flag to indicate a resume latency should be used for
system-wide PM *in addition to* runtime PM.

If a user requires a different latency value for system-wide PM
compared to runtime PM, then the runtime PM value can be set for
normal operations, and the system-wide value (and flag) can be set by
during suspend (for example in a drivers ->prepare() hook) and the
runtime PM value can be restored after resume (for example, in a
driver's ->complete() hook.)

To: Rafael J. Wysocki <rafael@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-pm@vger.kernel.org

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
Changes in v5:
- update copyright year & author in new header
- add Reviewed-by tags from Kendall & Abel
- Link to v4: https://patch.msgid.link/20260819-topic-lpm-pmdomain-device-constraints-v4-0-7ceb095f5474@baylibre.com

Changes in v4:
- added corresponding WRITE_ONCE() to match READ_ONCE()
- rebase to v7.2
- Link to v3: https://patch.msgid.link/20260611-topic-lpm-pmdomain-device-constraints-v3-0-75d69438518b@baylibre.com

Changes in v3:
- rebased to v7.0
- fix PREEMPT_RT: add new helper for lockless read of flags for atomic contexts 
- update kerneldoc for genpd_for_each_child() as requested by Ulf
- Link to v2: https://patch.msgid.link/20260205-topic-lpm-pmdomain-device-constraints-v2-0-61f7be7d35ac@baylibre.com

Changes in v2:
- drop the userspace interface
- add genpd helper to iterate over all devices in domain and child domains
- new flag means latency applies to runtime PM *and* system-wide PM
- Link to v1: https://patch.msgid.link/20260120-topic-lpm-pmdomain-device-constraints-v1-0-108fc4cfafce@baylibre.com

---
Kevin Hilman (TI) (4):
      PM / QoS: add flag to indicate latency applies system-wide
      PM / QoS: add lockless read for flags
      pmdomain: core: add genpd_for_each_child() helper
      pmdomain: add support system-wide resume latency constraints

 drivers/pmdomain/core.c     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/pmdomain/core.h     | 17 +++++++++++++++++
 drivers/pmdomain/governor.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_qos.h      |  9 +++++++++
 kernel/power/qos.c          |  4 ++--
 5 files changed, 129 insertions(+), 2 deletions(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260120-topic-lpm-pmdomain-device-constraints-e5e78ce48502

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>

