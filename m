Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170962;
	b=be3N9c4mxgS3Sw7/s0pzS6d3sIUdI/6MaLRRab+eJlHfLqrcdniu+1QBF3kKhKE3kNwS
	 0koCkmjyog/erd6M5y8yDE2YKFM+IoWTSCMKU9+lKv/dQ6iBsNZ9UP/MZSx87WRJ6m8Ie
	 OaEH38LgUaQi8XquQqjdKpi7yuIbsKOiNBVrlK4Byqico5sQ91z/Li/XU05amVumpN7f6
	 1EtOJlIsN0u28INsDf5ptgHPTcJJMEEsdVio1HutHmXxDTxbtZXZfOfkn0c+yCQCrOqth
	 d0AXtMhAq8SKNXb9JT2udllPBoTZ224e5JiiNlAR4LPnc5wfTBs4wU9DQig06F4Y3jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
	b=4Ql6ZQtDm3m13aYPCicf6lS8mRdk6CJdayjgmhOGTyCHliqDG/b1oSQadFk+JiGB78dT
	 etGNUHHw1ftZyJk6xaQ8fsGHTuf6GRVcWWMdmlo5ZdPMgnppe2jRm1CUHQY4lHGfNKbBx
	 0u9wv5mIbCby2rBXftmqDd2KZJc6v7UNvkLOW5sCLGMgbq7RMBtXR+DuaTFWVbcCQ3lpe
	 PuAz2i1l/MvUOwsWJ39rt9eDt92rNKfI8zIESz3a5s2iplvEnyXU2M2K8ac2vhNFwt7Zm
	 qd8cYEOcLODPbL4FATgur7eNNU1GjgnLqRqTMAGMBHrgi4/9TnIBsHmA8IS3HCt1Jww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFa8jg8i;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FF606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFa8jg8i
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so145104f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170960; x=1794775760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
        b=aFa8jg8ixedNGQI/n8mEkm3ReWeHLAj6CyUTxovTtYh5rOKopaS5Awgr+l5IZfG1u/
         MvS/XOwaIbmi5x/ObP9hebsAkFS6X0SorAJSkXVLbiNbz9Z51R4TIq3+pLCaoU2OAe5H
         n8fpJ1sfTpRrZiDAcaljfFeXPsmgtmuE/wPDG6NzTRpQaVkbMAdZ/oljm2BSJQjX8Ab2
         JNynkS8Rd4WJ12ZjPJD9ps/55tqQYOZkggqjqxQAz4osybo0pAfjRJ4faIdi1X0D38cP
         OkSRfjChdB3r/w7nAvYvzxN3aLlTicALJh8x8UEYimjTrKP6U6K3sdafi3nXAjoWVA2G
         e5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170960; x=1794775760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
        b=JK/kBOKHgkw00+FvNBmR0msHx+i8ZJjd/chujGbAWjfN/3RWZXutN4WAJW0FJKtmAy
         ETEe2kOTBsyl94dlwjgQbj+sRsBFUTiDYyTydYQPc9GmPyd1BfglvOKJIeWAWaGx+L0U
         vObJ8hiJuXfplnlLHMipGtFw39ap9rLnpU2v3F0Hyxulw0xrj/pUydhmkBHTpPmqSn9Y
         T0UZpQ4K1Oxu0ubqUf6gip7z5GrS9TyNUVk9RnaL5Qzl1hroK5e+iiS0InnuRjVkOs2C
         +ts6n1l8J4/Oz2pGiyxXPFe+IMVhFZtJcTZ3+8CNJHeVyUSD024P+x3A/4j3TdfQW+TK
         8uAg==
X-Forwarded-Encrypted: i=1; AL+hErGBWjvbGIk7u9t+SZqvEHkLhoqBAXVTuLcvkFgiYQ9gBfraAatSgZHxkJbl17XmTMgZdfLiwYZVAKVb8TE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xKZfc/lfIIM7Y/xHZ1V9pnjpccAs35kTcDNraqP2kSRIP+40L
	hK5DkjNWfEoQ3ZdsepgA8BshKn3JvNr8XZHHzyfeWvO8z3hm2EeXc5BULRLuHhtt
X-Gm-Gg: AYBFou28ShntiaoF9pdAusCnFSXzK3XSLl2WvMBbe2GKukaPyWnYUtlWihAKQSwAZQX
	qZe2mmQ3dynSMc4WPx600IuHRpoKaGG3C4mQPWCEo37LLkXSspgWt829kSI8kNwPWBhlz2KPNu5
	4JJcDjANgVhNVWxf2agMMHZhr5KwpxOFd71gjJMoKLxgmLi9o/9SQnzv1te0Vfn0Haj2o4qxxEI
	k58eWzr3Av6+mDQQJq8uOMFgUFounCMvzg2YPbL2InEXYgnME2OSJhs2ELJqu8ojmiW0ricV88y
	tlxcxd7Khps68uuKjXM0UciEyrDgo0m3qAmfCstMO0UhExu5BZuS12GkpLQdXpFlkw6nXax/qkA
	4GIYpjnhXbW42ovIcH9Zdoc1NNLGT+dbQsVUa4GN5gmpqdiL04Pv7Nt85nflANVbH2a9nHCYHD0
	urO1yG+S81PRkQoDfDNc4DlzTm4yqBSOrSQo+VQ4x/tLDc6+nHQKvaAdWw6leR9WQ6kGKgQSxV/
	FbqMg4TJli6ObgoAxkqIOKi+K31hNBOor6IHEWTC8SMe7ocTfrSUslh+vFEGCyEIo/7iN0i4JKs
	hocNUeE+bpddhsQMiY/Spomb8enx46byHpvZLyeO1fPnN9w0qylZv0UYjjuYeltbxQ==
X-Received: by 2002:a05:600c:83c4:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4b963c6ca2dmr42368085e9.20.1794170960182;
        Sun, 08 Nov 2026 12:49:20 -0800 (PST)
Received: from laptop.home ([2a01:110f:4f01:4800:421a:58ff:fedf:2e2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm94217595e9.9.2026.11.08.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:49:19 -0800 (PST)
From: Konstantin Pospelov <kupospelov@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Pospelov <kupospelov@gmail.com>
Subject: [PATCH] platform/x86/amd/pmc: Delay suspend for HP EliteBook 845 G10
Date: Sun,  8 Nov 2026 21:48:52 +0100
Message-ID: <20261108204852.11194-1-kupospelov@gmail.com>
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

On the HP EliteBook 845 G10 (Ryzen 7 7840U), the CPU stays stuck at 544
MHz after resume from s2idle. Delaying suspend avoids this.

Tested with and without the patch over 6 cycles:
1. Suspend.
2. Connect the charger.
3. Resume.

The issue was reproduced 3 times, and was not reproducible 3 times with
the patch.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218557
Signed-off-by: Konstantin Pospelov <kupospelov@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index fed6c51879fc..037bb575870f 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -297,6 +297,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83N1"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=218557 */
+	{
+		.ident = "HP EliteBook 845 G10",
+		.driver_data = &quirk_s2idle_need_suspend_delay,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 845 14 inch G10 Notebook PC"),
+		}
+	},
 	{
 		.ident = "HP Laptop 14-fq1xxx",
 		.driver_data = &quirk_s2idle_spurious_8042,
-- 
2.56.0

