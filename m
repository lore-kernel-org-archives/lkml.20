Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05A39023C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853806; cv=none; b=Ty+UC+2d0gby73aOkmkqGKUw2hgOLmieZI/8KfzUn7TgngORDBkBiesKTcMw+enBtwO9GZUtuzEBjMdEKHYKgEiNB3XTs6cW7nkj2IowA05uOTp180T623cr9hKT0agogixUFeOPuFh7t8SdKzaSm03uPvKKLr4xg+MUiZ1Qj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853806; c=relaxed/simple;
	bh=ylIbZgKsiNrIwpSIWxBnwwtC6dQOGngNLUyTzMPDsPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rdWYHHCERJDMrhYcKcKvQ3GT8hKLHFCjmvsOKiJtVNU3lScv7PucIxNEqn/lql4pv0d3ny3WY6vNSaVPPkADjIZ41NOhtO6iYJhzc5JDlKLElW9JWtMSuQ4WKaWdCaVnQStnzZAmALY0oDZ7sutO9c2MoxSEBo+OPf08MDQ5uD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh22EdDh; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh22EdDh"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so1176341a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853800; x=1790458600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2j7v0Gfm1mzC7ZOfmDBTrSr3Zc/OVo6Hpw1JferQnEU=;
        b=Dh22EdDh0UblCqQrVFJlrRnXe5i3GujtQ01GJbijTagJjmQ3fqGBdV1OaZVOVm9F79
         G0y8fV5JAtFcMpMQZrfEZWpNBbo5uLc+TtfVc7HO/T58uesahn5csB7+fYqAEtuoPIoG
         aaP49+NasMI0vXt5w/Obmcq/YjRllQ2xvjNPs38TcwRy0R1F65ogE2jKbJqQ0GPMXr6C
         v8E0daC1woNDY9Ql71lgn8LYFsewPRruf7KoFZ3599qgMGlqHtjvv/0GtrHFlso5Jmow
         VbA4aa4rSsE1kETBZzCSaGJ+m3JZUwid3e/qRDgHF4w9ipC7pV4IL8AJq3vTad4V+gO8
         iTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853800; x=1790458600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j7v0Gfm1mzC7ZOfmDBTrSr3Zc/OVo6Hpw1JferQnEU=;
        b=dFkIR6T9Pg3xxLR+ELqCLjaVxEEPEOLAgitZC+wsYfu7Yw9YQl7DshBzPbCWsuATYk
         AemLWCSVTfHtKeFqhbCNBUe1oZGjqRipvcVoSkxkXWPWeDL+a7hNpwjAmCwupd1gCVxv
         FRIFb82ZOGGOzOdPrZ7Mzdx+X7Et0x+vwPEocWC6g9aRKIIEQFWYIXzbCbipw+Cs9H5N
         +OeIC0W7xmgD6GUtxoChhzqZ/8L/uXHXuWAfmcoDzX6yp6kYRxVOL6kdujvWtg4rUrPp
         T/z0OEUzwQKPOmKNV3CmVYpK9/GkCNF5tQvYmdbD8IDnoPRZ/H/8r+MnYZ4asbHTccDm
         TVnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF/D8aN/3UEGgDqSgnj4+VVVL2GAZEYg5x1NOUDxuO3NCl2mN7vUAC0yHnfSA+1vsD6DuFbi5o2ndRlbo=@vger.kernel.org
X-Gm-Message-State: AFuF++kEIlEkgITNKWSYZvpzwrSj3Cau4nNlK0w2yY5q7scvWF2VF+v4
	9UkYY0+wAe5qyTSqlks6laZW2XkJeQZrj8itOLzMInzryeI0KbyuBjd5
X-Gm-Gg: AYBFou13AV0iZBBNoWpPe4wRG5uTvir08WFgELiM8lf1Dll8Ya99v2LAyT81gMAv3VE
	KMjQAwWnJHilwB/qYB02A223sIoHEtXLpZNA2uNIlfYRrq+2e5CT/IKxAkfF33VHllTrwePk7CE
	CU8xweiWT9GpxnlLtKxs3EjDzO247Q+8N+cyYvYoIQHL/BNJ72TiYF2LZ21vbTDAZ/oOkAjmKn/
	KpKpO7+QuPJXSO1y/788leVQ8xUwJMw2wWx+58oqJ89MW/70EzuARlDbtjBXGlu7/x72GacPHpF
	5n+bIlBVEWLVOvZu6Ow0CpjTd9I/Wm/DBJCKw6Xpl9vMlPSn7+82+s4czKYcBMBY9bPfAx+Cv3V
	yEZMaBzqZEBCfY0V60jf50DhICB09ON1rVfXs7DqVrtAcCmRRmwy8RzbGlR+roExa0D7CcbmulC
	JP3Ksg+sHiRR5bNAYDuMkoWC94B0dahQBcgdLiWOFxXj/2S5MB7GojvhMzfwlIJNcQp/GmJLyZz
	Np6xUMFIOUQTWIMvrJ1Fbgiiw+PnxIyVAQaUkEt0ADHHOlji9XQJnfEz5WaXySMu0qqWRQUwCod
	Wk/CgRqd5jzO7HCrqv6d
X-Received: by 2002:a17:90b:4cce:b0:3a0:2646:7495 with SMTP id 98e67ed59e1d1-3a026467c7cmr2912646a91.53.1789853800393;
        Sat, 19 Sep 2026 14:36:40 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a038fffaa8sm59595a91.1.2026.09.19.14.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:39 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: ms@dev.tdt.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-x25@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: lapb: fix uninitialized stack frame fields in lapb_decode()
Date: Sat, 19 Sep 2026 21:36:39 +0000
Message-ID: <20260919213639.3314894-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`lapb_decode()` populates a caller-allocated `struct lapb_frame frame`
on the stack of `lapb_data_input()`, but does not zero-initialize
`*frame`.

1. When `skb->data[0]` is not a valid LAPB address byte (`LAPB_ADDR_A`,
   `LAPB_ADDR_B`, `LAPB_ADDR_C`, or `LAPB_ADDR_D`), `frame->cr` is left
   uninitialized on the stack while `lapb_decode()` continues parsing
   and copies `frame->cr` into `lapb->frmr_data.cr` via
   `lapb_transmit_frmr()`, leaking 1 bit of kernel stack memory over the
   network.
2. When decoding an unnumbered (`LAPB_U`) or illegal frame in
   `LAPB_EXTENDED` mode, `frame->control[1]` is left uninitialized on
   the stack and copied into the outgoing `FRMR` frame by
   `lapb_transmit_frmr()`.

Zero-initialize `*frame` at the start of `lapb_decode()` and return `-1`
when `skb->data[0]` is not a valid LAPB address byte.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/lapb/lapb_subr.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/lapb/lapb_subr.c b/net/lapb/lapb_subr.c
index 592a22d86a97..8150f3583f15 100644
--- a/net/lapb/lapb_subr.c
+++ b/net/lapb/lapb_subr.c
@@ -106,6 +106,7 @@ int lapb_validate_nr(struct lapb_cb *lapb, unsigned short nr)
 int lapb_decode(struct lapb_cb *lapb, struct sk_buff *skb,
 		struct lapb_frame *frame)
 {
+	memset(frame, 0, sizeof(*frame));
 	frame->type = LAPB_ILLEGAL;
 
 	lapb_dbg(2, "(%p) S%d RX %3ph\n", lapb->dev, lapb->state, skb->data);
@@ -120,25 +121,33 @@ int lapb_decode(struct lapb_cb *lapb, struct sk_buff *skb,
 		if (lapb->mode & LAPB_DCE) {
 			if (skb->data[0] == LAPB_ADDR_D)
 				frame->cr = LAPB_COMMAND;
-			if (skb->data[0] == LAPB_ADDR_C)
+			else if (skb->data[0] == LAPB_ADDR_C)
 				frame->cr = LAPB_RESPONSE;
+			else
+				return -1;
 		} else {
 			if (skb->data[0] == LAPB_ADDR_C)
 				frame->cr = LAPB_COMMAND;
-			if (skb->data[0] == LAPB_ADDR_D)
+			else if (skb->data[0] == LAPB_ADDR_D)
 				frame->cr = LAPB_RESPONSE;
+			else
+				return -1;
 		}
 	} else {
 		if (lapb->mode & LAPB_DCE) {
 			if (skb->data[0] == LAPB_ADDR_B)
 				frame->cr = LAPB_COMMAND;
-			if (skb->data[0] == LAPB_ADDR_A)
+			else if (skb->data[0] == LAPB_ADDR_A)
 				frame->cr = LAPB_RESPONSE;
+			else
+				return -1;
 		} else {
 			if (skb->data[0] == LAPB_ADDR_A)
 				frame->cr = LAPB_COMMAND;
-			if (skb->data[0] == LAPB_ADDR_B)
+			else if (skb->data[0] == LAPB_ADDR_B)
 				frame->cr = LAPB_RESPONSE;
+			else
+				return -1;
 		}
 	}
 
-- 
2.55.0.1082.g2b9226bbc0-goog

