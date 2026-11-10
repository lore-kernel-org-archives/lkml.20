Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332037;
	b=wCHyKlwCw8NZJdDoc4KZ+1aJApNwMp/P+JXqKJI5SN8ayOHxmmcztl66FNxwJ2YFa1NH
	 pkOWwlC56CkKagq28UGyMLTc6367OZPx9dHwHbOmcJsqr6HagV1cTtZAHliBX36+1DE+y
	 EoDao8Gm5EwPv0z9LNxdsdbw4Nx9vhZ6es6xUFWVgPB9MyJklmv+XRUCEynOKuLHtkIjH
	 MOCx2wL/7SgEcCTrnp7SyyNsD6ueImAuQg7KSByEaOItYyWROdEE7GqsguWYJ/bHtLjFy
	 MyKm5Cux3CviMudiSy3mdXHGlvXr15k4sugcf7hPXuwmaAx6YhQGVJZg4CXTLL6RqFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
	b=q5I+e6uvDAsgZhyb98aAOOy+cJSvKN9bYKw6RAxfmWcScehaUepXPARn2X1f2SWXVLok
	 8TIgWXBEW/FiwFpHFV/P7F1P5yXeY7yzxxCRsai6nhrjoKp2XWNc1YWXJk4mdkFeUpOun
	 RJMNLTDUi3M186kh59Tg4WCtmLzZMxiSQc+zSOs+tppG1RzFUmko8YQN1lOsa5APnHP/s
	 ldiklQ2Gw7nM66KLJfTgvj4zfUUpMqgKb5NaK/QnbXu1wjy6W2mCXNS6Blrn1hLO7DDxs
	 O+nS10/HFmMGgMgbGZIe6/dI0xyYaxGUvs7kxaTgYA4fl+WBrXjrX7yqqn7fJERWQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53665358476so21611991cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332036; x=1794936836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=eyRphzfngUXPZtGUh4ciZsqVuoJdIbbdOdc0R5SX4iJRArgXjvj7ITIGNm60b6Oyub
         1d0WvouKJHWbAXnc9UddDTEIQnpxJoWMEuZuw2oGyvmrpQBJdVVF/qVFsyz/bME9anR6
         OdZNGDp9nwjuMGwdY+YdfbeQU6V/KEGUg4KKdwMQpZwzQdAEMY/o1SRtzfxbSbMp4DSF
         1B6fC57Jg99jAvGZBDgxsx7IY5krV6bNBcK3owZKjk0rSnQcnDMzRs+XjJoxzwWGBMQG
         2hjuAIoMXqtnbo0kRBwkygFhlkFBkrZ+vTP/ijTQaIrfOrQySqzRLsVdoj9jbIKdX0WD
         OZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332036; x=1794936836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=wp7m244T+UrscXLzgUySp2hfnKTdMblGjxGRCZy0uLtsIytYI/PJoCu81kZcPwXvux
         AZiwJWrddYFjUNRpwTJKMfqkLo/fh+WT9zuv3867SXOmUncnV7nriRPP51PQkPDVBt+7
         UDyqz6IqfkdYqw0E5rFITp3LOJKQ0sQ4EMzt5W1wIbspBamErLTcx1epXUGpCe7KDVKt
         8YT6uz8metDmrwkA0BhAaUs6AivNb21al6K3jwPIZttaggdr19jpQYX0K/AWqJy1rIwA
         RX07mI6BmZeYAcPxzg+iy+FSPtt8YHa46DpD+7iRVQMwO0a7H0FDy4RZe2qFSl/9msbK
         hn+Q==
X-Forwarded-Encrypted: i=1; AL+hErE+noG3sIgtKPNw6EgELgCzE2HV7j6EQK7Ea453gzMgR6+53/PSCs9+OYJnxYr9RwcGIJOcfI4QDrlDhkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z89/XpRaqRnf5ZuPMCtGDDmC8WVnW3RA8cZWG0p4x/DoXEMYDe3
	6JBzPkYPKVqR8ijbjLKQ36DrphyPPwE59MuOZbuXkKK7SWIEuTcH+Teb
X-Gm-Gg: AYBFou2TZaaA+djA09rI76GVu3x7erlxT1y8fsnpCpvRF09WTvlc1GK7P3hu5jaGor8
	EE1Abo22rOE6LDlZIZNmmSzK1IJ/7Cwr6YNedAkEI+TeXBMgGHXB8RfskpLCmPcTqG8wnvufvUd
	x7tqhRJ1CMCKwTot4wJoTA0CEWV9nCMzI2sLXot0z8AH0D0WPS8w300jnNmUspMPNop2aetCEiR
	beKHh7eiP4pEvz3C+W3BWZ8vaz97BUlApuwjXMJu/pagrTDxxlKvI1yxhm9+YHuZ28DFoIZx0dN
	K9rslRfJsCwFuGHfCI7UX1skJmFVtj0nlC8ezxNEdmbXBNtoVfR2fLWZM9o3C/1IiYDy50+pb7e
	q560TZko8GODpTzbPY1GSpAHFEThBHOoaAHKDjPuNEod3B2E5XdjW81856JpnFC/n0XBVsiqi5s
	T9OJ9Oe1ksGeOmDgecSNiNbu3b6U59Hgr6thUOek5m2hbqzf+YLtI5ejxn070zlgwJq/b/PayiS
	1YzLmOw9xIv2aIQamiHSRz9c5TPFM7CCXHaHJrotfgYZWAIu+/glqkLH51QgliDZqpXKe89q1aa
	CiI3HmMuA8mF3yIqUoFrIESwGRqMRlYucGA/21axVVexN1nrLdfquHEFNNgCQWyC0k9EmG5/TiK
	OLavsmFY3Ve9C6pKB49Qde2YjO+s3ZYVSwmNA6+s8tNT38dnIWtQ6OHm+a0rusgpiem35I6tdkc
	+OJJnNZq1jArvn7x8wpt2ncIfG54mtfOigEXlisKbsRCR8rhAX81uw9qB8HivAVSyeV1mUGPUi1
	OeXZbLjYjW2s+RAq1S7ph/ZtMBbM0nJRPOE0pJgtfjJlA==
X-Received: by 2002:a05:622a:1ba5:b0:535:1b50:48a6 with SMTP id d75a77b69052e-55525fa6c73mr51407731cf.6.1794332035626;
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555065e4ad7sm29130471cf.0.2026.11.10.09.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: unwind power domains when registration fails
Date: Tue, 10 Nov 2026 12:33:54 -0500
Message-ID: <20261110173354.41274-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

gdsc_register() leaves the power domains it has already initialized
registered with genpd when a later gdsc_init() or
of_genpd_add_provider_onecell() call fails. Callers only install their
gdsc_unregister() devm action after gdsc_register() returns success, so
nothing removes those domains, and a later probe attempt initializes
the same static struct generic_pm_domain objects again while they are
still on the genpd list.

Commit 86b23609d5e1 ("clk: qcom: gdsc: tear down per-domain genpds in
gdsc_unregister()") made the unregister path remove the domains, and
commit 16ba98dace9e ("clk: qcom: gdsc: Fix error path on registration
of multiple pm subdomains") fixed the subdomain part of the
registration error path. Make the rest of that error path match
gdsc_unregister(): when the provider cannot be added, remove all
subdomains and domains, and when gdsc_init() fails, remove the domains
initialized before it.

Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
Tested in QEMU on a 7.3-rc5 tree, running the real gdsc.c and genpd
with a synthetic DT and fake registers, with failures injected at the
first, middle and last gdsc_init(), in subdomain registration and in
provider registration, plus sparse arrays, explicit parents, a device
parent and a pd_list (52 cases). 36 of the 52 cases failed the
cleanup checks before this patch; all 52 pass with it.

Registering the same objects again after a failed attempt still
reports an existing kobject (-EEXIST), with or without this patch;
that looks like a separate genpd lifecycle issue.

 drivers/clk/qcom/gdsc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14e..8739293 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -647,7 +647,7 @@ int gdsc_register(struct gdsc_desc *desc,
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
-			return ret;
+			goto err_pm_domain_remove;
 		data->domains[i] = &scs[i]->pd;
 	}
 
@@ -666,10 +666,21 @@ int gdsc_register(struct gdsc_desc *desc,
 			goto err_pm_subdomain_remove;
 	}
 
-	return of_genpd_add_provider_onecell(dev->of_node, data);
+	ret = of_genpd_add_provider_onecell(dev->of_node, data);
+	if (ret)
+		goto err_pm_subdomain_remove;
+
+	return 0;
 
 err_pm_subdomain_remove:
 	gdsc_pm_subdomain_remove(desc, i);
+	i = num;
+
+err_pm_domain_remove:
+	while (i--) {
+		if (scs[i])
+			pm_genpd_remove(&scs[i]->pd);
+	}
 
 	return ret;
 }
-- 
2.56.0

