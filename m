Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176934;
	b=JN7z6fzsgrsHkuQPxz+orQ5BlQ8J3KCqgVYAv5WLDu09M/vQMsF5WcQ8nhqQbiqJN0YH
	 knTVYNXm7QPyi+oQDGJac1DfdILmYMocQmBdQbbndBupGWgL+irEa8pfEhaBk/3wJfSZ9
	 uk7+1Mw6jaEK8yxT+bSn8Vw9OCaOt1a1UNn8oZLcPkC/KRvuzcNY2l6Q5hQXqxcNyK0j9
	 oHY+dE8Zo8tU2dl8SDxiUUrb2sImCGP20ZZgVzqjYYM5D1ilXX4ruUcnuZobG+pH8BjsR
	 GPjQgToDYO2Ud4M5e6YDeexBdU6rMjyQy50p1C6Y7doru2ca43B3+uWc69ee9ssYkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176934;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PFQGEO1y5qufB5/Wgn/+pIRnu5IaRaJltrUV4Z2YyZ4=;
	b=sgqOVn+FI+Dde53+sQJiuhllAdiSdLNpl4aJtG78UuXcXErCgD3+lk6DaI5FW1toM3gp
	 DVBD9xjPMFdXPT+1aFbxY3GNVndBzE37oyEL50oZCdpFVy21ySJapyQPL919kwZr/ZE7i
	 TJeGDzC9nc/uMccGn+/0MpSY6CxnD4YSSiNEA1FrEmoEkGYHnF4MOwEQADNDiTB/AGApK
	 V3vG4FFrqXbJtgBOPpUV9QrxIOoQffWod5mC3HY6+w3zXLMJrPlTOYrXXq111ohFVvaMm
	 pEhnxTX4tPzREvVbQSdT7YvlRJIhp1c6/0R9qzJBPjP/m0Y5eduKtu1yTtPdBEPq1eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=gATF4rjE;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38802606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38802606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=gATF4rjE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794176931; x=1794436131;
	bh=PFQGEO1y5qufB5/Wgn/+pIRnu5IaRaJltrUV4Z2YyZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gATF4rjEkQJWpfjSb6AtyN6uIR43cuj/mNHjff9yXqXXfO5xL/NRYQ5ujPLqDW4PX
	 tcZ2csd+h9dDqftCIc0cHyXiPHz0/rsedfgDjjSStecVJTNA/FSx/++eFGdQDR5l5a
	 b960IzJgpf4UZQGMN0fPd5GUW5ASq5Os/JeoYthwmf1sD8OTyXQ3OQRx7IsXfUNbX2
	 +qTxVGVuZW1MVy8+3/sFZOyyavHIR+yMyPE0512DFMk3SB/MaS/Nk6By10OiI4YoS4
	 4RJQ9lkXFIVk5/SIW6uJfJuyBjM68/mg8HKy/1+TNrxorcyJdDNkTD22zRDUwtCIca
	 400O88+Oa/YWw==
Date: Sun, 08 Nov 2026 22:28:47 +0000
To: "marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] Bluetooth: validate retained LE Set Ext Adv Enable command length
Message-ID: <DiB5DgYqITLLCcetFLdSxmGUcDfzozcvmS5i8Owo6GfN9hpcRbpu3W2uQPmg_oSz52yjRq9uh49bQtOFPli5RZf0_IrM_S4cqdRQhax-m8g=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 529bcae06c65f5370e837ffaea1538d9b0f71b1f
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

hci_cc_le_set_ext_adv_enable() reads the retained LE Set Extended
Advertising Enable command with hci_sent_cmd_data() and dereferences
set->handle from cp->data whenever cp->num_of_sets !=3D 0, without
checking the retained command's length - the same retained-command
class that was fixed this window for LE Set CIG Parameters
(ed4d302af7) and LE Create CIS (1eb52f35fc).

An injected short command via a raw HCI socket (CAP_NET_RAW) with a
matching Command Complete reads one byte past the retained skb; the
value only selects an advertising instance handle, so the impact is
state confusion rather than memory corruption. The sibling handlers
with the same shape and small fixed-field reads (pin code reply, read
clock, set privacy mode, set per adv params) may deserve the same
treatment.

The patch mirrors the hci_sent_cmd_data_len() + struct_size() pattern
of the two merged fixes.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/bluetooth/hci_event.c:1669-1735 (hci_cc_le_set_=
ext_adv_enable).
Handler is longstanding; the fix class was established this window by ed4d3=
02af7 (CIG params) and 1eb52f35fc (Create CIS).

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index a525740..7206f3e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -1673,14 +1673,17 @@ static u8 hci_cc_le_set_ext_adv_enable(struct hci_d=
ev *hdev, void *data,
 =09struct hci_cp_ext_adv_set *set;
 =09struct adv_info *adv =3D NULL, *n;
 =09struct hci_ev_status *rp =3D data;
+=09size_t len;
=20
 =09bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
=20
 =09if (rp->status)
 =09=09return rp->status;
=20
-=09cp =3D hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_ADV_ENABLE);
-=09if (!cp)
+=09cp =3D hci_sent_cmd_data_len(hdev, HCI_OP_LE_SET_EXT_ADV_ENABLE, &len);
+=09if (!cp || len < sizeof(*cp) ||
+=09    (cp->num_of_sets &&
+=09     len < struct_size(cp, data, cp->num_of_sets)))
 =09=09return rp->status;
=20
 =09set =3D (void *)cp->data;

