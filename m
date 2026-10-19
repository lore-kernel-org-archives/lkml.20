Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421713;
	b=KCD+yGjCQD8iDOCoVrhH9miLQwJk2z1tNwWil/zFm8GRRa6bW55hQumHqM662296S7Y+
	 7auk5VT71OPD2HFCjDgEzSM84ORG+Bsv6QbaqHjdTO+EGDFqqbDJTUzLf/6lSVZRbLXvX
	 NyP0zNoiKYX9fvlHo2QjrCSOFU6eUwyO6C+VEBHprZp1LkH3TpYhzvDrMVlGfMFBZbt2m
	 8n/h/ecu9XtLUuUR8FOI1LutUc4EsvHk5rwa4w7iAtc9lBLtIu3eaVFdpNtZPoPc/Y7sm
	 4EIsTSeN8BNdvh0Yxp4ttRgGMTqr032e0msfXMTBEXcS9P7MJFucGGGCv8DA3WDT9OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421713;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
	b=B/+hhZITSzwqloW+SKPchZrV2S0d7944stGLvNfCiP6wdxm2scz/7Sv3mLrkw1szxX2p
	 G3rfb3wWZGS4fY9Nz2P5sYvsI3Ta/VCcK7BBYVFs5bj8+5wB6ZFbl6g+ejTtnHki3ua5m
	 uvuL8Ec1ChW4/GZ6hYpHZtWXTd1TTUQxSz8GX+laXkhu2ODDebWQVCYXLSKPjyohInvy6
	 L9OWQHEVW8SPOvGB9LGc/9dm22jbqMURMXJEWtRn21l571Cwzro4P81CFGagevG5FRTdJ
	 HsPpwtFxi2b0EN5UdlbU5Mooms4g+q6RARTAfsVrgbuYLNhLAeCEM692M5UfgSbP/aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnhsvt9K;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ED6606EFF1
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnhsvt9K
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4A6513F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421713; cv=none; b=oS6FgOmdE46nAiumNCUjtmlEfs35uhRZl8WLc+gwTiQD7Yjw9FjOFVN2Z4/B94LCFXYUlkW2WjiCG6Jz/J0MLkZYeAE+2NqFqTcQcI2kweUSXc5dYfUZml24Q8nMnbsqvHJur1gTdvv88+Te+3xqSLoBZud8GaIwTAt4C8qrXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421713; c=relaxed/simple;
	bh=RLy20rUqp920ststPilGHR8safvwyNqGX8plEY72uGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d70FAGy1Zkxz41TcII9JYISOJW1KpURWoMFJFi+fhM2hYvfsnoc01bxvItiT8IB/m25c0aoUhLCXFO5xiqv0pPAiRyZ7idiUC30G8vJ0Zv57q60EGMrU4cVpplY3E9e3Dqcdm2d75ZlRVaa8XkD3SfOd1VDqvhM+WxIN1MVdJYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnhsvt9K; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3998024eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421711; x=1793026511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
        b=fnhsvt9Kbw1KHj0wOt6IqTMP+1DcDpUsv4BTYunt5bj0b8ii+uHxtylm34um3hiQOr
         yYQ/z8AWiIF7yBb79h9Ne5A+LFsYYnif+sS8cWKpfWO1SxbhT64IrzvIVr13sG0zcdXe
         BlhPc/RHgKns/+w3vSZAOr9PraRqKPrtVheWj5zx9uzoYHhhPRQU6Ta1JpssPAgHFRwQ
         biSv0E5Mmq0KH33gTcNH+XNmqI97O63iY/vEcpqDcT3FCi5J2sM0zealfq0Szv5UXXRL
         97Z2C/xW4D4lFZ3moB2iKwe/pwDRaAtJvw9sZEXrwqlhb4BvHpZqxD4VOWhzoar9DR4M
         I1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421711; x=1793026511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmAvYMzYsSLV9YGDTAToTSx5qORIoNpIq25+Tdy+3Zw=;
        b=blhkYsXis0AgDFko9izhoFOL5vg9PDlpkgxt+5WLjm17DiV+s9mzLT0H5TTILSuzh6
         cx2uhuOEvqQm9WVzM6rHJbzEJKVJ5P4qCr94EFLWcvIFr+rR2uI+9xw79KHmZv8b2lcg
         o6qc0V46iHN2X/Dx8h+cJyax5hygMcj5pzp17ah9nHvtLln34TjKB8b2v48Os0UjX9Lx
         9ahK8XHGqINiM7XbVNhqfoDUNxsUMz1mGoqiVj8xhrh5cemJDGwVasQv9n+jnbcwkN8z
         F7CGJ06WX9fjkAR4TrDMzOz866FysBBXqtAlmcc68+eMKdj6/XJQFRmUhPCCbwsuBvzy
         Z0cw==
X-Forwarded-Encrypted: i=1; AKwUvBzb7u7NvTPygkI7j3cp4ZZXxHSTzFPvuMSzLYr1pntkDXtCV9Z9J5tZdIcQB7joif2zzq8Bk+WucDFhX84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd1iD8KXYF5SWDvX5CJYSU2DRiJgH7HY7OuFMDL+zXWuFjEOEM
	AGUP5t8yTJla7jam7FCtOqBvV0455KoyARHcYxaLxy4PnLk9sv57Hf1m
X-Gm-Gg: AYBFou33F+dpPiM59bdafU7FdNBGjH0aQ5L84pu157ov9xs6S3MX/fWnWKMLciZIx0a
	VVPLcTVAiH1BYZYoa2TUpn80aspRUvriGINdoD9CQQ2vm9s36kFfbfIL3PAGrawIufdpkAll3B/
	yQ6J9uPQBtsBtO0oBojcME3UHM45Irbti1D0pSKnIT4T/8yF/D/P+emnttKmmsypP7z4xsJnXHx
	RHxCm+abJFqFIkeh4wlsywQgQkwlLHts68CPMv0rpu2wzLRptaue8tlc7E07RWCKGLXFE57s4hR
	/9rtYZW44jFAE9SPKYLUWATuZnoOgkRRGT0eTpuAaBSDLGQDvzQAr5/FjCy4UeRSXg1Lu6Yu/9H
	tYRrI9/1TtkKJRfjD/1sKs5clgEttpnphvkfcUQQ+fMMJhKwLD2UVwiN8QHa+OKuCbSFCDKquft
	7QPWFYQ3kBLz3lBjuDmqt4GYQwFvzVWGMhEyIIfncykVU4gBm2x7cv3D0OWOAzg4qf2TZmFw==
X-Received: by 2002:a05:7300:8284:b0:358:bbb7:88da with SMTP id 5a478bee46e88-361a234c05emr10464488eec.32.1792421710542;
        Mon, 19 Oct 2026 07:55:10 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm31590887eec.26.2026.10.19.07.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:55:10 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minsuk Kang <linuxlovemin@yonsei.ac.kr>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+1c5368988052dc2d8201@syzkaller.appspotmail.com
Subject: [PATCH] nfc: pn533: bound the OUT URB wait in pn533_usb_send_frame()
Date: Mon, 19 Oct 2026 21:55:05 +0700
Message-ID: <20261019145505.176036-1-ngocthang2710.1999@gmail.com>
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

pn533_usb_send_frame() submits phy->out_urb and then calls
wait_for_completion() with no timeout. During probe this is reached
via pn533_finalize_setup() -> pn533_get_firmware_version(), with the
USB device lock held by hub_event(). If the device never completes the
bulk OUT transfer, the wait never returns: the hub kworker hangs inside
probe() and every other task needing that device lock (e.g.
usbdev_open()) hangs behind it.

Bound the wait with wait_for_completion_timeout(), using the same 5000ms
that usb_bulk_msg() gets in pn533_acr122_poweron_rdr(). On timeout, kill
the URB (usb_kill_urb() waits for the handler, so the on-stack
completion can't be touched after return) and fail with -ETIMEDOUT,
which __pn533_send_async() already unwinds.

Fixes: 9dab880d675b ("nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()")
Reported-by: syzbot+1c5368988052dc2d8201@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1c5368988052dc2d8201
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/pn533/usb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index efb07f944fce..569b1915afc9 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -184,7 +184,12 @@ static int pn533_usb_send_frame(struct pn533 *dev,
 	if (rc)
 		return rc;
 
-	wait_for_completion(&arg.done);
+	/* device may never ack the OUT transfer: don't hang probe() */
+	if (!wait_for_completion_timeout(&arg.done, msecs_to_jiffies(5000))) {
+		usb_kill_urb(phy->out_urb); /* waits for the handler, so &arg can't outlive us */
+		phy->out_urb->context = cntx;
+		return -ETIMEDOUT;
+	}
 	phy->out_urb->context = cntx;
 
 	if (dev->protocol_type == PN533_PROTO_REQ_RESP) {
-- 
2.43.0

