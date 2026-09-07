Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C62DEA61
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756231; cv=none; b=DT3hDppNicQOZzsECyCI2WGQ2TkoR3D+1DxeGIsG/adm6VSEb9kgD5Up06sDW7kAJgjC6lnYZKQ9ujMpCQHhHXl3dci0fZkK33Hfytn6sBlOssJWgsTt8ArXsrnaj2Oq+V9WInRrFmD0EoZuI+JJNu+qMKb1+fSqwwn7htt9cYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756231; c=relaxed/simple;
	bh=szSxtnLkLD8y766ygpoyxw5b57yeR+v07JAH+c84q2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtmXO7AVIi70vVu5LwzGw52Pn8fw9/GHsJi4eZeiDoBxOiU5hNAkFOvI81gk89P4rATQgmzPp70thpLvpCMcbjX4jBMJwHRVWDTFRXBSOeRZ3VOvu7z10n72maFI7L87gBK15AB7wLWcpZwGHGGDogjhdlp1w0B8Ieknb18X0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+UKFO6w; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+UKFO6w"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2422914a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756229; x=1789361029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPgrBT9vT0SIt0HFkd622ENZoHuhSkvhFrUGA0BZyDc=;
        b=E+UKFO6wfsH1ySkBOCQ6A6aEO3Ehgv+Z239LUNrIbetXj36S7HjNPHRBdQKyNGY5xX
         ey63YnGww33Ph5Q0mHX4XfJvDYWDf3SBFdAQMSEBn6EN9L6Tc2kznKKLE4bh1vD9pbZb
         voIX3ZAAcpVT1j/yt0/vcypB9W0r4519hS1iJNT6hAW5AsjgyQ28RT4Hk/luQtCH2EWQ
         HFOyw6l+z13GSoDv1QUF0iNVxrLBD058X2iJ3Yg5zE9wzEFg8IsaOTUvnphkqmLz9xp1
         k3Aq89J6V1z9EPZ/UzDZ1CdAU/+de6k9jsgR/bkiJo30W2E6H9WEGqFRM5J10ATE0wkn
         UAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756229; x=1789361029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPgrBT9vT0SIt0HFkd622ENZoHuhSkvhFrUGA0BZyDc=;
        b=MoKfdl9mRN/pBqfsYgM5YmT9sDvQbXcxUkJYC/HDS3pr7GxlqcPuULCkKBE0CfFCLD
         gPgPetRsMlBpITEOKZAGyezlaFGZ7Zb/N2T7kFKO2t5E4Et6NXy0E2HF/s1d8A9ynYku
         aG3x6l3EYv3GLaJHmyobnDUdMQyYiZiA+P/lyN3255ReKpr9iekVX9cmjBPTyc2tE3hI
         Q6qCTjvq+gbtuhse6cP6wMrUWcizrXUALT/WWkpsR/xSPm7KL60Zu6u15XH3ZZ8aY7x7
         lYU6eNcnvPMNv4dqtjPRK4OKlmuITfE1hI1x3Le/cOaCeMjxMCuLx6qQU8eApYRvX2SO
         naEg==
X-Forwarded-Encrypted: i=1; AKwUvBwjemoWsFFFmsOsbTSWjlOkjJ6fRclt6hxtZhDp7TwGCMRDMm6cwvHWp4wQ1xHwGpomrDuzCH2kz/E/8UU=@vger.kernel.org
X-Gm-Message-State: AFuF++nluZ4fKKLd/BYfoTX+7F/5sNIe/YT7g3csccIMZid5CzQqCK8D
	XpFFuMNvPptQnhyaqbfdPchnpDzm4yQFEu3bvvRg/a7LpsDoEtFgM+F7
X-Gm-Gg: AYBFou16UBmmITu8G4y9c3HBFaknZKGjHKwy4O9oSeHBHDo8l4jJyq6/7+8rSO6FGTu
	Ke1xrO5LyasCe5NrI3/1XAe0LkhqYMuYDExJ4xBDneJiBrkcbJwAWRiBgZMQX1EnqhMeQnVnQyD
	Z2GUdaN9XLGxklpuRNDCEJxT7b6m0aApy4ak+uw/TQwc52YkBp2GlhkFerVGLOn8Wi0a9wu5JkI
	PM9rWC/73i27DW77IQ5tFr/4OErS1wOI5TmuQ+FCNhH556EXkpoZN8XTP42JyK8Zs8vLtXFWIri
	s+JUBCPtE6y4AAjiLdgExqEHXAV2y8UAUlRkw6XA2mNlQtvYJ5N+yClXSZG0R4HGm1yVgkPEUEQ
	NRgHMfP4O7PmL+GNC6ITQRMKJDZ8NPGT3TmyAvJthIdWP4EXOMYSC+Cqqvhv9V9QqS3l2ecMRKO
	dPxU/aSo3L/IUDIq31s4+qakiqYbzNA0YGwlukUbcklQKK1+L/OuVJEE999qcyiCZTKp+DV3KTj
	wHyPMw+m2SWww==
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr32443957a91.17.1788756229132;
        Sun, 06 Sep 2026 21:43:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm23587320eec.13.2026.09.06.21.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:43:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fpga: fix typo in s10_ops_write() comment
Date: Mon,  7 Sep 2026 10:13:44 +0530
Message-ID: <20260907044344.3130-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment reads "reuse it to send more data or free if if all data has
been sent".  The first "if" is not a repetition, it should be "it", to
match the "reuse it" earlier in the same sentence.

v1 deleted the second "if" instead, which left the sentence without an
object.  Xu Yilun pointed out the correct reading.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/fpga/stratix10-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
index b8ec2e6f615f..5aed560050c2 100644
--- a/drivers/fpga/stratix10-soc.c
+++ b/drivers/fpga/stratix10-soc.c
@@ -286,7 +286,7 @@ static int s10_ops_write(struct fpga_manager *mgr, const char *buf,
 
 	/*
 	 * Loop waiting for buffers to be returned.  When a buffer is returned,
-	 * reuse it to send more data or free if if all data has been sent.
+	 * reuse it to send more data or free it if all data has been sent.
 	 */
 	while (count > 0 || s10_free_buffer_count(mgr) != NUM_SVC_BUFS) {
 		reinit_completion(&priv->status_return_completion);
