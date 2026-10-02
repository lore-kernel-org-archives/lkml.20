Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5B4071E2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970040; cv=none; b=S35ZFcyusaK/BetNl6GB/r6CtMETNJ+e42tJg/Kha/IZu4XjI6GB8LWjtfcnE9iuDNDt4Flm9AOZ2CU40rLkO7yN08cpqUBcu5m2xl4cIUSWcqH+UTSDffKDFYzyomWcJAnD2jNuG6N+FfdGnJceSkrMNM/oWbDsOsIJMee7lIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970040; c=relaxed/simple;
	bh=82DzLhvJU5FuixkPwwzwEC1hK5czNAOvAAbd7Nh5BDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2MJFSg+tZZXGuVB0rma6LrzKxc4XKycUlv1uVof7Pv3BGJZS79pHM8iN4fais3IrB3up/odLvk0MZyZqqSVFiuE9rCeOIDxIzf3va+baSeX3KIfjn7LrAI02f2udLsmVhvAimfXElLpaIdorZQxiyOW4U2hI2IOgN4FqYH52SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=kMeP3hN+; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="kMeP3hN+"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso4951889c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970038; x=1791574838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
        b=kMeP3hN+AbxnZMot1hqDzgP0N6AWACtQzCDGtMDbIEJY+7H2+ZA2CrVjOWyx2Aecvh
         ItBgPJqg9HbtCxuN2sdOoduimV0c3hdM+oghYR3y3OxRbBS4RiOBTcwj/Yv4ma6e35VQ
         XuxY7Ur8fc66/LxDtjSPXVksNB7pGZbgxNpE6unNwAbze/CK9izqQViWR0QdKY4wiMk9
         90V3D1jUqM/qqc3v7/V7E9yApdPZWlnK7Dz4CkQw1fPrrLHZebElSLpYZ22aVTNnB0Bk
         pomro4731sS/WCUqmXFSvSyrryierKdqx7Y0L9wyJQCxttObO4BrLEyfjoQL0UTelvFT
         qHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970038; x=1791574838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cik4OmGCLcSffV9aIni80ba9p8veycKB8eAV/ioP5eU=;
        b=xJxijuXqx1evniUV6+b2zvVuoFsnTmlYDVScbdbQCVbt3LlC9e8JKsgSpTM9ZPJ/6V
         wySCou8XIHWXNof/SNH3FEdMa4A1fV6/kKe3AMbC+eMFf7qGAKmy7avJdn8eI1pyH/XY
         qifFyLTpUKXSH82h8qoJVGcwo/3t+n3TY48Aflthq+nwnpkvEV43kU+nszaBo2vBT/hX
         wHzhkFRJXZ1E7+znre597iwAaxboKBELumYIroup046oJ5qtivn7DdN0HlEnfGDmK1cs
         yUgKSianaFRbpZV8LXe12DRaQFjlg8xDeTOXb6M+MIb5qdqjf824oytWRnKuBmUY6SWb
         26Kw==
X-Forwarded-Encrypted: i=1; AKwUvByEHCkBWKAjajjmGlueeqdBqUknP4veZw1ZiRvw1rgJq8LjiKBip2N6DhC8BVDidF6m9igpO0EncErIBno=@vger.kernel.org
X-Gm-Message-State: AFuF++mDFPwr+8YHK4s3jVb+DYByQ880vsAdI3KpJ98l4nJYi055a0pE
	kvEiwGdQ+92RyowPbaBEYqhuZvkTJkBNin9W7CUAepIUIYphvXMb/CLjpSlGuoRE2Gg=
X-Gm-Gg: AYBFou1rgOzO9OWqKY4mEek+cekLCMAW4AQu7IOEseFHfv4Mg8EgkjCWPsXPlCLxXvk
	i+WogF4uuAzHp96+/JOTMIM2/sPWEhLnHjI3GvM7/sBXJhwq0QbZt7b37RA1EGgtLYqJpOkcM+C
	IVXh9TI6YC0uFiY1KFyQCxti+0ag0ThCCyKO0Rc6BJLs9U4ieIbZiSk77G0ozwEl0r/vh2DYNqA
	Y/uFEOME+eme5rF8Cu3KJNaRBwxxApYkIrLRYle1T2EftxmVVvqHfvuBxxM55E4dbfZdpghPNHl
	eIp4S+DtZytdOaaoOjGcFxMzB9vjGUaHigXf8ApIM5qPgnadrdxmvit1FzQWVjDpzy56flPjZTq
	05dLJT974WwEU2ke+DNRyhEylCfidEa9y7y7vKSoJ7tXTNdMuQTKR/M+/fQKzZL4zA9M4dkXhHI
	tr0Llm8HL9R590skwdjFGs2vRyo5R3Mbnhs37GqCaeGGpj+dOjJg8OZJ3H2OS12y6ZTAb7KVcWl
	sI132Ck7ZFGnDk5bzTyah0A9ABBtInmBj6ychjri8Z8zZ+Qx0eYdempJS7uj73F87nI4Bx4volW
	Z0K4Ew==
X-Received: by 2002:a05:701b:2096:10b0:143:2719:566e with SMTP id a92af1059eb24-14f5d3b9a1fmr3905150c88.42.1790970037645;
        Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
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
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 6.1.y 2/2] drm/i915/hdcp: Add encoder check in hdcp2_get_capability
Date: Fri,  2 Oct 2026 15:40:27 -0400
Message-ID: <20261002194030.20489-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002194030.20489-1-artem@trailofbits.com>
References: <20261002194030.20489-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit d34f4f058edf1235c103ca9c921dc54820d14d40 ]

Add encoder check in intel_hdcp2_get_capability to avoid
null pointer error.

[ Backport to 6.1.y: upstream adds the check in the DP shim's
  intel_dp_hdcp2_get_capability(), which does not exist here. This tree
  predates the intel_connector conversion of the shims: its
  intel_dp_hdcp2_capable() takes a digital port, and the
  intel_attached_dig_port() lookup is still done in the common
  intel_hdcp2_capable() helper. Put the same encoder guard there, before
  that lookup, and return false through the bool API when no encoder is
  attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53050. It adds the same encoder check to the
HDCP2.2 capability query, which the debugfs path calls right after the
HDCP1.4 one.

The 6.6.y backport went out as the same 2-patch series and has been
picked up for 6.6.y. The fix is already present in 6.12.y, 6.18.y, and
7.2.y, but not in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 507721c94f2fdd..d31c1f1f0e5074 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -208,11 +208,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool capable = false;
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
 		return false;
-- 
2.39.5

