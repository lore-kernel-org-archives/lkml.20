Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504AB3B6BFF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772412; cv=none; b=a9Rjx5NsQKTvrpGNuEyyrtFlJmDKJCdm85ip64ofeMpZ82iZq2BoYXWuLqSkTEZfXu/feavCMFttR9AWkM5PIkd42NRui0tb99iUEyxKIN+sohEr57h4HuL07G+2f4Q9obT55wFcE4tyoKUJSE977X8OUBB9hC0drwL6tPlTBeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772412; c=relaxed/simple;
	bh=23vdQzYtZV8vW+3JNuTwhWvUB7OWUSnQZqEbN5wYa/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKWCMcXou3oCw07WQvemmrJh7QM0BB7dyKuiemvnEDv7p7Hl/1ZKg4qGRyeJv7rQ0oxM/sieydFlFXQ/gMOg3k9MhpYIBYviXxIqJQhdtFLrVQaHdfdHr69eZFGyt3ghkEQNNTkFKNUeymyGNfn4j0P3YXaCufoyxNsUXVAsEek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Rc8+c/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Rc8+c/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6e954afbdso20701165ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772410; x=1789377210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvirkPfsWD4DlpS6+sPZXfcCYJfTwJWd1ALRxv3wOTg=;
        b=X4Rc8+c/tfdvQUutICMI+zYNUk0vgh55Sow0yqzccqfMZt9IodpQ8J7eOFh31oOU7m
         xhdPZzuhMu9VEcIlwPb/D6tQQDk5nHg8N4RJtAv9e5v53aIv31F+yGWIoVs8lHaPqPMB
         qBPMDnO/KW8xjPM7bTIHkJCpIjbhyt0knmSNWuXoqVcD7EvqFiiyibr8rwV/JGmE03mu
         X0ptmhDlpmu1A9f1jZpEB3AdhsKevpw1JmHJRy9HKEs8G1CWfvYu7oNJaRHb1EvljFnt
         qZHf5AzfXChB7SSyx32W4SkzyRmvR0frBRIlLqkLm9dJAspiu+gxdTVohn/+qKorvDH8
         4xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772410; x=1789377210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvirkPfsWD4DlpS6+sPZXfcCYJfTwJWd1ALRxv3wOTg=;
        b=fX0UQqRM3fSXTH+Rpf27V8/mnSD46hOsNN5qvbdtvhlK+zfhmXUfJcVQHULlWODocQ
         9i4CdViYOPUXgb3pPNDG7Gf3rWoqPnD1/2sPtOzARtV8+7MqepPf127WOm0ArzFhHFHy
         uaa4+TIQCOou145HgJyWcCJteEi1BK40/pN44/R0+jT+JAKk2uxfU3QUlYI2RFaOL+f3
         hrSMu/4zgCRyp52Y+ppcL8P0pdlSNAHeEbHckluZ7m4wRfvGsZQkr/GWS37zlzF74NIq
         xGCZx+OyKEcKw1+RiIK/8jCih8G1ZV3qtNICX43Yn9RyU29EZ4tZ64cwKFkttJuhRSPZ
         S0MA==
X-Forwarded-Encrypted: i=1; AKwUvBxtqWRNAfD52CJ/fW4SIuhHZ3oLaCf9Fjd6RKV6+/qB34OSkG8sogOs/C3rdjtsgOogmLhAN/LwlKampIY=@vger.kernel.org
X-Gm-Message-State: AFuF++nu3axwyvVkmBboz3dXr96oL/cCork81tHVeAmUK7tSh5QR0c47
	HrPmXtqPzH+hT378RGANdFFIxinvlKHiWuw0ARo1yzdCNGvU64yiLXK6
X-Gm-Gg: AYBFou0YcLHmU5nADoJLeB04koZlow8ivLnnZrqNOMdzURU5rCaxrmH1zZ0kPJUCSSo
	GgiLPl4tdU0613f9Cl32fsP6tO1LG4totsxX17qiSSdoSiTpjgy4A7VjKEv7PLNvXVvhUJaAeoa
	xWADg4mugvHzWHVoUXMGvcHfxgSZ7Qzpv0Yp7gU7+bzFWMlRr1tFsq30BAsAQbrjIhTtYdc7P6X
	d2ANia6J26OpMMkJX/my5yy+wdAdazj/EWQOyqCeM1/R4QDuS3vvrm05vbNml9WhN37OF18iRko
	pLklTDvJw0gRAwzncKnbTRwuVCy7IdgtZeIjAj+mdonQYnVEHfO4U7AfRXawQqSLyiYmxL9qrmr
	w8uMWm2ckT3nYUwcRQd6Wu39GEJoXXndzaES7msPYHisPcakKwvnrUtAOJhiXHFACWgkqNBw+TC
	CQ17UezBw9h7Q/7VymUZZn0Tk6RaG7+/R7KRz59BhZsuZr+/ijn7NXSYBOywCe7Q6OpiSoMFGzt
	ONvyK+g/FRpKw==
X-Received: by 2002:a17:903:1844:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2db126b1bcfmr349354735ad.21.1788772410345;
        Mon, 07 Sep 2026 02:13:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm29061828eec.30.2026.09.07.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:13:29 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Joe Perches <joe@perches.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/spelling.txt: keep British spelling for "initalise"
Date: Mon,  7 Sep 2026 14:43:24 +0530
Message-ID: <20260907091324.32211-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the only two entries in the file that map a British spelling
to an American one:

  initalised||initialized
  initalise||initialize

doc-guide/checkpatch.rst asks that British and American spellings be
left alone, so correcting the missing "i" should not also change the
variety of English.  Following checkpatch here silently rewrites
"initalised" to "initialized" in files that otherwise use British
forms; arch/arm64 alone has 58 uses of "initialised" against 132 of
"initialized", so both are clearly in use.

Map them to the British forms instead, so the misspelling is still
caught while the spelling variety is left to the author.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 scripts/spelling.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 3372873cd7bb..9ec2529bc584 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -872,8 +872,8 @@ infromation||information
 ingore||ignore
 inheritence||inheritance
 inital||initial
-initalised||initialized
-initalise||initialize
+initalised||initialised
+initalise||initialise
 initalized||initialized
 initalize||initialize
 initation||initiation
