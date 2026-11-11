Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390748;
	b=25xuli9gzitdFQVZuxM1eM/Jd2KpkvsRz7+R+hKFTZx+5RmEdnh+JkbJoMB7gTGn6ezU
	 Kqt4TbtHNR1mzVO0oZJW2a2OQugopCB4X6CJBbT+n0Kml+AisCza3L5o0HM8n73M9lxPr
	 c7kue+/8J5MoLZzURbjWnUsWQqNJixrtBKVt2F58uDK82ocoTeTIHZLHhwsbL30pZbHO7
	 waVDjbVaT1zq157R9WzS3/qRqwR5mWpZQoEYevACo93j4+wHPwaAESe96Do+G/o7J318u
	 aByIFE8Cou4lxafHM2pXyRaJbAxRCF84dYq/f/zHzpBn3gETxA+RFGCF1/TbxU8KNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390748;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=3Uussg3Rcj68dSiyBcrCPbebWeaDOBXJizT7820bclo=;
	b=lGQfsnnUxtj2xO/xPwUArxVThHmrewBVV+zGjkHt/NFIRSnuobLG+2hvddjdugoCUJyu
	 /mkmzuCJRy03UB/P6MilbsbpxbrOEzPSEo76KmtUeBn+TXFIkh9F1Widzc53tS+sUcHC0
	 jmVR98ci5zNmRPNJmSVrdAwEPspE3gmPQXJziitfsQjYGgSI2TwBzP4gOcWtbe+pr/nyR
	 2IwQZhtzrUPP0wM7iju1Rn6RD+w8hv+YCLGFo488Y7NqfztbnUbGxhjcTel012GNm2Ml8
	 svERRZeiT93VzoPmPj+IB5DCKjpK5VeSpKwBLiNZExFUeAxaM8jWCdQRezVpteusSMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3796606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3796606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxTtPaOvRqZYEeAA--.21701S3;
	Wed, 11 Nov 2026 17:52:26 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S4;
	Wed, 11 Nov 2026 17:52:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] LoongArch: BPF: Add support for indirect jumps
Date: Wed, 11 Nov 2026 17:52:16 +0800
Message-ID: <20261111095217.31415-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261111095217.31415-1-yangtiezhu@loongson.cn>
References: <20261111095217.31415-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy5Zr1rXr1DCr4furWUWrX_yoWfKrX_Kw
	13Ja4xW395WF48A3WYgayfXFyqk348XFn09r9FgrW8uas8try3ArWvqas5C3y7KrWYka13
	W3s3t3sIyw42vosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

In order to implement JIT support for the indirect jump instruction
(BPF_JMP | BPF_JA | BPF_X), emit a jirl instruction to jump to the
target address held in rd without saving PC+4 into return address.

This is similar to commit f4a66cf1cb14 ("bpf: arm64: Add support for
indirect jumps").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 26904010d9b5..64abebd9c950 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1184,6 +1184,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			goto toofar;
 		break;
 
+	case BPF_JMP | BPF_JA | BPF_X:
+		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, rd, 0);
+		break;
+
 	/* PC += off */
 	case BPF_JMP | BPF_JA:
 		jmp_offset = bpf2la_offset(i, off, ctx);
-- 
2.42.0

