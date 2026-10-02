Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65B41E6A9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970039; cv=none; b=STnwaiz1useVDBHL0HXpdoRWL7K00Crw/lWk28icltOk3/uD/BnNF2xg5JVfVRvNTwkJ5J5xXn+c5GWs2ZBSTihF18Ex5/WZBq0bwB01vwi91xSwxZPY2Ao863+JYvqqhbKVwtQ5XwiY793CokvzYiKqNCDUn4a7kZ11gwwqDvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970039; c=relaxed/simple;
	bh=sqEsjQJsK/gVrocotISyA6K7tQvW70gwSYwBLKEnthk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGgnRHfJG2g7wXagSRnfzXoGEfbmiDW2lHK6zsY7ZZNSp7pJCNgn8zAyKkOLCImRGaGmFzNUXGAI6Q7eGG0zu8HIKB4XVhwhaqkt5lw9VC02r6YKYAQP5D81fcpQnyG9LkJ0ztWLYggsMsH7oOFoYXxgw3UaAHtSqLzpOsujbLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=TkabbgAt; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="TkabbgAt"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14f381f0424so797909c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970036; x=1791574836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsIJDrrqVrbyQzUJcQTVkyHK/0UNIS8D9cN3PD9t/4o=;
        b=TkabbgAtPzOjQuRiUP2Ii28CPckYKGFNi82AqoAPtrpd4PyxXXq798K1KDN7QHOlOc
         5pXPdAPhr/PpOrv34lYIt2DCxOl058xiirfc2XjeL8stLt8avzg94AYMeHYDKzJpbzBq
         7xtwuBn2X35PkbunPZFe0OoORQi7aZ0z30hoi2V2hMfM9yLH4D6OjMGlnSAoEhOQCttv
         TbRd1553aGjSkQOu5c7L695teyue6WIBLngOj0KrHw8te57khWxV16bm+kE2rz6E1LUb
         52PnSQafvzZy+g7MrLKrX5mdC5pK1KnPtuAs3Wpo5N0pj6Pg5UM/Dpy6ZnpM7N3Yzx1M
         18mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970036; x=1791574836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsIJDrrqVrbyQzUJcQTVkyHK/0UNIS8D9cN3PD9t/4o=;
        b=pJaCO3Ncv5KPjysDowqQfQhfoWu/nusrm5yPR6Anw9n5/VtPsJtCBtWgyzzdzcpdpQ
         UDy8l1c9idqYAlZ0dramb75R9ML+981jVpqf3jMi5vpmQUbtA3pLBrVuAu/s6od878Wv
         O/+eA/VN9aCB1FAdYAet4JjcZLfpNL7YKuPlfbs5UcxG9RxRQ3ITQab7PSuWza7EO4Gj
         T5ivny9fJvGg/I16mAGAILf/sZK5dsCWfZtVAYDHjjMB1K1PuRxZRJ3FLZocSP4wZP10
         WckPtSY52E0749vLq4V3Avkl8cLQgmxo8+KfswdWILW80nF0JTV+cQfskjPZgL8XVsCK
         8DEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwECR0R9u2Pjlbtk8B5KVJkmOrTjZegMrqjOmCaPGbhwiScSW6NDcoDFoCnYetjm9cIo4cfGJJXZFu6/Fg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuBCmoPnO0S4Azu16kkj75xr665Hq6YlsXPW/HdnUG3UrrE709
	oF3kkWD9TpVE/AWlJW+GyHLmizqir2ptH9v4ep4IOTOBss/edDdSRqESuv6uw6OmO/0=
X-Gm-Gg: AYBFou1WAZN1bva74Jz6Vd0nGddzLgHPRz72VYHUQIwfvRwAwskFO8kNANCeEn+AEzc
	wEf0r5pLKJCrTaL4ALUHR7ysDNntIc5eqco/ZbNIiEVSqVttu1GIqmG/n1np+yQiuFSJWhdfjJw
	1ycGP9gt2jMfIovaBVU6w/fDYVgZPkKUC/w2dr0V30vMPQ/IBxMt3jPJsxDUtVKCGHQE5havFZc
	tmdN0XUHmPWdi2I93cpZjC4fFfWRNeBzkCTbfdbPzWXp02t4HpEfGwYYRmgNnIe9O9aT3VvIDgf
	XkflPaMSSDOQvQ1EmedSrEk9OxaGrDVAcZee4ckIPiF89pPcfwV3mvDONgMW9CltXNtt/aD+tgz
	beYhyOEpbxI7/AidunAUCJwlZDsrN0ADL2EK/QTi7ZKNRDQuI1acE6K20OBZOrFbrQvJQBTuvxp
	37R/stsokRzWBKQlw79mzrgic9CxtyzMoYN4NDdC/eVaojvAFx+Heu6XGUfZ5QNv1jgclZNmqnY
	3llBZyOkHMC/8/FoqReb/EtqzXLp64u5FuPRrOKfSZrA0MFoXR0BjkGbfNXa2GKQUHq7VU=
X-Received: by 2002:a05:701b:241c:b0:14f:99a2:1715 with SMTP id a92af1059eb24-14f99a217ebmr3412492c88.39.1790970036327;
        Fri, 02 Oct 2026 12:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:40:35 -0700 (PDT)
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
Subject: [PATCH 6.1.y 1/2] drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
Date: Fri,  2 Oct 2026 15:40:26 -0400
Message-ID: <20261002194030.20489-2-artem@trailofbits.com>
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

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

[ Backport to 6.1.y: this tree uses the older intel_hdcp_capable()
  helper name. Apply the same guard there; the code change is otherwise
  unchanged. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53051. It rejects the HDCP capability query
when hotplug or resume left the encoder unset.

The 6.6.y backport went out as the same 2-patch series and has been
picked up for 6.6.y. The fix is already present in 6.12.y, 6.18.y, and
7.2.y, but not in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index cb7f86de967a88..507721c94f2fdd 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -182,11 +182,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
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

