Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046236;
	b=N7mq8nLucRuXSIrFr7yMh4NmFVEhxsB7/oSJ2/UtFN/ae4itloKA05DqZN+8xdqMkp85
	 HAa+EYsVpTeBJpkxZrjYs6RwHTK7mG98xFh5kn+A5wMshAs5vXIm2K0aM6bmV+unb6RTt
	 6lnVwP6uGCsDnUzWOVmKr9GcpH4iRtwJTDnKCvgRoE0gNgp0kZXf59GOTfx/n7fX6T6pL
	 HS2TrK/L+d9seOnPTFYNHWvEgyXfwQ0RXpE8yH9UisHtur+eSbD2ip9rDo4TJ1VSdu6ib
	 609WDXK5YoPuFposoropN2qvas70z6WM7gvAxkDEPA6XAmzicscS0KapSOfia1xhb/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dgrqIkyT1AWg6HRmyXzx36ddvTTSHAJSFT3GWfCe4Hc=;
	b=WqG78XmfAg7BUbcZ99BBU14ujAoU42mttWlbTehJpaNaUkETyjc0NXF9ZgyIsTgnGs/E
	 r7Fjorbp0M/79RY9NMV22BD/JiZOlkL2R/EAEn3oBEb+nR53WvS0iZfw24/8DZK08CIXq
	 KNYzIjeGDV9kF4pKf7WZhISO/XMyDyM5PXOFzak/dzoWsRCgO1pvts0BIvEGfC0zW8jU/
	 jHXtz0MnLWpiEzx/sqmbvDLvRyiS5ZpURBXzWsD6iCpQGD5BStxEcQixZ/kyS17tsv+uN
	 G7ItilcqIUt9N3n3VRP7uV9yvtFrAa3k28PrGK5xERWPMc65PBoR0JxfnG8272/YayQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qiXMIULT;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qiXMIULT
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16884505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046235; x=1793651035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgrqIkyT1AWg6HRmyXzx36ddvTTSHAJSFT3GWfCe4Hc=;
        b=qiXMIULTMilEl52GvHDMqPoPym++LhzLyKjb5b2IU+yFy92yJJ2Gb+M00zfq85nNF7
         tp3bwlQSiJd0II1nJjJ4U+xDt7VP7CKfUe0d21Rj+Cu2eZ8WBhZVA8P3fd2k5gTRBDwn
         pzKqrk9C/CfztgqHXNicXUU+toQAiVUb8l/cB4pmzbBCCEy0AjOexuTUecVN3M1nwjbk
         zkWrsxjFw9AADuOUAuWPeNLCRSXOfq9utR77e1aFSlFgmBCyS6T0atL8dizD673I2CiD
         gFOt9Yr9dbsCR2Lk7J5HVmgC/sub6MXUnD9jrkZkQM8mfcofQs1/kllUybaPZrNj1LNv
         VzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046235; x=1793651035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgrqIkyT1AWg6HRmyXzx36ddvTTSHAJSFT3GWfCe4Hc=;
        b=b57OzrCOBnGWQu3R0xdRafvYaDnPryyatu297a8AQq81i69qSPCPUoomP6/EqRMImE
         HbMCy6XsCqi7daK/EGVwDbKpPyWLp8yH3wdFp7FPl3zkt5Tbb5cv/KrDP0cMWudvK7C9
         W3YGoLnxbw1hv4zY8gB4zCFERVwwqgNhZMKCyfZEityBfMOfkFx3Ks9c1z9TcWVnibKF
         WfhVpsjUcQZIJ+SiRO4wc5Dh0qfFr3nfcUVSLbOeBeeJqralVmYkEYgCcK0pdjoPoXBy
         67b2rNPRE93jadXMrcKrv6RHDjdOaYGsvW47eaS1aI1tb8yV0+4ofgCW/KyF/1fjmWi5
         CJvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRd5PkoaVZvZFRUI1I3+k4jp6q7R9qPKofjUYgIqn/XJTIvWxlVuknUyRCOg0bJvQ3yqL4gI36o/wzZzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxTlL2E1bepF7VFw6QUMr27xkNgJBbCCcVU1maCbCzLugJhpZt
	rpeMTzbsUv9Ek6ESRKPYBgul1OxcGrATg8zerdpIlo5qlIV95XGTyzDB
X-Gm-Gg: AYBFou3TYmkbczwvgFvoLjDetiwT8gLYDL71D+d9m6rXCsOdyp4Ae7lAJHUnE0ILSzp
	3gAk40rVEUqmw509EhdPNzfZ8KeNXSeJTYow+IRaeo14u0mlTolCUHzboJCKpBqzkOr07uzcSMu
	+hVCBhYnklqEcZi+gLnugz8113bQNrCCbfwFsAuH0i35NHQxeb6X5LwtdZFSpx9ccEbjLFZdmNG
	uLUp/ES1kZ7/aFzQonCGh7SB9E/OKuBOo22bKdrJU4HSIwfuoGILkfM7LNKzqha9GBakLgiUOWG
	+Uy8D9Sbnyotj0Jo0gCVqTxR2e09Wkt7xUnBcvm2B2ZT1oZKYwizCEFrV//k7Qvxxc158onEOFf
	+0m1VdZK2LrtQfg8o1s/XNgPSnjIG4DWncJbK7RQRcKmRgmzsrmOBwOEQDmATStQk6B+K19QyvD
	d/9MAgCwx+KkZJ38BY/+47qkadeqjLS1+IYh48hq6j4q/ccEgEyWeASrgxEkFnZ6rEnZUU/d5h3
	qeEqcxcPjtJr3DgU08SXnpX1KD4k0bpbGwOpo3TBiHSfDYAVzgHyq/Yu2J8msffpVw=
X-Received: by 2002:a05:600c:6289:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4a35acc8109mr141449025e9.21.1793046234663;
        Mon, 26 Oct 2026 13:23:54 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:8f9a:af38:72d6:7c0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm18710967f8f.52.2026.10.26.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:23:54 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: scsi_debug: Drain target cleanup before module exit
Date: Mon, 26 Oct 2026 21:23:41 +0100
Message-ID: <20261026202342.668361-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Target destruction queues cleanup in an exclusive async domain. The
module loader's async_synchronize_full() does not wait for exclusive
domains. Wait for target cleanup after removing the hosts and before
removing the debugfs root and returning from module exit.

Fixes: b402a0dce64a ("scsi: scsi_debug: Fix create target debugfs failure")
Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
---
OpenAI Codex found this gap during SCSI teardown analysis and wrote the
fix and its local validation.

Earlier validation included a Linux 7.3 build and three ordinary
corrected-module lifecycles. No unpatched race was forced; this gap was
not established as the cause of the original allocation messages. This
base was checked for applicability; no new build or runtime test was run.

 drivers/scsi/scsi_debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 3346562..8aa8652 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -8675,6 +8675,7 @@ static void __exit scsi_debug_exit(void)
 
 	sdebug_erase_all_stores(false);
 	xa_destroy(per_store_ap);
+	async_synchronize_full_domain(&sdebug_async_domain);
 	debugfs_remove(sdebug_debugfs_root);
 }
 
base-commit: 6a53f401e671b75c129245e371ca6e9d47fc3c9a
-- 
2.54.0

