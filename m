Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038296;
	b=FEHb50W2eYZBwVpp2YXDdc4g0ggWueGAhgDu5KpJq8DFkAh0uk2cWynde7bhPJBQIfDt
	 yAG4EJDRK+sonHLAxW90vIgwxYe8TgtxYxieco4lX7GMz9E8Olhb41c5ILzXVvclgNxJS
	 ske8pnuS28kad1P6jPMzYpqk5ojYZRQ4Ex53ddkLB2p5qalBnMDKRuh3whjgsxhGekXZ0
	 X/pcPUP8ppDIoAxkrL/cSniqR8t2FxXEnpEyY4MWn8VS9/EwPLtt3ZRNMwmRy0MKeAXMk
	 NEsgAOwk3glz9O+i1regetUkiiIUwoMqliy8fFpGsC/8PQwZqHoLQ7G7xKADlidTkYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
	b=joURDnF0DOTy6KcjXuEgNCG6a5Oh8zZALBqOvylTyWPozaXzNXZMOji3gEpbcUzhfjjr
	 ID6zwISyqaDPGi6mzjYzWiov6Pl09nJIMJ1lG98TgKQk/Khk4Mr3W2Vn+mKTVs1sP9DoU
	 SOG3+465sWF+Kkf8qoRSAGioeFkfdZF9WPZpMtM6e2PrS7kvth2lWYjIw+zCkDIvNBobK
	 Shw+xfWlrzLj7mG+mgspRlNz/HdVICfWE1sNLCgwCrTn1AqtXvip6yw5Iv7U1WXz0R2Yx
	 Iy4ZwO/8HKPa866Ys0+6DTdcCHiaSRVNqDmTzs5hKW7I2kmIzfR/6vT5J0KnlP8ToEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ikb8AL2S;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D26606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D26606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ikb8AL2S
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49de8ea072cso1402620fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038294; x=1793643094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=Ikb8AL2SIUHtQX6nKqbGaWfJAD9nof226YhE+4uqJmXEADlwn9CnDUC8ig+jNlWeE8
         4ztJ9NmevX3zWRYsysnHU4jT4oIhXBam7FM+bbNp1hyuR5dZy4fpKvvOjFp8eDJkpxuK
         RaOyGvSNBpso3ZsvmbsCc/4lRQLkNYFg3vLbiTuDNXr2Ru9wdJEJfXXDE96tNGnbdrJn
         I1PkNLonsk/pSdDB0kmubhjkM60Cbo93Bd9at6DrIG7pRbB+/fpIRT9iHPcsqq4dF3DE
         IidDLhkn5F0mg9vv0XN4Xii/N7C04jb4kqvwdoQB1ucBtiwjh04DbiUi4ySpL22WJyQj
         9nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038294; x=1793643094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=T+CjxN2jHZFyAG3b/zvM0mw4gZPgQfOHa6CLlYLq+zSnDHXK556/Vz+Lgs5ZyxvEqY
         dLrAuqQX2jBnkcSGKZqMkzRfqAv3D4HXSTtgSjpYx7gPbYVv4q2GNcrw4JHhnClV+jxG
         PTV23KXggYDfu0P/sAmv8J9ghG+0w+jT7bmCN+FwA5rxn4oOs7rFmTl4T89JGgujK/BV
         c1hRiIQjJkyA8ffln13VDHWotL44ItWFJE9pgDZ/vovRQuuF8vySZZJey5Wt24CD69uX
         bzijc8pIoe/8RIZcBtGI+MD0EDBGFURBqNLEYeXdN4kMd/bYGDEnO6S1QlLOyrQuazoY
         4Gbw==
X-Forwarded-Encrypted: i=1; AKwUvBxMBwFoVtPAdd4SM/AD/3+SP8w8oGLgfPNCkUJ1IUvBRCPDZkQqwn7kGBlR6BIxrE5lzGBRTo2WDZF7eb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAj7OCYK7W3dgiQsApE8ZalqaWlmY8rKkfTM35OYBdWek79GiS
	Our3nXWYYdNqlxDP9UxEKHB+KaEnuHqtoM35qTMKGX0xjlWtKYjLfpX+
X-Gm-Gg: AYBFou1ExbGdyLc4ieTL09M0S3DZdD/bIaQXHpV23DCdU43meXM/mJR2XO3IcVWBZbL
	0cZzrenXqUMZUbV5tAkYcQsRBsRF08Y4pushd8DOn7UcoCSvKahzsJLBEtVt/kT7q8TgkbfPMQ8
	hmHYE5zZz8UP7EyRfogGlKf9AOW3v3SnhMbVeHd15kZoxK64JKc90nSduUG3SxNP/HgL3pI9rJl
	KsKWaFtf+rO5abnvFAbXG00AUlnxEqaBdygAwJBk116XqgrlJkqRXxDP+Ol2r8S7SaP0T+qQ2TP
	eMNm4c7mkiQlfPw+4X2A1owygTnGsj0I9QdNBVx4p35K2BrU0CxTtR38q7jB8gI2hpar6lLJDq5
	N/qY4qud8sXdIl6inwAX6dZVwJ8i40R36DAq3Ejz287eN2FcI322z0LT7V/HtJERd2iZ6fRGrOJ
	z69OVVjVrovq+LGfuHjymUyXQVq0KwkkDNcc1Q4kO6kt7KO/cd5bi6MWVcbVvDE9n7+7p9MVeSr
	rUSeeKgk9KJV1Dn3RG+hCPYbmEY0BxpsrzGmCwm011qGw0NgR8BlnrrYMK4R2N1i0dr/zdQi4sc
	ck7J83ZAYzfl1u4tRPZ0BKqF4zAurTh0HhNJapmP+9TGiQJD+xZVRlh+WBQlqm7MeaEvlTDIqeT
	/qR2/pFvKkFT+uHapy4DR4L/bKdMEVy4+NV/SmrfCVvDf5h07qoIbVatOV+V53nH0fPeIDo4ZrQ
	qGEA==
X-Received: by 2002:a05:6808:4f4c:b0:4bc:cf33:7024 with SMTP id 5614622812f47-55c0032db63mr5825660b6e.42.1793038294530;
        Mon, 26 Oct 2026 11:11:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c043115bcsm5795251b6e.15.2026.10.26.11.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:11:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 12:11:27 -0600
Subject: [PATCH net v6 1/5] ptp: drain virtual clock sysfs operations
 before unregistering children
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-ptp-vclock-sampling-v6-1-e705612541f1@gmail.com>
References: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
In-Reply-To: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
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
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
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

