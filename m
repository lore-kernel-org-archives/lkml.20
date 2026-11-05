Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906988;
	b=GyO4+ELyVU9OldiaXyHgG9iasRC6VIYhGTJo69Lde9w0M8bCDPvr3SNIMh26ThVVMUwq
	 BMMsR8ZXDG4SKKPtmNiOUZZ6R2+gee1XHQfxQHJ5/OmKluLc5Kax0sCyVIEbYTi/LCBD6
	 uZLsXDOS6nnoshGxzy0TSDO5f1XbyoDpHC2hCp2GzE63McouLsq8CyOk+L+mOdqH1ioX8
	 SWt1Tz1iBp0G+zDibIIHNwZH5mNJUw165RMrMXgTL359woZ6k9qzIvw62HoYtHNKydBvX
	 Pi1l3e5xuNsS1W3rAibXKecbUSuMJxleel19H7KFzGjZktERonvdyi+dS81nNhytfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=;
	b=a5EtG8aBEjcmXEdjhzoq7KgRjmmDSesbDufVS37tQ1HoGr09csP1RwanK3bu8Kje+NDU
	 At4a9QhgnegCm8AbY1OAFTTj2cJOqEfSQwtE/aehxBmQD+YQbCtWlCeXt5/S6i5CDv95n
	 gYX8jGNuwl95cibdVdkzr2jxIrpr1I2W6vbc0y9D5oHnt8akoBuBAZVwnGaVBaliu5d7M
	 SBXA9iW9qaeM89owCkRP1WOtQFVHQvEDOV3F7PJUZRF8mmBN2wVelARQ505fGZn0eN8B/
	 oU66zq07GL5aEYdKbNBHVAdnzPqybS/eTmGbIauTJ/gzOxDTIZTP99kC3G/zGA8ru9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdlukDOn;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A560A2629
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60A560A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdlukDOn
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ddef424972so1879961eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906987; x=1794511787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=;
        b=MdlukDOntbIKlM4YGZspDKjoX4NaFL03zXlJgKRkyGVeUXb91kAedaDTuG8nouCzSM
         +71KaiZ8MSmlPYQmlGwXXcLCIz6rzp5ks4n83WHANvBV0Gm7GyAVD8Z4Vj3EhUnnHyKw
         KI+M06xh1vUXrWOlzxbYhGGuiqhpcruUSh231AKU849/zlIzVKsRclbumASNkMO/D35M
         nI9f+yeaxCsslMaJMUf73KFKa2EWYH7/hQ5Gi0bzcdkTxiOJJtS6yjioQB1jF8nLhhcD
         AOrqqdGO4hkvdfjlBxVjrchBweDUYTrikic/QYbPb2n7bVDb6vXUeAWopZ6J9qYJC4UP
         3AvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906987; x=1794511787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=;
        b=BUOFyrZztB6edjYDgHAMbK6Eb58iEFPaZ2NLR2RmYUj/t69q2nMtDTmtONKTQoRp8x
         50HiUB6nV4RPR40zoeBqKR+mg/8D2Auf/Vh+XT/iHqMfLgh9gu99PiPEXMqtqiu9hpxW
         uqjrzOrrYZLvy5fj7tcaoDEhj6P632RTV2q4T67Jgwz9WX2XLJLwGTp7rpmWShDEWDHM
         za+B0p5TfjHgrsnkgVsbtmbDDg6YmWA29m5u10QNpVSUE1pLcZ5SH7d51CJmsvEfoLea
         nJ9H+41/SWm1/xZfe+5r5o0LbwvTXGDuwJiirTX610ekk1zIXeOu27yVdUD8kybSFXMH
         MvZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE9L5VaGDW32CLHoFFnW2iEJQQ6kgFfAo6uDJjwnvTj4JWrFkywhXzJm+DIyTrcEfy8YWxKVg3jGgRSHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+d48dXNgdVE8NFPxZN6SirwHbV3YNckr3KH1KsatoQXFHDH2V
	R0SymwdYF+HRxXsiyfuwlhp9T7frpnQXNbAdJb9wRKNMs/cw1mSG7AqS
X-Gm-Gg: AYBFou1SCkv6LkliegmoeUaq1PVheObpLPD8a2TpAQbeVGFVnpjwlOe//6RDm0PXOYy
	3+QC6XokrqOTg80K08gVyJbiPi3NYzDwDaIlmwIR4nuyHhZyNpsaPb3Wut0IyRpcSkwbKbmSrEY
	+vdKyxKg3woYjC/tj7ONu9nSTku0zCGnAO/cI0QY9uUbIbEpTOT7AoHEckCJY+pnd7W1jx1611a
	LUt0TOsXunz9p06vDfTBm06Plco5Ewvqjo/MWSltuKvxtSRtvrMaGJ8FjjW2ovaGvBOBZIM97lT
	VCFRFmCqQjs71asXivuQsv1FYfgX5I38nNkSRgl1C/Ys7KfmUX8zOzVNw/o7nFulgolXNGHYL8g
	yxpu50uuIXHVBNExDdovrO1eEHkiLWAQZZ0goEw4racwStHomJcVmQRJPuEVFESFvQbwU2WC6MD
	m7OAzPLWWQL8nV7Z5/teKrmrzjfGmfFwz2V9vSRxp7oKv/IaBJ7m9eVc24REbYWuUM15FBjUynl
	memqKTBF3lTxSthTHWCyuAyA6aI9WaLwLjdCqyFigs/dzwGCBlfK3L5hZsWNBvRZv/xz19Yl3SM
	XUnHuphKmjBkvrroIl6vu/haPRtqzsWsAItTDXyuXgiBRX6XpcLV8QFbJqqzyUu0LA4nbgmgwDW
	v2WoIgAmnCHgGtWumgE8ax9g1jri7/TCX7k2DDlPrP7lulTyUHL5OkqQRtiJnvXeH3DluhU4yAD
	iDvlIAtAtMi4cVmc6mV6KXmDQ04hUG3PbrTY4kfqnOBIvCl/qz2F9i
X-Received: by 2002:a05:6820:16a8:b0:716:e855:4ff4 with SMTP id 006d021491bc7-716e8555060mr340379eaf.55.1793906986644;
        Thu, 05 Nov 2026 11:29:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm177463eaf.0.2026.11.05.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:29:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 12:29:40 -0700
Subject: [PATCH v2] mtd: core: reject OOB transfers with no complete page
 remaining
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
Message-Id: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RjaIFFX3sOwaKctjLGUtJVoC
 He34AFM/uYl//2/QLKRbYJrtUC0MycOYwF5qIAGNfYW2RQGWctWiLrB9NKeM/psMASNdjQ4C3S
 NodZpR44UFHeK1vF73713Py7iw1LexrbGwCmH+NmPZ7H1/n2UCDyRPitzkYJ0feu94ueRgoduX
 dcv0rCWA8wAAAA=
X-Change-ID: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_check_oob_ops() permits offs == mtd->size when the data length is
zero. For an OOB-only request with a nonzero ooboffs, maxooblen then
underflows because there are no pages remaining. The wrapped value lets
the request pass the OOB length check.

The OOB ioctls can reach this case by encoding the OOB offset in the low
bits of start. On a partition ending before its master device, the
subsequent address translation allows the request to read or write OOB
in the page immediately following the partition.

The same underflow is possible before the device end on a read-only
partition whose size is not a multiple of writesize. An offset in its
trailing partial page has the same page index as mtd->size, so the
remaining-page count is zero even though offs < mtd->size.

Reject nonempty OOB requests whose starting page is at or beyond the
number of complete pages in the MTD device, before subtracting ooboffs
from the remaining OOB capacity. This covers both exact EOF and trailing
partial pages while preserving data-only and empty-request validation.

Fixes: d82c36821684 ("mtd: Fix mtd_check_oob_ops()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-197995@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Compare page indices to reject OOB requests in a trailing partial page
  as well as at EOF, addressing Sashiko's review.
- Link to v1: https://patch.msgid.link/20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com
---
 drivers/mtd/mtdcore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..34ab30df03a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1676,6 +1676,10 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (ops->ooblen) {
 		size_t maxooblen;
 
+		if (mtd_div_by_ws(offs, mtd) >=
+		    mtd_div_by_ws(mtd->size, mtd))
+			return -EINVAL;
+
 		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
 			return -EINVAL;
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

