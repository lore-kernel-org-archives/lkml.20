Received: from outbound.mr.icloud.com (mr-2001f-snip4-11.eps.apple.com [57.103.68.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD32283142
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788112046; cv=none; b=dEubRHpIJwQRaaIuTk6dASeJGDlZLIlqaaX0OmLUIYjaMoDM3h88QA5I9h6xUe2Fq8mbk8cwZy32hgun1LVrNlXyK7j21besooW+fXYqWiYh2QhB2tbh9a767KmyDffI0LEj5E8IaYsTGA3xC6Xq3JAK53b2wWsmz4vE8XtBrTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788112046; c=relaxed/simple;
	bh=H9S+tEOKSJv2e6vFGwduQjUrm2tGU8FFrbs0f4U+QOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXYCPZLYepFqPEsJ8XOLLqOB6a/3TSS6uEB0TTO3p72M8wI1Tk8jPIK0BffHsQcoWUv4KRh7bPXxybfDCMDEyCSv4qKzi/UaDI8lc5SKLTdIwhudMt8DyIxCOjYWT7oD4hM6bYQsTJk1OodR5i/77r2NOP4K8FOpZ4dzJ3XiqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=u+lqq5MA; arc=none smtp.client-ip=57.103.68.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="u+lqq5MA"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-2 (Postfix) with ESMTPS id EE93418003BF;
	Sun, 30 Aug 2026 17:47:21 +0000 (UTC)
X-ICL-RepId: 01a053c8-776f-7035-bfd2-663ab858009e
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFIHVwPXBxBCE0dXAVcEhVdRVcIQTRXAFgAVAxaAlwXeRFQAVgeVl5aF15NUQ8PGVoUXBhTRVEfVFhBDgpTEhhcFFxQWB5GElYNXQkZBkBeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DVQRbA0cNTwNaGVoFSQBAB0AGRlYVTydWHVYTVRFUEV0KdwJRHFYNV0NUBF9OGQxKHVJWWxNVF0YJ
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1788112044; x=1790704044; bh=pip/veS4Vt1x3GLvllwj0EaipJXbPgDLWOXzGSZbpNU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=u+lqq5MAsAQSJA6kYfo2zWep/ejICA0+ue+m4yxLJLnL8SGOb3+azhIyY21VsNapqoDxDEzxjAWfIipQmwpc2gqG8d6GZfe68NYoQNG+2baVCHJ5GA2j0eBRJYDo69HfieUvgmB2fc3JncJC6aaWudxzjpC4U4f6XX2UrSdIzMTEEtlkfAb/346SWvuQ5pU3i/DmLpUXPaQ57HhsKzqU3x9wrQ3IuyYF5xAzlJn79ZuCqMOunk2ijPCkCPcLMWkTAymGa8WypscWb/q2pbVaWjVVLFtBdT0AfkITviAcNbyL3jyvby2a1t0Id5cfTflbd7HXSyTJnYT6V/LJPc6ooQ==
Received: from cachy (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-2 (Postfix) with ESMTPSA id F10FE18000BC;
	Sun, 30 Aug 2026 17:47:18 +0000 (UTC)
From: EPAXGAMINGtv <dev_epaxgaming@icloud.com>
To: speakup@linux-speakup.org
Cc: w.d.hubbs@gmail.com,
	chris@the-brannons.com,
	kirk@reisers.ca,
	samuel.thibault@ens-lyon.org,
	linux-kernel@vger.kernel.org,
	EPAXGAMINGtv <dev_epaxgaming@icloud.com>,
	EPAXGAMINGtv <sureyjan@gmail.com>
Subject: [PATCH] speakup: flush serial input buffer
Date: Sun, 30 Aug 2026 19:47:07 +0200
Message-ID: <20260830174707.179984-1-dev_epaxgaming@icloud.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V39XviY0YLRHO2kOmXGd4BkhcgtNU9rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE1NiBTYWx0ZWRfX/vKioWsnTBNU
 InSt6VZrbgReSbCeAazTfwg+qYAp90lc6yzCAu41Eb2eqViW3ZUfwy9zabO776j95Hl1YNjhF48
 0KzW5Ek+WRY1pRy3ABUNiLdNSfQXoEHnmNVKya+I795AolrJVg+FZEBN1qHcCMrX8pfmXnHS348
 QfmvUpgw0qowC0dCCez/iltxmWXCyDXIGlTtQz+Dk6wnVwCCEH4mDDECQSAYBLn5SePJHjP18tG
 tYt4w5E6Sje0LpFWD2VkMYDxJOg5lg0tfSNDgrG0p+AmqV+Hx4JgZr48xhEQY/PPkAL8kYW7LwF
 xZYCOelAE7JHKRHGR+4oQfEkSWqQ9yI0bturnp93FFprQemVUihbkb16+CNrPw=
X-Authority-Info-Out: v=2.4 cv=EZzFgfmC c=1 sm=1 tr=0 ts=6a946cab
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=CSCJrs6vJZ0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=v3ZZPjhaAAAA:8
 a=yjEW0KsuvKlaG9GPbuMA:9 a=Cc8U2RDr_IoFKa-EQMXK:22 a=l4lIyVkwVPLhOeSlMOZC:22
X-Proofpoint-ORIG-GUID: V39XviY0YLRHO2kOmXGd4BkhcgtNU9rd
X-JNJ: AAAAAAABxitAdeakkzx0ANY8/3ahCoPEryfowBQs+ZWxED1C0FJxkbzBmBe4NbVb7nxuoQWk3/5lmm0eTIheySF0y3xakIPHTpmdHpmCUvF3jdthrNtpx6XrolHwYt+AKZnFPzamaHnwVG569Vft3E/KaQkFbUYkxkPqXvIgigCiM9U95RhnYqjex8QVX/tG64mTw0YtSM4xTQt/ejd8SL7VKkzJhH0FUZnpB4W6wWBN5QOZ+ndMltWJF1NSPCAijFoRuvZ/Ss+8wQqXnkJYqQvDQy+dj0s9IIjYX2iIJqizkkSI0KkUDBLGThFCORGaVJc4UjsvMOztkqULPfanwxh0Bdu7fT+DCa0xS+NsjFfCKmSM4HUjDWm/2x6+P648HnE5N7YGSgo8vswyhBpFExgsNYlgosX2NUeAUDU4xGIjuxDzgH1wykLMv8qzVMyofpXcmnMktTBdhUCgzx4BIU1ddfv1bGvPavDoOkgzWTH9P7fmL1Lba3btqD8LiJEaKaxygrJ+ozjPDFO4owUuyQpJz6JJY01ikOECHlz0lsQZm+79KiT0gRFtEUW4Fira91pPoKYCykYi9OSv4bRcX6FmJNsl2kFxSPUT/TVgWal8Go2usx80j7pGaiByFp/WnPTP/DxsuoSTICnHQchw/OmLxGZEYMg5RJVvmLjcanuftlA9QSSxvYr2pAFWMySD+EQ7kQE43IMcLqNLl8VZpEW/apKGywIifT/RE06WcMERYbfK1g4LEKmso3Jkmm8wLpkedO2VUGKAdKTYCbWIzO351PWArHGvU0YHUEfajAWmvMioE7K9fhH1zNPfymFL2o63WGZTW3Fg5aIHIxgl91joHnxLthcpvfEi4kadhPjT/l2B7xhHYpdP1athqSAQChKjmwmxnOzFbzcwFimlergg30OAjAiUFQBhtBJCy4JzX64Z2INt2L3Nfm9DlqHTO4p2613LbGyVS3mb8TsFWlUBfTWarIS
 LcEgtPB+zIlwMUqb6ZL5fIwZZJ2qhkdOwImjMj1Iy/V+zpXHKZIx+3E1MM2GJyu9FvxJZ2Pb8m9ereg59JdQ8sx98leiv5fONCB28FKoqAq53avkx6ljBstq3EPAxLHZx1svJ87lAtWSKe5viFDm1J5pl9OAUXPh3lW/908pXGL2ZqpO09hDQHlD5rv4jIGJBlZ8ASfjPSo7G1NFZJNcJDAM/IXRoPSGiTrkBljZKcCuuJiB9fNLhbPf8nNg/EVc5DPp7jIibA311sTlky8s/Kyh9z84vcKioB0+ZGWAxgIhm

Implement the serial buffer flush operation for the Speakup serial
I/O backend by draining pending characters from the UART receive
buffer.

Signed-off-by: EPAXGAMINGtv <sureyjan@gmail.com>
Signed-off-by: EPAXGAMINGtv <dev_epaxgaming@icloud.com>
---
 drivers/accessibility/speakup/serialio.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/serialio.c b/drivers/accessibility/speakup/serialio.c
index 3418ea31d..921303505 100644
--- a/drivers/accessibility/speakup/serialio.c
+++ b/drivers/accessibility/speakup/serialio.c
@@ -277,7 +277,16 @@ static unsigned char spk_serial_in_nowait(struct spk_synth *in_synth)
 
 static void spk_serial_flush_buffer(struct spk_synth *in_synth)
 {
-	/* TODO: flush the UART 16550 buffer */
+	
+	unsigned long flags;
+
+	spin_lock_irqsave(&speakup_info.spinlock,flags);
+
+	while (inb_p(speakup_info.port_tts + UART_LSR) & UART_LSR_DR)
+		inb_p(speakup_info.port_tts + UART_RX);
+
+  	spin_unlock_irqrestore(&speakup_info.spinlock,flags);
+
 }
 
 static int spk_serial_out(struct spk_synth *in_synth, const char ch)

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.55.0

