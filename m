Received: from outbound.qs.icloud.com (qs-2003d-snip4-1.eps.apple.com [57.103.86.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1169F463B8F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629821; cv=none; b=XoyyLUe/EyqVD9uDudw6B/nxWpuEPqwsfTGIZ5ZZbvgQ4eFzP10A6RhF4gBP/p+m/iwT+ZwRBaz6w9OFrgtD6F2b+O//7/cnHE2dRxqQD3m1Bc+FOwMsfqe6jGMsfrj21fnZz0Bt0oMRMrB+GTnmWTvzaDF5eqb4pKj5pi8F7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629821; c=relaxed/simple;
	bh=YSCX4grizeyXBMyqAbzzgzO6QzhJQJBp0lm0LXRKTgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMMsmcdEf2NKniaKrCDwbEhr5dO2u/j63KYc0l7Tp7jL0YH/tcHMdA2lypCs0o4wTKB8UxPN05ofqhNFDTzA3Ua+XGP2WpLlIIMbV8jv9zIl7WPsgGJ7iSYIpLBlbk84HMsWggymy6q7qxEVX1usQpSboZAXT0zn5kaGkWz/CbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org; spf=pass smtp.mailfrom=aurorasilicon.org; dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b=WS/9E9lx; arc=none smtp.client-ip=57.103.86.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurorasilicon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurorasilicon.org header.i=@aurorasilicon.org header.b="WS/9E9lx"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-1 (Postfix) with ESMTPS id C38C01800182;
	Thu, 17 Sep 2026 07:23:37 +0000 (UTC)
X-ICL-RepId: 01a0ae3f-e36d-7390-bfb3-210cab0546db
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFPHVwFWhxCDUEdXANYEhVdRUEUVgVyEUwKXB9WGFscUBtcAxkEQBcZHldQVh5AH0sZQARbAlEfV1ZcH1BLQBMESQFNXw5eHwQXRhlVBEceXVZCHhkCURxWDVdDVARfUEkMQVBsWgBHF0gdXRlZb1BdHA4MQhldAlgLWgFeCF0eFxdBChcGWxQERFACQQ5AXghPC1QBWQJDCEAdCl4fHAJAGV0tVh5AH0sZQARbAlEfV1ZcH1BVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurorasilicon.org; s=sig1; t=1789629818; x=1792221818; bh=gGdGUAat4LoOu5kUAAgrO8YTLTdkT/ubcZydi6xNMhs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=WS/9E9lx89sUANQbFLMSCaIG1fHryzH7uMGvFwweCCBEr7j0OK/Lp5kS6AESx6kw7Q1d74Q5JTvtcvxagtZXv9mjqeS1VeExbgCVONh/zw+WY9J1ahxgCCTj5nsrCB9ljlZ0QxFZIaKmxnWf4DC7ptqml20YziSMqEyS5rW/3ApC/8rRyFYGBl8vt/Fgw0W9NtOX65xtK6Olef30mwoO0XOz2m/C8teuuHZw2ItR3d6mcXQGbHKD3M1TJWy6BlH4U9FYn1gV0wmstG10JYf5sFjkEB4WOkBtnIIxlROwU5zZbyVcwUNU94hKv/vZptiLOWL761K6tLCRzXKkmBbW3g==
mail-alias-created-date: 1786334582283
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-1 (Postfix) with ESMTPSA id 5D9A61800107;
	Thu, 17 Sep 2026 07:23:34 +0000 (UTC)
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
Subject: [RFC PATCH 0/2] ASoC: CS42L83 Apple headset remote support
Date: Thu, 17 Sep 2026 17:23:30 +1000
Message-ID: <cover.1789620318.git.ryan@aurorasilicon.org>
X-Mailer: git-send-email 2.50.1
Reply-To: ryan@aurorasilicon.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=PLYCOPqC c=1 sm=1 tr=0 ts=6aab957a
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zQbyrsbpmBOX9-MpknoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5OSBTYWx0ZWRfX8hUakZ39EnMK
 pSWfU1lHM4WaFiXYGgY+QMGf6l1ivKCGCndCSb2iV53pgOaxZFDNpLQpunVPdhPdlgW5IHQ8UUg
 HS9oP69V04FgGzjVJK7r9lLx2Sg2yKKasfouJ2e2bE8SUH9LyMgFi7Z1cKm64EfSjKC4GJx2oD8
 vymLuAQk+x6vYN1TvHkTk7wc0OQnKuJzJ+hMwWls7lUnpMV212hWzmR55R3WoOsFrOPzeNqwzDK
 yto475v+vOUvlyrdBWNHkoNXdU+WxqoIUt+ObSwD271g6NeKHMVGRxHqq67jSRX3DDQ80/dlzHa
 QRWRx1HimZYYwl2oWBhDplCwNezuyaAvj6r8DWykSKxo2jj3LW/EDOMBxHsjSU=
X-Proofpoint-GUID: xnEZTvyN8BV5vsS9fM6fOHGBGWRYkHZD
X-Proofpoint-ORIG-GUID: xnEZTvyN8BV5vsS9fM6fOHGBGWRYkHZD
X-JNJ: AAAAAAAB2uIwFmkymreUzYprAxOayPWwgUuOELCfvlqXafK0vn1Utry+kdbUMOXeXdTdAN8NlPQiWq/WTqeQYoLWGPar/CM63u0ODnmnM0p+OlfD1yWaa9YnRg6f7n3u6H6RlKRoZxcncnXPF4sdWXIFCr2Tpjnas4OzNYb1+djk00LqGy+AdC5lxCJ3BvLLO5kv8DANeNNL7FY3tanZPApbti/oywd5+GdTauwUCstNY3FnLU+J0J+aVQpOTYNnEzzXa9Tx7EjURZS6epByxs5JGqQRK6YmBJKMfj073h0ZqQ8E/kkytwUMTF9PQsYaBCMC8rHHD/66KLJSbbnt2JSBG6zO5PZnGvrXkOYB+NFVil4fKFmbszB2OC6p4FaJ/8s0Db7nrxj3vLUeT9yki+rZe8+tzHaOfCs+iDGhCwsTs9MLuvzLMEy8ol3noZxxEuhQvQk+DchsSrmSQAJ15OlCQW+ieMefdI7Kz3ZsVakiYE4jamkkDrtejgZnBot3dYn+h6Bi66xU3CCREsEKdxcqvG/BiSKmhhKcugP6WXhWIWREAmygdmGQ7v1g/BUp46A2hfVkk/UNVce78/sRVEhp/YovNp3YabVZKiSF8FNyHa2lyI3Qp0RAIofQcWVda3L/HEhy21klQuXRJtBFs38E3KVt6CDO5IdheCtQIbAVRO/815XtevzpJtoRSOlUbbEtmkpwoatZwzps+Ro8Z6ofuRUdML6cujV2Z2n/M5KORyGXs5xST8l053m+5usdnzS0Uzbn75cT3lygJJDrRScbmzl7t0N9fh9/KUXrco1HfEGPCUgBYKyFo/G+/81btfnSRw66QV3rScpkp7CbGIQ86bHDncvzwEVPzCChrvbOldp0EryOfeAhdcehicQ6aA7VEOvvqTYHy7D1PFQDDWjrRJq3vp2zbrWAvoxxSrkMAIEizQfPAJhvkguBZqot4Ck5CcZ9FX40YVfk3HXsbgK4o0rY/7m
 iqj4vonHH4pHB5xVncc+l/NdwgWw0qDRpcGgcb4itpMuPcq3QJMES6yrnmv6UoRBU0ngBo7pciUj6b05aUtkoXsCoHRGqwNgX+g2BONWgupyMepllFJy6GnKTMm21SoxVLx3Bgl0gwxglySBlCcWhhlxsucc3LQ/DYqaxj7BPMUM8ebySQI9LfW069dNDNgDZBuo6Zhoni920kQ+n60Bq+tNMtzvSPY57ee6FSscLLfrd0hUUVqt2/ycrZGkW9/2V6OfU3BQs076mpvJgX+C/T/jL/BVNnM1QxYQLFDfeHNTZpclGjBcaHKBYYR75CJGlMYejl7IpOZU5QsQSxmAcMCOGzB4e6YltavD4S+10EXxb+n/DUUqMN5nsunq9JiOLeTU=

Hi,

This series adds Apple wired-headset remote support to CS42L83, including
volume-button events while audio is idle. Identification is bounded and
falls back to the analogue detector on failure. It uses the existing
regmap, threaded IRQ and ASoC jack paths; no new DT or clock interface is
needed.

Patch 1 checks interrupt I/O and runtime-resume errors. Patch 2 adds remote
identification and button handling. Machine drivers must expose the button
capabilities and key mappings; J700 platform support is outside this series.

Hardware testing on J700/CS42L83 B0 with Apple earbuds covered idle buttons,
unplug/replug, playback, capture and full duplex, including identification
with streams running. The mainline series was build-tested separately:
arm64 modules with PM on/off and built-in PM. Extracted-source ASan/UBSan
tests cover malformed replies, timeouts, I/O faults and recovery.

Other boards/revisions, OMTP, analogue-only headsets and system
suspend/resume remain untested.

I'd appreciate Cirrus/ASoC feedback on:
- Whether CS42L83 identity alone is sufficient across revisions.
- The undocumented receiver controls, particularly HS_BIAS_CTL bits 3:2,
  and the receive-acknowledgment/identifier interpretation.

This is an independent implementation based on register-level reverse
engineering and hardware tests. No proprietary source or firmware is
included. LLM assistance covered implementation, analysis, testing and
text; the patches carry Assisted-by: LLM.

Thanks,
Ryan

Ryan Murray (2):
  ASoC: cs42l42: handle jack interrupt I/O and resume errors
  ASoC: cs42l42: support Apple headset remotes on CS42L83

 sound/soc/codecs/cs42l42.c | 286 +++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l42.h |  15 ++
 2 files changed, 293 insertions(+), 8 deletions(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
