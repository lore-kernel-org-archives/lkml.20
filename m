Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF3524AF1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859155; cv=none; b=T46kQr1K8ViBKYpe2hIzb7f7/4rsbv3FlI45KD+vcvQnwRa5lW3++rju5AoC6NIjDCorsOhucj3dSvPlD/G2ZluXGfZJC/UbAA9+YkE1wf9ETDyHwxdfaISX6sNIijR+bPNV21pFVS8R3m4FldawfLkD5fMR/dDvsekEJvQj18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859155; c=relaxed/simple;
	bh=aRiB+/teBjIDoYnRyGta0AirMhnk2B3V+bGT69BxTT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbqXNYdbtA/DddiOj4W08knzHR56jCmDbPhPGiMhxP58keNDELGIcG4X+9rIaIf5XyQZBDqKkqrZNfQ6SaR9EY6LUhSdJu92jy5opOFv4pJu/i06fz6GbfIsQpdbOIi2zUwkFuT6EnWMV7WlDZtxooKMDVu4ouPxXiNvw3YmQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=hpN+HYXT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="hpN+HYXT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3506428a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788859153; x=1789463953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+p+eQJQq3ynMvnkReVl5XGX2RkMKrQ5ziE2R3ggq0Vw=;
        b=hpN+HYXT5sygnHKi22fCWVMGkdcxPif1YITvIhnydpyIwUCnOfAVvx/JFf7XwnBUWs
         x6e9prKs5xrXJhfakzFYV8J7FGuOx/GRUHGBAYiVI4pMifplt/scF5XvV4I+jOs2uNxl
         D5sgxFd536p+PZoZEtz8fyxpQ8RyDzNz+cK9HBolRXrd0x6mh+iPu1tCYlqk5quD/R94
         pj78x3r8oM+SVmjixPOr+A4/8yN5W3DlRQ2e9Dq1J7qO2a8B95tq6yIMwftAZq+745LF
         UjMUo/GQhKC4OdfcsQj/1/J1uZFjyJW98P8aqEd6mnhBE/hhYspc7qvxdP9/uBjTMNCj
         t2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859153; x=1789463953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+p+eQJQq3ynMvnkReVl5XGX2RkMKrQ5ziE2R3ggq0Vw=;
        b=SCyueQf6pMyj3ZvpaZnT5w6fOZdTUHvlD4VyZwik+RTQ8/rUwRf2aKPFBs3uHC1I66
         w139uMooL9v1AQe7DLiLiTl9+hzJUut87BJYbD8OAKGv2NrfvK1kj/cBzXRak0I59+B2
         X6sE2uixmJB7GrAtGmuO4lUeOPATEen4ibKl+aCoDeTy60XZPri2dTgqmi2j69cMTEk+
         4okW8rLtF0kzG2jqFWoBpOZsuEL4hX5kus3p+9d3BmFBMMyrsK4tg4DllkNfYX2YQGl7
         aaCBuh6abhf+wV0BaFA/QtCdIMfzi6BdQ8x7yDqkvOJ67AEIUvfwK/p/11s/7RQAEUFK
         FnmA==
X-Forwarded-Encrypted: i=1; AKwUvBzs2HtT2fmX+SSjrcPaSqL+FMEG28ti/Pe2+p+Hh2ckdrMbl7N5zu02aRYSZCi9bTKpPysypeMff21APAo=@vger.kernel.org
X-Gm-Message-State: AFuF++leIIr7n6gZglPKQV/hZ2UxRICiheH2e2+JqtIB/W3Qa3qijEIs
	JtEDV+WegwzLgXMbkIZYqk8FkRl3nWruLP+Dq1YAwJ5cXTdML9zrFODunQxkTlfszkI=
X-Gm-Gg: AYBFou2X4M52X16TI55XAbau8n74Gub3ejYX+0iwvAEnHHSW4i4ZYl0tWP7AKF3+Fht
	7XfzndPs12sheTIgyFQiQC85bmoFc5jVtSjdB2NYvsGzvz8a1Fq+BTl9IokORcJQPiaZ82+eQKe
	PSjCwhN5s6+F9PrV+XCj7q9NvNsynMd9hbMAcMlmbGK0NrK6FBjIyg0seaRY6GugJ1PpfL8KHkB
	P8YIeY7cXl+vWnvzIneBAgY98DnL0MFCAsSAXBrtgbCaXUcbIe2h0bNvY0O7CgsKobMDGa/dIK4
	8dOG1q7lVYzGTbrN+ar4fr6w8NMFzC7vJ24xmnbqiBn8Uza/pbGCdtpFIuUmymoMF5ChLJJ8Ugz
	mlq/athdUn7A1nl/eh7CoogDxhjyno11vUoKkeBKwFdedDTuPirwGs2hD0iLYRPpCJyV7brInEG
	O7GxyUldJ9yDAgEB/BUQZe00DBxdIzkuHDr6EKpucwIWiI59A12jwAt4sIsLQWkfSxxCKZcXELX
	oWPDA==
X-Received: by 2002:a17:90b:1343:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39b26123302mr48843690a91.3.1788859153130;
        Tue, 08 Sep 2026 02:19:13 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:75be:f01c:dde1:cb38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32015722c88.14.2026.09.08.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:12 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 08 Sep 2026 10:19:03 +0100
Subject: [PATCH 1/3] HID: hid-google-hammer: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-acpi-hid-v1-1-08df24c4b139@thegoodpenguin.co.uk>
References: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
In-Reply-To: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859148; l=889;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aRiB+/teBjIDoYnRyGta0AirMhnk2B3V+bGT69BxTT4=;
 b=ud5CAEzaFbggl62JW7umNOg15pODvY1/dk9PuhlTmnx5RRzcWUGmdiHXEJjWArahDBqReD4/v
 HBKAzGJ268rA6jh4FRctvpEUBO+711N51N6NINJBX2KXCeRXSxLBc3U
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index c99c3c0d442e..847b1ddefeec 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -268,7 +268,7 @@ static void cbas_ec_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cbas_ec_acpi_ids[] = {
-	{ "GOOG000B", 0 },
+	{ .id = "GOOG000B" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);

-- 
2.43.0

