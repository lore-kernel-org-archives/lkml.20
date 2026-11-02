Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586576;
	b=f30ttHpxclfgd0Dl6+vRn5zskqrZ55dpMNvyuukwkMTMTZQI85c/t9AK6xI0j7a3gkmn
	 vCb+tHPkEEkdGAovGvfplP2uaFjmbmbT5AMp5oZTeZzEZrcDZJZJNwCMTr6Q7qeoH2C7M
	 Hlo76d/Tc0ZmYEIpo3NozkK5E0E+zuIFRZ2KG/+pL8mmLiZfcTzjtMjo6F9RviCfzHtkb
	 qHQ8ZguEWqPkcn+NJbj574B3/lj3qIw3T/F2qmqFYWqxci0R6bk8RBCMjYX/bUUiMnzS+
	 X+no0wj/jOUpm5NXXztz/ezDa7zQDZa3Z+t3xhSXQmd741ijGxPWeFJWQ1quNv3xiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZMEpOVsFrqARpvMUvrisLIeuBsTKQUpHcnf8SDZYr04=;
	b=EYSeebQnfCzH/2CQjdPv70ZtqmYW20/KvPVXDuKTzqroq0oSfh5waWRJMFNzsQmJWZNw
	 qp2qUY6XAF7Uhv+1Qeh6AuuGY10wWPDpMx8o9Y+Pgvg7qGXMjjZn1PI3bl5TzIUTu84zb
	 OVnkmSmZHSD8f2qnxuJg4zl7T0drL8VgDL5iFEzJmhBMBD8PAzFY7WAFaAFNkSMEmA0wi
	 ORATbs3FRn2+y/ArSL20+vDZuRJd53gzMeCCYMvzc3i+RefAYlH3i54Hz7euSfQwebudK
	 AuKS4xrOPWVTpn6k0XCPoi5Cn0we+YTT+G5odvvMJ8GBTOxBmfwT3J6G24gG8dLJQVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3NssMvJ;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE223606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE223606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3NssMvJ
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso1639954b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586575; x=1794191375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMEpOVsFrqARpvMUvrisLIeuBsTKQUpHcnf8SDZYr04=;
        b=W3NssMvJLHgCvUg4HTHuTW8eZXgZHmOMe7ukKu8BChEm3Ckr0jFjqnzwLbsM6pPczY
         1lUp4OnfXPMm8G8ImzigMSgE5MazRcISXE6CDiRO25wIzVGWUguM+Uz9vu0eGpi3+SAL
         OEmAcJkngrhsKUSZ0YylAiSM8HbWKBe4Dbxv8upb9SfLMwStQan780AS9o4NA/x8wcpV
         4EEH7pK/9Kz8WpOX50xFu/CQ/bl9k2vny/NMQ/otJvF+6dltrNlMDddThyPF7iINnETP
         loVTbzjoWL73pH76W0QOQO68CvCjWZqopxtsS9m6VUlkC/WOKEtIMYXPQFTu+i74sFIj
         /DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586575; x=1794191375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMEpOVsFrqARpvMUvrisLIeuBsTKQUpHcnf8SDZYr04=;
        b=dL99T9s6SUT1lEWTGiJlaClJJUyh/nf3EK+Yu0uguBmkjmk9TwPV/e97WZel0+Vr9T
         11mWbAQ7lJ4Bh9NqzXvg0x+InhDKMg6Uwed+WSWyf8OjFHc59y8tfBe9nJMHdUMkgNtA
         83jNiQ8tOhymvsCNi3kVHuMj55RblagAn8eAmeVfCovvAV/DBP+c9YMQvWu/4GWnrchu
         My9uW6LIDHuxIylQfSpsE4eJP0MVbNNeakPT0q5prsevP47nN3lWH7ZajefXSeLurxTs
         icC7U3/0V8TiHmAbH8FJrOtG53H+JVV1Q02qvjR2fewNhOAE6PU/+TY6hlxz0JaaD5jl
         VVlw==
X-Forwarded-Encrypted: i=1; AKwUvByq9kPwpqiUlu/fad70R9wamIkiBcwisa8lJxPAi8t/zLwm9pyB8vuFj6UQrG4ywKKvB1l9scoUEnZ4yog=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc97dzZgpbP/0YvVD2VN4nd2fIqh7mcCF5t4SvJc3mgwVsRZsT
	qpi88h2fC6UYgKzgQ/cKHWEgrvTsVjUnRpvA23CMjBAWVv4qRFb93maY
X-Gm-Gg: AYBFou1FqJlLqwDe1o8pMj6hfmde48CnTdiMtp0wPRitw0qen3X6LynyuVr2vCMecFQ
	betLXPsYaFV4OFu2/oDqb9Ukq7/VMoxidWjB7JXFHzsUnB+E9+0STejhoa2D6QJX7EC4zee523y
	0C8rkf75ySKks/j70mZ4lLrqdHgMTq2oEwFnlUVHr0fvymELSuuHToKkafQ3jLCSqJwZwmmPyk1
	9+OQmebu9dZulqKw48g5pu/24xwemPnS+hKoUqkCwA9dhwqhMsceiBf/l6A6IEd2jHR+l0P9fv4
	UlO7RpbZQV6w/NfR5ZVWZeWp6hk03fq0hVu8gdF8tPKOHY3N7SJ3371lI5g9u3zcM2+FqHo9beo
	xKxRa5BRPIA49JAnVlbGaaLrCZIdxnSgPf1foLb+7le3Yh7Tbl4LaT4hVFaZsYSUoGA5iH3OKO1
	l93xqgaeYYx5YVjpe23q+Bnfl3NASwvDbnvNX8FkFz9eYC9GIFwHRlpwmdz3uh4k5/VOClAjc/a
	ypUjAD3XmS41MI1K+Me1SLImXfjbX4M7Wh2IYVSMa2qJADS9uO58xRXiAZv5F2GhF4v73Fkjep9
	ViakL4fWn/TO+fIcYC3AuIT2f00/PPiXRArzqknwkxtGPFI=
X-Received: by 2002:a05:6a21:7741:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e9289765e2mr6558635637.26.1793586575163;
        Sun, 01 Nov 2026 18:29:35 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09814cb9sm2441382a12.24.2026.11.01.18.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:29:34 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BeaCox <0xbeac@gmail.com>
Subject: [RFC PATCH v2 2/2] mmc: dw_mmc: cancel the watchdog timer on remove
Date: Mon,  2 Nov 2026 10:29:24 +0800
Message-ID: <20261102022924.51343-3-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102022924.51343-1-0xbeac@gmail.com>
References: <20261101063719.88570-1-0xbeac@gmail.com>
 <20261102022924.51343-1-0xbeac@gmail.com>
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

The central watchdog added for command and data timeout handling is
armed while a request is in flight and is only stopped when the
completion is delivered.  If the host is removed with a request still
in flight, the timer can expire after the controller has been disabled
and its callback reads the controller registers and the host state.

Cancel the timer after bh_work has been disabled, so that a work item
that is still running cannot rearm it after the cancellation.

Fixes: ce0043b9a302 ("mmc: dw_mmc: add central watchdog and convert CTO onto it")
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 drivers/mmc/host/dw_mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 5b47643..dc3beab 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -3410,6 +3410,7 @@ void dw_mci_remove(struct dw_mci *host)
 	/* Stop the work before the timer that it can rearm. */
 	disable_work_sync(&host->bh_work);
 	dw_mci_stop_fault_timer(host);
+	hrtimer_cancel(&host->wd_timer);
 
 	/* disable clock to CIU */
 	mci_writel(host, CLKENA, 0);
-- 
2.43.0

