Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB437F74B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442252; cv=none; b=dtSezHBsr0GKlfcBsFOO0sBCWQ2cCFwgIt1kLkwFyZmDHQCbr6xoFAznwB2EcIEy1RrFq+hNGbOfxjrz6PyGHaQ7Q1ao85Tmm/48byr9xlsljM0yZ3JtZ7PYaewFy4Q6jB/4yjjx6WjRkvnuPzXs5t1hlI9F9qkh6LjU25eBtZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442252; c=relaxed/simple;
	bh=inMJoch2yghjdV4xO7nIz2vYijRVDjnXOVGSDrF05pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHpVS3C2/UuHK6NZING5gjL++7TLD1X+43Jf6552PiS+cIEj0LzRNl8JPt/OI7/gG6nTiSPI5U9eEUX/vo6DCxII2S3GeDQWccGtiW8emYtw8V0Nfwpr1goikdNls1/8ihfDHpcJZDF47IEmr3ZbNY53mEDwmu9cgWTtkDIQZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCCHN8jN; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCCHN8jN"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso217629eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442250; x=1791047050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRViZuXEz1jF5ev0OclSbo0VNbuCsP09mnY0HfqPJoY=;
        b=sCCHN8jNE1jb0ko7cOQeRkgEEBA1ROn9aaMuaGoaMO2K5NCCd5vDwRPdA8zasvsHFj
         4fLpo7GZEXTOhreEjMKeuNlXtkMp0bVavi0oD1SQcfQ0s1VzNZL4WOh1MA/yqdNaOERN
         v7CwC++xIuf+xRykj5OaRwW8uHSe+BgzMc9+yO2BrIPNOMGRgoFiRn/eGBBtrQDDNdz/
         mLaR7VsZDXmcOWBgY07RHBTWKv0/U/EH9nGm/JN1xhRetRCfo4yW9ypNr2+nFvafVbVe
         RuFnNZvWBkYpJlDulKc2G+LU7fcO4V+iqM5L4zdUkfPzyitR1U6lw4yr56yUGKdLPMO7
         zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442250; x=1791047050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRViZuXEz1jF5ev0OclSbo0VNbuCsP09mnY0HfqPJoY=;
        b=WEvcr4/2ML5PBAHvCRUrqrZIgE2wD2NhhsUw3mbw6gYV7qkvfohlayFC0Le20btVmZ
         zGaiksghParoFcSWdlfNqgsUVKUy4NnO5z7tnZV8+DCdpUNalubLYmjBkDT/C+9TQaW7
         IByRjkbK775KKcL/n6f9kFL00vRf1qkV7kW/b2FjzOzlprObATcjxPPm6v0KPBT/Ppi3
         Rugdktt59BXoEtZceebOuncbwcatVYTjPxxbVMD216x58CiLdKKkftEMMgNokOU1PEOe
         ufQS7mJHodTrQc8O3CVWjXdLq3nQaxI2cOmkV/rpy1+KRJc5444vlgFHBUOdh/wfx9QW
         pIcg==
X-Forwarded-Encrypted: i=1; AKwUvByDLMEe6V2sLLoY5/SQAtfZxTqahas+k/6tjQFyroEdBw6a3imEDoroa3ygh0CDOcbzL7pfL0yF3tl9Zxk=@vger.kernel.org
X-Gm-Message-State: AFuF++niDWTebGvtJosHg4pEJ/dKOyOihw7KXajsMRh5gAfvkFRLo2S3
	qdxMbzLhbCCZ+7ug2YF73XvKjpsKo8dnwXo63ZLItkI+eHX5DBrb9Y4IhZQJoncbQCMa6Q==
X-Gm-Gg: AYBFou1FOkCwbuzi64h/kti5LbfLg7xnidxelzGvA4Up+cq1A8YUboDzoRu5LifYuIr
	rk53s66d/XoHp4zgRS3NkdIV1HlslOLGz5oa36DE/0/k83kQKgNhS+FXmKynZ1fSEFozbUUuK6s
	nYxW0AMQZ8iQhecI8KfGc+e5kGCtoHsClrjQs277NSyciq1tE8dvgcsRI/bjpkjubZWNN8rTXhA
	C3K1zTQ1KORGjVo4vzQHsHHf+EitI/HQv9V9HX3QCKEcRws562WV4h3IzOQDSxPSD3EX+32rkwx
	U+YfDiAi3TnNR+mfcnmzE/lMWQIyi88+GAra+mAYjMVOQOXsWXmyfRxuWdr0xmeI7bTowTwEFHL
	9Zq6BeMbil5cSF1NV/9H7paiXPNaoXdU/MCo+ZCssTIRMiwkUWjPGnK/gjBnGd5hjV3gCM3PGSU
	X5///BUxmt4ufHv3JFY3IFfFe00O5rH+rvTIKHeYQCJazCxlV3lAJJoW+jfHrp5bTgSdLP/dVA2
	g9uCASGSxmBU7yppQ/H/oAVh9vQBJpFcwhTh5GNrrOrCdFsiS1j1rayJYR2+wYUM2/QkQ==
X-Received: by 2002:a05:701a:c919:b0:143:3240:89ac with SMTP id a92af1059eb24-146cfdcef79mr6053761c88.2.1790442249577;
        Sat, 26 Sep 2026 10:04:09 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm13343905c88.0.2026.09.26.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:04:09 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Gustavo Padovan <padovan@profusion.mobi>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>
Subject: [PATCH net 0/2] Bluetooth: Serialize TX scheduling with teardown
Date: Sun, 27 Sep 2026 01:04:01 +0800
Message-ID: <cover.1790407061.git.nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX scheduler drops its RCU read lock before using the selected channel
or connection. Teardown on the separate request workqueue can then free
that object while transmission is still using it.

This series fixes two distinct lifetime bugs using the existing device
mutex:

  1. Protect channel selection, transmission and priority recalculation
     in the ACL and LE schedulers against channel deletion.
  2. Protect connection selection and transmission in the SCO and ISO
     schedulers against connection teardown.

Please apply the patches in order. Patch 2 depends on the ACL/LE locking
introduced by patch 1: it uses a lock-held SCO helper for their nested SCO
calls, while direct SCO calls from the TX worker use a locking wrapper.
This preserves packet scheduling order without recursively taking the
device mutex. Timeout checks remain outside the critical sections.

The transmit path can sleep, so extending ordinary RCU across transmission
is not a suitable substitute for the mutex.

Validation: rebuilt hci_core.o after each patch and completed a full kernel
build with CONFIG_BT, CONFIG_BT_BREDR and CONFIG_BT_LE enabled. Both patches
pass strict checkpatch and apply in order to the stated base. Runtime PoC
replay and runtime lockdep testing have not been performed for this series.

Chengfeng Ye (2):
  Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
  Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown

 net/bluetooth/hci_core.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0
