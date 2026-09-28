Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01534C98C;
	Mon, 28 Sep 2026 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610654; cv=none; b=RZisDXxRMV4bbVRkFG+v+PxTIE9GfnMSNe/QT9+0Ytpw1K4CcEs4lOjw062RqvdqRzedqAuUkldPAcrZ3l9LHmKTL4rEE/6U4IhQ8dUc9U7SbHn1qtD6vE3+1qLOxi2miY9wa+EMNB9Jmm+8Q9VxVU6SNwVfcnjb6IFT0HOFCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610654; c=relaxed/simple;
	bh=zAkCrcOlmBfZ4N1Lht+W5tUcHRENfOGrq/bb62jM8ZQ=;
	h=Date:From:To:Subject:Cc:MIME-Version:Message-ID:Content-Type; b=AJCj004V4kUD4Tx6d05wv66CRhdZ0ciBDAfgkG7W534IrjxmTAf3zwNzZVKKMx7tvGgSDpOtSkOw5TNl31jocfEMjV5/9LBEwR/j1fPuXykNbWf95rGfKSJsBbTn0hj7Y2cjgzbLYgSE0Cm1svzOwQ6sDha3YjzWFeBgS2GAMPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GcKxmh7k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HddIgF/S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GcKxmh7k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HddIgF/S"
Date: Mon, 28 Sep 2026 15:50:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790610647;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Vpr9b89yqSbT+GUaIx3w524hrZY1bnYeo9zHBdIoNx8=;
	b=GcKxmh7kzhVMToPzD6uj/w90FnTb2Na09peEl0hwjeshQJlpeovksfCbyiPxExg22rc33X
	4IEGhBGxBLWkngjYGbSWUptJjbIp80/n8I/nLKMCQCLXL/8jY/xMlnSJC/PI1gNv6y/Tn+
	pPCXr7K3hiuDUvWx65TQyStLQyPHIHTQYkCucbd/q220edOH7c6G5Nw/wVKbdnEw+JiFWB
	m2G631ZYLINHyuWqY3SY8rsRxiXrVy2R8h7x/bJ5HZVPmOHxxR4FbAB2oKw4OJ3cGcxxFU
	mS3mau0Ty5zN+wyOc24hm/MDGDYB0MKwQFvBzfS8KEk5AFPZOXHRGB0jwUm7Og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790610647;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Vpr9b89yqSbT+GUaIx3w524hrZY1bnYeo9zHBdIoNx8=;
	b=HddIgF/SKA6FvvDYGXAP+qeF/YEm0xjIkDVSKqDtzBMy+ZWkNQP9yBbZTTLFu6cHSfd0Ai
	JqTuJLW2hnlqabBA==
From: "tip-bot2 for Dave Hansen" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] virt: tdx-guest: Remove unused and confusing function argument
Cc: Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179061064597.3910103.16408190384672396612.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     d48b2d347105436365280a3697a265aa4d37e96c
Gitweb:        https://git.kernel.org/tip/d48b2d347105436365280a3697a265aa4d3=
7e96c
Author:        Dave Hansen <dave.hansen@linux.intel.com>
AuthorDate:    Mon, 28 Sep 2026 08:36:00 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 28 Sep 2026 08:42:58 -07:00

virt: tdx-guest: Remove unused and confusing function argument

The tsm_report_ops->report_new() function takes a void* argument for
implementations to use. But, TDX does not use the argument. It
relies entirely on the 'struct tsm_report'.

Despite that, the TDX code passes 'data' around needlessly from
tdx_report_new()=3D>tdx_report_new_locked() where it is completely
unused and ignored.

This is not just a cleanup or bike-shedding rename. The variable is a
real liability because there are 'quote_data' variables and even a
tdx_quote_buf->data[] that can get literally referred to as "data".

Remove the unused argument.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-=
guest/tdx-guest.c
index d0303e3..a21bd03 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -265,7 +265,7 @@ static int wait_for_quote_completion(struct tdx_quote_buf=
 *quote_buf, u32 timeou
 	return (i =3D=3D timeout) ? -ETIMEDOUT : 0;
 }
=20
-static int tdx_report_new_locked(struct tsm_report *report, void *data)
+static int tdx_report_new_locked(struct tsm_report *report)
 {
 	u8 *buf;
 	struct tdx_quote_buf *quote_buf =3D quote_data;
@@ -333,10 +333,10 @@ static int tdx_report_new_locked(struct tsm_report *rep=
ort, void *data)
 	return ret;
 }
=20
-static int tdx_report_new(struct tsm_report *report, void *data)
+static int tdx_report_new(struct tsm_report *report, void *unused)
 {
 	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock)
-		return tdx_report_new_locked(report, data);
+		return tdx_report_new_locked(report);
 }
=20
 static bool tdx_report_attr_visible(int n)
