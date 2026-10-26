Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984074;
	b=AXZY/k2evCg6ZakdqIPW70P3Pl9Gnn4AzCVUd0XD+/vES5LoU4pOJYatzBl/5wVrAZBA
	 E/nt/V6TAT1nrcow1WVhUaxyIds58ePVOwuK8p6OPxQkOOAo2jDJ8iG+w7hsDW3l0Csyq
	 8vNDzOJach9vTVfI0RCqc/zk4t4MH2l3cGrxVNIH/E4rZMtUv+AkSAevTFoIS6XqoKIDN
	 hmAP79Kv2zJ7PWxzD9qLNnjAiPkrE8ndBNL5hshOex/nIQSVzAXyNmJSQEOtSapH1eMdT
	 vrhh1fQJ3jvnoLtBnLiaCpRk4SAf9Xbjun4SGF92q1Zk0j2z43cqoijtgOovsjIVCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
	b=3hQnjIEdJqprYNH8zkVl475PNkNLi70+Rek7mCY1kVzB3ZVS0SeIZJPz+yWJv86WON+m
	 gy5E2UKSceCoCPH1WRLhLViiZJkFZrPuX6jQMu3Tc3c9doi3vD5/qg9HbYJPzq9WlLWbz
	 ykcGTFx/zPKm6GIcyX9Jkj2GDBiow5mOjIlJEl9g/0zy8G0cEIj8R6sc7i6aN3kbUQGYl
	 pJqepgzjneuN7/MVpTZWFY7wTDnc2c3R+25+EchSWStEuK5xtdhMzUahM1HxNsonlWKm4
	 jfHV4BZV3hoV6P2ORgr+tM1MV/TjBQHz89/zVR7x0v2vWGZFTzyAq5mpvMT2tf+G+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UVDqhua1;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D38606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D38606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UVDqhua1
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d290b10a35so1086002eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984073; x=1793588873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
        b=UVDqhua1NDkYEcmAK1m6++8H4grEOIF2P27IXvv6Fff+cSsaPl+Lgv0KlzS7s/EaHZ
         jSn4RnpdMjDFbNwDRX8EZKpuAjNG7/mTRgPzEpmESwpe5HTRhZ1h30hfIiGTTpCJcj3Q
         DW0p2JiZTqoB5he2K3hOGAVd66Z0Oi1fDbiu1q4IjKHbDiffxWjTGIQ0grfse/kPUf2h
         VMBPHEkxey3b2HtBE+6jH4OcFSnaWwQxzswxkdPASyKUcuJbxCBP2/8sWKxb/IGwIYLn
         PVBgcy14jUjINI9zStF8iqiLxjSRdwOBzwsVMPg4HZDpMOYyWq3H3lXEW/6ILUhRTraB
         W9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984073; x=1793588873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDsRW0hZwgFCAJKIXhtjDM35UWFd/bPklgIyU9R6/7g=;
        b=1Dq8cqztvSQVP4wLWI5rpll7inVG/CVBHBgxmYBoKa5YGM75znjNlFkRW/NbEnSMdM
         ToTmGvGAG/X7ErrxXTKT5JUMq10r49dp0JsTqo0FnSL+qnOA/pL9Utb6IaihhSpVfIfc
         um0XZB/8RXMCApHw040Yj1vot2WfRJHXjDA3yU+63hkHw1i0jTJAd+oAUNLjq+YO0AIQ
         vZBhRkLc+J17vA5J2iqAEb9Ge2KNT/o8wfbiW7cUYF39XMl0mjL3/VtTfpCp7l00Xxoy
         HrArBwjdnYVTAd00bLtXkLk5xzXOWMxSkIivUqfNXTr9I04pSLRowDy7LQxJ/+ewOgL7
         lKqw==
X-Forwarded-Encrypted: i=1; AKwUvBzaJGQhkENcd4jZAdioXBHq3ULs9FibnIPI0enxp1TI41prCswipFTQM/TuT2bcryW6+xfoxr6iF/OfMFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFD7feBWiGlP8myMK33jSnEJXfLYQwvDysr6fb71mPWQxDEK6r
	xnj777r0BjhP1In5BQgV8iJkIA+FHDTSmvZlMiZapqEVtro2MWernXbFiyf6JEgh
X-Gm-Gg: AYBFou3udEEk+UhXtef/ukB4Z0hWKNGZoa2jEudcV2l/OX5eKpNdTeYsU0F7iR5WEym
	sFRsVC4dfESqePI+y6EwSnFZQj9junD+WFBMsElJHJtgouCvjhoay6q5nFu3+GDEfl97lxaLN/f
	8TE4MQihPwW/4qXzxEWFsDSJySYOYo+ZhOJfHKBWQvn04gq/2hwkG4ciRUfvsYWPunArgjnRSFs
	UGsFUPR6BjNDib1T+o7qZ/QS9lq31yBZI7fvxw7yWQNQetFQ+pzv+ETnUzSbNdlWlVw0hgc90f4
	2vY8gSBW4R0k9gyyuqz5NceL1p+z8bOsnOrPCMUKYXg2m9hAC/O0PF5xvM+1CVXdm7CgIEeQmBv
	YR776BtAFnThlblFH+sG4nMIDywD26f8w7GVOpHKjF2yZTYh9vbBXLo0gsYaGJfxZ7CKGm+DmhV
	f7Sev/sLkQe4GmYmpIn06HU2nRnpV9hqIaCPuSKmZVUwK+rR4uz06jRTgYtPzZrh+0tKbFCr9Iy
	KIsYRCLCUPkJm9lopmHLh2KoN2cOL9X33OpDtDuOmYwM8J0ci2wjVniWY7qUyr3YTV/x/27isLY
	HG75fbSRAdX/vSQDcKsUmTB0U+A=
X-Received: by 2002:a05:6820:1614:b0:709:529a:4775 with SMTP id 006d021491bc7-70ba0eaebdamr2956945eaf.50.1792984072858;
        Sun, 25 Oct 2026 20:07:52 -0700 (PDT)
Received: from AkhilLaptop (mobile-130-126-255-35.near.illinois.edu. [130.126.255.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749cfsm6811729a34.9.2026.10.25.20.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:07:51 -0700 (PDT)
From: Akhil Boyapati <boyakhil978@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Akhil Boyapati <boyakhil978@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Use only the low byte of the thermal profile
Date: Sun, 25 Oct 2026 22:06:58 -0500
Message-ID: <20261026030658.119596-1-boyakhil978@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On the HP Spectre x360 14 (board 8C15) the firmware answers the
thermal profile query (0x4C, read) with more than the profile: the
DSDT's GTPS method returns the profile in byte 0, OEM flags in byte 1
and the device posture in byte 2. In Quiet mode in laptop posture the
value is 0x00041103.

thermal_profile_get() returns the whole value, so
hp_wmi_platform_profile_get() matches no profile and reading
/sys/firmware/acpi/platform_profile fails with -EINVAL. This also
breaks power-profiles-daemon and tuned-ppd. Probe writes the
unmasked value back, which only works because the firmware's write
method (STPS) uses byte 0.

Mask the value to its low byte. Boards that return only the profile
are unaffected.

Tested on board 8C15 (kernel 7.2.11, module built from this tree's
driver with the change applied): platform_profile reads back correctly
after setting each of cool, quiet, balanced and performance, and the
firmware's ODVP0 follows (3, 4, 2, 1). Not tested on other boards.

Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Assisted-by: LLM
Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..6180f1d21 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2117,7 +2117,13 @@ static int platform_profile_omen_set(struct device *dev,
 
 static int thermal_profile_get(void)
 {
-	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	int tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+
+	/*
+	 * Only the low byte is the thermal profile. Some firmware (e.g. board
+	 * 8C15) packs OEM flags and the device posture into the upper bytes.
+	 */
+	return tp < 0 ? tp : tp & 0xff;
 }
 
 static int thermal_profile_set(int thermal_profile)
-- 
2.56.0

