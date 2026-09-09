Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785A568FD9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968319; cv=none; b=b2Nbigu1+v/Bnb+8b1cwI3eR6i6pcrU71PONxuKTCVf9c3I0yD9SaaIcYte6QRzRlp/+GXFIAswaEwS+KDPCMEs7/ltC3jcmKbpuMSygVn6vozWhvtWfyAOoz1ozkbyA1iX9z1P273Nbr+v+w2+vMiJgNgnXZtLy2PKmMWKDOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968319; c=relaxed/simple;
	bh=bK+pjTe6cSWevCbFdLphzTe7FC7872g1Yx7XEYe6vzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBb3llJxBfib9oKd5ll02OCAK3FxIBFplPvkazb99P86n2gfYyyb/b6d854d/59zOWZn5IBuSQeOIP36sai/eD6mScxrnSyWyq4KMfHifpz5nLDxYxGZAFEi/U1zEIW0u664wJige4NfTyrevgWBGJGzfU9d6hk6RhZIktHkqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzbSr+yx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzbSr+yx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso44348565e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968316; x=1789573116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8S3fBhkCPJSV3cRNUQtxcR+vjeMJsdADNC9uYmwfZuQ=;
        b=bzbSr+yxXgC+zbqcZJT+TgOtNHhGxu8LMWsX2FAl0u27VjuxdXyFZGyxYdjPxvRMMI
         Ysev0faQyOVDQWUNLOmfQfxIhjEALE922aMdWhPSqd1tB+5Cce2XLbhNIvW6Eq5AnT3m
         BaVOlQb52y5LF7XER04H0I+qr1wVmeb3P0gGr9dy0V8is/srZBcqTFoRwOPe2qhilywW
         J/eJnzVlxfQLzy8kpgSBLBdEWRogmpwNYVYHKhov71pJ/AA9CchW33EtRAHfOBHB8vuv
         75H4rmtbj112+fj/jtX4yevRkxg2TIRDwP9kJB6lsKRGW6rebF7yArgv9JRWz/+I/Bw5
         +s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968316; x=1789573116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S3fBhkCPJSV3cRNUQtxcR+vjeMJsdADNC9uYmwfZuQ=;
        b=qB8dNGz/5x/C5u2EHj2Eu/eUIreek8e17WTe7HFX8IpMWHfu1TbgogltzbzZp1D1iO
         AdjF00FFqYS8hu9VzLYsSq0d7YwUQ8F0NeJMFiHvu7Cll8S1IbwBBnr/A6JuSlpcb/wN
         5io6q3kJc5Diz8YQYb8QD/Xn+bCcAtyEQ6nuNn2lrkLUHAtghzQDEHo0YSRNSMPGosrU
         LA83BD3faGpAvAM8IpDOzcGd+r7PR9TpH/bMD5tQpC39nSeEobTJ0kOIMIAzARjwvrNv
         umrdrtsmEK7XKNZ0GzjCs3J3rSuiyhyDcl0Hnk0zFkMYOkVsc4bHZPNDUficIFLue+xy
         DSyg==
X-Forwarded-Encrypted: i=1; AKwUvBwpZwTbIPIEqzkNm4AGhY79bXFiotCRLTOxAtc6JQixbcfg+9jNVsE4dx2v7LQx0cG2Ry/vptQdARdaOoc=@vger.kernel.org
X-Gm-Message-State: AFuF++ksG84WsSCluc1/QQBbBP9sbzB2U05zUtGblZHAv9Bx2NueNosC
	C1oLEKj//prMl3x3a5HavXBNBe8RG3nnLtwOL0CiBhUmjrQcISB3AnUb
X-Gm-Gg: AYBFou0w7OV9EEVHKZRMlpL6UgVV97toSp3fx5VAHpOtY7owT/1PEGDW1CZSlPKHWJ6
	WCz/xFTQ1jeg+zR5vZKpI3dw5cjMz48Wv0c5G4eF+h6DnuG0rKW3ZPQd7DdCQzugodRFjE51nPK
	f/22ZZR/amGivMpLrSvo586syqYkuzR/sXvMhpI/ZiXzA6ym2LOCoBxcNjj2s9qbMKYQ0+q4Re+
	XZykMPHWh+qUXUyyKHRBy0zOhQYMopH1jMhfMH5vVm+Xx8lu8fQ2ZjlOz/jVlcdkiyneOwuYTjB
	ur9fm7SwS2N37Rrqlz3ouX/A2ypfr0a4cXeojfXr/IUMJDCL1iS1+y8dnJ+URAgn8mZfJXWtlmC
	tVEmjXuoi0iIpBV2GoT2O3dPkq/NKinwVi1SZrV9/lG+qhOV0mMC++nOVActD141VIFKhVJ2e9L
	jwryBllt7UKStv4i1JpfZi2VyoipR2lJKDBS85N4TeTK7nXDKg778sORBNW8W2URE4vtqM1cVL/
	0jBYJP9z7CshWy6YngfuuvOhiGFAGdC/+9Nn92R3zFiyC9Uysms4Q==
X-Received: by 2002:a05:600c:4505:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cf7fe607cmr338568715e9.2.1788968315686;
        Wed, 09 Sep 2026 08:38:35 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm45437055f8f.26.2026.09.09.08.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:38:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] phy: qcom: qmp-combo: do not decrement init_count on a forced init failure
Date: Wed,  9 Sep 2026 17:38:25 +0200
Message-ID: <178896830509.10915.10301668870227152275@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909152846.3C3931F00A3A@smtp.kernel.org>
References: <20260909152846.3C3931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

You are right, and this patch should be dropped.  Please do not apply it.

The diagnosis in the commit message holds - a forced qmp_combo_com_init()
never takes the reference, because && short-circuits on !force, so the
unconditional decrement in the error path drops one that was never taken.
The remedy does not.

Tracing a consumer that holds phy_init(), so init_count is 1 and the block
is up, through a typec callback that does com_exit(force) then a com_init(force)
which fails:

  before this patch   init_count 0, hardware down.
                      a later com_exit(false) does --init_count -> -1, which
                      is non-zero, so it returns early: no double disable,
                      but the reference is lost and the count stays negative.

  with this patch     init_count 1, hardware down.
                      a later com_exit(false) does --init_count -> 0 and
                      proceeds to the full teardown, so
                      clk_disable_unprepare(), clk_bulk_disable_unprepare()
                      and regulator_bulk_disable() all run against resources
                      the error path already released.

So it swaps a silently negative counter for a real unbalanced disable, which
is worse than what it replaces.  Exactly what you asked.

The underlying problem is that init_count is being used for two different
things - how many consumers hold a reference, and whether the common block
is currently powered - and after a failed forced re-init those two diverge.
No adjustment to the single counter can express that, so I would rather send
nothing here than send another half fix.  I will come back to it with the
hardware state tracked separately, once I can convince myself the teardown
paths are balanced in every case.

Patch 2/2 does not touch the counter at all - it only stops both callbacks
carrying on to write PHY registers after the bringup has already failed and
left the clocks disabled - so it stands on its own and can still be applied.

The runtime PM patch it was a follow-up to is likewise independent:
https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/

pw-bot: changes-requested
