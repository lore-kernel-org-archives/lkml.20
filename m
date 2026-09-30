Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112D349CFC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730223; cv=none; b=QI0E92yy27KgoxU6o1Yehfuawbqv6LEFd/fXS2KOFWO8dJ93JLepabTpezKEj1l0CXjlE17ca7lbjubhJjVJsj8/PG6VmeiV2+AxA5KpnGCmYHk9a/n8TFBAFtUA1OB/np0zJdqiAH5WdhbB6WROjTIeKYwAiv2Ba6YhnpbNPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730223; c=relaxed/simple;
	bh=ZEC2U06TJD4tOdmJMt8cSCAl78bFLKVRDOpBZAVz0aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKLqidYvuOqrFiA/oJSNzvxUa5FUSafU8Ax7Wl/hk8wSmmoRYZdGIuuXe/a/YrXzYXv9cS6sWJ66KBOxus5rPOfUpn2Gn76bGQg5ODHM9Y79uN5VmiUjftVfnLO3MW3oi3sKntOJWKN6iQw20lEOs6Bnf7c7eHWZjHXOnJ+3AVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=O1t38vVR; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="O1t38vVR"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so4037184eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790730220; x=1791335020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFwFCHroA09S10Beb/3mqXg3PAfAFcLcaaVX6WAqpVQ=;
        b=O1t38vVRg/OP7ypsbSwMfLpK/7I2f+wv2aY/mZmjjsOkZgIzIwSB3ybxrv/BxiDoV8
         naq8OjfvuuRb1/jdRUDA2l3jA+OPSnu9oqkXg/fO/uL9hBcIBuevqu+qBxv6V4JgTozS
         eGU+ye2f3Ui7aOxOURuF2hDkw398thLlj6XDs7ExmYX1elpd8QSB/5j7oX/WzXvJtSVJ
         VLup0Xtzmgug6bQTqCNO6T66tEX7KXVmGw79RmXrks9kLwulT2cjb1b9nkAYIoAraLWO
         lfvD1OGzCxcw0ed2VzW0uEt79PhzqVjISP1ioiV2S9qwiUB4I1rYN036Bd/jUXrdf3Te
         GMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730220; x=1791335020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFwFCHroA09S10Beb/3mqXg3PAfAFcLcaaVX6WAqpVQ=;
        b=pTsG87FN5cVLlY3fXxuMwl2oAW+fhVgIN+LYPBwT60fC3sJmel6Aj5gulWoyfdt2hR
         1LkOJq7kIDJri9lEBBb8qTyJNtnJWdqsXg5gM1YjDr9M7fehpyM49btKkztYcJ8OPpS3
         1Wxo7kQOAwOmzv9QoH34lGrzPKj5AM49vr/AO6PziW8NHUJX6PuaB2ObtKbgQZUoGvYG
         8jN9EMpShpLsLBZ4kuEl6ePNh6CZCEiLNNSQlnV2lAXBfy6ipmLR4Ldh7x0Q6cgs8WUD
         Nj8400ntwDWs7XV+OIX2KgysZu+u21O/Vd3H1ATB/TlN65sHSOfplN4YTmNS9YQn5aQW
         5sBA==
X-Forwarded-Encrypted: i=1; AKwUvBzpIwbRrsVvQztBhsbdsFOT9z5v+W7a5wI9xdKJO1GdhCgHvlHpOWHBPmGcHfBpR00Gi2FGCjF19zEzWV0=@vger.kernel.org
X-Gm-Message-State: AFuF++lv1bPu4vuC2bMu1Rvlr0GeAOlG5Wu4ZBi5digMHJbt2BM87XLs
	ocgDo7yWPxZkU+Fk6lFclD3L1518RWSaXZLP/khymXMiK4K9XepKhFdyzWobWWTCgE0=
X-Gm-Gg: AYBFou2aledgwULzp+G9mMG1AQvbAvJo4/w43K6znKvx1hynozVQurx/1QsVTh5s/nh
	ta9r97k7Dv/+FMY91I/iIRvGBAogfNefG1s8lqVG9JBZRTv3AKNqfYbaA/MP6We8j/4EIm86hPw
	OSWRDKtNdHIiRehmtizhHTCHkr9WuzEwVRtqvqpnXlzRTZB0a9WWdhVh0Hy+2hk4hTH8nViFMzF
	sfOys9D2NKciHfqI/eGQmMWSIcvwzkAAE4mJWE2x+ACwH91SdiCzv6+MQJg55gMdPRHTXucjL49
	di5mfXbMWpWVSdgUnx1D2crYr/83ZoAmYJigMAL4JALyhrW07ArvNyNhoVx/sF88u6qXmT0rtBk
	bGzut5KLqPNlnVxqUU4zq7EV/uMex2LUCfmCxn/lEMmuCunvBUYTlXmj4PvjNsSZzEnQA/sYEY8
	nliybGHeLZnZlj+aULzlpwC+5sQvqdtbsCUXL+8QAkGYrE26C1lUZeJ6SJtJMTzFdotoeJgAWhF
	cfx5INKbq5eOWuJXmESXPv+lINhIJX4jP6bNacYVUvVPOzGDZANgH1rJn3O1ajr61Dy/9g=
X-Received: by 2002:a05:7301:701:b0:341:b570:8d75 with SMTP id 5a478bee46e88-34c6605302dmr1125938eec.14.1790730219815;
        Tue, 29 Sep 2026 18:03:39 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 18:03:38 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 1/2] drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
Date: Tue, 29 Sep 2026 21:03:20 -0400
Message-ID: <20260930010323.93999-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930010323.93999-1-artem@trailofbits.com>
References: <20260930010323.93999-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

[ Backport to 6.6.y: this tree uses the older intel_hdcp_capable()
  helper name. Apply the same guard there; the code change is otherwise
  unchanged. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a
Code change unchanged from v1; only the retained backport note was added.
v1: https://lore.kernel.org/r/20260929031728.88004-1-artem@trailofbits.com

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f377c4484e18..f7987fb90bb1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -142,11 +142,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 /* Is HDCP1.4 capable on Platform and Sink */
 bool intel_hdcp_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	bool capable = false;
 	u8 bksv[5];
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	if (!shim)
 		return capable;
 
-- 
2.39.5
