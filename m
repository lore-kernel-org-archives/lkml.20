Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227016;
	b=rYSZbdInb+dnKW1rhVZKveXJ2V5frU3yZT0I7MTR7UbuaOsEKg0zvd+JfdHuMIMwBStv
	 9GoAe+WLA788GjmaLzHZTpExX8zi90Tg6dxms//jKcUh1vYwqLbsbK1+rWSVffeCM3qUl
	 fuZ8Rlu7QCDowZh2S1UYctj3fX0ilmogopCiJt7Xyf5geIRw2WAc/2agNj2/SrkHf+MVn
	 mm6HYwiegqUAnJm5J3psKKW36vrn6Xj5ZOAWTaaNiKz5ohGxW4ptB8msLpMTAfDZdBG8J
	 X59nOW1gDB8LgGilL/3szjp38xyFaJJhAlhCijWt7Hdex0rDCvTdaUyQ9wd6WVfuY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I1mjq6MyeA/h9ILt+jeLEku3zY9kIcs3gn2aPes0dRk=;
	b=iLoMXdM7BgSmD41wAEhLqr5kGrJ9yThGT6GU4jchV5BgE5w6iEFaSeSm5FvihVRDRZ6r
	 +U8KGrN0yJcyks+Q7DGX/P1qzmoYUq9abikoCsJehy0VOwc/JLFvsh/cUhLe9EV9L/Q9d
	 ZjF2bmrr+UoAD2f5nPyKz7ujpkXf+6wEjo0RDbd1gBSFJtxhdvVdH7M2TTtb36vEgJM2O
	 WDm+2sgBS57gy85wApD/ckyCoawi1BTFu1q/26Sb+wSV0XZ+CGmbftogu1Ne5sAzE9HAX
	 /W4GFaMT7WBp4kUMGRC9lea7J2OArQOag+RQusnVR27nRVF6HWvcOTrXwLioHjcQmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZeU9gaSu;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4064606D81F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4064606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZeU9gaSu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso257987a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227014; x=1794831814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1mjq6MyeA/h9ILt+jeLEku3zY9kIcs3gn2aPes0dRk=;
        b=ZeU9gaSuQK8ifQkeRrg2l1q8sr4flEOP16zlgLfJ7HJIWusjhcE5bB2Y23HvpYfMDd
         C3CRyBORoCnb1UYgRTRWFP5+k+xEsWg+JvxzXpEdpo5WYY+Tad8ECsc60IjEM2NrdSZN
         WbQ/f77ZZKCiNo8FyXtvaXzS4vB6U9J2zw1nQ/iQSrzur+WGxDj/WdgcydNAGOkTAPi9
         58rJouM82weV1fgApEsbGbc1Wjco97dMwadrvv+XaIn1uc1ZKbwjtSVk9RexsOLx0ze+
         G90IkiKLBOafrnzT/vIRPeeP0M9o/P9HZnTLxRDGTdcqi3diqoWgEmq1w3+0LuN8GVrr
         Dj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227014; x=1794831814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1mjq6MyeA/h9ILt+jeLEku3zY9kIcs3gn2aPes0dRk=;
        b=DlKMiMGI05VFFYN2BtIECQgC1i4LPBniUV6W5Yk8KTCM14fGzyWKRFQqxSnD04KkJU
         nvoXdyrhYkuVAqWLVTHNkyIwM4zSJpYYvj09Xzu8quuiyEEWulyb8c0VFBxXgCcroIrx
         Jf3+VnyvF9xn/CRBrqygq8D3o7Rmnm4A21MRnFMiM9Gb13ozeK4PFCVCQ1d96xtGbyEI
         r2ePz+AlAhJXssi84lRxs8Hv/WHJDGeJ1RSL1S+rY0aVyxL7Gmcj0PmfvhsiBo1bPa6w
         eUG9oCQt07WVDeoiqwM3tW4z5jzoljrzd4VdRWIVGYVTqxu5Ts0COAcbCDwOV3bNa2Vi
         oKsg==
X-Forwarded-Encrypted: i=1; AL+hErFXfsPTBUu7JoP8WUIB36Oo4xA4NNv2abmd2wvigPh3NCYZP09bOtm0DwXSiOaWVOggfgAHN8xRxa9HKrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FLqwMo5IXjkXZnfgEXu/yD+AbRYKMYGbR+IbrF/Lq2Cf4Mz9N
	tQjvfnaCAHj0DIjB/H/JfsowOZAoMdlcBHU2BtM38Sz70dagxXuxqtieTZaI16WJNQ1+w2T/XK2
	nwXLWtEM=
X-Gm-Gg: AYBFou3L0Ro6K4+cWdJx7tx3nTa1WmhYZ4pWtUsdX8IGVAKt57+Iq8dRspyEkYR2V/+
	2SggCV7lTXEib25xzRUqRbszwjJfy2HfxiJ+Pj447MUJjRxe6fF4hG3buRDC9RTJxmKdyetZi4f
	w8YtLxTvrRd1ducyAkc975eS2iM1Z+1wwQZXKmTFJv2ammQg7Jsu6/8WI7sfCulehPMIvdvDcmp
	+ytn3JkmdBeOkvboilkkPSeWLS0QRyia7GHpCzyMYFmEIR5VCygjmrhlfCH54CE+WRtfdoDq31B
	m6FVq7iItgPrLx9upFW317UtjLW+z/nMnKwMClmpJ6XRQqX3l+46TsKtpH3gMWRfyxqweOfKrQl
	nK4R0abuUhQF37Zw+3M2wvBk5cUe74CdFefhwOWYbkjSYm5BcTvoXy2ZK7XTNZon8dwgfIo+FU4
	6OU1c7kVnFuFMkA2syIEnWTuMQF0xF+bLIISskm96HjwSqpacubU86NqPVZZQJek0j7uFp3wpMC
	fsA6VSgFv/6jGig/t1kDX9zq63DY45V9xPx6nicSQuAmMwE/iPiawio3FBolmw17uc4Q2zoHzsn
	jKeLLmY/d8RX++bd/NXF+Z8eP7o7g73hf2ZBKMNPqQHUT5PPD7pSqLEGoXAwvL8Fvc6ZZPxmKHs
	xxZBm6wn2kXDaTn7bdbhx3DchEq1WYMerDTk7/FGuAr2hmniPCxTpQN34GgA=
X-Received: by 2002:a17:90b:3dcd:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b12d0e71famr3766813a91.4.1794227014043;
        Mon, 09 Nov 2026 04:23:34 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:3d70:1891:1a66:b169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127912d62sm6836905a91.11.2026.11.09.04.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:33 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] xen/pvcalls: fix the backend error path and a workqueue leak
Date: Mon,  9 Nov 2026 21:23:22 +0900
Message-ID: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
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

1/2: every error path in pvcalls_new_active_socket() runs list_del() on a
{NULL, NULL} list_head, holding socket_lock.  2/2: the per-socket workqueue
is never destroyed.  A frontend reaches 1/2 with one bad ring_order and 2/2
by connecting and releasing sockets in a loop.  Nested-Xen lab: 5 of 5
cells oops as shipped and 0 of 5 patched, a normal connect moves the same
bytes both ways on both arms, and backend/pvcalls/<domid>/0/state after
teardown reads 4 before and 6 after.  Reported to the Xen security team
first; PVCalls is not security supported, so posting here as suggested.

Yehyeong Lee (2):
  xen/pvcalls: unwind pvcalls_new_active_socket() step by step
  xen/pvcalls: destroy the per-socket workqueue on release

 drivers/xen/pvcalls-back.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

