Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC2331ECE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015513; cv=none; b=Pt6AN6GG6x90UmQJ8Fq0kkZX+JBCjuEqmdi1u9YASlJXtDpaY4ak0wIrrfysmV//zElcT4GVZvvjzKAOI3dO2kRYn1CQwVor1CCisX85bnlb2/a7UIeKON1BXRI+WI/qN3ly8Hs7SRnv2TMN7iQ0ll5kTuiJZI1I86LgY9LydU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015513; c=relaxed/simple;
	bh=XiUM0pRwU3xo5xaP2pWGBHjzB5UX/LCROmEOmQMbA4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hggCzkUUigpNo8dAWUQJnAmkIY4ADj/XHmYLWE/MV9JXb9z8m6qwTQto/5LkZBaBuuq6haUYs9OqucH9779VuLDSWEGBXQuCuOLf6vCWSrV9cHl3a87CN3bZbtPADmTuHcMZutzIaxFYXqMOsghytUmxbpVIXRpAfRCEOF82NSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep5OUcd5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep5OUcd5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbee846deecso590359a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015512; x=1789620312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmxsfa+TNdlnTgsp+XfFN2O1d2BArkuJDOPXDPvoEYw=;
        b=ep5OUcd5F0yikl1u9KMb9iI2ruHlBED0UwVj7msnFMd/5QGieVbtLxOlJIy5SpKosS
         QivEu4tzSOqHKImyrk+BOo2haIcniAlz43oII3EUC2h5yO0w1rf3wUZD5rn6tspCpL9R
         SRwT7V3UNir6GDBcZrNNBpNn219W4duTvg7jE189bO4ygOlyBpMMD9WY5GiSGxEG61wI
         IfVbJB1WRoUDkPA1ytOxRRDt3uJ5th09kNIAPuvh0thF/Bb54IBkYfJDNzg21swCddzY
         jULemOl7t87sN0euQ/GWxYeUt7846UaC5NJbgKpUTEhlXRgbtXJzEW0sDaU5rtCkyq3Z
         JJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015512; x=1789620312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rmxsfa+TNdlnTgsp+XfFN2O1d2BArkuJDOPXDPvoEYw=;
        b=Gf63r4+d681NRhLhbmmLugPACo2ufOHcsqbIzDeX6PcaZix1G+UpX4sUS1dU+VPUqA
         BWbRrGTRRutwvybjAGDSE0UQ77IZKyPY2MKnqkP0LzrKR2QdjK/V0fhqgRd1Yd2HL4qz
         biCUIE5pedI9AApIttVLWKTBBAG7sDODXsuHQSBpl2IlQs+wsYexDqWqHVSW1x0FeWEa
         PwxZlgFLyKf0+zv71iemo/bJec2LYKtEL/jJ0lkpi9kJXJX+IpvBd/ODAdxbrHRcBBil
         4fKgF4qzN3+6O7ukVZeaUuCOtksZV3umtYgUyL9M7ovZDVO7HEPC11i0hOENYdTlyz5U
         PXQw==
X-Forwarded-Encrypted: i=1; AKwUvBzh/4aKDsCaBSA/uALpRcWv/eYsvyUgbUmuG3Z2/WY4N3Mub/c2XJKeWiEwZQbeM96w3Hlhk4hq+XPvYbs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4aWe2h5AaiUl7Z4NHPBbCaDuZnfp6tJdX70RVmcdYBdftUpTu
	ygdEAGFNTjDbyjn1MRlOwPVHtN4PW4N7e1+R2wS2OChYhUcYLh8eNrh2
X-Gm-Gg: AYBFou1IKHBJ99ILJdDef2kg8DojrTvOmttOWmesDrXJ781P3FBG9yARjAwpIWUuW4r
	Km+aKIN2dUCwjmexe2octbfOi6Fe4wvZtVL5xn1vx+he6H1CUzvTL+eWAUcBghf+KWPZCrvi+KY
	EBdJw7rjduEdNRoYog1DAu5Nscn9FrjFqja6UyPOLnnnoCkIsf8qzbuxT2ZecbV/mfiuVyQ37tp
	XsmxGcZ1b692ybD1bTRqAUtvWtjCXajLQxeubtgZzMqj/nENMZnlY/HLk9Bg5+pcoOkzdqP4vQV
	cQiYrktlO6xS/MqEeKbPrFcupW7uPh3zDFKtx8bwV2UsW5YqWyp3iAh1fPgUpNUmttyU52VVwxf
	qXQ9bwSd28izvD/CKHU0vb+6zdcDhzddUIqSJvU/nsCJdJXXcP2Rk9FvdldIpMN670qGE4QSdpY
	ZXERdSLcpAnlF7roOiO52suw6T9JxnnORWRNEeF4IZkmoAT8IJMJ0aFELaEs6hv4T0exde/2W5+
	X1mzvJAxrTXlVwdbpqWqvublA==
X-Received: by 2002:a17:90b:440e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39b261e1011mr55218461a91.13.1789015510908;
        Wed, 09 Sep 2026 21:45:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] platform/x86/intel/tpmi: Fix typo in TPMI_FEATURE_NAME_LEN comment
Date: Thu, 10 Sep 2026 10:14:39 +0530
Message-ID: <4c84e4fd734d7e1aa70e045e6c51f8bda3fff5ba.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 0153dd57838e..fbe9c8af4aee 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -597,7 +597,7 @@ static const char *intel_tpmi_name(enum intel_tpmi_id id)
 	}
 }
 
-/* String Length for tpmi-"feature_name(upto 8 bytes)" */
+/* String Length for tpmi-"feature_name(up to 8 bytes)" */
 #define TPMI_FEATURE_NAME_LEN	14
 
 static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
-- 
2.48.1

