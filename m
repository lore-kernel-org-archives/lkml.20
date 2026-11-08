Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177024;
	b=HcQMNdNy+D0WTz3eIkvK7zRx9+I3Cp6CPXs3UmXweAIsiu6pOuQA4emJWG0355SRzNjG
	 Shn/wR1hdmpoyQxkSvGmgX4Ir51INHF9fwM5ScKHbPkujD6EBRgmDfaipzANJqqkuycDJ
	 NZNE4B+qa2YvqOADlp9SumegBhX5Xpy1JnIDn2+RZsCakW+PPPNKjBS0TTHRg+cEE7GO+
	 FAP/sM15HJ8JFDNNvGYYqp+9zHCMlszB4rg/gEShUcsktE94bpcLIkOAGVua5u2i8r/tI
	 2y8A7kIx0ecrXD7L7MpA5u7xRpi1YDa2WIHT3gne99zAWKWfYx9suKvPXliKRbI8hVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177024;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LraNvc3nOkreiyFCQDE2c+yLeQKCkjvUV3ZdM9btlOs=;
	b=waR6G9EguX85q5ioFVm0uvjWh31xgd3Ogce8myni1bgUk+R8elKfR6RaeRu+n7a4C1sG
	 AcZXkyDxmvbzpGDiOwb0HZNhWoUECs0wCI2kIJvP1nNERr4e6upEDwRUFOVZfv/l0c06c
	 OnSMgqlUR6IiXhe6iGIUVxU0UCOvVft++3AsCzCBFF1YI4O0HRYANrrk5+BV6Nmjple9U
	 oePar4uR8Gi5INtDfoRwd1DhQgSjdze0p/uX0j4dffFBHrEhzZDItvxuVXVd+qGwmWtLy
	 ZhIRMYKosuQWk+kkGUFlGtagu+TgaCy0epth5FgQngl46gFiTy8FYJZZ1PX+K+/syTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=HR25B7N5;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDC606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DDC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=HR25B7N5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177020; x=1794436220;
	bh=LraNvc3nOkreiyFCQDE2c+yLeQKCkjvUV3ZdM9btlOs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HR25B7N56PNW/so8OEPMqZk9gDAtYbJ6iBgJhWFXjROykEzyMO5Cdql72pGo51fX/
	 e6QX2Z7nNzwdmiqlPpSgw8UnK2nxvsv68UForoySADTubzHpF2yUkpcQEC/Pw9SsIL
	 NjktMNDnG4WEYfLAXf5dqe9bTDg3TwH1haGPAPJ+fDQmiOFF6Zo/89uY4qhCEz6PXA
	 jDK1U3LKLIP2mJtO+jzo3plRZI2l8KaORnE0HySRKXxzBtLeNZKeu/eIySs+h4lH2k
	 cZJrwCEEMbciqzorhpx5NqaVA0PZs9C5kG/B8gGfTdYnKmiCfdbJdPC+jY3lnzDwO6
	 5xPdlW4T1vKqA==
Date: Sun, 08 Nov 2026 22:30:15 +0000
To: "david@ixit.cz" <david@ixit.cz>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] nfc: digital: check length before reading SENS_REQ
Message-ID: <i69izu1c4hLS_ZLvaL0RVyF5pJt0gkMCEY-87g-j6iGMyCi9WKPGInJF53uwP9q9k4IPeEoBS6RKRCNaavGJlY7G-ifRKqdeMSC0rzYf9Tg=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: e54c4e86c06a3adb22bca49215ddaa4197b07323
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

Hello,

digital_tg_recv_sens_req() reads resp->data[0] into sens_req before the
!resp->len check in the very next statement, so an empty frame reads one
byte past skb->len. The patch simply reorders the check (the ||
short-circuit then makes the read unreachable on empty frames) and drops
the now-unused local.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/nfc/digital_technology.c:1088-1112 (digital_tg_=
recv_sens_req).
Longstanding code.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
index ae6487c..d9a8e9f 100644
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -1088,7 +1088,6 @@ static int digital_tg_send_sens_res(struct nfc_digita=
l_dev *ddev)
 void digital_tg_recv_sens_req(struct nfc_digital_dev *ddev, void *arg,
 =09=09=09      struct sk_buff *resp)
 {
-=09u8 sens_req;
 =09int rc;
=20
 =09if (IS_ERR(resp)) {
@@ -1097,10 +1096,8 @@ void digital_tg_recv_sens_req(struct nfc_digital_dev=
 *ddev, void *arg,
 =09=09goto exit;
 =09}
=20
-=09sens_req =3D resp->data[0];
-
-=09if (!resp->len || (sens_req !=3D DIGITAL_CMD_SENS_REQ &&
-=09    sens_req !=3D DIGITAL_CMD_ALL_REQ)) {
+=09if (!resp->len || (resp->data[0] !=3D DIGITAL_CMD_SENS_REQ &&
+=09    resp->data[0] !=3D DIGITAL_CMD_ALL_REQ)) {
 =09=09rc =3D -EINVAL;
 =09=09goto exit;
 =09}

