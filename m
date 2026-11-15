Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768824;
	b=iSBlImf94DD7IDc62c6xuntcWQxQJ4XPTJgViWZpJruQ6d0kAdv47tm6+hVjE5M1F8Pt
	 YsfP37bILM1uJdATWteTMlybm1yXUbChXCgpUTn1OnbAuIrNKeOw5NWS+qiNDoA3flUXE
	 jfXHRSBfdRnrOYv0xUtuZ3cZE2zrdygaSPaxfJB75hye79GxZ3TA/DAJ40+1TcLf3M/pB
	 Kn/7Q8fLPy9xpng45w6uVM1XVsPd4DdpedOohjZcJ7nfV/wCymjNPIjWTLeIjuUtW0JJw
	 RY4ztOndka/iG+xfJs+Q5/VSEba8ssmT7CKcrCYJ7UGz4CapBC6xk12W4BZuqaKNnjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
	b=5J5QNVZzIMTdDDta61asLBfaeEmzNB+wUdYwSmCJK3iUSQIktceuYOa88LLOKLr7d4lX
	 PTUUEjJ+qoraa7u98LDHOhxEXS4ap1tUT2bkSmCO/yXZVKplYZc4gaVQP6iGdnKeda3PY
	 Vzb+Xzq60YNBJ+kt6EFFEzMxEXW6Wp62DVNoWHzPKiDF2KO53fz03gwr7MknmHc9JNHl4
	 edXoBUd+aNovZvbmFJM+qqpQ4mX5KB2vi02pSad1m7CltkkI+4vUAkxlFLte1OiAjqdhO
	 McYTrP1yav/VbrDE0ZFqPz0JfYL7sEDO4xh7YlZkphMay/X52Lus4lz9Q8uTi5yXybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=MdAvEU1u;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA9606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=MdAvEU1u
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso5613025e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768823; x=1795373623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=MdAvEU1u7SCn0d4StuDm3qQkvkE5B8JbAYKeGeTi4kItIZzIIlYVWqjC4ofjAP7gwL
         oSqky2wgYBGRQ7m8pGMpFTqf7S/YsfxlEKMugMOor8109xerzZIYP0i84zounUG6K8iw
         fkIbsRrmLHXshDjLxLqZkhwd66d/1MEitqoX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768823; x=1795373623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=X6yU+WFzHvuJun8lT95EAsoev/RxaRObdhMFjnjK9Jq0vUGszvlxqTTPm3pxze7uR+
         sA/tYorUfCkDirov9axW33SXeStKC2zDGLNebB+Avoq1cD/vQ8zauuYf4w4ytoRavLtj
         Pp2nwqcMqjHamYV3e/QWuKMT4/EUbSsscCXBOn+YK1p5RW0MLi+V55P11CByypETJ8j/
         KjbtqIaCpoNnsh4Us8eAXOxvo6scOsFmkVZZm06Hdiq3H2r059indvbDbgNiKhyndcnh
         RnEnFduoWaGWN6xDxcEOjEVeLkzNtJvCG63EXyzmrFVVozusX5hchzIRIa1cSueMyfHU
         NxYw==
X-Forwarded-Encrypted: i=1; AL+hErGLNMS6Fwlozl7qkEcrzfGANPjnXsJX43XAjBM8eNn2Jy1vfudVuccSJ1wCMLNQYnD5QEu/BuIZNKhOIgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+//EZMVTM/h8k2OagIUK28MgmtgHMaaiIDxQQGEOsdNqNrb28Q
	2YEvNZ80tWT2IVtD+Aq6qdJwAkSuq4hu2Jb0pQfdk0zs04qlZiERHJ1LEVuA8O2MBJk=
X-Gm-Gg: AYBFou30E52m+t2VMT8HEFDc/lNTTusO++tIlCV9w8prl1VaQFzjQwCdeN97BUwA7Dq
	es/wrd9ZtkTpuvoQbOYjt7/dVFOxJDwsAkJJfVsGFIEthhoT+J4Sr3d7iNpLn4Yo06G986+4KKq
	2xcgfjEeIZe/asV5Pjpq39KO+C1KC0Y91P/oxKwrrruAZi0N8AFpGEt6OphpbczcSIiLtmEFElv
	YKlSeK+KElhLIFlI/lyA7qOCyUo05nsX1mcN66greZ9JWSibVu7Gs40Oc/7ds22BACBdjzHv8wS
	E6HQYCk6KcOnwLzKhqBMMgERghzXRrCDIiU1TwkxmENrvPkEjocqPyvs/LksuDZ0TKQQwF1IuTr
	7Gfh7o12FSx/4KvCr2zJ5Afx502YwzGHCG8DHxLmimV6Lcde1H+/EOGHD7Eo5gGZtMK6KCoJAEP
	b0gEyGW9zjCRvtNTt3wIxdyqp0k9bmiQC8kaCmYVtEcR35pMNDCcDMYqOB5tnKA+bYRvJbQtsV6
	QnOt9sML1q0honLhjkjDjiU1lLPEaVLdFY3MTDNKACZaYxY1z6AiXx8Ny5i/lU5246NgQtBu5Ff
	nWp46FkUc1avu7z+4nQwG22Dyro+HnZDHGS9LDVxYFcmwdtYhA0HiIhuj171RRgSvcayHq5rGPN
	2Ek+wzeNQm4YLnnBJmp1dpojjvF7l40QiSJsNTNhKkeVkEGkkE4eF75DHgyKrXfvVIteTwIisMK
	l6NIM8rj7MtNkiCQ==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr80230305e9.8.1794768822690;
        Sun, 15 Nov 2026 10:53:42 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:41 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:33 +0200
Message-ID: <20261115185335.782678-2-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-1-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
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

In descriptor DMA mode the core disables an isochronous endpoint when it
reaches a descriptor that is not ready (BNA), for example after an
interrupt latency longer than the queued requests cover.
dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
to the next OUTTKNEPDIS. Two things keep that from happening.

First, the endpoint-disabled interrupt that comes with the BNA runs
dwc2_gadget_handle_ep_disabled(), whose isochronous part is written for
buffer DMA: it completes requests frame by frame and advances
target_frame up to the current frame. Run after the BNA reset, it moves
target_frame off TARGET_FRAME_INITIAL, and the OUT token handler then
takes the chain for running and never restarts it.

Second, after the BNA the core raises BNA again for the disabled
endpoint as fast as the handler clears it, and no OUTTKNEPDIS comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a UAC1 capture endpoint and
eight requests queued, one 8 ms interrupt latency (a line printed on the
115200 baud serial console) caused one BNA. The endpoint stayed
disabled and the BNA interrupt kept the CPU busy until the host gave up
and reset the port, which took the other functions of the composite
gadget down as well.

In descriptor DMA mode, do not run the buffer DMA completion for a
disabled isochronous endpoint; put it back in its initial state. For an
OUT endpoint, build the chain again from the queue and enable it at
once, both after the BNA and after an endpoint-disabled interrupt that
finds it disabled with requests queued. IN endpoints keep restarting on
the next NAK.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05f..b0e129061 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2259,6 +2259,28 @@ static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep)
 	}
 }
 
+/*
+ * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISOC OUT
+ * endpoint again from its queue and enable it.
+ * @hs_ep: The isochronous OUT endpoint, in its initial state.
+ *
+ * After a BNA the core keeps raising BNA for the endpoint, as fast as the
+ * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So the
+ * chain is restarted here at once.
+ */
+static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+
+	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
+	    hs_ep->target_frame != TARGET_FRAME_INITIAL ||
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
+	hs_ep->target_frame = dwc2_hsotg_read_frameno(hsotg);
+	dwc2_gadget_start_isoc_ddma(hs_ep);
+}
+
 /*
  * dwc2_gadget_handle_isoc_bna - handle BNA interrupt for ISOC.
  * @hs_ep: The isochronous endpoint.
@@ -2279,6 +2301,8 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	hs_ep->target_frame = TARGET_FRAME_INITIAL;
 	hs_ep->next_desc = 0;
 	hs_ep->compl_desc = 0;
+
+	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
 /**
@@ -2902,6 +2926,27 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 	if (!hs_ep->isochronous)
 		return;
 
+	/*
+	 * In descriptor DMA the requests sit in the descriptor chain rather
+	 * than one per frame, so the frame by frame completion below does not
+	 * apply. The core disables an isochronous endpoint by itself when it
+	 * meets a descriptor that was not filled in time (BNA). Put such an
+	 * endpoint back in its initial state and build the chain again from
+	 * the queue: at once for OUT, on the next NAK for IN. The loop below
+	 * would move target_frame off TARGET_FRAME_INITIAL, which tells the
+	 * token handlers that a chain runs: the endpoint then stays disabled
+	 * for good, and every request queued again goes into a dead chain.
+	 */
+	if (using_desc_dma(hsotg)) {
+		if (!(dwc2_readl(hsotg, epctl_reg) & DXEPCTL_EPENA)) {
+			hs_ep->target_frame = TARGET_FRAME_INITIAL;
+			hs_ep->next_desc = 0;
+			hs_ep->compl_desc = 0;
+			dwc2_gadget_restart_isoc_out_ddma(hs_ep);
+		}
+		return;
+	}
+
 	if (list_empty(&hs_ep->queue)) {
 		dev_dbg(hsotg->dev, "%s: complete_ep 0x%p, ep->queue empty!\n",
 			__func__, hs_ep);
-- 
2.56.0

