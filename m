Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3DD412BE7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511469; cv=none; b=Mj7atnhiFyBjB8t4oQB28LJodyzLREMAm6VVN55skCDjJyCz7dbNtHEMl1viY6HsbmbnmpTzF/tFIthexUo2glGjeLShDp825MV2TPjEjNND6YKdMfHrVJB5++0KAgTFIuNx4g8VjnGXr9mDKHCzkh9SOX1cqFMCzQtae+St3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511469; c=relaxed/simple;
	bh=xBV8QPVdEcBZnuBIzyHhldDQGO+nq6BHDmKFvSTohgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QS/MxrmTXl+Uxmu4cERBzEigeePxRezoinuNIYHpDvJG6g0nnoILisWAHVumGXAwhjqyj+W5ulk36/zVOKwWcyNI0JiA4gzFwQoCUn/l89TTJRKpYbdSs1MBvkwFj9c11oD0v8dOWgkLzXXZ9AOT32gCfYk5F2KoTmRrnkPUjnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gOyGqnpZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gOyGqnpZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so753365a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511467; x=1789116267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=gOyGqnpZzfwLkK5A+xKyem7ZFzFwRRNhmEa/Bb2q5P0FH8aoiXR0DuvWhSSldr0srd
         VShMkTtxqM+Yrug6RUw9sakxDg9N+pbzouqSkIPCcJfcczAK2Z1I+RfmBJEtn/LTCtvP
         C/SgYX4EQVe9BVv5GTWfAHAIVad6KTsg8Q4EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511467; x=1789116267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=TiK/5JGEzxFzmATZ0ekmu/POQEjXVZt5OF1FL0/q+spoz3eifedLw6mrvVFdYkkodH
         Vw8FnzWFWQ6YCcf6ZqKczJrahmE3vinlO00yDh22pJtqu5Xn95bRAi7x3m972jenJPUz
         MPwtuln4WA8AEqqR8Q4vw+D1ogPG57TqrLcTAs6bgrR+OVkCQnwGarzm+sOcpLutlPYF
         Zoa2Q09ALC4Y7lY/UhhBVTwBk3SNTw6/YGb1RNLbbL3C47o1LctL+0Mq0rCgPYat5h1u
         in7oEJOVYeTFJ44G+22DmEvPa2ETqqHGiEz78AwkTtnaGADs8ZVs17rRYMKzM5tmhxxs
         grYw==
X-Forwarded-Encrypted: i=1; AKwUvByo/BChTr39SXka1/o/xYUX7Tbe/n1h0ZAEb6Qv3UjCbihY4HuZcG9JVX6lBwdECpRy/R2W6Rl1xXTkJ48=@vger.kernel.org
X-Gm-Message-State: AFuF++l7xqOUXKBcyycmSG0H7S3c0V6WKmyK8h8uED026ckXp6/kUZv9
	YJ6iH9bLjN4F7lkxFZuX+YEB5syESJTxY+BHdlYb5ZEFBChOflYhOdLN0IFAFhtdBw==
X-Gm-Gg: AYBFou1c7wTy4f93I1SjYy/ESOCYrjmQGK0yatmijMILAy1IjoRNC6bXpSRHaTMWZVJ
	kWVEE/7z8x3sMKKTEQ27yqjOBQLdcelnKvXWkSblvSYLU/ix3HhigbbzhXuayUX2XZ7GdHTcTS2
	3+X8G7JWROex8xJtv9ZRy56eh8p2E+l0hr9KJtIG+G8tKioZ9qa6QfgTnSR2sUf9wKVclkI7qfG
	ch5Qz17U9igB2GWE0ZfTMo5H47X84byIEMDmf/Tp+1QSy0tuM5dovdzU/6ki0bED8ZdCYcrRuqa
	O7HhRoG05sPp83yNPP6VBnX74rb4T3iPpkZSZUhmrxlv5zKd9LYj9/IudpD3HPdfqu7rlu2W/FR
	0X8/iHHbZ6/gnMY7J8CuH1o0Q5hSpGl8CryEjPPN5XWw286cN0BE55Ov7jXpERceSpNkSKpj0kc
	DdlE/gdfGbcs+5o4HQcERIytdMLW01MXL/cQiLvkDLs0RWfNz35weVYV5ocOhKzDGkPgTNwYTIk
	EwvHiQuCX3OzECsyqxHJrwjI9qL6sxvk2d4hDBogUkL
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr7405740a91.20.1788511462630;
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  4 Sep 2026 16:41:51 +0800
Message-ID: <20260904084158.1341550-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index de9848a9a9f1..43b2328a6661 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.979.g7e5102b832-goog

