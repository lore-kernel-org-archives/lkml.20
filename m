Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B5374178
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487372; cv=none; b=lOK0lOEnAJDhY5tvJOpHbD1ffgHZ4O5yR+lDo7Tq9BhNSm9NkplI7vUBzALbN+X7gt2onrmJtOkOTiuHHIGMPBQ5MgkH2XykHhNkJmBADKCWdf9eo9FpfZTeiW3dMoVf3ykrCYlLp7pMg/kvVLMHwT3A673PnhOVp8XwYFAxxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487372; c=relaxed/simple;
	bh=34Z8DPG6Kp1PMhLkp+d1BQuCa8F7adfXlCWa4tGzx7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBZIecZhWgtI4xCeSxLHS9rkpRhAcKgyAyWEA1uLN6W1AeiL/rNRkYQ4Z8Ki3lzbqxIGMDrNCDH8fiesgCdWrB2k8IBDTe/qaDeJTIrXWOUo8jpd05zONrdZy7N6p8ikD0MMZEKlNsjZ15Rw9FZTBhEOlh0rtSI0nPBefoXFdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTY7jrO+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTY7jrO+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so5670675ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788487368; x=1789092168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34Z8DPG6Kp1PMhLkp+d1BQuCa8F7adfXlCWa4tGzx7o=;
        b=LTY7jrO+vAtZxmCQ/C3ElmbukHQTIoTnnF7+J9gmgB7AFCx6FqwTZFWEltbwc4IS5E
         P+zrfqDAD/e0TZj4bde38JQZ3ZJhw0kd+RXDFKAOo9huVWVPUD5sd8Xw/kE/Dg+tJE6y
         6ITzhAVUiWUJAAZHltlM80hqggESApEP7jeVpUML64L64YPc3aRMM0HbjU8HsQo1cS9e
         6qfgP5EboopO9uIrg9C11mgn32S1NBf4cLrKp+5QWM3j/O2iR70NabmgDLXUsHxZ2MY+
         D/NAOX40ra24+SNevUFSkDNiA5YFcy/68WNizwLYHbv1xewOvLBr9GRFFUhW9QY3rg6l
         juHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487368; x=1789092168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=34Z8DPG6Kp1PMhLkp+d1BQuCa8F7adfXlCWa4tGzx7o=;
        b=PbuNSeHQz1UXna0ZZ3QrH0ptyt9Y2al5saK9M3RH4vQRo8OLs+2LKK6H/zMtu7blzg
         1MeGYRGV2D7ieP8v4QVvXNKsRddxI+sCijoBAAdhFY5Fl67vO1fmfETEhJCwPvXIuiHe
         gQwlgTV3EllQEgLwGnabgGaqnHblWB+hteToC0kN9czzXdRCbEq+lPi3LaCCAYKz4VkL
         gf9RPl6Tm1RhischkxhEUiE2eFi506rNtkpYlLRcYSObilPShGu+E9s2117O0eCnVWKG
         b17F9LukdGJw6qiCuyFXglgDdOrQ46WWTD7yYo4NObNXcqF5NVr1QPhLJ+PiTrG9FAFq
         qK/A==
X-Forwarded-Encrypted: i=1; AKwUvBx9lDHrYDPP7hieDXCq8YD416psBQP8oGcKlFcvWuLH/WZ5AimEthrXSJvVLOcuk4+dSU08nQY5oE+v9fE=@vger.kernel.org
X-Gm-Message-State: AFuF++npIcx/BVfXNDZFl98Ndf7RSLHUkd/ImAEEJUIuMEMuUHmzI4XE
	xJSZISseR5hG0SsZ0ScKxlmEx1F6qdrOq815wZnjuMMKVl0LLimU3SBH
X-Gm-Gg: AYBFou0RUngYdDfAWVHSpDbyqK+Zuh7Kt3lOQ+fs6aXj86HykJ4lCgdt1/abXBIE8J6
	SLlvR2+F8VedjI5tzP+3ovu8syegs0Aq3SXwx6KpxfAn0TiVPOAlM58DMvuAamJwp5zN+Vft6NH
	LpNNePK2G8sBBOs1/fdGOey5Tv1uAZ9Qhh3ziDY7WLEJatnn8W0iJXAf0alBFWTRFpjh2tSD60H
	ihJUX+tUr5nriOov0CNXI9qWJowZRJeTPiiIcBckPdp0HFi8XI3yUQ37nRRsbba37yXCedHln8N
	8oe8EkuqL3NZYCUYixK23qYZVUsfB7O556ceGlcYsJ66ykl0jvoRE1R/QXq26st/HlflOaJNaxd
	47jXZ20jCxL6kzgCj+T57Yzuapvd77iG5APZRVOl6j7qijerk1Rt1g59I7fWIVG9sw0HBury84w
	1c/Zqj9V75I9VH+bhMsLKleOj/SX91bC1r0mykfP/+tN/8h4wUSteMSGsz9kG5cJYQl0dkg0c/G
	cApHf6s1ZD+M52PmhryFDqkl7yE5cW2ZY4bX8MslBfuIyh5gTw5TdQL2AO9cZIt0s3WnAcz
X-Received: by 2002:a17:903:8d0:b0:2d6:fddf:a890 with SMTP id d9443c01a7336-2dafaf31cedmr99763755ad.6.1788487368267;
        Thu, 03 Sep 2026 19:02:48 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm2983195ad.25.2026.09.03.19.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:02:47 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: killertofu@gmail.com
Cc: 98lawweijie@gmail.com,
	bentiss@kernel.org,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ping.cheng@wacom.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
Date: Fri,  4 Sep 2026 10:02:35 +0800
Message-ID: <20260904020235.8227-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANRwn3RFVDy+y-fpLkb1mfjiKyQgp1Jg0tyBTO+G0xem2s1jkQ@mail.gmail.com>
References: <CANRwn3RFVDy+y-fpLkb1mfjiKyQgp1Jg0tyBTO+G0xem2s1jkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


On Thu, Sep 3, 2026 at 3:36 PM Jason Gerecke <killertofu@gmail.com> wrote:
>
> I'm still finding the above paragraph kinda hard to understand. What
> do you think of something like the following instead?

Your version is definitely easier to understand. I'm good with it!

> Other than the above language issue:
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com

Thanks. Should I submit a v4 patch with your "Reviewed-by" and the
updated language, or is leaving it as-is (here) just fine?

Regards,
Wei Jie
