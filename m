Received: from outbound.qs.icloud.com (qs-2006a-snip4-11.eps.apple.com [57.103.85.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3D471431
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629836; cv=none; b=V4Z+PNTq3YYhF1M8WiAoZzk2a0LW8Sc1WIZceBqjqjPT8KC2FVubkepq8w752fP2MT7Nf7lFmHYaUuvWYleLLKJc64CjqCzAVhJNUOmH72CzcnY5JzIDdkSF6nkit///o9cn0c7fQf28I2dtr8TGpLADZYYddGunkcSGjWqdZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629836; c=relaxed/simple;
	bh=c5d9wVHghXAs3fldwRdBDEV9dgh79bdF4SijC5h1xlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phTx+EJfo0ZnQu3enUWlgnWIdyhpFOQg94fx9oWWMmRcevrSUDb+RKDqKOhfq5jygp0CNMLj1NSYbhopaj4VVPQLugRYmDOs/5ZKWPz/vrt5OZ+TpS2rLvVbN66ddyazkIo+24H/q3xM8iMuA4thTPqEXFJH5zAKynyeCxdPXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org; spf=pass smtp.mailfrom=aurorasilicon.org; dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b=YlHVUkf0; arc=none smtp.client-ip=57.103.85.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b="YlHVUkf0"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-9 (Postfix) with ESMTPS id BB2B8180015A;
	Thu, 17 Sep 2026 07:23:51 +0000 (UTC)
X-ICL-RepId: 01a0ae40-19e4-7295-baca-e6a793b45cef
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFPHVwFWhxCDUEdXANYEhVdRUEUVgVyEUwKXB9WGFscUBtcAxkEQBcZHldQVh5AH0sZQARbAlEfV1ZcH1BLQBMESQFNXw5eHwQXRhlVBEceXVZCHhkCURxWDVdDVARfUEkMQVBsWgBHF0gdXRlZb1BdHA4MQhldAlgLWgFeCF0eFxdBChcGWxQERFVbAw8KEQwaUlUACgBDAUkEWgJdBkABSQQOBV8HFQFPAQxVUlMTCBkdXABTC0YLSABeA0VVGU1WQRRWBXIRTApcH1YYWxxQG1wDGQRAFwdYRxRHDg8TTAtHAlo0Vh9UGVoD
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurorasilicon.org; s=sig1; t=1789629833; x=1792221833; bh=SN67ss+oaOyYTZGpxW9XKmUD0sh/EGH78bfhp/3LrEY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=YlHVUkf0u16XqNH3XhbmVQirHSk2RTVEY2YXZjhlZ70q2vqJq0hoQ+ZYI1lYMjNK0zLfhnj0TWv1nOTgo4uhqXZWQak5cWqFK0vVUYHBiTzD/Oe/jUF8dMs3CJ5miCBhxhykz9JIT4yxETDK4CnfKRCkxxYjs73dmMXimqrCx8GQOF2ociBNNp6lh/olNbKVLz62Zg9UjwhSl+NqRaV56Y+qY8VgKhxHfcajvquT8/wV06RtUGGGyf7b6Q+C6y9WZnfn+ihzEnESVcGyD3t4r4WPG3yLW9cnLPRAq4Ha1jUkqsHziv+XCiv1clXgCgJxdQ8jQ6eU273o7AOwT5M9Yg==
mail-alias-created-date: 1786334582283
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-9 (Postfix) with ESMTPSA id 327171800108;
	Thu, 17 Sep 2026 07:23:47 +0000 (UTC)
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
Subject: [RFC PATCH 2/2] ASoC: cs42l42: support Apple headset remotes on CS42L83
Date: Thu, 17 Sep 2026 17:23:44 +1000
Message-ID: <f64d8a5ba87a2381775640817c245e872ab9ac1a.1789620334.git.ryan@aurorasilicon.org>
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
X-Proofpoint-ORIG-GUID: Ohcgxlyr_NSAoWeyYpPgOwbIcpIfEong
X-Authority-Info-Out: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6aab9588
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CKCxWeCRAAAA:8 a=iiW-TkCOkVL_QCY16vAA:9 a=98DSvwJP-PC3Li7B9DIO:22
X-Proofpoint-GUID: Ohcgxlyr_NSAoWeyYpPgOwbIcpIfEong
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5OSBTYWx0ZWRfX0g6arNLUEdXY
 KmMjOmK0huZTNkjEQufVHZz8w5MIvHqd4upb78pGI1dCChHzhvY2gds/iYAVGf3uSNJbHty5TiZ
 a+vfsrPHpnhKzGPZgZSrW369GzaJQwFPFnYCy2lYGe7b0wDludpW8saccnJiXGz5TA+O9ItYVcx
 hBSt5S7z21H35VHB7aSLVhHcLpSpo4Q3p3UFNU+ObPm3AkxqvYM2/W440M3UU//pcClkqRrB995
 ZxFVDLVpjEfR7DHQnn+Zaecgtp+3BXAqT/7NLUf4bvVvcToLliumC4An1lt0b7dm3wpiFyyaOib
 R3hQ5oAf9rWctmw22fATsaBCU1Ftc6eRo0dQyicGDro7LsJsemuKEVEVk1alcA=
X-JNJ: AAAAAAABi9kWgPWl95JD7tpMI19F1fsZnnRhZtUZTtPV37K+c42kv50Fmss5WBuz1Urqxq6J1EsrOU25GfC0aLmIIiVazBbDXfvZXLs6KH0WAqHBP8H5+DV5jd7NHQtxgavG+qWppRMoTnwW44N/9N4s8PtOMRWODw9AxGWjeVp9wGyaz0lp0EuEBozv337K9Vd7hw00XqiBtB+ax/ORSQuiObSY68LvNEv7YMFYj9i0zNchb8PrEXZmTcnU84SpmBOCMwa+ZMWsyo0lWDmZP8M0WNmfvS8jQbo5ZUJA+y0cNA2AA2TEhmq5sfh9/mcUigQ+aZgzGi/GQ8orhiCRZ0nnzvpkMvd0UHo0LVW1S3NRJPTxHdpfFEHzZ5nVmO1yF4ZnxZnQ9G+Saocl2gYkFRhrXINgjeD1JN4IAdhpClHKU9sPYI6UGIEsWRKqNzcl9B9dx88ZjcKpMasSR9BUcMdgspNqEDZBq+FzjcfL+m+3fiqQ/NyGjxQmz81N3GGCaSLdHnQVjqQT6gCxrQOwPfnYze4dob6no/8cGv6jliNeglejb43TLC+9ulsjKueI9xpXRduekqFq3cBYRFCBG96RkOXjqnCC9GhGxdJU9n5COJkt0wnAuGxMpS2lK0RzddYxau04cE9McNa9WVWfOi2DRqUG79INsBYdBboTmdQhqlzYIzLGd8YM1TsRBWbjH9p0BTfBMQYzWcmJPi7vuZhz8mFCaujMktptxcRDGIQD/bMiVy2NEJ+jkWBeSDve/lDEZbmM/uMTqLyrTthxg/nJwcPGr1YIRDeIQx7en6xBZkooB+UkAa1a3V9jTBFGRn8LcGInMaBv8J3pGNand8PkoZJFGw4/4KWSbk902HM/qjEuUkU5K8XjMTlKMMlBw7UGgt+LGZuuPrcH+QBKOueU1RM93Ko1gCt8FVldUwxposyoypq57vIUUVcIRzmOLEmG24sgGGxFIiOgJqD/jJizF/KKiUd
 9UmYBhlMcXWNU0oNUvRAA7WIG/XATZH4LrTQ93V09ABylafGWV3A5L5bQ/X7pbXdmwCrp5qJ5YRzljPYgCHukYREEgkLZqk3Zgfe/Ry5VM91Veext0plac9w4mpDK4FFu9f29LhQAl5iiLddXZddy4GgCu0iDukQqS8srBnfF5XmDdvtrC1P/s9k4Rb1xnfQIbr2RBZuaZWWbCFH14wmc2P1SmU+divOumXAOnlaK/+SUk65L8VjG9fEp6IxEoLWd6WEnH+MdsEvznSAcwQ++wPbqvOf/ly+kkFeVmWn2aTd7I6hhaahW3hi2ZOWP/I4m2bsA7l8B9xKwjk1ojnAZqxqZ7sBEWTMbkytHS3Zy1qheA0jnhL2Tez34TqOqVLY767Qp2nkj3X680zKKn+Vp0BuaKXuqFMHflBAId7WcGS0k/iePrHzBtuE=

Apple wired headset volume buttons use a microphone-bias signalling
protocol instead of the resistor levels handled by the analogue detector.
The CS42L83 can identify these remotes and decode their button indications
without an audio stream or an external serial clock.

After CTIA or OMTP detection, perform a bounded identification exchange on
CS42L83. Wait for the receive acknowledgment rather than the earlier
transmit-complete indication, which can expose an incomplete identifier.
Validate all three identifier symbols before enabling remote reception.
Restore the analogue detector on timeout, a short, an invalid identifier,
or a register-access error.

Preserve the receiver's raw volume indications before applying the
analogue interrupt masks. Report volume indications as press/release
pairs and use short-detect transitions for the centre button. Discard
pre-identification button state and restore the saved detector settings
on unplug, redetection and suspend under the existing IRQ mutex.

Select this capability from the CS42L83 device identity. No board-specific
property, clock provider, work item or extra power reference is needed.
The CS42L42 continues to use its analogue detector.

The undocumented CS42L83 sequence was independently implemented from
register-level reverse engineering and validated on a J700 with a B0
codec and Apple wired earbuds. Other boards and codec revisions have not
been hardware-tested. The machine driver must expose the appropriate
SND_JACK_BTN capabilities and key mappings.

Assisted-by: LLM
Signed-off-by: Ryan Murray <ryan@aurorasilicon.org>
---
 sound/soc/codecs/cs42l42.c | 263 ++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs42l42.h |  15 +++
 2 files changed, 276 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2d1b45ea1..c510ceae8 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
@@ -1257,6 +1258,240 @@ static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 				(CS42L42_HSDET_COMP2_LVL_DEFAULT << CS42L42_HSDET_COMP2_LVL_SHIFT));
 }
 
+/*
+ * CS42L83 receives Apple headset remote data over the microphone-bias line.
+ * The receiver operates on the internal oscillator, including while audio
+ * is idle. These control values and status bits are specific to CS42L83.
+ */
+#define CS42L83_REMOTE_TX_START		BIT(7)
+#define CS42L83_REMOTE_RX_ACK		BIT(3)
+#define CS42L83_REMOTE_BUTTON_IRQ		BIT(5)
+#define CS42L83_REMOTE_BUTTONS		GENMASK(4, 0)
+#define CS42L83_REMOTE_VOLUME_DOWN	BIT(0)
+#define CS42L83_REMOTE_VOLUME_UP		BIT(1)
+
+/* Complete receiver control values; these are not CS42L42 detect modes. */
+#define CS42L83_REMOTE_BIAS_RESET		0x03
+#define CS42L83_REMOTE_BIAS_IDENTIFY	0x9e
+#define CS42L83_REMOTE_BIAS_BUTTONS	0x5f
+#define CS42L83_REMOTE_RX_CONFIG		0x8f
+#define CS42L83_REMOTE_LEVEL_IDENTIFY	0x36
+#define CS42L83_REMOTE_LEVEL_BUTTONS	0x3c
+
+static const unsigned int cs42l83_remote_regs[] = {
+	[CS42L83_REMOTE_SAVED_HSBIAS_SC_AUTOCTL] = CS42L42_HSBIAS_SC_AUTOCTL,
+	[CS42L83_REMOTE_SAVED_WAKE_CTL] = CS42L42_WAKE_CTL,
+	[CS42L83_REMOTE_SAVED_MISC_DET_CTL] = CS42L42_MISC_DET_CTL,
+	[CS42L83_REMOTE_SAVED_MIC_DET_CTL1] = CS42L42_MIC_DET_CTL1,
+	[CS42L83_REMOTE_SAVED_MIC_DET_CTL2] = CS42L42_MIC_DET_CTL2,
+	[CS42L83_REMOTE_SAVED_DET_INT1_MASK] = CS42L42_DET_INT1_MASK,
+	[CS42L83_REMOTE_SAVED_DET_INT2_MASK] = CS42L42_DET_INT2_MASK,
+	[CS42L83_REMOTE_SAVED_HS_BIAS_CTL] = CS42L42_HS_BIAS_CTL,
+	[CS42L83_REMOTE_SAVED_HSDET_CTL2] = CS42L42_HSDET_CTL2,
+};
+
+static void cs42l83_remote_restore(struct cs42l42_private *cs42l42)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(cs42l83_remote_regs); i++) {
+		ret = regmap_write(cs42l42->regmap, cs42l83_remote_regs[i],
+				   cs42l42->remote_saved[i]);
+		if (ret)
+			dev_warn(cs42l42->dev, "Failed to restore headset detection register %#x: %d\n",
+				 cs42l83_remote_regs[i], ret);
+	}
+	cs42l42->remote_active = false;
+}
+
+/*
+ * Hold the bias reference during a bias-mode change and allow it to settle
+ * before starting transmission. Apply the TX bit only after the bias bits.
+ */
+static int cs42l83_remote_set_detect(struct cs42l42_private *cs42l42, unsigned int value)
+{
+	unsigned int old;
+	bool changed;
+	int ret;
+
+	ret = regmap_read(cs42l42->regmap, CS42L42_MISC_DET_CTL, &old);
+	if (ret)
+		return ret;
+	changed = (old & CS42L42_HSBIAS_CTL_MASK) != (value & CS42L42_HSBIAS_CTL_MASK);
+	if (changed) {
+		/* CS42L83 bias transitions require clearing this undocumented field. */
+		ret = regmap_update_bits(cs42l42->regmap, CS42L42_HS_BIAS_CTL, GENMASK(3, 2), 0);
+		if (ret)
+			return ret;
+		ret = regmap_update_bits(cs42l42->regmap, CS42L42_HSDET_CTL2,
+					 CS42L42_HSBIAS_REF_MASK, CS42L42_HSBIAS_REF_MASK);
+		if (ret)
+			return ret;
+	}
+	ret = regmap_update_bits(cs42l42->regmap, CS42L42_MISC_DET_CTL,
+				 value & CS42L83_REMOTE_TX_START ? 0x7f : 0xff, value);
+	if (ret)
+		return ret;
+	if (!!(old & BIT(2)) != !!(value & BIT(2)))
+		usleep_range(10000, 11000);
+	if (value & CS42L83_REMOTE_TX_START) {
+		ret = regmap_write(cs42l42->regmap, CS42L42_MISC_DET_CTL, value);
+		if (ret)
+			return ret;
+	}
+	if (changed)
+		return regmap_update_bits(cs42l42->regmap, CS42L42_HSDET_CTL2,
+					  CS42L42_HSBIAS_REF_MASK, 0);
+	return 0;
+}
+
+/* Called with irq_lock held; every attempt is bounded and has analogue fallback. */
+static void cs42l83_remote_start(struct cs42l42_private *cs42l42)
+{
+	static const struct reg_sequence identify[] = {
+		{ CS42L42_DET_INT2_MASK, 0xff },
+		{ CS42L42_HSBIAS_SC_AUTOCTL, 0x03 },
+		{ CS42L42_WAKE_CTL, CS42L42_M_HP_WAKE_MASK | CS42L42_M_MIC_WAKE_MASK },
+		{ CS42L42_MIC_DET_CTL2, CS42L83_REMOTE_RX_CONFIG },
+	};
+	unsigned int int1, int2, status1, status2, symbols, symbol[3];
+	unsigned long deadline;
+	int i, ret;
+
+	if (cs42l42->devid != CS42L83_CHIP_ID ||
+	    (cs42l42->hs_type != CS42L42_PLUG_CTIA &&
+	     cs42l42->hs_type != CS42L42_PLUG_OMTP))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(cs42l83_remote_regs); i++) {
+		ret = regmap_read(cs42l42->regmap, cs42l83_remote_regs[i],
+				  &cs42l42->remote_saved[i]);
+		if (ret)
+			return;
+	}
+
+	ret = regmap_multi_reg_write(cs42l42->regmap, identify, ARRAY_SIZE(identify));
+	if (ret)
+		goto fallback;
+	/* Reset the bias before applying the identification threshold. */
+	ret = cs42l83_remote_set_detect(cs42l42, CS42L83_REMOTE_BIAS_RESET);
+	if (ret)
+		goto fallback;
+	usleep_range(10000, 11000);
+	ret = regmap_update_bits(cs42l42->regmap, CS42L42_MIC_DET_CTL1,
+				 CS42L42_HS_DET_LEVEL_MASK, CS42L83_REMOTE_LEVEL_IDENTIFY);
+	if (ret)
+		goto fallback;
+	ret = regmap_read(cs42l42->regmap, CS42L42_DET_INT_STATUS1, &int1);
+	if (ret)
+		goto fallback;
+	ret = regmap_read(cs42l42->regmap, CS42L42_DET_INT_STATUS2, &int2);
+	if (ret)
+		goto fallback;
+	/* Start identification after the controlled bias rise. */
+	ret = cs42l83_remote_set_detect(cs42l42, CS42L83_REMOTE_BIAS_IDENTIFY);
+	if (ret)
+		goto fallback;
+
+	/*
+	 * Bit 4 signals TX completion, before the remote reply is ready. Wait
+	 * for RX acknowledgment (bit 3), with a bounded analogue fallback.
+	 */
+	msleep(35);
+	deadline = jiffies + msecs_to_jiffies(500);
+	do {
+		ret = regmap_read(cs42l42->regmap, CS42L42_DET_INT_STATUS2, &int2);
+		if (ret)
+			goto fallback;
+		if (int2 & CS42L83_REMOTE_RX_ACK)
+			break;
+		usleep_range(5000, 6000);
+	} while (time_before(jiffies, deadline));
+	if (!(int2 & CS42L83_REMOTE_RX_ACK)) {
+		ret = -ETIMEDOUT;
+		goto fallback;
+	}
+	ret = regmap_read(cs42l42->regmap, CS42L42_DET_INT_STATUS1, &int1);
+	if (ret)
+		goto fallback;
+	ret = regmap_read(cs42l42->regmap, CS42L42_DET_STATUS1, &status1);
+	if (ret)
+		goto fallback;
+	ret = regmap_read(cs42l42->regmap, CS42L42_DET_STATUS2, &status2);
+	if (ret)
+		goto fallback;
+	symbols = (status2 >> 4) | ((status1 & 0x1f) << 4);
+	for (i = 0; i < ARRAY_SIZE(symbol); i++)
+		symbol[i] = (symbols >> (i * 3)) & 7;
+	/* A short or an invalid identifier must retain the analogue detector. */
+	if (status2 & CS42L42_SHORT_TRUE_MASK) {
+		ret = -ENODEV;
+		goto fallback;
+	}
+	for (i = 0; i < ARRAY_SIZE(symbol); i++) {
+		if (symbol[i] < 1 || symbol[i] > 4) {
+			ret = -ENODEV;
+			goto fallback;
+		}
+	}
+
+	/* Use the remote-button threshold only after a valid identification. */
+	ret = regmap_update_bits(cs42l42->regmap, CS42L42_MIC_DET_CTL1,
+				 CS42L42_HS_DET_LEVEL_MASK, CS42L83_REMOTE_LEVEL_BUTTONS);
+	if (ret)
+		goto fallback;
+
+	/* The receiver now decodes remote button pulses autonomously. */
+	ret = cs42l83_remote_set_detect(cs42l42, CS42L83_REMOTE_BIAS_BUTTONS);
+	if (ret)
+		goto fallback;
+	msleep(35);
+	ret = regmap_write(cs42l42->regmap, CS42L42_HSBIAS_SC_AUTOCTL,
+			   (cs42l42->hs_bias_sense_en << CS42L42_HSBIAS_SENSE_EN_SHIFT) | 3);
+	if (ret)
+		goto fallback;
+	ret = regmap_write(cs42l42->regmap, CS42L42_DET_INT1_MASK,
+			   cs42l42->remote_saved[CS42L83_REMOTE_SAVED_DET_INT1_MASK] &
+			   ~(cs42l42->hs_bias_sense_en << CS42L42_HSBIAS_SENSE_SHIFT));
+	if (ret)
+		goto fallback;
+	ret = regmap_write(cs42l42->regmap, CS42L42_DET_INT2_MASK,
+			   0xff & ~(CS42L83_REMOTE_BUTTON_IRQ |
+				    CS42L42_M_SHORT_DET_MASK | CS42L42_M_SHORT_RLS_MASK));
+	if (ret)
+		goto fallback;
+	cs42l42->remote_active = true;
+	dev_dbg(cs42l42->dev, "Apple headset remote enabled\n");
+	return;
+
+fallback:
+	dev_dbg(cs42l42->dev, "Headset remote identification failed: %d\n", ret);
+	cs42l83_remote_restore(cs42l42);
+}
+
+static void cs42l83_remote_buttons(struct cs42l42_private *cs42l42,
+				 unsigned int int1, unsigned int int2)
+{
+	unsigned int buttons = 0;
+
+	/* Volume indications are pulses, without a separate release event. */
+	if (int1 & CS42L83_REMOTE_BUTTONS) {
+		if (int1 & CS42L83_REMOTE_VOLUME_DOWN)
+			buttons |= SND_JACK_BTN_2;
+		if (int1 & CS42L83_REMOTE_VOLUME_UP)
+			buttons |= SND_JACK_BTN_1;
+		if (buttons)
+			snd_soc_jack_report(cs42l42->jack, buttons,
+					    SND_JACK_BTN_1 | SND_JACK_BTN_2);
+		snd_soc_jack_report(cs42l42->jack, 0,
+					    SND_JACK_BTN_1 | SND_JACK_BTN_2);
+	}
+	if (int2 & CS42L42_M_SHORT_DET_MASK)
+		snd_soc_jack_report(cs42l42->jack, SND_JACK_BTN_0, SND_JACK_BTN_0);
+	if (int2 & CS42L42_M_SHORT_RLS_MASK)
+		snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_BTN_0);
+}
+
 static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 {
 	unsigned int hs_det_status;
@@ -1398,6 +1633,9 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 
 static void cs42l42_init_hs_type_detect(struct cs42l42_private *cs42l42)
 {
+	if (cs42l42->remote_active)
+		cs42l83_remote_restore(cs42l42);
+
 	/* Mask tip sense interrupts */
 	regmap_update_bits(cs42l42->regmap,
 				CS42L42_TSRS_PLUG_INT_MASK,
@@ -1485,6 +1723,9 @@ static void cs42l42_init_hs_type_detect(struct cs42l42_private *cs42l42)
 
 static void cs42l42_cancel_hs_type_detect(struct cs42l42_private *cs42l42)
 {
+	if (cs42l42->remote_active)
+		cs42l83_remote_restore(cs42l42);
+
 	/* Mask button detect interrupts */
 	regmap_update_bits(cs42l42->regmap,
 		CS42L42_DET_INT2_MASK,
@@ -1664,6 +1905,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	struct cs42l42_private *cs42l42 = (struct cs42l42_private *)data;
 	unsigned int stickies[12];
 	unsigned int masks[12];
+	unsigned int raw_remote_buttons = 0;
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
@@ -1686,8 +1928,11 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				  &masks[i]);
 		if (ret)
 			goto out_error;
-		stickies[i] = stickies[i] & (~masks[i]) &
-				irq_params_table[i].mask;
+		if (cs42l42->remote_active && i == 6)
+			raw_remote_buttons = stickies[i] & CS42L83_REMOTE_BUTTONS;
+		stickies[i] &= ~masks[i];
+		if (!(cs42l42->remote_active && i == 7))
+			stickies[i] &= irq_params_table[i].mask;
 	}
 
 	/* Read tip sense status before handling type detect */
@@ -1709,6 +1954,13 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
+			if (cs42l42->devid == CS42L83_CHIP_ID) {
+				cs42l83_remote_start(cs42l42);
+				/* Do not interpret pre-identification events as keys. */
+				current_button_status = 0;
+				stickies[7] = 0;
+				raw_remote_buttons = 0;
+			}
 			switch (cs42l42->hs_type) {
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
@@ -1759,6 +2011,11 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 		}
 	}
 
+	if (cs42l42->remote_active && cs42l42->plug_state == CS42L42_TS_PLUG) {
+		cs42l83_remote_buttons(cs42l42, raw_remote_buttons, stickies[7]);
+		return IRQ_HANDLED;
+	}
+
 	/* Check button detect status */
 	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
 		if (!(current_button_status &
@@ -2169,6 +2426,8 @@ int cs42l42_suspend(struct device *dev)
 	 * is shared.
 	 */
 	scoped_guard(mutex, &cs42l42->irq_lock) {
+		if (cs42l42->remote_active)
+			cs42l83_remote_restore(cs42l42);
 		cs42l42->suspended = true;
 
 		/* Save register values that will be overwritten by shutdown sequence */
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 3d85ebc59..1065d8cd6 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -24,6 +24,19 @@
 #include <sound/soc-component.h>
 #include <sound/soc-dai.h>
 
+enum cs42l83_remote_saved_reg {
+	CS42L83_REMOTE_SAVED_HSBIAS_SC_AUTOCTL,
+	CS42L83_REMOTE_SAVED_WAKE_CTL,
+	CS42L83_REMOTE_SAVED_MISC_DET_CTL,
+	CS42L83_REMOTE_SAVED_MIC_DET_CTL1,
+	CS42L83_REMOTE_SAVED_MIC_DET_CTL2,
+	CS42L83_REMOTE_SAVED_DET_INT1_MASK,
+	CS42L83_REMOTE_SAVED_DET_INT2_MASK,
+	CS42L83_REMOTE_SAVED_HS_BIAS_CTL,
+	CS42L83_REMOTE_SAVED_HSDET_CTL2,
+	CS42L83_REMOTE_NUM_SAVED_REGS,
+};
+
 struct  cs42l42_private {
 	struct regmap *regmap;
 	struct device *dev;
@@ -51,6 +64,8 @@ struct  cs42l42_private {
 	u8 hs_bias_ramp_time;
 	u8 hs_bias_sense_en;
 	u8 stream_use;
+	bool remote_active;
+	unsigned int remote_saved[CS42L83_REMOTE_NUM_SAVED_REGS];
 	bool hp_adc_up_pending;
 	bool suspended;
 	bool sdw_waiting_first_unattach;
