Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794748205;
	b=VLf3mwrTV2/D7sQ9cUlxIIkk++t2pg6FRErdJHLifV5j1A0nBQqtVUv4f3WY6joWrxXx
	 MRE2d53TEwsx7VxqvmMG9u14aFXTznHyA0mdyJnF45qkOefMxUY0nOyQVxnJQ6WulIe1K
	 ukuoXZhF2vGbGg1fv+ISJ0vLhXNLML/ssKjIW5V2NyOezAyevS5O/mNmuHWl89hJd9Gix
	 PBgRJBO63RHJKaFarzN5bX0dovA0pxcqXy5jm2oGjB+tJR0X/O+vF9W5krACKCqsYJjH1
	 kwyUu2hQ2Uj3Sk8WFqljNoghDUyTjZK/Az9NJuvtFckQ6NqBxoFgNkYRsj7Pme1nV3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
	b=ZcVfKQsHHOuD9waN3wm7Ad6UOw3KgqVnjedJ67j8Ug002oGIJtxScITnz0tRcSlYwYnd
	 H9PFczejxtLmjrrXtp/WCDHitGrhvwMqpnooYrFcs9kXYhrRjMjNJL9BJpv3mR7aZgDRm
	 C/9hblpfR/jMTods7OhP6fDOQvzXoxbEnv7cMXlWg7Os9trVKeOfdcW00pKKG2m8C2Sv/
	 Lu1WT/j6usyQxD9jlep5AOQfSo30DJN6ktLaj7mpHMoIwh8io8MWBVJVKxzabeyyHtTMM
	 q64jsbDqP0ZTp8r9GSGgSUDmDHaB/yV/p7I7Ob0yw2l0IX/Jb4JtOy5OnjXv4pDPDtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3NNkXn7;
	arc=fail smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07973606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07973606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3NNkXn7
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so3148198e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794748204; cv=none;
        d=google.com; s=arc-20260327;
        b=hqGnV90efcar4lCNhD16DfN6ScJCdTIR1P+ZHlDoB9b3yy85iz+Gxe6YSErCMJKWiv
         b01/VnCsdp6T4d/kD2VS+D+eZAzZt73EA283ZFqqA83YGHkXlOkYPX93Sa42UjKFHirw
         ZattOynmnIFssvlLmtnnxmXPXGv/o/+jSyI9b07A88VAO4GhpZQo8MmmdqjHt6gOaWiI
         qDmI4Oa7SdbeXti8yYouc1JO+D6mP5/qZa54YDu9A8U5IAF4yZ/OQsWuIC9Zhn4HPbgs
         bfU12xz4k1V5x4sorYQW5vW8sBL8cs3pTjsg5BX3YC0iMX4bsfJYuGwtitoDIIi/4u0W
         1huQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        fh=rYxOdEtduPsh4TnohB3K2kELLyynGMm+TObu3xYfT0s=;
        b=GCrWLqkP7dwnduY537FGjxmYW8nSWqt/11sf8PDEtCBo78Jl/7Wb5f6rFsIgJu7Xah
         C17ARUY1g3g+MZKCRD/c+/4rvFFIpuLpfdACDW472d4Lq8KspSX05wFPNxJE/TxU7ZhS
         frNCXAiZIarn4B4LcTVxcxTnrcUcCs5N/8YLG7SqQ/8fXVPtqFR7n5u0BsZyfRoLktx3
         PedBnyn8X9d5EnfjUFUMg+vbVs6mOp8yo1d9JjG+fHQuUE/hdyLLSJ0ztevaB6f//s+m
         48+oX1tOMPwKtL6/z4xQ/Ntx5QZMP0YnALP78E4RyvtfaCEwiHWPyA3G0lm1YvzZK9Rk
         nfSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748204; x=1795353004; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        b=E3NNkXn7Kkk9+i4V9F1+LHx0gAzP+7aI5lToB3DkMeqpU0R5DuxoyhKQJLgywIu5Dl
         Df0+kqpXxGxnqFpfMiN3Cw4aDdKZnL8Z5GcjpLgnIEF18naQolTdZxRkkZeKSJXlV3c0
         Iv7jXdrdWP/mc85q31sblc2xhS8v9aGVUHRnPJvd7lUHIuNhMVmWNPWGxuDuEEqKb2VE
         7NwaUDpZzGo9SUCS6XrYGzL8Flo2WbHni3qFe5vAT9O7t1fNcSDG9QBZ00j4OG9X05mi
         A1/FBzDzs6td7a+PgimezQyLXPXM5wne+L366jhEbQsOWUTIla6UpL/vWfEkDEZMsdiS
         SsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748204; x=1795353004;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1NInRpWewM21xnm9EH4eimZBPH/P0aEOMo3UtLkqsvc=;
        b=ml5yrDIRIrwBueCjB6zrI6H/2Zp1nNfY0OZUL8FdjG+IqfOU6rcZdzIYdCmnGAWoUI
         aVFYyW+Rmm9Vdfy8Rt0wx9qq3OxgTK0TlabueXza9BuTgpmaU2eI/N1zfWZVRyAjAWhV
         KW4Zmjrzq9T8KoDkoW0/0HXM9AulHahpEWjNlYNlyAb2qJdTZy/Mnp6KDv8VtMl10gFU
         OvF0ov5iCL2WKzxtxAUm9J0cwT/kjomqH142b2zKTc6Ja3rYM0mRYjyCewsinjJWHyHq
         l5BvxxSwmW4TWQu2+FjjY1R6yj7zIrNj5RkzEF//tio+WZujD4jWrOyMZbWSwOkuDATG
         ArQA==
X-Forwarded-Encrypted: i=1; AL+hErFB9cK9eRZVZEUIPlIlkI7IBuF2+hhZwyDi4errAPxIR4HwaFFUwr6iY6AiNMdxlg95kpMUYcecMJxSKcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hUHxpbeDAORW7Ft3xadDFywE1olQjNYielzn1RmPewbEd6HUB
	371kdJ7YDD53FJO2+8cW9sbdGYqsEmhBZRHG9QwGzGgFWhhDxYAYTNY0FWSIf1Yy91ItKsPewS2
	z8m2RY/8RWDtnEw9mHRItjcYb/1Efe+k=
X-Gm-Gg: AYBFou31Oy8F3I/ZS7/l9KO4C46f28qZeRXYRbupzANMezyozworpGyMmi4q0rtpUm7
	FgS6+xsPEGfWFlpzy35VkP26x5X9dcZTeyN47l2HduGlZlXBeKF859IaATOqMIsMgQkwnd0LrcL
	cHESzTa0sui/pFbCTc621eCr7+qbsMcuvdQG9Jdir+IHh63eKP2rQceDHjEMcHlqVWD4RtFAeLe
	am13zw7bmKSsYan040ZS9T87IKUmV5zxeEdmCBxGLZGacaWTKK9HPrhQ2tdTaX8ObAm1eXzI74a
	9fPiX4lCFDmKiJcfPTd9MEh69YPX0Z+UrFrJHM+dSWOItxRbl7ebaIr+IWz59Btz6fMEv0BX+3A
	culOBnvD4/ttWUApfImPGT/jMDwSPTd5E3aWB
X-Received: by 2002:a05:6122:1b8d:b0:5ca:856d:cf80 with SMTP id
 71dfb90a1353d-5ee34a7e643mr3049835e0c.11.1794748203388; Sun, 15 Nov 2026
 05:10:03 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 05:10:02 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 07:09:20 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
Date: Sun, 15 Nov 2026 05:10:02 -0800
X-Gm-Features: AclHuK92OLe_ppBLr7loZS976QSMB3kkhkT0NjtubDh_jhqXCnkEGQD3vj8y5-w
Message-ID: <CACHPgzwtaykrULWEDNuWU0ZacnNf4s4uSsiYmxE_vJhS4jO0GA@mail.gmail.com>
Subject: [PATCH wireless] wifi: mac80211: parse wrapper TPE elements without
 an extension offset
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit d160663ca2fa ("wifi: mac80211: fix TPE in channel switch wrapper
parsing") replaced cfg80211_find_ext_elem() with for_each_element_id() for
Transmit Power Envelope elements inside a Channel Switch Wrapper, but kept
the offset that skipped the Extension ID. The parser now drops the first
byte of each element and misreads the rest.

ieee80211_parse_tpe() takes a u8 length, so for a zero-length element
0 - 1 wraps around to 255 and the parser reads past the element. Received
beacons are parsed this way when the BSS table is updated, with or without
a connection, so a frame sent over the air can trigger it.

Pass the element body and length unchanged, as for a top-level Transmit
Power Envelope element.

AI assistance was used.

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch
wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Tested the in-tree parser with a ten-case KUnit extension under KASAN,
applied identically to the base and fixed kernels. The base fails three
decoding cases and reports a slab-out-of-bounds read for a zero-length
nested TPE. All ten cases pass with the fix, without KASAN reports;
the existing TPE suite also passes on both kernels.

Compile-tested with no new W=1 GCC/Clang, sparse or smatch warnings.

 net/mac80211/parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/parse.c b/net/mac80211/parse.c
index f3c5a9f6ec7c..7564d655919f 100644
--- a/net/mac80211/parse.c
+++ b/net/mac80211/parse.c
@@ -698,8 +698,8 @@ _ieee802_11_parse_elems_full(struct
ieee80211_elems_parse_params *params,
 			for_each_element_id(subelem, WLAN_EID_TX_POWER_ENVELOPE,
 					    pos, elen)
 				ieee80211_parse_tpe(&elems->csa_tpe,
-						    subelem->data + 1,
-						    subelem->datalen - 1);
+						    subelem->data,
+						    subelem->datalen);
 			break;
 		case WLAN_EID_COUNTRY:
 			elems->country_elem = pos;

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0
