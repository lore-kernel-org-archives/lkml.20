Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E931E852
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434674; cv=none; b=awz1PesMLNNFwxcH4utf54y9QsqfFBkIssbqXRP73aFGjAqkrXAkNj2nbYCR0P3uyAnarHrEIuiALv1vj6hzikYeqX5CGtG191KmsoHahaeSCbPsUKH80m2ZXsArp2mk05zNfFNpsK+PqTYDlgKRud6cuRg2JiNC2Uzdu/yG5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434674; c=relaxed/simple;
	bh=RthSqZf0DDbfE7GqRv1mD8ZLsDt8tj3LzD0j2X4Sgvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnuRwD46+di1mh9dmLflEAV6iimckXC5OWYDemEuXSPx16dDM1yB/9aI5uEaqclwUkUsuWiDMrOcwHfGpM9rOsgBB3dAgyNTdlYbTtvXziz7cGE2eoKk24Xm+QI7jtvkHRotSPlIXV3Sb5ObbJO6hLzxXv/0B6BARZ5aO/wVATs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LysJkkJN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LysJkkJN"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-939fc329d35so235497685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434672; x=1790039472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAKtLNOJWbVnxDBkVZ/0uqO6Tw1qnmXMwpf6IStwoh8=;
        b=LysJkkJNlkYwqiziNwoslfoDXK/moa35vApFMWIqPdqVi7IiIkkutg5OcdbvSY0JQZ
         2bNAvnesA0ERR+wGRAsExxXfTxge2Uk1DaFEdk7zLuKKTs8rvVNhJ1ES2rep1gTMRYWq
         RpDLRxmPlF11WbAkJ4iti39CI0VO1R6zabulvlNfkln72XdQWiiFuDn3pGXo9NUTxfQR
         BtV1kdVb8tIYa2LAmw/PFQNtrpNag94RjBh+DQDUXSfI+839fwnWV/8slcrYXgG7umuo
         KHPlmSnEBt7S1X3P4EXkSdV9Hg54I/WiddIUqHvKTWe/dbCq9BdIB481cr/jv8Tuuswb
         RaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434672; x=1790039472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAKtLNOJWbVnxDBkVZ/0uqO6Tw1qnmXMwpf6IStwoh8=;
        b=s0I9KR4Koy1mY2t6wdhrQr7OWiulllHc2qeWWSW4z3KslNutOIihXbBsAvT8lq+5EP
         4mygX5CN+bDhX1lyOcHJbd+tN4b3h20dC+9b+r+6zcq/DQ8nWzBodN6B5pH+kddxEKLT
         120DU///15Ex05CGdYwaoRqrDDA/5j+s6LUIgYxWZKPXRwa+oAr8cWGVOb+BmdEkHerH
         WHxE+pnXEjvmkIusnbwVVU56l4pcbBvVnrFEcqK5BZxAFqLn5JG21ahLb1eXYOm6nkRq
         BnDCASoJo7i0oA97YxWnZB+kirGoEHpnbzZSaCDcPAoh+iiE6try860ccxRAwOu0u1Jo
         UdBA==
X-Forwarded-Encrypted: i=1; AKwUvBxe69LgVo7ldEIp3+2xVnLVbSTZeI1Gf16B2VgyOYi0hje55TWhj9gxywggRtaGmMHDtdrb4ZWHFAb712k=@vger.kernel.org
X-Gm-Message-State: AFuF++nS0bqC0OjgshX8Wi38DseucJzt9gq0gF83AcPKafzfeVyi6r65
	+J1Pp+QigZ3ZTTRafK8BbiOV0o3Hela28excnsjiv/Wf4eXy8DxJ5vA=
X-Gm-Gg: AYBFou3qNQHVydv3JrM5xAcIXx/XZGbApFsFG+EDNiN7NHalCY0yHnB9sGtSo0v3NgU
	BdhhPI2x74KB2aLYdHbUOvU4RQAr9R1f0jv37I7d4+UPQqLGh+Wjvq3xJ7rZRVqq1+pjqp2b9ft
	EexBDrFhXjJdLecz+rpeOv+H+Un/mMc5nlKVR154Um0ze4hXKGlrLI/6147Np1JIVCOWs4+Qaec
	J+aw31OHctw+zo6LmDfS6rnOkgMWicOqv47a/nGyMVFtV3lIp/b+au9HQoXGvInj0Zm58wEXdwQ
	7nN/kJ3U8VXc/K+tXLE7gNkT2WZwyRpcPSFWq/uhnLqo625VKnllUyWhiuhjeIfkcmj5KgKDmeR
	uMWSOEH2fplgcaRuNUv4U0dM69OCOxa8+/uBYbd4wgUySItMnht0gin7Nge3k4MMlkNXEsCWABR
	9sD4xmiPfDt9zHq4CUA+fwKKBNalj7fQcj1N4GX5mS+3BcnnkXJLRtv4AQIKJY2EjYvQpVpN1QH
	Xa2BIGE/vhIwBr5J2aFLZuIXtFTZTAz5L6aBXkQshQaQwj4LG9Z5PkIa3bGhzbiEVds3BLsuCCT
	58xt/5aZg6/V3BHiqeaNhgyf9FjYou6Lld9SMvJVcA40YsUp/WlAwI/aqqWtk15WA1WgKe8=
X-Received: by 2002:a05:620a:4555:b0:93a:2e8:5afa with SMTP id af79cd13be357-93a29939a68mr737739085a.30.1789434672383;
        Mon, 14 Sep 2026 18:11:12 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e809fd0bsm1118996885a.33.2026.09.14.18.11.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:11:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: tw68: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:11:05 -0400
Message-ID: <20260915011105.56149-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw68_initdev() leaves the PCI device enabled after a later probe failure
or tw68_finidev(). Use pcim_enable_device() to balance the enable reference
when the driver is detached or probe fails.

The managed disable runs after the managed IRQ has been released.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: e15d1c12c587 ("[media] tw68: refactor and cleanup the tw68 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/pci/tw68/tw68-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -228,7 +228,7 @@
 
 	/* pci init */
 	dev->pci = pci_dev;
-	if (pci_enable_device(pci_dev)) {
+	if (pcim_enable_device(pci_dev)) {
 		err = -EIO;
 		goto fail1;
 	}
