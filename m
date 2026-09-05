Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685ED3009CB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598399; cv=none; b=LfTvRnD2m8QAhIyKC6SdEriSdPwrktFvVsZWHkT/RfbTVowqm/5tjb8RBEY+rVyZfUiDM2f2qZvP1zdn9rkb3OYAa06UxTspy+uXvBWrSVIoZncND8VfYoSvvVMeigDNHnT1U9wB9dYaUEJB1GUDHYrWlHX5KK/laUxCJmD5nXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598399; c=relaxed/simple;
	bh=nJ/Jzm/pLywrqXaRF1jReqVrMyMWidF2B+SXrUTd/jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpzVzUm7mbCA7IQgz2AMYWCw0TzbA7d2it07MECEG38IFQFS0RR7DekYZ//Mjq9Q4d39XwemWTpWG9cyINlTmE6qef1QY98SAZuJ77Y8VaRhQZrQL3xobHMqx8bW10l/X2GpidRf/HMrG5+hSrHTqd6MbaA/BaYET1ffmjPbM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6aT9gwt; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6aT9gwt"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2022898a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598398; x=1789203198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oflo3Ik3xMRYIr0nUxXMW+sR1gdqaunhaM2vyLgzQM=;
        b=Q6aT9gwtq2ZUBDL3WxI7hPe/sykX8mvQM0bA95KjKIQj6DgWamVT66tJp4rZdSDW/Y
         23xuUefg3kk845w9a89Ub4emJ7qLF8xLy9Vavn8y7SPtA0wT7JjtiJ/Bo2Gc7OKEwLZs
         7uLhNGnoH7dvAvWRXvsusY4pwqnPBzIfqFE8rGb6bNfxRQC8Vhfu54C4I8YXvK+meg77
         iD6tfrPPSSU6sSM3+DS5Czv0/iZzZDpe6ecPhAcfnllQWpVqzVopbWjGOZHRPVk+5KuS
         Q5xv6einPgzl0TxsEsxRPCpmxOneJAX/KSNs9UrzFFerBwKKQFncHetxG4pt8k4e8xlj
         eYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598398; x=1789203198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oflo3Ik3xMRYIr0nUxXMW+sR1gdqaunhaM2vyLgzQM=;
        b=bgbXAExCSl/z4ZNBAgYEK8QpIaKEQn4qkUdUj61Ki1+ZbwINfJfw5BJKAFVNkZtAYL
         A0G/IF/vLcO2kgnj/oa854GXL1URPwM3m6ZhTOBUNdgg3Jos/7OVA3NIDCA0FvcL91H5
         KUSNA6j7gWEPkPWHFnJSkrcrTpLNxzX6D0brWYDanL4ZHxQzQ00ZLP/AegGZO56Mo6E7
         JcimwDoxx/k/IsfBskIQ4udKiQpemkI+wKMFEzztxKBfrHAyHOnKPchvTtW0cNEQ5Jh3
         8ZsR0p1Iz5POXLSixsbZoxxxC75gJVjP288DWDblSo+7bzJZi7GlRodGalNgymDyX0zY
         rNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcxxtb+DRpBynWAP4k5au+jFL6t9lOQSSrgYZRmGJm6Tid4EIm/YF74klvJEmY8Qka9t/UiuFtYuzTQJs=@vger.kernel.org
X-Gm-Message-State: AFuF++kU1msbWqJUfzGabJvE80n8h/UGEDIjUFuqLc/ZdX6J4d0j7gTp
	txtj0iZM0O0PdBI0gpiUIcUn6DLclJRj9a2xH6jzmoJxjyaewPiWWsTm
X-Gm-Gg: AYBFou0qnuJ52o/DX5TjG4nIYLzdrXxTSdS41Vm756ZE4uphbLjuvUMV9JlRF9zS7Q2
	ZBsBWv4F9dswQQMf7A6wt69oweMrIIK+VFn6zo+BxUPcai78ljSS+PQ+0SVm0n3nInI8AIkuEEs
	7h4O8UENwHquy4vHOpD24G5bqPtab8kJafArPfZXqX6MTYcoAnpd4Z3gSI4AuWAzD8fLLmZTvDN
	8W987upKBMyqviBr6WSjOkWFUo/HkuHLvy5rg7r7Zw09DKxM1wfQAPVR5JRp+BORAMmbs2HbwsP
	I0gkLfDaWVtNl/PTQtalCjWJ41lyAAXkAzohwNFAJPXddkNQcA763/zNwitSLnQOEsEsvSyMrjO
	xaKrcKrHWnqSYcT9Jq/ORDYO+JPGYnoynFoWli/f3VRdKIqE0uoJoaa5hXMBwJyDWUKTMHLiCQn
	xHs1Orlq5RpVJYJbINCipBfcSI4FiqB4myuQgdZUkP9jQiX7KztxFA7GCOygKrVsOmdBa7VoZ6i
	c4Y
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr15992379a91.21.1788598397524;
        Sat, 05 Sep 2026 01:53:17 -0700 (PDT)
Received: from Default ([2409:40f4:101a:e710:d0dc:4c0c:d338:73ae])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm11404796c88.14.2026.09.05.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:53:17 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: oneukum@suse.com
Cc: jeffinphilip14@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+0b8bff5929865345b29e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [input?] KASAN: slab-use-after-free Read in k90_record_led_work
Date: Sat,  5 Sep 2026 14:22:46 +0530
Message-ID: <20260905085246.11121-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c79e754b-2ef4-49f2-8bb4-60b36ab9a36d@suse.com>
References: <c79e754b-2ef4-49f2-8bb4-60b36ab9a36d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 14:09:35 +0200, Oliver Neukum wrote:
>On 31.08.26 07:46, Jeffin Philip wrote:
>
>> I believe there is a patch for this already[1], but it has not been merged
>> yet. Was written just as the merge window for v7.3 opened, so might have
>> been the reason for not being merged.
>> 
>> [1]: https://lore.kernel.org/all/20260817072831.139954-1-ccc194101@163.com/
>
>Looking at this patch the following sequence seems possible:
>
>CPU A				CPU B
>
>enter k90_brightness_set()
>
>if (led->removed) [FALSE]
>				Enter k90_cleanup_backlight()
>				drvdata->backlight->removed = true; [TOO LATE]
>				cancel_work_sync(&drvdata->backlight->work); [NOP]
>schedule_work(&led->work); [THIS IS BAD]
>
>Just cancelling the work is not enough.

Hmm, we are in cleanup path, so wouldn't it be more sensible to use disable_work_sync
rather than cancel_work_sync to prevent this kind of issue?

Thanks,
Jeffin.
