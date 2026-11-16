Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826393;
	b=fqMhI+uXSHKtuuJBsBlVdE8pRHUdU/NjEslhKPojZd14Y7FdApRdL2WXIDxqv+jamm1W
	 Z0T0iJm42Dby9ac5UKCmutBTUrmnfU2jsnymkTAn56juGE6rR+LhcHhgKjE8gIMmAbGTg
	 19yH3xEMPX8KPEdTTfgDFgBnLSi8vJWoWsI0xd2/odxD5cnUsx2LBRasXy+PRyzL4edkS
	 uOFvRlXhf5vzQm6XFfe3D6DVVcCUZSKYMNlUIrn1NT0bD3sMeUAoEOqMH+9yjioUiRxXb
	 cKDMXi0478SgshYSbUCbQBlIYw5aMvN2R/79h1OGCwtBw5gvY1dThIA8W2Uwvvg0Kow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
	b=qwoATM46wELzWxVgLru8rkgKDYlCiWvFlyX68SkWBvmzvKqk2brB+YOfdvk2WZ++g5zu
	 4nNAw5D4zBjT7owPFdjZwefnduCtSKOQpPWe0ScD97zH3jxc44rWhf4FPsQwQv5VadIXr
	 Y9MdwqlSvBP2q/StdxNgXDohSZnbbc6uH9Oiuw2tewkWEzBu83Oq2jUhpNPYsbwEABNbt
	 nagO8Q8qZUZxSdPgBl0ztkSy2ChAq5wuu1309Zsntbd24QiNO4IJIqZ8Kw+52sGF5EESM
	 fT14/Gc+pnvbN2vffwphTx1kt+tklhC20YaZwzSqHS2kSl9pc3iYDqi4+BKF4lwNCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMUofNYN;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76060A2620
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE76060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMUofNYN
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-844a8bf7e25so2992658a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826392; x=1795431192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
        b=fMUofNYN7W1CyGO7ZvAF2FWAa2qYJcu4r4eowj57uVHPp3ByNFlMHPfRkGCA4jU7FN
         O8hbQpzvjUUjro5m8khTqFBV7CSBaumnQz8MsGatmHSRCKKF4NBjtYbD0wIRF/d+EqgD
         XcbcKNluWfhEIjUa81KzsXUH/YE6dCclSHOrbf80Kz/p1DTl+RDjYboCmkbZ61Uvpkjz
         jQhN7nNrRFcYTMTRRiIYOSp55YG80l0Vn+HVQkP0KLb94CjlgMxkAaawwH6TOpIA2QQH
         slKH4k3tzGsiYbMloOdqaa+9deaXiPf3fQp4ettzDL4c7sNL5HaK/ngKNDMTCc9HW4kk
         nXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826392; x=1795431192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
        b=U8wwUzy50IYDNifPOBiVg00NwZ9WUpny9xHERR/WFcmf1W8nti3FOC+zwdwFCAlZCl
         OJ3KeLI0mFQ9yT7IGgFlHzBq254Ux0oz7RME3qenRA1ppghAF5IZQDB9FMxNIwSkzhyg
         Z6+cBzOjUs2f5M7UhHwjua+f71FFdJguv7f22zpza0yRCLAewgfrG35XmKHC9GpWGiQW
         OnjjKTfc6qMjKRjR/UikZcTbtoKH3VquUKD7M3bTqIad+Gztm1pH7Olm7Jd/VTxw+cvm
         OQFkNyORuEqulNcxnDpysyL1+frNN/DlipeoLaCBTO1Kq7rygeLH3pA2mBDfdBu0/pTw
         w62A==
X-Forwarded-Encrypted: i=1; AL+hErHU3PAowHLzl3RZAaKrB84zv7sfSLueOR+bEzN9jVW+O1+H0p0GT21b+c1BZR3Zadfrl4HWOHVC8eGce4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f1igMG4DT7rGyzJYXN/9k6ugT59Hsvy+5GB+CL6AqtZrkWmkw
	1hDfJmiQ0VfnPDIYozLzydEmRngpkov0Rxaw9mapL01M2cBwfmlmc5g3
X-Gm-Gg: AYBFou2wq/xF63eGtr2k/0OypL+G6JG+sv4xYekzjUhPHS6W/ffVIBvIBdm/Feghdq9
	pbM7WB9A28F57jSr4hnzA71OJa+qEpqDkKCeZ/en6u9GyNVbpzfHK1BgfBt4+G7/qU0IJoHQt7p
	3/NAzS55ytNxXxd9wg4xf20naT2VQ16IAsGQm7puADoAuHCNWaUmBT8Ndvwo1Ub+kBbgtBP9Diy
	untv1CbFQCb81JKJI9RPLPasX+BD00M7CkFMtuSMRN5V7BT5QWMUJDhlYLTDXvgyYd+Js2CPCvk
	3iOTV9a+FfTd0TXSNNmPUHHY/nwT/+xJkAS1aoXKCYZp+cZCGOgTXB5HH8+wbyRcKG5QWfZD0WV
	2/WxMGfl2u3AmEQ30zFd8T7KZkC3FPcVgsd6riAQpad+Rq4Xo1R7ctNUs6/N9Uxws3HdOPGqFo8
	fSRux6lNRfkFSWFTODFdi598N168d2PFdV0j8J70579N23GQe7z2dycQm6gqA+F9Z0cHhFa5MaQ
	z1Q5aenh5D5D8oZh1XdIMqsKNDTSCIq7O7g/8nmY8BciMwSsuuQZ3dsT+BpvsTAUB4UPqH5eAE2
	sLd5Hsyhj2sPZ9ezQmlGIrQRHJ3nv0v8DscReChcgsH3ztjON2OMvGV7cLAZ0aYaJOTAZF1ccHG
	nud3RVbmySkR1vCd0N86gBVO41N2VeKci4QC3c2q08y6dJRCpQu4q8z7IuiWmw9k4L6SpSD6JLD
	ZNGUk2Ji0Jg18rTdX7Q5SCyVS5HunVDyQjSMh9oUUKY9c7zIN3Dgo=
X-Received: by 2002:a05:6830:854b:10b0:862:b9dc:183b with SMTP id 46e09a7af769-862b9dc1e62mr2195212a34.27.1794826391709;
        Mon, 16 Nov 2026 02:53:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:34 -0700
Subject: [PATCH v8 6/6] dmaengine: dw: report residue for queued transfers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-6-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 565d01c9a29a..5a7be765a0c5 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -867,9 +867,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

