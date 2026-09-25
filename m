Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601644D9F78
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361726; cv=pass; b=gLG6RjowZTnnMzla2OkyT5OMpHlyCl6Gj4PG5UaUtDzaLbluygRsRe7RYWtw5YMfeq5TFHXdK35VJezTWXMfhNllgyv3VhASk+uDGc2MET0Ga6eX0uI1pwfSqFP4nZxAH1kPnNDZZDQkZFujQwCuPHeXcV80KLHu/GzBa4HP+lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361726; c=relaxed/simple;
	bh=HS7UjO0jQ6s+qLOgaF7cYDk1QhzxkXFUd4jz+Y1RB18=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/dg9wD/9Q9Z32C/0n7zwwqWUWfsrWzlwwysd8m/79iA+5f+67RTPjL3by/H7VgHHBXzjH8hWmZN+mKdLYLpjFUw4q7NY+b5MNi3z7+ruud51A/9evOzLZS3QI5D6W+zFcqpbrCK0WfrdhBkKDoLQMOFM5lgfyXnujEkRtPGjQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4mPYDLL; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4mPYDLL"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso86238866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361723; cv=none;
        d=google.com; s=arc-20260327;
        b=lpnSULPHS43h8+laJwP9Yk7Qbehv/Z5TzfL+eKe3wSNud+cS8asKbJ/5P2NbP6vV+s
         chwYoq5vp6EmW76QsKRH3ywNdFKH/x1hDgW6mnRJWYxiyLWKKhcJh2MzUciyv3VxXZHw
         JBiPWf391KutTzSnvZ/2rJSuH3yfJyW+p5xWg5REaXEutuwF9TxS/H/V1ARYFCHh3ny7
         9RLuZYhUdmhrbaLgoy6tG2JkowuRIpkAn7T3bVLTq0lD+4aN/gqEpZp+opg2RmCloWSb
         p9bzLIevCReSxrTdyAEg0JZxICNn1+OTwe+5HdVQPHu84g8ArDC9yH1JtSVXe4X4eAGB
         7tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        fh=rcDgfJCxV2S48+otlOgGAqzTpu8dWIm6cw1dZdP7Itg=;
        b=oL+IXPdf+WBY5C6q8DPocmj7ZBQHKcs+jS6ZLOAFdi1EoMcXDe30/TLk1y6e31Uz2A
         ywNkAHyZIJv86Hnc+TE75Y6a4oj4MrrlgxzCKtmFqlLaLhcna+5y4wQO/IaHf/5H2wfb
         yZVjelsQaigQwyltelQiOEIagPuhi74DGSAKEh/+gF8Eli1TWy76T5lDFP+O/JgE2vZM
         X4yDVDjj6RdaWQAipOTLMOeAPjY5t2GQeRtIxE8nIoN5lrI338skUAdBvrqF1ySGblGP
         q/qILku9U+PySxw2cnSI51/GkIQYQp7B2i9P5DvGloZ0inzYsv7K0pCm/blEirHu0DAc
         5wVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361723; x=1790966523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        b=J4mPYDLLGnE9uQ0T9aObl44DmPjEjQcZ9j2RUOBjM2WRi6zwG0xI+JoDLIooAOqCGV
         evkU7ggPB5r0Bpndf4xqvyFVj9E6omxgLhZZPkW2slooTX4j0okmdZD9C2F2NgC1vCl6
         k86ys1Vl3Uxu8L7us1MbwsGNoyS6J87JdOGsfSek3Kh55j2iZdrdWno3igUO5MiX8O8p
         dR2WU38Cvx11QMsxg5hG8q1aBZqzTEJt5tBtGOgUGjhrXSCvTxhwFRBVCDZofhfRbZNF
         RxsSsK14g4kjEqRr85WWpRT0EUIiycESqWfFlXU5JXsjoZkj4QGtN6ErwBKI8vI0H5mQ
         FRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361723; x=1790966523;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        b=1NxsZ+qo4ML1mb/bAnGf1ErB1Af6U/Kp3xpCYd2Xzz6pVwNgl2U6wyrtpXn+1EBCKj
         MtIoqqPmaYjRO43j/W5a+igujJnMXI70APhFfsivEW/6Wr4M22y4/qtI9kwNalbdPydY
         sfUGETl19N9+Mm3B8N3qME5wDbSNHQG0/Lufp/OaSonMlPDlhtrXQG47rJY/irz8wyEU
         i/Ln7uO6p9+MOTatpEFdUW/pT9V00hLW2p1olizTQIp0Z0+L/cXKNmpfLCWPwfYu5Rw8
         9Db4R81DmudLTy8x/LKUB1crbk8DNFDbYZLh/FmovFJDcv2bEKcYIVkMFPkNfNCxhEoQ
         kW5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/F6R+OiLYGRbgDg7qjhy8Gsp0/kVyEnyYciBgn0pOUpU0We6llOtR+K9so6yZnG1K0QrlMeoaw4s+iXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nW/Dit15E3q0gm774l85ugK1ot02lUJwWjh4co5SPVSCxtsrsg
	RsSfJBfS6C+CbMTgReUIARsTh9NzESQh74iKWfMNgAr17boxyISCcbi40E4R5nKCW/KBAroldw2
	7y80YHChgTmwpRNbg1E1RSk4qonmLRQ==
X-Gm-Gg: AYBFou2gfP8gNDqecYyxXDibOxUBWFaIMtmAiH07yOX9/TrpRNqlswdyFIUVq2/dNhC
	udeTPjhmSp3ChyioOJ55rGspZZzhLaNjvvT5aqj+3tU5KSY1HXqJaBf8oYXYLfJlKSfc1C3OH3z
	95GewQoGobQYnzbv+ju7w77269xG5BSvy6BOk+r8E5u/dZjS7DcQKevMLqCj6UfB8aeQqlF2Dlq
	kI+nAePRu2T5DvTW8ZIfq8qig7cNnCD/cxaNLi4/3A1DOyAkoRiXwiE7D0yZ1DTIaj1lPQrOCJc
	YTX1nfPZz/uoA8U31uwFkeG6P8lsxaQoIBlIGlv3lr+SgXEEdTDwK6qEmSu3hBrHqLKBl7f+eNJ
	jqLWPoDMWxRI0wgBqON7nMod8IeHxpRWzA2eowH+/duWL68Y5l5zQEPE2GWkdPbdr
X-Received: by 2002:a17:907:c609:10b0:c2a:f5c2:5cfb with SMTP id
 a640c23a62f3a-c2af5c26112mr141173866b.7.1790361723550; Fri, 25 Sep 2026
 11:42:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:42:02 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 25 Sep 2026 11:41:11 -0700
In-Reply-To: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
References: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 18:42:02 +0000
X-Gm-Features: AclHuK93WCMThwzB62NGGPUhReh2HvWzHdMO2hPiVwHYNnR5LFZOQOgclwYoXI0
Message-ID: <CAGEsz8HdRUS+fiSq=Yp-ivN6_SiruegFc+V_AsmOxr=V+5rJpw@mail.gmail.com>
Subject: [PATCH v3 1/2] media: amphion: drain message work before releasing
 core state
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }

+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);

-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}

+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }

-- 
2.53.0
