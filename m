Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE33ACEFB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084482; cv=none; b=of22eqfvfmHslLM0azknHmYH5grIV51uN9u+2MbIc4fMTPRSWYrY9voJs5rLxci9M9rwB2dPhTJxZBEDOPU6omXzpIYXjH7WUbwQEjdlS1B6q7UOanS8qp6RaMYDHqt7u36mFpH5CAuNpSukZljq6e8R6PzmzkOLBxZgTihX5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084482; c=relaxed/simple;
	bh=zm+IFtkQupAeQomjz92QbxQc3kRIUVTD3HYLMJXnvk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ik3728S5GFMCjNXN4l2rWe5zbNESTSvVzTd5QpKqhFP3DpWnosKSEoD99s1rF8CHENcurwKamu9fKzrX/tbYyoxci6/B3VnZYjT3tLdeQ3u/SU0rsXD3whR2HmdduYKOgVtUK9UKHD9T11UgYpHZ05g5+kvog+NO7xd0Z+j+eGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFO3jTsq; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFO3jTsq"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51bfe810293so4498241cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084478; x=1789689278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXOUF/0dKfcL9nM72QWKoaIot6Ph6ib6YvMRCU6EYeU=;
        b=eFO3jTsqOROUsoQ30Eqdrcr5CxPaYfHb4kCKtTwkQNXgqyu/bWRP5WlTfGXFWCVibm
         kpnAu4Ya/Az2CmzhQSVOu35wIRPpDzBwqVw6hFCU7KzcDOtaAmeppkiKwJAvUlMJyGTX
         UitLIx6AnzlVMYHUA1ev0qj417V9Zz1NUyuE+n3dpxEQ80ACX3/XgS+MnOTPBrV/S+/2
         Kh+NFSbnaWqADKh9Jkdfkknk0KEsb1me5216Za6awGLSp3VR1XJEHmb0Wu7BszTYRiS/
         XUiv0t0RGwyEDULGh+9VGool2oX5Q/d0ZXEiunPPalKLp+euAbmcq3MxII8dLljyJUx9
         uFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084478; x=1789689278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aXOUF/0dKfcL9nM72QWKoaIot6Ph6ib6YvMRCU6EYeU=;
        b=M6F52d8KGPkZnu1Wr8uC9zVKqd101p+3B2om8/KbQxmwq5lN7C72Yq4v1036zUiEyD
         EPbGD+xP8kL8XEUDAeSuQ1+1xR1YClP25wJqQf+LdU/kwnLonf2divfvvI9s6+uJ9FaA
         qDtFgfnmnztlRczcUGIQ2nVO+gpTV1BUrbuDfLEoUQ9/8htES8uom/o3cHEhJpEVNOKE
         5y6JQykWwpxN1ZKp+Sq8jhA40eKIKa4ND2F6Fwh39EQ+PRAwuo/xheUtDLfupSRdA4Ex
         TAIeqn14DEh6GuVm9/FUB7TqtDCgiFM8cdBWo8uz5+vp0Wm1tlSgj+CznGybTJcJT7a8
         anUw==
X-Forwarded-Encrypted: i=1; AKwUvBzlogLsWJvbdOO5PXN2ZtAc2CsBvOa0FrpsmeQzPu2vM1o+Pr83D4T76LTuRvM2Yehbbj1cn22IQCFdHu8=@vger.kernel.org
X-Gm-Message-State: AFuF++m62osAwLXJU7tKcbT766zUqKmKqizAfUmUV0vZEMF8a+o5yyht
	wvjokN16mDEbTdqJg61xbwa+aEtQPr/YmJ/6/ADIwyHyoEPvWsr6xA4=
X-Gm-Gg: AYBFou2Hf8BLtEL6yeSBSDVrkGWzyMFo7LNPF1C6HEyYk8uff12iblDbDnssNwAnU+x
	Q8T6gXVVnfopHlDza1PkBTJ1RkEG8Z/l6tiJlFXJTGDZPqlojvFKCEQ92Bpm4N1kTeaiCMngRtr
	X7hrz5oKIMzxVGDjIgqbYU1ecFx9NFC+U0OxYm02yEKnQRcCpBq1OANEoWrpTt0wkiDIM8biPv/
	IQP5ytRzD2mOtzE9nQlbCuPUuvcxnTFiZdlim/IFSYLkyLj/2jSlYnc2Di4VwkUJi8bRGaaYfyV
	pyW2bR2pmTE+TL9fZ7fxsrt3SH+a8jszznmgxuXsT4BeyYdtkURHV04lhznVlGI0kxC7hmgAzZF
	9toHXy19CgXmqKM4dyOTCiKH+IMx8vBUTAftuMjH2KUX7UHHykH3sN4P2eMTuZEq1Z+Ucwb0Qs7
	hPeRavVDOVQqfYWO8Phcqq6mtfe9+cbU9lTlJWdLDmgm7y9y1ARSP7t1C5bHiSxu3EoG9kOpUGs
	yG8Xr8w5dHZVCO/5Fm+Vs3aK3gJpYn1nC/ZRaSNBvtM0MUSjWjCNBkpzhtI9L7sIfL0XTi/yTI7
	D0e6O0c7QbxNHe5NY0o4m7zs1HKagAL5yzrV62RRA9B4Yw==
X-Received: by 2002:a05:622a:1a96:b0:52f:ab8f:43dd with SMTP id d75a77b69052e-530c871239amr28491771cf.38.1789084478245;
        Thu, 10 Sep 2026 16:54:38 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca48912csm6100771cf.13.2026.09.10.16.54.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 16:54:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexandra Diupina <adiupina@astralinux.ru>,
	Christophe Leroy <chleroy@kernel.org>,
	Ijae Kim <ae878000@gmail.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 3/4] net: wan: hdlc: close active devices before protocol detach
Date: Thu, 10 Sep 2026 19:54:29 -0400
Message-ID: <f5f0519e82a7b8bbf314dc137470f7cf931e320b.1788128904.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1788128904.git.mhun512@gmail.com>
References: <cover.1788128904.git.mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ff3516442768 ("WAN: HDLC: Detach protocol before unregistering
device") moved protocol detach ahead of netdev unregister so detach could
still use its state. However, detach_hdlc_protocol() calls
hdlc_setup_dev(), which clears IFF_UP. unregister_netdevice() then sees an
already-down device and skips ndo_stop, leaving an active HDLC device
running while its driver releases resources.

Close the device under RTNL while its protocol is still attached, then
keep the existing detach-before-unregister order. This runs the hardware
stop callback and the protocol close callback before their state is
released.

Audit all current users: c101, n2, pc300too, pci200syn, wanxl,
ixp4xx_hss, fsl_qmc_hdlc and farsync unregister before releasing the
resources used by their close callbacks. The farsync probe unwind can
disable interrupts and free its RX DMA buffer first, but fst_close() does
not use that buffer or require interrupts; the card is also in FST_RESET,
so fst_closeport() does not access the port hardware.

Fixes: ff3516442768 ("WAN: HDLC: Detach protocol before unregistering device")
Cc: stable@vger.kernel.org
Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/r/20260806020541.2011936-2-kuba@kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wan/hdlc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wan/hdlc.c b/drivers/net/wan/hdlc.c
index cbed10b1d862e..a38f90d3006ed 100644
--- a/drivers/net/wan/hdlc.c
+++ b/drivers/net/wan/hdlc.c
@@ -263,6 +263,7 @@ EXPORT_SYMBOL(alloc_hdlcdev);
 void unregister_hdlc_device(struct net_device *dev)
 {
 	rtnl_lock();
+	dev_close(dev);
 	detach_hdlc_protocol(dev);
 	unregister_netdevice(dev);
 	rtnl_unlock();
-- 
2.47.1
