Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792757762;
	b=oLDJWBTrF2MzMOod+EpGQnOR9Lf/vPZ7/Fk7znozftkYwf58JDYdlGc8DhBH8ZVKecKq
	 /DJx9PruToic7FpM13BYlmh+oz0ns47aynn7llMWhNNHSUQ64wcBwhQPmYmBU1foNC2SG
	 ZombBaV1UNxVtM/0c+T+KbeNHdsrDEXdr8uOZsjMJ/3cz5KJtXZjzG77RVEKomI8wQS4+
	 GohmpKIxFOonbsnTVuB3B/0H59oeJrnx3OhU1Xi7OwMfXzOLYzC7WWUuk8sEKhE1nguCT
	 VULHJT5scAwyv5tq3nbgydTcYItGWuo3VPb6R9dH1g2ZoqR59Fmrdsl85KqnV275AdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g80y+eFc7rKK116yfLJoMLDJKZv+YbwbA6mbST3B4ds=;
	b=No1rmiQNN7IwJuP26BzOlIuSiVIf3g4XQtcX+e3Y6N3aWeZVfLQPcmqAV7Ny2iisgq18
	 /hBCQH0dgfN3dXdTGmZ//gIKc5yZ1XQHfCnjmOBgds+8WWV93CUxkgJ/7PxLnGAjv/ws4
	 ChdMJXgiipedTBvtKAlYQcsDUcrNZIshGNmS6OWkWJzoRpgg7pUYRi3rBWolK312EY4/B
	 LzWu7WH3Mmj+NNNkvVqN8GmT6ANT5SfYmyjM1hGMMKWXnphGUP2PKPFh1iDw3CR0X/6HJ
	 3R/fyOQL9BwpPPsV6J7b2dO8hUTgqWb5cuNVCPvrr0697vxhW9dDQxgdIZ02LdKuPfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jelouoH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342CF606A31B;
	Fri, 23 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jelouoH1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792757761;
	b=cior3BQ1CrOlSHSXnpWN7hKJV2tJEMccynuibKKeCIaLfWhavuVa1YaL1aT82UVqzWbz
	 fyV6cdzG9qg/zW+lEtmYNocUxiTzEfjCiZNwxgyAg8KUhOyiMTsDec7PeI6+EXhqobA2J
	 6gTKZmiK9GbVa+Tw8CIe80Gu0GahLxZr77sNWnKLYhPMT0gIX4CnhTVYATUvJ3Wiv0lOL
	 SykO7xOoS2mRv97GgdeGZTzFPzMuNejpVdN63Qt5D8Toc3z8D3eQ34DJDTnl5syn+PEiA
	 NNY45DFoNaAQfqkjZk9fwwXjQnwMTzPo/ecxOvuHwphGnmhgzuU9duC9t0+nB9G1g9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792757761;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g80y+eFc7rKK116yfLJoMLDJKZv+YbwbA6mbST3B4ds=;
	b=Q3y0iHcaXrMhjLm45wxHN/+loKXsQuEb0hhpchtCGDDratb92YBLpTNbapPbeXmCo3P+
	 Gxp3fho+zYsmHhWVvdZfIyNXM6feFi1GDd449I1hUAhOBOdwGzmcwGxcgznkQ179bHsiS
	 YCmNOVemqIieTq5TIOKDOWssvXoz1A3hUs0BJDtcYwVnfKfiekrn+vpccI4xmdGMumVuG
	 sqtewvIXkhWPQpwB0hJnJztU63IWQ4Cye5v3j1BAfieNgDUsDLdA5TDNHyGXM3t/VJci5
	 0Ejv88nvfYvvKxygGpSG5YvOhkvHsMyU92wnAWUBETjg30akdYioX627L31lZj7NJuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5030C1F01828;
	Fri, 23 Oct 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757761;
	bh=g80y+eFc7rKK116yfLJoMLDJKZv+YbwbA6mbST3B4ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jelouoH1rQJmLdg8YJBtb3BhNCfiio4avy48tswkSa5RUSatehJ1ehnUslPIagCRx
	 mZ4Sqmi7LIipzcPb02LeQ4WDoz3fPDyOc3GAyQM9B56ySsTexA8LaJcIeQJwNaiBxv
	 wHD3zosLq7iXyhft3DHQ4kLrZWHqI6zggSoetyA5uorXTYfhG/fkh98XYMQ4lX1mq3
	 TeaaPdTaok4KcufBhUfS7qzxarxPZRjr+oAvlszcBQtHCPzQMHgKAEks5gzP0QGa2d
	 +IyLPYG/YBcYJZxOP/WvKgLSKp0agT+S3LRmV6uJc9+tGpZxMVQUE7ZCnKBiCj3rJ5
	 cxXOv63xguUrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B94EF4450F;
	Fri, 23 Oct 2026 12:16:00 +0000 (UTC)
From: Massimo Toscanelli via B4 Relay <devnull+massimo.toscanelli.leica-geosystems.com@kernel.org>
Date: Fri, 23 Oct 2026 12:15:28 +0000
Subject: [PATCH 2/2] usb: gadget: f_ecm: do not notify from ecm_set_alt()
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
Message-Id: <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
In-Reply-To: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>, Kuen-Han Tsai <khtsai@google.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=massimo.toscanelli@leica-geosystems.com; h=from:subject:message-id;
 bh=1yFrqwzUswmQN5891X/izJlFIQr+YSlAI0VR6/27q08=;
 b=owGbwMvMwCVmIB2leGXyl1LG02pJDFm3/f/Pydxz17jQRNTtduXz3IyTfUeOfP59eevrLd6vf
 1fNDz3U31HKwiDGxSArpshybUv49wjb3LAdWV2rYOawMoEMYeDiFICJvH/NyLCy6dZu0dfezYLc
 J00Tf71ce7M1/P2ueXd/Wm79tvliS8Y2hv9JXBHvSpS5ghvvyO87+2XjDCXRFnO5tbI1gcG7TlW
 tecEHAA==
X-Developer-Key: i=massimo.toscanelli@leica-geosystems.com; a=openpgp;
 fpr=D6B457F7583D6D56B86A8AAA301B5A21D493F475
X-Endpoint-Received: by B4 Relay for
 massimo.toscanelli@leica-geosystems.com/default with auth_id=1289
X-Original-From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Reply-To: massimo.toscanelli@leica-geosystems.com
Content-Transfer-Encoding: 7bit

From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>

ecm_set_alt() calls ecm_notify() for both altsettings of the data
interface. So a notification is already queued at SET_CONFIGURATION,
when altsetting 0 is selected, and it waits until the host reads the
interrupt endpoint.

The USB 2.0 LPM ECN (section 2.2.2) lets a device answer NYET to an LPM
request when it has data pending for the host, and DWC3 does so. So
when the host loads no class driver, the device never enters L1.

For altsetting 1 the call is not needed: gether_connect() already
calls ecm_open() or ecm_close(), and both notify. The extra call only
restarts the sequence while the first notification is in flight, so
the host gets two connection notifications before the speed one. The
removed comment calls this a minor disagreement with the ECM spec.

Remove the call and the comment.

Fixes: da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")
Signed-off-by: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 drivers/usb/gadget/function/f_ecm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index e495bac4efe..c8c3a7d1c80 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -581,14 +581,6 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			if (IS_ERR(net))
 				return PTR_ERR(net);
 		}
-
-		/* NOTE this can be a minor disagreement with the ECM spec,
-		 * which says speed notifications will "always" follow
-		 * connection notifications.  But we allow one connect to
-		 * follow another (if the first is in flight), and instead
-		 * just guarantee that a speed notification is always sent.
-		 */
-		ecm_notify(ecm);
 	} else
 		goto fail;
 

-- 
2.43.0


