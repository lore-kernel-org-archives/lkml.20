Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166719;
	b=sgPM69pGrVgG2qSVYfeXfzowm/+KnUgaJ0InLEUX/tRVMK0YOBqwGiPAOfkdua6FIom5
	 /afBLM5StP0vxz4+NiRx1R9Nn2q0GA/wdwS82QouMe6Zi/GqHN+aNmWvox51KsfR6Tgtx
	 EKl6macO61Q+AexWaUYFMyvwgGl6FxqjpEjByLNTEnofKbJWI6rQ3s6+LvzrJ+A1+Aqh2
	 ug2s6OX2F//hstCAGTU4A3ijx+UCU4gmrQU7i0X4je7FCJtL86vbgtbBqiYSiuGyc7LLn
	 zcKzxRSxE+vlmT7+oDoWdZNkOO+skO9w8r1NajLp1wSHCjBFO51EY/KFtH5/nvliFMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166719;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ajp+DojodLhI1cegeSOWljh14uZXtvMzfqZ/gamOYgc=;
	b=hk1e1IaMjIdGsqr4twIIKZJU3uGv7n7ryFk07G3O5ORH56Tc7fvkzdXXIam3kfhHBDhi
	 I7pVd+2g+kB7FNe0NYHwE7Bmpt64+7Mp+hS49sUCeA878hppcbheKq2rwSyIWCgYRpVqc
	 f/gLPdFKHXzuNoq0fh1rv+8uw6ZCYv8iH3bT/RyCCRht6Q9CNIpQ8IndbAfr2gudQfa4e
	 iLqahxSOoGr58WMEsReZyFd0EcatcPl6utoudYJxlJG4ZN+EUCfyEMgjKxUkzHIT5qIXk
	 +quDKhiaIJWo/ognWnWdBM+o9WyaqQdsWUmqYC0bWpy/hLeyAPWX53eRpdLpVHsSsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=ETC1ueSt;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB8606A31C;
	Sun,  8 Nov 2026 19:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=ETC1ueSt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=Ajp+DojodLhI1cegeSOWljh14uZXtvMzfqZ/gamOYgc=; b=ET
	C1ueStpI/PMgQVOWw8C7S/f9TtfRPdUd9LQxuNxi2q/z41VBwOzVWBxAfVoDXn0UolzB9Rb3jxbkb
	Ye+exGMzlO1jRJBHZ2N+bdq1MtPkbmFJxXORGr1moRYecvrG2DxAwzyjL/SMdkC/RFmV00vSkr/F5
	9Kvbt8heFB51vmUj8Xn8hCfMIU0MJm1eCcOEUkopMLR40hoTHQ7mcgH1kaXhX+mmoISNR8eFg7bF9
	sS2eH2xRGsbLe0PNvWZ8EyAtqGBKKB/VPPySvMpSkRNjXqhpP8sdYF0tOvJF7SRDCLK1KqYK0Qw4R
	/ae81mV4756FA9vfBWGurZApt7hB/ilw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQ8i7-000000036Pg-226X;
	Sun, 08 Nov 2026 19:37:51 +0000
Date: Sun, 8 Nov 2026 14:37:51 -0500
From: Rik van Riel <riel@surriel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Qiuxu Zhuo
 <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, Breno Leitao
 <leitao@debian.org>
Subject: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <20261108143751.3af49e48@fangorn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

FCommit ea324444ece9f moved the "Machine check events logged"
print from mce_notify_irq() into mce_log() and dropped its
two-per-minute rate limit as a side effect.

A particularly unhappy system can spew out around 100 million
of those "Machine check events logged" messages every hour,
without that rate limit. A large fleet may have several unhappy
systems, leaving the netcons infrastructure somewhat flustered.

Reinstate the rate limit we had before.

Fixes: ea324444ece9f ("x86/mce: Restore MCA polling interval halving")
Cc: stable@vger.kernel.org
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/kernel/cpu/mce/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 50b1614968be..06f858faf2b1 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -150,8 +150,12 @@ EXPORT_PER_CPU_SYMBOL_GPL(injectm);
 
 void mce_log(struct mce_hw_err *err)
 {
+	/* Not more than two messages every minute */
+	static DEFINE_RATELIMIT_STATE(ratelimit, 60*HZ, 2);
+
 	if (mce_gen_pool_add(err)) {
-		pr_info(HW_ERR "Machine check events logged\n");
+		if (__ratelimit(&ratelimit))
+			pr_info(HW_ERR "Machine check events logged\n");
 		irq_work_queue(&mce_irq_work);
 	}
 }
-- 
2.56.0


