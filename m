Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C44772B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545584; cv=none; b=rBIr59mALNsWLpnEU/MyoDDRZqnUSBxHQkJJBTz1vmOK2IVc32GNLSDE6sbvoNsofU5hXk22+tM4L5/iJht8RqWeG9cyG9p0tFRF2FXaBC56MzW5iZrXrBBYtZ8dtm4ANyydn1ASL4hNFa1XVnn8LYTtDh2HrZlF0outvP4DDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545584; c=relaxed/simple;
	bh=eyI1vaHvczB69tPN00V8OLfMpbO9IL68H/HlfpvrLfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG26P297vCpz1wrNxdtoL67H3Zd1rEUdnMnxAOfvshfNwA0VUlWon1gZckJ88EnJkNkUWdfz+r+Hi0Jh/edCh2B7ZZkOwVdYtfUfzxFB657z44a5lAMbhX1o5Bwpj1B0ndQPC5+H0QMuxzrtBj3/gwlSJi9NMwNW8MW3So8JuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EdYWdqak; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EdYWdqak"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so593565a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545561; x=1790150361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=EdYWdqak89mpGcCcIBBIMtsyZhroWNz1AS049I9fmXFVAZFhiphJZcuAOtyVaCGoAQ
         3tTGpR6qDAYUev2vE6cobStk69IjGrt70exJu50kDrTkne6lTpdWr/Rv60/91Eepttva
         79ezHXoQ0iqFtMl9WNAlvPFXVJMn6XgZLp1HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545561; x=1790150361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=SyFsi7Z0cqY3qBgfogUQWkcpxBgGMRZHesbTWc5+QKRjPaARSnhmMhVlt6bxP38hyH
         m5wG6aLnAGAiQYhR+ND7FPJ9/FN8z7SLEjHas11bykzVqOJ27VdT1dOtJ05KsdgPMNxY
         +uRjqmyidzV4BRB8Use1+5F9jvUoJUBd6qQ8yQgMIaGkMBnIZqB5nziofCabB+tkBF8L
         H2+yy/gMJDbukYyF5pY8TYlPfkOCapDX9Ehp/f3qEUYazA2AaDchY+xd35ISdzzPKl8C
         Ww4TbR+d/US75KWkMK7UiBCPiMU4s1aiv1eH1YnWKkDN8mpKbax01RglATQGOXtSXOtv
         aaOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsQIYUIo/sHiapZuU+zFbf8Ws+xRMhs/lCtKIcQAxu0j+4SxxtUVSx/UGbxta63UAoSjBr1T3Emz68J8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nJp8eaFQ4mEwIXHBU+yU19qFRF+IWONFHmKn4WpfriNKmgKqk9
	Tao7bIsjy5m5nJWp3zjN7KxxD3VLVjiYfYPTCvAsZhFbiGf/kVdAKF8Zpzcs4w4f8w==
X-Gm-Gg: AYBFou01pEQHCY1EAaZA90ujCIRADx89EYgiXMMD4fqaxBg2Bz/DmATQ1t5xqjt/uWp
	xKycbS8n25vjeuAqFsNKwT33QGMzGNfa2Xd6ogUJXFt1N4c68HtpTfzSVcaYiqtmkwtPwYIU7Ul
	PPQmmAApVSvPcxWz4p2vAI8w4lhIwMErV9nErgeoCmuCdIRx0z1qRFtutr+3kRLrAJ9xvhdoigQ
	bKPOLOi2+MBvVl5bJ1sYKXiA+JIIEuGFtN7+eFryCdHt/fJbywjsmiU2cnfm9wipWqiLn+hYE1i
	2LcOY6cbM1jBdBE4v37CwbgMNdD8kbI9wTC6mtppSmGuRSuVL1XwMBtrUXHoxLS2dLZ58UZWb1Y
	i5PmJz2P0w9lZ1Lct7zR85VMeE4+vTiHOohXjieyjZzPuOx799QpptS3jTVq1kau9O/4vl/csWM
	+ZUFs//wRgu5MO19quOGlKUocPqEdeG/XpoDNGT5emibCRTEtnDaZU+CzxX2SGPqJwOnRYnvLWm
	QkDdzppXHwd4TT3hpm5Gmyqv2NDLmCxxArXrrYh3RCpWuRNb4gR5UzqMw==
X-Received: by 2002:a17:90b:3e85:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e1e55f7ffmr3982483a91.24.1789545561399;
        Wed, 16 Sep 2026 00:59:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:20 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v9 11/15] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 16 Sep 2026 15:57:37 +0800
Message-ID: <20260916075745.3549953-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
index 322c307ce6c6..350a4c8831f7 100644
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
2.55.0.1032.g73a4cd73de-goog

