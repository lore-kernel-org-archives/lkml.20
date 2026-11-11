Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372710;
	b=SGjktFyNrR7W8WoUO6rDrhXapOZB0eIXxZzUKgCkq8fTPWQd7Xew9zmoKFbrwOP5Pj42
	 tJp/ldD0ywQq67AEZMBVisWXQDGkwqtHlke7iD3M+chXXCoKa06wEuwsXJ2xA3qb4SYXg
	 ttbfhZOS3rzJnedetQA6t87Ur7TeWFvC5McBfpJ9+KRCWUbRPEVClOvyMRidNwsz6Gxz/
	 gVfix92vLfUR28uv5q58rkXBRUwukBNjkQ/J/ZRooVG5KXOGli5zMF/mmgxOs8/qUqZ8m
	 MeI3HAQEOgixuORgWrOhzxpcS0P06CbjiVjhxRh+8et+nrcSxDE4yFdJxBpT+OeP0MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372710;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PdkaeDBkQPMcZsP8x8dXInLvq16R0F/aoOqvWMheSX0=;
	b=r1LhDtuEQRwoUMc82cPlML7du315xlhjs+AXb5OkzuJqh177SVIJ6AFP9Bw/ib/whaPM
	 DiTZQR6ybTK7vWihMYryQiDpdF26qUGqvIN6PBpbhlzZl0l9hRvLz5otugv+A/E4glFDZ
	 1jtF0oxdksCvoPVpmJPj2b8M+tBYIEVXfxezAlpesVaR7VZgx5bxuig8WNqx1y5v+7+ZA
	 TQUeAUPIU8TcTOwBU7FxBEFJ2a7Xr4WBT1Ft/Upgs53R4FWR2Rlog7eysgoAVNrRkiV+t
	 IvCoBbQrFUfpHBvP+O0jiz7CFG90AONTUpmcaQd+EQlCdx5UfYNn5P1KVJFoXybfpqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="cR59v/eg";
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2C606A320;
	Wed, 11 Nov 2026 04:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cR59v/eg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794372678; bh=PdkaeDBkQPMcZsP8x8dXInLvq16R0F/aoOqvWMheSX0=;
	h=From:To:Cc:Subject:Date;
	b=cR59v/egOY0iEFUchsVcdCFYnmPyQaQkG2gyTWRk8kYZ54njuRU6eBdh7QIbkg62+
	 WyMniU10LID+ZI2vCl0fiDhqUCSxt46eOMIDHqzFfPNHCJXLt5k9H6SdakEUHTE/Yt
	 9pyjo+yUYXyLUVYt9+ysYuyGwyMdLqq2BjxLjhPs=
Received: from localhost.localdomain ([2001:250:4000:5114:b573:5664:a517:f40d])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id C8211CBB; Wed, 11 Nov 2026 12:50:02 +0800
X-QQ-mid: xmsmtpt1794372602t8hws913d
Message-ID: <tencent_924108DBAEA30F3DD09C66FEC41A965A970A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+NsHQm9vJZQnypQN9OSiEG/eIobvkb+ciMqifAF58A+l04etCU8
	 fxfHEu3l4fiAJIF/ID9TbrcHMdaru0ksZW9bXS4SwI/PbbJZL69w0SpxxiDcJuz3PSPh4yCxEfFq
	 mldS3F1QBQ3/BSnVEBoC7ROBX5whvWqlyMBl6ij8Q87ZEfqnOcivCH3LFDyCYwOabDEVedTABBsx
	 +BrEKkq45nd9+SyB9THP0JQ2TPvtESg7Osv8S281BlzA9wp35s7OR4Xp0SnSajnCmez07t7wcF5s
	 xHAfO+rcfqE523D2GuWS0kRff73XSOC95Tfw9DycVjAusIgyCTs1HfQbMnckwK8/1cn37KyuAfTU
	 ORWPULoRo03i3E/i5iezR9xYL4Bmbys46z5Y0viUKqZKBHkwpvTQVgve84g75gE3r+ZpTBrwbbJF
	 wn9CezRUnvoZa6zfFhj3t/rRlGWNQlzUTTN64ooRWYxGgj/Bfra/4MMhJZM0JoyxZ7t6tCbxAkM+
	 fOFoSY+bd0qiDSgTxFQXhP8eL0aV5jxzdj7kQIcTX6Ejs7P8BsSu5SYHrbiLxYw9P9b5MjuwB+FS
	 IOslDmz3Og/ZSmddhdmjTqjQHn2rArSLMi9qW/2sPV0DqDU0bmN1eGQu7VXO1xC7lr8MKJ/2mbLS
	 kOehpKF9febhcXp5iD1wxrJNlGfrg7OL3nj5s+4NEKypfPjTqvfLLMP2eb/qsF2IaRLHDqkzl1wY
	 ub4nOFmFyzgYRUnpjgiKMuySBoFNRczzNt1tYSy+Gly35jl6z+WnoFipcljWzvcQtBlmXv0nCyNZ
	 Ak8S/yqdHJ8MzkbdvwljswXGwdcSpg6xOP96dw8DCSes2HPlDcU5M78Km2jgM5zsLvtXHYJLyNMV
	 v0/8lxGe01TuUtXAxsM+5ulpxEf18EEyFbqZTLRMPmhpY6/XzGD/MxBTrBNzTv/cNklvFdAypiqT
	 6/S7fl3TqAfPDY0bCX7yJ+0v2srT8CZwilhLUC8swN3jGjFinv0qDxr7AW3uDn7fF0boZsa5zNuP
	 XsWPdcNbjkGgwuwuTEtv9EkoLOn7yKqKAscY9xn2zYww99NEtT
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: LiuJunyuan <2058432396@qq.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com,
	LiuJunyuan <2058432396@qq.com>
Subject: [PATCH] usb: gadget: udc: handle NULL request in tracepoint
Date: Wed, 11 Nov 2026 12:50:01 +0800
X-OQ-MSGID: <20261111045001.13625-1-2058432396@qq.com>
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

usb_ep_alloc_request() passes a NULL request to
trace_usb_ep_alloc_request() when ep->ops->alloc_request() fails.
The udc_log_req tracepoint assumes req is non-NULL and dereferences
req->length, causing a NULL pointer dereference.

Make the tracepoint handle req == NULL so allocation failures can still
be recorded safely.

Reported-by: syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a7ce560c30c4ca3bc22
Fixes: 5e42d710a108 ("usb: gadget: add tracepoints to the gadget API")
Signed-off-by: LiuJunyuan <2058432396@qq.com>
---
 drivers/usb/gadget/udc/trace.h | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
index fa3e6ddf0a12..bcf89b5693db 100644
--- a/drivers/usb/gadget/udc/trace.h
+++ b/drivers/usb/gadget/udc/trace.h
@@ -239,15 +239,27 @@ DECLARE_EVENT_CLASS(udc_log_req,
 	),
 	TP_fast_assign(
 		__assign_str(name);
-		__entry->length = req->length;
-		__entry->actual = req->actual;
-		__entry->num_sgs = req->num_sgs;
-		__entry->num_mapped_sgs = req->num_mapped_sgs;
-		__entry->stream_id = req->stream_id;
-		__entry->no_interrupt = req->no_interrupt;
-		__entry->zero = req->zero;
-		__entry->short_not_ok = req->short_not_ok;
-		__entry->status = req->status;
+		if (req) {
+			__entry->length = req->length;
+			__entry->actual = req->actual;
+			__entry->num_sgs = req->num_sgs;
+			__entry->num_mapped_sgs = req->num_mapped_sgs;
+			__entry->stream_id = req->stream_id;
+			__entry->no_interrupt = req->no_interrupt;
+			__entry->zero = req->zero;
+			__entry->short_not_ok = req->short_not_ok;
+			__entry->status = req->status;
+		} else {
+			__entry->length = 0;
+			__entry->actual = 0;
+			__entry->num_sgs = 0;
+			__entry->num_mapped_sgs = 0;
+			__entry->stream_id = 0;
+			__entry->no_interrupt = 0;
+			__entry->zero = 0;
+			__entry->short_not_ok = 0;
+			__entry->status = 0;
+		}
 		__entry->ret = ret;
 		__entry->req = req;
 	),
-- 
2.43.0

