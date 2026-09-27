Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314337E5E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790552237; cv=none; b=KVMlLzaZKcSUIP+HXOf08skTXsjMxFpfccqCBnxeOUvflD1aL883q8WFyKvRAcwMFAqtFo+lOHnbv9eSJ0Sm9l1fShMlgW0POfMgig5brSUjxZ1UawstBKrrlS8fMUUugOubhJ+PBQD//N246fXu5Xu2czfhxy77oBtopiZxduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790552237; c=relaxed/simple;
	bh=vMx2OEAWQB1yWyZ78d+EHmuyKxCDM2aewJvKv9yR0Bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pxhmiv4bZumd0WdJaD7k/Dm3Yj2b7W7/F7LE1FM2OQ+l1peRD1sNfYZcOx4eFv6J7fWn8tJvp9oVNtISk2SF5gcFvbmXdQRDyCS5NcU+Cqw15rdT2auszHophT33yvFvCD5rNQRH7gSTPqyoapA6j7ypTay5btzHXmGaoDKSYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhLXHVA0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhLXHVA0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so5938065e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790552234; x=1791157034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeI+lVedHv94sduKpny4VEBPiP55GfeWt60bzHlR0o4=;
        b=RhLXHVA0T++C62hPZh+4Oi5oEkOYn8+Kv4cGKaHiFaM8imGcAzHRqQts/jyW8vCqqI
         AKyCkzrLs2q2VRtukZvTL4yZJIJyMRdodAedIqK6qzQIqV1ExAUMJaeJl68gxXi/oYQl
         MIbFdwk1uGzp+DtZ2gILMX31NRQ0bAQ76FpJtsCTbeNNlIZeH8KUTh8KJaPgKLtzZW+P
         F7QaJ66MkkibGG/BGjET3/3INANaxlZaCvdfdQ5z7ctYXhKI4rkXFXHvnNItDeyHbsV4
         emU87Hovfm/w0wHk/xYBPukdfKsyUk9DC35DOxRrLjWiC7U1GZcwcMZFASjbLcsIYolZ
         u8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790552234; x=1791157034;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeI+lVedHv94sduKpny4VEBPiP55GfeWt60bzHlR0o4=;
        b=bUNbRbofiRmXX7FGro13x2N/ShQxNL8MGs9WJXBX0fb6mQooS745E6bG2Cy1NuTRJA
         7AjxuUTUC2YEKzb2HnxYXu4tAq3DGd6aAaUiFSlYC6tHeYaB3z9/FcWMBNT6mWbonLeP
         5R40SdXEbFNtw98L0hJMsNpdsc4fynTwXSBtxgkRTIUcALHR2qz0VzzUhjYP/XFHTOaz
         RRmQhIvtouTJ+hfDTqJjqdUOuYVqvx1Rpqb1hkFSzbbxZo9tl8OgQoHeXu26NSBuRIWE
         joCeSxKm6VSWee5nkYyxWRhfH31HTXauy0bNyqsQr0erhs1v0sicI8HYIOT0T21s4pdE
         UqPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGsnxQZSre2kSQUJZvOPvk33wk90VqxHnOA2apkiqe8QrNYMLRis1n1lJyI37w29B/LEI0ovl6Xb70IuY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrPam+KYUxlVEh5xbctxd10nx95Ti5nOVPtTzZRO1grRnlR8hz
	P/0wR7Ee3UD5o55xYiAAcWOElhMss6/mkm+k7iCZj0+xq8mtfRJeF/LD
X-Gm-Gg: AYBFou0obtP3jv38cmdEJgtUwOjSHs3Jtm3cZRrrLFmgNcbJ3FWpDrj+dMlCxU2DjZr
	iivuURSVNIYB7GKCHrdCaVvstlrxYsUlUzF0NYXc54xWsXHgn7DuvNzvvUIad8ToBPN34vCx5kZ
	8DxEgj46BgnXl6nuh9nqjSez1wym6foaeUxTy4E1lKeuYrCEVDPtEj7q7xVQI5FIRZeuMvfSI/n
	qXt2JTAUwbFS7MYEiI/MO7lo3jq8Gxtw1noYzzuCFAb68aoL7nqaWpCJN9n/bdkvJSDOdsPZn8L
	qYw6jsUfA5DRilH8gCe1Fw2i12iFhOdvyseL5rgsN4j1SC5TceEit5J6yc21d4nJN4yc2v73buS
	E9tc1AwdUGqzYtcKMXwaYHxuvyKVIzBkF1SIvD49d5vdyzFUuykljV3xc20iRTaoMU4PpWvGUGy
	zxkwMyrU44K4r/8GSEbTzkRQlGbmJcKnDutt+0xautAaq+yW7Pi2CztQr56/ym+EIIzAX/
X-Received: by 2002:a05:600c:4505:b0:49f:f922:1dc1 with SMTP id 5b1f17b1804b1-49ff9221e35mr84930855e9.28.1790552234070;
        Sun, 27 Sep 2026 16:37:14 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffabc3f33sm135335115e9.4.2026.09.27.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:37:12 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH bpf-next v2] bpf: Skip redundant destroy_if_dynptr_stack_slot calls in check_stack_write_var_off
Date: Mon, 28 Sep 2026 02:35:59 +0300
Message-ID: <20260927233653.424163-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bpf_get_spi() maps 8 consecutive byte offsets to the same slot index.
When iterating over a variable-offset stack write range byte by byte,
destroy_if_dynptr_stack_slot() can be called up to 8 times for the same
slot, even though it operates per-slot.

Skip iterations where the slot index matches the previous byte's slot
index to avoid the redundant calls.

Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Changes in v2:
  - Fix multi-line comment style: move opening /* to its own line.
    Reported by Sashiko AI review.

 kernel/bpf/verifier.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index fec5a1ae6a4d..6bc5bc56f0d3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3824,9 +3824,14 @@ static int check_stack_write_var_off(struct bpf_verifier_env *env,
 		writing_zero = true;

 	for (i = min_off; i < max_off; i++) {
-		int spi;
+		int spi = bpf_get_spi(i);

-		spi = bpf_get_spi(i);
+		/*
+		 * bpf_get_spi() maps 8 consecutive byte offsets to the same
+		 * slot index; skip redundant calls for the same slot.
+		 */
+		if (i != min_off && spi == bpf_get_spi(i - 1))
+			continue;
 		err = destroy_if_dynptr_stack_slot(env, state, spi);
 		if (err)
 			return err;
--
2.55.0

