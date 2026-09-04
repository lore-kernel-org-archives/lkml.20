Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83FF3C65E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525077; cv=none; b=JMsUrUumrZ4CWEaAUlX+oZMQV0Elmdrp5ARz5sG2HA/E59qeAiL4096YrBj0LMXXq1I3KUCdYocWnouOaFCuTH70Jm5DEXF2zdr2TcoIm6klO4kGK0Hm3tip0bfIiTDjxfHN6duwbZ4BHPWq/IEGUm2JMfevuKVHFpZCrdvFAOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525077; c=relaxed/simple;
	bh=Pz1xqrE8qRihOquEDeZ77FfVya8O7DEjIdRIggKigac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gISunfxiSJW1yFDAH/l8PHJG8kPZobHLX2+hENn8Ui7NYtrrLbjQj8wLzk10mf0LNwy+VCPGIeG6Q+ay/lcs8H/oanvslnOuOWXtZ77XNGLgGlbIWFwwn3asqqEwG7TSw8A9z9E4ZqiFtv0GcTHBwmUMlY6whq1TYilctVFba1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDLcY0+5; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDLcY0+5"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f3ece23165so786347a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525074; x=1789129874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebmjSqeqsr/LTgW/jJZdZzp5GuSysUBT+xQw7qBxsWQ=;
        b=FDLcY0+57JgncFLIutEkRQBok6whzm8ZcGSpeBirAzOTns3xfU/7bOk4OEXwRxTApG
         LavLBDHvqdgnVLcI1SjoYq7L9SlXk8YhODITQS8v1pNSSyo86lmAwVIgkJ7Vsz7u/Hbo
         YzBUF4inNUHy8shnhzQPV4IC32AhglB7GE4veQ3y9QAKggIH1zvC+yz5pje15KEid22b
         ZJeD0YXPwKuz4Dl0FPxgnffstjzOItD7a8VfiVGWqUWMCqrOnxxCVhZmbYw8nEkFg5Y1
         bL1A+OEiLBQdnxFxXiKTeZtssWsD/3/JKk7PENhbiaHEyjyvfVAcwwE1moWIg4hFEG46
         g+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525074; x=1789129874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebmjSqeqsr/LTgW/jJZdZzp5GuSysUBT+xQw7qBxsWQ=;
        b=JxTzu6W4j3Rk8TsmsqWuU7bFXBdLfq2PrZ+4xqTzgEzGcDdxAMKwJjvfUH37ti34Np
         6rxvXcmLwCIMsJiWpQ9PVMGHc97lgtyu0/S8trqANGN1Dxk2wdxCW8S7rpXm+Be2rhZ4
         Lsmkazk1JnQcrEejq/sfQczNOly1NFkmehBG2j0zyQz6xtsVTv0nPaI05u2gxKUQP2cj
         4HiapdR4amtEMA7t3/cbMnvKTeqPT1VQoDcflMiz9iAFUTfoQq6jex5unSVGNw1f8+lv
         zn3FAfQqOwtRt/AaPAwi1OL7u5xQHs/KADQ2mrkFUp9YxlV24G7nl7+wITnMVSnxdVI6
         3xug==
X-Gm-Message-State: AFuF++kxDHMbwpL5ZP18sO9EIAuCeU1uNYpCHbq38x8qSeCjJ//H/a67
	RowOMbDi2sKjJaRPcgznYJklCq4uI2EWavYQMzVuwynR93RvRHVtsfO9EeJTtdU0WyA=
X-Gm-Gg: AYBFou2bQiO8UF552hmofasVWEpd4kVx9C4c5hZohYqLhnTAHjTa/virMzyJy/CRZm1
	/P8bHs6oHFnI/oJ3JA/HV+ALIuy2+53o2zlix/xLUnCvjdzogixo5hVdkxqhSpLuIgumshPABzE
	V1Qq75A/XBX1z5GVcBKIFpJNblScJhCPVWTKezO78ptJdbZEZjZ9RCTF89Waigt3Qjg4f86tXpW
	MsRI42GUKMM9ODxNm2zPgK0bJoALOdYjKSIi0iLDADjRlV/nw7Z3Xnr3mgXg+Jqbt5g14dzb68I
	JMvEt4AekZ4u+GMNq9T1QxKNClklS4+Se1X7pQ0GWvF/Eopl/qtAjYqVCBaXdnTf3V2mAVufSfe
	iLdONSrfyg6sgCCked/wojC3kHGhRFMVGKZPwv0O3wx3lDRTvlZaIPf+c89yPIDa/SipsDnIuDx
	eQxO3FYe3IfAh2GJOfmm+xsd/A1iqG14mJAWc6HaItlxhQd7xdP33N3hGc9HxQZCgnEs3Gxt4eh
	AMy6HG1ZJnrWMvWP6pxhJZhgQ==
X-Received: by 2002:a05:6820:60b:b0:6b7:83d6:2928 with SMTP id 006d021491bc7-6b783d62f1dmr1348840eaf.43.1788525074304;
        Fri, 04 Sep 2026 05:31:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4447030eec.17.2026.09.04.05.31.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:31:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ata: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:01:06 +0530
Message-ID: <20260904123110.35532-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  ata: fix typos in comments
  ata: fix repeated words in comments

 drivers/ata/libata-eh.c      | 2 +-
 drivers/ata/pata_amd.c       | 2 +-
 drivers/ata/sata_dwc_460ex.c | 2 +-
 drivers/ata/sata_fsl.c       | 4 ++--
 drivers/ata/sata_sil24.c     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

