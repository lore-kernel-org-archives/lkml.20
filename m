Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316536;
	b=4aaC7UhcNzaxPC/BXsGN3jr6bzF71VXCBORM68rBZNXwHAG4Z0Vy+YujR67qFK496Xm6
	 11WIfUl+Yz1Hz+bhZeqEZB5THEku3IC8cKsL806bKgxcO85nKtnX8vcEqIioXvWc6O7is
	 BfsMhDE32olJELlB3+soiOEfhtI019p4jrkBTa/Cgu7Mm50fBLvodWx0S33s6MczQ9SHw
	 +7OM++nnTk0G+Pn3V4X4pmfpmFFN+oLLxfVegv8zo3c+b5o8jDy++cA0nJ56fjB90LRp0
	 a4lXAk5RtE02YPpdOfRFYKjB4tsueeidy/CzNab2YXi+ur7PvomWpGW7a5k61bd6d8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PFzJ9u6YQvTMb93owgIg27Pbi0f8hK4InZkJZISUcYQ=;
	b=JZ0FkoeowQn0emYbL2riyx9icchMS/3vFsSs6EOX7LRar4EhwaN1ypxe8NIaM8DsDmIn
	 I9Iw01VFimwbNo3ibNIOtPzsLFsg0NBPMjGmdIJSuCrKECc/ucikDONQa0Q8wXpElEmRW
	 eV9Yglr9SKOUX4MWJGjfLcGfmicm4pz0zkEAS2QZgh2qNfgFCYOHdLIa+QBIrlN209wTg
	 fEz+FordFuiEp4TWhTdhCtc3y20rzxKdSjjLbGRx861e7ZgmntJ67yuWTvzgOvZDgE12I
	 oQBn+wBQ3sijVqTMUVkMvWQOaRGZUfkjXnL7oMpCZESKdhwQO+Sapg0dVRy00V7xx4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUdrXdpS;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E623606A76D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E623606A76D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUdrXdpS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso288303166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316535; x=1794921335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFzJ9u6YQvTMb93owgIg27Pbi0f8hK4InZkJZISUcYQ=;
        b=mUdrXdpS0bgQlAK2CSTjN/FuTQHksNkCyw9J1ZFznTUT42t7wXkyclX+VdTsb2tlmV
         VT8PdCbCFmWGklGy4ndBRYlhkMrSO6ubsGeS+YnX95gg6ykWEOU24uCybPiJhfMsEyOz
         DV6u9CihQrzmwC/wbQn2lXEMY9inh/z148Fgtvcq/c1XWq8YucTruGFKGPTnyimHAOn3
         fP+aezeZR1dIspYuk8E60fRMfBbe4Nr/+Hn2tmO4cG3C9+Ie/9dQgDBK5WQHGMdHq4DJ
         zg/pN1tcLLfCMSnm/g24wsKWvFHPAKsvJwOQej/caKRvPY8mlbCscNPXrd3nXvK6Qu9h
         JVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316535; x=1794921335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFzJ9u6YQvTMb93owgIg27Pbi0f8hK4InZkJZISUcYQ=;
        b=GvGT3imPmIvlW2c4M1WHioWgpOD8vvXUmXcP0TBENyC0DXv3hsov5k7aKwYJQZoh0b
         xmAY4H78hrPTk1jsA8aUHEB6tyRw3WItAIM7tJsR8fLA+balkzkc+KzJksdDOWi8tXDp
         kO7kM1+gbuTWDFDlg9dwDuoSVw1Jbic0HdTjwppoIRgYA/lDkTLEllmdMGZK1ZFpl0dh
         DFYTxW4S1HzTvejnW+WLW6hwU/wgaT0CXndfTb4WukbAHomS1sux93Q/KJkfsKwm/5KZ
         t52iLoYJ2dHqpXD5GfwGVm6f1RxlTPAYfhBcGfMnY3f0wmzpRZP0U+6P6xgfAo2rpgGy
         7SiQ==
X-Forwarded-Encrypted: i=1; AL+hErH/crljAz0xanoUZsu17udvs9UA/d+OxmJhQCxiPvzV/gAy0gRyvZxjeQmEmwzugaVSekTVpp7mQHXAI/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zEjd76S+/lMr44EjNdba9dKHIE+BVX0dlBGw/c7O+YZBfVw8n
	ZN0rf4Z7BPtiDrNTvEFEzYNKnXalg1jH0KgskS+fXu5nRBTYvTGwWQjb
X-Gm-Gg: AYBFou0A+Wr+RmdPFB5QQQlOOBr2M4f/qEqxooWRDMr8/YyU/BeFVKfDtJPdvc8JuCk
	kw5m4QUGfqfLuD9pp+VtP6fF7IZC6bHS8wERcZAZiYLFEVB27KH8aQBtK4ZpTevZWNZXY2CjI5K
	OZTXuf5BhTWrdvo5NZ5SkbCKuksoIhtGtqGm7lG5S2vG0g6Vg2k4R1N+oSG1zZfTDKfroRYo83Z
	qXdueBU7LVrwt59T3+oZx0MPTmip5srzohgBhZwA69BKWpbvqjfwKACsuCu3m9bna246ptm2E2R
	DzkAqwoODcvtniSVwZU9vTyX3y5/B+J+xni1sbPTKuVjguoDq/YrWK2CUWJeYyIZ9FXHyQBnlrd
	QcatIgRcW/WPEfwxwI+HMDG+pMIFmWN6FihUHLxy07F1d9yPDzIUKwYHwrXp67R+kNuECHQ/lQB
	4k7OpvkC7AQGFNQVulMiXcHn84UpKWWsmSqwtS0FMJdFnibTzqLOsMW4aKj5ZsllsCHvPj7/Y9E
	Cwfecbn9cTwxkWi+hJGTidMeXaS9SOU309k9yUzADwxV9eTAElMEE75geOdcjFykdBZoaxtMnff
	2QYBfYwb8pjhrD0Z3kJ5DHoFKHErgItZEcl1h2tDrND90OuMTu2OCAqf9XLpjsFZa8G2XEnLEGo
	=
X-Received: by 2002:a17:907:3ea4:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c50495c8f3emr210672966b.27.1794316534613;
        Tue, 10 Nov 2026 05:15:34 -0800 (PST)
Received: from desktop.home ([46.205.207.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1126372a12.31.2026.11.10.05.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:34 -0800 (PST)
From: =?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Relja Vojvodic <Relja.Vojvodic@amd.com>,
	Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andrzej=20Pi=C4=85tyszek?= <andrzej.piatyszek@gmail.com>
Subject: [PATCH 3/3] drm/amd/display: Retry the same FRL rate after a sink timeout
Date: Tue, 10 Nov 2026 14:09:56 +0100
Message-ID: <20261110130956.160024-4-andrzej.piatyszek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
References: <20261110130956.160024-1-andrzej.piatyszek@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hdmi_frl_perform_link_training_with_fallback() lowers the rate after any
failed attempt, even when the sink never answered. The enable path,
hdmi_frl_perform_link_training_with_retries(), tries the same rate again
instead.

After waking up, a Samsung QE65Q80T (2020) can stay silent at
10 Gbps x 4 for a few seconds and then train in about 33 ms. Link
verification moves to a lower rate before that happens.

After a timeout, try the same rate again, up to max_retries times per
verification, as the enable path does. A sink that never answers costs
up to three extra attempts.

Fixes: cbb8e2044b9e ("drm/amd/display: Add DC link support for FRL")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Andrzej Piątyszek <andrzej.piatyszek@gmail.com>
---
 .../amd/display/dc/link/protocols/link_hdmi_frl.c  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
index 97b2b9b74..129834d6d 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c
@@ -818,9 +818,14 @@ enum link_result hdmi_frl_perform_link_training_with_fallback(
 	enum clock_source_id frl_phy_clock_source_id)
 {
 	enum link_result status = LINK_RESULT_UNKNOWN;
+	unsigned int retries = 0;
+	unsigned int max_retries = 3;
 
 	DC_LOGGER_INIT(link->ctx->logger);
 
+	if (link->preferred_hdmi_frl_settings.valid)
+		max_retries = link->preferred_hdmi_frl_settings.max_retries;
+
 	/* FRL Link Training */
 	while (status != LINK_RESULT_FALLBACK) {
 		if (link->frl_link_settings.frl_link_rate ==
@@ -846,6 +851,15 @@ enum link_result hdmi_frl_perform_link_training_with_fallback(
 		if (status == LINK_RESULT_SUCCESS)
 			break;
 
+		/*
+		 * A sink that is still waking up may not answer at all. Retry the
+		 * same rate before going lower, as many times as link enable does.
+		 */
+		if (status == LINK_RESULT_TIMEOUT && retries < max_retries) {
+			retries++;
+			continue;
+		}
+
 		link->frl_link_settings.frl_link_rate--;
 		if (link->frl_link_settings.frl_link_rate <
 				HDMI_FRL_LINK_RATE_6GBPS_4LANE)
-- 
2.56.0

