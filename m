Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113082;
	b=mUP+Kng8lzkyZX7bKhoybiwGM9v5/2lwshfccbqybteHl/TzgAiTLGiOKp2b89MHOmTJ
	 ifBpACKli6fn+V0JbvDqGxQ61UfYjbUMh3WVsTNKQyz3Nf8jQ4Vvy48n4IK4/N0yymfc3
	 vSHErTsqJOZ/ha0EmQyDDKpfg3BX4FztNgTg1Yj/wkxyUh0JQijqz5HfoCDw23a9/P0wp
	 0ehlERM3c8KqHqazvpaXYGA8laEqxuIxeSC7jVPka24YkehG5030DYDLoQWYkQGsOWnRK
	 DZBIDMjZOQOFZmxbKRQH/LBFei7r87FkK0SWUj1peedZaxFK3ELNPWwoKlzMSCQ6eiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113082;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=u/Cna6wmOea2iazjg5c3AihNRiBuXo1ekhdmtP6QwQ0=;
	b=iEk3sbEWgl5/NLKEuiDZVsSe8cw3VnDGmVOWbzm5Eqey3WkHNnVTzMWUken0zy4JR9eY
	 y60rL0WwlrgWH2zZFfoVHIZGrYdfc96nQFS3eZ9UNHyWCuk6YblaKPQGpOjihRW4dBkat
	 wn+WxfBxzwXGSzfSVg5uT8Fmtky3Np2clTeAPVUHajZqlbwgTgu4okJikBJd7guCZ15Z6
	 p6FtbeemG7aKVvjvkN52+QteuQ53UKlN++2q7o+9wC9JQaEftEfMW6bhAUGIpU9yvlvf5
	 kePeXGUPRrFEc5b5lFmVN5YHQ2C64H8rpoGLEIm5ctBWKKMSVseKMA3sgmXi3YWsdNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qeMteZEs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315BD60A261A;
	Tue, 27 Oct 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qeMteZEs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5874B1F031F7;
	Tue, 27 Oct 2026 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113081;
	bh=u/Cna6wmOea2iazjg5c3AihNRiBuXo1ekhdmtP6QwQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=qeMteZEsJhH5x/zRyQVjRdbPkLuexLCjcDPLScdxOrSlxT31qqE/i/WKb84l9bx3v
	 OqQwPzK3g0AXv9Mj2M83sLUhvv8cTwRCrbN50+R4zh2q1nm06iBs4HmRIoKzHBB0Qm
	 adBfmlohJ+vSO31BKeowh3kiUKBmtrzykbvjPuyM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:43 +0100
Subject: [PATCH 03/19] usbip: vudc: free the unlink item if the send fails
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
Message-Id: <20261027-llm-usb-v1-3-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=p0GFtI32k62dxmMq+YH1ru1YJqYvHEDIF8CmkYr7BNw=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr8zVFom9jd84/sfnFZMfxMMmJjlF7yt5Nu+28X68
 Hnvly7HO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi5XsZZrM5OLy/xvSIo/bG
 mR2CM7OrSr/NSGKY78N4cZenUt76RPvcjPrOFUJMLd37AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

v_send_ret() takes an item off udc->tx_queue, hands what it carries to
v_send_ret_submit() or v_send_ret_unlink(), and frees only the item
itself. v_send_ret_submit() releases its urbp on all paths behind the
first check; v_send_ret_unlink() frees the struct v_unlink only after a
complete send. When the connection breaks while a RET_UNLINK is being
sent, the v_unlink is leaked.

The reply has been built from it before the send: free it right after
kernel_sendmsg().

Fixes: d62ba981a9de ("usbip: vudc: Add vudc_tx")
Cc: stable <stable@kernel.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/usbip/vudc_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_tx.c b/drivers/usb/usbip/vudc_tx.c
index 88edfbcc0035..d78ff29e9654 100644
--- a/drivers/usb/usbip/vudc_tx.c
+++ b/drivers/usb/usbip/vudc_tx.c
@@ -59,13 +59,13 @@ static int v_send_ret_unlink(struct vudc *udc, struct v_unlink *unlink)
 
 	ret = kernel_sendmsg(udc->ud.tcp_socket, &msg, iov,
 			     1, txsize);
+	kfree(unlink);
 	if (ret != txsize) {
 		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_TCP);
 		if (ret >= 0)
 			return -EPIPE;
 		return ret;
 	}
-	kfree(unlink);
 
 	return txsize;
 }

-- 
2.56.0

