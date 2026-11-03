Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704912;
	b=yxAlOnfDO/C4xZ5tjhkyCl53ehKUbgzmEzvpum9w+smp9SDNdsMLZvTiYAWOUs7vSEue
	 8CxwykC3fcVLgwII0+khEaw9jISvxVMTW7hwBfhh4FxfbQLM/lQF8VPynZnqeD8CObLUG
	 W0V4NKmieV1jItG1Gw4JN2+Zq+MpHq1+536tMswkMY5yR4cHhyVOLhQZ8iyQ8pi9K1yMS
	 fb5ShtDLnRaXxG8Wn17L6ci9aaU0FZDb4w61Nz8KV7l4qxGV+ahtXtuWgU5l3I6V7Cvzl
	 aQfn3gPLEaaAyKZPBwVY2JVgFeHdcyo1fhBDk9xPPV3qRgFPibBBeVxVQGHoaE+aVsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
	b=AzvqWf4h0HZqyFJ7JSWsufkjypF5ljff/VhWjC5yOEgDNycwnlGRZpvC3uLetJAIgNXh
	 vHUOVUi0XLsbKJX5TH88p69gwPkcW0frqDj40bR4dlvy+JveLnnKwUge3h/4KU9ewSJsH
	 y5Kj2vtmP9quNes/ue62wksS589jdxTo+doXizyGjXgSb+fOckTvBLWPtV41D0XZ2ClVG
	 AcY/EqGqeUfABOFIdrkmg07CRhYZl1snqjRgeO7OgenvUBISj0rnZ6CSghumazpIV3AKm
	 VxCuUDrd5uYe9TUtZZ+acqF/kDwndy9/aeL+MsHO+I+G4q+h/m0TZ757ylwpskAG/Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=DRdYMDvz;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A6606C543
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1A6606C543
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=DRdYMDvz
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25950765e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704910; x=1794309710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
        b=DRdYMDvzKSXQUgioJU4Q7fMBhsWsKOLb500NRS+hMGFa5/fq8RVRFTb+jCyHmjGGMg
         iNECqQP4z3lg9XoF0SqVxNFv+M7Qi2Rrs3nJxHtvHYvvi1DMbrh5VoDG8ku1W3dhCav1
         jXSgQm/aO3SqVMcneyUKscC/Z3QHei9NfFRdvXFXbxqMZ2XG1ZwSibcRmbObPxULRCIc
         cnYySZmlW6hPE7+Jcz6W6yeYOZ8P1+q0fF+XmBCiQu5I8HuQykW5B/OjsLJ7UHEAia+/
         7guxVxIKXxWeKuDZJo5Zm1JSf/FbpbPe1sQOGuFZZadqcHcTX0GGa1MuTVYChK/6ss0a
         2SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704910; x=1794309710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
        b=Tf+XydOufSOTw6lLXdTF54byK5ObXF2lav9yjxRqvb86nAk+P3EgokzHU7W46omELy
         pDk9S6JziTjvnDAlVVZKt04uLlzaL2/OQiXO52bVy0nKyWK9GYbH54wjHG3VLrOP+I3O
         A6HECvA4Aaid73EB9gxzKZx5hYCFNjZ0Ki9YJDm0zIGHVw5sJyhlIRwkkTt4Jokogbs4
         VsYinQLCX+5+VXS+XpclmA2yBW0BgUJr8/QMyo6JwRQ3vGshG9zb5OLnSzlS55lILflC
         /LPvCXWKOzDZPX1Snjvpj9Ov4eyKZkjpKJX+Av+JrX+7zukEiO2O1S/3Ci0AEiAZIk/a
         Khfg==
X-Forwarded-Encrypted: i=1; AKwUvBzkXVIbvAWB4svRUYMiI00yW1pbIBghNAOL2vRXqAk0FbtDIxVo+OgPhZEG8gly+Kz0/9WENUYoi1pw8z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87EUIw96FrXIOXRtxzZPqMt1e5CoytTcIBNE71EidPBnJBtYAH
	XQEh+S//W7Wl+WxuehCNUz8JAoOsmU8bAT8jWJh76mymt4tbOpNWh6I5Q+TpTVcD65g4Hx7os+5
	mo/afnPw=
X-Gm-Gg: AYBFou0wqC/wjpPpZdoycEQ7aVG6SyBk+pIMS9nav0OoAtGxwkYZvdVd5mtdCYq2Bsn
	S87a867A2mGOWv2ytlP/BlZOk/s6w5fUVgGTp+ZzBsFX+OY1L3RsXfYY8nysxrGrhPczsmFUC6v
	3O0gtOHjh5bDpKCdD3MaJ5jeWICqdYvPNWSIjBS5PXlWiBJKlo9T5yqNnsP4NcMMubNpTuh2bEL
	G711Ds2Tn2K5rQlYmTmZtnIFzKC+KgJldfqgiIdj6OO1DUTBPwM54SB+Wxtjy8lVASt3vW9MYkC
	ZXTKCupX7lC4IR1jHalHaJtdwTAHQsPJWWBlvYngm0gG8Oq4NqJCBwbjFlZEGDl8agoELXoTwza
	6nKnjcZ0/cWKkanBbq7RUhd8FwQri2fpoiqNkiWgVWyiAcomNX1LNcMJc7BxTIcuQPyzNJPFgKS
	klBlwQTvohNnPf7jfv8skTZALolQ8jtKUYCji4cmygQX+0PMqEvDlg2lxZqmmnltx9O3P+fTFKI
	rJubkwG6e8t8r2zh13+N9BjWL1nWcypfoqeVgYoZBWlgGjkYMsqlCrsOXqPFxG6k0uZtqstejHJ
	Oa8KCNpGP1ZSoUySuYj08YDEQZyhqj8T1FLZyL5AVwHZ1OXgqBPnQlxvJjsy3sIU0uUUrey3qN/
	I770OWBolCw==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr284423665e9.34.1793704910295;
        Tue, 03 Nov 2026 03:21:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:50 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:24 +0400
Subject: [PATCH 3/5] usb: typec: tcpci_rt1711h: Enable SOP' communication
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
Message-Id: <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=alchark@flipper.net;
 h=from:subject:message-id; bh=92BLN6mDRG08oaYdV//oEqkr1ngSve47pYUCM2UIR8M=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHyEfX1Yj+ydiNnfhB6du3pihmTN9VCOfTk2CfXp/
 Te3ra+Z3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU11ozMiyrtuadI6PuHr1ncXp/TEXYr8/bnMWeiSgEHY+VO/+v8TDDP0OJmOs
 THIuyOsPXuGQz/rj581xhl+c6Q/Wd6RFX3OYLMAAA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

These TCPCs transmit and receive SOP' as the TCPCI specification
defines, so let TCPM discover e-marked cables through them and learn
their current and speed ratings.

Tested on a HUSB311 with an e-marked 5A EPR cable.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index af8356df6b98..232eb721fb3d 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -337,6 +337,7 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->data.set_vbus = rt1711h_set_vbus;
 	chip->data.set_vconn = rt1711h_set_vconn;
 	chip->data.start_drp_toggling = rt1711h_start_drp_toggling;
+	chip->data.cable_comm_capable = true;
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);

-- 
2.56.0

