Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81E34A1E09
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294999; cv=none; b=gWe+vpRYHqFL38UtWmcEvv90HXwBz1d29gZujN8EfFa/yqbQ6FGqCQd8UMiAHyMSYK4NEkWx347aYnwE4IQt6pDrma6+RbNE0oi6POo4BvF3ukS8rxtEHdZaMz/K1PSCZz9bXawufZnqi9IxwNMyeSMOg5zJp+dyHOe5PpAWRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294999; c=relaxed/simple;
	bh=1s2purVvURdIaMiIDBI5QnErnVqsaNEI1HbyFX4Uo08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/3wnsqFE9b4txAh6ngsy2GJ586ofU7OjdDPHALnWqZbtEtWrdRhC8U3sGpkGRxmWMAEdW3Ol5jeHyWNkF2gDVCw31/Cp7NWcmQ8WfGtHael2EnMb8mG125Uix3kGFOoIecSWPkF1IX4m2Q9SbB8ChTZqAV4EKnkiCDhS+y3nJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=dQlsXO0Z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="dQlsXO0Z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936dfd009d1so188890385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788294997; x=1788899797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyAYuLXXzVtKL+Vc2WL6tPFoU1yZSAFLWXRw34l4tAk=;
        b=dQlsXO0ZwGIvW0SGEccYNyBSG/Pnbojb+suvidrW9w01nA19yDWXv8hALEIsQgKz7f
         BtuqSiynHX+BShNsbo9INz1FXFBo/gZgbQNVYNp3oCjlRTF4qfod+uYXNxe7tO6sYvWX
         aeibhf2J+EoYLnKaLHPYyo6WycpC+dKnh7eO91cyfBSMLnmEcY9+N3/LhyN4ewAyzw03
         wkSqwSxf20tU1ypH7Uvh/KQOOV6BUeG0PvFwT1jnxRxnttCtDu0GKBii0WnqBzFFSIgB
         pXWcGO5AKgKgixQuKzC1a5Z+FhkdxDjepLBh7wER3d4co9RUhMrtWKCCGH7AqUQjgA/V
         LhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294997; x=1788899797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyAYuLXXzVtKL+Vc2WL6tPFoU1yZSAFLWXRw34l4tAk=;
        b=grn7qFklClJpFldgSXdN0julh+LVNsPDVxjfkKIdGE+r+uqerzJPXOB4K+GgOlWilw
         xN7W3Rvjgl09f2kPVk8Z9L8Na0u2kNnOn75JbqgIUBPBmgXOLo5aWlb/8ZlHJa8X0CP3
         iCjlJvPM1cPg/g1jaMm/nKhNB7dD9rh5LUPN8Nh2lj4HxEHexRHr8gSRLPFu/ySE4p78
         eKuR7JOMb+glpJDJiIInKNmjIcFQ5XPq+xihLlUZafCYe4CfKO1t+3uXKeB0gjJo1gVZ
         JHUNMrZ34QmVmekfU2HFFYAWlb6Lx10Di2rzAxx2Xh3QElSPPLtYLT/KhTRP6EiifbAq
         l+OA==
X-Forwarded-Encrypted: i=1; AHgh+RrZqqAFskGTJArKYDp4N5QQ3MLomexIftfdDvbhGN8v37Tu0hRTdgwH6IObB+NdMKQz+GJpgvqmBckXK5U=@vger.kernel.org
X-Gm-Message-State: AFuF++lhsaP9cilU42Q5MC1kITaLVhS8dA1szqH8HxkVks9spVNA/+6s
	FKbOrCuiaHHLymzE2WBePgIEnzBgBP9gDXCQP4oh2mJlroIdLlFLky2RPOV7Kyp7/bs=
X-Gm-Gg: AR+sD13Cpc/tDoEqF8+Wq+4yKVSpEZsQwVgBmFbH3zDHYULeiDl2Xn2tiJfpE1ayxUp
	nN/imniEcCdznKlU14UAI+GE9NDY3oe4WPmEjvURLg2d+nn7AJ6OP6BrpqoXz/zTY8zaMuD2vrH
	jnVABl235x9jRqg5yZ/AUVcCSlRC1ikK7pquJ1x7VwzrJCDw/2oRpDBnhH9i4BwT/qMI92VcdPE
	nk41YQLwAK+DnCipj8tnfsiQwwjyldCUC1pS7E3MFBfJEtkp9AHD5jdpZKG8EbQ+S6RTmdgbgWz
	1LNNFjoBjANVq9TpTKcEYFc27CNAKLagsyxhj3z53r+4rhd/o9mS9HnsPRaWHUtQk3sixvz6Smy
	W1qjvZKk+ie/z1+993h7umurn/ukxAyiHyduturXcGdt+zItAtg8dtjs005HJOGdSnZcfsKuCkZ
	mL8hNWBcI6UQpbNf3li6GODUnCdNn8/nHY8mUCDWyJDMGYjhLIiirjN1bxfV5Q8n/wdTjqyVLmH
	ASQl4bg6iUc2ke4b6aFvEAuQminjJf+AeDE6LopRS9nh/Prxonvwqoxma7v/3Delh7eidZ9hnnJ
	wZMio6YQFnNRYoMwpxYnX7d82wZ1xkQRaK3U87ylyrE2AGodb+R31+/znA==
X-Received: by 2002:a05:620a:a411:10b0:936:ce17:7792 with SMTP id af79cd13be357-9394bbfcd67mr879893085a.8.1788294996544;
        Tue, 01 Sep 2026 13:36:36 -0700 (PDT)
Received: from jake-laptop ([153.67.1.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35a3f3sm27146285a.27.2026.09.01.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:36:36 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jouni.hogander@intel.com,
	mika.kahola@intel.com,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/psr: clear the Panel Replay error status register
Date: Tue,  1 Sep 2026 16:36:33 -0400
Message-ID: <20260901203633.92628-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
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
register:

	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);

Under Panel Replay the error is therefore read from DP_PANEL_REPLAY_ERROR_STATUS
(0x2020) and the acknowledgement written to DP_PSR_ERROR_STATUS (0x2006).
DP_PANEL_REPLAY_ERROR_STATUS is never written anywhere in the tree; it appears
only in the read above and in its own #define.

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

Use the same conditional offset when clearing.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3885,7 +3885,10 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
+	drm_dp_dpcd_writeb(&intel_dp->aux,
+			   psr->panel_replay_enabled ?
+			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			   error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
