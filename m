Received: from mail-pz2-f19.google.com (mail-pz2-f19.google.com [74.125.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9694908A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461889; cv=none; b=IPes6ngCSwFu8RDHWLxZvvs4cXxASgtXmDzZeY7NLK5MFfcEtx5Wzbjf/rke6T2BgGZbcxB/FhGtnRWYSIQdOuLwBc49pbdxb7LsLrxfb0cvyiXzC7j9HrN6QEljY1JHWQhZYgVQA2ZfQTGIt3dVmh00tmbpuWFHZX6noFVXUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461889; c=relaxed/simple;
	bh=leZEl63TX4V3e89rTQIVfJwcmOeBEc/iPm6Jejpg450=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1KLykHKbQCCxcGijB7XqYYSWpeP1l+bChlbtaHjuyfVEZDmeFz+apGg6a3Fo18zB8P20ZNPQ/MiIHQIu7DTrsHoIKxFYNqY779czbTuuLrRe4yhkI79ia0pWNMZt6oumZ9VKAOS3AZNXmSMQzzPkOYhLNIFBJzVgd1v/EneV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkdB57K8; arc=none smtp.client-ip=74.125.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkdB57K8"
Received: by mail-pz2-f19.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso2026372a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461886; x=1790066686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9q5GLhEmb8pBQpgxh9LfIHNEQ3BulUKIglALGzPomE=;
        b=SkdB57K817vqh+qu8qQlwuuOlPEAYjFHPIXPNA2oq4gh2HGf8B9Rlz0Vn4KKN9YwNK
         svXqMuBYK+MkP3Gbhi1vs8NpixyOUWl9WIjHF+pCqT6SSnf4As8IJgbRs5TyRy82gDMV
         mUTDI4jHw3jl9Jy7/YWloXalbNx3Nr2cHIxrQohrU8Q5t/HDuge18/VjsWPSnNqhCDUI
         /S1JlW6r7wXvcAA0JEVeh16o63ctJke1FOE5a/uPg/RsAODzWnTi/ou+nfvRtuilbuj6
         g5YCn/CPPh7mjxKARR4vV4esbj0mc0DTPKqpwOz1B24lfzds3B6ByJfGakBJEWBWYceT
         oSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461886; x=1790066686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9q5GLhEmb8pBQpgxh9LfIHNEQ3BulUKIglALGzPomE=;
        b=NKygmR75z1FLWw0I7DIGVkVIEwLOsHmEgXhxgL8zEaKz1d4avPpRCSHyJdh+DarOUT
         RAnpsxnG/n/jOGIgmcy2Hs7SVnz6W0FO/Kb27F+wqSZMQy5qQEiFk03MrFa+g2nGcWGz
         uXqgjoJtYOnDTp6jpjn1zFSCLbGN7tQI70HFWToyLkTQ0V+oZeODKkV9BzOC8unEPsif
         lseY3S8si2DSBEEcV6+6/gc8yejO/smgCcyUg1coh3Q5E9gEW5orXqSobPx0F9am00Ig
         qS7LySSiw+PeXJBRNSzkl9QnKUiRoCMMPjDuuzJEyny0QzCyViBqMY0i4nwjGAG58UWy
         1D/g==
X-Forwarded-Encrypted: i=1; AKwUvBwTuluome+tse4hanyOS+aXWLd24su1DqOtKNVFUw2PHA4vx1xJ76OQnknJ9+wh7D2enrTxtFcLGMo2R60=@vger.kernel.org
X-Gm-Message-State: AFuF++m9VpSyJjocJv8n5BiiM+PP+5RZaJowne5WwluV3Qg16/weusmE
	IQi2OC5b2NFZXzVsBksb0D+F7bH/rhWiEDBlFgu32b9sC22mVMonZMbB
X-Gm-Gg: AYBFou2VwswqJh/aG/lWvB4DthzeP0UX43kEnY3M41fttA1G5RMK9eEKIBe4DSImeeZ
	R1I8D7cHiCZWVzOZdk6dE/b9QuqYS8dffbd/BiHzWoPwfD5uCfZu0S1mMFMTJOKE2k9XaI8lXs9
	HVdx/7B+fqAGeNkKct4whZt51yvh1wOYMtJTkNBj4AE23STA0MRX2lK+vYmlEarv6oslea1DIH2
	dsVF453ENkm3u5vNwXruO/l4rvatp/UjT1XFWngyEtECjqb5ecwyHc3L93fbjsZ/j8UlC89EO/F
	LgGhC0mBO5bDLlzz9RZZdYqAz97fARurRw07ISDwFrjhzBLy3Q6Gg7ijCPj2mRkaqhz+HVRjOmi
	2hsFxaA9k8oK77os+pGM52GVU5t0LdgHNcjornp9J05pGi7QXnK2FDbf0v03d/SBTw6anQm/qKT
	yTh4nc4IUYGqXv9NNXQVSCqLhIeK5yWWTnUEBG3vlo3dGn6rntK455LgEsavTQCaxYGzt3NMofS
	NNh4G9e9Ti4ndI9RNw2qD/yvg==
X-Received: by 2002:a05:6a20:2443:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3db4061e3ddmr13173703637.15.1789461886434;
        Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 06/23] ALSA: emux: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:07 +0530
Message-ID: <20260915084424.1007757-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/sound/emux_legacy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/emux_legacy.h b/include/sound/emux_legacy.h
index 1127e30d33bb..55a7fbfb9bfa 100644
--- a/include/sound/emux_legacy.h
+++ b/include/sound/emux_legacy.h
@@ -5,7 +5,7 @@
 /*
  *  Copyright (c) 1999-2000 Takashi Iwai <tiwai@suse.de>
  *
- *  Definitions of OSS compatible headers for Emu8000 device informations
+ *  Definitions of OSS compatible headers for Emu8000 device information
  */
 
 #include <sound/seq_oss_legacy.h>
-- 
2.48.1

