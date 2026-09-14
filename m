Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1183A2E12
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376173; cv=none; b=G84f6BUTHyLZVi8OCnQ1QRCLdnmOr6Als6EnLBmoBcI97O5K7NiF2p7VHyLSQdK8/aVjm6QoDCwbK5SYSTJUAMCQ9VpytfhzzGoZfHlv4i2vHReRtGRaP2yoyr9Sj9gBM3ehrh4Wv7ndkkFxCcHCaEG1tvEe6LtzQhRyR40IVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376173; c=relaxed/simple;
	bh=buYFKyyOI6nkDO4XJeAK8t6bogKP2UdtNxsW2hJuAhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtkeZclON4d9LI3gY+Zai4DbgyptrvGYjPu9Wf2dmG9bauBlW9OyNnx0O6FxAMqjydcRrdgw6+rg0AQRoJyo05SLQyhuj+HYJFcidcD26m4ONks3QX3LK34557ONROLSXQh0pKFRmtWNSHdM6RyxoAlj5HzLUUWimMJVXQpXrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBTCnQvN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBTCnQvN"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so19889825ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376167; x=1789980967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIQQRpZFhYMmIKFPbxaVocgdRA3zgYS4JXAKQ5jg9dQ=;
        b=iBTCnQvNUllMzmD9X3c2XuxcIvT69r3ezpV6V8/9ImHJThINhdvUb/Ci5RlyF0E3qG
         vM6VjGYP6KdjRessTFYUmPYwLWFSKuSECQbJZ04t7pIgDwdeNR9lOA1tWDTYtCAiMMQc
         /Z5sHAcVs7zwNCUVlaTrgElYKymdkFt50Uaad//0EK7R6FYX46MPUXwd9kNFON2/4nM3
         tSimxTaGHrbHYhE1g03urxMRAHBvXM3PjeoUZOfEer/15tGXtIlf5Tiq3yNAj6gL692i
         VzPY9+GSgW/74JoZBLLS4DJKf2op5+n3fllRQIPu2N9i4JzZe2WkCYfuGg8AmZhG/S4q
         bTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376167; x=1789980967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIQQRpZFhYMmIKFPbxaVocgdRA3zgYS4JXAKQ5jg9dQ=;
        b=r2GDOE/hcsgia+7mqiXJxEL1AJLnQxfXMo4DXyHD8FFHe4KPrrwBRALGbskXjfAY9T
         jmfZKbIHdmPGs/xbETTp5YRP/sFOollUioCC6lnGKjFMtqetlRzV5JP6tB44JJv2sdml
         Sdxml5d2Tmy0tBKDAF8+lruquChYtA6V8s2YKB7dQXThGXRvPBtrhBcgNI50ytrLQ/UX
         CsOdixChzE7Tf2xkH9vHxeyuD9I6kVmYI+obXMpDsbNkRIWYhzI5dY68N3imgbPfb6B+
         OjR/gZxO0RQUKwQvU8uLt9WvW+EpQbkao5Bdm/8mebvNZsqL1/gblneFYX8woM0GHwpp
         m2fg==
X-Gm-Message-State: AFuF++lnnNmZie6h/XrNTTdB2rqBcIyeq52jhJPTddeFLNNtV90HYKgw
	e2F5RH+m7Uxi0OonFgLc0U4PjKexzL1B46ZqiltmYkpBk4IFJ7eOC+c=
X-Gm-Gg: AYBFou3vajL9mDG2Wvw38+3RBbWvx/x+VLR5cZRB1m8wdL/TMMQcTxDY15YQOum69Hn
	3z3yVYcFcKe3hTroxSZV/mhKvD4/bbcczDsRIp8FZGxdhoL5yEekeMM12CRt6+zHGeMnMhQOUli
	A3KiiaO3r9QDI3BEqj2dIxrANtgodR13ArU+6f5BRmlbqLPMzbedlZ8pK7WAxkZaOy+Np+2Ew8r
	O0GYRwJOplTO5flMwBqk1nUPiR8/rSf1vetCQta7FjhiWwFdH4s8QMjcRkiBlm4f+BSqFsgpmF/
	YjN0oqsWWhbjlEu8aA/W/jxBUq7EqmvS7XB2JcmfRyCpYT4ZNkIqV/d7pqV2zeX+8MVXmW5jJDt
	HIcm1c3uuSZl+NULshqQ0X3bV2TMZUsrpxix6iFLALlRtPKUs80Zpz4/xTMATj3elf8ko4IQNnI
	ZhdC+aubYq6gYMwE7l1PgV/Hwh0nhvy9m++HDAYpKN7psENCrRBCuIOzQCOUjGKggEVcKHLtfEk
	JjQanXDvaRx
X-Received: by 2002:a17:902:cccc:b0:2dd:194:76ce with SMTP id d9443c01a7336-2dd6c5ef9aemr41764705ad.7.1789376167221;
        Mon, 14 Sep 2026 01:56:07 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:06 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 5/8] watchdog: of_xilinx_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:48 +0700
Message-ID: <20260914085451.891675-6-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
References: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_ptr().

This lets us drop the __maybe_unused annotations from the resume callback.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 352853e6fe71..16356d115b30 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -251,7 +251,7 @@ static int xwdt_probe(struct platform_device *pdev)
  * @dev: handle to the device structure.
  * Return: 0 always.
  */
-static int __maybe_unused xwdt_suspend(struct device *dev)
+static int xwdt_suspend(struct device *dev)
 {
 	struct xwdt_device *xdev = dev_get_drvdata(dev);
 
@@ -267,7 +267,7 @@ static int __maybe_unused xwdt_suspend(struct device *dev)
  * @dev: handle to the device structure.
  * Return: 0 on success, errno otherwise.
  */
-static int __maybe_unused xwdt_resume(struct device *dev)
+static int xwdt_resume(struct device *dev)
 {
 	struct xwdt_device *xdev = dev_get_drvdata(dev);
 	int ret = 0;
@@ -278,7 +278,7 @@ static int __maybe_unused xwdt_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(xwdt_pm_ops, xwdt_suspend, xwdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xwdt_pm_ops, xwdt_suspend, xwdt_resume);
 
 /* Match table for of_platform binding */
 static const struct of_device_id xwdt_of_match[] = {
@@ -293,7 +293,7 @@ static struct platform_driver xwdt_driver = {
 	.driver = {
 		.name  = WATCHDOG_NAME,
 		.of_match_table = xwdt_of_match,
-		.pm = &xwdt_pm_ops,
+		.pm = pm_ptr(&xwdt_pm_ops),
 	},
 };
 
-- 
2.53.0

