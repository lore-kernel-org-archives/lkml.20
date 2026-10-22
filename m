Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.236.72.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689836;
	b=xcIx0OlFz40tAAflj6pEPs7GR3bXt69+pIO0gvLsx7n8f+IfqyiQSoHW9mmXIy4RXoSY
	 66qRkQ4cFSnOtlyaiHl2YG+1FHflls0m+k3oRQg59zVF7YRP7cp67f0UDoDXp8jQr0hQ9
	 7UjJTm8/lYEC8IdLMUNgHqO9h2PBh1VdIotvUyVHIJsHVtDlwr6LHxcKH/LPeKRkfHUsb
	 M9qrwaice8p4nGN19PYnNx9wAb67FfrnW6pBUPtLZq4DHURqCOq1P+x8QqDzCpP/91q1U
	 hrODp6YieswxWMa7VQj1DL1OwUjfqBJxYQi2XAba/85eTtjnxsCrvWui6lp4GUknYUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689836;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pwrLkLSsVrh1H3W7ILEp/p+Y3LJm4BbREMqVGNd3cic=;
	b=1BI6YBhjbGOeHd6U4K9YCCXmYFPkzdVbjvReFAPXWlQNW+z9gavN3Bd2uT0UmP3k7uuV
	 4evq3p1hdSxn6Z5Ev6zhsLmyMsB+2MOrK7Gz/zbdf//OouRL45lb1JgqZpJUqLNV7uyt3
	 H3nw45FOB6LbsX+QfJfyUN2nlBWrTkqJjLW+Zlif3NXEMQ/OmaNsRdlTUfKkgHIjsUHJ1
	 +7KLfv1avAyYapXq38atZbJ2MguPa21nR0lFwX1XL8FjB+uAFu6ouxKkF76Qnuk3b4tye
	 C4xiIV8Se/LoOanTXtwBueBLQ3sNG6eNlcfCAP/mVNBYAYH1OEGqRFl3HyvAvls2DuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tpz.ru;
	spf=pass smtp.mailfrom=tpz.ru;
	arc=none smtp.remote-ip=109.236.72.118
Received: from mx1.tpz.ru (mx1.tpz.ru [109.236.72.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9AC606A319;
	Thu, 22 Oct 2026 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9AC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tpz.ru
Received: from lvc.d-systems.local (unknown [109.236.68.122])
	by mx1.tpz.ru (Postfix) with ESMTPSA id 4j9Y0S19NTz10QYQ;
	Thu, 22 Oct 2026 20:23:52 +0300 (MSK)
From: Ilya Krutskih <devsec@tpz.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ilya Krutskih <devsec@tpz.ru>,
	lvc-project@linuxtesting.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: drx39xyj: use u64 for VSB BER values
Date: Thu, 22 Oct 2026 17:23:48 +0000
Message-ID: <20261022172349.224694-1-devsec@tpz.ru>
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

The VSB post-Viterbi BER calculation can overflow its u32 result.

The FEC_RS_NR_BIT_ERRORS register contains a 12-bit mantissa and a
4-bit exponent, with ranges of 0..4095 and 0..15, respectively.
A mantissa of 4095 and an exponent of 15 satisfy the high-BER
condition: (4095 << 15) >> 3 = 16773120 > 68700

For every exponent greater than two, the driver calculates cnt as
FEC_RS_MEASUREMENT_PERIOD * FEC_RS_MEASUREMENT_PRESCALE * 207. The
constant period and prescale values are 12894 and 1, so cnt
is 2669058.

The high-BER path then calculates 924255 * 26570 = 24557455350,
which exceeds U32_MAX and wraps before reaching the DVB statistics
counter.

Store VSB BER values in u64 and promote cnt before multiplying it.
The statistics uvalue field is already u64, so it preserves the
complete result.

Fixes: 38b2df95c53b ("[media] drx-j: add a driver for Trident drx-j frontend")
Signed-off-by: Ilya Krutskih <devsec@tpz.ru>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 367acb59b4a3..a257ecc4f2e0 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -6245,7 +6245,7 @@ static int get_vsb_post_rs_pck_err(struct i2c_device_addr *dev_addr,
 * \return Error code
 */
 static int get_vs_bpost_viterbi_ber(struct i2c_device_addr *dev_addr,
-				    u32 *ber, u32 *cnt)
+				    u64 *ber, u32 *cnt)
 {
 	int rc;
 	u16 data = 0;
@@ -6269,7 +6269,7 @@ static int get_vs_bpost_viterbi_ber(struct i2c_device_addr *dev_addr,
 	*cnt = period * prescale * 207 * ((bit_errors_exp > 2) ? 1 : 8);
 
 	if (((bit_errors_mant << bit_errors_exp) >> 3) > 68700)
-		*ber = (*cnt) * 26570;
+		*ber = (u64)*cnt * 26570;
 	else {
 		if (period * prescale == 0) {
 			pr_err("error: period and/or prescale is zero!\n");
@@ -6290,7 +6290,7 @@ static int get_vs_bpost_viterbi_ber(struct i2c_device_addr *dev_addr,
 * \return Error code
 */
 static int get_vs_bpre_viterbi_ber(struct i2c_device_addr *dev_addr,
-				   u32 *ber, u32 *cnt)
+				   u64 *ber, u32 *cnt)
 {
 	u16 data = 0;
 	int rc;
@@ -10674,7 +10674,8 @@ ctrl_sig_quality(struct drx_demod_instance *demod,
 	struct dtv_frontend_properties *p = &state->frontend.dtv_property_cache;
 	enum drx_standard standard = ext_attr->standard;
 	int rc;
-	u32 ber, cnt, err, pkt;
+	u64 ber;
+	u32 cnt, err, pkt;
 	u16 mer, strength = 0;
 
 	rc = get_sig_strength(demod, &strength);
-- 
2.43.0

