Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725372;
	b=uFZly+sxZ5/h/gqCsZS2jVoXBHpVnigzOgCNASWAdA9ptVmIagZQB7J7bYNI7m/qDtE1
	 3u+3GovMBdKkYFLKeyxoRMhfNezwY6YfsUMPUEMf+qjEkF/95tDcNPRN1dDco0lVXOvWF
	 2Z4kk4Sh1lvOw2GzBMxxvFPv8pnJzQgw4fgzEYJoqtDz8ZrHqcwDw2e5YlpKItS8dp9af
	 k67H7ZZWpWdIc+/jwbNWGeDZx1GK6rSEP5Lyd8YGX/e/QFeqi7roRYmuGhCjzURu5WCxG
	 69pus69Z4x/staiNrEx5K2GeDB5dCofwXXWeD/dLorYEjelKmyVemIFRK5QzspfoFbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725372;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=w+SKr0yx2bzLRT2ts2C0c4p0JIw7KUOgOOjNRZexgGI=;
	b=D5bje7q9BxpnLhld/y23LxrnEyFOnhPNXspUJPEez0VbGm83fWRJOz1EturnUVgZiRAE
	 xlh3OGrcvK35FydIhLhXGLzvFAgs2hs57HCKduJ9CRkUEbtaG8CqbOp+vBXsESg1Wuum3
	 f8K/3ZK4C6yC40/+H7oudkYvK2Piz94eyJUVIhJNz9STs4sT2H9Z7rFscqR+BZh3r+WZh
	 qYLA5MILuLR8mhHoG8UrWpX/YeJPmq/66XJ3LvkYk6msPBrICH8wwA8z3PWeSDpq6LNCP
	 3z+iqF16CM7oYNC83IA4d2UiQygJvWWENCnj+6U8PWWczSapCKmZfsVpN6YYvs9aMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="eYBVgh/K";
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF8606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CF8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eYBVgh/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725342;
	bh=w+SKr0yx2bzLRT2ts2C0c4p0JIw7KUOgOOjNRZexgGI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=eYBVgh/KYGSdZaIpibF/AZa4Z/C0P01v0BVps8yTw4MJYBPSBQkcyLl8mWLSYV9Ia
	 nnt5mMxCV0qPAPWjCiZd6xz8hA1aCWUJK7KnNerjDPpvzD7NmlQMDbI76/O/TrqhO8
	 oyprbfj1ezSfSs/ZH1gzl7Zsox/m7rHhndJVPJzo=
X-QQ-mid: esmtpsz11t1792725336tc6848384
X-QQ-Originating-IP: A0yp6TFKp3KclDrjVG+PDZ5DijhTQYFbPhgQy1uYzec=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13943008464653737948
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/24] gtrace: Parse RISC-V Trace encoder config from perf event
Date: Fri, 23 Oct 2026 11:14:48 +0800
Message-Id: <20261023031505.2020925-8-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NRRC+m8+BqHIDSty/ZQyq95teYSxyIXqYIkgLlSSwmlK62VM2V5IJMRq
	8exgAGvRueQVRLlaFO/VCXOx0CuqzJC2IMAREdVJJc259VPy0gUML0D8Tm2RrEM0Q+R0VIz
	qpC3b+JWA0Sy1GoxkTY0bFmStEXC6qbX+ocYFyeJdJHkn97JhYNwmfYyGHJ6HfCW1voq6aY
	L89nOMwpw9u+07UtlWJE4fHys0so2E2NVwBQKXQITWYI+anbmhQDqUerKl1fl7ZHhnhECut
	TyHNZcA4r4ie3MOmZ0+yC865f+rAwK9XyL4qidJGN5GvlSr+b/UQJa5xRmsQHMTeVmeGZWW
	VWpn0YF1N6iUqVoBfKg/rOyt9jjcbrs+NVu77WJIF2b2pyb/mbX+R/RjwFFQex3z2Ipg+K0
	NfO0kfy508Pd97Zorb2D3NK1pu1eXHs5SlGEnwKNUDGEFY8flLUJSC5ADcVawT6HzlwipXF
	g9qXAjbWyZs19pZsZiq7irtD3yY6iRzoH9YFKFYO0sHE5QrOUnvrLlnR6qdOU6mBQ4XlCyV
	RwilSIBq41FVlw/4QU2IJptqMRcf/+9M4p/oc5+xnNScepWANCZsmwdfrVjuxbLv+nA57W4
	ujNe1Q+DZEmeo7YUys7SinE5ZJlmkZ5zjrRg/BbY6NNu27Q0JhlqUrZy5jgzpLdt1RntxBC
	j96Th3HkQnIjaoKYRouCSYWbr27BvmJR+dU4Z4UmDqrhqcHth/txbP3kI6Bb9mx/k0KjRhm
	NtLxMHdnkippUvs3KP+8ETrjjoWep1+5qdrP5Z9y8AIHb6CUOIvH/Yw6pyqov2vyNOLRRlE
	QqEuURm7guavuIWhju0Lbwou/x4AUQBd50qw/G4p2MittV745kCVO3CWsA7/sE6s1+4axVV
	Mp7/+7JRGKxO6MMTzbfn206+2VTK3ivZApE0Wfuvt+9nhRgq2c+EDmQLq7VY02wpF9zBOH3
	CXgciDgLiEBw8HwPFLnV07q7dgaTVKMGh6bfwMCr4UVR0IBrQtTrrKpc+B5ZZ0oFflEjZNC
	klHOSZ8bVIdhH32ETMwL4FyNt4BEMPI6KPQXONhFfJCUuaLAI7JI/wTjviFd+mkbmqL3AxA
	WzgUIBWaJl/lhCJqZq87OTgJTaWWqS7Ww==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Parse the hardware trace encoder configurations (timestamp, context,
syncmode, and syncmax) from perf event attributes when operating
in GTRACE_COMPONENT_MODE_PERF.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 .../hwtracing/gtrace/rvtrace-encoder-core.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 01925ebdfbde..817535ff9558 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -140,13 +140,33 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv,
+					       struct perf_event *event)
+{
+	u64 config = event->attr.config;
+	enum rvtrace_encoder_syncmode syncmode;
+
+	if (priv->has_context)
+		priv->context = config & BIT(GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT);
+
+	syncmode = FIELD_GET(GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK, config);
+	if (priv->syncmode_hw[syncmode]) {
+		priv->syncmode = syncmode;
+		priv->syncmax = FIELD_GET(GTRACE_PMU_ATTR_CFG_SYNCMAX_MASK, config);
+	}
+}
+
 static int rvtrace_encoder_start(struct gtrace_component *comp)
 {
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_path *path = comp->path;
 	int ret;
 	u32 val;
 
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF)
+		rvtrace_encoder_parse_event_config(priv, path->event);
+
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-- 
2.34.1


