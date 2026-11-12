Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479947;
	b=DO2iTQ3TeLwC4d8jD0qHiUVXMscJQ1TkLVK+kfyCq8z+qucvwJwpFKJA0BD9Oj+7UseY
	 YYwoM74wRPviUCVOpRwkFsDBxDELzIj/Wnxw64LMGPj22VRM5A4Q3daPT7EX/6FphjbRv
	 qJZTcwUMrUsemQtaiq7G72My5diUaS7sgNjprenS3wYyPBxjKCDood+cqRJYXORHdZLWp
	 /Lp3C3fXj5VAP5q11gBez249q3o7SiIEMZJSUtRg9dhxzytjLLXhB/xsP6ll/TMKH+fEi
	 BUMDhg4UU+8VLfVIGElRPJtrafB5X4tReDLPv0OCGbWdmetCkHhqYI/3z8cBhkDtoEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479947;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=1TqLW6TCU0MTFWVnCW5idaNhXosc69J5rCdUkKs0dx8=;
	b=ps3y6q5OrBh2QCR/u3LqpraWcmXxiRMIR/mG20QMC+9iKszC5hK0v1+4YxWX9HjCu2J+
	 uwHl1axxA1a8n+oM6amDiMpem+TzyL23JqemWjziXEVGFPud9qkPlDKRyuvUR8JRyJ7d6
	 TxdHPWdFIe0cbi9bu6RcL7vaC8IMOMpj9/+Mu9fmaDrcmhBFT1YEKqBYXMJD2TYHcpO8E
	 AgMrp8VkFWrw6z7kXOHQPgqdfA1SDNejeYNyQS6dGFLzPiQK5PvKtHKQJrZJ1X0rfV6uF
	 DYG9Hf2ATjkG9KpQptn2OnjkeU1cqi1LachSDft1URQi+KeytRK7+/fAR3UYDGO8+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtBMKKln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA885606A31C;
	Thu, 12 Nov 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtBMKKln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFBB1F00A06;
	Thu, 12 Nov 2026 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479947;
	bh=1TqLW6TCU0MTFWVnCW5idaNhXosc69J5rCdUkKs0dx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HtBMKKln5m3G2gtNfK/0flI7AP2EvZjQQh5hYJWKwraxNla1MVmVeuJ5Ztyg+zBIZ
	 khUBJZFQXoNuH48GrC/IEX1y076qqsHUPLnW/4knD6ieVh5yD6Ep1U7Xdc+iaqh/G2
	 96RcYCSwBiEKJorecpKBit1DYHC0PUEhaO/VrmvZNvW2Qus0kmmqzCBhxRN3n+4N9V
	 Bha5BKr6vn4GeUGZh6id+YDhH7F8tw8N3nnYso2wo6OayCdV0jehXEereNvQyUXxsm
	 HzOywLMLoNMgZ92M0qDbBL2f1kzB9Z28hN8Y2EKGpXe2m+9zlY3iORBTSvFSdA0iH2
	 0LQsFC3wGTBhw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 12:38:53 +0200
Subject: [PATCH v3 1/5] kho: reject zero bootmem scale
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
Message-Id: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

kho_bootmem=0% sets bootmem_scale to 0, and then the bootmem areas are
sized using the explicit sizes that default to 0. KHO remains enabled,
but there is no usable bootmem to load the next kernel.

Reject zero scale the same way zero explicit sizes are rejected.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/liveupdate/kexec_handover.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe31819..b30ba686cb301 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -703,16 +703,22 @@ static int __init kho_parse_bootmem_size(char *p)
 	if (p[len - 1] == '%') {
 		/* unsigned int max is 4,294,967,295, 10 chars */
 		char s_scale[11] = {};
+		unsigned int scale;
 		int ret = 0;
 
 		if (len > ARRAY_SIZE(s_scale))
 			return -EINVAL;
 
 		memcpy(s_scale, p, len - 1);
-		ret = kstrtouint(s_scale, 10, &bootmem_scale);
-		if (!ret)
-			pr_notice("bootmem scale is %d%%\n", bootmem_scale);
-		return ret;
+		ret = kstrtouint(s_scale, 10, &scale);
+		if (ret)
+			return ret;
+		if (!scale)
+			return -EINVAL;
+
+		bootmem_scale = scale;
+		pr_notice("bootmem scale is %d%%\n", bootmem_scale);
+		return 0;
 	}
 
 	/* parse ll[KMG],mm[KMG],nn[KMG] */

-- 
2.53.0

