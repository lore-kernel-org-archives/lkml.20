Received: from outbound.ms.icloud.com (ms-2003e-snip4-1.eps.apple.com [57.103.72.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E523B42F8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110129; cv=none; b=SeFp4tTs5nYZYO84ojVk21SJyCFtuLKyF7WHGDqn/RNE0119mIzfH81Wf9myv8DyIvmL80gOv0MtBs/VdSZaZnITicXPCMgI9ErgxwZukGt98kZmdIlNzuRM0yLJBSH2th1BimmyAyi7Ik+PvRfBw9AvDxWytvezdaME0JZHUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110129; c=relaxed/simple;
	bh=BEuAuym4UsyHC3Ia5dCtau5HnU+nSBEwBzb3ae4yvH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAploqLoSsUKBCDm274svSUcao/DOLOzYYW3nnZ+Ms87jk2shAb/LQvDP8W6SJeLig6wAARSgzaNI0BEPbV3ZCiPpqwNW4sQSNXKy1wrMWOaw8oQlklz9qr2xdyLw8WWMgHsI0hrbNo8BPrxW9EeuwO6S/ZClosx5xh3z5nbZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=albertopimpo.com; spf=pass smtp.mailfrom=albertopimpo.com; dkim=pass (2048-bit key) header.d=albertopimpo.com header.i=@albertopimpo.com header.b=Fdv0vGvg; arc=none smtp.client-ip=57.103.72.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=albertopimpo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=albertopimpo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=albertopimpo.com header.i=@albertopimpo.com header.b="Fdv0vGvg"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-5 (Postfix) with ESMTPS id EA7901800408;
	Sun, 30 Aug 2026 17:15:24 +0000 (UTC)
X-ICL-RepId: 01a053ab-3749-7b34-893c-bad1b353f438
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBLHV4ARQNJCVYCVABLVxQEFVYtVgdQFUsMXB1eBkIfFxtcABcNVk1YFFEIRR9dAFAVQwIZCF0dGQpQUAFLWhVVFw4CQh9QH0wWV0NaGBwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoKXhJcCkcCRwJfAFZWUAJaS18ZXUUPXwdZBEABSwNcAFsKRA5WB14GXAddCFVeCHcKXhJcCkcCRwJfAFZWUAJaVRIEQAhWUFQeQQRWFWwJWAZTGVc=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=albertopimpo.com; s=sig1; t=1788110126; x=1790702126; bh=/PQdvgACE2o+g6IkEljQdipY87Jo8ELWfKTcyPxJrEk=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Fdv0vGvgPwnDdE0CQuzK4OqmtRP9otzewgFFd1P3hIgqKLlOsdiQFcr4nLsDGFnp9w9k4xOLhWNeRMlisbBejeAXPoyyaWO8KYFwKZWbPoS02YFxrEUSpP8Uy4x0684IRBsBlksbA6EQ8R5VXgEfeypEyrWhzy4M2iUg2QxYsG348Bn830Y7iyJM3mViLT8n3UZbyxovVk2KkO8+jX0riyno4XcGlrx976qiT6k2NaWq3OgWjZUX0fXISyvbaOlJBzKF4lWJB+eskAGKsLwFyQJytEww2LHEJIpIxQIl65Q+Q0k4Wg4/ORX7e4jzF1VLocOSUqdoTfV+SRGOmIJQKg==
mail-alias-created-date: 1786285329818
Received: from ubuntumacvm (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-5 (Postfix) with ESMTPSA id 1079C180030E;
	Sun, 30 Aug 2026 17:15:21 +0000 (UTC)
From: Alberto Pimpo <me@albertopimpo.com>
To: dwlsalmeida@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alberto Pimpo <me@albertopimpo.com>
Subject: [PATCH] media: vidtv: validate the frequency module parameters
Date: Sun, 30 Aug 2026 17:08:47 +0000
Message-ID: <20260830170847.43175-1-me@albertopimpo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qvZ--IE6VyAgQLMPRKCz0_7HRgR9u5nA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE1MSBTYWx0ZWRfX1HAL/YADbZY7
 DCIZrUTu/2AY2n/a19gpmVWkywhz5rCi05cWDsq/wpYy8D6a+ZBi40OK+QKJlVBs/RYrWbMk4NG
 Mt2hZlP/+pLgM7+hjEDzKcQtQAFJoYdZimGj54yWqsHlqnK1/RbEYJCHgYqc/sZBOKPK3/eYhkT
 oSlPBkv2MA2l2se0g9g7ri2fze1q6iuRObPiAakrbqj5+gtj54TruPZXfMDkK3GZpt85lezALcX
 ESx4Y4cGc9MeKPtWgMMqCdsPkifp1PuQRlZgbJnM79TRkeEU4lckEUSJUZa095jYkVjBIsS0dIz
 P4i55uh9roU3vV0BbU9CNlO36a1bip1qTAjTYif7Oqxrokq8NGOdXhcJr5fztA=
X-Proofpoint-GUID: qvZ--IE6VyAgQLMPRKCz0_7HRgR9u5nA
X-Authority-Info-Out: v=2.4 cv=cdffb3DM c=1 sm=1 tr=0 ts=6a94652d
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=clVqxvNCAAAA:8 a=dQkeq5CGmAAQs0QBx38A:9 a=uPQ7wDaL34lJzY1hCFs5:22
X-JNJ: AAAAAAABQg7K3pv+AhDTCgQptbgPbLCqf3nuErCBaliVipJeVhdq7lxthaJwmSs7A5+ggvqlwWgty5Doc2is2OwfM36vB/ShCl7bkCBSobH2Sr2sA56JHEJNojhwgWmpJF6q5Q18V8+T2PfYILeG9lycSgabe+qRtJXrVKoPhBfu6gXxlgM6vlBWgirgB7yk8Jt7pbllHIvJ1JXW1GSAv7bdY80ZBvxxx5kOL1qSfxch2jyyLQzekIo1LVw2yefRMAA70EtSvDhH+UOhiw39q4CYrQjT6TY5lGU2gWnLNaS9SFZf72GLuEALKAjvNYKR+RWkSkHrFqCZRbK34a4De21cjLC2M1ONK+xzVqaqza37B2N5arAlx/e32tHCeA4ZZUV0DfN+Mq6D/PRWILF/dNagAcnKlMtXIqMVX+IzCicsLnHlTkHwqMnM2k4D/1woGfE8KtpuYjzvu3YVWZzevyHqIWMtDvGvl6VIsXqPyAupwJZtmh05VaETe1FMA+MQbmwBajM+uCorVHJ2vynUbA5n9HDU/+f2xlShsSwuhdEusoLzs6tNqMjdVWWe+c7qwzJwM2c7FzNXuyEGsHGLZnPDJQ0O48aynpDxyuMGtY/dZZhpX97IthD4eXlp+389sMJznREDEVa3A+zbq/5OJPPKuFlJcl+3ZppgO6PXu9gIHjgHnvmteiXZcFLvijWcZ/Du5WqYr9h/VUiFLb02Gn24/1AfbEKQ37w4PhE3T1vhl4tJvpy+FU1dMkekUXMecFiyKQ99V0LquKDgXKnJ3OIBcADW5csj+IKn+qUu6s2xyLSvanAwvn3vJ0OYJMPH57BCsjtlQmevMLkQqGuVoGasYhM6Z6zPwMfUisGQl2CppNJiSRypJ9gIsDku++Ig9/MFg7v+UUGZd5j8uTWsTjr+GEK5cLZU0Zqd9iMcCEehBgdptjLVo5jLPiZPXFAWJZkfXLV9POrfnfFitOfpWjUOQ2CrAIp
 sAYZLuN8Wl71SF/Me1FPuKl88IKgXKjnpNTVFf9a7/v86cKKAMGlba/k+aCo95zkNVCy/uixNATX36EFy/behLPS54LwgHth1LHldqFkhGJndTmlb9P4Xn6g68k0JCDb66g8RZkoGQvllLOrU+kDmZeVopkBSZQqBhjS4YsQAUiDtngZkqo1rZGmYTdVtzqvKCGZ34pDu8fCCBEtI+Wyjo0mAJ3btgmI/Ur0GPHJ7KE3FxSm0HuXH9civTy83XRfudMHO

The lists of frequencies the simulated tuner locks onto are module
parameters, and were handed over to the tuner module without being
checked first.

A terrestrial or cable frequency outside the range the demodulator
reports to the DVB core is unreachable, as dvb_frontend_check_parameters()
rejects such a tuning request before the tuner is ever asked about the
frequency. A satellite frequency outside the Ku-band covered by the
simulated LNBf is equally meaningless, since it is downconverted using
the LNBf local oscillators before reaching the tuner.

In both cases vidtv used to initialize successfully and then never lock
on anything, leaving no clue about the cause.

Check the terrestrial and cable frequencies against the range advertised
by the demodulator, and the satellite ones against the Ku-band covered by
the simulated LNBf, failing the probe with an explicit error message
otherwise.

Signed-off-by: Alberto Pimpo <me@albertopimpo.com>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fd69b4ee16f4..37e9b1e8e793 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -44,6 +44,10 @@
 #define LNB_LOW_FREQ		9750000		/* low IF frequency */
 #define LNB_HIGH_FREQ		10600000	/* transition frequency */
 
+/* The Ku-band range covered by such an LNBf, in kHz */
+#define LNB_KU_BAND_MIN_FREQ	10700000
+#define LNB_KU_BAND_MAX_FREQ	12750000
+
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0444);
 MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
@@ -367,6 +371,36 @@ static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
 	return 0;
 }
 
+/*
+ * Reject frequencies the simulation could never tune into, as the module
+ * would otherwise load just fine and then never lock on anything, leaving
+ * no clue about what went wrong.
+ */
+static int vidtv_bridge_check_freqs(struct vidtv_dvb *dvb,
+				    const unsigned int *freqs,
+				    u32 array_sz,
+				    u32 min_freq,
+				    u32 max_freq,
+				    const char *name)
+{
+	u32 i;
+
+	for (i = 0; i < array_sz; i++) {
+		/* a zeroed entry means an unused slot */
+		if (!freqs[i])
+			continue;
+
+		if (freqs[i] < min_freq || freqs[i] > max_freq) {
+			dev_err(&dvb->pdev->dev,
+				"%s[%u]: %u is out of range (%u..%u)\n",
+				name, i, freqs[i], min_freq, max_freq);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 {
 	struct vidtv_tuner_config cfg = {
@@ -374,10 +408,45 @@ static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 		.mock_power_up_delay_msec = mock_power_up_delay_msec,
 		.mock_tune_delay_msec     = mock_tune_delay_msec,
 	};
+	u32 min_freq = dvb->fe[n]->ops.info.frequency_min_hz;
+	u32 max_freq = dvb->fe[n]->ops.info.frequency_max_hz;
 	u32 freq;
+	int ret;
 	int i;
 
-	/* TODO: check if the frequencies are at a valid range */
+	/*
+	 * Terrestrial and cable frequencies are given in Hz and are used as
+	 * is, so they have to fit within the range the demod reports to the
+	 * DVB core: the core rejects a tuning request outside of it before
+	 * the tuner is ever asked about the frequency.
+	 */
+	ret = vidtv_bridge_check_freqs(dvb, vidtv_valid_dvb_t_freqs,
+				       ARRAY_SIZE(vidtv_valid_dvb_t_freqs),
+				       min_freq, max_freq,
+				       "vidtv_valid_dvb_t_freqs");
+	if (ret)
+		return ret;
+
+	ret = vidtv_bridge_check_freqs(dvb, vidtv_valid_dvb_c_freqs,
+				       ARRAY_SIZE(vidtv_valid_dvb_c_freqs),
+				       min_freq, max_freq,
+				       "vidtv_valid_dvb_c_freqs");
+	if (ret)
+		return ret;
+
+	/*
+	 * Satellite frequencies are given in kHz at Ku-band and are
+	 * downconverted below, so check them against the band the simulated
+	 * LNBf covers instead. Doing so also ensures that the frequencies
+	 * are above the LNBf local oscillators.
+	 */
+	ret = vidtv_bridge_check_freqs(dvb, vidtv_valid_dvb_s_freqs,
+				       ARRAY_SIZE(vidtv_valid_dvb_s_freqs),
+				       LNB_KU_BAND_MIN_FREQ,
+				       LNB_KU_BAND_MAX_FREQ,
+				       "vidtv_valid_dvb_s_freqs");
+	if (ret)
+		return ret;
 
 	memcpy(cfg.vidtv_valid_dvb_t_freqs,
 	       vidtv_valid_dvb_t_freqs,
-- 
2.53.0

