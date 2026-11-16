Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798740;
	b=JzHZT08yxmgu/QC/j3HY+el/A47Iz9aiQBDKHqYEiKix7B2bMesoXnVfrRNRTfUaxssu
	 SMF3spVKq+Cb0qOh3iXIU8OjlIrLzD7p18vGg2SCa2oElNwuaP0pIFP0+pPRtUkevj1CN
	 hM0sB55Yug2XR9AcU/gpQ2beW0phThzS9kEGnmMo7T+8qK8DY0XG3vo/AwmXNDtuJ4yne
	 CMa8KNSDEnnv/rxtV/lw5Ib1i+0iDh5vfe/dQzcrug8CoTST5waZ7yDs3vljHKl+kXVhY
	 WUuDc1ETTkT5ToSbXeCnDPMVdS4D/7aP5UIFutrhDxI9HvJvrcrhgIGCIPUwuXWdssA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
	b=NMpwvUSiz07DkA1UcWxPHi6+RX332eiQ4Dua5gove8MHizrtfG8VNfhses1Jxax7y6qm
	 cVFbaOmjGeCrloagaVAKtg07XAUu1zUoSa+sgsDCr8xWxfOzmtPqyz0YWTXCjvn4LfVpt
	 gl7O50gIdX3fEtVuVlQg5KMs80AyydjdzrC14wFxXy9Fl76cFmXuiyrI5TUvxQCt/SDdL
	 vVCiMyVA83EtPb9Kvmm26TWIc5l0QkuPy5B2De/gOkGqC/2iqNKflERv2ST8iHSflsmo7
	 pOJhxIzSBS8W1RGdDKbk97KFUP271BNvcd79n0yY/SzjR0rXNu3Z1YpfGjzd41lczhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tGbI3/06";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F57606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGbI3/06
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso317989a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798738; x=1795403538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
        b=tGbI3/06I/g0J13gmiKUMJPY2XMQCypJkTiVTXYaK08BweI4+sOQ5WdvQ5RbB4ffXf
         Ej9Cps7spxlMhpru/xJckAW2Der71gTsOBV7yjgnDnQhZETaBa0HApmvnBrJdJEzvBRc
         GksXV7EqCa1QuppEluZ0SYb4OHMAzdFbWZ3pRCgo/cPXVhSG4147sIX22V07Zk2MOSq/
         fkurgw7PAqpTaWYlDL++YMuy8WWy6bed0NVLKoSYVVtXEHbPPUdJhGLEX+T3vW9Eei3G
         arGzFKrjwlT9u6YMIkPCJMWhIWhj0afYSMGdO8tx1XsZSCUOKssB+8Yd64auF25OSy1E
         T7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798738; x=1795403538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhVj9s9zFV+DbHl3yJ+maZv5fyr6B5MvtTW09b8JDGE=;
        b=v/LSOnAbj/WTPmJP0bSid3nZGFPxPhZR+pex9I607nHRiLxGcsq9DDHJJ7Vh0U9qIU
         nPU/edW9s6kywxQ5Kx8vJe93raE2C5/pI2Tm2APwslWXbl0kubSbWDMm+p4aJ1nRqQSl
         6Ek40y9iRf7sUB+tj7jhmfnjaZN8QKZzh9/D8SCpfMEgRaaLuk+adnPlqowIeK6nBseK
         A95b/0r0orNQjo6AW0PvUW+xgdmcsLyjEVg8XOU9FCWanjys7Vg3WOoSIXvh1NpVfrND
         vhUmv46AR/g+E7wmSDuafbz63HQnaCV8e9+3pdeU1hKsts4qTeJjc/SFXe3DtHZTQpGK
         JLEg==
X-Forwarded-Encrypted: i=1; AL+hErFy0UXVV7g9IdvgYz52Si7wAKvmCfpgTF+t3UC1Kla3uw1cBOtH5qTyto8otEzijnKY+W6XptiCYBGJbaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z80A0SHDxfT4SMi/ySoQjzvwxxmCkyXRImd9DGWHu/0lBEB60XV
	pUQVg6a3X/0yTy6xH28BFyDGlbI4YYEPx02XuEUQPATDhIDF4oYRz/TN
X-Gm-Gg: AYBFou0e0g2KieJaNFRHWr1YYHls3pa6ryFOtZ3ShvqaSkmfSY7q5XbqAbDY4O8RDXf
	UPZyVNloUaLhr+4m+IPdnbhUPY2OryvVp6lKPXRrWdhFUUyXrCYJg0vrfqcrIaOZwFEgdAsVX9k
	tAvsNfCET8NCU5FECGPUWK8llUsoz/3gs9lwyZoafmvB0vIR2l9r6xju8vzl++2ein6F1xtIjil
	WKYnzV9+8DtGgYyFaIAqK/dDxisyOnZPWWkJA26KdrveK4vsXqYq9I33xdIPKoUN/xWh+s1sqhw
	O4Uj8F53yMk+m9zRlS6dmimEASAPoV9yw+r77HOrOyiTgChFvcKezHIDDCaF+D7xYH8h4DBwfDF
	okw2xbb82YMCdim5Urjiut1vNiqU0ceXZq8YXfigyuZP+MSac0UTi6BYq+2rM5h0ft4lAxvNqeB
	Md3Uk9SEEzBvV/XZpfGncjcyI/qZp+0p/30t4lUAJuWs6Rqj3vmYahTeBZuUN2u6712zyUxNC0f
	41benTdWIbv2DpnaCFSQNvED3BzMpQdGvubQezQnJg4rJf6o8mfoiTi2MXMrGlXWvI65jv9Gvpi
	UVlldUhrWFv1slp2T707/svOaBlZY/Cy
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6223470a91.30.1794798738434;
        Sun, 15 Nov 2026 19:12:18 -0800 (PST)
Received: from x1.home ([172.56.107.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc859sm31238405ad.59.2026.11.15.19.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:12:18 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: wwan: iosm: fix S3 resume by re-binding the driver around it
Date: Sun, 15 Nov 2026 19:11:48 -0800
Message-ID: <20261116031148.333990-1-davidlwesten@gmail.com>
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

On platforms where S3 cuts power to the WWAN card, the modem boots
again while the system sleeps, but the driver still treats it as
running. After resume its execution stage reads BOOT, and by the
first port open the boot code has crashed into the CD_READY stage:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The modem then stays unusable until an ACPI reset.

Unbind the driver before S3 and bind it again after resume, as
commit 0b6f6593aa8c ("net: wwan: iosm: Fix hibernation by re-binding
the driver around it") already does for hibernation, so the modem is
probed again once it has booted. Suspend-to-idle keeps the modem
powered and is still handled by the suspend/resume callbacks. The
target state isn't known yet when the PM notifier runs, so use the
default suspend mode to tell S3 from suspend-to-idle.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, deep sleep) with
    this patch applied to 7.2.15: after resume the modem is probed again
    and comes up without an ACPI reset. Not tested on the XMM7560.
    
    The investigation and the patch were done with an AI coding assistant
    (Claude Opus 5.5). It read the driver and added temporary debug logging
    to record the execution stage around suspend and resume. We wrote the
    change and the changelog together, and I ran the tests.

 drivers/net/wwan/iosm/iosm_ipc_pcie.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..ec27d6fd7910 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -534,12 +534,17 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
 
 static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unused)
 {
-	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE) {
+	/* The modem loses power in S3 and S4 and boots again on resume, which
+	 * the suspend/resume callbacks can't handle, so probe it again.
+	 */
+	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE ||
+	    (mode == PM_SUSPEND_PREPARE && !pm_suspend_default_s2idle())) {
 		if (pci_registered) {
 			pci_unregister_driver(&iosm_ipc_driver);
 			pci_registered = false;
 		}
-	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE) {
+	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE ||
+		   mode == PM_POST_SUSPEND) {
 		if (!pci_registered) {
 			int ret;
 

base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.0

