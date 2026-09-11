Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196236194E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137242; cv=pass; b=uDNMGxHenFu9UOy3br0+MQ8ZByMiHIAvKxkUNGx5WAuYubiwD/tlbPV40oF+Ta6tYYWCHvC5IteFN2SLn5p/Bcl3FfH4Q9hrUqGYGnjlInyp07zZzalgVYYq18GVoYL1PY6KZQqSyr7GSAsSDWxv57UyfLhaW0BJQ+lrgGzXTwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137242; c=relaxed/simple;
	bh=Lq85WXNE3B6YdVcdVzLIUHNyP68RoDDuzGsNkOKe6D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ok8oU3CERhCjBUYQ70RqEHxcNOIWFlz2sM7br5v5Fwch4hoSpPYC5B/pEh7xqNnQxl3T4MkjxjbkWk+q4QUXLGBSfubKJ2dcwMiB60VTOd9owGpovcgDYlE3P/9rVy/tD9yJWo+jeuJ2afJY8/HuxQ9PQ9B+v3anxvtDThUg1Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjHv0euU; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjHv0euU"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcdso7585797b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137239; cv=none;
        d=google.com; s=arc-20260327;
        b=BrBulyES3R4+tIqmxu1KhmkCpi6iVrDfAptJh2PureRT3PG7SPTfI+9T88naFoJWpG
         X60o1vSIIVV4WVXhxk1RSmyvbpENW7npJGdx7ZEhs+ZuAKYa7fFOjimboMWXJrru9QVc
         rJsuL13Ccjt/rN5vy4wo9ipPjnYXSLm3pZQbWNnqyGs231sWmRRoqBoe+DNoHwiMWZSw
         hz7Sk8iWrnk+tnpUOeTNQrSo1A8aEcZtlhVHD2xAYwoBn91GSBlFwtDlf2y+jAaGuqb8
         eYaqAoan90t8dKU7aHj/Vzu5UFDc++w+IPLmIYf2o+JGGFOOWI5TkckD0kX7MdJlbJVY
         KVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        fh=VB2yFHNBANU4XUunYaq+Ucq1D3WVoCYjiJRpKXdEmpA=;
        b=LmR8kVjKfTKnTSYXw7HylX5EIrecJWcsbtlkso93WSmoE0YfP85/LQY92rjD0Xz6BV
         j0taIywG/FsiHsya8DMr40157/d0WaMcxZAeIaF0Y+Aho9yRl0a0EKmUAgts6LesXsmz
         /WQEQNDpPZ7MHobAJ3gmQdnLqds+1HOZfMNO3uZoK0uq0+KLXwuXzSBszJtLq9jv8p+Q
         hp8E7R5t3hCtfpDCBJdPakkTozGroT5bDKirT1Oik+HNEeaiTXEMMmfnCs+HU0/8gv4z
         iQxP4crdl0MeNigZHvKO8ZTsd6+EgZqINZtHomaVSfqWAx1F52RvRfkpnP1QtruORhVw
         az6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137239; x=1789742039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        b=rjHv0euU+pcmVHL+V6UqxQi2WYPJD2pJH9lQxY/FIHlQEswSsGWtgrV3ByyD+1Amuk
         WWkk1D4K9W8bLOVknbefu6dMM01T5UhKvepV5WK7gGHazGPqfVkD2706uFn0ccRijPK3
         sJzn6JReReo19mM4kwu0d4/2IjVsNHn1JDZi6jYWzHRdcBgm4+frWyDJhm8joLmOQWjD
         4MnozQab1ROzb1rn558JXRMeP/kDdPIVOLhlgQ8P6QPSUe+42zeJkN5m7G1RPi/y1IL3
         n8kGFGMdpZlia+AD1FpH1dcYGfdBW2bk2IYPJdlYBNQpHdsRatd9MacjS/t+f6mwijLC
         c4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137239; x=1789742039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=253PUwIF2lUbExbnq4pn03NFxabLUx1bSqL243QpTlU=;
        b=ama3iMMEGmSNsXhjvY4V15EgXT6PZT/8WEvv+GbTY9L3j6vqEMK9zfc2RVytrYuwb2
         FghM2QRy/IEyFj0CKxxPo4NvlskYadJMIyLrHGYTzUskrqR07Dqsz9CqVAco+EfYHoK9
         ddKkMDeGJIsPxPMiLhPqF7XJ6vwe+RUuaLnJq3GUrcPPdtlxtWYnTNRNvQLZ6ll2Oi+Z
         uv61Ocbn5OXaWBJNeJHtl2ZDQi9FaD4iGT6nTYLzh2DhDWI5+iuX9Z+O8xYw2a5PqH+O
         nD7F9ked6zqmt91mvjAEbolQFQiLUFYuH6iFACudirSH4i3thIhA0Wf1JhIf3CCm4nP/
         rE1A==
X-Forwarded-Encrypted: i=1; AKwUvBy/UdEI9GWIXqy9F8snAm7ZFg0f7ExgRQv+VUQOiIDaOjv/fXOyn5U37/L4S9O7CV8okojHg0e+/4AKRbs=@vger.kernel.org
X-Gm-Message-State: AFuF++kTMQHVnboO1R0lHzkCNfnRDb0jlCObHipMPf37BLPmVX0Y1hwB
	A2TbZsE1rVZg+cclPvs6niFQN1Two0R5Jo+/ir2r2O6kHkrcGMCyOZlYLSVchPygZZoo7id1HFJ
	kLJliMHp8BEFpAKoa8lBeUIa2P4/r2hY=
X-Gm-Gg: AYBFou33VW/16tDZTCCaLKkZ0I6c4jPeWIsop48sM0Uwt2upb68lZCq2/IPExZAZSco
	R/P0+4s9JbX3/50qfblF/9e/QNVIYRguJ2OXr3vZIm3SbcgYX7VFF2HZ/TQGLG74YjRHLC3IVHy
	j3yCsQ0+CM/ZDonqRsKt+FSWoimKU9GRt9jYSEDi5k5w8vajzj+Np3d88wqnRC0sqFRGPNR0CuY
	WI77Zn+QlV1JHxlJfngW2GFeBUGGeKrafk7KGdn5EoAgirJv/iaOHmw1kcmuTe0VBJURIX96ylo
	qvvfF12SkodpxgUqszsJU+MOpvlDmxPsDrW+KrdbArBx1DbAJp0Tt8k0UslgdhTyF6gWDQgddd7
	yllqLWoPOETpjWTesyG4LpockBRokNTiBTpcUNcs=
X-Received: by 2002:a05:690c:d94:b0:854:27c3:5cd8 with SMTP id
 00721157ae682-884b387a6ecmr19566477b3.27.1789137239315; Fri, 11 Sep 2026
 07:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911104234.2276126-1-chris.lu@mediatek.com>
In-Reply-To: <20260911104234.2276126-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Sep 2026 10:33:48 -0400
X-Gm-Features: AcwNN1VOio-kJ1e73tLJ7cg4_i84qUwIWDri4lPL6COQQRrdpvIJBVG3J4WPA50
Message-ID: <CABBYNZ+SD=KAyMwGf_cBZARONqXhjTg2O-r5FHTqUyMrsprZMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bluetooth: btmtk: firmware debug event routing and
 WMT FUNC_CTRL status fixes
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Fri, Sep 11, 2026 at 6:42=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> This series bundles three independent MediaTek Bluetooth driver fixes:
>
> Patch 1 is a resend of a fix submitted on 25 Aug 2026
> ("Bluetooth: btmtk: Route firmware debug event to the diag channel")
> that received no review feedback. There are no code changes since
> that submission; resending it alongside the two related fixes below.
>
> Patches 2-3 fix how btmtk_usb_hci_wmt_sync() (and its btmtksdio.c /
> btmtkuart.c counterparts) interpret a WMT FUNC_CTRL event that carries
> only the WMT header and no trailing 2-byte status word. Such an event
> is a normal firmware ack for a plain enable/disable request, with the
> result carried in the header's own flag byte, not a failure as the
> current code assumes:
>
>   - Patch 2 fixes this for btmtk.c, where a bounds check already
>     existed (added by e3ac0d9f1a20) but defaulted to the wrong
>     result.
>   - Patch 3 applies the same fix to btmtksdio.c and btmtkuart.c, which
>     never had a bounds check for this event at all and read 2 bytes
>     past the end of the received SKB whenever firmware sent the short
>     form. While there, it also adds the missing base WMT header length
>     check that btmtk.c already has (skb_pull_data() before touching
>     wmt_evt->whdr.op), since these two files were unconditionally
>     dereferencing that field with no length validation at all.
>
> Chris Lu (3):
>   Bluetooth: btmtk: Route firmware debug event to the diag channel
>   Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
>   Bluetooth: btmtksdio, btmtkuart: validate WMT event length before
>     struct access
>
>  drivers/bluetooth/btmtk.c     |  8 +++++++-
>  drivers/bluetooth/btmtksdio.c | 20 +++++++++++++++++++-
>  drivers/bluetooth/btmtkuart.c | 19 ++++++++++++++++++-
>  3 files changed, 44 insertions(+), 3 deletions(-)
>
> --
> 2.45.2

Sashiko flagged a problem regarding the usage of ACL connection handle
without masking the PB field:

https://sashiko.dev/#/patchset/20260911104234.2276126-1-chris.lu%40mediatek=
.com

If the HCI fragmentation doesn't apply to these handles, please add a
comment regarding it; otherwise, users like Sashiko will keep flagging
it going forward.


--=20
Luiz Augusto von Dentz
