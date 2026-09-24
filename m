Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56270339872
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253051; cv=none; b=eY87zlT6xQ9m4nUu1As/HF0U38ic1eb/MXkekhkaFfHmmVQIgM8lyCM0JveBjyZ21apVwD81Ew4j3IFhlDhTOnhe1Mf+17fhXlYsYtq7683i6Nrt4qWt5MLJ6zn/u9H/uJPW/809cASuWMUNzO/AGdCiJW9xle1/fD2KYAzkkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253051; c=relaxed/simple;
	bh=feq1bcLZOkeXI/qUwCevPwJr4SdTs/1WRLQXKorQ6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTBzO0gBfT0W/fn/x2l2pLbgvxj7eFrhiqXQFPlqpj+lmaNieQfZlcQT848j1B23sa/9WUL55X6GAhafcaLbATSKjNqX/JETkUuNbVh1sh8u1l4PPdFaI5EYM6eRW9x8qIGIPXZLGaVO4VR3BTYBROcvDn6y3eTWUCT5OvPGKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwMCrkK5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwMCrkK5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so18227335e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253048; x=1790857848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0D3eaT5BNEoIaAjsEGOHSHHnJMJpvKkiEM0V7CbB5XI=;
        b=FwMCrkK5jjkKMmg9FlAroe6oeM4NrIA5qSzelogJvWuo7Ou7qjPp03dCfzbRBk5b8O
         GQeTIXgvCHNeIfQMD3Hw5hA0g9aaoqy/IvvHagL3CTKmIfh6l6LVRMjfKh3Z6PElPWe0
         ikq29seO+7xyxHc4PJeKYUkJSK9uwjb11X/cvu/CefZ9xY0ZeNzmWAdMhRiX+QZRQAeP
         sjV7hV9/HK81ZzdioFo0DqnpImFvj3rjbZNCEb+0XLwKz8LevpTFi7Z4iWdWTeQsxARK
         OGM8m0O8JeXmygdHor+V5XS2sF2UZHCvh4Jbd9ZvJFjCBmA+INm3M+Kgnmk/feVmI+Qx
         QhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253048; x=1790857848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0D3eaT5BNEoIaAjsEGOHSHHnJMJpvKkiEM0V7CbB5XI=;
        b=VaevzhFRVCudHhEqAEkEHiCgPvl1heXlA+Hpa8T1uzjTfeUx8mcJis4tiniS6NWW1b
         Jyzc4NPf19D8f0fVpBlpAugHB7ikapkLATFWjahWM9qDwHQ8fLj7MLj7P7Ge6WGwYun4
         YBIoBa6XjnC+2ho/QPpmQmJ8Y3waxwWg43L626NiNn3uM1gjh4gR9WofBnDAvR0mF9YZ
         KvJswlUsT8ynlhll7SvgqlRvsUlXQ2BuTPVjP2JGg4M0r7CM0pfgv+ar3odyq19TS97+
         2Vz33bmQUmWzDrDsj8waxGBwBzCxg9nqj9GB9Yavxc0yLlnK5aqNiKPEVPVu4HiW7vu2
         eD/Q==
X-Forwarded-Encrypted: i=1; AKwUvByOlH7iLCefv7frjWm+SkeZ/ri/zHI5nOivlc/D9UGQDNOQljba1fs2V9M803UQ3bNqk38EbQh/83mF9dA=@vger.kernel.org
X-Gm-Message-State: AFuF++lz4io9Vt6RWTpR91JTVtcOS9H37LquM2PC8kQT/FnPp6uUmFNm
	eXaviUOi2CQVEs3vZzjKhLWtK/k+szSPnHe7kfzE5sehcUU9XszeIQSY
X-Gm-Gg: AYBFou3rL0MR8GlbKsfaZR5LPAJcp1f7y7ks9hHPuDeKhbUavplShh2RbvTyXEFxX2e
	DmLqKpi/gMgWsbemm/z1ZgodPdNY4452C7sKNj41yp4PjHAEVhwCOoE/de1LXhyd6POt/Qe5QNY
	sZEKiNWphBvF0tDD24+FCcA/8McHIsxO6JimA89qsW+SXE6Js2oOku0NiPbossZEYojcxU0/h/C
	A8IyZvjfgpAun+xMv+RhZPUOAoQHv1PEqY4VLKQc4P3042e7HnYDNYJlwfBfjX/wvPWtE91YCUv
	JKA/zMnN3rI2L4rYbinwK2oSz0/CVotjk8egbv76W9DFQ32oAMVgpIdVj4yDSRgtuakrpKOx93i
	ySlf1HrmCUkcx38eMDzkyYe8h7BQIkN1QqM/0O6ukf07yAvAThTkjCGrJTekfkXotQNM2hCudd1
	3F8+bQUCTelgZu++14MoDoeMrxGFJnMMFlVzJ98Uxbu+C9HMtlqDcbZqGaYVqtZZ4WroTiZOytc
	sw0gNYSiiwCSm44EcSWYLjWF+1m4VYDvn3BhAwpkpXkoMQZor3IBJc/YfmHoYU83qpktzyVieA=
X-Received: by 2002:a05:600c:3b07:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fe66d1653mr39911805e9.13.1790253048131;
        Thu, 24 Sep 2026 05:30:48 -0700 (PDT)
Received: from pws-dionisio-3680.powersoft.it (78-209-174-168.subs.proxad.net. [78.209.174.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm64010115e9.5.2026.09.24.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:30:47 -0700 (PDT)
From: Michele Dionisio <michele.dionisio@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Michele Dionisio <michele.dionisio@gmail.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless 0/1] wifi: brcmfmac: fix oops on removal while wpa_supplicant exits
Date: Thu, 24 Sep 2026 14:30:26 +0200
Message-ID: <20260924123027.4122909-1-michele.dionisio@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unloading brcmfmac while wpa_supplicant is still exiting crashes the
kernel in _cfg80211_unregister_wdev(). The P2P device interface is
removed twice: once by NL80211_CMD_DEL_INTERFACE (brcmf_p2p_del_vif())
and once by brcmf_detach(), which reads ifp->vif before blocking on
rtnl_lock() and then uses it after the other path has freed it.

I hit this on an i.MX 8M Plus board with a CYW55513 (Sona IF513) on
SDIO, running the Ezurio backport of brcmfmac from v6.18.22 on a 5.4-rt
kernel. The code involved is unchanged in mainline. It reproduces with:

  kill $(pidof wpa_supplicant); rmmod brcmfmac_cyw brcmfmac

The patch takes RTNL and the wiphy mutex in brcmf_detach() before
removing the interface that has no netdev, and re-reads iflist under
them.

Testing: on mainline the patch is build tested only (W=1, no warnings).
I tested the same change on the board above, applied to the Ezurio
backport of brcmfmac (from v6.18.22) running on the 5.4-rt kernel: with
the patch the reproducer no longer crashes the kernel. I am not able to
test a mainline kernel on that board.

The analysis of the oops and the patch were done with the help of an
AI assistant (Claude), from the oops, the driver debug log (debug=0x406)
and the driver sources. I reviewed the change and I can answer
questions about it.

Michele Dionisio (1):
  wifi: brcmfmac: fix P2P device removal race in brcmf_detach()

 .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

