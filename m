Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378796;
	b=RrAs4dCINe13kPpGA19Y3k121TDEOSKa9XaDPKcHBnvvHi0XxgKPd4VWbrQ3ul3lUHiT
	 4CvS8gK2zktsPwaSXmhjTmDzveHx29x4M5Vcz9SgZp5lAb3BgW5leJaiV+pxdVpuQSzq9
	 5l4w6RZeOaFe59FN0JttiDNnpB3pKpSVXe3CDt8LhXVmiqjOJkv4W9qOQLH7haYF4PJE5
	 E2oa4eLc+V0TqVDEUrXQbom5KDRiTS4G3ocPrGDrQ3NxnSKhFkyLG/pR+jNwT8ukaihIJ
	 pX9p4zsZ8I2vtPkO0IFXCwj8/AY6Iv66mCoU68Xu/M0QVjzrdCYFGYrFSHeQ16a9dAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378796;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=24+7rVjvtFzDw5YKWbSjhfDmCymGoFyP8Gck810toco=;
	b=wEKFN1Pt8UQzDyQd7GHq0Xt+xhnQH0TCq+4iNiYMdhN56dLqwQKot+cg3/QYHC3Swpay
	 J+JzEB2MFHWT5fU3ieYMjlfV1laLx/dwdonPjF/aPwRDCTAfpuoIew6J/VFuRYBJ+9A5e
	 KA8Bt+eD3em8eEmDNelaHoDnyB5Ddkny0qjKryRuuRNicHwJDvCVTf0pjjkmJj5lHNek9
	 eg7POEJkz2N5o4DbiniXhDsd4PrjU4/qzTjqWbBMdhTOWha61M7WppVXymivRapttSl91
	 77CX+ByesCvUZmKXrXWybLBHaWbL2gW+liLUezZuGMJU4CuvptywjIfbuDYdc7M5c+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uk2MnDtD;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D90606A31C;
	Wed, 11 Nov 2026 06:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uk2MnDtD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794378784; bh=24+7rVjvtFzDw5YKWbSjhfDmCymGoFyP8Gck810toco=;
	h=From:To:Cc:Subject:Date;
	b=uk2MnDtDkRkrcIHc5gpTWWoTGHnaL7oxFY3Rf/kFKfzlZ7X98P8lItWXqRchrpMM5
	 CMcMQuvcFzxNas0bNW5fZ1nuRUU1TA5rr5J49LTMuAv8XPEbFwjBjtzB7Sj/UOJyh9
	 czE4PLSWDFcboBMKOQET1xgkABPx9Ay/6Cu+3Cgo=
Received: from Liujunyuan.. ([218.106.117.238])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 8028707C; Wed, 11 Nov 2026 14:32:02 +0800
X-QQ-mid: xmsmtpt1794378722t2uggijsw
Message-ID: <tencent_08E401ED34EC47C550C71A0462C8161D5D05@qq.com>
X-QQ-XMAILINFO: NTHHJyks9kXY0zc6wvNOnnYh4dM4WR6M1gVHSGtdo464QMbtgQKSJW3yc9NBp/
	 +ZdIJwOjsTzpI/3B/AchshjwwtIFQMuMHHQkNjWkkxFY7zuxmXA0abppKCHAwD8ahkEStR+ePFEE
	 iACdsCoTENc/XpYCGH7TwA0P4R9Zodb4ONMQT97CEHrYV76O0yJguQpVXLTu/sHxk+PR5wVighOd
	 HfMAkQx2BgJ3eXCTvYnrFx1LEyRV/rjPtbscGHsFeRHkVhLofcl56bcWDJigYeIb9B8GILaM0DJx
	 Ewt1YtuP+/cm4hHUd6U+g9jP48zm8QRD7kUieheLcFxaDkuESFEGWO6ITmsH42gbod0/m2Utqhdy
	 BFfiJAxWr6L09Eonq2YZeSuDNBRXBdkzJ/fKQ5cTxg4m5RGaQjo+AMwBtQdgiyV35fSXfcEsmC47
	 GKhP8vrKdGBccRRm0KEQua0kXXHWzSVMwXt+i6AU0JxcT+goEFRR221j12XBhfaBZG6qbGhPIjuM
	 MOPTaocdELDrm+6hOvF1qLPd+BWav7yt5JpqZta26BXXtZCJTEz98YhiEX6kG0AX6k28TN9X48VO
	 YAg9TR+Hv9co2h1UfKbCsHzCbtelCUNd+yBOAdtOqgir7cO0Qg0E/jUKujhohh06hLy1kAqb8YOe
	 cq2s7iVKiqW8oEk0jpzj3XnFLIQmtIKeW3SFr11wUhK+bygki5FDjIDsWSoTt1qakLs4wqaUxGk3
	 V/lAeXJ0CA+nOCpm2L3h4DIlCJD/BdwTgeM5DzBNpyQEp30u4yKnc4zo0tnDxD/tfSjyQF1Yw6xp
	 vJjBw2TeiFfQ80u1qUGd0uAe3fD49no6ZaHaH91Hb6l2MtzLxcf1rYWdHc/qkeNvxKvzlYUsTpru
	 gYqDbq1ER5ui0pmiJbqCADSoCuRpUlMKESofVRCe9gbUgiTNowZdvp4qpTqvbx6N9DFyhqgpDSAC
	 k9yITCxmFH4w3RI3sQpvAZL7aYqynqPFrrU1BhtDYvScigAvngK/kWy5G3ijVEF9tGKpXFJYxO+i
	 zd8flnc0Jh6yPfBQrGOVdFBv7w0Xy8BdvCwIQsSivdH5j7LkZwhvN2Z2qbDfhEsI+TLSTfh6JeXn
	 HdpdO5pdRIpmQ6027EEi7qtBi6gmbdjVQd4g37QgjxDKayqOEAca6O+TnkwfulG19/Mn/ojikJvV
	 +AX6I=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Liu Junyuan <2058432396@qq.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com,
	Liu Junyuan <2058432396@qq.com>
Subject: [PATCH] usb: gadget: udc: handle NULL request in tracepoint
Date: Wed, 11 Nov 2026 14:28:01 +0800
X-OQ-MSGID: <20261111062801.8097-1-2058432396@qq.com>
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
Signed-off-by: Liu Junyuan <2058432396@qq.com>
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

