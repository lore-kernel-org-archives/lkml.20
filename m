Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CB30C179
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519698; cv=none; b=OpHc8mENPBAwbsbH9Vxq3WGYoOaWwbUz54x/c8GW3XsO8aNyngH/fBt55HihOMQeEF/e0Lt81hmgZkE5xvg7gX4gk0RVspLWyyxDtWtkQocSOThKG2F1xd/dVmBMc6bxHrcK/KIzcz2wUlX1y6ixP/hwe6jF5sfxQkJpaHo2sgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519698; c=relaxed/simple;
	bh=URAFRJSaZIRbDk6d22uqKWvPfxpFv11EieW0aLgOHns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RkmXNH56x7Mk2y9z8fTAIX8GB2OPq71iYuMJsJpOdsoQwBdKMYVXpgYcj3f0cbsuOM+UCE3epvUJ4XKzHfkJmKBji9yDlZlBgH3mXfVihFHuYGrkoHBLUfeXQ8cbgweHpf1yDY3bhTUZzCYL0X8O+ckcTdGfFbuI5c8KZBMqfEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwCyFP9A; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwCyFP9A"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso327679eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519696; x=1791124496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=CwCyFP9AOr8XLAtjtng9bp+fZwKK/54ShRLgKSgJLX6hb4hPnx1+FSCMkVGWs/Khlc
         J15+BMlp/u0yyIfQ3DUqq3ssw7TrMNyH5Nzokxdkupu9Z5wx819QKU/ssrqure1evMY+
         Epd3x3ST0L4W3VW0DqciqNldtLPVIBVqVrByVoMcQ9m294fjAmMkcuKmcZVk8libp7/1
         I46RXR4C65sHRMs6Y5k8ayObnS7WhWOzS7qHW0wUCQ35OKsGRR5g8M9lcuOQtL/3Ey+a
         kTJ7kNHdnItZN9HnR4Jg8A53yLs6m0pKf16cXs/D90YZPAjZkvCJdWRv5+mW0oEIvzPc
         3hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519696; x=1791124496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=tEy+1kVzi8qpZt7ND+iGP7K8s/vuuch3gLxxbTeGMXLeE0tqj7Dj7rcz1GD4B7E1dt
         gTU6SU4FzD4vXBnj8o2RmxkRkoMMr5whKzMFTsccIEBbcfPOsyyxE9lqaYqeyl2guupM
         BZsRWyoMbZjEPoYrKYMLUJTaEonfeJpFOHbCZ6qhP4xSKxchs7lOP1byAmvgEa3QeNXR
         4Ri8/++ubEwxKp8e5WO69BYIM/olCmJM9GXZ3VfT2SvjL9Q409Y3cURrAyIYy/FKha0k
         ApPMdFMn/uA2uK7BmkzEiCuuPX7INHcQduO0ycJX5wM2RTSGG/zzdOQvC9btQapb7p59
         qMvw==
X-Forwarded-Encrypted: i=1; AKwUvBynfyR6yYKJBrXcBl3EkySSAjFgNi+Ia987VQ8mJO8Sj93CqWS+8jok+CuWGXUMGNeKEy26n7cRBYhpat4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNLml7iW2lojeIiERdgnPg7wsZLI9rL6xdAH2UanyzHabWxJPI
	nPva11aKso09wRfDQIC2FOo3Yey1m07r8CDTUjRctk3vj6tboctgVjg7eC0SkQ==
X-Gm-Gg: AYBFou04KtTH5INg+06ao/420u9+G88q66ZC4kyCdD+YRntGAAx5wxPZXQCFQl9bPnO
	YpOiDRayhDwU300aoJSNEJyt2lUqW50eFqQTknsMhDHd2kOSHMFViO49+2ynshLqWquHVbtGeNX
	5S2EerAKbCwM9KBN4/qHOyhua7ac47KTUHek+o9b7OktOCXBcOnHl9rllOahLmB6BfmaBWsqSkI
	PQVoHMeTlEzrX1wAWbV2092XMnrNO9KFHvhYSnlu9vUDV60dIgL4eOLv1JUV4zkModf/LVC0wX/
	mF/RSq6vrSrg13cdEvEh018Fafm93MO5bz79zg+QH9SZ1KzN3bQ9B+lvoz1C6y8tsFdet42aeD6
	ugrSGpEOz5JSojVOIfH4Zb+2zi+uvvjYi0yYrc9ek9L20a2wQOhiYcSxiFtYwvkuqmZnO6Zk4J8
	ztNHc8WnvgafeRAp1lPkMv/NFkTemr6x+IIr/6Idfpft0NtJqcv2TPJb0bzdJEmKeMQqB45aR8X
	dC/zP8/SBqSNP3EIg14EymB8KzNllxqIpSUfi5fc2EHvh+ADXU3sGW4gyaq
X-Received: by 2002:a05:7300:ec96:b0:33b:d4c9:561f with SMTP id 5a478bee46e88-3426fcc99c8mr5705585eec.5.1790519696270;
        Sun, 27 Sep 2026 07:34:56 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:55 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 05/12] powerpc/pseries: Annotate the VPD sequence lock context
Date: Sun, 27 Sep 2026 20:03:46 +0530
Message-Id: <d8908c2991181b75c20dfd8e23a58e7779bc7dee.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
  papr-vpd.c:151:1: error: mutex 'rtas_ibm_get_vpd_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-vpd.c:165:2: error: releasing mutex 'rtas_ibm_get_vpd_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to in vpd_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-vpd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index f38c188fc4a1..8d210454cff1 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -123,8 +123,10 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
  * @seq: vpd call parameters from sequence struct
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_vpd_lock held. vpd_sequence_end() releases it.
  */
 static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 	/*
@@ -157,6 +159,7 @@ static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by vpd_sequence_begin().
  */
 static void vpd_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 
-- 
2.39.5

