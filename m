Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779237;
	b=GZzHFa3zxOhRgUFah5d66NCu7nXlC6hb4kj3aof+hyrorGpYrZknwxBoLd6QS7834We3
	 EgKNsEviIkulm1oCiFdwVWDSGzua8rJnhOBbtGwPTkE1/0gGIVwy558YJ7BqMDFtUu5mV
	 hwZY5zxYgnM7zVIqaPbGMgR86LyI1V871GpuTpPkOM5gPykVqHwVnngifGr/KaVTLIBhs
	 K2fHcGf8ngMb/j2Fy8eb4K1LnFSoofY8jAFib4F0LQ0YJ2usRPRtDBmlxIBslISsNXwBG
	 LQMg208HVZ81sGL52va9P3f4xthac4gQq4NXq7DLwUC9Bc+KP+JtSgUiTuRm4YdJF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
	b=lEZq3JIsDrKAfsWhvPKFCu9kuJB8mkb/gS3KzRuM+mi/xhwjbahSMY8OHerhjyTkrEq7
	 7hMu2Pj0ZeUvd5qVBWI1u2DGefFhPmaDIhDqOgp2Q6kfTlqEqPlcsGicf6GdpFlmlsyRr
	 bMMLZdILX//Ga5jQ/bxg3472gS/tR8T2pMPDHXyhRNK5Ezf3dgO8aNd2C4y6NdU8dar+i
	 rjMZxlkddhpE+fYKOIdPCCobJrkfTHYAnafWmFMZpSsMhx3VGm28NqNchQrT5kFWyZymB
	 Fu5Y0P+omLM4QvE47bI0cKjA9t95KtpyBx9hbN4i78TkjSykmdB5TgLDxPcF346PxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90831606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90831606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so294276f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779235; x=1795384035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=i0vogCSliLZJGYDRv14NGvoJrO5SGotB1IECpyR/cQn7RkJjcbXtZ15LN3HdYRuzJK
         3ghnZOKGJad3pty8zTXUIZyySoqi8t2T6QndoUZVwetLEruinA3Q23qATRL9sGf1hOf4
         Z7Vc7cAvyNjD8JJ8NLUXTZqI6ZeVlaC1M87vbmcRfiGsVmZj6cLm0rggjPOMTeej35rb
         hpi9+DgGTyVh7vvBbDkGkrVt9fQAn43NYaliIguXV3JrZaBTpt9dH7BGClgcmthhrLOo
         aOBH+5LgzrDvj4Wo//E5vupbxzwtPtwBU/4eJ9RBWvtUstHxE6d7ZyC2C4Dghe53V1Z7
         YZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779235; x=1795384035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=JsYXGyLBjfIyuvircXYNL1lmP5TK3mbI9tL6QCxI+Z20jUKWPjeyjmSQ/dScIbDwpk
         BpSPjw6nfF8OwvzBb4W2IblsTrgvtDfuhBVNcW/QC7Ky3RbgIHFS0EHUaX0GHlWW/fBW
         lgsNesCXDyP/M+G2AVaiuuriwasF10t5FnU5/7fz/L6taY9nBqh19Ugsnz6WiGd0x/RN
         n2SGvKjUjGhJLO3Z7CPHgbV+Oe28bMUgyKYtPrfOlS1pLeSR7QDQLjwAiJYwIJnRm+ho
         oXfoc7bXee9NZnBRCU0l1rmK3QMaMieTjrHiVzZG1lB8x6cRdMSPRS7y+HEoDj9KZxMs
         GuaQ==
X-Forwarded-Encrypted: i=1; AL+hErGAEBUzZTlFt7lF/PEGnaCWx4eYMISmPyWdPPwFEKEwEjHcmaDidGg4EHF/OXTpe0ty+9/a8WpxYpeChCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N6oVJJRcrqo+AxeAXk5rQD69FciJtmOiibopyu2LZ3opA206r
	d4cmHuX458gfF3dxkFx5Z/3lLpMx2hUmNQUj9Q9jxLAPv109+9XeiFgw
X-Gm-Gg: AYBFou09tHP/CmjDBAxlVC8xBJMaBvXlYxQPVfF1c8K1JjGXaok42tTwgg2xr+cwW7h
	PuDbsTmdq8kkdFH0/NgQpZ+eKAQxLp7FivSRbIh0aI64az2Z2Cz/LqdqFP0TRkrEPA8tSJdXiz+
	fNWk0BrpwoaanNvNGshxqp5Ft8EgJAkQr1xNnfLENsAL5B4RSRCqA3zFz6dOovGxItImgqmR0zX
	QPdwS3cuR5gWJRx9H1wg7QKK0+Pd8xeFafrO6euqSfrRItEln19xNsIHQAGdU+18WffxzoR2Dgw
	XYDnYvmFNzt9teKLszSP5/CKN/WT2lunNDFOg6zSpapZsiwivggZyyDbCrJat/yqdg0Cr5yZZ1Y
	BdcwBXCYs41S+9yqShTh6ng3uPv+ORkiwhOHx7aoWIoFCWBR9Dmc/Sf7zcq9UaYawiq8R2jE21z
	3Z3FsGDVFzKs9bkRBdTi3OppAZsOa5P7c2UinoMj4RQj+vqIHc+NG104Rxor/x1Gxr92SpkM3n4
	sXlR3aNknbaCud9cZapVDoQsYLqIxeGyNWBvkp3jyI027D5c41PuUeysxyE5ey629OFYjktzgrs
	qb4DVb3G9LIVyf98EpPgp6EI9E97rm39cONuipSqFkFst41EOy3znM6Q6bJKE9tcIjjIzhdIkQ=
	=
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr144632065e9.0.1794779234728;
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6f93b3e9sm43204765e9.1.2026.11.15.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:47:02 +0100
Message-ID: <20261115214702.50817-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2: correct Fixes tag (was c017800af5c71, now 1ec2230fc721)

 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

