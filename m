Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464F40DB52
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763662; cv=none; b=BTG0w5l+dCSX+sMJhgnv7K+EB5IfDM8Sc3m4fJ4BHc5qIeBH1FBtJNZX8aK4W41cn67TtUyyJAWY80c2vsJqwHXXpCxZDDDbzj7Tdg7ue60NT5gR33C7GV+DbCd62bpbOXpTFewnw+fqGBYjm+gm6wN7Nw70jlHsTjDabIT/6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763662; c=relaxed/simple;
	bh=Q3bBIxz90yEEYsWH5ikWyXfUpYba5QGg5QwQbHT02IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcW7QqxIXcUyie08QGbmiQwdCti3YS0b0iYMGeIOgPcs4p6dZRw3CY96b+60c2g4o0ICxz6XmiSWe7mSDyL2gAhnwrXzsfL917CMWN0Lor698xG2RIM0zo7Tp3pp/HUxuHlVmzCYPn4qdGGBr5jVa0vTIUGb5L879QwWSmuY+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAZsVs8m; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAZsVs8m"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3467232a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763660; x=1789368460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=KAZsVs8mh7GDKrQAO6O6sFD1lealyJfsfycKd4Cq8TDv5qJRo2Xv0wNqiSeksip3Jo
         bwaG3maYCK0tnc5KilVd1m53J6omDjYYFBn71RxoIQn2CjnFrZid49ZKQGlVORxQXQ4w
         3EuR+ppm5eOflUmC3jMnalDFXyARUu58qNYhC6WPGNF3VwWzx6L02Cx+4pq2qxgM6SbI
         GRZZgP026U+q7V9bSSs7Kb2SDFe+0hz87+JGgLz9N6gsHe4Cy7Xg9Uu/nYOxbahxER4q
         PD9R9MH5gP9ZU/kkKV1i5mf2HjR19R+PZXTecqVEkWMSuD7YDtCw/JMxaIZ3gYBTtH32
         0YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763660; x=1789368460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=GVM38/2OhcB1kCcvbaon6ZaR/eGnvjB0N+yki/ULO3epoiJPvhLM8nbq/eGVnybLQo
         O3EggMn5lvjWv75eK7idD1yObAGSEPUU8areWIolpDXp00gr10mYOlY/2kwWAxsc+FgM
         GfUvX556Wbt/5BB1IyHUwdCYmiLlr5e8d6atNh1HBPVejOqWiOTbpA88n9jF4Gu/RowY
         LpldfeRb921PZ4h0JMYuxq6he0cutD/eqGgqcr7jajAWs4D0pAcMtJG94da7IFbj3CT6
         aoxP6JXf+ux5ZsYpHeeu/ZrjGPiXKyg0GddfkmfCMxAB1Ph/iuAivASg/6/eX6uptkal
         4wSA==
X-Forwarded-Encrypted: i=1; AKwUvBwoNbcMfgxoo6q915qrhQzWqbTVSZ/5Vn1vt2MIIArBnfcXMbIRm2a5tSHGcUPwK1Soqj8VHkQkFVjwjF0=@vger.kernel.org
X-Gm-Message-State: AFuF++kyeVDqwNDw2Vy1dyJQ8Q8hOq06BWyTlAgF8FZ4nk+eOrhGVazd
	XVBJv0MpfNIIQWksmPgBqAzg1utbaMNuQOcesH7LZQWX9d1xQzL5SetI
X-Gm-Gg: AYBFou3JstrgyE0VLb4T/08iZuQtIwclasWiKaRhKJwhhasxiNEirkMjNxgA2K90rg8
	uV+B0/1qU6yobJ85xgUdqKGiSJaT9fSu78vmDk93I57EbGg5SATlFfSrr4BhQs8Tlt8/u5eSFtT
	/dVheNnfwqB5SU4ceU9gqNfVacQnZwRyuUHibVpmaO/BnUXUOO9sZJNHTDRlqzrn4ZzHM+p857Z
	pWcuc/FXrqFn/P/AMI1Q7G3K1F/KnMN4Z+KTy50kzf148rs/s66AtDpjELul3VDWIS5eFibneZ4
	UbTpXpr1FKePanTL3VWGvAQzfoPPK8ml2g29UN0fDdkl4KlfAfKUTCxdbU9PARQojuzhKGCOeMJ
	77f7usFKL69mb48rYEh1zg+Vh4ZiY1IgiL6P+hlA+u/NQvv9jY5NkbEQfdLM9oc/xNk2pwtwztP
	6+UcYhmEHtdWdMACCvJIBzFskhUuBBFOCorsm24rRGm0q6Nmu/Doo1/gtVozlm2zYS838IdhYKa
	ihEUg+LXvdo3A==
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr31452068a91.23.1788763659995;
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 1/5] driver core: fix typo "sucessfully" in comment
Date: Mon,  7 Sep 2026 12:17:21 +0530
Message-ID: <20260907064725.10686-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "sucessfully" to "successfully", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/power/clock_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 59bb37e8244c..3b8ba27802a8 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(pm_clk_add);
  *
  * Add the clock to the list of clocks used for the power management of @dev.
  * The power-management code will take control of the clock reference, so
- * callers should not call clk_put() on @clk after this function sucessfully
+ * callers should not call clk_put() on @clk after this function successfully
  * returned.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
-- 
2.48.1

