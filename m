Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695577;
	b=XRBN3ZUV7+D4lyF/kVkDPpFv5/YyKPlJNYaGM59ujPy4gwTDOL6+lO19pzCEIg+qBD4i
	 lLrLEjPHoo+/KojF4pwgBEQMkZN1hEgUTRJCaXmlkmWCulAFO36Y62yl7lacgZHEzP55/
	 Bq5+2NcJDKU6sD40hV0RyoX2tq9dF5aVSCP6xrqoUqLjxRZwykpGuxXUktukR7mMo0YeZ
	 9TLwRrT7jsXtBNzkEMWZX5mjlY0r4sN76B0hTNtzyiSedX4iafToCaL99atFGqbFcPtwf
	 ZiZ73dyK5thigCGKIXdpMYJWGspOvxLbqeW47RCO00AS+0J4kPyboFyOAVo+7k3KCrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
	b=IKomtyq34z2iDvH6hUjwV+4wCqfMONX89yyJA32Ef38CTgNQbEeeVOmVv9VYNCrFt+yG
	 itJgfFQ7btz20t/z/Xz9bnfDc5MaqzUPlNtI61MQSSf+vfIDGFLtxgWherHADq4ibdxX7
	 mpCt86xtKsnmK0104KS0wH9CZaH5XeGrgh5Ldr3023pX2fP2LDHsDJuJivCmhP1+CWHmS
	 SP7W/f2UbUEsLvnm2ZzslXvK90/RD4aEXVnQ8MxzglooeK02wczGpeD6VCoXywU0Rd5ou
	 zOuZxQ9detu2S8dulBlEKAQXhrvCgPVmo56ym34ifOWgYytVbjS19nD3HEwi9sETH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0q7FXbU;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A7606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0q7FXbU
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso22914635ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695576; x=1794300376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
        b=C0q7FXbUsSI2Az6wam+S8YWpYCHEZ+T45mTSSqsdmlvzcrXLJU6rdETKsjUpXKskbA
         AuapcF/9Wj7l+xVO3Z4qiuprrZ4GCLuVb05G62SI7dO+I8B4BHB/USOxOVu28lpLs/Q0
         SOb0dt47xENz23XHCFcvOZoHNwpnQ12gHFoDEx7ALPFs98YSzhieYTxtTAzawvK3flP3
         FFC2Ptn2wALJHQ9Glq746c3C2o5ML+VkVgdCfbYf9ivAklIOovNmVMB6F3ixLNouidda
         L+7onOkNSriFJUbUUOgC3njZJjCz6ofAS1knQilha6Wj6QIZJzQgt+TrMxWO9WNvRh08
         alpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695576; x=1794300376;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlACJn+aleIiiH7PZHd4IeV1oftT0VE5o7a2ILaOKhw=;
        b=xHwxnfLVRBbKweswfFUqzrhVrtgTygcTOHVjVtfqCTN5HzeRXsoYB98K5m9476qO3+
         Tv1soGGwS4TQvaURK2T81jgDr/8YUAYc7aExtfhzcKFgLOXSoVCiqwXrCZG9zO0UkJGE
         Amq1ne7Derj8GIzz0/rk8iJdK98aDoMRj+JR9uYBxgoaag9ykV8e253/OAfPk91cxYYa
         5gv12hlgqZhaBoxEymcmAtZvoRtPED4oBrM0LTCd2P9KA0L9uMCzhvlFLSrmKXShnb/6
         4xgclhvRLuEqZf2S9kACOGf1/zgSVFWIXZtRw5WcZ1mpZ2CodFNpRmAJCdwovUqMNm5g
         bc1g==
X-Forwarded-Encrypted: i=1; AKwUvBwtsld0gxJX9pnO0/IdMOipRXwLdb7FZ/a2e4VvwgPuoesNva2gEO5izxwvbsl2xseeOLWB3meJ91tmbho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mTNZPKuR31buWQTqAO5aX6NdJnxRwMGDWOKCUmwaImpkkqBXm
	KvaluKYW1AnMHO6fdiYyIRISG/f91K61AYyQ0jXdmXyUgpJflETvRnlp
X-Gm-Gg: AYBFou37pvUGgR4LPrOtU5oSPXqhR4+aTzw8LPgyuiwaZqlPWZFAbGn4jSA77bG6UCn
	ExynHtNq5EwDv/SVLWe6lku6O+bHlj77KXFxf5/PcUwDXn643hyJU2JNyPZt8ZVwQfOElC0IHNv
	11/DDra4lluc8Pd72ks9+ucpx9SpX5BZcb77hN7HNuu1ZY+uAMp0wnbD5ad+VG5L8vRy30EwY2b
	HXVng12K4k99l6QumXy5esMs4zv+C2S0bE9zEAMbb3X0bv7+1b/AlQHdDQ6vV0PsOrsGIiXjcgU
	+ER7XB/isYOFR5NzXDgh8i12dej7tBSEx4rcYrvXYHtiykOrAiUa14nK49Xn96nvc6D+Kd0DOcg
	aOoZMLIUQ5Z82KgTNcxqjk5vHeOkEc9qhKLHUHoBGNBd8OfxsWh1l1n85Qw+7ROzHUih4nyU4pU
	9j1sgtLfLW9Z7rjWSUy0TPVAznZHa22j7jmJJyxzASZyrZOrVxMb6Pp7M3pFiQJLW7pmRMprYge
	inbgv+ld7UNoAUfMRV22cYNhSeS2KSMfasFpSJQMAMEIUOGD/zfDwH9QB243Q0X5y8Ia+oUSnv5
	6syHCAkj4ZhBOZ92ZZsxsHtkhOel2ug2pzvwE3CYUFRQVPrJ
X-Received: by 2002:a17:902:f686:b0:2e9:87e8:71c8 with SMTP id d9443c01a7336-2eb36395e36mr125228405ad.4.1793695576032;
        Tue, 03 Nov 2026 00:46:16 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f635sm39075315ad.17.2026.11.03.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:15 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no sensors are probed
Date: Tue,  3 Nov 2026 16:46:04 +0800
Message-Id: <20261103084604.700540-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

rcar_thermal_probe() returns success even when zero sensors were probed
(the per-sensor loop simply falls through with i == 0), leaving
common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
call list_first_entry(&common->head, ...) unconditionally, and
list_first_entry() on an empty list does not return NULL: it returns
container_of() of the list head, i.e. a wild pointer into
struct rcar_thermal_common, which is dereferenced at
priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
A malformed DT node with no MEM resource triggers this at every
suspend/resume cycle.

As suggested by Niklas Söderlund, fix this at the root instead of
tolerating an empty list in the PM callbacks: fail probe with -ENODEV
when no sensor was probed, since a successfully bound driver with zero
sensors is meaningless. The error path through rcar_thermal_remove()
already tolerates the empty list (it iterates with
rcar_thermal_for_each_priv()).

This issue was found by static analysis; we do not have R-Car hardware,
so this is compile-tested only.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail.com
v2: completely rework the fix per Niklas Söderlund's review: fail probe
with -ENODEV when no sensors are probed instead of guarding
suspend/resume.

 drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 9a9038671..6a1e977d8 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			enr_bits |= 3 << (i * 8);
 	}
 
+	if (!i) {
+		dev_err(dev, "no thermal sensor probed\n");
+		ret = -ENODEV;
+		goto error_unregister;
+	}
+
 	if (common->base && enr_bits)
 		rcar_thermal_common_write(common, ENR, enr_bits);
 
-- 
2.30.2
