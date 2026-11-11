Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430777;
	b=BSVJOcSSkIibHojS0KOvAuQWXyLw6DOo8xtDJi8LAtjzMBTx61MSkNdwJlKyD87zl2iW
	 TML92//UVsg4PjHiHBQPek9f9N3uWiLjaoknIwvPqZ3W+aDfDxdS5JEadg7GzokKwaWrH
	 Zsj6FynJj/skTba6+lyqS/OI6ojOuVG+Glo9ourSfEUpMMKE4quc/+Gd2Rw5yLy1cwQUh
	 ij88eZZn8/m0PftdTPcz0PNC1oP6impz9Q/uPaUuNXk2TmliHEN3FZWWNUAm+8rZh6G2t
	 0TDW6xJKdkS1MAMDUFi4PT5/fMt8YChZ6jfJTwtW8rpwq7w3ZftoxVtl/yIgqz2i49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
	b=qjf6TZiW8yyBZPRpmgWDylYsm0n7D0TBP3BVjJKIrYFowC0qNyyYIaAxbWKS4mr2B8Ox
	 Ihj+ZwyRZ20OVHpQUGCmKMFAt44WOKtjMP41XbM6ZKZApV8kSc6MBI27bSvJ4WAbusAUB
	 H43hXdjxfYfftEpdPJjtZo672eBpc50fsuSH8o1S7IAD5NE9snkWvbTpUKVnIyVYqpiC+
	 K0ofiXsgo75HhUuqQfxMIPM0pZ6PFgi48iJpwVs9SphMvto8p2CUEUbkI6Smb/D0NekDO
	 uH4YKuaFVz+78uBjQNglXyvVcHu7CdOQy3TGzuHbPJ78xVLLR6TltHe9RH83H7YX/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mGWdMTr/";
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5861A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWdMTr/
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b31261e8a9so27801337b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430775; x=1795035575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
        b=mGWdMTr/KQ7vH/IPoTFIhiysUV823YvNf6fvkFuwKiQ3NxaKg+NM2zNQqD2r0027Nz
         81VzhVCLmn7sq1o0LSJblLgtWzpsC6JmY3oQcsXmgKcgqGB/UVzvSztfWS8iuVF8BvPP
         ql70x5/5kJEmEpsDM8k9rbN2s0+nFym3himOcHITtmnRwqdZ5c2AzunDMjhwBA3l32KF
         QJljzRJGj626wksqBEA38TTKHlCMNW08HYfpuZBIUq6uALPEglhet+vFgJ72LAEglKTi
         OFtA59qK8o6RukV9A87NYgx9P78wJRq3nPs5VlKvMBnQG74kf2DOKFlY6SRKtJHLFCM1
         Fvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430775; x=1795035575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IXKoQExWRBnxkHWmaBUmuF1Ur0MS6B/Iikgx16XxS4=;
        b=Ob/odq65f3t1E2WkZ5gdlj4bNPKWBuE1GnI+VotlkKnclzEAeBHAy/MvFAC2LXxw48
         /xvD+w0tFnHEcd12Nv43+gOFX0tErHTH+nDPwkwnDN/OlPRSUUEYz7fwu8aKgWUer1Tf
         lXfR6Y0RxHe7Jcam5S7uGRzew/fBKkUCf8OHpOajjZuq+N1EFxveb+yLdvDcKXFTT+5D
         IpG49eQ4H3JAJj1Qi4flobIAlJT+RrAcJLl7/LOIj3XWLux6lRIPvLYChAvqlcxjkewk
         Eoc1lxWOElz98tlmYOHJKMRwFXsfn3Wz+JAQfJVvEnRfMT6jewoFKwN1kSRAgEKj2z12
         fIJg==
X-Forwarded-Encrypted: i=1; AL+hErGev1YBr5MZGPN86UJCjpLtW9RV28RBc4dnr2So8MrsQizEHnf5G8zRD4gF3SwnCeNcvx87Nn0JTPPEfB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uIYrH5xCsSaxYIbBnKQMIDA0MGxaVatWfiEdQIfNU5KFc5Ipr
	XwXKrUGi+1gvbQHmXgvoUgNg6BZ+fHho9jn07Bo1fcYhsXXd/I29YFmK
X-Gm-Gg: AYBFou2rZCnawuVjN9uJcoXU4QHoss7KTZcu8JuvA6o5TW/oMYF3MTD9kD5MY9zeYrn
	vsQLXCOOT6K2NuFFr9OaB2ftLprNzBhQXlcZI/6EBqLuuUWrh5OJpqG8+9qpvpKyXNXhz7u/Hme
	DUzK2o/7VIL+s6X+CjWdK83oelii2VveEtLPRGmdukdwc00/8qddbxYtocSUicy6qxQjqBP6p/3
	tFAUCgtJnalWtVMfPbJklCGfz0SJz2MWUnHNZoy4/1+i2FYfl9ODrC98O2sEqdo+cT9mVFkBgyW
	V+3pP3zdbJSMxo39JfwBSLm7jxRo8aNlAJJxaNuXmRiBs4PbFIlJtTQ1pgZSEoxCzNgHlZMprqF
	2/n0Sp+LcqtqIZmOV6K4JeGNKC6LNkbq0EveC/4HTxcQacq5ZYsMQ+/2N/EuIZViOthBJgKxi3W
	WCV6eeosKj2/M4g3q6cpEqRFbT/hJkgWcEu0iWh6S4Ts4k8pJRW1fdpNhv5gp5TnjVHU61pIPmC
	w8eGPWgPAW8JO9TQNOajJCOG7AuwxVUZQd1MHU548apu3g3JbnJFRFWj1OQqEpsPnjj8yJQazZ+
	IniCT9LHYA3cvVKA1WlB0h7UcN7v2UoExyaUb8JxSw==
X-Received: by 2002:a05:690c:f14:b0:8b0:cee8:53cf with SMTP id 00721157ae682-8b3a7dba91bmr29416207b3.3.1794430775289;
        Wed, 11 Nov 2026 12:59:35 -0800 (PST)
Received: from arch.localdomain ([181.80.92.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934592e9sm52910477b3.40.2026.11.11.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:59:34 -0800 (PST)
From: Paulneja <paulnejacontacto@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: nxpwifi: bound the pairwise-cipher OUI walk to the IE length
Date: Wed, 11 Nov 2026 17:59:17 -0300
Message-ID: <20261111205917.449230-1-paulnejacontacto@gmail.com>
X-Mailer: git-send-email 2.56.0
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

nxpwifi_search_oui_in_ie() takes the pairwise cipher suite count from the
RSN or WPA element of a beacon or probe response and compares that many
4-byte suite selectors against the wanted one. The count is not checked
against the length of the element, and the beacon parser records the
element on its ID alone (the RSN case in nxpwifi_update_bss_desc_with_ie()
has no length check at all, the WPA one only requires the OUI and type).

An element which is shorter than its count claims therefore makes the
walk read up to 255 * 4 bytes past the element. The element lives in the
buffer nxpwifi_fill_new_bss_desc() kmemdup()s from the cfg80211 BSS
entry, which is exactly as long as the received elements, so an element
placed last reads past the end of the allocation. The walk runs from
nxpwifi_is_network_compatible() when a station with WPA or WPA2 enabled
connects to an HT-capable BSS, on data that the AP controls.

mwifiex, which this code was derived from, had the same walk and was
fixed by commit e667aee1c192 ("wifi: mwifiex: bound the pairwise-cipher
OUI walk to the IE length"). Do the same here: pass the number of element
bytes available at the suite list and refuse a count that does not fit.
The length stays signed so that an element too short to hold even the
fixed part is rejected rather than wrapped. In nxpwifi the vendor header
keeps the OUI type in a field of its own, so both are subtracted to get
the bytes available in the WPA element.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Paulneja <paulnejacontacto@gmail.com>
---

Notes:
    I went through this by hand before sending it: checked the bound against the
    layout of struct ie_body (the suite list starts 6 bytes in) and of struct
    ieee80211_vendor_ie (OUI and OUI type are separate fields here, which is the
    one place this differs from the mwifiex fix), compared it line by line with
    e667aee1c192, and ran the test below myself.
    
    An LLM was used to locate the bug and to draft the patch.
    
    Testing: no IW61x hardware here, so this was not run in a kernel. The three
    functions were copied verbatim into a userspace harness and run under
    AddressSanitizer with an RSN element of length 8 and a pairwise count of
    255 placed last in an exact-size buffer: heap-buffer-overflow read before
    the patch, clean after it, and a well-formed element still matches.
    scan.o builds without warnings with W=1.

 drivers/net/wireless/nxp/nxpwifi/scan.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 4eeba6700aa7..33779e21336b 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -79,12 +79,20 @@ _dbg_security_flags(int log_level, const char *func, const char *desc,
 
 /* Parse a WPA/RSN element and check whether its PTK list contains the OUI */
 static u8
-nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui)
+nxpwifi_search_oui_in_ie(struct ie_body *iebody, u8 *oui, int ie_len)
 {
+	const size_t ptk_body_offset = offsetof(struct ie_body, ptk_body);
 	u8 count;
 
+	/* ie_len is the number of element bytes available at iebody */
+	if (ie_len < 0 || (size_t)ie_len < ptk_body_offset)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	count = iebody->ptk_cnt[0];
 
+	if (ptk_body_offset + count * sizeof(iebody->ptk_body) > (size_t)ie_len)
+		return NXPWIFI_OUI_NOT_PRESENT;
+
 	/*
 	 * PTK may contain multiple OUIs; iterate through the list and compare
 	 * each one
@@ -113,10 +121,13 @@ nxpwifi_is_rsn_oui_present(struct nxpwifi_bssdescriptor *bss_desc,
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_rsn_ie) {
+		int ie_len = (int)bss_desc->bcn_rsn_ie->datalen -
+			     RSN_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)
 			 (((u8 *)bss_desc->bcn_rsn_ie->data) +
 			  RSN_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}
@@ -132,9 +143,15 @@ nxpwifi_is_wpa_oui_present(struct nxpwifi_bssdescriptor *bss_desc, u32 cipher)
 	__be32 oui = cpu_to_be32(cipher);
 
 	if (bss_desc->bcn_wpa_ie) {
+		/* data[] starts after the OUI and OUI type */
+		int ie_len = (int)bss_desc->bcn_wpa_ie->vend_hdr.len -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui) -
+			     (int)sizeof(bss_desc->bcn_wpa_ie->vend_hdr.oui_type) -
+			     WPA_GTK_OUI_OFFSET;
+
 		iebody = (struct ie_body *)((u8 *)bss_desc->bcn_wpa_ie->data +
 					    WPA_GTK_OUI_OFFSET);
-		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui);
+		ret = nxpwifi_search_oui_in_ie(iebody, (u8 *)&oui, ie_len);
 		if (ret)
 			return ret;
 	}

base-commit: cb1edd20907e13b058c0d5bd34c9d51b5bedc879
-- 
2.56.0


