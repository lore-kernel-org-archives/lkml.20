Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177179;
	b=Rxh440Ri17lLd9rsaIKsDRRhibs3h0ICbFwODpEVsxDU4jfMwkno/X2uBDj2jvwRXIY7
	 wVI6Psd3FJIdYq2N7lzuJoU63YClHe7LHmy/w0hXE1hwz/vagsOudUEeBr6TBy18loJTR
	 XDqLyYrF7m6CRUkgsl0RTlhNyirE6ln5vKPO7tUOfGSn6icciNMHY2oSTHN4sGR3wAi6W
	 84kmIajI04WNc1bS5LMNLhfn5aiBtuZ2vjnFJpd8n7oyT8bUMs5mELK7kggq5pdKx1q5+
	 fMwLN5DEHxo9GzhdX5gYPyyELv2QmPDOD9cum9oml1VXAR+zlAi/0L6R2CTyIH3yiBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177179;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZgBAYp6aSHgh2UGYksaSW/6IjKs1l3nEYgboAEjjug0=;
	b=f8G7eniXwXOXx0maEcrYZMXYpa/755VrrcllII/K8TQriE8rBqYvmYajkdVJU/dfSFxM
	 dbD1gdK70UKY0D4pO4Ng1T/quieZzcGeihdlOK3Uz3af3POImN+XmbpMd4rOHMoTlSana
	 HKWU9Ya1DC/wyMSLc6h+ZaeHEhB+IHiy+revTCPlhHeM8FMhbLQ6C98EA2zDDVslM/Tve
	 ZWYejV+tr4IU6AJbsXlGmXhClbCDq7SF85e+GPOBPd5yIrrb1BL/wyn2K55IgVtagP0TY
	 Fq+CsTRg7PETxn29rnDeYHJ7QZj+jM7OjCiIhYqNeWbQRG1q9LlFCNTDGVoKgXXRnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=v0OOwBLe;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441E606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=v0OOwBLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177176; x=1794436376;
	bh=ZgBAYp6aSHgh2UGYksaSW/6IjKs1l3nEYgboAEjjug0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=v0OOwBLemlbjCrQF6I+GFKlFfAlJiS9WAr+fTBHoY9RTAeAwQraImnyjjW/k0Bfxz
	 Kvg3glBuEt0yTg4Vr5oH5rOABaN8jzwa8vphQYcYUWdG2iCodVNsFWbbkDOPlag819
	 EqsAmnyo7C2kTgqkb29vgLXdVrKpJasM2BYHsWNnXjbpwW19Uy0okM5aSHQAbBD7II
	 6piU9XLHLO9t/vZhjqU4wxi5oZN8pf+b6RwDKc0qEp7PWNQqhefRbn1sTmXl9tch81
	 2rtC2mrS/jfHvbF9iTDGzItgPhL3mdbCRLYjR4OTx/hjnYScL0U8wX/iwNgvoSj/TY
	 JqJj1VBd9v0ZA==
Date: Sun, 08 Nov 2026 22:32:51 +0000
To: "nkapron@google.com" <nkapron@google.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_hid: free report list on release
Message-ID: <1QsGBy1k7rgvDtVuIrw8wkuScqkmKf-h2yKjARCmaLFH2TFGvlr8izECUG0Pq-FRMo3NqA6bmTOayxrZ8xc0xwSOKjLLpz9flCzQomrlnqk=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: b516be455eb068567a30e49e16bf2be43d708eeb
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

Entries added to hidg->report_list by the GADGET_HID_WRITE_GET_REPORT
ioctl are never freed: hidg_release() releases report_desc,
set_report_buf and hidg itself, but never walks the list (and
hidg_unbind() does not either). Each distinct report_id used over the
lifetime of a function instance therefore leaks one entry (~72 bytes),
which adds up across gadget reconfiguration cycles.

Free the list when the device's last reference is dropped.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), drivers/usb/gadget/function/f_hid.c:679-682 (list a=
dd), 121-128 (hidg_release).
The report-list mechanism is newer; the leak is present at HEAD.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/funct=
ion/f_hid.c
index 3c6b43d..dcf6dce 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -121,6 +121,13 @@ static inline struct f_hidg *func_to_hidg(struct usb_f=
unction *f)
 static void hidg_release(struct device *dev)
 {
 =09struct f_hidg *hidg =3D container_of(dev, struct f_hidg, dev);
+=09struct report_entry *entry, *tmp;
+
+=09list_for_each_entry_safe(entry, tmp, &hidg->report_list, node) {
+=09=09list_del(&entry->node);
+=09=09kfree(entry);
+=09}
+
=20
 =09kfree(hidg->report_desc);
 =09kfree(hidg->set_report_buf);

