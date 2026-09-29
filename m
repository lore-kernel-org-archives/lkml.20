Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179BD527584
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687433; cv=none; b=vEF8nYegBR7fLocCjE5jfzv/sLAqlkgAptE0/AT6VS6m6Ub74Wg5Et2DYhk7oU/spmPMrJHx2Dg9VTQTdJRBenhALdosVJ5sFG/MUFn2N1H5BYXbjiY/Uqbvx8pSdGhb65Drs+3R34coO8aoTOH+SmcpgC2wx8ZD3vtthnldbmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687433; c=relaxed/simple;
	bh=8cPRUFsA8KS0yyETrcUqv/obyJxQTG4rJfluXO7eWbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEqpYPfX1kCuibGFVVknSYwonsu32D5zxOdlFzxdWXDmc73IwPIMN1rNIPABuRCR+vTSvvV228/KdqcIWZTYKZaorP6RmuDzIyyCDXk/eN6VLqP1nH2TrTnSRwXu1EkjmjMQpQEdQycJiQzh/I/AO26n0aIxaBPI+Jo/2GtDyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG/FOhi/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG/FOhi/"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db479a55b6so3899825ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687431; x=1791292231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb+KxoUYDyPoOtp95oCFcc09OTaWElRib7MXp3IhocI=;
        b=WG/FOhi/oEz0oS3C9SDyS1vCUyNwkz4qUAJMT3de18p4jnbh5vZbDv67C45sMwbTM2
         tzwR9OncF5uwpzrcmMmKrCVcxABasBxsAQonR4lfZR8vTlRdxsAe0/FoXL1qMUQiTLzP
         vZQRpkolQ9F55shmvRj2O6RHu2BeO9C65d+m0HcciP36EhyGj2S9XVl8TqdpvTxgdAiG
         JRxKw0fhAj0fpOvn4Qm6o2IJ54cZokRcbhrHZmpjLbH+NhpP1OcJ2xErz8ghyBnWq3iY
         1AWgac6OhMk92jqcnS/F310YQIRrdQS2wxPBSntfB6O4gNLtuCNjnXTqI+0D2a7doqzy
         Ua1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687431; x=1791292231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cb+KxoUYDyPoOtp95oCFcc09OTaWElRib7MXp3IhocI=;
        b=piv9Qn+q9u3oXKCEkEfBFMFzWFUTNYwpkTqc/eLLSMnLWflrC8uYDwl+Lvk4GmU3ql
         mJNVboF/4xSOONSKYgJxUMmHrUupWeV76MzH1cydocvO0qBktPiMftxwgJO4YVfSEQ7/
         JrQR9tWcn2Q8GWWOdC54bmBziKzLnVFb7jUaCtrBnA8ZCUpHF74Jp+xiQWA24WRSm/bP
         1i8PlACSNNyTIGZx1mbuNZVzVgIvDK26a/IXKrH7rFoLUppN9c//0kEnCErK3Y6sholv
         xdcG4Z1DvEbsVPgtqwcTz71msvQCxwj8gs4AUUyVFZ5CpqxkTMGUpL6OB0uH55S/Z75k
         lc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUrSU8h7Om79klenzYa2VLrY/GVB3Mn/VjO6TXNgT7fHriCWgBkNBQ6p0xMsxU3v17IreQQJzCNHAJwEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMHgkHBeAFh34c51wLcqH/Nm4qifBhM4+PgTVCiwYBV9cLBix5
	qjbZx/MoickEpv6M0cX2GHZgki4zplNfzKUSVO36OQHWlNm5K/yhyft/
X-Gm-Gg: AYBFou2zUqJsAsiG8gnDHnt3Q/fTEYR9Vu64H+A1C7Vi0Hg7KW8LaQk3U3Ug+fqQ9AM
	TS6NliUscBrbw8eW9wXCogiaO/cQv9z97jNCVrJcBvUBBAMChGSdMS4qRFffLs75MqAUKcAyFt7
	auhVGLUaJzRhANUnE3nk3QwiOy7gY0JYxopz/oADtLG7YZkyS9Dj2UwVO3rToIwMsEzNm5e7TI1
	hSOQ3aUN0Uy1jo1hRRPZkRe9h/afYcEqtyGBKeFlQAKkdU/vpc6CUue9Su1/XaV+Gmew6p39L02
	yJSf8K/AFNpSuuooHp4ZoI/yCGYhLiZJTmL6cDcJeB5BPqAnNB2+8iInPr44buGK1ksYG88x/vm
	gNNuMGcq1sIF8f/KggOAaQJcxUI1P4EtjT2EqUWMSLGhk09eNdD9qNSTqdjT2j2kHQtwezjsios
	ZUVz+GaIvztPaWiSs/gBD0Li5Bu0+JS+yI65Bw15/qrlC3rgu7i7VZKhjWnwW/wN/PSldR1r2Ex
	tVhsGe3RW/2ABJaF1QmTXu0tusOwLqZLXJeG4+o64otiFDfQWhLAhvx8A==
X-Received: by 2002:a17:902:e550:b0:2df:8909:f719 with SMTP id d9443c01a7336-2df8e71a14amr176903705ad.3.1790687431185;
        Tue, 29 Sep 2026 06:10:31 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:30 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
Date: Tue, 29 Sep 2026 21:10:15 +0800
Message-ID: <20260929131020.266120-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The English original moved from admin-guide/ to process/ in
commit 44ac5abac86b ("Documentation/security-bugs: move from
admin-guide/ to process/"), but the translation stayed behind.
checktransupdate.py locates the English original from the translation's
path, so it currently reports:

  Cannot find the origin path for
  Documentation/translations/zh_TW/admin-guide/security-bugs.rst

Move it to match the English layout, and list it under "Dealing with
bugs" in process/index.rst as the English index does.  The content is
unchanged; its :Original: reference already points at
process/security-bugs and resolves the same way from the new location.

The translation has only had mechanical changes since it was imported in
2021, and the English document did not change between that import and
its move, so the move commit is the English version this translation
mirrors.  It is also the oldest baseline the tool can use:
checktransupdate.py does not follow renames, so a commit from before the
move would make it fall back to comparing dates and report the file as
up to date.

update to commit 44ac5abac86b ("Documentation/security-bugs: move from
admin-guide/ to process/")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/admin-guide/index.rst          | 1 -
 Documentation/translations/zh_TW/process/index.rst              | 2 +-
 .../zh_TW/{admin-guide => process}/security-bugs.rst            | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename Documentation/translations/zh_TW/{admin-guide => process}/security-bugs.rst (100%)

diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index a6e8564ba68f..937f84c69ce9 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -37,7 +37,6 @@ Todolist:
 
    reporting-issues
    reporting-regressions
-   security-bugs
    bug-hunting
    bug-bisect
    tainted-kernels
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 30db28078460..18653aa75d7d 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -88,13 +88,13 @@ TODOList:
 .. toctree::
    :maxdepth: 1
 
+   security-bugs
    embargoed-hardware-issues
 
 TODOList:
 
 * debugging/index
 * handling-regressions
-* security-bugs
 * threat-model
 * cve
 
diff --git a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst b/Documentation/translations/zh_TW/process/security-bugs.rst
similarity index 100%
rename from Documentation/translations/zh_TW/admin-guide/security-bugs.rst
rename to Documentation/translations/zh_TW/process/security-bugs.rst
-- 
2.43.0

