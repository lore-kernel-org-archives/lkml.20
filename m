Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F64D0A17;
	Wed, 30 Sep 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772190; cv=none; b=IOwMLPWbwt4LsC4KAUIQX5Fk8f3yUeS8nOMN5HbRJchOXT7OVEhAAxhWSIeSCuzbu/DpcyNFvqwNEVSMC6UxMzR9ehQaASV/TB1bGZxPM8GlKhmvcFmpz659sKSCWfToVIg/zNCw5SrC4NHPU2P8vo/lazg3k0LRUuoNjq1351E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772190; c=relaxed/simple;
	bh=nFi+q46n+KrKRy5JWoWLaPT1tZJymG6zCNBTG0u4Z4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lD/3KgBwmLbwR8rAWZy7L6srhp4tRKZrOEbcCDAaqVdSlBizCvYX98BxBoOvNTeLSTCX+ufoVMBazYx7YJ/ojqLd3fdwL5mMd7Xavn+gBkhL5w3q1BX8ScHgr7O8MJNELcnpT9e3kACN807baSs15UzLSCZJgvGFrG69egYWzOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772140t680fd5c8
X-QQ-Originating-IP: 6gXj8k4IFRk9DPHx7mQcZTfS1KofIcp9A9Oj5xufV3g=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3638371730461214938
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:45 +0800
Subject: [PATCH 01/13] drm/atomic: Handle max bpc properties before
 connector state allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=sophon@radxa.com;
 h=from:subject:message-id; bh=nFi+q46n+KrKRy5JWoWLaPT1tZJymG6zCNBTG0u4Z4U=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZf+2rctYqaQ/vvFvrfD9stvTN0ZefrHDSWtM7u31
 i3w2VG+v6OUhUGMi0FWTJFFIZ5hLntl7rWnYqV6MHNYmUCGMHBxCsBENmky/OH4tP/RNfnSSScD
 rOXZzzjVHJyYt+NC3vkLLMxMBzKvz3jHyPBuhtCN5QIf5bUkmqtr+VYJvuLm+3QsXq6mZ2etT6L
 LG0YA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mnff/9wu0oJY9cGQyBSWIDZxAGEEgG9si6qMA5n0iYWu5py8GgQu9AYe
	my0JTqtSxGRc1fxNfmcvGmJdllq5KY211ID6Ha5XdJ97Tx9Qven88H0c4EtGvLhkxnS4w+O
	RP+h9edE7KMnXywtZiYo41bm3XoSSOQc9wxTkhRyMqzQDmpH2dHE6Df8LOOpRZp9143w+wf
	bQ5o3M60K/vALoHpGp4BDoFNjcga18I0Rd7E6BP7rhbs004uN3m8C86f4f4A3VycjQfizFE
	ucqXnGWg5eyOuvDt/MR3T1MTz7hwKVRWWixfgLlHzflRa4oMk9dhf9vaWZwA/tdDmNHbyR+
	rneLEaeK+IaHVvq0tO2Jr7xi5OuFCuQcB+tE8fIBl7FkkXivJD6mEdULL3vj0fXbllWgIo+
	XkfLT2HO5EWoOUv6GuZhmA8EDNTybPXHvBQfxsXQ/TnH0X7skX+wwivEHiPr8jJ6twzBhlQ
	Y8Tyq0twW6sK7m05YjD7ks28+Qmzb701B+FCqOrhfwbbxmSgm4laWYliErwQBfqgnleHa3O
	yQWgaSJuD+MSTR2J7nkh+Ac/7cnNmuGpKc0dC+bqeio/Gb7AGM1PkJfJE0ND0/SF02rwUGH
	HkwTBrd4QvYE5P7n2mtucyDF/5aHBxd4GSjErsQCBP8npFyfG3sPFS6QtciMerMHffwdt0F
	0g90OMSwmnX/9PHYo8Bx5UL2ywj45eHeZ42jSTImqP3v/vuccSbGOm0jypxZ8HO4FnQGb+h
	QCJ8mYiVeBpoEm5c/0qH02vtJqmeei8L7yF/2MmGTaEgcj7zruZAmNpTNlxqlAkTcAcoTa9
	azEG7ZbG7IPPSas9442yY+KOAV3Kw9I7gVcFIDB0/PQFnP6eFpzb5wqm2setaXOWZjE5yD2
	NHxmlEGqVND4X1N6kuVC5JeopJPyCeCUPT+8JqJv6kmswic3JldWNST6904QmcuZQI4Q9V6
	ArGyO/ChI7ZjeNQMnAOvWGogBbHsyEPIEnX5IZWPvcIPmlTh/i690yicwbb62LpnZlkIV/P
	3JG88xqEA2uyquVquPvgdZ1gCFTZg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Bridge connectors can attach the max bpc property before their atomic
state is allocated by drm_mode_config_reset(). Unconditionally updating
connector->state in drm_connector_attach_max_bpc_property() dereferences
a NULL pointer in this case. Adding max bpc support to MSM DP and eDP
exposes this during display initialization, before a framebuffer console
is available.

Only update an existing state when attaching the property. Initialize
max_requested_bpc and max_bpc from the property range when creating a
connector state so that deferred allocation and subsequent resets both
restore the default. Avoid leaving the bit depth at zero after reset,
which would otherwise cause valid display configurations to be rejected.

With MSM DP max bpc support applied, this also restores boot on the Lenovo
Yoga Slim 7x.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 5 +++++
 drivers/gpu/drm/drm_connector.c           | 6 ++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a2ef272e9f27..91d60bc7a2b2 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -34,6 +34,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
+#include <drm/drm_property.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
@@ -495,6 +496,10 @@ __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					 struct drm_connector *connector)
 {
 	conn_state->connector = connector;
+	if (connector->max_bpc_property) {
+		conn_state->max_requested_bpc = connector->max_bpc_property->values[1];
+		conn_state->max_bpc = conn_state->max_requested_bpc;
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..34c30469f405 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2886,8 +2886,10 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 	}
 
 	drm_object_attach_property(&connector->base, prop, max);
-	connector->state->max_requested_bpc = max;
-	connector->state->max_bpc = max;
+	if (connector->state) {
+		connector->state->max_requested_bpc = max;
+		connector->state->max_bpc = max;
+	}
 
 	return 0;
 }

-- 
2.55.0

