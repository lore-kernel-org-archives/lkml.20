Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CDA7080D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503226; cv=none; b=t0im7zLV/C+y9T0/C5F2U2Pnsx/1PRtNTrQ+MHzvZBV2B7opxUk3GDcspco3ZI+RdybEbsd7NZSq5wDTHN713TOcI//sdQW9aEpL0QjMuYPdYLgykQLRcZ706mPMxKdD2/MzWCoHcvjp/v4NUjZ7RJtXAh9Gd2oHGqBkrzmUbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503226; c=relaxed/simple;
	bh=rU9GijAnZNSVach+qXSdgMd/Qvt7XVjZRVLzqVSb9Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YX6NqcYssQ+Pnym52rCaugf+BBl/JJAqkiV/aAGHQ3NCY1y07Be+c64L4dLfUnqYJnzcbBUJ6lwvIO3KY7o4JAzgACXwPSh1/N4R6Be03Tjx8iGcAtismAu58TiAkt/AlLl4a+bInjY3NpoYvi7xYJjCUsqyqpeBgkqMuFQoQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvzQtoLQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvzQtoLQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so508133a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788503224; x=1789108024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWmGOPT3T1V0QbR4ZU9i41fdA26ZNjTQm+SJiNpfKWo=;
        b=WvzQtoLQ3AqyL1VbMROgtWsrNpc7cSlr7Nu1CgmnEZBDsBIQGuRPSdfEL1XkSSqqtN
         /HfVuwdzlpFiXP/iB3hYpkgU4duUmMUu09U+MpFRED5s425AUSB5tVgC8/r5tvU3oYe3
         mxsYWXVain5P3MWiwQjZ4EgmSNlmA4MxgOmgpDlyRWfEt+KjPTYYis9yFliHRNX1I5qt
         9GmCaSszUWXrQ3XiovCnOhGSVXMT0lnokaG00+GJe1IOPzeH7J151zld5YUft4gS5gL9
         uKDZ4Nq/AZBHlpYkTEnkthsbbcyUtoaHC8QS3N7hnxIYL8ZcRtTHBk5s1oBoV5WD1Xia
         Jp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788503224; x=1789108024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWmGOPT3T1V0QbR4ZU9i41fdA26ZNjTQm+SJiNpfKWo=;
        b=W+VsrDhoqkkNWnQs+vWuiW0G0dM47YfJhq9IqYDlzLHr2skPSG1ac+SG0kT4LDFJdd
         LgPYyfd8cCDmHoWMLofvOKrv3AoyMzAg2+JRzJth03yLWXNS8SsmNtL1P9v0LT98qhy8
         A/o5kLa3YfJVFMz2sBe+6Gzpjyvuf5z5eeracBmFvmHFu0+QD9xYlt3JkKyG7v2/mpOx
         whjtrr5JzpzWXykaOMvRWGjy68E/wqhJy5+Te30t/FivP5ecNpEaFHLxmjZeSiJ0AF8a
         6B2eaAWJJSXBZWxvIpnrYxqr5BhSlCofPTof3kCqnIl3NuD+MBBj6IQ8nEhBsnJtA+qV
         5zpg==
X-Gm-Message-State: AFuF++l5wtKqwhS0ih9MwngXdfMmYC3avBt5Wk9O28YQQgmXgXlQRsqx
	OAJQmULyoF4UhnoZMyeVCCqTa4bMYxIiI7YlV0hk9ceHnP3UIZd0Uvfi
X-Gm-Gg: AYBFou3lCQgIWir2NRSD186stb2bhkZUHrYqvXt8Bi/0PIFw3plNPhumxlTQkL/YQoS
	OlD7GDxUoFNPeJ9MCiEOUaAsoQb4dEG+Thdl0n56P8EjUUiKVn4YpwnGQl2I+dRiyqvwOkf0e2l
	YOdw9rDRtaqyMWZ8jasLt64ANB98Cqx7ItSjUCwVQpHcLJCOlSWQiCttBYQfKjBkED9kFSRZO2s
	5ZExE1Xc5UgBZmkfJL6Jxa004FysHokK7wtaD7xlMmSyP9t3le85Y3svCESKk3bwDfHpwweob2v
	diKWNnZqFmI3b3hXhogvR9PmV+JRu17b8Vm9gwOwTt8wLTwEDQLXwpo8mgJjsZIeMGgG6wWxKo/
	s5u2VZ4TT4He0XrwVk2w/Bxbh+JfxGovfQwP11gTAHuzV4u3ClnK++FbIx2/K59qLQC05TOYSRM
	MsremdkbPvY0GMa5sL2CW2G5BguCdnT33CmLzFo3LCNs/Q996SbcVXKTdlZLWxCRzSVvYfZUuWX
	peTQfGvYjMqF0KQ7jPjLc/srvzMhPyWktFXqpSZG/YOQw4s8LK/01Xr6s8adcno2Dc=
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr6042954a91.17.1788503223693;
        Thu, 03 Sep 2026 23:27:03 -0700 (PDT)
Received: from codespaces-1adab9.3gx5x4kts4veljes22u4ri2f3b.ix.internal.cloudapp.net ([23.97.62.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm664209eec.4.2026.09.03.23.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:27:03 -0700 (PDT)
From: rivaldihormat-debug <rivaldihormat@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: linux-kernel@vger.kernel.org,
	rivaldihormat-debug <rivaldihormat@gmail.com>,
	rivaldihormat-debug <rivaldihormat@example.com>
Subject: [PATCH] usb: core: devio: add defensive bounds check for len2 in do_proc_bulk()
Date: Fri,  4 Sep 2026 06:25:54 +0000
Message-ID: <20260904062554.18628-2-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904062554.18628-1-rivaldihormat@gmail.com>
References: <20260904062554.18628-1-rivaldihormat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although the USB host controller hardware prevents len2 from exceeding
len1 in normal operation via babble error handling, add an explicit
kernel-side check to improve robustness. This helps prevent unexpected
behavior in virtualized environments where emulation bugs might break
this guarantee.

Clamp len2 to len1 if it exceeds the allocated buffer size and log
a warning message.

Signed-off-by: rivaldihormat-debug <rivaldihormat@example.com>
---
 drivers/usb/core/devio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..9d8930853e8f 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1343,6 +1343,10 @@ static int do_proc_bulk(struct usb_dev_state *ps,
 		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, tbuf, len2);
 
 		if (!i && len2) {
+                        if (len2 > len1) {
+                                dev_warn(&dev->dev, "USB returned more data than expected\n");
+                                len2 = len1;
+                        }
 			if (copy_to_user(bulk->data, tbuf, len2)) {
 				ret = -EFAULT;
 				goto done;
-- 
2.53.0

