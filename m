Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390841;
	b=B1BrAdYMvQ8A44Iw/tVlJ6zp9OYEoeTlH8d6SeFE11oQYSSJera7pENKJr81mrKN6Uz5
	 JKZjpsCYtxGStIdCrs2rr0aA7CH7+Xl6wX2azHIadHWYZjCcpqWmXkyw0TCwTYzeFyAg6
	 VoqUCDyyqgsDVpyoMygJzPXRbYVKfHs13lAWwdOAo+/jK5T+ggba6ufB7A6Qmnxx2lGm3
	 yFy+liOf/jjwpIq49RsVsZfG8tMVENTLmTaSAQeb+TaKSKsfrxA+hn34vw+6NXHn37m1I
	 kR0ONNnzQ6+HOOXg4iOLQUskHNsfa5u8YvwMr4DIXTVMeZpA628Krkx0tLbeOzu9ezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390841;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8reQ6REQEA2k8KRp1SWplSOof/sTUnH2B+t/FwFcDO0=;
	b=eQjm53sIdE9ozBGIJckWvt0jjpb3S5ammZ4YN38/C9b/SNkWCk93DQw9XgwSX45E6G47
	 /W9XAU8NEvvDqVjEdeIkAFVOOzWfDYLLzhrje3nzUDLuMJHjOPcQcv0O8aJEJqwhcbzUO
	 EtUN/cfTZbI7JO7LSzazZt+0WvxJ4sjwtjxv8I0VaHkErGNRlzIKghgGXj3OvLkkR5gYU
	 we2+sUTvitEWHg5OMIPtuLy6yedJ4/0bqP6AcEoiLeMAo5T+el8lNLun0wfnK2WxLMTmu
	 Eqw25Dks+g1EOYYQ779oOa3+87tmpMlwesCJjJbYFwgpFYcnw68YLNgWcXXbvRGzfDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="bK/hlSVo";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G42P3DKd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62283606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62283606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bK/hlSVo;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G42P3DKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8reQ6REQEA2k8KRp1SWplSOof/sTUnH2B+t/FwFcDO0=;
	b=bK/hlSVodnUBUukcANAm/nlmDRIISHeYJ2k/dOV/qKUPW1Ns6iupobECgRizltWACxQUtJ
	ovVrhGNap/SPm3DRBbLjZgB8LR8xPT4DvqD1EFbA7yk6h+ws5fkalIdVSlDVGrA36WgvT/
	lxvYcIR7c9hYnQXGhZTw2hNiivwdz0Q=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-peqQMDGrNoisWiIJgjPASw-1; Fri, 30 Oct 2026 16:07:12 -0400
X-MC-Unique: peqQMDGrNoisWiIJgjPASw-1
X-Mimecast-MFC-AGG-ID: peqQMDGrNoisWiIJgjPASw_1793390831
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so4058756eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390831; x=1793995631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8reQ6REQEA2k8KRp1SWplSOof/sTUnH2B+t/FwFcDO0=;
        b=G42P3DKdCFvNUBdSKukPkBS1/gUGuYd16ytyY53WBQ17DsWvHTlVVsy/gjVI5j1pig
         S2wjsztn7VR1MflEXhc3NzZTw0CahoeHXmjBix8OzCMRA7WQ0/ZIJITX24qDyX7/HCKs
         xHMcgZPgz3+sg/Z6U0l7RaZDaWPQED+phXHWAhNDosDG7CCq2QMWbQkRDS5+omeyRLKS
         KGp4p1wYitgupqDacRi4QpUH4WqFESpux+39+tdTDU/A9fBEc6ryU6hkzIZ9S5Z2ytBj
         ZfPSwt0lta7UUeAoKD7EA6cC/YyLiPv2Y3Nb+NT8GBU0ZmhIP/sZnYJlpW9V/RyZ34RP
         G1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390831; x=1793995631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8reQ6REQEA2k8KRp1SWplSOof/sTUnH2B+t/FwFcDO0=;
        b=yI02mWqArXSlOgxpydB9WuQFOOnVyn7cFBwGeLkixxDqlCGsMEOWKyTrWjoSLz4Ld6
         fovjkKruoqAj1KNBnbkA9g9oQPNOiZhdzBluqgUlmn+vHQe95eMOXMVtcMV3V3aQGWpz
         HgaN3mcK7xw/Qb37k0WCkjc0eNecAJgqdEshSTcShdMtrBlApwSRRJLCOs+NvNJVYPXl
         Lzpr/hLZQoR8PNYrJC37xXwRVL+mfHQQ99aL59usxvMrWfew8lBO3vaz458dr7cq43e0
         J7P0jOeBqoC8pa1QAH31U6NIdWAXGdto0IYKqeeJG8MF6kvyWii28akJVcw7YhlLkEOy
         KWig==
X-Gm-Message-State: AFq9FYKgAxBcEqFeS8l+7O250NQKwkliq+SmlSy9Q8Q1s2PTkTO9lb6b
	fZIHhP0khFfIJ/RgVyY3z/0yBPv540xiKf+gqWYHJQJL9AGWBpOZEHEHgfg1CVVE0R/h9021rN8
	7FT+aZIbdsmWOaThJcn3me57x9srZK1ejoAzewIfJWYMI3SCL69znEbllqiB7S6fCsD7K8cikI6
	4Aee4gYo8YALcCNxxrI/i2+yGXF6GFFhs/76hAN8LyhXg5iWpJ
X-Gm-Gg: AYBFou15JOZPZ42R6AhOQF0+ADYgXEc4wQ0l1arPgLY1m06KQ3o6SHE+b6jzCejgP4L
	A8TFtLgBpjzEiySZ57+5Y64ZXQQJp7eOgr/tYmbA7msXp8+xhmlmIsRq8QutSCNfsZjl0slNPEg
	GzSDCckPjbPnELFP1MPIYBVJTp7+jDBk/5WFNACdv8oIArNFHwS+Q2RIrtl3c0rgSh1shJaz8ZA
	vrzqBSicdwjJhpyB8ZdfKgFo6mOrjWo4xKHOZys5ZfopEw713V3a1WHLb0kO8tPG6tUw64IdoTT
	QsM50R9jS74quiqGvK4sFya6Q0ZEIZQhsZ25IF+vSgaEiR5fAdxtHOEWnP99JNoWF83m5mxTIq1
	/zy1iJrlbaRcDKyxuC7GJEp981yNMwESXHc1+K2idnX8XxpQNV5FLsnj6frvW882eeGAuBRadNu
	U64z4+jYz5Gr4mNA==
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr4887092eec.40.1793390830938;
        Fri, 30 Oct 2026 13:07:10 -0700 (PDT)
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr4887052eec.40.1793390830363;
        Fri, 30 Oct 2026 13:07:10 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:09 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 4/7] tpm: tis_i2c: Use local 4KB buffer to limit memory usage
Date: Sat, 31 Oct 2026 01:36:46 +0530
Message-ID: <20261030200649.357508-5-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030200649.357508-1-armenon@redhat.com>
References: <20261030200649.357508-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

The global increase of TPM_BUFSIZE to 8KB is necessary to support
Post-Quantum Cryptography (PQC) payloads. However, applying this increase
to the tpm_tis_i2c driver is unnecessary and wasteful due to physical
transport limitations as pointed out in [1]

This commit introduces a local buffer limit that is used in the i2c
driver.

[1] https://sashiko.dev/#/patchset/20260324071803.324774-1-armenon%40redhat.com?patch=8319

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-5-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_tis_i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index 8bcbc84815fd..36f56ee75cd4 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -61,6 +61,7 @@ struct tpm_tis_i2c_reset_timings {
 	unsigned int assert_us;
 	unsigned int deassert_us;
 };
+#define TPM_I2C_BUFSIZE 4096
 
 struct tpm_tis_i2c_phy {
 	struct tpm_tis_data priv;
@@ -240,7 +241,7 @@ static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
 	int ret;
 	u16 wrote = 0;
 
-	if (len > TPM_BUFSIZE - 1)
+	if (len > TPM_I2C_BUFSIZE - 1)
 		return -EIO;
 
 	phy->io_buf[0] = reg;
@@ -349,7 +350,7 @@ static int tpm_tis_i2c_probe(struct i2c_client *dev)
 	if (!phy)
 		return -ENOMEM;
 
-	phy->io_buf = devm_kzalloc(&dev->dev, TPM_BUFSIZE, GFP_KERNEL);
+	phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
 	if (!phy->io_buf)
 		return -ENOMEM;
 
-- 
2.56.0

