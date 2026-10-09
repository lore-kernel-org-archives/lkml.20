Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450741A92D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535464; cv=none; b=IrgksclhbtVE3HbGmWtigbJry4lWor4Ue4el71LqLlcCeO9TCJI4nk2ef32u1J3RTE73TVE4re5GE0b1C1jIru9ShXhnsQBZOBL6aL0AKZs5wHrV+H7RBwyPEQRSK9o5YTPlQIHtZhYNgKLudQBCu16jTbHaneCLm7tFI+a/GhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535464; c=relaxed/simple;
	bh=Ynd2/iYhnHg9LdFpo2/wM0uFXELOfDTv+ihIyOe0vJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZU8a9Iffv19Qh9NtXunlGqpVKLegIx0AMhpgRf4b+sCGvTte9tKsD6KKvzXr5/G2bdZzXuDNBVJbdG1MoVN7Xs1PNIfljZ9vMN5M9ATcGSyUTcmNxMyCZ5WB8DvjK4+rIJOcljYYlAvgkZCFFH7QUPS9VSl8+zMvH5olaomn7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/QFtr5h; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/QFtr5h"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8690079f2c1so2217491b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791535462; x=1792140262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ynd2/iYhnHg9LdFpo2/wM0uFXELOfDTv+ihIyOe0vJ8=;
        b=o/QFtr5hzpRNhdU7jfTRE6TDWCvMloJcPY3dvqV2T2X2+Iquob2qfsd8M9gYt4p8B3
         Tf7Aksr+HoUqd/0w/hrs5ZOEpfSVKrSXCgf+kvsBxxKAv8BrzpLZlFrDfnQ0X9Oxx6pM
         WCEDhMxRDEBaB8Ud7hX4qbHbgyfwcD8QEqE7TRDcWBQm/LSfSw3W/zL+VabP0T8zF2E/
         GFFTsyeUkRc/kzZdBW2MKHT/d39xtsc9lLP7MJ6l+mt9cbGco94NK396uMgbO+AxJ5m3
         fap1sULta3vfTasSCAfM1EIsXQlvgZVNHLeAty1lzp6Qb9M1kRjvSXkKxJPzr3NG0M3b
         Bqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535462; x=1792140262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ynd2/iYhnHg9LdFpo2/wM0uFXELOfDTv+ihIyOe0vJ8=;
        b=rgjvSKshy+SxBPoXSvH+dCpZCMr5GecZFwilkbXLqTJtq69R0b3ottiEAWUE70hXSB
         Pyd09L8GgM3qusLmI+s3ATU2PuMUyumPZklIBxEkn5C9nQK+aMRXjVdSDUq4Zu7k9A7r
         5JWo+FgcH+ObTJtWFUTrbqzC22A4xzxulGxCfCrnU0InvRi5dc6SpN2ahsFAR39hKYp5
         /ifusc9mPxtqhJ+TA9zFvx2hYcFt31a3c19p7xMwjZYUceL3/IE9F6TvIpcqdhuVYuNW
         hkotm9Lk6EuJWRLd6UruVkGbODD1vVxY8uCobRyvcKA2pLppd22pkIwOJtz9+dceRPG6
         MPWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJs1X2iPQXmwpzaGla96sv8foItNyVbTrsp5ljeQvY0M0lP4HtDPFel29m9Hb6VyDiEiCo/uX291IUHyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8iQFgWT0ZR1TSMlUO8WkadeR0L6kKMQiLhRTU/vgahUzpjK7R
	stF8zL6Orc9eDlWZBmpWP8siyXb5QWuhIy309H7mpExzdFqPi6jj2SmzwwmHpxv6+jA=
X-Gm-Gg: AYBFou1zcQCABUpkN9vfAFjZRnEklwmQos7I5xEjd6+myV5lGCP5U2wAZFYJbHBP29p
	PR+rLFOjHtWDlMw2Vun/R7k7p5jOwUwsbpb26824MYcfwCP4MHzEU58ovbrussDKVcaEAcFZgRI
	83HbDeGmPAhECdUGTXoKLn4IQra7i+vcGTnGK1fviQEyawHS9IV1mxmlavLwwLmjjIgzbN+KYP5
	z4NUm/dO9xBbgr9Izayvuaq/ZyBL614E5GmVWhCi155qhRowKgmcBUvnzyB7SG10P58+fR+xkx4
	9wNc+DM0GmuBlRD7eXRdDEyvBZ66d2H4lqz6HiLh6r6tubBO6GVcUjKYQv2TtzV1HuxSGJ5MY3O
	29wd4Ppg/pI1JHnh2rE4CjZUcQQVOxA4tAFKloa0jMRhQ7lVvQVXxsIMLOYrmoLHyN9py2WYo3H
	SUvaQSj9FXt6aMjvg7WTActEgFErVi7Mpm7+GP0Zbbvp78IL0GZHahufnRypjqg4uR1yCWtTbH0
	RMC46VSvVBLD8L6dgqGklQGAjRJXwJmLO4=
X-Received: by 2002:a05:6a00:6ca1:b0:882:905d:aa05 with SMTP id d2e1a72fcca58-897c7ec1e93mr990174b3a.50.1791535461838;
        Fri, 09 Oct 2026 01:44:21 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ec7c82sm610867b3a.35.2026.10.09.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:44:20 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: chao@kernel.org
Cc: jaegeuk@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH] f2fs: avoid cache writeback busy loop with zero thresholds
Date: Fri,  9 Oct 2026 16:44:13 +0800
Message-ID: <20261009084413.3478653-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <29c03ab9-fdf8-4e45-8432-84690e656157@kernel.org>
References: <20261009035354.3330915-1-qiwenjie@xiaomi.com> <29c03ab9-fdf8-4e45-8432-84690e656157@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chao,

On Fri, Oct 9, 2026, Chao Yu wrote:
> Thanks for the fix, do you mind I fold this into original patch? as it
> is still in dev-test.

Yes, please fold it into the original patch.

Best regards,
Wenjie
