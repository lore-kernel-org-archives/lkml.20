Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFD4A440A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296404; cv=none; b=TIBY2GOo8G8Xvu2YwhatW7VvRPxWqDRC8Rjm9GxKfLtSR9nIhOxRqeQYKqtlUMe1nukymBivT1Yi+XTjb7WGd3pEBvy0N9x8SNoAHeN4Y03vuo8e4nJeNIcODUduDb/gyTpBO97o72bAgUyoII5e69ofq4G53xrqvgZZhDt3ZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296404; c=relaxed/simple;
	bh=3iY0BcnRpcqNpPqskc3tj/I7HmGuTgBWm/puH0m5SUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r90xhec6vqV/Gvx2V05XPj5qyc+RfNk5F+PKXYVbb1OAphn6spB7wSi672ZlGI+GT7EKb9ZtB3ZpAMDJplmGeJj6oBiWVIBwD7rZfHespHpGt2t/FCvmo51gJsnhzEs82O4uMgKobvJGSz75Ekd3MdF403AwL6JBTJitwZfc2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=DBZbDuJb; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="DBZbDuJb"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93900ed2925so36852285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788296400; x=1788901200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
        b=DBZbDuJbh/H2eaLFoXNc48f3hXPNl9IvFHyZOvDjLXNLlLBkx9DSXEw331xPMpkk5P
         1+4XB5M0bQjtnDU7nCK04Kk0RHoWnF32j5+LFDHH4bPoupvT4EI0yqvRY+0Cqu2qv0YB
         B3zB6B8SWE/W5UjCBnq08DgajEpZDlDsdpUsYvGV7ox/Xs/JrTpJAZjhYnI52cnzqXtQ
         o3680q75egTWCDAx09bu5CUTaYNOYZJV0PEohSx4MlNMiII9qH9WUfluZ5YyzV7BN8LJ
         KGu94dkLuNeC6vawoU9bXQqJZPiQODT4QAkZi3MHSkPwcXZzvpfI2XhpQMsnDzo99SAG
         KLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788296400; x=1788901200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
        b=XSsUpXOHZY9uvq3Aip5QV4TsLITcTNar+XRCKqxwiFSssOO07mk5kdDwNk3hwfK1g2
         yM8wQkRI0u5J/R6GRjqIBOMDqwnAynphVelge3aHYaTHDkKHeK8Eia2sp+mV3Z+GBNiM
         8x9a+IArCId4sIqbpULTorPKVtInMc0CEpG2w/fD7TMkN18FszAPPORxq4fEWudA2dpS
         21296YzKZdN7SOe95wjeQBH4im1ewnhveMSdeEuZ1NEyByT6K59MQeHyxrRxS+9fhW9C
         ENYQzhqNlFCmIqqwO6exlSsQWuH/1GUmd6C/fJXhnyIz7I3ZpQmr6frv9q9yZig41xZB
         QSaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd0SqhM3mkK8HAM0QiL7N2/SIcChNnqGAGqg9uOARZ3OC/41rirs86fBTIkklKTTpY1PXn9bJ7L2BoVMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxU80E5LMCuFHMAA0CrXHs8oOhA8SRHSjL2dlujXUJJKpci2K4
	jOPQixwN+jj1WIBoJPHQBJsoYuGo+8wdS+U8z1SK6O4OzFgyrjF6aYIsnI6zuT7Jl2M=
X-Gm-Gg: AR+sD13wdR5bn9vTpTqHLX+ObL5D1LHRBdlcN+SfRsiKrJEwL76T3wgN7V6AYSL9rAB
	TScTtWi0WIVHNU//vloQx5RcsB6+JKkxP4hCpcQPfd647F+7ghCymY1XfR1FMw50jLXZBO3wiA0
	j8V4ZTHNXD1a22lr82DYRauyUNaZXrlxtq2ObCjXrXpo+Hs7tqRdtjG5HaadVjAc7T3ciOPoBGy
	05RQQE4pbr5oD2uQve80KbinL2QvMovTI/1BXDNSLDv0XUjRPqtea4vWz2wMHFXRU+QX60CSC4n
	JCvKRmlCYfUK+oDCgYmCR4vTtU8LXK+PuiTpn38k2eFptJvnKXRr37z+OflfLjjaoJN6NsRmD9n
	JDltSUWf4pIvngl2zbyCzADJR80mmRwQxeE+fgfEAjCycNLMRoQ65B83wPCp+vAwffEsxL4tV0o
	djdxfQplIjgVtZjUetdW2lvy5HdDFGEeNHCB+o4X8ZUuxb+7WbyUAup3gmpUQYSX6wuo1tom4sj
	uZ5vyUtRDl0knZ7aJsqY/qvEKQQ0AlDkISWwu02WB3L99gZWCUNE91rcmnoQZOf1rB8XhKFwFkg
	Uztmp2hgcoZWdrdZFo9YUmDmPdEoQ3Jz1kJYtLws5bH1xujuCj0Ioy1l6gx+SYRowqaR
X-Received: by 2002:a05:620a:72c3:10b0:92e:bc28:5479 with SMTP id af79cd13be357-93960cafc51mr14525185a.2.1788296399612;
        Tue, 01 Sep 2026 13:59:59 -0700 (PDT)
Received: from jake-laptop ([153.67.1.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1aba80sm33533585a.20.2026.09.01.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:59:58 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jouni.hogander@intel.com,
	mika.kahola@intel.com,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/psr: clear the Panel Replay error status register
Date: Tue,  1 Sep 2026 16:59:56 -0400
Message-ID: <20260901205956.130779-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901203633.92628-1-j@metarealtyinc.ca>
References: <20260901203633.92628-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psr_get_status_and_error_status() selects the DPCD offset to read the error
status from based on whether Panel Replay is enabled:

	offset = intel_dp->psr.panel_replay_enabled ?
		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;

but intel_psr_short_pulse() acknowledges it unconditionally to the PSR
register. Under Panel Replay the error is therefore read from
DP_PANEL_REPLAY_ERROR_STATUS (0x2020) and the acknowledgement written to
DP_PSR_ERROR_STATUS (0x2006). DP_PANEL_REPLAY_ERROR_STATUS is never written
anywhere in the tree; it appears only in the read above and in its own #define.

The sink's Panel Replay error latch can consequently never be cleared. Once it
latches, every subsequent short pulse re-reads the same errors, so PSR is
disabled with sink_not_reliable set permanently, and until a short pulse
arrives the driver keeps Panel Replay enabled while the sink is reporting
errors it cannot see.

Observed on a Dell XPS 16 DA16260 (Panther Lake, Arc B390, display version
30.00) with the eDP Panel Replay quirk from commit cb8d155b0806 removed
locally so the feature could be exercised. The sink reports a persistently
latched error:

	Sink PANEL-REPLAY status: 0x2 [active, display from RFB]
	Sink PANEL-REPLAY error status: 0x1:
		PANEL-REPLAY Link CRC error

which survives across reads indefinitely, while dmesg stays silent and Panel
Replay Selective Update remains enabled.

Use the same conditional offset when clearing. psr->panel_replay_enabled
cannot be used at that point because intel_psr_disable_locked() clears it
earlier in the same function whenever an error was detected, which is exactly
the case that needs the Panel Replay offset, so save it beforehand.

v2: use a copy of panel_replay_enabled taken before
    intel_psr_disable_locked() clears it. In v1 the condition was evaluated
    after the disable, so it selected DP_PSR_ERROR_STATUS in the error path
    and the patch was a no-op there. Caught by Sashiko AI review.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3840,6 +3840,7 @@
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_psr *psr = &intel_dp->psr;
 	u8 status, error_status;
+	bool panel_replay_enabled;
 	const u8 errors = DP_PSR_RFB_STORAGE_ERROR |
 			  DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
 			  DP_PSR_LINK_CRC_ERROR;
@@ -3860,6 +3861,12 @@
 		goto exit;
 	}
 
+	/*
+	 * Save this before intel_psr_disable_locked() clears it; the error
+	 * status is acknowledged to a different DPCD address depending on it.
+	 */
+	panel_replay_enabled = psr->panel_replay_enabled;
+
 	if ((!psr->panel_replay_enabled && status == DP_PSR_SINK_INTERNAL_ERROR) ||
 	    (error_status & errors)) {
 		intel_psr_disable_locked(intel_dp);
@@ -3885,7 +3892,10 @@
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
+	drm_dp_dpcd_writeb(&intel_dp->aux,
+			   panel_replay_enabled ?
+			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			   error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
