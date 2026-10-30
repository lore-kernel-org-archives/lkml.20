Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379288;
	b=uTd0nVUwC9Rmafs+IyDXQoof8LdaK89iWSngkjZdFdAuy6XUKMP+ySOH75fKQZqqiRVj
	 Yu2mDmDiRAoG2Dh0pMzP0gJRcmK0bD7wO1okgR4bEWb/7qKM+e6ja8f1c1uLsPQ7cZyZF
	 6QmEVq7bkYEEw1vRaHA0oEelSy9FIAFiiX2wXMTb6mgxeO+aBhty4gqELcvIIgJRkvgGr
	 SGnKSvo9kcNfRfR+pE8+kmFUmsHOVeag7iiORCDwfvzL9nmD0GpGW8uEj/ekuvP6smqfw
	 aGtWFcQzucLslAnGVch+QeK0WKWO5xkNs9eRfX5R052qqpBifITK3Z16uriPxvxp7IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379288;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=pQxv4yu+fEpc3hiDDM7wEn6ze+a077cgosVcKLNlT+s=;
	b=e+4YQeeKxnCux6wxmzacUKrTlRmKYpticrfe5a4eAX9taxoaib98jY887PXs1afcvhFq
	 46AlKB2ZWs2F30Pnn7f9U94spn58/wvWIc8Y7/CcIdk2KvafDfEmrDASpEeMZUbCjKsg5
	 PQ0GLe6v3xh/woBfPoprRk46yytYpGhy6DKap5cMasvvf5UekmqknAsblNSVW1mOxPbTk
	 OdXZW8wA2Zi/soQRgdBmcPgTiy6fJDkw0bO5nKzzea9fv+zoRUdIS+nPBov8TiSasOGkK
	 pex5nFgu9hQxxUWnvaScRP/88r+/1BYrlyu6Z1jDoMFpxnlX+XPp0R9+q4m+RngRfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=c5Myz7K4;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA623606A339;
	Fri, 30 Oct 2026 16:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA623606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=c5Myz7K4
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f121;
	Sat, 31 Oct 2026 00:54:42 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH 0/3] media: Fix potential lifetime errors in probe rollback
Date: Sat, 31 Oct 2026 00:54:38 +0800
Message-ID: <cover.1793377439.media.git.liguangshuo@mail.sdu.edu.cn>
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
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18dbc2df203a1kunm4d3d9b7e52a39
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGExPVk4YH0NNTB9MTh8ZTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=c5Myz7K4ZyHDfhmBKZo90FQ0B/EVgegbqORsqRohKfp3fwm1yFkyYpbpA7CO2QkaO0NfufOQk52A0qmcZo3BWJnxH3WCRzylxFJuOMbV3kaolpW80S4U9lqEXQpmlKugzMD0s8Uw2fcQ57l30r5IBsMoa9qMyx9ZnA5KKbom+Tk=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=pQxv4yu+fEpc3hiDDM7wEn6ze+a077cgosVcKLNlT+s=;
	h=date:mime-version:subject:message-id:from;

Unregister a Siano client before freeing its context, and avoid freeing
ALSA private data twice in cx18 and ivtv.

The changed driver objects were build-tested. No hardware testing was
performed.

Guangshuo Li (3):
  media: siano: Fix potential use-after-free on graph failure
  media: cx18: Fix potential double free on ALSA initialization failure
  media: ivtv: Fix potential double free on ALSA initialization failure

 drivers/media/common/siano/smsdvb-main.c | 2 +-
 drivers/media/pci/cx18/cx18-alsa-main.c  | 1 -
 drivers/media/pci/ivtv/ivtv-alsa-main.c  | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
