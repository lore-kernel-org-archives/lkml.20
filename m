Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403439;
	b=HJDRgdW48rvWDJ6Yg9RvVz/8/HYRAsc1MIS4kuHyyKjKkQ2tilxm0q98E/aTIVgmloSW
	 2ALHVQ0h7GV0dEQeWduC04RHu++u/cYEkykRD6aKSLYCHgUbJVtCpq8Um1uqFFK6oL40v
	 H8NbERCfQ9Iwh+fQWKsswdA2SZt3H9h5RjPLi3PkvfJCvA4NKeeztF2lr8JIS1VpLzWwj
	 QHljua5oWPXkuRcW+8bwceMAQLBRo3fknZvtB1cQ99Dz4WzH3aX04S/jz4vCUKTrI/f1x
	 iY1bmde7nnrzgmlFql+XF272vdZFVLhy9z86ByYX9XV8gJM/QrV1df6lnhI7Ml0KbCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403439;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wOH7GEHHCWlc2iDdlrIzc0F5JDB+bb50L0YggTMp6Dk=;
	b=JpnZP32Q8bYN5gstsw/v4XmZM9KEgVdFFazubAcIbUwk4RT0w6fjacromRCuEa+rWnOV
	 2YhHvPy2M83VJUNiURowK1r6Q9dL3Mdohpo33LZgkE+eKH/bBs9B9OwVp3hBeREgOYWRk
	 IPPDTR+4wpdvugTU6B0SXgsXnq+xJW/U0EyQFJnAACdIbeSTDf3XmTcNSX7xu5L/bqCVM
	 aXUPbnRm3engS1qPNfqjsaO5PMJm7RhepwGd2YFCj+5Ggk+hG5Ac8YJt/IZPlD4v3M1dn
	 1h90gThMzRDHkSpcmInYGA3CEAEYFcmEBVvIzo087Qp/Pmcp0q98W7ij3MWpOAUwD3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jaeyeong.cc;
	spf=pass smtp.mailfrom=jaeyeong.cc;
	dkim=pass header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=Me2bcM9Q;
	arc=none smtp.remote-ip=109.224.244.20
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A52A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A52A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaeyeong.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jaeyeong.cc header.i=@jaeyeong.cc header.a=rsa-sha256 header.s=protonmail2 header.b=Me2bcM9Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaeyeong.cc;
	s=protonmail2; t=1794403436; x=1794662636;
	bh=wOH7GEHHCWlc2iDdlrIzc0F5JDB+bb50L0YggTMp6Dk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Me2bcM9QTh75iCxb1sCyRooLRqDz569gMCXiHGFgwimd02GttIk2PTtoudUx8Il/v
	 2wMKuY7hKKFiIn+xV0MOhHKvgtcjd6Q8TkIhbKoxSBdnjZWTXpYLc8j3tIu7joEPFG
	 J1d9fXiRKqxRjBs/4kmVxiYyMsOGVJfHS/JExfEoZU0x4HUVWuCVNqHlDuSxr9AoYQ
	 IwcE2t3ad9ALUtRT/nGkrRS0J4jxKlEpGmCZiADlzXMP4JcN8lKf0cOhRDEtvhKHnN
	 LA0gTYYYbVJ83Ubx4rrZR8GI0cnM3du2qVMPGaLnjdici947Xt10u4TLFAGDAnctRR
	 qJQU7DstkeUJw==
Date: Wed, 11 Nov 2026 13:23:51 +0000
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Jaeyeong Lee <lee@jaeyeong.cc>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v1] usb: cdns3: Fix WA2 request UAF on endpoint disable
Message-ID: <20261111132346.9262-1-lee@jaeyeong.cc>
Feedback-ID: 177356447:user:proton
X-Pm-Message-ID: 90d1596bba7175882734bfbd6791536fcea56128
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

WA2 internal requests use two independent list nodes. priv_req->list
links a request into wa2_descmiss_req_list, while request.list links the
same request into the pending or deferred request list.

If an endpoint is disabled while an internal request is still deferred,
cdns3_gadget_ep_disable() removes only priv_req->list before freeing the
request. The following deferred-list cleanup then passes the freed
request to cdns3_gadget_giveback(), where list_del_init() accesses freed
memory.

Initialize request.list when adding an internal request to the WA2 list,
and remove it before freeing the request during endpoint disable. This
also keeps the cleanup valid when queue setup fails before request.list
is added to a request queue.

A QEMU KASAN reproducer placed an internal request on both lists and
invoked cdns3_gadget_ep_disable(). The unpatched kernel reported:

  BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report
  cdns3_gadget_giveback
  cdns3_gadget_ep_disable

The fixed kernel completed endpoint cleanup without a KASAN or
DEBUG_LIST report.

The issue was found with a static analysis tool.

Fixes: 6bbf87a131ed ("usb:cdns3 Fix for stuck packets in on-chip OUT buffer=
.")
Cc: stable@vger.kernel.org
Signed-off-by: Jaeyeong Lee <lee@jaeyeong.cc>
---
 drivers/usb/cdns3/cdns3-gadget.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gad=
get.c
index f4dfd01317083..70968e8f0d2da 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -605,9 +605,11 @@ static int cdns3_wa2_gadget_ep_queue(struct cdns3_devi=
ce *priv_dev,
 =09=09=09deferred =3D 1;
 =09=09}
=20
-=09=09if (priv_req->flags & REQUEST_INTERNAL)
+=09=09if (priv_req->flags & REQUEST_INTERNAL) {
+=09=09=09INIT_LIST_HEAD(&priv_req->request.list);
 =09=09=09list_add_tail(&priv_req->list,
 =09=09=09=09      &priv_ep->wa2_descmiss_req_list);
+=09=09}
 =09}
=20
 =09return deferred;
@@ -2547,6 +2549,7 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 =09while (!list_empty(&priv_ep->wa2_descmiss_req_list)) {
 =09=09priv_req =3D cdns3_next_priv_request(&priv_ep->wa2_descmiss_req_list=
);
 =09=09list_del_init(&priv_req->list);
+=09=09list_del_init(&priv_req->request.list);
=20
 =09=09kfree(priv_req->request.buf);
 =09=09cdns3_gadget_ep_free_request(&priv_ep->endpoint,
--=20
2.43.0


