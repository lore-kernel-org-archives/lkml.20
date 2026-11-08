Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177021;
	b=fY5Ma+IczvXta3rL/7kQb2XTgfCUa7c84gKanAfX3Bv1nAoBU2JUaxpUZHZuFjwNphfL
	 onxILlpid5mWihHRc6fdDy3NAmCrjcBeE4+0sVFXtSpq7nMeMhmXL1UBygVkQUQhUwcHI
	 swKj+/gIqoiWscaOZ7CrMkdBMJvxOEchsIAYzprmvPdtF5oWdfzZMTYvddB4BdJhpTMkf
	 NR3YX3mjWMPM+DiqP1RDHq3YE2fzUK752AtP2BqXR5pB7227LHBjRIiI2Eud2UUtb5kuv
	 7iykEU7RToWijxIHQ6k05n0AwmZsrm23q80Hfc5qPyyenCiNHxxMm4bebC4pya01HPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177021;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RSZMwhwreVRyUcS7I0DbiQWzwI0OwU/AOCWJJs3k+NQ=;
	b=rvO7xhTT1R9OiIeEJKE0PnY6o7vPJSys7fQMCjULELFX6H3sHM8l3olLR8KI9Fli9TeZ
	 atLer97tOSaFG09OfVkjx5PoPNPOGIoVe53ngSf9veK+gClgG6vB1/zmvhoXH1i9vIL4g
	 I8Zr4hUvHyQU9z1fKGYPkblg7uoufCbKLmfMl+hoiILFPo2tqR7NkP560k4KQ/LowCYH8
	 SqMe2oFqnu1IZ9ACsKQvYYCHd4ygtwRYtREEHdWQsG5ms8JrpaWXgJeF6Vbpn67KVvBMc
	 qQ2cKAia9iqkALGsNVJIGPDnzKMAsvqRej8EjZI/z+5n2/va9GdeawNLjVQ9KdCBcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Rcuo+Xje;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22856606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22856606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Rcuo+Xje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177019; x=1794436219;
	bh=RSZMwhwreVRyUcS7I0DbiQWzwI0OwU/AOCWJJs3k+NQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Rcuo+Xjed3qIG/HrFlDZ7h73np6d5L+L/EHLawwZVBS81gczIXljiV+5bYQFCZU+q
	 eqXakwgcjCQTZEXJyG0j7wQW148FbxS8YpP5SBNPsDnPJD0iTlkfTxGP5xn6XhSuSO
	 fE+eTW+UmcoOdyfpDvaLoSYEVmial5AxVLlD9pdfSPFK442J3ieLDVPbHFAeNWryvK
	 MNYlVCVTH5lagRYOoLYGHqa8VlwZu0YdkKJgQyON4QPYm+U9ZGXhXcfbdl6KL2g8qB
	 AeMK254/XQmQkgkcZZNrLKm78IsUSvbHf4+TMcINj4uRj3gal/bB9KDWq2C+QDTUik
	 AEWD6h7+MvEEA==
Date: Sun, 08 Nov 2026 22:30:13 +0000
To: "david@ixit.cz" <david@ixit.cz>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] nfc: digital: check response length in ATR_RES completion
Message-ID: <LyOKCC733hNrBd6iivknR2vV1eGIrrd5XvWeTzpSKHjz0eb_mC3OYTVGmYuGYz7fEdR5vVu2V76xphxku0BWFg5TSVkzd7KD43KN7SqWpWw=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 8d0f60ea5733ae4d2001c3d7195cfbeb2ce18b44
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

digital_tg_send_atr_res_complete() reads resp->data[0] and then
resp->data[offset] (offset 2, or 3 with the SOD byte) without any
resp->len check. A short next frame from the remote initiator reads
1-3 bytes past skb->len; with current drivers the read stays inside the
over-allocated response skb, so the impact is a KMSAN-visible
uninitialized read that at worst selects the wrong downstream handler
(both handlers re-validate their input).

The sibling digital_tg_recv_atr_or_sensf_req() checks resp->len >=3D 2
before touching data; the patch adds the equivalent checks here.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/nfc/digital_dep.c:1467-1487 (digital_tg_send_at=
r_res_complete).
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
diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 968547c..b9b04db 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -1474,16 +1474,30 @@ static void digital_tg_send_atr_res_complete(struct=
 nfc_digital_dev *ddev,
 =09=09return;
 =09}
=20
+=09if (resp->len < 1) {
+=09=09digital_poll_next_tech(ddev);
+=09=09goto exit;
+=09}
+
 =09offset =3D 2;
 =09if (resp->data[0] =3D=3D DIGITAL_NFC_DEP_NFCA_SOD_SB)
 =09=09offset++;
=20
+=09if (resp->len < offset + 1) {
+=09=09digital_poll_next_tech(ddev);
+=09=09goto exit;
+=09}
+
 =09ddev->atn_count =3D 0;
=20
 =09if (resp->data[offset] =3D=3D DIGITAL_CMD_PSL_REQ)
 =09=09digital_tg_recv_psl_req(ddev, arg, resp);
 =09else
 =09=09digital_tg_recv_dep_req(ddev, arg, resp);
+
+return;
+exit:
+kfree_skb(resp);
 }
=20
 static int digital_tg_send_atr_res(struct nfc_digital_dev *ddev,

