Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA6D4A5EC6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107222; cv=none; b=SiHj+QXqkPii/uTZvoJs5J1J72VgRT5uVGB8PJDyaZTgrwH45bvrSkD7iHtU0RBSPDJSD9eONI1APoIajzkHf0pMEMbB3y73FtTNaM4hAWR6jnk2yhWF8bs+20B3JYeHiQJaH4YdVfvjMloCobQ1t85MwfPdgfX5EVa72psh6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107222; c=relaxed/simple;
	bh=u1jjfZ2KHFS8UprCW2+eFF7FxKQjxGdtpSgzNKRCzfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oU1k1nZtE0VGzYPJLM+Am/F6cLLbOM7Y/GRR/+MtKF+OPDwRNNH9SW/SHSCwtbRDFADmELGPaEu1iFfSlxzcLKZnO1NZokl2v2ryCfyvdEOGiQbJ7j+/dCjqo0wMja6HgO3ASoJjB/4RMnazGzeVVwMU5oAJ7ZjNOrCtIF9Pzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=attK6779; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="attK6779"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so1823582eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107220; x=1792712020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=attK67797Ipt0uje83UmosadCdlU9yCj8xuHkBWI9XRAW/9roFBVEcpG1t3jYyVM89
         RfU5gufeXK05yi26dmqEFpNzNVyuSAbyNugDW9Bp7czOgtpCMT0xIiabIct2b4qySQar
         zYejx2k8A+FB09Ppq/l3jd/5MJDHmxbft0Ovjp+nN9meenlYRfi7l7OMFesNBm2dYfBR
         Uw5xTzfyZ5nDXJ2w5W75+oSBbROjuTbQiAWIu+ehoRJOVvE+GTlRBBqGIqahK/XQHB8j
         qynSQp0xn3WQxgXJbbW37w//ZnaGjOTKgWhL4pr+ep+8PCpONZRgCfzTqIjasUSEOoC3
         X7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107220; x=1792712020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=EYPqcSDuMKIxDjHbap2W9SIBG3vr33NrYbngew52bHO/ZpWEtdjIJhPoUFc6XQuZUe
         yUV8tPEY1o8n2H4xm9ZuHlIKuw9ZZeW8KVn/E767Jn6NekHfZSYXAoOZEw61rKO1Tk/d
         ODVEhrQg83j1Ss+yJBSetqAI4LTliFF3Pu99ZRCw2yha5KN6JbT2nLx/lsIcMJRhLiDY
         LrSbsN8bnMRjQRjomapWj2syFDkR0yMKKYlobt773nCnLjRi69uevnkarVntUsJZyQli
         w6DZOTUqMEC+zZC51052g/shF90xGMRlVqMLJYuYgAoo4u4AOG8fhWhwS89OcXuCMlH5
         BNYg==
X-Forwarded-Encrypted: i=1; AKwUvByjUtdmqumehCT0I6eKNuV8k9vsRaLZHu4bV7oFDyXewlCYSf5BXgOu2UqTHVXsK4Y+GFX3gy620E31CAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYobncyY+IXc5Th0ZayFx29Dk41BGpFDkNl9mI0MH7bapgQ8CL
	nd8agzyiUB8i5+8gGLH3lBwXmuIHxNbwIo8y6MYujv1oq9pXv9EQD7OV
X-Gm-Gg: AYBFou04FE7HPcKiNstdMpw66Anokr3n9ajG1sF+oN+VuLWJoC7wYc8NkjgBPuSOgKA
	cYM8+6lN4IvhbYd+PjNtVfErUNTaIYhs2zaHIAY07ARGE+ALkRfcW/2Cv3RIs7P4VHbwnWfb+l/
	RbvOwyHe4ZTA2KZk58NYarOWfVX145HppzDhELjchV0OC0swBdkJYB98SYBMzkb/T/UEu2F8wg8
	DQFefPDmpuszkZLNmE3+XZ+PCX22gWaL3PZLG8e/tr+j/MEmMqh+MKVDkr/HLqevykWZznv1PIc
	h7ZeSar7JlFj2Z91Zp9wKsl+qFkxIekrfgP0tmyLapYc4K6h0GRor4S2Pqfc46DVdQoXfZB1uH+
	zFVH5rEDAoBUZJcBi6LcPVpQNClf+7Ti5Lbub1pTn/gUJzditqxapCrCI0whC1/FNuQg0kpvVf/
	g0IrI4DkXhhTEoYoQA4fr7p1MytYRLEYIMhwxdJCEjGrHhNfRlEf9GmWJ5MEJGE3eFLOpD3Cr6C
	sMfk7oOaojcaLo88h2DIHnUqc6TA6aTWxUdUYlndX/2KCRaK7NO1ZLIWXV32J69zmyPzXTy4LFv
	wCWim4w2Z9CzDNIKY4hzRZEoo4IZ8dT2cM7TO2n9csemV9LiFiW7u5l18SBlAmimICjEQgmAmhZ
	PDO0UG17Urju29G3vTCxqqA==
X-Received: by 2002:a05:6820:f025:b0:6f6:f650:b4ea with SMTP id 006d021491bc7-6f6f650c080mr11136970eaf.28.1792107219806;
        Thu, 15 Oct 2026 16:33:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 17:33:31 -0600
Subject: [PATCH net v4 1/5] ptp: drain virtual clock sysfs operations
 before unregistering children
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ptp-vclock-sampling-v4-1-cba6ffc8ceb6@gmail.com>
References: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
In-Reply-To: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
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

