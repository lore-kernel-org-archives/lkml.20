Received: from outbound.qs.icloud.com (qs-2004b-snip4-4.eps.apple.com [57.103.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49988463B69
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.84.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629831; cv=none; b=YS37M4i1BFWH/fosTctHx7XEVVCqz0FpjsoO0n2h1QzdvgVXik1WJHQff5nYlUptyeWvTQ/iMvz+4qqw+rwDyGTUWch23BVEb3icepqbnagEZqbGDjnZuxcz3sj3kFxk86Z3wdHuNu77IJ1Mjz69hRhgBnPIZkbtKg1fzz6Ridk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629831; c=relaxed/simple;
	bh=lPNYRIWE5QUvNZDtQbTEBxRp2uQkkocq+i4veVp09MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caUGHIpvCFUaREWQl3aVei+qmL3f3b4NO4Ra+AupI70FofIiJ4us6vxAXkWSpEqU+DrVfYyZeoTz0CEDNQOVcT5Kd0q6bzk0AWgY+dt/ym544YyOnlQrZfaMH0RP3vovLCL2fKSLfcwDl9bLAE0ttthczzQ6P/FVYXjcFuGwvR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org; spf=pass smtp.mailfrom=aurorasilicon.org; dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b=YcI0SXIG; arc=none smtp.client-ip=57.103.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b="YcI0SXIG"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-11 (Postfix) with ESMTPS id 8C2FA180013A;
	Thu, 17 Sep 2026 07:23:45 +0000 (UTC)
X-ICL-RepId: 01a0ae40-0176-7b00-9ec4-bffee2d4a47c
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFPHVwFWhxCDUEdXANYEhVdRUEUVgVyEUwKXB9WGFscUBtcAxkEQBcZHldQVh5AH0sZQARbAlEfV1ZcH1BLQBMESQFNXw5eHwQXRhlVBEceXVZCHhkCURxWDVdDVARfUEkMQVBsWgBHF0gdXRlZb1BdHA4MQhldAlgLWgFeCF0eFxdBChcGWxQERFBaVVsLSAhOUVkGCFFDC0wFXAJYVhUMSAFeVFgHRAsdClkHCFYSC04dXABTC0YLSABeA0VVGU1WQRRWBXIRTApcH1YYWxxQG1wDGQRAFwdYRxRHDg8TTAtHAlo0Vh9UGVoD
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurorasilicon.org; s=sig1; t=1789629829; x=1792221829; bh=KaAY72nhFKZyZCDxL9glObwTHfwItem+cUlVLX5wGX4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YcI0SXIG9zPdU1ztYmOyYUiQ1vrgGOx2Vk03uJo59bAxN1b9pr+HPyWBbONC4Clxs94XmuND3Iz4hySXqLB8Pc2JWvPobwYQyyvAlaMAaSNAGGbRLRj7/95LdTfWphe8myI90nx+7SJZwJ8MlLrkQ25YOyyapuTz4p4simG2Devn47QMKeBpKBsCWlQtuSKg0F3HbAS2zkxWhoceWCjGxGtdXsiFienTv2LPh1hzt7pyuXCZ2n3cAvksn39G+/7ujXeHE3FSfz/VjHfcs2jN65lNb0T73GRD/a1a98wgwM3hBdYI+MyYKjIf+GOI43qfqX29kd/jA3v0PuDX3vWKNg==
mail-alias-created-date: 1786334582283
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-11 (Postfix) with ESMTPSA id 95061180011A;
	Thu, 17 Sep 2026 07:23:41 +0000 (UTC)
From: Ryan Murray <ryan@aurorasilicon.org>
To: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	james.schulman@cirrus.com,
	povik+lin@cutebit.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] ASoC: cs42l42: handle jack interrupt I/O and resume errors
Date: Thu, 17 Sep 2026 17:23:37 +1000
Message-ID: <c7b09816b41cc3246153de5023c3542e940cdb26.1789620334.git.ryan@aurorasilicon.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789620318.git.ryan@aurorasilicon.org>
References: <cover.1789620318.git.ryan@aurorasilicon.org>
Reply-To: ryan@aurorasilicon.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O9-YwKNKx5GY_6UOgSq4D3iVxDHrpKQA
X-Proofpoint-ORIG-GUID: O9-YwKNKx5GY_6UOgSq4D3iVxDHrpKQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5OSBTYWx0ZWRfX4Tpxlal+T56r
 38aX9LG8LjsD2MjACdX7tureYfX4ncArKXiDsuqH3cyEPoF3+P69GKxUC81olAoNRJ1j4qoq+Bv
 i8+YLh6Er6cQDlhfR8d+v3cGeHNLjNPY9rS9wOBxUY+Fee9PVDmHrf631myS1mewC5Xhwie5dbg
 O9GbduxS7jks40MuOBJOZJdPZOPZGZelRUj7Pud/aI1pU9m2YAbzZslDWd21xOASA+1gUW7xe7y
 XaNMCffs3CbyWi5miQJf7xi3jKnPKPX55aelU/yU3jAoEEE57tNR3eziTmRDbfkS+crr3vqDFbZ
 l6PpmY/lfg6OkNwpuVjEG07rtKbNzPPvdh1fm2TLLaQOv7sV6RA36eQD2QXwcc=
X-Authority-Info-Out: v=2.4 cv=K9Yv3iWI c=1 sm=1 tr=0 ts=6aab9583
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CKCxWeCRAAAA:8 a=xH05H95Wop1-WDW_iRwA:9 a=98DSvwJP-PC3Li7B9DIO:22
X-JNJ: AAAAAAABGcL+1EoTgWG7nTi7OgK8+tnObg/dRlUm1E0h3IBN9YscP22FciUuBtuTuPWhduHgutkKk0qjrn4ZzSgDMFFSQdf9DviqS6i14rz9CL8GD7Nvcvo+wL/QP+wJjvdvFdJn62Syqwu9LIqDj7kVY0jszCRx8XJor4Z8Jhy38vpEq7lfsJPUDo8phR0Lip303HhiGQPq7kVVVuvDRFz1iiKr+vSuu2K5IQUqo064jivPkuekPLh1J+vUGullizKmXhQ6tDDitxy5uF2N67wSki2BPy2EM4Ooqa1tK3vYhy4BHZlUwgGNwtxAU2Z4ylqxlyGHtMohyEjuf5g0HiAX15gfkhw1MI51kPBPUJG01+hXDpqlLzjwjK2q1guGl32ynwoUinXIhqOC7gKeC/fDrly/C5g/RVqgDxm3Tfggi0QwUEJPhX2EXsefQYIvNMFnkiahQ5+hESsGlT+sStNQvaGNdvbjRtFGLxavBwT6mwhZJlF6O1NqBczSsOuKsIqrTr9eqe4im7rWPXJpy+aF7tHpuFhMy4FPI5yMf23aKolqBAnAupPs5JY77AtpuKxfY7Uthb5ozM9nY1zJFTwPoCxOZxE2gZ9SvJZyB4PRyraWpeymMlte/6VaOKxcF0qZkSMaU8DRDPomC9+pj1Mp2FU9Obk86cfl1tjJgjIp6Qrd9iJITg86my1m1BlCCfD2YuSEi7YTREH2Fut1S/88CtQxg7emj8MLMEv8bC8WSW55H+DkcMy58XDH4LA/tvh4Z51qMKkL6dcbTDb+4mPOnAVXXTYVBk1XhwWH35V33NrYkSf1zlPkgLZ1uAgi34Q9swAdLGQV55dfP2U6nq5vPL0bveu0bkZzGCuw7g/iOJGoeQ8NHMK0aYQWybwFVlep+T29Yc2okOFLehmAWC2ug8WZxonkB6Hra2buz3ZXa9YRttvvAYMrOw+WcOhaPaLHOXchvyLlh2ub8sCIkILg0/DmtBN
 AX+OQpzi1zYnUNGlp6uO1+S5G8dhcyMUgElOG04gDAerp4AtIcmJvuCEP1lW8gOHvcKyhnR7jMh9DFwDoM/F3bRPx/mRJ1JS+2fUOMyxH1ptfWWM8AZJnXsg5mtl7XfCYwO0JIaIP/10XXAenrcLRdqGsLzyQ8P4rR3Vh0+KgfLqmo8HXxQmevvP3A0mH8TJ4xuMkKijhsEPZ4CEzfmKYYRs/YR7pD0GzbyWY6TgKvtKTy5LXOBVz1dLEM7ZxsgPGhmPAisx/tQKaXHIe9BD36DG5NLV3kZRkzXCP9nQtDWFAXyDO9CqAeVO+HDPWR16fgafjYADYPAYLQec43sWZYFg29DYAoiesHDA/cKw+yTfh5ccSmSwP9IPVBl0rn0OdDlA+ZUxmGHXW/UfXj9wQ/QV4BpYeTe0=

A failed status or mask read leaves part of the interrupt snapshot
uninitialized. The handler can then interpret that data as headset or
button events. It also attempts register access after a failed runtime
resume.

Check the runtime-PM acquisition and each snapshot read before processing
any events. Use the transparent autosuspend guard so the always-powered
I2C transport continues to work when runtime PM is disabled. Keep the
existing scoped mutex and PM cleanup on every return path.

An extracted-handler fault-injection test reproduces event processing on
failed reads before this change and checks all 24 snapshot read failures
after it, together with resume failure and disabled-runtime-PM cases.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Assisted-by: LLM
Signed-off-by: Ryan Murray <ryan@aurorasilicon.org>
---
 sound/soc/codecs/cs42l42.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index fadf68860..2d1b45ea1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1667,18 +1667,25 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	int ret;
 
-	guard(pm_runtime_active_auto)(cs42l42->dev);
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(cs42l42->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return IRQ_NONE;
 	guard(mutex)(&cs42l42->irq_lock);
 	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
 
-	/* Read sticky registers to clear interurpt */
+	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
-		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
-				&(stickies[i]));
-		regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
-				&(masks[i]));
+		ret = regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
+				  &stickies[i]);
+		if (ret)
+			goto out_error;
+		ret = regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
+				  &masks[i]);
+		if (ret)
+			goto out_error;
 		stickies[i] = stickies[i] & (~masks[i]) &
 				irq_params_table[i].mask;
 	}
@@ -1772,6 +1779,10 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	}
 
 	return IRQ_HANDLED;
+
+out_error:
+	dev_err_ratelimited(cs42l42->dev, "Failed to read jack interrupt state: %d\n", ret);
+	return IRQ_NONE;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
