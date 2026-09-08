Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52B5650E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905106; cv=none; b=Zs1F17NzjBGEMqAFNpNHQQjvMz4EL/ftamex/WC+ws1mCKMuIIK+aZgYpux3RqAVYbi9+1B8Ic1xhIj4P1lH7bqPDarsct+wJb1CH+N3Xhty0JJBtczC/FCmWoObTa3sX0HbVtooBj6Rmmt3UtepcAJj+tls5eGrvcWpX8Ju8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905106; c=relaxed/simple;
	bh=loC8Ki9qdbzxMvlajA8IK/yuRR1JUHkGme+5rYN08yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnLnfMpQNfEvi/3O2Ix9axBktEOsVArlkLOdT7AEIc3aVC2A6HxyeZgnQzX6asFla0DPZaJ8oOH+BZrhtWSRYDroDQY+Iy6F9o5Z30MhhqhCDnmK8pj1LbO9CB5XX1/LBGftz17GVGszAhONdAArYpPjpPL8wg6oRmo4aeqz/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlbryeCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlbryeCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1944B1F00A3E;
	Tue,  8 Sep 2026 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905105;
	bh=7lTXSTxsnG6cCBOxmONeX8M6z6q5cJvZx27kO/M+lUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HlbryeCTMH+OOBxr4hM0n+6B8dQKDAwT7qzPE1TBHtwJGzWmWp5NZ8VC7FNvx1Zz7
	 K4sxjEtWmEW87+VvXpnDQt0DYFZfXEJtKTLc1TZMZK3CLo9HdrMt/+yzWYPDh2Wm1W
	 PER4ZVmhRzTc4pjx9RFlwTByoTqNpZV0mS6mEhI5ja27C3ScYbXI8krQTprkscS8Uk
	 wlno/gv+tKbUpWGf92uR4yUQ5q/2jwQ5n+Tapk0yX9xcAQ5FJjSHSRxjKklcFAlxCn
	 TVQWqmsRf28+Qgtw9AtLLoStCSvBIzwJnhjofaNYz7Z93f4mQlUNXtcWpb4/NdntYp
	 F1GQbw6VrZtHw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:47 -0500
Subject: [PATCH v3 10/22] accel: ethosu: Fix NHCWB16 bounds calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-10-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

The Ethos-U NPU inherently processes NHCWB16 data in 16-channel bricks.
The NHCWB16 address calculation uses the final channel of the last
accessed brick. If the channel depth modulo 16 is less than 15, the
hardware will still read or write the full 16-element brick.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 2707b7df5dbe..6f6712f4efd1 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -415,9 +415,10 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	case 1: //nhcwb16:
 		element_size = BIT((fm->precision >> (ofm ? 1 : 2)) & 0x3);
 
+		/* NHCWB16 accesses the complete final channel brick. */
 		if (check_mul_overflow(c / 16, (u64)fm->stride_c, &offset) ||
 		    check_add_overflow(addr, offset, &addr) ||
-		    check_mul_overflow(16 * x + (c & 0xf), element_size, &offset) ||
+		    check_mul_overflow(16 * x + 15, element_size, &offset) ||
 		    check_add_overflow(addr, offset, &addr))
 			return U64_MAX;
 		break;

-- 
2.53.0

