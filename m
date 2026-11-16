Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805936;
	b=mHY1MKMkYFZF70ndSfRsr664K3nYd4bsOmvKj/HD/lmFZtBTjGGOcVuckhB5wWC3H5hI
	 gL/5/LTFJNb+3FJvhL82dxnSn88XchYncO9KtWWECwm/9rEZpmbu2LgHdil4CxqeESxFh
	 3e619i3n2/417qbHCpEcmk+WuFze34+4gyDWobc+4QgbiX1cdfro2AO0t0OE+de+ARqbY
	 gIpcVcQCJ0Dz8nkYln6kcUxI7c4ZYPAPlB1DsBcrG2gcC/rm3IkuUfc6Au7uLhQKoauwo
	 WZo0Aw+zvKS981YN2xU1N7G4+qGukMSA5zq2vJR70oemDvTwMxlCBM5sHdSHwu0ujlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=Z9POl9I4jcuj/IXKCybXSL9Ryns15ceDvYW9lVzUk4g=;
	b=5I2UW24vpUoFCEXDf18Oq8Pv5xA2fh4bxdwhW4uuCNKQqbJRro3LxvYOEKlANCKZnE2E
	 ISasXZG0hJPFi7i2hYrao9jrIgTLJKPEOpLEhI3/rnwgjgINbWwj2n/A1/Tj81+4US6Ab
	 Q8UrtlHiwSALf9LEvj/WsITWv7+n7BpgdNIzW+dZuXeEVTEiCdax8xF/D7Tk4Gk20aT5K
	 brQBLx5XmEAxgDp9g/ElVXwxgRk69Y6EekdbP4dx/5XPB5Zoj4vGEks0O1EdwXn/PkirD
	 hX2LeZjC0jZH7v0XGQdRGADWR6crbwx/QJNxHxL12OGiUL8P5nL0mUpgKu7e31OW7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FnXjxtij;
	arc=none smtp.remote-ip=95.215.58.60
Received: from mta1.migadu.com (out-60.mta1.migadu.com [95.215.58.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E74606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E74606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FnXjxtij
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yz4k/P4RhOoUI14DZ6GNPt25I0TqwKwgFQ4BR8IZWf0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794805932; v=1; x=1795410732;
 b=FnXjxtijQkhxdYMcxeyPm9T+kdwx2937lBxlq+dpWWLoAsP86LVIDVqlJlM29C3fWN6FS7ll
 8EfFex0sMyG0xum3K09pDsQOXJj4UpeNi2DlIvarwb/GGZn9leXEPd4YBVkTFb6eUPgwNJEfWZn
 9LdN/xUt/m66nkvVlaf345s8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 896e38f19e08f5bf;
	Mon, 16 Nov 2026 05:12:12 +0000
X-Mizu-Trace-ID: 896e38f19e08f5bf
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH 0/2] dm thin: stop waiting for grace periods when
 activating and removing thins
Date: Mon, 16 Nov 2026 00:12:02 -0500
Message-Id: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAKOQ+moC/x3MTQqAIBBA4avErBtQkf6uEi0yJ51FFpoRRHdPW
 n6L9x5IFJkSDNUDkS5OvIcCWVew+Dk4QrbFoIRqpJQaTXZoNzw9B4xLRnegVb3VptWzMB2U8Ii
 08v1Px+l9P0k+2DdkAAAA
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Activating a thin device waits for an RCU grace period in thin_ctr(),
and removing one waits for another in thin_dtr(). Tools that create and
remove thin snapshots for every container, such as the containerd
devmapper snapshotter, pay for both each time.

Patch 1 drops the grace period from thin_ctr(), which isn't needed.
Patch 2 lets the active_thins walkers skip thins whose last reference is
gone, so that thin_dtr() can free the thin with kfree_rcu() instead of
waiting. Activating a thin device gets 51% faster and removing one 15%.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
Qiliang Yuan (2):
      dm thin: drop the grace period from thin_ctr()
      dm thin: free thins with kfree_rcu() instead of waiting in thin_dtr()

 drivers/md/dm-thin.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
change-id: 20261114-bug-dm-thin-rcu-gp-d29d4b74a0b8

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

