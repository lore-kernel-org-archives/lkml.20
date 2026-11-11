Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399378;
	b=lZABAZkDmPzD7WClPwcV40FR+9H1s3+xsVucrCUFPqV9iXIPHDE7M9YjmvmmRaFs177E
	 /4KQKXbO1++Hmga2OQU5rWZCk2zIwETzsh/uYxcpPyM3FG7WXyJ3ka/popmkeLr2sW0Ww
	 ORLZyJO+F+YHqm/BaKak0PHoXyYNjZwZptmSfVwDAUr738gFzVJvRyu6qz2LHEymTwMMG
	 vuQvoSMwWAS/tCE8Q+RPazTcKeSVYNuSYKmxuwoqXdIL7ew6hStkmvMEaKxxYrqKtdNbj
	 dgMGTWan6tieIKMKf2MCquRtZ9nWxqIJkSJfDAQfaiSo5WtaGbEwrJPhp7tvjQU0SNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
	b=IGVCkOCAiSyrz3/sNvf4mxOG+b6PYjC4K9FqyfJf5TW05mmDRUbbZrMp4ShkVyVAxTkx
	 Ui/2upEO2W1vo6syeW+NjmMsV6BZkldSiaDNzsBylyWUSzsUYY3YTFK6JZ/tIYlDktpzN
	 YM6Zto8wDU3b+RfL7haIRRidqRDnVfVwVmddPIsIk3EovfR10LEFUGbjxCKEu54BnoBTo
	 VXOTu5dLrEhpje1Bbse50oInhLxnarUuzHG7UuzUFXPoyqvQXUJsJFEsTuOaZBxlcNjDn
	 0wnypMI/45S1BiVeNB7PjoJnJGcmUVMmdt0fI1kBdV39piy4nD2g2WB835ykrKUoSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0E606A8BC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B0E606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so2926453f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399371; x=1795004171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=qEVRdnEHKR9SJkjIwuqUlDKDa/eqsVO8f8iPfjDn4hG/N9WCGa5Nx2Yzwf4jVz/kHP
         S9iJpa6mOIjzz9wzGG9xnlTiqQFb04tfHmnI2GpXWYoH7Ypb/cYSbYUMfOGZ7Z6pXusm
         26YrjScF08lM9kmPxMQDDfXOV14+jJMUASRjw/dswBk6bQ+pEJATDLKwR1bFJzUYXI43
         3Yr1kJ1/SOlD9lyDQxxHULgcLQtFLfdxu5o6tH1gR8wwTgQSWcNXM5mVk7u1YtT+cEFj
         ZMPphlKliUqEb84X0pOLOA2MaQqmVRS2zr3IeJPU/5O//YJj61HeVp0d4OiEZZJbogkV
         yM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399371; x=1795004171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=HE/Sil7tVzCkvY2J936ZWFAA63W9rh664XVVIEiF1+UzJh/e/crjcr5ertMPXQssRI
         j0QtGYYr8CBLwm0tJvIKKUyJdCP+D9/UTNxiHT8vp4/HKZd2jV8jjDa4MlMgeBuoRuli
         PgmbgF5ApJnCLNyWoG7xM0I6TAh4XW+kGZtvOlWIBaeRM9mO6ugqHZlezKhO5gcIFwY9
         qpWqpkMtiKwlsXPs1IAbn422HtJ6sDgvDm9yQsll1cvmviR/AgS6wffVPrlKugwQaNL5
         3zSMSMnVRVQqf0DdosgjcZ1e7KIB0B5lMrAgcoYEd0kNkv9hQdYPF9OgN5IBuE0t5KnQ
         EE6A==
X-Forwarded-Encrypted: i=1; AL+hErHX2AI2wRvCTgVTw3IJJtGn7XlZvmIAi11ZrPwofXJxakwtAgTmJYGIUmfuDL9MwhQ6xnwoBRU86KLa0D0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YSyd7wC3t9uAyvkR7iVSh/PYNhB8+rcAlbhfFrKd87zh/sT/j
	G8kzMVKhV8E26sgeqazSv5n9EBc80d5W930OCc6BQUMzzQsJbGQdVKmW
X-Gm-Gg: AYBFou3z5brm/jf1nUZKTXQ7iIhA9K3KrPm5LJzEvSwgZhHfeXgbUP+Wfzm2oNn5k+v
	pc/CKzKIAFjBISZNDExhePEiFsBT/vX6mHLLRtPROMvOraCvjoF9EjdM64cvcAyagEqsC/faqw8
	ag7tUN33Py78MDRiUgs7bfOruoso7TYhZfABQqp5Tzw1zrHcTbDuysAL4WAxWL4T9HJgpR0Tx2z
	a1Wx1A6US3pydrnfiM3ys+U9Y6tU0+737UfhBVjBIfbBsIuN/AjwVtNZLP7ZI5A7JwsIFh8U3WB
	F7xDacXIolBOqmOiVF8Yh6UiaIz+qOv4AmZbBNkvL/m7fb8NddXqXZYSJYQDLSHFlSVFJMPHsL0
	sGfXDpCHW+5KaocxpQ6+r0+76U4UoI7E83BON0L3DnAoET6r7bxfGje8UNFqyEYVH6ozTSY0j2M
	jB5JyYmye/191CH+s8GYdUL7qc22txM2EOTBSi0ny/NO4JHeSHKcIrZgWdBN9i/nVEwp5RrlB64
	Yqy0y5nAbC9GmbLDaFRX3P27e60NBP5pFAKaiOrniyuaDgEAQqIUv9OSRHT4zr4Ll02bN6Fo+Vm
	W41+PMGtrhJyKYYAnlFX6jpx8hxlLn690J71oFCWEofXU1YoDdgJ7JfP
X-Received: by 2002:a05:6000:2308:b0:48e:6f76:de9c with SMTP id ffacd0b85a97d-499c6e9636amr3846243f8f.28.1794399370646;
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm9544010f8f.4.2026.11.11.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
From: Vlad <tvlad744@gmail.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn down, across suspend-to-idle
Date: Wed, 11 Nov 2026 14:15:56 +0200
Message-ID: <20261111121556.1871-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com> <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladyslav Tymoshchuk <tvlad744@gmail.com>

On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> Suspend-to-idle does not power anything down behind the drivers'
> back, so there is no reason to end the power sessions there. Keep the
> core, its PHYs and the suspended ports, as is already done for wakeup,
> and mark the device as being on the awake path so that a power domain
> with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.

A data point from a Qualcomm board where the first sentence does not
hold. I have not run this series; what follows is the existing "kept
for wakeup" path, which this patch extends to every suspend-to-idle.

On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
node is a wakeup source, so dwc3 keeps the core in host mode. The USB
GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
the same. With a USB stick on the port the xHCI then comes back like
this, in 3 of 3 cycles of 150 s:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
  xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
  xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
  xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.3.auto: HC died; cleaning up

With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
passed as well.

This is the third point of the Sashiko review seen on hardware:
device_set_awake_path() does nothing for a domain without the flag,
and the core is treated as kept although its power went away. I would
expect 2/2 to bring this failure to SM8750 controllers with wakeup
disabled too, unless [1] is applied.

[1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
