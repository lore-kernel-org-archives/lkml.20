Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0473DD86F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888510; cv=none; b=eyakN2Mj9s+UYLDIcg8U8eeunqWH9+DTXqrwg47DrwftJFGV64Keyq7l55aFn/rXqJ7E1nCraeM+mJm52CkXvLDwueE8s2H8GbHFisfyxS+Eg/47AJiR7WNzeMRXgRfnF+7dI65v67WH8DwpNM2/1efpRFg7Ji3L/H3D25OEW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888510; c=relaxed/simple;
	bh=IiM2f62hD9k6oZ9l4ZSi/P7BGPFZA+mG/KqIgjaavNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecMD8uqDTPuRTGONEwK7gmD8xmH5ppUdjQ+04LjxUxSWeM6qtZy7iGANVpZnYK/NztItogNbghnLayiqtCCiGmztpiNY3ISzdwjQq3eC8xrPGApNlNzk3EL8uyxB87lhF1pnVdD6/4/AtQ/erk1oWXN1ImdO1CV0WOxg2L7CvGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=3BhlPY/c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wBigrlgE; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="3BhlPY/c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wBigrlgE"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 5FBA11D00131;
	Sun, 20 Sep 2026 03:15:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 20 Sep 2026 03:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789888506; x=1789974906; bh=So0yxVgsxV
	SE+Pub9KiADAceEOGo2hW+yz6aNJCB2G8=; b=3BhlPY/cPb9pU6UT4ZXz5+b7uV
	NDScXOwWjSfNrcRqLC1SHbVyJFtmH1kP1EoLOnDEbFYUpemjhPrbrko8ji5xlO7a
	nzp5LC+tzUlIvjwl11CD3DR4vM+AC/RUzOO1/h/ZCiG02eaMBdjy0Dloibi0hG7b
	NgrpsQl7jPlUveUr1DhPDIUTupKv3kP/viF+lJ0KV9ovKy2qqO8ccBgA4O5UFmtA
	hB2tOFQ8qNbZ60pmVXsMpxuzzqbDhmfwpFTlmEF1A1GJDD+nDD3OTXDcMNWRp1aQ
	CNLqi7q9d+z3KDmoK0GTEELbCJ+KM+82X0oj0/PkCKLHAFLKYlynlvTxfiHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789888506; x=1789974906; bh=So0yxVgsxVSE+Pub9KiADAceEOGo2hW+yz6
	aNJCB2G8=; b=wBigrlgECOJIrPHF0J8vkPQRiDwJfQIoDmrrIdjr/z+u+KrQ59c
	KLmODfjWTeu5waFJnGys5iiZ0YRiulkkxYa8PFWfdggaSl3u/HdjsqMTIee3Q+ev
	L/MKskobcPQvZoqJsqShMm1nhZO2lPLaLvd5rDQVyjZFMQkkfBgR9/ZaEgN68dLU
	vxbb3ESWBmdiwisWtjZKS6cbD2g/Npqo06y6asR+sZWoC9PN5T8vYQFe8iN6LnwS
	VikTuLG8ggMOXznNTebqaAr2Ny+fvW/fuXKuOHhIWlM9MU7t5rJaOrR20pIPGa5O
	WBS7BOnlWpjDJ0kx2oR6WrgWbBgNaO3X3AA==
X-ME-Sender: <xms:-oevajQzv78RZkoJx-jC0nQBfI8vyJPMDmzIJTKc8xDtFz79uS1OIA>
    <xme:-oevaivOM-ArV3GIOMCSf7t8b8SOK8LsF_fTPxik-GySeyd6JGJHZG1YyNor5Beib
    iz0HvJdU1JZDhkWKbWDIZYtz14e1Faldemg62ohKz86zUhqmV6uTPaB>
X-ME-Received: <xmr:-oevagbos0Q8Ut2Wi4HTOI4gPDf5fhnkdMqNLycVrX9rx0GNJDovg1v0dUEw9Dfkaih-dUDg40r4-UOGFN4pEojeOen03nRSACkMpbXdiNbw9A>
X-ME-Proxy-Cause: dmFkZTGguTbE0fOD1mze8dHaCm5BbCsiBnKW2kNP8irzo9L417V1ufKO1g2rY0lWtIzDUA
    gpdloGQhWs+fuErBEs3GXiHikpYuklAzExRxBK8+25CZVBhnkOOs3HjqnIFDgpG/ryAeny
    bAj+tobheATih1GTZ0+O0FJTqV/CgxVNwo8X3OdZBGOFqNazheBvbMfl0l6Ls37npjukek
    ur1hbDmQKWTDdqU52k0jQNou4jwn6i8MKQLJ7h1z4nZ8jKs8k8p+QzUuNOk/uxXZ5FRnxN
    JnG7iK3vAsT/oDULe8RgzHJGVT6m5Oiet/X6uMecXELQ7CEuPRlH9ImtfP/xsXi1z1L8M1
    /k2rN63OzdAHcobpj+8v42AYYhJTOFwCW9g1vp7ObyCnD7GcqolXGoKOtgzsxHsatJCEpv
    tRyjAqKuQSGSknp/3WCnABnTYSUIsXGixdnKe+79d6cTTGMhRKLams5xIo//WvftteUTID
    6M2XiLEFBSaD+G4CERgIHIwZlonJMeMGBB35PrYbY2G4W0Q2488ZGshHAEmN8J7Um0Ul5Y
    WSeqx2uMb32iRQP7zKnQX1vusUfCY5tnUegDcAbmTEnurhemsgyBVrvkp/LJkgNGPekHKf
    GpykSaavEp/TBFtdWOJYG/zhyW8EF8uOX7Z/qCGvhui4sWUp2AI+w6g5MMDQ
X-ME-Proxy: <xmx:-oevavsZL5pScXA3V-SF6ZZd2NbUKkI-FW78iMiFcAMutLpWPUdRNw>
    <xmx:-oevaqFEXnCzwAeIsf7VsPRzdT5xhJuFpzUp9llsQLeicsnugMmA6A>
    <xmx:-oevaizWCR4J4OGFmuIVmLzr8lC6v9gq_yMhtYh-b34xiPSmfzcsfQ>
    <xmx:-oevahjBqW2BS2Qi6Cx-_JaFvwEbS3s-J_h2oSWXrymHaTbV5vKvLw>
    <xmx:-oevanGUzEHwNIHuPx0epwi32s4Es3TOCGsplWUZMPGtT4uBstkYfrd4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:15:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] firewire: cdev: refactor for bus reset event filling
Date: Sun, 20 Sep 2026 16:14:56 +0900
Message-ID: <20260920071501.77785-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

In the cdev layer, there are two places where bus reset events are filed;
the update path for the associated fw_device instance and the get_info
ioctl call. There is still some code that can be refactored in these
paths.

This series refactors the code to make the memory ordering and locking
scope more explicit, and adds a KUnit test for the bus reset event UAPI
structure.

Takashi Sakamoto (5):
  firewire: cdev: use memory barrier to access fw_device members
  firewire: cdev: refactor using scoped_guard() for get_info ioctl call
  firewire: cdev: refactor copy_to_user() in get_info ioctl call
  firewire: cdev: add annotations and comments about race condition of
    bus_reset_closure
  firewire: cdev: add KUnit test for bus reset event UAPI structure

 drivers/firewire/core-cdev.c | 63 +++++++++++++++++++++++-------------
 drivers/firewire/uapi-test.c | 20 ++++++++++++
 2 files changed, 60 insertions(+), 23 deletions(-)


base-commit: a20545fbf9226591017fc371bdfb1bfd490b0e0b
-- 
2.53.0

