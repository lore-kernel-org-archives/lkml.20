Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D337AA98
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245946; cv=none; b=MMYhJwt29/KqmdCZfe8Nk7iv8T2p2Y5LjSp7CE+6W955M21K886ThNpiWLc7DuXeHPz67mfkWqKpoTDX0YCZ4uQSrVhfhbTmFq4+9av8m2RmSVpfAWgNkldkKBqYM/y9Y40rUf1JZvlQg70CIMg822PJU/PZfTaJpjrhzxLe9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245946; c=relaxed/simple;
	bh=s5O9lp5BiYxvgPwtR2tbjhBEQRPPi/orwD2QyXzl5ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oKkh3YuHAQJYeyV3ZOWpvbZ1pLKOojy6IwsLPtMmqAx4RR7NDMyQsMHYi0p4KsJKVqPJ+77ZgGR/YDdk1F/RZkBHtuVcJknHVIHrcFbiqYBEwHti3mCiLsk4WTlIOcD7TMp7notw3FM5HDYCt+PYzq7Ukw1qwW8614TrUnvkVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net; spf=pass smtp.mailfrom=arkamondal.net; dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b=dSOqOzUp; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=DXirxR5B; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b="dSOqOzUp";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="DXirxR5B"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=dSOqOzUpr4O2JUctXqTxlLAw6di15IX4zx6nSRUtwDjxEHtV5nM77CIA8fnYv6OtKx1KBBDvaWN1KT91z7PtTm8eX02Kaxcfupt3jhNiM4g5QaaLVCbBBaLINIfcicKS2+y6HsrQ/TkT1rgju4kxptjkMTK9nmpVDfgnDLW1HC66mJOhoIxatuxdsDIf0n6bIO10+9UOcLR9vFWrADqPBYDlYnqlEgIIODXo4SfdoErvorU/qmrYY4DDJyd2wC6L6UxxmrtVwQX/XPqxRGIgYBbfoK+omf2YiRGQ837juIA8YCUMXOSZhAKL7t2QJ/zYEwTCJzpIBmfG6MELetYWgQ==; s=purelymail2; d=arkamondal.net; v=1; bh=s5O9lp5BiYxvgPwtR2tbjhBEQRPPi/orwD2QyXzl5ec=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=DXirxR5BnStkHznsjV1/OiVKeEqcQz4X/NLeGdVMpix9dOw5hVj96iMC4iW6LVVn0hF8muZZ4A9IsWgggcffGGfJeNfNeQlrfv2Cu5/na572zFCOQyoaMfEhyiH5MVBbYoJAmteKx8w64giU98+IHKs44pLzHDs+cu7uAyJvpKKlCs6JoIViOMl+fHDm52G22OEsLAPLC4lQD/LwdA7QtgWl6lXSC2Z58Oa01Yyf04+oJTQ53aiF0sR6niix74S3oput55QTEiydzPBrxER0mmqF87JIKiAtfz/muyCPZUbiY3ZeL4tqKXQ5m4gWzog7TweoXsDCjt3/f6IEHp1GUQ==; s=purelymail2; d=purelymail.com; v=1; bh=s5O9lp5BiYxvgPwtR2tbjhBEQRPPi/orwD2QyXzl5ec=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1246644:48769:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1859828432;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 01 Sep 2026 06:58:48 +0000 (UTC)
From: Arka Mondal <arka@arkamondal.net>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
	Daniel Drake <dsd@gentoo.org>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	arkamondalofficial@gmail.com,
	Arka Mondal <arka@arkamondal.net>
Subject: [PATCH 0/3] usb-storage: alauda: fix DMA from the stack and two block-map bugs
Date: Tue,  1 Sep 2026 15:58:28 +0900
Message-ID: <20260901065831.43567-1-arka@arkamondal.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The alauda subdriver builds its commands in stack arrays and passes them
to usb_stor_bulk_transfer_buf(). usb_hcd_map_urb_for_dma() rejects a
buffer on the stack, so on a host controller that uses DMA every alauda
command fails. Patch 1 moves the buffers to us->iobuf.

The first command to fail is the one that builds the block map, and
alauda_ensure_map_for_zone() ignores that failure, so the next access
dereferences a NULL map. Patch 2 checks it.

Separately, the zone index used to reach those maps can be num_zones,
one element past the end of both arrays, because max_lba counts physical
blocks while the index is computed from usable ones. Patch 3 bounds it.

Alan Stern <stern@rowland.harvard.edu> wrote an equivalent fix for
patch 1 in 2023, attachment 305027 on the bug below, and offered to let
me post it. Patch 1 here uses us->iobuf directly, as the other
usb-storage subdrivers do, rather than the memcpy that attachment uses.
Alan also diagnosed the NULL dereference in comment 11 of that bug, and
suggested the reordering that is half of patch 3.

None of this makes the card reader work. Alan has said it may be better
to mark the driver BROKEN; that is a separate decision, and these are
bugs in the code either way.

Compile tested only; no relevant hardware available.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217862
Link: https://lore.kernel.org/linux-usb/20260821080951.39905-1-arkamondalof=
ficial@gmail.com/

Arka Mondal (3):
  usb-storage: alauda: do not do DMA from the stack
  usb-storage: alauda: check the return value of alauda_read_map()
  usb-storage: alauda: fix out-of-bounds zone index

 drivers/usb/storage/alauda.c | 95 +++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 28 deletions(-)


base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
--=20
2.55.0

