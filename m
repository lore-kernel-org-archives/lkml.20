Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35E47F3DE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202740; cv=none; b=nSY8Btb1irZ1V2N79ivUybR3Lfy1FcHp8ArKTroFlCqw1G+LXSnSJDPq/bDllTzlC3VdVS5oioduL/wWi0cyhZ0JinHVuEjQXnFocAazPIeF86IYD1GlVlW+0e5ihlcvDIsJnhHk0sSgzx7kWGG07RUTHDfVR+bj2eEaM1x3z54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202740; c=relaxed/simple;
	bh=LwT8YD/0iQneScUmn7PmYzkkA+TpVxuKTz+5LjxFZ38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRDuhTyyMECkSEBmHbvHGtOt0tImsLp1nnu2/pokYLO0dlrV34LjFh7QWH6+TlbDcv2C3hi5F7nUdxVkPZcKP2XDWHye1Pj5obUxUxr26YPhXcWwrSirxwtHbHa9OoMLjI9MP7aQQHo2PZhu8bEDRsHXc9FcFn70kmI4RIPrX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g4D7Jq1A; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g4D7Jq1A"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2db18e5cb56so2886495ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202738; x=1791807538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrBS4PnotPAQvpTrqkrnkQqMR1v1OmiTLLbvti1RdcE=;
        b=H+gwGHs9+CfRyWjEBTNOwDxShTbQT9zIVh7nDEbbSM7pg68ftuB8iQDU6wYWZVgr1n
         P/NCMRaWezfH8G5ZP73+p/tgdqxAEai50Wqy950pbGyU2YYfEbbVq94wusuzQVp0PM+S
         Wu1d9C6DGIl1SPLSVkwc0sxDVyUm4eyGqfovefLpAzBk2IBnJ7BMcekAvOgAs+GN82O0
         28sldmRbqNOrztmpF2nKKN0AeOll39EEKi/S1W7yruyJrfqmTVgChn12DPGwrUQ+DD36
         y7yOj5fqJ1YeaFuO9ldAzWIqH+or5YVx5+vbjsTLEkOAB4uE4Z3DtOpf+J+AHVMJLlVZ
         long==
X-Forwarded-Encrypted: i=1; AKwUvBzwHy10qPhFZF2WQoeqzZcOflnGTKeAdiJZuPqbUUBl9+VFW5s2nKWVGnf9B4+zlrYNcmMI/VqfdCZnrLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJxwcIdinXxJIx8CS+f7GwfmWdGMfRT+vi6ZvwjlYwQS/uuv0E
	c7QHyhSjcZNgZGYs2pVLGS+FRoWPax0rzUYY6KEmKAVmDIz5KrqBAnJybmLrYdYUFO1240jvy82
	qg1uICFuTRraVOip6KCfL55aatz4UywRdq5tOO+/sueMxRB3ovYZ0/+4EKIzQcZ3R2F57gFoyWG
	4nDeDNvpaXIEv2jQz3I8dISytnOFJRz/6b58AHnrsCBFBDFpRVAeUz+U8VJxODalrPtUIVSG1Be
	HKRIo/JSEy13jvr29AHxcZ0EQ==
X-Gm-Gg: AYBFou38qxuPbR+EK8MDh8nxvecZimHT/WwCz6mTsH52+ZEOS416Ix9YykWfLiPWgL3
	fUMFDNGf+XAJivF4A5lubyVjEh3d5NVJPEsgKkFDjCIuAP3nDLNWOQqnv0tLax1BafIodHxKcPV
	8ecvy5qfGRRJtGA8OTCs8l0UrihJU8efvzYAYCUnZwgT+fPWYiby2uDzuJslDnnLp+8UDIlyc6m
	+MbwLVRiFEm/4fodWy9a8r1xOueuJZPLxmDM9VSvARIupSf/xmIvHoZrV1BZFTOq6kChkxs3z2x
	jiBC5XDxZNjrIMIaUqYyUZ0po53YWn33grn2DQDPOXKvgYwmGwT3+F5KNwwIKIbN4Ka6UMm8ODA
	kD5IiSm0KIwKT765y+GM1v0AdASDq8FP6z44DVccKgcGZAttoGONhXr0ItRQhDu7WNImWhvV1va
	YA8Vn3umnAEpzEfQlXcz8CqNeCQ3VAsjY6Gf0rfotJ3N5s
X-Received: by 2002:a17:90b:53d0:b0:3a4:b022:1747 with SMTP id 98e67ed59e1d1-3a6ce79ae90mr7968242a91.33.1791202738492;
        Mon, 05 Oct 2026 05:18:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a80fb9777fsm1360602a91.8.2026.10.05.05.18.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:18:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so5129799eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791202737; x=1791807537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrBS4PnotPAQvpTrqkrnkQqMR1v1OmiTLLbvti1RdcE=;
        b=g4D7Jq1ARb0c+rSacECM5qM33MqgsSM5PgI2PtEfHCcHQXG5cz2J9YNSF+Sqq3nktp
         8wPALHbYE2zuO+M+tergobp2H54UcK+M1V/Fms5BdbRAFiLZHjrnLLC0ui2EtQWXTCkY
         5tqDVKR+u9wkYkbyPdvAZkHNbjjSZi5cTbVMc=
X-Forwarded-Encrypted: i=1; AKwUvBzAVPxGS+pg4MkHwkdFIqjkRksz+4m/h1+9AzFADeSnCd4qpbdMXGxZQyjz/EAZxu/K2eaicVKm0K1PuQk=@vger.kernel.org
X-Received: by 2002:a05:7301:c005:b0:347:8d01:164f with SMTP id 5a478bee46e88-34f150a378amr13881953eec.19.1791202736849;
        Mon, 05 Oct 2026 05:18:56 -0700 (PDT)
X-Received: by 2002:a05:7301:c005:b0:347:8d01:164f with SMTP id 5a478bee46e88-34f150a378amr13881920eec.19.1791202736093;
        Mon, 05 Oct 2026 05:18:56 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm25687542eec.25.2026.10.05.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:18:55 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net 4/4] bnge: clear bd->netdev on allocation failure
Date: Mon,  5 Oct 2026 17:47:04 +0530
Message-ID: <20261005121704.227866-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
References: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

If bnge_netdev_alloc() fails after storing the net_device pointer in
bd->netdev, it calls free_netdev() but leaves bd->netdev as a dangling
pointer.

Explicitly set bd->netdev to NULL on the error path to prevent potential
use-after-free or invalid pointer dereferences.

Fixes: 13a68c1ed754 ("bng_en: Add a network device")
Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index ca14d13fa3e9..7dbe853a5a47 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -3551,6 +3551,7 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	destroy_workqueue(bn->bnge_pf_wq);
 err_netdev:
 	free_netdev(netdev);
+	bd->netdev = NULL;
 	return rc;
 }
 
-- 
2.47.3

