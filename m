Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429306;
	b=cSE2xsU+Of9/3+V0xA1fOLGMLUB6cAxlMRerTQiVQWhzTkr5X+IBBG3gP+iWLzeLhqUv
	 McGiIH1xGgKmLN3Rxn5T5kas+HN26jMEULE3mHc1tXRTmc6Tpxk/0b1JTeR+UB2phhC7a
	 FVemRr9XeSLI8oaF1LG130Pav/nUPwWFmE0XM1STw62jo+TbNISTVU8e4qvTLZVgL9YGp
	 FaLDD5hENJxV9n/O/eORREbr/pHP/zzD3gMOWA0B14VjAALe9bTWIa2LONfi19Rzsix9U
	 YVfHZz4BhxWG5S10uybVQbzq8BKXk9556ZA3xNsno1t3jMt1lNlkLdA3dddgpXtq8AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
	b=3O0qP/SKp4KvL+yzb1cnPBo+z7+8RcR/6kJeLdpOd0RSK3dp26ptEZs1mkCSOdYrD2zi
	 yB8l8w6uUb0vpCP68hs+M+ctVVoBdqAQWZA3hwJwpn2ehV4/LcwLZ3D+9M0cl198quxCt
	 D31Ai5sdEDA4ceYhMtgGhVLkrw0aQlBbJ/1RZoeDIDYlCO290aRxLbZCmmpngmv+OycLq
	 A8PURIKvAO0o4SsNS4fpYRmmsxQj468U3rduswmA38dZwKi6OTpJ2srPWxJ1kwLtdBvwk
	 Q02ImZfssCJJZXbkPdeVKrDiUsRvv7JLYnzEBOqDzD+q5coUCtkV2rjMXxCWSirKEBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nD3D/Rt/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56921606A323
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56921606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nD3D/Rt/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so1489254f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429303; x=1793034103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
        b=nD3D/Rt/3v+UqLLyXS9zHDk88H0JNoDmJA/arQlN7rTSRQxnPOKtmfOuYwguJUWkg7
         V0IObNusxnDICmfrMBo8PSYE9lNwFDPjkGX+ZjbYU54RHl426EWA5C1xt+UONWXZKrAm
         kGlfNYnyB3vM4wAA9Ji1DFNRu0bGOJBVm96xPnp3RggmTQrDszu1u+viCedkUPQwYswX
         XJMp7OVqKKZuRTTJHh2uFcAEWQx1UzGtGU+aAIi2HbTGg9nnBgPp8yA5asj0bp+5KcHE
         DB29c9EMBSmNfhxl8L8Sg9YVdSlUHne+fhbyteFgeeFpoSMVQIjzq6QZMTqvAZ/xjGa3
         RPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429303; x=1793034103;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
        b=PpdgJjEz7ELB6eW8Nh4jdYmno1bsztN7pcV8z8TbFpqa7dzzFC8uaBQShcPkuCAXm5
         EDDlbhwAnpsnKrbbOr5CIDLdHin8PBMl54JkhFApiA7qUDIb5N55bwheHE5sJvJ4wKun
         yelp20/YRKAC9SuOa3nFmVpYevXZB9866F5w22nZmDpXGqO6zUHkH4gYeBviIRHAgPzx
         VJTak75YyyIQ8+HoAFOlz5wYoDCkpMTu8tJHtH+SFrFr7vTPrj1lA8UE4SUJjCX2RqCU
         fmpHz1IEESPyn58rZUZH1W23b2hDb8WUI1PICXCXa8TF1Mu+LPLI3pd5XHvMWiXcwxvD
         Kj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9pjJ+d5O/kegjM41dk7/Fbj5/TvgDXowj+lkuxWP/eprvIcrdW2mdFAtOM/eiXRWya+rXYbrYWnjmSJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8ocmxRQCmi8MZDuFCAAX7HGQK0++QscV4wh/dkGxcFTZ9/48G
	712+p0I9VnTMtTDp99S/+nKx3cxX93b3YZ3KI/R40Jzu/xg6bddv/hMe
X-Gm-Gg: AYBFou3d7tqWAdhYXD0Vi65YWtLKPrp47eW30Uidlk4jHpT1q1Gq+8NDEPnr114Do6t
	o/hi7vYHKEof3pyTUr95yyd2+HQTEQfhA7WW9kPXdzfN0d+jKYmOmszELXv66Bq1dGi9IDPdCSa
	3Hy3BMSWQiELpyS7jZse4yd0UBWDPlxzmlx0CRyCDDi/ERWPySLNKTJrTh820IwtXWQ3h6dd7Qr
	09U8e39vlgamMlt/u+/RKTRoEr2HhpYTr2kErPDxi79Kv8O02dO2jTHyugS3dGFXSyY48XNQPo2
	F/N9KDGxeOD+814XZ5zUw8WDR15JfWZJa51MVSfVly7AfVcL+C8WnNtr4TeClmVFzcOfmIJJQEr
	MYU5JWTlnjgM+achHCWOp/vTZixemNNkrgzb40w/+Anp1aA4VfVxlOLk3um7L+Kan6o3V+IY6Z+
	mOqkgsfekypeZJJoJ8ENHPqU1l2VkI3ri51FJ91K8e8jnPTfdJgkjK7pkqy78UHUjK5nW3F9MuI
	Tkwp3+u9L2EzquJiSn0QBY5rPcNZA3NIRWxImtDjFquDsyGgLXQK8sW
X-Received: by 2002:a05:6000:22c9:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e07fe3d59mr19938200f8f.51.1792429303334;
        Mon, 19 Oct 2026 10:01:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Au Dang <au.dang.jx@renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] Fix transmit handling on SCI/RSCI ports
Date: Mon, 19 Oct 2026 18:01:08 +0100
Message-ID: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This series fixes several transmit problems on the SCI (PORT_SCI) and
RSCI ports of the sh-sci driver, seen on Renesas RZ SoCs:

 - Patch 1 removes the code that disables TE at the end of a
   transmission on SCI, which the hardware manual does not describe.
 - Patch 2 stops the TEI handler from turning the transmitter off
   while the xmit kfifo still holds data, which could stall or lose
   output. It also covers the TE handling that patch 1 no longer does
   in sci_transmit_chars().
 - Patch 3 skips the software clear of the TDxE flag on SCI, since
   hardware clears it on a TDR write and the extra clear caused a
   spurious TXI and a duplicated last character.
 - Patch 4 forces a TE toggle when restoring SCSCR in the console
   write path on SCI, so the TXI that restarts an interrupted drain is
   generated. Without it the RZ/G2UL console can hang during boot.

Au Dang (2):
  serial: sh-sci: Skip TDxE status clear for PORT_SCI
  serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI

Biju Das (2):
  serial: sh-sci: Drop TE disable at end of transmission on SCI
  serial: sh-sci: Don’t disable TX on TEI while the xmit kfifo still
    holds data

 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 43 +++++++++++++++++++-----------
 3 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.43.0

