Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8681A6834
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789965479; cv=none; b=o9lOBWqYz4IKrKH/jfXTY5PMp+DqtXgVAUoPFEZ9A2ymBMqdpyNFGcTN8NItIaESrkhnpqY+WhpqImlydQutrvYgrRrWIepFhcXOagcFLlteGdxGs3VYVd1753wYBhRTNAUzlQw1bNxS/VWGRA+UKsPzQgoyfvTX++pWb1PDtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789965479; c=relaxed/simple;
	bh=2uFE3mXZl4Xq3D3D7cZ1Kf0JImoScL/wh49nI54DY90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aiRnBRbOF3UTh+p3dAfK0c3CMDV0fFQ0pRbASpCSI0pwxbKP6VxsUhr3VZJuuWjpgn38hOkZJeYU+roHW2Qz7c2ED7hW62y7PlbCtFNsf5F0COlHyWUXpHuy1kadppr6UBjg5EpkP0AXkjg0LtL9aMRSEHuqhBnXS6QZG5NehEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qmmjLbr4; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qmmjLbr4"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so37560815ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789965477; x=1790570277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oI0AcZyXxpUIL8Q/kLh7OVD6XmpNgHHPHxdbzb57xtY=;
        b=qmmjLbr4KWrk7krMZdmbgl6LdUVrEboaNQ8nrFZeHbGH/DuLS/2UPM9KCq1Mbjidvv
         guEROtfKDGE+vP5MaiNgxA7oWHrJkLPLX3of0g0dRGVvGm4+wlaj5sm/GuQcI0F4esHw
         GH712IPZCFAWo3tDVVfJefJ4V2R7uPbT7k6LYCfGwoFc20JV0zW3FLeSght4WRZv1ov7
         +pV2cJuxV2QO3kF5YZF2NQVo8J7qp4HZnmuhXKpKiNkMqA63m4cckZSR6qOVs3u98PRU
         YIAVt5xsOBXjp7TWweAwBLpFXiRQMRRSzCHVHfIv2k6APGnAi+6vmqLIXZ2kqmjhdbfu
         UaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789965477; x=1790570277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oI0AcZyXxpUIL8Q/kLh7OVD6XmpNgHHPHxdbzb57xtY=;
        b=V9AQgLZxErCyNiX0x+w6OkqW+SSmB41gG/wPHt6xkeGsoCBzn1ZjtN9HXbE2Mp/B4o
         xHehtJ04aMnHvsIJmOZQSEy+Cd47dxf3zysGwO8ozwzlPagSZpFvSncdYTIXYPTiJV6s
         +5JePnPQxpGG1deqpjJfG/LnVn1/V9k+TNkWj/t5PTTaQDMDeAmplJyfouyBSoWJehJB
         Hknth1q1b9Bsak2BW+8Qa56IL0VaDt461J7a6d9MBShMQy3Eh/Wd/3I+V+56JsEvXHtO
         Fe3Nh4l9AR1bl4uQtrQS/0/2XCV339YPp/aT0uO2geR7d0XbF+aoypbobAztLwCgO3st
         LuYw==
X-Forwarded-Encrypted: i=1; AKwUvBx4sfWqx1ro/IDxPEDTjoWbT2x+pzpmf8vNMe3rTUHZ6T9XNt9yjJmFKressNBNDo+TSGJSHKKA9XgdA8E=@vger.kernel.org
X-Gm-Message-State: AFuF++khn9MuNgjunYC06HzB74Mbd+63h4ymlGK62FiVjNt0y53nJsfu
	i1AmhvJUCFTEEBXwWwzy2/0Wm1xCGOvQ+s0etn7+lUyNhSlT11h65yoiA9f9M1MjPyljQQv+rv/
	/Dxf+N6Z/7IijmxUZckHUJw==
X-Received: from plrr2.prod.google.com ([2002:a17:902:c602:b0:2df:4071:690d])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce92:b0:2db:63cb:1b17 with SMTP id d9443c01a7336-2ddb1b77648mr164287785ad.18.1789965477201;
 Sun, 20 Sep 2026 21:37:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:37:55 +0800
In-Reply-To: <fee250ea-8e0b-4320-880e-8e2627e7b103@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260920143319.3659543-1-stanleyjhu@google.com>
 <20260920143319.3659543-2-stanleyjhu@google.com> <fee250ea-8e0b-4320-880e-8e2627e7b103@acm.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921043755.1689675-1-stanleyjhu@google.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Release command resources instead of force-completing
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Stanley Jhu <stanleyjhu@google.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Peter Wang <peter.wang@mediatek.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 9/20/26 5:41 PM, Bart Van Assche wrote:
> No, this is not what I suggested.

Sorry about that - the Suggested-by: tag does not belong on this patch
and I will drop it.

> The text above says "implement this in three steps". Hence, this patch
> should have been three patches instead of one because of the "one change
> per patch" rule in the Linux kernel community.

Agreed.

> Why has ufshcd_clear_lu_cmds() been modified? This function is only
> called for pending commands so checking &hba->outstanding_reqs is not
> necessary.

> This is also wrong because this change will trigger a use-after-free in
> scmd_eh_abort_handler() if it decides to retry or finish a SCSI command.

Both hunks are out of scope for this patch and I will drop them.

> Did you read this code before you posted it? As its name suggests,
> ufshcd_release_scsi_cmd() is only called for SCSI commands. No device
> management command code should be added in this function.

You are right. In ufshcd_compl_one_cqe() I moved the
ufshcd_release_scsi_cmd() call out of the ufshcd_is_scsi_cmd() branch,
which let device management commands reach that function, and then
added an early return there to filter them back out. In the respin the
call will stay inside the branch, with no device management handling in
that function.

> Regarding (3), the UFS driver is a SCSI LLD (low-level driver) and hence
> should only do what is specific to the UFS driver. Completing commands
> after .eh_host_reset_handler() has been called is the responsibility of
> the SCSI core and should not be done by the UFS driver.

Agreed for the path where SCSI EH drove the reset. The case I am unsure
about is the other caller: ufshcd_err_handler() also runs from
hba->eh_work, scheduled by ufshcd_check_errors() on UIC and controller
errors. Those commands have not timed out and are not on
shost->eh_cmd_q, so SCSI EH never finishes them, and the handler leaves
them to the reset path on purpose:

	/*
	 * if host reset is required then skip clearing the pending
	 * transfers forcefully because they will get cleared during
	 * host reset and restore
	 */

Should those simply wait for the block layer timeout and come back
through SCSI EH?

Thanks,

Stanley
