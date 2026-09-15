Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DA388382
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439272; cv=pass; b=ZQHPKUEueaFB0WRSaXSnc+UxswOoietTlhvkU0+Ax5LfaasS2Fh8ykTvWwnF9e/HS3xumJI/Nmq8LwhmQn35qaL/dnGT63sA6u+XVvHJXkFdTF4BqK3isRrwfTO0Mh/bQDUKPFAmWih0Pwi5JM5v5XDfppC3x2u1ag+69z74pj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439272; c=relaxed/simple;
	bh=SYEre5z7yvx3xf/eMRfZU0DJWZg/LQ7xW/owFslPHg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYwQgTiHG/h1zFHsNNjoJy8dAiSFFDUSRu5tXPpg7cp2CsYkJ23bLtVhdWnbVd0T3hzUgB7POXXWrn26cmojcfU9KDMc+0c4y19cSAtZ9haBRnlWApV5fMBkQAhxgUzGvcXvdx5FVHHqJPD+paldj+tl7DpXC2DYoQRFcEHYCWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu3ZPoJr; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu3ZPoJr"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so22971231fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789439269; cv=none;
        d=google.com; s=arc-20260327;
        b=pzWXqUs2LJztIqEfRR8Nu3Um1To4IzpnHNzPNxdBUiep99kmCHCQTROfqJMPzT+j+j
         pZSCKufTI8CPrnv+N064ZlkGKpDzv7N++VY+TvTMxkufzSMrGEPdgpkAxlNRTDK4KBwP
         l0ySEhX4HtZLGGSs4UbuB1IaXyLv0wH770yW1j5W3japLLDYehAtcwtdSbP+J1i1Mk0S
         kzj1ojyGzVHS6LWLhybwDJHzTX3cjEXKUJSafYWq5jWQ5cZAML+G0KfObCOyvuobCpdQ
         jvJsnzdncRnsuO8GnvCDBfbi4mOu0uS0qpY8dpzhOI1IyIUdmdUTSyXXBWiQ1AaOVZMO
         0lOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J15/iUq4hwNLgoAFGv+hkuhgPnyH2Vrei6Sk5/otKgo=;
        fh=3YU3jfwb+tWXBW694lkwX3DBAizZTADFB3sI52e+8MM=;
        b=LDeR+drC0gGGPbZccd82ubMJFC0pdeyjpy1nd8Gfx2SXVQm5s/evGg5iDKbfTtwXjj
         q4JlhAVnTzgwzYSkGnrk1zdcJBtryQRlcleDXu/EoEbFBU+gnMkWAnGBEgO8qFh6JOWb
         9X24bzniVJFrWBDK87945LJbVL+6jQkpzuVyOGNMZDdbNfMdOy3+Zm/kRaE/dS4LWy5o
         vnMa0hW2qFN0jhNSfnhkJ3SFuZeZRlBNNhQly59UT7Zio3AI8Kc5eQRn3TeAeP8Ans0Q
         kc8nLJgk25Pcn0nPq4ZjwKjNG/GXbIRIZtPjJzf4DAtp3XcQfYJ9Dt7z5ey2Wi8rXY8/
         iv/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439269; x=1790044069; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J15/iUq4hwNLgoAFGv+hkuhgPnyH2Vrei6Sk5/otKgo=;
        b=Pu3ZPoJrOAFShT2vc7yNKDClVnav8gHub2ZyEKdN0m0sp/MvnIwGjeukbrozyvMdF3
         Y3VBabZoAG7tXtA8Gvufsm3n/n5P0HP+D0HHTJtCa5wIPQaLchV51D33Zq0uXlp5vAVI
         HRUr7NDzJr26/UWE6E19BecU2TU1mwH0pVogh8iVJms2zHzh/0d4z8uoXDjgYphphk1F
         WxCbFP/rkogkg56IZXiYSNMxE26lH0qftK+jjxIwzWimB5+zNt1WwUUlJosQcJWHx0kq
         hREr06NYn3r9nYS5Qz954zG6oQS/OSyym580DPSs/eOH15NfXi/mcSot41mOD2Pz7R3o
         s6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439269; x=1790044069;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J15/iUq4hwNLgoAFGv+hkuhgPnyH2Vrei6Sk5/otKgo=;
        b=e1Hp8CrcW1mkW4dx6L/lfZwywPTPvE6Qq4zI+GB+K8iqsNy2hqB4XsXsK9/o0j46EE
         v90ahcI7JL13J7/fRLfGmMOhBvhq9aVqY22+NIW4jT74mXxkb6iFbXAPedVxVaFcEYXp
         93/jVniNVX4BWV3bdZax8eHkZfibWPOp3Gpw8ifw036HEo7P6bHx+CZxrBtcweu4Aj68
         7bXE8VVmi02W6BNncL8M1C0p0es5/u3aFkfZk/dS58QIeUJtR8O68RLqafBLpoKPuAPe
         SLQPSqri13iyEChkFpgb4PRC9HrrUenMwiNdBjUM+IHpGTz3mW1ne30BR4XbJc8GRKkr
         lt1A==
X-Forwarded-Encrypted: i=1; AKwUvBwdDGMS6fSQsWyry3bmCfAYuTdRYIUjPmx5WBq68eMmtFmRYujFbHen1xQ1LPthXT/zAgkbA3FFB04LhSI=@vger.kernel.org
X-Gm-Message-State: AFuF++kFtbXwn1eKClD7uV+MJA5Pygn/b0UW6I9SrZwReMVeCFzqytuP
	PwoUldphLveehR55bGiJeRP6Yazp9+ae1aGBKsuRidNw4RikDcKTxcNg6N/P6e0J+IzXmQyTzBm
	PRTzWpZ/lWWVPVyDJSNUc41XPlh9CRlM=
X-Gm-Gg: AYBFou0BFK1hv8WMA9yOOMzigMWtp2A7FV/DwhfhQt4To7Iae4ml/xItAL1GB5qhgEq
	YHORm/J6R3cVS6FiZtHYSPyY7Nvx/uNRIIb3yAtJlNXFGcAdJmeB3fUJO+KTuSGZFTCok132vC7
	9ljDFOhtvbgwbNqB5uFLTldea2mp3fhsvXJyKxyoEwnnNFt1E+N3e+p+NbzB4h03tP4dGq4zuwO
	R90+HSM7c/S4SXOrPTSeLYF7Aof8znvHOrbS8DjiP77cNUULCQBBHrD9VdckJ0haX/VPH4uxCky
	VkzuEB5+iV+8LdSgSxeOq8lDSOxuH8Vz7XFug8K0WK+91xoOkcVUz0elxx0m2H4NgvD5W1VFMRH
	Q8X5n2rozKxoT0dRB8ALS+Q==
X-Received: by 2002:a05:651c:552:b0:3a3:74b7:fc0e with SMTP id
 38308e7fff4ca-3a5c899c408mr7848431fa.26.1789439268807; Mon, 14 Sep 2026
 19:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJxfpZ+AzJnBCw-jP5_E8FH_+cpCE68FCtf_tsi9pt7q=P2Dsw@mail.gmail.com>
 <20195022-cf18-45cd-829e-b2866e7a3080@amd.com>
In-Reply-To: <20195022-cf18-45cd-829e-b2866e7a3080@amd.com>
From: Dan Himebauch <danielhimebauch@gmail.com>
Date: Mon, 14 Sep 2026 22:27:35 -0400
X-Gm-Features: AcwNN1Ugx9kcCV2VjGKc2mgeTlJvZfaWap9VfMR_r6vEKfUTuZChjFWCy53hf9g
Message-ID: <CAJxfpZJDvFuz40a-euL0jRkPBR82M8Y5NxBrpABeP+EZScFxGw@mail.gmail.com>
Subject: [PATCH v2] drm/amd/display: invalidate DP CEC state on s3 suspend
To: Alex Hung <alex.hung@amd.com>
Cc: amd-gfx@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com, 
	siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, bhawanpreet.lakha@amd.com, 
	wayne.lin@amd.com, george.zhang@amd.com, jerry.zuo@amd.com, 
	chen-yu.chen@amd.com, ivan.lipski@amd.com, evg28bur@yandex.ru, 
	Kun.Liu2@amd.com, mario.limonciello@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Amended and added issue link, thanks!

From 2916fc883b80cf106ba2b06d8dadbdae45eff7db Mon Sep 17 00:00:00 2001
From: Daniel Kurt Himebauch <danielhimebauch@gmail.com>
Date: Fri, 11 Sep 2026 21:11:10 -0400
Subject: [PATCH v2] drm/amd/display: invalidate DP CEC state on s3 suspend

Some Linux HTPCs with discrete GPUs use active DisplayPort-to-HDMI
adapters to carry CEC over DP AUX. This provides a CEC path on systems
where the GPU does not expose native HDMI CEC.

During S3 suspend, amdgpu invalidates native HDMI CEC state but leaves
the DP AUX CEC physical address valid. The adapter can retain stale CEC
state across suspend, causing transmissions during resume to fail before
the adapter is reconfigured.

For AUX-mode connectors, invalidate the DP AUX CEC physical address
during suspend. Normal connector detection on resume then reattaches the
adapter using the EDID-derived physical address.

Tested on a Radeon RX 9070 XT HTPC running SteamOS with a UGREEN
DP-to-HDMI adapter on amd-staging-drm-next at commit d8ab7636160e
("drm/amd/amdgpu: remove duplicated code in gfx_v11 and gfx_v12").
The unmodified tree reproduced resume NACKs. With this change, multiple
cycles showed Image View On and Active Source transmissions.

Link: https://gitlab.steamos.cloud/holo/linux-cec/-/issues/5
Assisted-by: Codex:GPT-5.6-Luna
Signed-off-by: Daniel Kurt Himebauch <danielhimebauch@gmail.com>

---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 0b446133edd8..919394778a25 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -372,10 +372,13 @@ void amdgpu_dm_s3_handle_hdmi_cec(struct
drm_device *ddev, bool suspend)
  continue;

  aconnector = to_amdgpu_dm_connector(connector);
- if (suspend)
+ if (suspend) {
  hdmi_cec_unset_edid(aconnector);
- else
+ if (aconnector->dc_link && aconnector->dc_link->aux_mode)
+ drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
+ } else {
  amdgpu_dm_hdmi_cec_set_edid(aconnector);
+ }
  }
  drm_connector_list_iter_end(&conn_iter);
 }
-- 
2.50.1 (Apple Git-155)
