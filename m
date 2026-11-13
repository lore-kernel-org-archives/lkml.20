Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579125;
	b=5byrYo73SHMgTDTZaWgPHrPoSg/KlbWfgoAONPk3kG92uaFvtU9P+AsomJCeQqrgyNgd
	 PPLPEft60JMV6Df5kfiQiBvfQISta8o0bWeFpn+6x3cDzezeWnVk5MRdvJ2TCZ6w1tUHP
	 pxcqQ0cczCiJlnfgYiQpMuHSwtsGXPSE6AzMTa+uYjR0ZxOsWfSKgT3MGVeHGQGBcDeGL
	 Q2WegVgNY4SjeY6snw5bD08A/un4yArTxRdnw1Pwr+oCzLP8nVNu1Fivx/nKh7vubv1E9
	 6igCiykOSZgHOYDD/b61+ImzofiPB7XL+A8MDYtkC4pgo0mnrZNHUm3iDypt36u59xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579125;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=dVtOGBWY0z48eT8PeVEuETWNQvW5nxZDzUphyHgbGEg=;
	b=W8rhYI/qqtPK9Hyk5rKK1C/sqBPAcqN891d5Y5c9uRY08PipogouTh8A4jPLQDAVtBkW
	 AWJtKn4lYAbnc4tuCiqhD4Q2lof7ThmajrvCW97CXWLWlsPo3057jVllKkbCX+addsN7Q
	 Ey2D2Y3Ab8VqZK/6yQu1qWMISwZZalqECBm6connmXNHwtVmrAGhoqrGaSu47IxI3z7MN
	 tuECOl1IXGg7jVMu1CAtQeTZdKylFDhan/OOjfVwdKjgKrxbb1sj/eGahFRK/VdaBFJtJ
	 6l2GSS8sea9ALegxb8uqyWY53tkNlI9HC+X3P0D3KAueh3w0iPGwmLYVq2mZV2VIZug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gFWSxx3y;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F50606A327;
	Fri, 13 Nov 2026 14:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F50606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gFWSxx3y
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 549b5a7d2;
	Fri, 13 Nov 2026 22:11:58 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx231xx: Fix potential frontend leak on registration failure
Date: Fri, 13 Nov 2026 22:11:58 +0800
Message-ID: <20261113-4e14e563a1-media-cx231xx@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d5403b5103a1kunm6c54e3f4485cd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk1DVk8fTh8dGE0ZT09LQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gFWSxx3yQND1lTqdquLQAqPAmR+MN8Ch15UdPLp97/lhRxw34FsMFgCdD/m7Ky7qbEjIVSWqe04XexNvLUueWVZ8RdlKKB0Ff79io/lgczYmZv58EN85DAtmqv4dErCO3ShYKu51WNHJdno7j7epDxba/cGuXbZ9x9yT9Xm9Ybo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=dVtOGBWY0z48eT8PeVEuETWNQvW5nxZDzUphyHgbGEg=;
	h=date:mime-version:subject:message-id:from;

If registering the second frontend fails, fail_frontend1 detaches both
frontends without unregistering the already registered first frontend.

Move the label before its unregister call so the registration is
unwound before the frontend is detached.

This issue was found by our static analysis tool under development.

Fixes: bdaacc32e9b2 ("media: cx231xx: Add second frontend option")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
index 472a4405a105..4dffadd31bb5 100644
--- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
+++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
@@ -577,8 +577,8 @@ static int register_dvb(struct cx231xx_dvb *dvb,
 fail_dmx:
 	if (dvb->frontend[1])
 		dvb_unregister_frontend(dvb->frontend[1]);
-	dvb_unregister_frontend(dvb->frontend[0]);
 fail_frontend1:
+	dvb_unregister_frontend(dvb->frontend[0]);
 	if (dvb->frontend[1])
 		dvb_frontend_detach(dvb->frontend[1]);
 fail_frontend0:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
