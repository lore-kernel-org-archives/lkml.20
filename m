Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4171FBEA6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180242; cv=pass; b=TLP/uc41/FBCErC1krdzb/aBbfLYUTqy7DQV9xhEa5Faht8TTyqCFtij2WBK6Hc4OFvbsEktQcp5ix1WlKKQ6ciyr2RXYFpWXOgKBYTOPlLqsF66wdP+tOROU+/yYMrUy+d2lPTymPD4BPyD6HsY8sefGTUW+j9dearO8eRuA+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180242; c=relaxed/simple;
	bh=NPhzT79vBg580R6u1l3A3WzT58CbbGOkUVAuxImChKs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JBJI8aeyQp65X2AxLifqlPRbXsgGJ5sAQzDnTpu5wj351py98XqcQBW5DRTTvftmkclBTMfZY2HHxajfV/6DWLdZJHPu/Ai9WuyDfZBKYE3xLoIeyBnZiJEFhTr5/U6JLEnS4RROvUEKKbhiicahI/bkU3uVN9tI2HExEUTOk6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnBsd+FV; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnBsd+FV"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49bc59559so1236661fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789180238; cv=none;
        d=google.com; s=arc-20260327;
        b=SL+lfm3VDuP4jJDZcFT23l4yYpDX/P1SO71lmEknIzxwOwutJkwSlfkOGQ0uy8JjOU
         /V2oh59tBqk5FkWO2IANGgIfP547AOdxHARu5440Wa5v9/55+NKUf4YmS+/6X8Mus8ct
         yBTgbAtB2xeHMabeyPT0tFyiIxyiC6DA276cOjouP6SUAesZ1v37RE7f8HT7w25ji+5R
         0H2ge6BWkIppv70UvdCXENug0xn+GCKexg6twlkZQVKJozp1yG9tPv8zkL+9dbDRVYrD
         12uT3jOFS9AL30l1Xyi4vy8c35S+JILlk0/3xEwlj+iL8uZwJNb9ukgfF3d+/LnC5oPY
         GrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LhlEYDWQpemuIMnWvpMSCy+QwKP38TCR3oYFVMnKb9A=;
        fh=lEaK7YlwIF1tVOPF9OG2fM8yHReDCBckXpSgIDnQwZc=;
        b=Xb4vJBzrAYsUXRIjMc5hcWg04q2FJhZPDMjkR0f12T4ytADshqwKdAx1r1amnYInZL
         Hm5E+166+e9JndZ/C57KyQKu7VnDcSg6yLmqjDfzFMCePg/V1I4xg/wRaztgvOBv0VIb
         XJ/OjSoCMpMOaLYvWYKR5dTSCDMgTzRmMaQ9h+Ix+ZVEJPjuYku/jfNstQW82Dmbs+/+
         c2ppAfQOzLnWMG+hU3Q+tjLz0/SeqwfCqDfUGAa2ZrnEpEsH1isDcXmgPJhK8CuutuNQ
         yIzXgk1ASAPdv5hoFORwE4NWH5d1PqQP9D/QBjybmOe3npHzRN03Z8jIX7CZ8fOkuMyb
         NB3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180238; x=1789785038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhlEYDWQpemuIMnWvpMSCy+QwKP38TCR3oYFVMnKb9A=;
        b=qnBsd+FVIWRksCCqWNlkiNGcoHhK1RGdgMaWmcsRe0lC6CRQVWuLuKmAqqv+g/fcpA
         FjmJlwJ89W4zF25oSu+00M51lCxzsRkvl1k37vNg8tOpFYmOMJYz8C/n+RcwC5TWBuvd
         sW82StRSx9de72Br4NmBdCvkLElORWH3VyYBw9iJM3Oo1bpGE2Dk4ODb5cYB0TIdZFYQ
         S8f6bh0dNW47F6QY+pf8BWdxhmuRE0u4rc6n14KWOqR/rchgywYqA8TRQUr1+onEL+E8
         nctROi1RSCDqmTmiQCxOOE2I7uorvcerkFYCA7qvilF7upuKxtk7seL1NKNBr1fzNLU3
         ACFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180238; x=1789785038;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhlEYDWQpemuIMnWvpMSCy+QwKP38TCR3oYFVMnKb9A=;
        b=kC9dGmIudjPZsikvHvM7hrdt/udCXwQNLXVvj2mGbtrlaUrZWM49I2xqrGFgOTgNPo
         4J238I7jY48TJ+Di6aN0FKvF4z5SPa0hw99yl4jyvBswCeWIcuIC+eYzSVWztdUWSAD8
         Kra+PdQhA9slV5ubnINBV66OF+uhgG9BdjnLRw9afq0RmqS0GwM2qqi6WIbinAtq4bda
         d/yCjzV7wDLCElBH5yLx9Wej88f8hyo0VR29wYAS/oUnKohJI4CiSwaAyTnHZS8qz122
         kd5r3LCLCJZfyVSly4GNPnWXpyPEvJgdRRzhc2H3EWl6l36N+0GinK63lhhnVnfJZSzG
         xqrA==
X-Forwarded-Encrypted: i=1; AKwUvByQ1yk+EmnS551bIDzYsa9dGUlW1OrnOg2Zgp9tbp2fihRgqZZtiZCeKMUNgyHIlQHfSKGmTp6bDKnqX8g=@vger.kernel.org
X-Gm-Message-State: AFuF++nlxdM+iyQ1ckQw6AR8sT7VC7wBXa8IlNDnsnRPt28hTFBIAHhG
	ZoONnY7ZDeF97sHvoGiz5/yrP0+FYSh7AVKcc/+Zr7dUaB0yv+gXNX07GekmqLtzwp+z2g1rm/N
	DCeLfllebou3j2RSJolQy2GZ3I1JyykQ=
X-Gm-Gg: AYBFou13lxmhDKDP8ps45LbEZ2nwe8V8rOPry+TX0inOJt2Tqf+cZtg4Lh0wFij8vvG
	suTIVQE0bTJG0L5OYXrgfe76bho1gM4KtzvIF2uAsCNcHt8FZnzwb9hVUhNDJiB40gwFWb+eJSR
	N7shkceO1elbGEjWzFKboi53T0HT6N0wwiZQ2Zbrx9bxnQolwRTmj8TN4v/HQUpTOiUPo95GYpk
	Yb90e9B+0J9VgUvMdJlcbavnI59ww+mskKmWOs4xSrFmVp26t95/aAAvJt23ldzCTMvTY3VdQqJ
	7NF4mf2mD1nDPfJfTDU2/JbiTgEG6efPvFfZAP+1YwPY7nKepKEfipI=
X-Received: by 2002:a05:651c:b25:b0:3a3:7681:6d67 with SMTP id
 38308e7fff4ca-3a5b37ef2f7mr1209821fa.16.1789180238192; Fri, 11 Sep 2026
 19:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dan Himebauch <danielhimebauch@gmail.com>
Date: Fri, 11 Sep 2026 22:30:26 -0400
X-Gm-Features: AcwNN1V963IeDUd-QUldO-pjWGCQZiXzrgoLRjiqt0-JerrHpoXg4IvNra2ffgs
Message-ID: <CAJxfpZ+AzJnBCw-jP5_E8FH_+cpCE68FCtf_tsi9pt7q=P2Dsw@mail.gmail.com>
Subject: [PATCH] drm/amd/display: invalidate DP CEC state on s3 suspend
To: amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, alex.hung@amd.com, bhawanpreet.lakha@amd.com, 
	wayne.lin@amd.com, george.zhang@amd.com, jerry.zuo@amd.com, 
	chen-yu.chen@amd.com, ivan.lipski@amd.com, evg28bur@yandex.ru, 
	Kun.Liu2@amd.com, mario.limonciello@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HTPC setups on Linux with discrete GPUs can opt to use an active DP to
HDMI adaptor in order to carry CEC over DP AUX, as most GPUs do not
wire up CEC pin 13.

Currently under s3 suspend, amdgpu invalidates native HDMI CEC state
but leaves DP AUX CEC physical address valid, which can leave these
adapter's CEC states stale across suspend and make wake transmissions
to fail before adapter is reconfigured.

This patch allows invalidating the DP AUX CEC physical address during
suspend for AUX mode connectors. Normal connector detection reattaches
adaptor using the physical address from EDID.

Tested on a 9070xt HTPC on steamOS and UGREEN DP to HDMI adapter on
amd-staging-drm-next at d8ab7636160e20bf6a2ad69cd975f4d63319f1d4 where
unmodified tree reproduced resume NACK, with this patch, multiple
cycles succeeded with ImageViewOn and ActiveSource transmission, and
intended behavior on wake was observed with cecd.

Assisted-by: LLM
Signed-off-by: xXJSONDeruloXx <danielhimebauch@gmail.com>
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
