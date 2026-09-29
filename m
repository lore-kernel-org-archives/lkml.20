Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658B4F68AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676378; cv=none; b=fqUYwILx01+iuir//v75PrZa/G+EBdaQfwKH+IgnjPyeZIIh5KOx/R5zwtA6owGpiw7PaXWHD8qAk83Ct9inC9115ZyAseIzMeiVP2ORrGxuOZilQHQV+8J7f8x+X4+yGvVJuF8eLdMSt9nD2cj937lfGXItjmh72giXXRmp6i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676378; c=relaxed/simple;
	bh=ShugmlWzQ+axlYeISSDfAQXNJTdMsRRo0wVSobYI9Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kT0UT8qALQPmjcBy05PaoHCHjmiO1nNxSGBO6fgZnaRrG6sG1G0Zyav2GFwLNgQIpOpF+hBj7FMKa8ZIimw2R39Ix4/G79gL+843t2cLqDCbVn5GBs+xTEbGgDdiDzuF+CJKA8SseixvT50jN9YW37e7Xgu+qD6uUepekCnq7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=RvTe9qwd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="RvTe9qwd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so31454005e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790676366; x=1791281166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukRavR0+R/g1KM+J7IJTcCj4Xa6LxCCXFXLdFwBmwpU=;
        b=RvTe9qwdS1wtNDCbRIsnLKiGnXTSYhU2aArwaWST3kti5NAgzI9/ti+VrT0JvAfRUy
         EIse878ODl5LNjlTy77n0YsyRPZtmaf3zbrrpDUCKMUrcvxI8DfyuUXuxn6hsBRz8eav
         MofcGLgEhgR2cL4LSbyD27ey4vcmTXMRe16OVWPSYGXmvogqaP+xD8YT8xVb3p1M+BMV
         yvq0Nz7aBFW/FNB2Y+/hayCxVbXb0aQUrKZKEy5hOjVCIdY7+YSOE+k0oZjS9RZKlkmL
         4pD+ZxX/9Q+COGYbNcF0vMBJWrspteZ+G27rS8ku0uH77CX4/A0RJLCRobao4efjIA2r
         q1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676366; x=1791281166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukRavR0+R/g1KM+J7IJTcCj4Xa6LxCCXFXLdFwBmwpU=;
        b=pfTzMtT+qlompHFWXoiRoINIoRdmIpKhRXFbbcDszaepW0kwoOGFWllTknRWn9nOJv
         +eV8xRWpG5hPJNrLf17VVWfIzKj/6HLxzh8O+BWfbCBAVIjfOACt9KrHM4DwXpfteGJ6
         Io/GwWncJ73k4Lxra0xnsLySrRvFJzTg6H3mGlHhFXQW7F6e5aqoNCBQI4zXvjRncjAC
         vYa8KgSuPyqWeBQQlhdSvbN8tnE+jV3eaA9zc8Ld3hYg+HRH7P1ol59vBxpuvcn35iAk
         XuHyc7TfK0uVcIs+x33oEZiYuw+9mNiuQtkMZD7M4QB9ocbrBnDICw1V7BlyqAJYf4ew
         AmMw==
X-Gm-Message-State: AFuF++lxVnT8LQSa6u/+GBmAWkqJIa7d3RF29TLn614WGelFx2fg6MGZ
	iN9xIqV//HLHeW1vliMcitZYT0rg+s800jKlBafqKSvDl7rq8zBKbOaeQEzhmOUtnLY=
X-Gm-Gg: AYBFou3DC8kgQ/vbbURN4CtVEJ491jEeWxB5y/XGd9V5fYxlr4NbhwlHyg/vZ+R5gtw
	i9zG9KM0wRd+FbC5BU4k2dL5fZG7IjEusxRDOJc+RM7Mm/FQcuRBvYgbT6RP8ouY19BnPm2+MzR
	pfKHZ35j27JQ02NLKjwKRcKGcRL4fXggsO40LbHLIZoEalkpK/I18GUpSICHlthamzDsK564uVN
	vYkv0Y7m+uDrkMhqR9SeFpeGTboXchxrlSvOGboStNyTQr4wsB6K16qEhcFv1VRN67cSETWlRdw
	oAgMdm90Q8o4aT5JpTs9vIx8dktfbXYsfxLDOTR1oGjbwauDJmzNlxJL1MGk9alw3EOWfasiXa5
	BjfLL/ijpugxsEWL+xI6v1Xwz0UJyCFDbF01KKq/j9TbZTx0Ugm9oEmQwqnDj3b4PWvTRrH0GaI
	Ax7vf1cIjwRt4Ta5sJ5iYmjTdvurkkCl2jpHZdaTqa7icekb7qtfWdKRFyuhB0bjZ7d18DY369c
	p0s7bW4IXGmUV3L
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49fe66f9fe3mr275023955e9.31.1790676365876;
        Tue, 29 Sep 2026 03:06:05 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f79dsm2954995f8f.6.2026.09.29.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:06:05 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:05:48 +0400
Subject: [PATCH 3/4] power: sequencing: pcie-m2: Fix leaking array from
 of_regulator_bulk_get_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-regulator-get-all-v1-3-e887c66a47f1@flipper.net>
References: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
In-Reply-To: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=alchark@flipper.net;
 h=from:subject:message-id; bh=ShugmlWzQ+axlYeISSDfAQXNJTdMsRRo0wVSobYI9Tk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTt7m15c+pMVMvP3nmVCzY9SDy54GzM04bw+nyrExdDN
 4lf7QwT7JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqi68wMsxI18jebmlg+G2XWuSld11BNwUXLzhvdu4BV43+y3UyJnsYGdYwz2/
 +37siqnD9lao/K0uSyrjlHCKu6x9m8l7JoTqLnQUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() allocates the consumers array and hands it to
the caller, who is expected to free it at an appropriate time.
pwrseq-pcie-m2.c never did, leading to a memory leak.

Add an explicit kfree() for the consumers array.

Cc: stable@vger.kernel.org
Fixes: 52e7b5bd62ba ("power: sequencing: Add the Power Sequencing driver for the PCIe M.2 connectors")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 91916768e922..0febe4b3d980 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -613,6 +613,7 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	mutex_destroy(&ctx->list_lock);
 err_free_regulators:
 	regulator_bulk_free(ctx->num_vregs, ctx->regs);
+	kfree(ctx->regs);
 
 	return ret;
 }
@@ -626,6 +627,7 @@ static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
 	mutex_destroy(&ctx->list_lock);
 
 	regulator_bulk_free(ctx->num_vregs, ctx->regs);
+	kfree(ctx->regs);
 }
 
 static const struct of_device_id pwrseq_pcie_m2_of_match[] = {

-- 
2.55.0

