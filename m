Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB54DC53E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407201; cv=none; b=W4f04PrrHe5KUMjSBW6C0z4AWXcYwihoUD01mFusDIqjtUoO+YN3Wr8lrO9xcRpE0o5ER7f01Y2BsuUtfUh093qqW098LY5m4OthBA9V+TkrHE9nWOPD+uZfaXc6K+cCoyA61x675HzPN3H1IS4psLTrOr/0FU617uulRwMlxeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407201; c=relaxed/simple;
	bh=v3XAnC7a1Q89kbxj+7kktc5NUx9EHyzUV0eefrDbZ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS43hh6cPDg9xCMOIg9U6xcVUwFa9A3nICW/bztRANMefrxWY0GQKKk4bpgtI0t+rmLZ1f/Cz176k9zV4i7KdLKYM/x8hs9IadBFsGCdQ8C7zxrDLXg9R90cbKGnfisSTDOy3s+IQHPP+/WN5VrP2Cnf1E0I5USni/OgGbhGW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=aHslBSdT; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="aHslBSdT"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1056F3F57D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792407195;
	bh=EuW6cWkx9xiT5Oe5IZ1pUwdt55ZzaLd8Up2l6rgVZqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=aHslBSdTerWREJ4B37CG6hYURVxHWwa96MQAlMcgBAdgsij/kjnAH7t5JDzgcAAKw
	 BzxDrXnubUCRGRYSbkNNlHKlJdGwhnttJZmTbDtj4svcXUMfPuctfF0BwkyT/lJbNS
	 sEwZHX8Lxp8QiWF+9AriWEQF3/hAzVK1LweW3UHIDo5JKmqaP5jCvkqPV7hW+Giuuz
	 W6Rj4LKEedY07bT63w74Yv0LVsw2S0UQUG6i4+yMsB6+5TXBWBrgSKNvc4MYaYrebm
	 8QCnxyKj/fO17N/Ku7Lnhik3i5bS+oZ1M1D1RpH/RLGz1M7Fn+wceAW1w+eeoiD5wy
	 bfkEDuhfafAxw0hBVCzTDJ03eGrV04SyXf4AcBgMmVsJDCns9ZgsCFhyMquOHsQwWo
	 sb9cQZhvTNLNMi0E279sBzlbV5uv5DWkvBl/HAoKQUFBxjCONwhKLaN7gQzVmLaxmX
	 st6endGchpjIFmRCOuHwg2N6aLzResCngcetew6e3WsCiH5aZeFVMTFJTLsxzSE9Dz
	 B1HM62pFo3QRmxhjXtee3+sCzTDMOsklg8BgBkYE/D1fgPUi/i7JVnnyFqHHrgXt28
	 2S9MtCeZ+tI/SL5EkbjtwDfkXRHpSZVV4faV+jX57pXQM05Du7LWNljZtvzrIAgizN
	 pRNslhRhv/Pn+2ATOQHqGHUE=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so14021215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407194; x=1793011994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuW6cWkx9xiT5Oe5IZ1pUwdt55ZzaLd8Up2l6rgVZqw=;
        b=ICMLc+FcXHbo4/F/DZrO+8DQEumXepo7aXfsSGlzEKpsQq2cPgMBzL5E31yTnngzbW
         Muq/Veww0piI2I1090yUH42EWPgvFrDKQAzyqSBif6g+riR3Im9YaOho7NNNpHeS5T5N
         c0imew71rNXvHRlIog9H+sx/C+i7HwYYOrP5em5TNsY4pRaGorbm78CQ7UE2nAIoSVHr
         GlCjhs//1kDiMg3dB3WmSD3pfAcMuggl5jcBVAmuJJ2SEkMrwEC1IEomlabwJd+rzsBS
         RYu+3FvAljCs7wx6gYHrn6lAhUoVEwNEGUy2AJU3RID7kycVExRzMCdbW6N+a6iTsKiJ
         ejUw==
X-Forwarded-Encrypted: i=1; AKwUvBzk/n9VxsWoGT/ayhT4iCvz5/VscGQf8GGc+x3SIJ/+fCHkZxqzZxGFXFRDTeapqSk/xc2H3qTLFxZqzp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfvV5D5HZJ1SgI+neu904u645qGwIajGGUevjAQwckBzERznan
	YIY6KLmPeYvcp+dMDSR6GK0Xtj82pz50RVmUb25r1llKFJ5+KQc1fh6eFvwNt2RKIxy5XkN7zBb
	QBO7Jy3CgbgtSyIWXgzhonEmOGLmWk4r8V7xFPuTbwN2RCFE2j1RBqelpuhMoILd2w2Y5A+vyUP
	2xZHTA6g==
X-Gm-Gg: AYBFou05EUpOSvepz6jcJm9C/yAFlEOhc4ned3av99S1NJ1y9icNENQhVtqt5ypGKoQ
	z+G+SWGQBAAetKktM/XuuZM5B/wDdao9IlF1v9dem6MZfBoJG3ySgV2jwik/vfr70X7gup5aQL0
	ZA5zEIs2PyF/DoDwINE3MiD99Ij6/WDZ3q3/APKXkzN2ZyraF6ip/L1fjZGRMJZU/EMVj7cco2E
	p3lhYZwD7D8OvijB2mxYhMe4DfF1htJyX3gSgclTdR6lldy4HfIRuptC9/ercrVOWssFi4dcRis
	FQmgOFtBpoMGe6VUb2ZrzVKIoOC+CwgeFgKj069o52Fluyxrp6gx0ENl6qIy7MtKEUN6g2hHKus
	5nxk3UXsgszxFNPkxYsQ1WTZJTdq1GF1BhPYdXxLmw8I07fuz2iG0rOEy2IZ07IKGu4Mnrfgp57
	B1jBUB12Tm7A+iPQ/43Cm2hguaAApyGdDYbPlvzF/gKvKfw9oRNYPbRH42uuWigvksN1+CDu6eA
	Q1bCIEqFG82PnqGiQYRzrIB1wCAqV+fWaoTHXPU
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a1d7616bfdmr147461325e9.29.1792407194628;
        Mon, 19 Oct 2026 03:53:14 -0700 (PDT)
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a1d7616bfdmr147460255e9.29.1792407193245;
        Mon, 19 Oct 2026 03:53:13 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23238930f8f.55.2026.10.19.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:53:12 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Nowlin <dan.nowlin@intel.com>,
	Brett Creeley <brett.creeley@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS)
Subject: [PATCH 5/5] ice: quiesce PTP periodic work before system suspend
Date: Mon, 19 Oct 2026 18:51:55 +0800
Message-ID: <20261019105155.3793063-6-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019105155.3793063-1-aaron.ma@canonical.com>
References: <20261019105155.3793063-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ice_suspend() stops the main service task but leaves PTP work active.
The PTP kworker is not freezable, so it can continue issuing MMIO
accesses after the PCI function has entered D3hot. Both the periodic
work updating the cached PHC time and the E822 offset calibration work,
which reschedules itself while calibration is pending, are affected.

Synchronously cancel both works when PTP is ready, after disabling the
VSIs and before shutting down the control queues.

Fixes: 77a781155a65 ("ice: enable receive hardware timestamping")
Fixes: a69f1cb62aec ("ice: exit bypass mode once hardware finishes timestamp calibration")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index ddebb28b2454f..3962910759067 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -5450,6 +5450,12 @@ static void ice_prepare_for_shutdown(struct ice_pf *pf)
 	/* disable the VSIs and their queues that are not already DOWN */
 	ice_pf_dis_all_vsi(pf, false);
 
+	if (test_bit(ICE_FLAG_PTP_SUPPORTED, pf->flags) &&
+	    pf->ptp.state == ICE_PTP_READY) {
+		kthread_cancel_delayed_work_sync(&pf->ptp.work);
+		kthread_cancel_delayed_work_sync(&pf->ptp.port.ov_work);
+	}
+
 	ice_for_each_vsi(pf, v)
 		if (pf->vsi[v])
 			pf->vsi[v]->vsi_num = 0;
-- 
2.53.0

