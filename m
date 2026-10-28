Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205541;
	b=jxWzAYjZjBBtswmc2FhUtEvaZqhEJKsz72EtxkR+sgpTiovx6xW+DuN9iPgLzXHgDXJC
	 5/wFiu2dZ0tECWEmeWgGg4gDCFOS+BCaAN0kNuCpBXhW0oDpSj66qeT/vRTFolnHZQAGq
	 3h3WEvznjfa4kvKOxa1x1fsdnIT082gHx5nMxQgeim93n65PbKxr45T/H8IEQj7wjHAOm
	 mfY9+gOejcVljcrad4p/mZnOOZtVZBLazI3rOQ3pBCJpN120+jWiRdecUioLkv61bneFf
	 9WhZe49r5rNgkPeox7DVlf+q5cqr6jzPzal6ICB8I6XffojHe3WhQRPfV2k2mjcqK/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205541;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o14Y8GioHe5xKGETtV+6mIGsvynFWBNAqqz3q1Plk64=;
	b=iZR4vgw9bSbSpgjH6RzNbNulyIMeVQh9c0NQ8MDJzz0cOoGafDIgYeXqxpuCLserqmh9
	 IlpaFDRX95K4MUpkWWC9VPjobJe2DLnGscBt+YqaHWe8e23CsblmXa6Ta8zgS5J+twhgJ
	 /4A3GSPd59usiTM+OewmSLzjyYEvIhCRMlhKqTsPxZmZ+tN7lZTKpeEiwSyV7kZKj/EFo
	 OJOCyKtR7U77Do9InxT7Nw54kvbG2QrEK2vmi6UGkNfCwHFx1hq8TD3aDH9aDCLpOVkW7
	 98cq1EuUw/F/JrwXMs02mPCXSufR006g4SIBnl9iX1hEr8A3cEcjM5qXDGgQiP4jvBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YxF4Cpw+;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845AC60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845AC60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YxF4Cpw+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FL7qyygk0WpLM2HIqHVy+cQvsdnGXSZjWaxsKWXACz0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205538; v=1; x=1793810338;
 b=YxF4Cpw+iakzD6IeKVDaTTCj1oCcus0T+oStlsHMCGaMGSvTIoLjsDw1QRT+jaCOt4k5440Q
 vj2LLerm2g2Ibo+lvj3dxe6bjGK/0v3OEpWt9sIeCLkfkYuPk5283SU8Pm0kU7bb0VWn+hs5rWs
 lIlBwDcA/XdJt/PcBIg0JzI4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 166e4e174b8e3a3d;
	Wed, 28 Oct 2026 16:38:58 +0000
X-Mizu-Trace-ID: 166e4e174b8e3a3d
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 38/39] arm64: move vector-length sysctl context to priv
Date: Thu, 29 Oct 2026 00:35:17 +0800
Message-Id: <ccd456ca9a22b5ff9ef240a871f4fdd1fb515365.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

The two default-vector-length entries borrow extra1 for a struct vl_info
pointer, which is not a bound, while the handler delegates with a local
int table.

Pass vl_info through priv and leave extra1/extra2 to the numeric bounds.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 arch/arm64/kernel/fpsimd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index ecfa21615f16..97e746bca99b 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -549,15 +549,14 @@ static unsigned int find_supported_vector_length(enum vec_type type,
 static int vec_proc_do_default_vl(const struct ctl_table *table, int write,
 				  void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct vl_info *info = table->extra1;
+	struct vl_info *info = table->priv;
 	enum vec_type type = info->type;
 	int ret;
 	int vl = get_default_vl(type);
-	struct ctl_table tmp_table = {
-		.data = &vl,
-		.maxlen = sizeof(vl),
-	};
+	struct ctl_table tmp_table = *table;
 
+	tmp_table.data = &vl;
+	tmp_table.maxlen = sizeof(vl);
 	ret = proc_dointvec(&tmp_table, write, buffer, lenp, ppos);
 	if (ret || !write)
 		return ret;
@@ -578,7 +577,7 @@ static const struct ctl_table sve_default_vl_table[] = {
 		.procname	= "sve_default_vector_length",
 		.mode		= 0644,
 		.proc_handler	= vec_proc_do_default_vl,
-		.extra1		= &vl_info[ARM64_VEC_SVE],
+		.priv		= &vl_info[ARM64_VEC_SVE],
 	},
 };
 
@@ -601,7 +600,7 @@ static const struct ctl_table sme_default_vl_table[] = {
 		.procname	= "sme_default_vector_length",
 		.mode		= 0644,
 		.proc_handler	= vec_proc_do_default_vl,
-		.extra1		= &vl_info[ARM64_VEC_SME],
+		.priv		= &vl_info[ARM64_VEC_SME],
 	},
 };
 
-- 
2.25.1

