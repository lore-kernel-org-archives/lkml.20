Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F5481A8C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155051; cv=none; b=AMDzRzom6bT7Vyz+TUvj5w+H+2c4ZZew9D2UJM1RILmqxZxqENcBxdLSvxq+Ua1NqTLZvmnCULz5nNJFnaUXx4wEwOIT6X2y5mTAUX4c1u4WfRInbbMERBTbGeWrxnW+ic9SpyYlHd1TT4c+cPopL/LykQZi3szav6HbqE3MAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155051; c=relaxed/simple;
	bh=s4rcpm684AbbWFl9WuUkuu3EtJDM/Esqd6+a5JxGRSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To1UNi3spH383Tsrkpddye5YY4KXf98PHlYThpFqcOTVb2UFJ+BwrH0gh/c5fUIiuNuz2WG/kVWqZmr1t8wSe3CDn7iSUWuy6fbG9VDDPApfUC0CO4SI0JQgEQ/EiQ5iD7M8MxBSa4zdMxCaWyU2sDBzsDKko3ZdpLd9PUzy01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbeUr00P; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbeUr00P"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a706146559so4066935a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155049; x=1792759849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=SbeUr00PMKD3O7+Oyo5zHisGWnIRtUdMHDQ7eHQOK6EMsM4SJl+svyy3B3TU1RvgCS
         0kdqb+RHIqNgr+L7lZdVp1rmvHw7MCKn+QrTNHeTyn/kLhJZBeeJmOpCRUYTh4rufhaf
         eLSsZ32ihbKind6a60iQVbjco2HgaIrHR/0CMOR0kBsqSaEnrfQU7PwHJTuEg9yxpodl
         zzTNdy8Z9C8sxs1OZMoUDZ8WxfIf4YhHAkIOKCzgs2eQRSJY+xjrst8MaAbl/i+ZKHWg
         9ru5DZYRsF+RgiQzEr++eDABcleJXpJce7NAXS0jGMhpYRl3T4RKLdRfNGYs3EbELISM
         ItcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155049; x=1792759849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=FiOljJwhk5J3Qo7OSQOyBBeOBuG/2lZ4qbCzhcVZqIdAHLyOl4p51CVrczBTD7voXn
         qW3TDVY/NSrah1+50I0FwbjS9MtbZ4ZetHlb1LS2x/Dqme0PdRP+cZ6fFzFhfEoMPgRE
         BLRZO9mBLlNrPIr0OAXhWiSDHd75cBFMLTaLCMasz2mfJ0wjv6kpKMdlEUjXtjNktkHY
         7J7uiTvBn0H1Oke/0SVppHABZtl7XIAUbACkz/IWJST3ffNSq4/jbFCzWRjnbvdgeu97
         fCbqKzoilmWvoc4oEU50welXDz80f5mvgTEGgYDhXE1MJKjHXwVtB11xOkF8sqpPWT9E
         kVww==
X-Forwarded-Encrypted: i=1; AKwUvBwiPQWlz5xDfBP514uoPOMqO4DSc17iI3EQYByut4kf1t9l3y4yJZx5vmWjYklAn7dTqRXq3/SwXHTqjaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhDaLsCPdeBRpe1/EnxRbye2jJsKO5abTumGtX4xogcd15jgXg
	IuZuyCsnjeU8/Aqjm6OWvkIoKNTeV0VWT503xgPzRLF76VWThxHGKqcO
X-Gm-Gg: AYBFou3Ut+I+ksLO2cHUg5hCT/PSXGn62udzzR/IEwXNxOT6bkKX3af0TImqXSzFC5J
	tzWTlj5RpW8bAPltYRvIzMKl1rSytCcNQzLM0eyAdCPk7lJ8m/XxBsj3VhZYWueapQaklAGnGmK
	2TmMU82NufSf+olSeMMycxPN74pNyT5bkFtya29szjpFxO2Uxa2+wOXaVgRRN02m3F3TEODJQyN
	zaCQLRwYBG7155sVMqQ0VRngpkZtSlohVwLyJW82TUbkXDVNmsQZbEsqAEA7c64MXspnD3npzdz
	81rtZSAC0S6KSld1dBXa8XD1xyfF7enVaQi58uZKlePIIY/Lxp5K8unf7rCad5vjvjGc9wdmlii
	2qKe9jGIiXo9c3GNVXC+MCMs9Nd4r09twJJMH6iW6WYeMZwu6kUTJwjKIL4d2hHDA9YX12ZINVL
	9YXbt6GSWESf6hmgZehhNodhkUcMgoyYKIHgRS3It/5oeLOImT+pNne7r3lAaEIcBXoUFqE9B5C
	9nUncODdRS1CN0=
X-Received: by 2002:a17:90a:4c82:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3aba3ee3e2fmr11173340a91.22.1792155049139;
        Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm9106546a91.8.2026.10.16.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:50:48 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Fri, 16 Oct 2026 21:50:44 +0900
Message-ID: <20261016125044.1085-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending with the lists on Cc; my earlier reply only went to Abel.)

On Wed, Feb 05, 2025 at 01:45:05PM +0200, Abel Vesa wrote:
> Scheduling the USCI connector worker on the freezable system workqueue
> instead will ensure the devices are resumed by the time the worker is
> scheduled to run.

Hi Abel,

You mentioned respinning this together with the altmode change (now
7d0767c5cd87). Are you still planning to? I hit the same problem on a
Kaanapali tablet (Lenovo Legion Tab Y700 Gen 5) with an FSA4480
orientation switch. Unplugging a USB-C to HDMI adapter during s2idle,
with the altmode change applied:

  i2c i2c-2: Transfer while suspended
  Workqueue: events ucsi_handle_connector_change
   fsa4480_set
   typec_switch_set
   typec_set_orientation
   pmic_glink_ucsi_connector_status
   ucsi_handle_connector_change

and the system never resumes. With this patch on v7.3-rc4 it resumes
normally (2 of 2) and the change is handled after thaw.

On Dmitry's question: freezing the ucsi_glink notify_work instead would
also hold back command completions (ucsi_notify_common() ->
complete()), so a command in flight at freeze time would wait for
UCSI_TIMEOUT_MS. That is from reading the code, not tested.

If you respin it, I can reply with a Tested-by. If you'd rather I send
it, I have it rebased on next-20260928; just tell me how to credit you.

Thanks,
Joonhoe Kim
