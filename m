Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876297;
	b=rhzq/gfd+wZXaEPman+BDgWYEJ/132Bf3LaCE5FGHuJYL/cUh/9Bl2Dxrti8LyHK3bjL
	 koqRnKbfa6S/AbXl1Hz2O5yZzUjgrgifGppBb71cGVW6jZgS7Yz7/ddfXtB90x8t5fOAC
	 qGqDqTwQLi6JceKpAzi+GEE6ggcHxOk0fo7yXsfUHvMYYmMiYaEvGzOQYD6s19JaG0OJe
	 42wMv9G52OEFsFiAuLbMJWdw5gII4uKM7+qEXs+WqMLYSyY06KNnWcgIx08tiIfeHE8Hz
	 Cqr2YjwSylICTGFIQ2xbXt8wPT7OHtB2EbYub5Q0zVaMn8pfaOdTX7FUkETllEil0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
	b=XYq+MWhNpAD/Qhwa6BovT6ereqItN59WNdGj6uO585Ykz0AdFn3mvjjvLUyeyfX0iVUe
	 YT7aKGsA6ZZpeGrDjgnAYlFNSvHMfY5jaxFB3wekX8SHp+9MzDD/HlfsqlsdMS3RHiSF+
	 AXbrZCHEfLtnZI3E1YxeJzOFxXLO2WJlz619HYDKTia4ptmyIcajbSpjPQ7RWQc3L5kUI
	 4hfNynAwDIINbLaJnHcUer0/3OJRti2Qk7bh76MI6bwucyZa5aS9m0dNbC1rynFOS61o7
	 0B+7hwa6TPd+A8bzJ6O/aY2WEqBrCyMpjTMI23qo6Awf2x4VBZ0iJtMIeh93TCTmQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K71ocXZ/";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFA606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBFA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K71ocXZ/
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so892843a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876296; x=1794481096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=K71ocXZ/HS49uXPUvftmHhF6iKBXr20U2JrbygokCE2ws0bmPHGf31dFDsS4e7vYBc
         kSuozUaxk9asDfi4t2/Ux/IkhEG8uqRsxrbJly3oQTEWxu3Nsq1+tKv2FJO2Wk0lURai
         bFuhYa4q7U1qi+zB3Oj+st3oMFSydBcfOv1QFkO/wb6Fx0IyndGwbtQNTlQYqhILV/qh
         EqjP6HeieKytlaUU2OmmHKBfeuKEFg3LjpvkGiXYTaFdrgdao9hygCU9DVztjYRvk2LP
         rFbb7HrHCcnOUFlZC53KkxG6+2jt2tGFAkzvXdABUjmdvkPgsnnvf9/lrvsW2F79q+Pi
         vsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876296; x=1794481096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=Uc0uRSKC/6ITY5YjiXq2tEMkfM1nb91yacqFlrW+07QABnNQFXzrRtesr1tZqoIKhp
         4ixrgzCCg50EP+6g6mieraj+NpHVqqp4MFlKH9yBzQHj7bwyQ/qkXjWDS/uiBAQ2rDnA
         RfKdrK74eOrgQUPjKegBiaeI131wqt7vCoNfyh0I0apb+IJFPz+7ZlFXfaSgr36vGFZ/
         B4cYLMK2OuelPoBCWjeHAFSSBD653oWnXcB+ZTNS4G9lruyTECUmf+2eBka3Y9bpFx0c
         /8OFYang99JDdUaPMfCJQooACH6QZbivuGlXN4tzJBb8PWG0gq7F0ZOT1wIgUdjECwAB
         KSUw==
X-Forwarded-Encrypted: i=1; AKwUvBywyDnLxtRzZqxWt9ChVD8dyagvdpApbKNsQds/2z9Ck8xq2hTihNKGAado9L42bEksIpEbOJeajMzRPfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z95I5wt3CWu/33l3pJUccIHJbmV74rnF4iIlOg16ppowVRiEpv6
	YcIh2A9kQmuymPdera73PlJOHLnXazMwytchIIq07IgRPON/Mo+/jg+s
X-Gm-Gg: AYBFou0kG6irmnIafn/0ERGEGr2QR13jxoTOnLWNBfkW0rCeO17XePA1Iwj9uorxTJL
	tqClzaUnANm6CSu1ep64YPcM87oncQ/jUSoqUMmZ1YrqhFF5IFoqlbIsFnRrbYAtdUGBld0mvEq
	8rW3d4xnkHdSpFP3O8U5VZLq9eU8uLx4w8wpUecNQYx80UFn0aMmL8pqR8nqHJH4C3WZO06en4X
	JXzTPln4vrvuVLzzCov/Z9hXvl/QD1UUtBtkxHoF3unwnq+4aN0lryikKj7Wu40SyjL5otv26RF
	q9HXjYkgTG3DTHpI8Q+IgBgM89B/yYmNzVFmhF1pBon9J95WSsPcSWzxyH9iHaAX6lrBe7nEv2z
	dAf+fg09pc4coHWWRpB0xoBnFMIE6q68Ej2ed+YQG0tn0WGk06GDQ31UfhH2n7NIV18Icmwi/4b
	97UGUGP5zO2TzR5Lr6ofYKI5wWNApgLLBTl/6Y//0c5dTnSqzM/t7xAQ7voI4haaaFcQ1YMPmEP
	BJ5NBAOjjusIQpPz0wJJYBNzDyf0XTcbPaYB2ukpwItXngG481OG4EDh5j4mt8YlqdJ8SoT7+mM
	MUl8Qxe6QC/Rw4too0X60atypB7UzNLLwDUT8SIh+9ZJFpza
X-Received: by 2002:a17:90b:518b:b0:3ac:ea3b:f28b with SMTP id 98e67ed59e1d1-3ae897b6653mr14961496a91.24.1793876296249;
        Thu, 05 Nov 2026 02:58:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm3777513a91.16.2026.11.05.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:58:15 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: pn533: validate response length before parsing DEP ATR_RES
Date: Thu,  5 Nov 2026 19:58:05 +0900
Message-ID: <20261105105805.1450120-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

pn533_poll_dep_complete() and pn533_in_dep_link_up_complete() cast
resp->data to a struct pn533_cmd_jump_dep_response and read its fixed
17-byte header (status, tg, nfcid3t[10], didt, bst, brt, to, ppt)
without first checking that resp->len covers that header.

On a short or truncated response the handlers read bytes beyond the
received frame:

  - rsp->status is dereferenced with no minimum-length check;
  - for a success status, memcpy(nfc_target.nfcid1, rsp->nfcid3t, 10)
    copies 10 bytes from offset 2, so for resp->len < 12 it reads past
    the valid response data. Those bytes are then handed to userspace
    via nfc_targets_found() (netlink), which can disclose stale buffer
    contents.

target_gt_len = resp->len - 17 additionally underflows (it is u8) when
resp->len < 17. That path is mitigated downstream --
nfc_set_remote_general_bytes() -> nfc_llcp_set_remote_gb() rejects the
resulting out-of-range length -- so the subtraction does not by itself
over-read rsp->gt[]; the fixed-field reads above are unguarded
regardless.

A valid ATR_RES always carries the full 17-byte fixed header (the
general bytes, if present, start at offset 17), so reject any response
shorter than sizeof(*rsp) before parsing it. pn533_rf_complete()-style
handlers in this file already length-check resp->len before use (e.g.
the ATR_REQ_GB_OFFSET check in pn533_init_target_complete()).

Found by code review; not reproduced.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1309,7 +1309,12 @@ static int pn533_poll_dep_complete(struct pn533 *dev, void *arg,
 	memset(&nfc_target, 0, sizeof(struct nfc_target));

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		/* Not target found, turn radio off */
@@ -1929,7 +1929,12 @@ static int pn533_in_dep_link_up_complete(struct pn533 *dev, void *arg,
 	}

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		nfc_err(dev->dev,
