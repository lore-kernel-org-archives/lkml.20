Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841101;
	b=YY/I170ifb6DWMAiuVj/+o0fUhi7nEb8vHJQ4jCBguEUWT2r/IkhtMrxKBv7McP+XbWi
	 yuPa/RYZ2l/qy1I0PyACaBpQ+DD1wyQgm2JtmQLBqLZ7rKtF+kFLdyqOgpPybc22sYZVE
	 68StyQyoNCQ1RspwjXsUDUhgD6qt8Hf2gZeucUL9K3+Z+3VntKE9rRAD7ami0m3ZvBBkk
	 c5YvhNhSZiPgVQ47lLptlMLK98R6yara1U3S+AmoWQzUAgaY2V2wJTFdlZCtKXLQsOGyy
	 GS2hYIuAA4+JDBWZQPBSpTfhXFEZPFZ1TxtO+ghNjBPIfIxHRMdk5j2U91QOiZeRWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UyIS5HrPAfwsrXJYXiNzhXcKwNQ0JKe7IvE+jZe2qjY=;
	b=Wu24eTOYg6JCA+QX8WNINLh8sJ8aPsPqZYVeQk52QckQHXovyiflL2seRO7r6Uq6y21D
	 DeAxyAK7nvuEteCxz91Wv1gwnXzweG2+2xMc4/ogqQLaNiLs6r0zHhJhKhXNqMPMECiVj
	 407Rc9CnkYhxVxI/sxO5FP6jsPpk4+p2Y4gytrTVltMyFHEHe3LYSj0yhXfwIkMTFap2M
	 VNgwroNKw9hJhh40aaYGqpFSzo/DlacNDUed2kehxr3rC/2aC1pqGRGMjoa+WWDKsL0g6
	 Rx34Q1gOq2+g6mteX8EGE6E6GT/U0CEZs88c6p1h69HFqr0gIVXc0oXVGAjUxdrOkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fGiiHYKW;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1624606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1624606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fGiiHYKW
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67583c777abso1787717d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792841100; x=1793445900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyIS5HrPAfwsrXJYXiNzhXcKwNQ0JKe7IvE+jZe2qjY=;
        b=fGiiHYKWxphjU1XlWxDPW+oPdglZEczhN8/zPhNkFl2k8iH3+kVmlEADQDRMea+n7/
         BESAv8DtC2Msgqfhjb0b/rf7wnvyckTNCw4jeMAEqmP2vGblx2B+jSPLvEnUBM/kn/ES
         73hq+83vIC+dzRPk4e31vIPEUZfBL6RmWZvSoe/69fyrp900TXrxFgm+/r3UipaLwSM2
         O8rQY6Kn7naZ006oyntv5J2nnUPNhOfx+isWO0lNlwqv1WFTlKjHmH8nUYXswMXx5UOi
         egiSmXcIJAxs1FGfSoom6S7JPSID0tBIrfB/EcsAvAApYSIn4a/3wp/2nB0W8k/QX/v+
         38vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841100; x=1793445900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyIS5HrPAfwsrXJYXiNzhXcKwNQ0JKe7IvE+jZe2qjY=;
        b=j6q+ujY76W9y/+eWjGhqEdsTOSlSUn7pWM6xysEAaLD13JyOD0YVD75e+MBPP6qI24
         x/MXeb7ttkM71bTTQKlqLMu3g1pR6NvtB7LlBl/CCU3ZVoBskp5IbRLT5pwlZFlwCpvK
         FtIwBCHDrsibpHmdVCZwiMgIFD+Jn9vSDTVENPMhN9kg9tsUpKdBot916gx8cLiybrRK
         NUB4WCJASWrBHqZWmzjFVnmoRTeOO8x/sgkkBnMT4z69xoCn9V8GDPBvOGJ739mai1rQ
         E5Uz+4pLJwUanv+XHC95o6cfmhrVTTNoWBJ3Z8ApNsGiHYaV3DBMhGLKfMnaWyXmUmXr
         CdtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBAqszXJZ5ONLYL+ItjY7tx9M5DrounltTLCCj2O+WYXDGLYPwHT5n6IFIz9nfeoepa99jEH8GGVv5j/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHhHNXT91UuzHrd+xJJRw5D44EBL2hL6A7KkhcxJkmmsQJzvne
	yqu17712exEB4olT5dTRnN7r+YWfXMqmtdGiRFGLao4nmLyGOP8VN4Q+
X-Gm-Gg: AYBFou0C13YOAZkS5uCvgNeqvEpgbxtXehnPfVfXf24N+ZDZbtyZGonh0Tx0j5XESTA
	ynwKuInvk+J4NOdyfqWd2VQfKMAesBN71FHIBBQsxpwPRadMnWq8OyArIcjdwLWUQaLmdS276Tj
	aV4KzB1eKkF4Jk1WddTpBaCq94J4RCHcSmdRGmw/KBElxsFxYLp3bFilnSojk1IUY1LTffmCnCu
	t/PkyYSvM0Ujp6I7xGUfmZmtStuoQR0qA8c7Y4ISzMzOxroEo/LAa8cnkhZqsiNZSIXTv1S+7/2
	Dr4RtfLgQ4WiKVqr6hxGqNEHnh2s1tnqNzwUSc5P7Ty25OY/jWMhPv2d9LW4cJc6MKAV8g2uOpd
	waHnuWx3yyXbGRpVugf5+JFG8rw7LSbjDXuVwKTgZ+Gmr58jtgNNxOB7j5J/TEMH688moPQz8cV
	obEsgpOA33xTziNZsgfqLtwfE9TEaAXi+xspOiI3x/vnkmsVPydF41lokR6Ow0GSs5mo/IIGtF6
	xdDfNbKfja6vSTIqKlRqjSaoIsfIEoJG57R9MY7ECJil9Q=
X-Received: by 2002:a05:690e:169b:b0:67a:48c4:6b0e with SMTP id 956f58d0204a3-67a48c476bbmr911988d50.15.1792841099825;
        Sat, 24 Oct 2026 04:24:59 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::dff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626cbb4sm855725d50.16.2026.10.24.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:24:59 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Brandon Williams <turbine.bmw@gmail.com>
Subject: [PATCH 2/2] Bluetooth: SMP: distribute the identity address when bonding
Date: Sat, 24 Oct 2026 07:24:35 -0400
Message-ID: <20261024112435.247650-3-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024112435.247650-1-turbine.bmw@gmail.com>
References: <20261024112435.247650-1-turbine.bmw@gmail.com>
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

build_pairing_cmd() only offers our Identity Information and Identity
Address Information when privacy is enabled. Without privacy the peer
never learns our identity address, and bonds without it.

Some peripherals need it. The Microsoft Surface Slim Pen 2 only
advertises to reconnect, after a button press, if the host it bonded
with distributed its identity, as Windows does. Paired by Linux, the pen
stays silent. Enabling privacy is no workaround: the host then scans and
connects from a resolvable private address, while the pen directs its
advertisements at the host's public address.

Offer the identity key whenever we bond over LE. Without privacy,
hdev->irk is all zeros, which "indicates that a device does not have a
valid resolvable private address" (Core Specification, Vol 3, Part H,
3.6.4), so the peer receives our public or static identity address and
no usable IRK; the previous patch makes Linux ignore such an IRK. The
peer still decides: the Pairing Response masks the distribution down to
what it accepts. Cross-transport key derivation over BR/EDR is
unchanged.

Tested on a Microsoft Surface Pro 11 (X1E80100, WCN7850): the Slim Pen 2
now accepts our identity key, and reconnects on a single click, double
click and press-and-hold after it has dropped the link. The Surface Pro
Flex Keyboard also accepts our identity key over its out-of-band pairing
and still reconnects.

Assisted-by: LLM
Signed-off-by: Brandon Williams <turbine.bmw@gmail.com>
---
 net/bluetooth/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index fc75cf568471..8ce5f92d7ee5 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -636,7 +636,13 @@ static void build_pairing_cmd(struct l2cap_conn *conn,
 	u8 local_dist = 0, remote_dist = 0, oob_flag = SMP_OOB_NOT_PRESENT;
 
 	if (hci_dev_test_flag(hdev, HCI_BONDABLE)) {
-		local_dist = SMP_DIST_ENC_KEY | SMP_DIST_SIGN;
+		/* Always distribute our identity address when bonding, so the
+		 * peer can tell who it is bonded with. Without privacy the IRK
+		 * sent along with it is all zeros, which the specification
+		 * defines as having no resolvable private address. Some
+		 * peripherals only reconnect to hosts that did this.
+		 */
+		local_dist = SMP_DIST_ENC_KEY | SMP_DIST_SIGN | SMP_DIST_ID_KEY;
 		remote_dist = SMP_DIST_ENC_KEY | SMP_DIST_SIGN;
 		authreq |= SMP_AUTH_BONDING;
 	} else {
-- 
2.56.0

