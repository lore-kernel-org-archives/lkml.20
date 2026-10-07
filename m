Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943845563C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377992; cv=none; b=LyYv3XxWt03YbDvsII1IHMHQtFOgRJmNE0THJd8p80FUYAqJ1yi7Cjyzp2x5bRHYuqQZUczPC6Iu4NfdIommEbILBfz2tkKUN/xtg9zzD6zv00yjidv/APxHE+3LCSd9W4FDF8JDtf0emk7T6tIqJMvWOhdF8XKodUeLhep8s1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377992; c=relaxed/simple;
	bh=w9+dbflpGrP5lNfDxCYItkizUPQnVZj6g3uERwIv6gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5KFExkZic43bc+vYMAZudMix7+X5oyLtzDIVV1RIqyEtyN/Cbqbs0lvAWulqtR/0f6uoZFsKygyS1kAi7wEvp04STlZvi4ZX6vjDIZe1pyzrv2ydeKhTZWxqOo5Vv6KYI41spkNn0xQcl9o/EiXCALUJGsYOOln8S5m3WLfmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHPtGfX4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHPtGfX4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso10002445e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377969; x=1791982769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9czbEOZYdKU/0Bo/8kPwWGE/910Wk4cEmK2RLuZ54k=;
        b=mHPtGfX49XxbRO68poikFH9vXs3bRd+7ak5tCAFXenggYxhWkLiX3XB0bWs2MvH2nq
         iAHWQXJjnOi12Q+1n1wjImg57xVSVH0LAijXQa2ca0trFshvVdjYf9F6NGYZ65Bmbbu4
         9JMMC+0sxbHuB9K31jkKkZIvn8eGYX9N9vN98Cc0QIiyvW+cN6MTfsSrYKRjesKpZf1J
         iHBvsTsuEPmCnyyN3ZZc+Ne1P6PfvX/y7CtK9GlOFSsuGqY3T0o5x/PYujeE0iqOGvzr
         D5ue7DilGnSquw9CkitnA1b4kWvMGhkBAndP8HgsOSvE9/S1FVa/sfkBi1ef5UWE6nJY
         WA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377969; x=1791982769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9czbEOZYdKU/0Bo/8kPwWGE/910Wk4cEmK2RLuZ54k=;
        b=PBcWqUAifpIjOIYeB79RprTuuIUa8fYf/ONnOhNNH0tlFYIEj+qze0O5IJrw4lkrW3
         PoqpCeGFnLNFNn2GMd9oxCCO3cLz8ks85Tm9OIURuCqlxX2L0Mm5kByQOvzFHlmnTXCD
         lDj9ykLE5Kpd4cOG8heRY2XbfcNB/GCx1wOgHeNnNGCQCSHj/Bbw9KrF4gusLZoBQH8T
         uOBP3fQ0QFuInWzHD0TQCJGED7MsyZiFmJ7dOHG/VVQXmxbB/QiFrfkTOF9+XkQ316Hl
         3FicRaLrffkTAh0/Di7DUnB7eWtUhgDgNS8yG4JJ1AtvQOefSuOr2hqJWLoG3g5FC5Nt
         PVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCYKvS+AwsYA3Fa+s/xfXLLFhtmQuCtJGbL64Y4cTtJbnejzDA2K+LkK3gajzyRKScLToaSqeuZNud6zo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCVK6zoBd0Rm21bvrbQuj+uHfQSW7ITd6Sdy4yufzMmm5bOTfs
	3Rl5mMxA1CMmfa/91AaiKydyulO+5br0zT2NF+9sdAXzDPRiFsqLDCjwX8rTxq2h
X-Gm-Gg: AYBFou2Tm+TN2Jd3yKt7qCxjYrPrPrrC2hDOHxP9Ncd+iJMni7Se7TRHd9zYlKU3enr
	9EbtT51iLT4BmCcAbnkhF6qmhfckJkxD+kB3dacLstn6q9ZnwSpob3EqTjjqbKBAFStIFlNVc2m
	7uiS3FZ23m0HX5Og5eZaFBAjzqT7LEosAifuFu9IcIyg3z/52T3J0a1+aQ+JukZyaMdIdkHR/8E
	atgzzpcz0umInlmhQMqDuDCHTNoJIJGt2HEWME6+6MvFiCSekhzqo/KMUvhzYJ7c57atSdn0hoC
	1BUexTX0sUABKj2/T7cqFJKLJTrlrhNKdNSVXiSdXXNgTadb7CfmXV6LQzmJSQS8hDmZH3p2lBr
	jqJx+XIeFNa+c8ovDqm1MEEoTdZN3sWiN895YxoGFeH4IGrsV685FTYmRSnXFckPO+tZDZAlNeM
	M+rehzcNgj1dJww56cpqkuimd5eaMemxwSq5ufMzkd9G7fFfB4Uu8wzUxu1VIH/IP1xOem/2Zou
	sFQAxbgKrT9eH2ZmDhiPuIlaXmvaPGhjXmut9bUf8c=
X-Received: by 2002:a05:600c:1d0e:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a18043b9c6mr32320735e9.26.1791377969328;
        Wed, 07 Oct 2026 05:59:29 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
Date: Wed,  7 Oct 2026 14:59:08 +0200
Message-ID: <20261007125908.321186-5-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007125908.321186-1-erwanaliasr1@gmail.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

pwr_current_active_freq_limit_source reports the active frequency limit
sources as a list of names, one per line, which metrics exporters have
to parse and map back to a value.

Add pwr_current_active_freq_limit_source_raw, reporting the same source
bitmask as a single hexadecimal value. Exporters only need a plain
integer conversion, and its interpretation can be centralized in the
monitoring stack, e.g. with Grafana value mappings, instead of being
decoded on each server.

The bit assignment is defined by the HSMP specification and is stable:
new limit sources are only appended, existing bits never change meaning.
A given value therefore has a single interpretation, whatever the
platform or kernel version it comes from.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 954e938eea3d..66dbf506db05 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -109,6 +109,10 @@ Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
+* pwr_current_active_freq_limit_source_raw: Source of current active
+  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
+  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
+  APML Agent, HSMP Agent.
 
 ACPI device object format
 =========================
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index e9e91b640b2a..fa1cf8dc3b6f 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -274,6 +274,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
+					       struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
+}
+
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
@@ -307,6 +322,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_raw_show, 0444);
 
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency_input.dattr.attr,
@@ -323,6 +340,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
 	NULL
 };
 
-- 
2.53.0

