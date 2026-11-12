Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511001;
	b=lYgO+un8BLMD0pORhCfWrzcuZYfoemEIMckXxRGFJevHRP2Ymi+kUhJ8Xhs+Y/xanmVl
	 WeayPJ8Ide0JbpscpKu9/wyeuq2O5uX3ZdBid4tFebZHv2XrwMywKdoER+L85ATcMIUTB
	 GiFaeSCRcrdq8NZbCJyWrPkH51xxOpC+urYfgz5gSa/NiP5tjl45oFacircVxHJGAKEQ3
	 6d0wdJ3yOaH7X3tIIo08mqKKQMk8jz4o8KRFI21//arSN4QrkwHUPoHLdPOFGQ1/MyJ3D
	 D9D5G6AunXJ7O6+GWUjNAmBxCL01WX8MJq6+O+LcIeB5MJMOMglw72AV75ES/EzriFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511001;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RgjvysmTuh39BYiAb4UlYM1uhUmVqBM16TRjQwjMgYo=;
	b=1nShWIUXTo5rW2Xzs86UWZUElrqLIxXrQW1ps9f4ucs76fiaaIe8Rs1W2439/0rick6G
	 NM5+kZL2NHETpalA/3Npvt1yUsJ+08rSWTZ12FOdEbvpkMLwjQrYLFFVguNRjc6nV5lFa
	 YcGdcR1CqpuVWGgaYR8xMIXr8xrpyKme0kkaRfYOPk9kAAH86WaDNMmdXMNjkxA69v7l2
	 ek7nrys7H5NIMLmBcMYLvEJVA9qa7SbZhTghtZQ0Esd6R6+NEwpbSvO0O0ftWYZZVgh3E
	 wrj837ituOE0HkxEPI6kzbgoBnaW97P5ZCYhPnQrRc/aLfwu+nL0pwHZRaFdZmGQy4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hId9GJx5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ESmooDqz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF9606A323;
	Thu, 12 Nov 2026 19:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BF9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hId9GJx5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ESmooDqz
Date: Thu, 12 Nov 2026 19:16:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794510999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgjvysmTuh39BYiAb4UlYM1uhUmVqBM16TRjQwjMgYo=;
	b=hId9GJx5moLbHvgRtgfmfU9CGH1B4iW+Vn86EUfTAq5i58ds5dLhJbZPFKXVrTuG9kbWCM
	7xNsrHApvEieWdZJPg6mBVIOO50IQ8HfQPJ0vQEAfyMvu+JOUrp8wQAFO3F9FkS4/k6lVo
	pq4sB9dW4lE0mjGSTa41pmemnr9qWkHVN82DCy/O6qhtSk/JMWf5yJRf78Q+8761FbA6t8
	ngz4S2hbvlHSEfHZaCmhzEW1WooNsj2cd0C4nm7CwSmL4ED5Re3bFjlZJdrW+gqbOvq8jl
	pfXbsj51pBxj8j4dVSpDTS1zqRmuML6ZCyt2PChfVsyKuqDI6UOFNSGXoQFZQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794510999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgjvysmTuh39BYiAb4UlYM1uhUmVqBM16TRjQwjMgYo=;
	b=ESmooDqzurSDtdIp2h2HrpDhuoSDM90X3Im5a8wr5woNh7hS7hiVU4hsk4VgLXlp1xt2EX
	KPchwHSoq36+6OAQ==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/vdso] vdso/datapage: Correct the vdso_timestamp kernel-doc
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110062207.213676-1-zhanxusheng1024@gmail.com>
References: <20261110062207.213676-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179451099575.2969448.764019923398202575.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     a877a3089b96ac0f7f8aa65a05ae5a441dbae1a5
Gitweb:        https://git.kernel.org/tip/a877a3089b96ac0f7f8aa65a05ae5a441db=
ae1a5
Author:        Zhan Xusheng <zhanxusheng@xiaomi.com>
AuthorDate:    Tue, 10 Nov 2026 14:22:07 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 12 Nov 2026 20:11:07 +01:00

vdso/datapage: Correct the vdso_timestamp kernel-doc

The kernel-doc of struct vdso_timestamp describes where its two fields come
from by naming the members that define them.

Both names changed.  cycle_last and shift are members of struct vdso_clock,
and the array subscript in "vdso_time_data[x].shift" refers to a datapage
layout that no longer exists.

Rename the references accordingly.

Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce struct=
 vdso_clock")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261110062207.213676-1-zhanxusheng1024@gmail.=
com
---
 include/vdso/datapage.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 5c4dac5..49d5081 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -48,11 +48,11 @@ struct vdso_arch_data {
  *
  * There is one vdso_timestamp object in vvar for each vDSO-accelerated
  * clock_id. For high-resolution clocks, this encodes the time
- * corresponding to vdso_time_data.cycle_last. For coarse clocks this encodes
+ * corresponding to vdso_clock.cycle_last. For coarse clocks this encodes
  * the actual time.
  *
  * To be noticed that for highres clocks nsec is left-shifted by
- * vdso_time_data[x].shift.
+ * vdso_clock.shift.
  */
 struct vdso_timestamp {
 	u64	sec;
