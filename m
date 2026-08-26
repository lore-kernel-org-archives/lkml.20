Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CA418361
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783059; cv=none; b=kYJaiKhw4nFZUmOMxLvgsfGMFKgncx1GZ7/0Dz7xWhoiGPdWtAlacmpSU9A9h2nXIBOlaylnz7YoRlzJeLuWKMteYmD4qhtBkpjesr+jSH3euSdZGuZ0yTRSNQ8Zo4Bf3AX5y5yE6e8/f/Z5oG5ofH5jE/tRMc1rC2JaBJUh5D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783059; c=relaxed/simple;
	bh=Sudgi87Ng+/iVYfglJLZCBwjpLT4QthXbDGfIIpB7IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IIzy11jxNuaiv+g6ziSpSzKxRylR1lF/M8OwbymrfcCdvj0ovXRvBtMFypILE0r5QYKsAmXp/2YYFPw86CKAwz6Ekf8tTZijK0WSiJOqM7v8Q2kIpcR8As39zsQOJA2Zo2XqEHRCIb9MUYeWUjaa7Ga6mJssXw1XwvGqbhkV+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rD4dA1OZ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rD4dA1OZ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e50a650a0so4397785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787783054; x=1788387854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyDuDliEUJAtG1xZJlTNQXvCHyisGFvDjeXiDoJw63M=;
        b=rD4dA1OZiBd9fuVd9FiuKZ99euRhAd8637JhF7+QEXE0FnN9POc8LSPFN5SICdQvmD
         A0tQIZAiwUAVjy27KTx/2jCHV3oAvW0prL6QQhyxA7MV/WJ5Uz8gBMvFRkOwVoUBQV7E
         ZlZHAxdor/h/7NOd1Bk64jNLHEDk5gQhJDD7oRX35/0CtC+AcWLL6+FUkKT0SbYhM7qC
         S0FE2FC5x209/CUkhXDPeDEj+ASzA+1ldNNkKilou/9pKzXQrN4gtyDLD/+/veV/NLXM
         HcQIbnxGdludWTXIzObXNx6rxY2Nk4ky5DmCy1VZPsMDmTMAQ2hrLME+xb65o77ITDhm
         3Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783054; x=1788387854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyDuDliEUJAtG1xZJlTNQXvCHyisGFvDjeXiDoJw63M=;
        b=OLnfanAWSaaEJyrUD75WIGgwbtZ0lJ1KcxbkaRI/40oNAj0xfhAPikZtD/SPxcQY5h
         G7RuREcEsm3LzoWtxaduBF4758o6W1/Pk/OOgmyMY0uKtFSRIX+2DBSRFjkZj6WH054g
         Xk7BmK3CahTAsb1Beu1hE75okttcnjvfgxhg1+n/8cl0PPvqpLgTTGL3P4XhedgWVOmV
         vVZgtdGgVKpz2FUjoblKysefwVMUg3h8Wcyv3DfU0yF/B5fyI0G2dgW1jiA2w8CXgmko
         hlX+YYH3KZ4VOlce/n5QKjbLFPcUiiTeV/ekVaiu4z9vBnzDdj85UvpPrZMeUHDwKupi
         0/8w==
X-Forwarded-Encrypted: i=1; AHgh+RruRMveXN6ApW3SkEtL2KA/CbCYNeR8G66Yj1cP4y3o3HXVUCHhU4/jSb3JvnLVuoBL6sB3I8rHsLBonfA=@vger.kernel.org
X-Gm-Message-State: AFuF++mpQuax5a5BfHygN1JNXh68Lna4TyleL1D16rNfroEu1bP/5+ne
	nix0W0G66xDa35LmRtDsSkAAvrRFt556kohRF7Ap33nul0+i7Y0vi/dj
X-Gm-Gg: AR+sD105AT2DXCBmfVSNT3F0tntnMOSfTGEcKs9jHYI+BC1D7UESBBMMRifAmt0VDM9
	v0MwO2UD1d2mZU0IxxzZ22hwOVXd/fNKrEvbBypUGXAC2Z55wTLCkL7ppBLzQr9UkWcHnfCp3Qj
	QWAs/sYGPW3njTJ9b8YRN2rfPrrWQT+1MuWi4Iy7KHlIjKq8Q6lKuzqBdNgl1pUi9+8p7keHn9P
	7GDEXa6aoUXjyIUuMcmuteHIyhpptDqT8PHNnleRpItBbQ4e1TtL+gyNHW3tY4NOttLFoqfdQ3y
	2OH8EEb5N2LPWE76LvZMdycN4fENNxRL/TjNgJ84KCl6lsKtiwjrvQpz/JUue5rPL+y3n0n9+K4
	zKkOuZiRVBAekxvDvx1m/yhWyCCKs22epN1VvRg6BWxxkjiTAls2vgv/5MNRbzLS+DK25XKxujv
	zxK3MRfnPimW8lnm7vP/A+ecXy+1UOWgog+0OYp5yE/fSurzcKJvfOKnc6UjGimk2CMs6wUhdd+
	t4nTsOh6JUKMYk6EtJ3OjKAZHvTe6Oh8RBqsVtianHzBILRMAx8
X-Received: by 2002:a05:620a:1265:b0:938:8ddb:5e9b with SMTP id af79cd13be357-9388ddb60famr568460985a.8.1787783054367;
        Wed, 26 Aug 2026 15:24:14 -0700 (PDT)
Received: from CW-D0XG2Q16P7-L.mynetworksettings.com ([2600:4041:5d54:8900:dd0a:e212:7941:39d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e379d8csm310292185a.20.2026.08.26.15.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:24:13 -0700 (PDT)
From: Maxi Saparov <maxi.saparov@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Seth Forshee <sforshee@nvidia.com>,
	Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Date: Wed, 26 Aug 2026 18:23:37 -0400
Message-ID: <20260826222337.73480-1-maxi.saparov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maxi Saparov <masaparov@coreweave.com>

The SPMC retains the RxTx buffer registration of the current kernel
across kexec. FFA_RXTX_MAP from the kexec'ed kernel is then denied
because the buffers of the previous kernel are still registered, and
the driver fails to probe:

  ARM FF-A: Driver version 1.2
  ARM FF-A: Firmware version 1.1 found
  ARM FF-A: failed to register FFA RxTx buffers

The notification bitmap, when one was created, is retained in the
same way and a later FFA_NOTIFICATION_BITMAP_CREATE is denied.

Add a shutdown callback that releases the notification resources and
unmaps the RxTx buffers. device_shutdown() runs on the kexec path, so
the next kernel finds the SPMC in a clean state and can register its
own buffers. On a regular reboot or power off the extra teardown is
harmless.

Observed on NVIDIA GB200 systems when kexec'ing between kernels with
the FF-A driver active.

Signed-off-by: Maxi Saparov <masaparov@coreweave.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8654b3365c9b..04948be13b08 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2222,9 +2222,16 @@ static void ffa_remove(struct platform_device *pdev)
 	drv_info = NULL;
 }
 
+static void ffa_shutdown(struct platform_device *pdev)
+{
+	ffa_notifications_cleanup();
+	ffa_rxtx_unmap();
+}
+
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_shutdown,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},

base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
-- 
2.55.0

