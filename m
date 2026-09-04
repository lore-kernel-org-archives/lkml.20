Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFC43B6CB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525347; cv=none; b=IfLqbrIrwyuyIC/wOEHDDnxccCoguYjEzMi8IVxMKP93I4B131vGDS/4qGnF6GyyvGaoBrTyHcDYubHF+r4DCWd/EUGHUqEdMZo+uGVbowY+jYjyaUDwvmFRnwC2q7lZHL+nbdFG9BZB1gAs0jQ++GmWwwehYyu8/HKnBlA8iQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525347; c=relaxed/simple;
	bh=Su95zggUUdyFpq4wB0rqbFIBSPzBhJpY9wYuq1ZyxVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9Imwd074XHQe85cjxYJLeTWfSx+snahOaKSIxoQTD5X0u+zdbi2YbyoiezWklGyHFJWwOuw/jPMne1v+qGzw7Bn5rZ7mi8gHZvijNkZTb3EJudbAaiiG2nC9Fsncsj5Hh27GZeRcGPjA08NjAxe+h8z1OcvgKKp/36cKmuMWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFCNRXFf; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFCNRXFf"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1334a3b16so750409eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525345; x=1789130145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B21cgOwWVDrYkwcZ3p5D4CkG259sMk6IiqLR4i8Gme4=;
        b=DFCNRXFf9sBlcqo/2cUiVW1U8r2KyMQBNiDelBnmEo5PueOM3eE9bS6yj23N/EYvtl
         mATxjWo3V/vJxadchFrOkrXaCCbG2GnozZu6A5/5x0a+IuBu53JU7b/36HgZDpL/F7Yc
         7E8e5TqKSLef+OUTeGbAVrWdVadg3G3rkDd4hI7LxL9FcKvKy//CmXjHSbMMNFQntuz5
         /DkVaWJHYdJY9aPLEBWXIF9YxeW+h5t/hlImW7npmVp2Dl6iaMxeEnda6zIqp/P6CVaU
         YFhudR3zpTTDRbECF38WPUZz1kXxjNcFvnXN1G/jjyYnNiVIHM5rN2RcjbAgHnIp8EFM
         VFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525345; x=1789130145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B21cgOwWVDrYkwcZ3p5D4CkG259sMk6IiqLR4i8Gme4=;
        b=ctpd/8uh9NaRrJbori6H0i+8PqRfeBV6dTUAgwS5POwVe2IXCQruc5bIRn3JQTFxTf
         bHUA+7gWwLNj4g0h6sdVtlBRxqM2MaUcZCSBQ+j5TRbReOqPaRFYuNJ5VGj2HYVHPVGK
         6+uXk92y/rvUVvsLsWvWFOC+BfmRtlX60c/X3GCDCloMnvl9rhZc6uFK6+zzURN0+L76
         xim6pVVECT4eXJBEHT0/jmh0GZfL/++91+RkuJ3ew4mdZ4T6nUBX2aEsWcEnPIbLXj/3
         JTRxJ4CWq7ieuS1csQHzWb2au1yb1d1XKKDQDcNAwDg24pcoqf5xYaZMpenalg062I/s
         lBiQ==
X-Gm-Message-State: AFuF++kPZZBwoxwwwl/RThrC0tXr7ipWTR7wYQV+adwy/9R7aQn00vNE
	Yv/+UZx9hyayqFpYvyooYoPSR80yuqqQuCTQTsWLxtPvndnVoB5UKk7cZiwH40iQmNY=
X-Gm-Gg: AYBFou2bpIdv7MDWkRQnXY6NTHLRTtNIeoyjmLPrP/EAzhxN983De6gRsWlPe+nq1Bj
	TVFEtScBwzjP6jJXUbwfGEZqFn1K5ZoskJnU4x7TH/BrdT2ZZ9zCYXG9BGZj2q6Ttg8dBAq9DVF
	4a44UBwWV8/5t2dElo/pPHhp3fAyQcFDHvrp2Cye5PeI9lZXDCZlWdfeAdxeI5rLsn7gnmjHiui
	QVr37C+SqNh2jIAUUEasXz+xzhPmkAORlfXRyaNU3eB02XyZ0j6g3t+mN8dWbG5ofxFHX4rtC3y
	nV6t97a3FVkn3n51Y1zYdKTUYoj7O7YcKtTb7t/eY1DQQZfSVIDaKI2IMa7moY99YI67cKodmZ2
	Rm24aOhQlLSkCoBbWDSrUM6gtmc2kBBiJsbrMiMDL1NcScLP4kH2bYrG0HYOOpyJH+vGLb5+pHb
	RGhJ898eyRV03pn7w4KyidEAkpyEoW84aFVLDjzBgh0YXYl26XJj0+58hhLKViev0MeGC3RtISZ
	MRWAvodaASwPGI=
X-Received: by 2002:a05:6820:4c16:b0:6b7:83d6:2933 with SMTP id 006d021491bc7-6b783d62fb5mr1561588eaf.54.1788525344962;
        Fri, 04 Sep 2026 05:35:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6229374c88.1.2026.09.04.05.35.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:35:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firmware: fix typos in comments
Date: Fri,  4 Sep 2026 18:05:37 +0530
Message-ID: <20260904123541.38602-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

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
  firmware: fix typo "upto" in comments
  perf: fix typo "binded" in comment

 drivers/firmware/ti_sci.c   | 4 ++--
 drivers/perf/dwc_pcie_pmu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

