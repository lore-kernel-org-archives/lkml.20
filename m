Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C5379C57
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287741; cv=none; b=WgtiM/B+dH8cMDXEizlDWRXvvMDayP/TYB/LQSFn8mYQmyMCf5lVz+hjSPmsCagTTGEGwzNNWwQcymoJQdJx6tL0neE8GiGaMVDUAE0VMT8a3/Ib6BDry8jtr6bAAQJd1KW8k/bYf1ZXT/JNn9W3pbSPAOvLeSAE3eztul6tIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287741; c=relaxed/simple;
	bh=kXgW3qjo3KY6zHiH5OrCddi50NW2IkFEEVqHnddhBTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWdK5I89MH/2OfX9YnrG1pNrPcNbgjhrq323svSNz9pwfckAZz5fBxkB6W0pMZdSjHBrcdVDhhpW2Zg9Q5BURhNZLCnZGGDgUROEEEAFsF9Rm0Hd40UehuDSu1zefpVbyDGDv5ykDoSEcWRVsBLn0r2BC6TFZWKfMRfvjLFe62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=Jc7flFlr; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="Jc7flFlr"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35120d43ecaso3975487eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791287739; x=1791892539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=84Dq146BpPlH5Vbiz9syfTsSyl6UfDOj/cgMWw94ckE=;
        b=Jc7flFlrFsOL+rxAAQN1qcfPTdf6eoHOSaJezx0s6kU1O7Ln5ve+mLq6UbVCy2tTyq
         EExAf3Kc0SL60VA4GSvYhVzcTLVLVMAXeqKs1M2ONXL8+/Bcdo7JUqVKDyBsIejG1pMw
         vovYoLEj8NRWFm5RPYnWF4lLY2rLIyjz+SlHe/Ume2HsxZ7kCON32td+eSdcYG/3A73I
         qmvSjjVDC1+HTNWPNBgo70QL3C0PfgWP5PMBDq2hu+cWPGzzFqPrWGysTEhr7z/9pOzG
         ATdzTKZOqvj7u3WBM3F3sU/zQ3vwz4T2XHQWPdk03F5Up4e4X9Hq8OXdouHz8jzzR25J
         Tg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287739; x=1791892539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84Dq146BpPlH5Vbiz9syfTsSyl6UfDOj/cgMWw94ckE=;
        b=oDyxnaWWoCmWOxXb2rzMYRXa9aygXjXmwFPWlSytAnBqnH0t7n4FfjvDceetJWlg/r
         6jYA6vBndFIMFBP+v834La1oKa3WoIhPp47UhnD5p6m5V+rcpUpCdaP7qoTsC7WG8JVZ
         Mv3fCFSrutOAqzIUFpG1H4KI7+2EJpapBIvlhFle/3qNSJQpNhsNfdpAkd5LecvzpeRr
         +qv8XwdLdqI7Uq0KSWrgcu3yu2JMeJPx/xcdr17M1hCHXD7YnDAcgUcnUPz7kFjX+BmY
         unrVk/LkQb0opkQrMBoab6ZSA9UxPTZzJBt5lEGj1k7amjRowmgd8D8WFYNjQx647bnj
         LjgA==
X-Forwarded-Encrypted: i=1; AKwUvBy+aV6U+ba8i/FrD7pwFOQuXsaE/fYFCvQ78EEe7P51hHLSZttdcMypw6JQJ3NCXvKqgqiq8iNQ58u/Xis=@vger.kernel.org
X-Gm-Message-State: AFuF++lhY7VGHzpUtT413TfBWr5jQuFDGDZBfJKkqxHc9At3Q4Ui8459
	0KPvuU+7XaDQXUNzlvMGOgZaKBe+KWCTYPmE+fFnDbE57sUGDY8WyhStT/e9E6K3b9M=
X-Gm-Gg: AYBFou2lcYPW6nNh5EZIXURm9/M79hwLtLfVqij/DniVBMpvdCl8ysieDm9pvsPrTRM
	PkOAXiRBnuSNwU68e69Gl3otFOUeJqqznJOfX3BuWr37qUkH1toIA7Ac8d6QJ4bQ9//hpC1v/Oj
	1t8qviezR62uuhObh83yoFIb7g9RPJAXcjKby8GvhPj/bxwnq2A8swtiFZbE+vVWAH55VXI9oUF
	Tx15SNUqLf/deBFsN89f8J18v47Gz3pHCFo6ymI2jE+IJRpJp7KSZrZ4o2Gtje7G7q7lZ0U5EY2
	3XpcCp4gsDm1b8J5YnUkpx7lzQ6tuxcrEN/PuNL7Mz2YbccPR/di/1HeKada0IgW5L+TKtQSgiK
	mwcCLmNAApPz8EC+yoaL5eTtub+Xj0Oit18B2MOtTRAGs0eTUIWoKYFIB2HevwfWiFkNT/FO+yP
	e8pjgZcXgQeQ2R9LSsvJRv3/XUJp/qZMbAZO4KWri9eBeegZ9Dx/LaPhLbvniCMAf7hORqcr97/
	2KLyNt+JcR6k9dhgTqCGzSoG1UBWlMzLvZTkTYMmlUl3mkMGpNcGCNLiqZ6VGEeSXJmujbagEaR
	jrSLJ3Hz4zmZ5vFW7go=
X-Received: by 2002:a05:693c:4159:20b0:345:84eb:7153 with SMTP id 5a478bee46e88-3514df99528mr1348121eec.11.1791287739230;
        Tue, 06 Oct 2026 04:55:39 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f75fesm8638511eec.5.2026.10.06.04.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 04:55:38 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH v4 0/2] nfc: nci: uart: fix write_work teardown UAF (+ nfcmrvl drv_data)
Date: Tue,  6 Oct 2026 17:25:29 +0530
Message-ID: <20261006115532.72100-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a use-after-free in the NFC NCI UART line-discipline
teardown and a NULL dereference in the Marvell NFC UART driver that the
same change surfaces.

nci_uart_tty_close() frees the tx skbs and purges the tx queue before it
cancels the write worker, while the NCI device is still registered.  The
worker can therefore be re-queued -- by a tty hangup, or by the NCI core
still sending through the driver -- and run against freed memory.  The
fix follows the Bluetooth hci_uart ldisc: gate the worker on a readiness
bit under a percpu_rwsem and drain it under the write lock on close.

Enabling the worker that way means it must be enabled before the device
is registered, since the Marvell driver may transmit (firmware download)
from within registration.  That exposes a pre-existing NULL dereference:
nfcmrvl publishes nu->drv_data only after nfcmrvl_nci_register_dev()
returns, so a transmit during registration reaches
nfcmrvl_nci_uart_tx_start() with a NULL nu->drv_data.

 1/2 nfcmrvl: publish nu->drv_data before nci_register_device(), so a
     transmit during registration does not hit a NULL nu->drv_data.
 2/2 nci: uart: the teardown use-after-free fix; NCI_UART_READY and the
     module reference are taken before ops.open(), with shared error
     labels and the tx_wakeup trylock comment aligned with hci_uart.

Both are runtime-tested together under KASAN: the unfixed tree crashes
within the first iterations (slab-use-after-free in nci_uart_write_work),
the series survives 56000+ register/hangup iterations cleanly.

Shubham Antil (2):
  nfc: nfcmrvl: set drv_data before registering the nci device
  nfc: nci: uart: fix use-after-free of write_work on ldisc teardown

 drivers/nfc/nfcmrvl/main.c | 17 ++++++++
 drivers/nfc/nfcmrvl/uart.c |  3 --
 include/net/nfc/nci_core.h |  2 +
 net/nfc/nci/uart.c         | 80 +++++++++++++++++++++++++++++++-------
 4 files changed, 85 insertions(+), 17 deletions(-)

-- 
2.43.0

