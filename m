Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744585;
	b=cMs7DsCPs/ppVjPLYeAK0dP5ADlG29VUMLAHrRBnLkcnEg2qDrrTMt43SnMO1NqYAk0v
	 fIF90niB2W0/131tCXTAc07byMoGy9Af+lVQ9BE0ZV3VxMu5HolJRtqU0V9Vb7TxQCs7K
	 13v3/gVZ2WpQpaq1Q7kmlpUvgrYMtgzBXFV2ooaAO00+wtjsSl7CTBl0VUvk/jMrAV6la
	 pW55crW0OefjkNCkhYY/TSTBZOFdTuJV2YTKJNsG4UG6vwi9IXF8GltTTUMfOuxy5wW59
	 WkHJkjmtN1CeDuILfhl/r4kQV4Nw47XAi9aJlWVYwemdZNAcnU5jkTh8qAINmp7IPfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=;
	b=pUpgzSZixk4q4PMMSmGgokDIZnp/H3Flp+KSps8QbayivA4oHt/U9PJOtzItVPFMH2UO
	 ZoxI1fO0D98fsfUzFhJqxip9ayZPegFUXezqPLxjpdS15rdwvI6/YQtmtlFFt6YUuFtR8
	 hZMeQsbVjl7Kv2VP/NY6RquObDylU7tQwZdRO9WMMXv9ShfMzaL7w+dmcio8KReqiSyYt
	 VuUB3sXj00IIALYI6rw/INdjjejiZTf0b9NV/Gez56+SHktbNyBVRrHx/ua03TzQCu0Kp
	 m6xBqV5UlGwboj7x/BneZmIujhOC43KgCTNQqasCknnUBnwy8p8V7PH7eIYnsGxP0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="O/b1OBkU";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC528606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC528606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O/b1OBkU
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso69854eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744584; x=1794349384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=;
        b=O/b1OBkUuusx7DQz9ovmSOPSSxAEV/QAEiEDArBnps+M9LDURrfuDVoWYz7K/VTeli
         cE70AvCQX3EJPH5SJGyoosAKCOCG3NL8rTLrFsNGqscz2ut4PvM/DT4gr0LZZ9hmvLmO
         kRVrkkfDGKX90/e7ioXLP8mqy7m70e9GE5+2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744584; x=1794349384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THF8Gn9zKSMxI2CX7V8w53BXwvAHKb6Wu9y7FvwOfiw=;
        b=TVMd3irDwfa/WHfr2vW9KKJ1Cv0O1rj5D5oELnhy14jIIXcsQuxUnbspeMvqlgHjoI
         rfzspJQap32n715R4Cn2w+5pzgeRX289LO+cmvVQeC87V2Txi1S7HhrdngCuBmXacKzS
         Ztu2xgEabyQWIoDfl7MKzyDg2rxZrep8ZvCsXF4NrL1F8y6eqboX9/Iij0LMzXdRb6gR
         pWoDcz/3XN+yo5lEBH9elaUrTyf8DOCsv6diIdP7T3WvJUpVBcpwwik3VnluiMCeh5ks
         FbNvLgX3ktYPxU+YNQBeEt8odgu4QknIIGWWDBLj8hJmrq3lo0ezAzajZZJGwHqd4t49
         4y4A==
X-Forwarded-Encrypted: i=1; AKwUvBwOxX5s9LwM+GiG8rCt7kheHlHRq8aKtnL8i+NTeIFjBQ3/OGaaQiKqQoCe/tA+Jw84q6aYyRDN1i/xUdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qnZOg9c0v0DSaQpIfMQR+3X15Hbos4AstxG837TPFAypJobiL
	b9E0MFHvyIUuwOquoizvOn43FbA4WE7OFm7S9+oREMR7xt6SKTUxBm28ynR/uGJQ0g==
X-Gm-Gg: AYBFou0kpSYvSM67YPB/qmoUqGZTvElsPV5r5Gp34DitO6bheQTwl1v97QIUTa46vxl
	YxrTeC4XBvYSGuxSzORPlmbztBEzm+/Fi9dLAmauQ5GLkSHsOk5tybsn33Lr8tCkgsZvHp0/DU+
	eOTGHl3KamH9u6f9L2GRC+l20K0ZDVc33K2LQ5ZiOlz8M277KnpBbbU7/8u7O4iDTOCQCQRpGdz
	9vaIIBxsDid+dvvAolXIulHocuxDAl/7zZFY05hxLs/CIl1cfU8BB0g90C7G4+Xwpv5iB/jzQiy
	z1WqlwlA+tHp0sf5FckmG5q6nQspuA/ULWSmF/ib/MpGun7MwDt2o/sK/I/nknsRiWm3UqF1nzB
	2WWLE6CaXjA/Ppt3NSBWYpjoUmc63M3gWRBDed50KwvKGJqYqrjCdrN+u7Gv+HgMBjUN/LefFGj
	2euG4aVkzyJszMdSlBQJ8iCCrvDVLJbMEPr3BmBALAJc5gpv+luCYW6bxPjg3sLmrI+FDba//ZB
	sL3JIq69uDECVSZOTlI5HhEa1RwAafyZ20eQwPHRFKco5jNcn5ssB/hu7o2LP0jain2mf+2LUwS
	sgUh9MVj6rHGaN2rVzV5Yx6uPA0t7TKaS2h/ozwLvHBG/netc0AAlO3Q+8hI8JkOzp7Jra1t4KB
	UYR1thRh1GA6avg==
X-Received: by 2002:a05:693c:69c9:b0:36a:13df:749d with SMTP id 5a478bee46e88-36a423b3dffmr18134134eec.24.1793744583878;
        Tue, 03 Nov 2026 14:23:03 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca38a67edsm988222eec.8.2026.11.03.14.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:02 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/5] PM: runtime: Only queue an idle check for RPM-linked suppliers (part 2)
Date: Tue,  3 Nov 2026 14:14:39 -0800
Message-ID: <20261103141442.v2.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
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

Commit be5755f023e7 ("PM: runtime: Only queue an idle check for
RPM-linked suppliers") was incomplete. There are two other cases where
we perform idle checks on non-DL_FLAG_PM_RUNTIME suppliers -- in
pm_runtime_set_suspended(), and in cases where we failed to resume
suppliers.

Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Noticed while touching this function in subsequent work.

(no changes since v1)

 drivers/base/power/runtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 304a2b123420..9d3508d9b4a2 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -343,6 +343,9 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
 				device_links_read_lock_held()) {
+		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
+			continue;
+
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
-- 
2.56.0.398.g882cbad275-goog

