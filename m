Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139009;
	b=oGNavpVAkZcrXQeU++B+CDov7xQG0hmiprplsaVIewT2qtJ4dAFuza6ABM/uyOfXnxDs
	 V9NsK/PznDFcOt/1cnu4OVrNIFwZ+TLwexeM57vljfU3+qs1cWblVJ1rZ2CMby5O9j222
	 LgzCpB7oBynFBKTemsJEv4XUHxVO1CnTVXrvqbDsQFVDKFPdX4uH2L/qPh4WC8fbWE/u9
	 JYbJESobTjDr8FwXca8FZmUwKRl3JK9ZuhirkFc26bf6PUKpMe7ECh6oYxCHtH3LujUjn
	 DOo8mJGFdI8hsoyJYSnBvdM774X9dw5dzAui7MQ30t3Fd8dT6U2fkWcVAm2MicSOn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139009;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=3cmoXQF01aX1/UUUxEpCBGV7fTpnjfR0AK9Mx6nzSMg=;
	b=2LYE28OQ2fsX350El/Z8HF9vgYP6SMIT/zWBKkbwgmTK4AKg8jfnkexSurpjQ+luNd4g
	 POrMJWhtPKx2yJOV9tdO2YocxrJqvWQfRypcqpJJtzSOm3L80yftyXkDa6EbMj0l5Hrtu
	 DsE98kglwpAKuS8FCbf6gRoc/qHUZguZw06SGuJeXtsqRKbvLyBbWy+aSTagEZD5vm2AP
	 +ZzKBnPu1A7FC6sU0FutK+8IqXViqY0asnmTADS/BdkF4N5aCsA5QqNuIo8i+JNfNAD1m
	 bd60SdG+CTndl2cgTUiE07PLCMtlT/OIfZ/X6GsrXNT3Fmc0z7Qn6uDIz4Ajj5dgQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390D606A323;
	Sun,  8 Nov 2026 11:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3390D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABn_rN9Y_Bq9tGaAA--.19222S2;
	Sun, 08 Nov 2026 19:56:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Saravana Kannan <saravanak@kernel.org>,
 Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] of: unittest: Fix np reference leak in of_unittest_bus_3cell_ranges()
Date: Sun, 08 Nov 2026 11:56:44 +0000
Message-ID: <20261108121000.3772-1-vulab@iscas.ac.cn>
In-Reply-To: <CAL_JsqJoUywigy2A-tfe4Jg+r_bVsk5utZ0L4qZZu+rF9RXmLg@mail.gmail.com>
References: <20260917124653.2151894-1-vulab@iscas.ac.cn>
 <CAL_JsqJoUywigy2A-tfe4Jg+r_bVsk5utZ0L4qZZu+rF9RXmLg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowABn_rN9Y_Bq9tGaAA--.19222S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWxZF1DtrW8Xw4xCF45Jrb_yoW8tF4xpr
	yagFZIkr4kGF4xGrWkZry8ZFySy3Z3A3yrKry8Gan5Zan8Za47ZFyjk3yY9rn8Xrs7Wa4a
	yF4Dta13G3WjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7VU1pnQUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEFA2rv4qjIWAAAsU

of_range_parser_init() can fail when the node lacks a ranges property.
That error path returns without dropping the reference taken by
of_find_node_by_path(). Make the reference cleanup-managed so that it is
released on every return path, rather than adding an of_node_put() to
this one path only.

The candidate was found with static analysis tools; DeepSeek and GPT-6.1
Sol were used to audit it and to help prepare this fix.

Fixes: 3d5089c4263d ("of/address: Add support for 3 address cell bus")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Sorry for the very late reply to your review.
- Use __free(device_node) instead of an extra of_node_put() on the error
  path, as you suggested, so that every return path releases the node.
- Drop Cc: stable@vger.kernel.org.
- The other unittest fixes from that batch need the same rework. I am
  not resending them as a series of individual patches.
- Rebased on current mainline (fa4ad798f6f6). Built with arm64 defconfig
  plus CONFIG_OF_UNITTEST=y and W=1: drivers/of/unittest.o compiles
  without warnings and checkpatch.pl --strict is clean. I could not run
  the unittest at boot, so the error path itself was not exercised.
- Link to v1: https://lore.kernel.org/all/20260917124653.2151894-1-vulab@iscas.ac.cn/

 drivers/of/unittest.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..b6f0ae3e9710 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1366,12 +1366,12 @@ static void __init of_unittest_bus_ranges(void)
 
 static void __init of_unittest_bus_3cell_ranges(void)
 {
-	struct device_node *np;
+	struct device_node *np __free(device_node) =
+		of_find_node_by_path("/testcase-data/address-tests/bus@a0000000");
 	struct of_range range;
 	struct of_range_parser parser;
 	int i = 0;
 
-	np = of_find_node_by_path("/testcase-data/address-tests/bus@a0000000");
 	if (!np) {
 		pr_err("missing testcase data\n");
 		return;
@@ -1415,8 +1415,6 @@ static void __init of_unittest_bus_3cell_ranges(void)
 		}
 		i++;
 	}
-
-	of_node_put(np);
 }
 
 static void __init of_unittest_reg(void)
-- 
2.34.1


