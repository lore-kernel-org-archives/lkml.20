Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791689;
	b=kkJFGWb311nja8uFltJ6Y7QpKfP0S4Ip0DMzpmEp529ttTtPJWSYKclAQB5NZSRfMoy8
	 XXV11OZBxOMoj6NCUracdHm3DYqxX5FdMcKXo2NtF7/oQcVmfgXTvsiQd+Vh3KEujSW7n
	 qjWxlecRCFu6QyQuAs+l0vTJc03x5E98NHsBXRWiFJeuRmmvOhvB8pbGtXfEKDHiDY4Or
	 7snoEj1l7GtBnlA9db39kv2EfQk1yrpr7TrdID9n5D1ENvY5kJQmYIhDKMZ/gL+NmyOzJ
	 7ZFHZTCsuVZnCn2XzMYWKpSNwK6+wzDdp8DbogweG4GulpE7OA4sSE+UtUJORprBkOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SF7pZMo5UMRqgADcWk2DKfyPMybDDB6N5ged2rxXhPs=;
	b=dLbd9WUeZPS2Fja4wMDoCJ4x3wyF5aw8Zl+n3N9CvQjkDJ4zqh0xUoWDInx28KUD8qqs
	 jY5AURe0T6dr7QXc+qSI+Kk0IsL/NqVUZxau2RHV9RDnFerOrLVcwiDoZgSsc6u86ECey
	 svaRv/ofSdng+MwwAR/XPGNL7iGtJMDwJDv5sDuKr+fHj/f2O+528UVMP3hyVypj01Xli
	 2d4A1V2U0ddORZkE0xFolibLBwz8b7pTVDilBJE3YwJ+XrYtI8TOvU9VpA+ZlPaOYtGSG
	 62SJ0cbCV+3Bgx3U/55QtWHorvJ7r9BDEAqYUoInZ2hURYr/chPc0yfnk0x5Oeci3LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lhQ4jzXL;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3F606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D3F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lhQ4jzXL
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89ff475a0deso694001b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793791688; x=1794396488; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SF7pZMo5UMRqgADcWk2DKfyPMybDDB6N5ged2rxXhPs=;
        b=lhQ4jzXLF2fzjGuCJrAbkiK1nLdnyfY52DFnzVeC/2DsqTN28ZHrP5r4hi4qyQMS0d
         yv1Do4Ba6BR3zB0Vw5csch1E6ohsqxcMWgX/vFN4KbceavWSxJEvRvHs2qD7jxojvauX
         0xr9w/mAastp1XtPgrKhcJ/HU8q/P9mEWicah0qAnR190jRbYK9bLM4g4EPuuSMGYYKM
         SIovzdsG9Axzki2fv8SWX8uowK3De+3LdmfOPHoOZhuzGCBEIM5FgJVbSG1dhGDFr45r
         ho2mNK0I2mMFevwFST1fj1pggWYDuY4W1eXBOqt7lkicYCFdR8CAFwpkVShoZiH8S6we
         lvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791688; x=1794396488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF7pZMo5UMRqgADcWk2DKfyPMybDDB6N5ged2rxXhPs=;
        b=rNhisPDu8TWfxREDnFER1s0WRzSnr90e1k/jOJ9y4qDsnwLPtgClYGJXUm44tROCtQ
         wULJ4vGwACMyywv+Rihk3nZhXcI7tphA3P6mgr9Qx9+jfvbmjlk2VcIOY5aUmDsbQkwv
         KOH7UfzPbM6Y2XnXPEWFW8GjLDQ1mqKElcAEo7Vzjh992ru6QxZoCdysXJOtj0Cu5LG8
         1+zpyadLaZ6Z4yBICN177hKhe/0D16do9Wh7etjGEoApFDqQNJ/8qUsNxbeRlQHBPx/f
         pUvfxnBTD+AY4EjzpdXSQEpG0aKP5uIHZliGkvBRwbZZlk8fVV8ZnEGmiBZtWrb0k3Qy
         iQJA==
X-Forwarded-Encrypted: i=1; AKwUvBxR5CGqbrCiyLGTgQGRbFPeC+2n4Y9Qf2qGDkyyX5Atp5ZmgztLsGzXJeIUpfIj44r0VKa7HowL/73LhDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iRHuKBeVOtvpb7RpVgngASOw6AyajSmJvzL7hOWFYLccZcedP
	b/IjRXIuorg0Dmok+Ldsj54/UMO2d4HQFYVUQNbp913qHPIwfO4RZvvotBdms2qL7/iVIPY/dxO
	ESDCFiegdemdDP/IycxRfaA==
X-Received: from pfbfb28.prod.google.com ([2002:a05:6a00:2d9c:b0:88e:f55:207e])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:bd12:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-8a9b9a4ecd9mr12223851b3a.2.1793791687832;
 Wed, 04 Nov 2026 03:28:07 -0800 (PST)
Date: Wed,  4 Nov 2026 19:28:06 +0800
In-Reply-To: <6e42537e-c7da-4b44-90bf-dc4cf30be6cf@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029040001.2100001-1-stanleyjhu@google.com> <6e42537e-c7da-4b44-90bf-dc4cf30be6cf@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104112806.1633283-1-stanleyjhu@google.com>
Subject: Re: [PATCH] block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when
 already active
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 12:54:35PM -0800, Bart Van Assche wrote:
> Stanley, the analysis looks right to me. Could you make the invariant
> explicit? Only move SUSPENDED -> RESUMING in blk_pre_runtime_resume(),
> and only call blk_clear_pm_only() in blk_post_runtime_resume() if
> old_status == RPM_RESUMING. Please also describe in the commit message
> how this was tested. With those changes:
>
> Reviewed-by: Bart Van Assche bvanassche@acm.org

I have sent v2 with the explicit RPM_SUSPENDED -> RPM_RESUMING invariant
in both functions, the testing description in the commit message, and
your Reviewed-by tag.

> Separately: since commit eef1d74bf88f, ufshcd_recover_pm_error() no
> longer sees power.runtime_error after a resume failure. Its handling of
> that case is probably dead code now.

After commit eef1d74bf88f, a failed W-LUN runtime resume leaves
ufs_device_wlun in RPM_SUSPENDED with power.runtime_error == 0, so
ufshcd_recover_pm_error() skips waking consumer device queues after a
host reset. I am preparing a separate UFS series for that path.
