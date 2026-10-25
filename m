Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913709;
	b=Ts9RlCMpb6e21Bt6/WcO5SX6gOhEbYAeZX/3M7M8J0P7KQFfmJmlfMma8s12ac8UtJX1
	 aerjjBTT6PfuB7UAWF8qkz55FCkRK4StHQxK76+HcDpDlkWuSDG0D6fUHcN/VIk2/gEbb
	 4ut/YpkkW1tLgw5WStwdS9De65wrUVqMK7djna2Mo8w1kbrBkdPItfgz1rlbPIHodHmbb
	 5MdGE0XfCJa0AtqdTk1XYovHWmI5vmIqIvC89w3fSmL75sGiXtgFI4b7/SXKD6hO6QRlJ
	 6oANtpZ5T2oDyBeRimWxkLNvFHmjiq4TtOTnZ0AWpORJ+oBngyY6ln6gqeudi2YeMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
	b=lHxiSo+x8eEwc/XPL2pC/DIR8kfqizRb1U2w8T0cSR30PklDNEiPrC8rq/DzE2lvG7gt
	 pfWLhKmIYiKQ/Pzpfpblw9IK0sEAJMOmXu0mA3tooD1RBnICrHAl1zL1g0hig9vHdkhDd
	 AiMvwVJm3dm664F27h+ikN58Jehwl8i8Nbl6WfbTm20N/C8e97cDkroBIUFxtwlGSjF5V
	 89ct+Z1l/QUKvo2spzN0w0j4lykmcPgmFGPGEnSgmHl4+1ArDkUJc6+on1IlNCiyS6fmV
	 /QWmiLFyDDiUbqZfI6Zj93nhp1wYrmqS9TvEcVWXiloIrs2jNQdpRypO/Fvt+p8FYKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeL9YMmp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39769606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39769606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeL9YMmp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36681e85e87so105451eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792913708; x=1793518508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
        b=XeL9YMmpXNghgNiNN6qKfxSa1Ko4c+uS37FICamRT1deiNALEjS6UgcgQlAwp1e4gt
         J4zFscC3C0L5Su0+zhWy5UKTD4aezHCEsK0j0QCkZL/NjLU7NZvbwZV5K7Al7lxLdsZo
         4p9tkRJrWYc9N2WxRU2JiWy0/6B0rXm4Vq0OjQxHca5Zg2qYIFzHaLYKnlJzsOQYdNnW
         3yYaHtH4Onwg2qClfnJRGnKQbk/ILwmRd7VtasVZ5JtAY+oVJU0fQKhAuWKmZVyZ+6ir
         bbTQ/RI0DXS0LO5RvS1Au2LL2RgtQcNoVQlz/TmgaeF2COMIyLeEJ9jtyOZ146sjSarG
         MOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792913708; x=1793518508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
        b=umoFC+YViLPiViEzgUxOtH8q+V57Tk/TZcRAZumc+l3g5H8KX27MTNDZCSPUn+57yU
         FExJSbR7hCF0gLchugT4KY9s0aw8GJJlzGu2quw4Ln+W2+Df0s9vVdySydTeIwaHDSKA
         V3VuDGsC+FbqXJE3M6TXZzAzfPs/8HeQwMn0DoN9izRBDOj6DZrzyacN4IpKuWt+Y3NM
         BFDNma5YtjFMbFi+Qw8tNCP9CY+0FPjkd4lJvJOXKV/SttVtKjGnF6I6RuSq7UEb03qI
         qfCK9WwEPzovitbaoD9XLk1b569GGBQQASb88hwC88+s7FzMuc1haUfQNROFrRri3bHD
         OIRA==
X-Forwarded-Encrypted: i=1; AKwUvBw4n4pMwwKSnuc7MDunNZlogqXTxGvHMvU74wYnZGOom3xGqZx8i5zkI99tog75dPDZh42PMYsX8mtsyfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNLHaj8hjERzQv9exk87W41wc+X9DZPKYisOA23asWxzpzP4t2
	PjXZ88p7PSQQPY0EqI0410Hnq67FKvuhLPBoGPH8RQhJ8Hn33cdRz5kl
X-Gm-Gg: AYBFou2Z//c+t19yk7YJif/2KBBEhnSgfWkGzaAygCfqT5DfyZNn1WThIU1foR6iYdE
	fgI0/Eu3NoXCrEmy5TmCxEImlZeXf26cuRkmk7aCmb8ld8a4dpONh+HaAkdMCTNRRd1A9FUGCXO
	jlbOaIvIt8u3tbXG2qX6YXo/95+aOgrMMo2J+0MfbEyudpAH5HWaAprObiP7yAeN889rhVCiHKe
	Gt3w5g4KacGCacUKLfqZAwG8Mbdz/o0SCX2IQ2Aj7GjLDayClS4vjx56C9wHL0h661zr3dn92K1
	qmLCFUnnZKUTmc0vNpvijiBLFTMqTxe1zIuajpQ+hgODitoARpKSQxWBysxXCpBhOkbKVwuobXR
	W/ancXf2on6UboigH9FCW46RiwpWX1MAELv+5ETGt0DrtKzAHgW7npK1zr5PqKVZn6RDG3+xinF
	m8dTqjPstwZ4kWCheDPfZAPZuYG/ObrbuTF0/TbJrA7qicdFdkaoHPAP/yy4/GIa5orDCCLqQZi
	PJQMqDoXLig9Hh3p2iX0ymlYC1oY7nub+kPeNERqY0Uv4b4Ab4eGC4Nfqy9ZKReH4UCcsZ55Jqq
	TQkd
X-Received: by 2002:a05:693c:6209:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-369e84596b9mr6176954eec.14.1792913708251;
        Sun, 25 Oct 2026 00:35:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:11e1:8680:3154:5358:731d:7be5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm27620427eec.23.2026.10.25.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:35:07 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sourav Nayak <nonameblank007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix power limit failure for Victus 15-fb0xxx (8A3D)
Date: Sun, 25 Oct 2026 13:04:06 +0530
Message-ID: <20261025073406.10085-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Victus 15-fb0xxx (8A3D) does not support 0x29 query,
Casuing severe CPU power limit after disconnect/connect of charger.

- Fix this regression by restoring user selected profile,
- It matches behaviour written in omen_power_source_event.

Error output:
[ +14.861905] hp_wmi: query 0x29 returned error 0x29
[  +0.000036] hp_wmi: Failed to actualize power limits: 41

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index ee6de96b3280..9770cab99b9c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2355,6 +2355,25 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 		return NOTIFY_DONE;
 	}
 
+	/*
+	 * For board 8A3D (victus_s_ec), query 0x29 is unsupported and makes
+	 * CPU power limit to 4-6W. Match omen_power_source_event omen/victus behavior:
+	 * if returning to AC and the profile differs from EC, restore the user-selected profile.
+	 */
+	if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {
+		if (power_supply_is_system_supplied() > 0 ||
+	    active_platform_profile != actual_profile)
+			return NOTIFY_DONE;
+
+		err = platform_profile_victus_s_set_ec(active_platform_profile);
+		if (err < 0) {
+			pr_warn("Failed to restore platform profile (%d)\n", err);
+			return  NOTIFY_DONE;
+		}
+
+		return NOTIFY_OK;
+	}
+
 	/*
 	 * Switching to battery power source while Performance mode is active
 	 * needs manual triggering of CPU power limits. Same goes when switching

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
prerequisite-patch-id: 81b94f3910be80ec60f3b82188d4b141ac6c34d7
-- 
2.55.0

