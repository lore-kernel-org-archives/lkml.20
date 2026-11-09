Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243304;
	b=FPvR8/fNLZB9AY2+t4IEAtki1odyngIByNu91q1zQGrDfpRbhMAZX0mdzdLMkM09o1ly
	 +r8Ok/9CN+P5qFXkrCK2y+9SbVRsuGH07MTcZeH1GLZZpCd65XEiq6bxktmTLrT7VIn77
	 3QOkxGHIg2f1jnlcYjflBT+BHm2GWwvUUbb/uYcQnO6JmO61+35uDGjmATyHUJTs0w3qs
	 VSIp50c2YjFVuthlhvFJcUSNXSN54NmidPdZep5CS/d5mB8LhBE48oU/8qet3udp3gtWf
	 cRaW1uynRP1apJC8TUYgQcy/KmlR3Tbll0HYXxqAv8s5gVNlroZ//b2VaP+kCZD6Rhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
	b=Y/vcBGiqcyN/Bp08r3y4agvElahwV9GFy9d1MgALoBpgfsv6BDIsR8PeXCCFznKzo/Nu
	 EvSseyUZIKmkhrgIVTxZFMfMdvMIdRZGZhOUmrRfTkl3O+5TH3LawdoaTjXmx+6Mvoeao
	 hdc8h8g7jExDWmATtVsa+ptsv0pCsD/I5V3Rte7mkD+DrAoNXY2Wr4J+kFHUF71xovBoB
	 Vro8Ivx2wAivxL2w5hw2MQ/0SKSHjiBADVKwWuDd1fc1IXs3/61NFSyxM0WenEraFmRpW
	 V4tcvVLwEx7f1VFmj8YNOjeq6H7WNggfafGNdND+YgZNB3xUh8YUraNz+OSYmOEZr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMcoPJ3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED288606A8BE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED288606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaMcoPJ3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491aaed7565so698124f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243302; x=1794848102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
        b=kaMcoPJ3K4GQeci9A0VDvbzj3TGlRVR0mYBeFV/Mv7qd2BQxpWKuR9L1cgIt+r/8c6
         0+iO9+zCk+iPnrzB75aB97716/tz6jUN5f7YKTps2fzF2g0ila8vOWWK6bPaX8wDBWuR
         3yD3sI0l+LVDdXSpsZwPMYEcp86YVHH4XoGPW0Zqeg+LkjmqEQPwpgO0fgmPFJqX0cyf
         AJfQeepPT6HdWkRA4erxv6QNScSGcop/aal3rCEg2H6mhAtqsvssTfUcMgwoN9fN0AoT
         D1KRf4Djg9nUSz3fDuYRq0l6KC4oe0yURx7trXi+ceFGZpuo0Ilbd2L0yVZtZeeXGcMk
         ErnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243302; x=1794848102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
        b=FlqhpwD1iM3Q+XFU/iwRAPrSZkN3OzOYjh1u8fZd3SAu521zGw062/Z7rLyzERZAx3
         Ru6R28YdNS69yt519bZoBu3k486vzYKAdBvswwmD4tXySwhIPCsHRKr1E4TNvneOX+RK
         kqH7OBvGpz+bFJlJI5BjpKXpbINw3QbWh1mZSLDfRGMyS4CuAqJpPmtTzmVhK6vazFq3
         awjuxBYe691np7TahRbvZNbmatIM7iJe6sldZLEiQ9zhM9OA8/aO2EI8LiOcIR9zF61E
         SL+HDeMp/b2ZwzBvflhoCBLvcLON7b6lKuhI4vRed26doFEnr7+zwmoED20STrCg4iaQ
         WCYQ==
X-Forwarded-Encrypted: i=1; AL+hErGR9jHfarHMyNlKXC0rxSYnwaLnmPmlHXmYpTJTo5g6y6YaHlO9W1Kuhkc3ZYMiNuLpsMhzf+qchLmJPGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z846WDg9CLJY9G7ernPHcksuXy6+QHURFtCmEE8LLzNuRE8pxXO
	n7K8U1z0kMzbLq+vslcIQovs9Ih98D6LxPRSnG0sVxyz6Z7s2xqAp8Kh
X-Gm-Gg: AYBFou2v3dt6s//BDaRyiB7yUXzAF7oG5LgQ5CB2etRqelK8/uj1rVHt7TolB7LPxwJ
	3XbQS+87SUN1ftFTeOGHUZ6bdAvsm9UrZwEvu0NKvuzTzIoW5KKFsemuGMysnSA3ah02ssbhVXV
	WijbF/Rc6jjg5cQFuqXZPYGDrHbfRdRM/OEMPrpamYBI4nTAgbx6vf9r+iY4RLLW1Hg1k0o+z9Y
	5VyOL/R8n66SJafaZ6AX/kYOyIjT6x4hYwJ3TiSjuIWGYHWs3KhYT0F1aPKAfw6Mxxdw791PNzA
	gV4FpFSNEvPVKhge85rXIEXQiRxyyokhvV5zRyTJ8JTCxoN3fdTUg8Y+YtX45xEtakIJ7pG8DIu
	GongOovSbJ0zIQJsQ8KfPotQMQPM06rZEb/Pyvrx6e5D60rfSY9sQ70tBsJP1IRXI1eFVY7jgr6
	nw5etnQK/w9Q0GSafEXezC8/cjneWtta1NKjcU/YEV6xHZeXL6+R6x0JU2K7AZB05BHB93AZ1bS
	JkuR0FcHltsNxZ67bh4SmkuslYrHxhDrZxMBrpGL29lkCc4P59QkphKXjm3hKKF6h8JBFXHztHm
	n0pYO/Klgd8+1jRPhruP9u6CIEfY+7fAl6EBMCQDXtMBlos=
X-Received: by 2002:a05:6000:1849:b0:48e:bf0:352 with SMTP id ffacd0b85a97d-4982c2d03a2mr129328f8f.5.1794243302412;
        Mon, 09 Nov 2026 08:55:02 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:01 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v2 bpf-next 12/18] bpf: Follow integer casts in bpf_scan_ir
Date: Mon,  9 Nov 2026 17:05:32 +0000
Message-ID: <20261109170550.141443-13-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

Follow sign extensions and truncations between integers of at least 32
bits in the block of the return. They keep an error, for example an int
error which a function returns as long.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 scripts/llvm-plugins/bpf_scan_ir.cpp | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 81de8f941568..a3c6336662fc 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -82,17 +82,39 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return N >= -MaxErrno && N < 0;
 }
 
+/* A sign extension or a truncation between integers of at least 32 bits */
+static bool preservesErrnoCast(const CastInst *Cast)
+{
+	Type *Src = Cast->getSrcTy(), *Dst = Cast->getDestTy();
+
+	if (Src->isIntegerTy() && Dst->isIntegerTy())
+		return (Cast->getOpcode() == Instruction::SExt ||
+			Cast->getOpcode() == Instruction::Trunc) &&
+		       Src->getIntegerBitWidth() >= 32 && Dst->getIntegerBitWidth() >= 32;
+	return false;
+}
+
 /*
  * Add the errors which V, the value returned in RET, is known to be on the
- * edges to RET from CLEANBBS to VALUES. V may be a PHI in RET. A PHI in an
- * earlier block is not followed: a later branch may split its values between
- * clean and dirty paths.
+ * edges to RET from CLEANBBS to VALUES. Follow the casts in RET which keep the
+ * error to a PHI in RET. A PHI in an earlier block is not followed: a later
+ * branch may split its values between clean and dirty paths.
  */
 static void collectErrnos(Value *V, BasicBlock *Ret, LazyValueInfo &LVI,
 			  const SmallPtrSetImpl<BasicBlock *> &CleanBBs, ReturnValues &Values)
 {
 	int64_t N;
 
+	while (auto *Cast = dyn_cast<CastInst>(V)) {
+		if (Cast->getParent() != Ret || !preservesErrnoCast(Cast))
+			return;
+		if (singleErrnoAtUse(Cast->getOperandUse(0), LVI, N)) {
+			Values.push_back(N);
+			return;
+		}
+		V = Cast->getOperand(0);
+	}
+
 	auto *Phi = dyn_cast<PHINode>(V);
 
 	if (!Phi || Phi->getParent() != Ret)
-- 
2.43.0

