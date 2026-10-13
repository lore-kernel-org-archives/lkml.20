Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F445039
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850222; cv=none; b=HcLF7CD6gn4zqUZa5gPCG4XTJuwNvF+hGbZgH2dRguunCpiFnBp5V1BE1Vpq6v8iuOABc63zeY4y1BrC6yBC5ieb8bc41llzF+dVWLR12BXXFdeWZvHyFYySnvk7em38BsJuHPfVTb0Z7kp+8+xP87U9LvAkTCRnsUhH5ooAj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850222; c=relaxed/simple;
	bh=Ywf3JIuArOTr9mcg9re4SW0+5aO+Oct+2sFj5uEJELg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZgneDXJ9oH0L1KStEieptwmDTHiqIyi6EUf4kedLGe2OTd6Cb8ARJOODnw1MRDA+Ou0p/gtH/ckQ7bgQ0OrtHqiBom5vfb4SvmD0YXzqyCYEekbKwInHes8oj1JN7PJKvoS7TYoAWIObEuPmRRvzFr5O5tCGBqZ7V3fiVb9Y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwsKpTTW; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwsKpTTW"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1419d3416ceso3414846c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791850220; x=1792455020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3jup52iLFnMf1TxPte9apcNNwkxnQC8n+wB9JhOEjI=;
        b=fwsKpTTWAkM03jsNFMXKGIYqDthMl+Yhrw432B7PcJ2p23Qi6nyz3eD2LtiVZbJp4Q
         ubwsbxE78ugttv/cwWrNIh/8FZhORbl+sK5fcejiTx7jtXKSnya/fHmIxmtAEd4HenXq
         6Wts4xg636vHolEMSzGv1YKn1Ma1yskbFZDy08H3MaNBaYk/bQV5Q/YxhZjMSAGXxpQ9
         G9k7ELPbiuyqy0xYu/pin9wr23OYf5ucGyWQvMWuB6dyPWR4b+BxBc/JhZk0NjVNY3Lq
         YP7xBCC8HLlOX6s4JWQlIJ3KDba46ioIAcqylB2QQgi23tkQveh+1MVt8S2XU3XE+igX
         PmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791850220; x=1792455020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3jup52iLFnMf1TxPte9apcNNwkxnQC8n+wB9JhOEjI=;
        b=Eqv5e/SrtqhUl+LwTolC/4beyI7RsbUkmWne/JXnFYeIb721O+5vpeO8y+WLlPtDgc
         o2lL02FNi9wwbPdxL+lLUWhQw/ptIl01bBuh31unDRs3BXKv4I+Pkjbqqnk9Rv5zwhEd
         bV97IamL9LIg2BwIUzXaxaYITHmj0d2oSHsZbe8JJ3PmFvT/wmt06Whueonj0LMYGz+L
         UUwcey2L5sJyKj9/Vzn4OhxHwfNuX9hR6uWX51RewZoCqpkZJBaUi3431VPAZ9tTinfl
         jd5KNnRQpnDtNBrXoXiFu+0Ni83mxVs7MgUrWXV0sPu6/dxSaRE7okvawPLF2yht1yus
         Znug==
X-Forwarded-Encrypted: i=1; AKwUvBy3k4FdW7MCC6QE+HTdVFwpzIy40f1U2f2tUm4eB2ycskLAQqxkcFrOS/3gRZOMweos/njOWs2+spMxtJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeQb+9ZiSg36bfzbpTrgh/2QiLXMLOQz2hCqKjiXxEZt5+8JBF
	JvSTcNNUsciql99+kGlUo/n9JdjvsmnxnQj6hsRBgjbEEERw6W2dzKbD
X-Gm-Gg: AYBFou0ePqWfZLdkOtR4WS3ss77c8xZ9lWOkxj7eW7vx21eJK9Jt4Z0wnJRpCLdcMRb
	BIg2/xNGqXIef2SteQUJjfIvLI+0YoBK+/CqV2N8QNJpaZi3XK+SMLI+ViFOyYfU9JPaKaEn9y0
	npk2PbXGlXyqX96WEwh5cu+JHTm6mUwB9RZbspYql5A8s/IANH2zpBFAFnyoSLfDpRHgnwELiRy
	UPkW6Ha4bWGqf65ea5ms4aJDDw2d0qZsW5R7BO7P4z/nsoxuWBJc9m7vSTJHO4UmyDirLvFxQ2O
	qzJ+ujOL63RP8K3OmbSbRAnCXbn4M2Oj/8uQ+dsYPeGToh3S5dw4Dl06xIPx8OggJPH9FUp+KEi
	hR90uK25pJDwuOa3tjLXD38/3wct2In00AveyaTAqX1YkM4+mo66/3ETHy4Mf75wFZcJpaEzE+K
	SyseOsoiNTXWhORA6krVNVmg7AXp/VGyd/NV8wpW9e/EyM86axcXGxpqwFNBbEACeSTKexapHhx
	NCdgX4ALO1M0KqzSc2kT70+g9o=
X-Received: by 2002:a05:7023:908:b0:14d:f83b:f678 with SMTP id a92af1059eb24-16a63093432mr17055692c88.43.1791850219597;
        Mon, 12 Oct 2026 17:10:19 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm32985040c88.19.2026.10.12.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:10:18 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	Ricky Wu <ricky_wu@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] misc: rtsx: Don't signal card event on runtime resume during system suspend
Date: Tue, 13 Oct 2026 08:10:13 +0800
Message-ID: <20261013001013.3075882-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtsx_pci_runtime_resume() unconditionally calls the SD slot card_event()
callback, which ends up in mmc_detect_change(). That takes a 5s
__pm_wakeup_event() on the mmc host wakeup source.

pci_pm_suspend() runtime-resumes the idle reader before system suspend,
so every s2idle entry signals the mmc0 wakeup source, which aborts or
shortens sleep and fails FWTS S2idleNotDeepest checks (seen on HP ZBook
X G2i with RTS525A, mmc0 event_count/active_count incremented per cycle).

While a system suspend is in progress, only report a card event when the
SD present bit refreshed by rtsx_pci_init_hw() differs from the value
saved before the resume. Outside of system suspend keep signalling the
event unconditionally, so mmc core still re-checks the card and notices
one swapped while the reader was in D3, which the present bit alone
cannot reveal.

Fixes: 5b4258f6721f ("misc: rtsx: rts5249 support runtime PM")
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index 2b6a994c6fe1f..b4c1723c95375 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -22,6 +22,7 @@
 #include <linux/unaligned.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 
 #include "rtsx_pcr.h"
 #include "rts5261.h"
@@ -1789,16 +1790,28 @@ static int rtsx_pci_runtime_resume(struct device *device)
 	struct pci_dev *pcidev = to_pci_dev(device);
 	struct pcr_handle *handle = pci_get_drvdata(pcidev);
 	struct rtsx_pcr *pcr = handle->pcr;
+	unsigned int old_card_exist;
 
 	dev_dbg(device, "--> %s\n", __func__);
 
 	mutex_lock(&pcr->pcr_mutex);
 
+	old_card_exist = pcr->card_exist;
+
 	rtsx_pci_write_register(pcr, HOST_SLEEP_STATE, 0x03, 0x00);
 
 	rtsx_pci_init_hw(pcr);
 
-	if (pcr->slots[RTSX_SD_CARD].p_dev != NULL) {
+	/*
+	 * System suspend runtime-resumes the idle reader, and an
+	 * unconditional card event would take an mmc host wakeup event and
+	 * abort/shorten the sleep. Only signal it then if the card presence
+	 * actually changed; otherwise keep signalling so mmc core can detect
+	 * a card swapped while the reader was in D3.
+	 */
+	if (pcr->slots[RTSX_SD_CARD].p_dev != NULL &&
+	    (((old_card_exist ^ pcr->card_exist) & SD_EXIST) ||
+	     !pm_suspend_in_progress())) {
 		pcr->slots[RTSX_SD_CARD].card_event(
 				pcr->slots[RTSX_SD_CARD].p_dev);
 	}
-- 
2.53.0

