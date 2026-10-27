Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082150;
	b=U90geZ+wyV+J96lwz9zaLSZfKzpIHfW/7Xc2h9CZpb1WaLJmcgexxIslU8wSZVyJXQxx
	 uKpUG2+EevgBCMUDUtNAGuLuc+jMPfvhHCmBvIzHzUXj8xnax4SME2vJTsOfanKkMDzRC
	 HFN+MvE++WxUkngPLNPWWq4UMZnVsD8z9I/Cj9SVpamjCFuv0CjE64nqtzKTV8RrnOOx5
	 M5gD+vrQCiceihesyhZbznaGL4lJIm3/AlQeTxC+LDxxp9J71lPSGDwOO40BrQb3LYech
	 SEDG92i/jdrysRoDLNKmwIDAcEzTWRcD8vbmAg59156p4SOf8dsmkMGXz6lswg9fOrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pb4Br9/vfh3JVQQfd+eU+eg6IJow6IVC4FUCyw6gp8Y=;
	b=oR/S47UooYJMBO6VIerwbQQLuTeS5xz2lKv+NSd/zBlRIBPXlb0lPKSgWPqKO0StebQX
	 uDgviPRXl67tkTXjP7LYYcwB0lbqJ14/kTb4O4ff/uUlDccZHwo+k7AYyT19SLYd5QTaK
	 HMcV3QPtg1eaLb32o2ERNBiyt0jSO/Asf9Ls2Wv5qWfWJ8hYPOCqwDsGUkRaawuAUjDz/
	 cdg+vCpvyCT/kEMqD6SWuYUUJf/4IeCnmcKW9LuXC7OjSyTh97CBYCiW7pRqDaSUeUK1a
	 6ooUrZRpi7yaCOKcNuO96eXJknF8OQgVrKTXsWroxRLacfoRbpcOzdpuJO/UVx15/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FGfPa3OZ;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026F1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FGfPa3OZ
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so5314759b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793082149; x=1793686949; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pb4Br9/vfh3JVQQfd+eU+eg6IJow6IVC4FUCyw6gp8Y=;
        b=FGfPa3OZPqu5KX+0CwdB0xB3NYxeVGxztvP2JFEmJuhKsWM1/1A5qvWsqJP1vUWFDC
         mz97b+0aS9zkQebuBxwrBSGXU2YYe7ZAzp9s9kvk0o3uM3IrqyobT9XzNl8kA5P1VtfP
         YnZp3MuD1JVVEletQKD6vZ+iyT8IHXJtDLzTq8EcWivPyKZEp8HuGRGDu/PRW+YRMtUr
         gzjR0NTSK0qYdukNjpF6TyyWGZJ5RYjJt1eSYNjk0IkeLjTPuOz27nESgTork1gutSad
         9Wo8tsYWeQ1NR8JDcfBNEmSuGkLqi3+1C+gZbxdVVAt8tGSZt1Ol39OvxZsY2W162ktQ
         /kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082149; x=1793686949;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4Br9/vfh3JVQQfd+eU+eg6IJow6IVC4FUCyw6gp8Y=;
        b=RC3A95R5IxvfetJLnsBvEbfTyc1h6JLjVr08cGoXgs2G9JkY/5dpvcYBKDUXLTjQCd
         +za/7HrkiGn/c75TDZGpW3buGI3nDw07cLVMwywXo2O+EYnV5p4XJhN4BhBFPQtZ50Je
         Ua2UjyMl+0NJk/TXgQ19n1WChe2MNTguFhMtisz9yzqJJw28pWnyw3XoKjZWkfrwBV9u
         mtQ4TY4p3RSBCQtSTHTckzJG/fU0IJvgw8GXW+52z3HJ4zQ3FlitB/FnwDTzA5HgswVS
         unab2HmsTlAjZV6gBZk7+Cwuh+ZmDkw/oEpwZUHgDaUYcqddnDHAt6Fkr7YVpI8EDKL3
         bAHw==
X-Forwarded-Encrypted: i=1; AKwUvBwf1uaOvgpv15uB3iwIaiv7Pauhkm+iFiF0VqBKW8wgtwZLj2Z68XQQsMIzzNw/XsvzzOZSzr26FKc+tR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6a7lgWM5X7dkg6gppZdd3pZLRll+n/xBgnatQEJS6/O2WV5SP
	slm5uK61Ui25DqxuOwnjlBJKpBXrYjKsNpsI2l0IJNkyEpUFrE6K89p9GUT9GPGWVkrJzxYKJ+4
	sbVfBOHVIsmbE1mt/t90s/w==
X-Received: from pfbbo7.prod.google.com ([2002:a05:6a00:e87:b0:89f:dd5e:68c4])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d01:b0:882:fafe:9874 with SMTP id d2e1a72fcca58-8a368aa1b6emr6990163b3a.31.1793082149110;
 Mon, 26 Oct 2026 23:22:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:22:27 +0800
In-Reply-To: <5adbbab4-11f2-48be-9924-9d14a06d0ed7@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <5adbbab4-11f2-48be-9924-9d14a06d0ed7@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027062227.1955867-1-stanleyjhu@google.com>
Subject: Re: [PATCH 0/5] scsi: ufs: Fix device management timeouts and runtime
 PM errors
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/26/26 4:26 PM, Bart Van Assche wrote:
> Patches 3/5 - 5/5 introduce a behavior change: a failed runtime suspend
> sets power.runtime_error but leaves the W-LUN in the RPM_ACTIVE state.
> Today, sysfs, BSG and hwmon accesses still work in that state. With this
> series they all fail with -EINVAL until the error handler's
> ufshcd_recover_pm_error() clears the flag. Is this behavior change
> intentional?

Thanks for catching this. The v1 cover letter and commit messages were
wrong to claim that a failed W-LUN runtime suspend latches
power.runtime_error.

In __ufshcd_wl_suspend(), every runtime suspend failure path
(ufshcd_bkops_ctrl(), ufshcd_set_dev_pwr_mode() and
ufshcd_link_state_transition()) schedules error recovery and sets
ret = -EBUSY. The vendor vops->suspend callbacks return 0, -EBUSY or
-EAGAIN. rpm_suspend() only sets dev->power.runtime_error when retval is
neither -EBUSY nor -EAGAIN, so a failed W-LUN runtime suspend leaves
power.runtime_error at 0 and runtime_status at RPM_ACTIVE. In that state
pm_runtime_resume_and_get() returns 0 and sysfs, BSG and hwmon accesses
keep working as before.

I checked this on QEMU, with and without this series, in SDB and MCQ
modes, by failing ufshcd_set_dev_pwr_mode() during W-LUN runtime
suspend. rpm_suspend() returned -EBUSY, runtime_error stayed 0, and
sysfs, BSG and debugfs accesses all succeeded.

pm_runtime_resume_and_get() only returns an error when the W-LUN is not
RPM_ACTIVE and runtime resume fails, or when runtime PM is disabled
while the W-LUN is suspended. I will send a v2 that drops the incorrect
runtime_error claim from the cover letter and commit messages.
