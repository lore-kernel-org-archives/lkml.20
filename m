Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476659;
	b=pR45E0pk8GqgJ8pwGfNrY1GGjWWj7KXZR+B+bEPdmcPOnabLxvVl6+rHUXmUV6s68rJV
	 mj+dfHPIpmwHMqhCTlRN3LfFxFLPzXAsvqS8lJ0p3MXp5QWxE1B5bVIcbqbAwXHpwfuhT
	 SiRNQxw+yxGPly5RNh48rvl6WjREapLiXGbKCiMoUcKMivbx3yZevj0UfMXQBCRIPO8w5
	 xfWX3dg1ntGYra2SKkEoEKBZv8QrJYI9Vr0PDdR18L8NbtEDGnvky8C9lp6rBUWexwi95
	 JGHX/KK5CH6ew0l86zii9K3YCudBGhTTtHLrwNMY9oMzqFnLiuwb3T3TUA017C+AKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
	b=F/3jjG8B9ol510dr//X3ZMYJMks+s+C2iJsq7ftHDrJX02I7AD/pyThby9cBgyoj1YwQ
	 lCtKmWIfCtF3GRM6NjfLih6bNmXvv+jYT4SrgfZzYwSPIjnwaVqew/PftwUQgS7wtjl/q
	 QlvKnPtsJVd4b0hJmaZwdotowGKU16gKIoGJm48LmUW6aFdYguTn9OTwnRSPGCdF398ai
	 MdLMKJvAvlFmGysEZIombnZ4lWjCY2S49FXdhdynOb1kSj+gaEfPrcjmIZwqo8YjQ/myW
	 Se+aEC39UpcBOCPoqEWtEXQ0p7cQkGxBWvl9RTAnJdS42XBBdH94unAu9Dr9nptRsuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bwbzEbCB;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC00E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bwbzEbCB
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3aae7df0971so19354681fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792476656; x=1793081456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
        b=bwbzEbCBKLILFMcjDjfHaekztqM7Pyji2tFufkZ8htUzXdgMg+CPqH6tgjR0Nz84+g
         q8D/v3kagHhkZMH1nqqK3ZDki3gyzly0NzhRzk6c1mnXH6gnqn8zCvqxK0CIVBt0DuRk
         ykaHaW1H2mfano4cteTwnuS/YqTQ34t6DVFpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476656; x=1793081456;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
        b=v8+FtFWlgdQDu/UkBKzpUdM3bXxl1VLXcg9b3q/3v2k6mLJPsglPaUbCYAiUlM86N8
         MYFlnvRSs3EOBgihdhNK3cg2sfBrGDcZ5BMg+7oZdqbGXZ1d4PPrkx7Gr7MJe+ijVyTL
         IhRz7wu5Y+/wy99jyni9oikqPpyvI4kMjVw2sKFQve7zHMDV1IHG0V9BxmfxKZ22FzoD
         l41X+JJdpAxwppDxwmTMqxFwyGINztT7fJZCZ1Qttca6gqgvf0ncvBFcRrwD520NXdG2
         E1PdUEQ3kJ8FmPhlaMqpL091ye8IhM6VlQdHMj1lqENBjQTePIH9k86eXsR/iUskZsWf
         AU6A==
X-Forwarded-Encrypted: i=1; AKwUvBwUvIE2/6sodQiucQuAcdWE+5K8OH7V5gt6MLLngO6y+rPO4Vxl3cZBTDsWNczQweFCMgoOhJQlabcQO8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWZpgJTc1oQq70GSfy4tBVLBg+h4SmPnwK3TRzla9YLrkjuub4
	VYzs7GxFjUygGeJyz1SWSyaS/Sx+7VWjGybAKI6v1PGAYZ3fw9hzr+jKGg6ElQ/wZlsLTfxyUz5
	hGCI=
X-Gm-Gg: AYBFou1ZMet4pgZyeLHTlWh7J5u+/h6gLtZ5fg3YfoCjYdav4HPmgoRlrmkV49YC9TC
	ThJHrbwvETHlF6pfkPKOvp+gdViepTvvq2Nbag1YSDpWZXhXeRifd3es5lPrWK9O8Kzkxb5ITLc
	5yIGmkadgA2oMkuy/6d4ouTXup7+cFylg8qSLo1RrPk7mI7lfZKEiyOj5M4zGdFFGPAY3gJsLmk
	GiWM+vflLG+8o16TFxjT4bxrawhYwkJvp6T0Pp2h7YFiTFeesSjgzs2Qo+uIoINS7E/OBuHTCpR
	jd9RjoXe0haV2dazoPv2DzRoDLZmUzN/jutg9t5Uuk+rc7L2FXeSsySyUhSAGek9VK+92/z22rj
	N3tG1cvBKrz2NLY9XKEbYM+bmZ5I+l58GZAU1bY6HGwSr+MMDWATVgH12t9rchpZigYxhKpULPf
	LfJRio4AhVbaWcyEm8RMEw6FwZsWLkGZ0BwcSu5p9dHNamVNNU5l+MCaqbwHflmZDD3vme7v/1k
	tCTi4/OL6KWn8ZMr3TFIYjl9AIMGo+dpgCWPhFoCN0zrtkg+RqRt8E=
X-Received: by 2002:a05:6512:3da1:b0:5be:4ed2:1e22 with SMTP id 2adb3069b0e04-5be50a81189mr3184228e87.51.1792476656072;
        Mon, 19 Oct 2026 23:10:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fce99sm2370782e87.9.2026.10.19.23.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:10:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Oct 2026 06:10:52 +0000
Subject: [PATCH] kbuild: pass -fno-pic when probing for -mfentry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-pie-v1-1-9be09f2324b1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOsF12oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3YLMVF0zc3OTlDQjgySDtEQloMqCotS0zAqwKdGxtbUAaz1zzVU
 AAAA=
X-Change-ID: 20261020-pie-6774df20b0fa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Some distros (namely Debian) configure their 32-bit toolchain with
--enable-default-pie.

To properly probe for -mfentry on them we need to pass -fno-pic,
otherwise allmodconfig will fail with:

./arch/x86/include/asm/ftrace.h:9:3: error: #error Compiler does not support fentry?

Fixes: 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker probes")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
I found this while testing next with media-ci.

Full logs:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/113299249#L4729
---
 scripts/Kconfig.toolchain | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index b0b9a663ddbe..53b361cf365a 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -170,8 +170,10 @@ config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
 
 # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
+# 32-bit x86 gcc does not support -mfentry in combination with -fpic, which will
+# be enabled by default when gcc is configured with --enable-default-pie.
 config CC_HAS_MFENTRY
-	def_bool $(cc-option,-mfentry)
+	def_bool $(cc-option,-fno-pic -mfentry)
 
 config LD_OPT_FORCE_GROUP_ALLOCATION
 	def_string "$(ld-option-str,--force-group-allocation)"

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261020-pie-6774df20b0fa

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

