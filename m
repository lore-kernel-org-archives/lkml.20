Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7404078D3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064484; cv=none; b=XiGTYADi+F58h9sKe42lTh+JQVu4FIQxq9e9q4zjWopU2QLnWUcnmGj2gOveaqPzlhimXYDreYS41iD0/+at1hD4UyeTAWSfvXW0GIXtMiYRRKA/yBHDfxEouj/a3FfBX67r7mILvxO12q7p0+j7wZsPqwJnO4OsDIKdhk5wmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064484; c=relaxed/simple;
	bh=aVHthoY9WqHNGXxO7lgVVAAlrwhS5HBJimpz+6/BoRc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=okuPRn8Je9D2yATVEUZmTwODVGA9/1loSI1DBTB3RgWxgfkE7If3wO92sQfb4xzU7EJb27BXBVAO7miXJb8WQntWNnZRYfcqFLTAv3DcSIvoo84Uns9aBEcTF/4z88gvFgCQQ7FyobijOV5cRJSz3UvW7jXfZPF4KlgVb61YfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=D3j2pnWN; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D3j2pnWN"
X-UUID: b4606edab65c11f18dc8c9802ae25ab1-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NL16rk0vLAf1LCmTnxVIbSec1SWALoohuykTOq26AVM=;
	b=D3j2pnWNRdNOvCJ39NrS4rfOA1N5PZwWGoqXmeEbHW8w2WLw6WIWpuP8b9rUUQcKCJOq/wC9F+ymlKpMtPI4VDJz2wDSwX0N2JZrUBIyKCcqDA9jol0kg2ZQ4VJFK1jc8QXWLpPrEixKr+kL2P62o05nJQzJsA34QWOSI6HSXtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:81d3e618-1237-47d9-8b06-b6478447cb1a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:04c137b0-a3ec-49ae-a57e-d31264ef3097,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4606edab65c11f18dc8c9802ae25ab1-20260922
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 500400372; Tue, 22 Sep 2026 16:07:50 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 16:07:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 16:07:49 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: Russell King <linux@armlinux.org.uk>
CC: Yenchia Chen <yenchia.chen@mediatek.com>, Huang-Sen Lin
	<eddy.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] ARM: entry: word-align the syscall table
Date: Tue, 22 Sep 2026 16:07:38 +0800
Message-ID: <20260922080744.798430-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On ARM, ENTRY is .align 0 and nothing else aligns the table.
It is layout-dependent and left to chance that unrelated code
(e.g. CONFIG_TRACE_IRQFLAGS fast path in entry-common.S) can shift
the table on or off a word boundary since Thumb-2 has 2-byte instructions.
The syscall dispatch loads the handler with

        ldr pc, [tbl, scno, lsl #2]

which requires the table base to be word-aligned. Observed on our
platform, the first syscall loads pc from an unaligned address
and takes a fatal alignment exception:

        Alignment trap: not handling instruction f858f02a at [<c0100208>]
        Unhandled fault: alignment exception (0x001) at 0xc01002ba
        Internal error: : 1 [#1] PREEMPT SMP THUMB2

Align the table in syscall_table_start so it is always word-aligned
regardless of THUMB2 layout.

Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
Signed-off-by: Huang-Sen Lin <eddy.lin@mediatek.com>
---
 arch/arm/kernel/entry-common.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..831a40461cdf 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -321,6 +321,7 @@ __sys_trace_return:
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0
 	.type	\sym, #object
+	.align	2
 ENTRY(\sym)
 	.endm
 
-- 
2.45.2

