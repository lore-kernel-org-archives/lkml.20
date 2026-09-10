Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18D383305
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021997; cv=none; b=eP5eQpWG5jp4Axuastk5SQukQh6aBOrwxpjyQUa60zqdmtMQS4MiYPBXrVYEmHFmpFWeZ+zDEF/81xGDqwl2CPl7D/XEe/xW1X5ol4cZ+I8ivImd6+r+nEtZHn9TdsxGmF3n4ztQ0mJ+ZzLB61XR0FgJRxSsM17K4uloFXzAIAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021997; c=relaxed/simple;
	bh=2U6dsNXbwUcpneCJm07af3HnxI6Pr5ui3nXbOFVFIFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWdLUJS1aRRU6WALnC5jJOTUv8FNjcMhJcHGt/z41k8jTlRPP9cnqjLyHOi1sc3iYle4rRvKqwFShXYeifaVW8dfWmQDCt39QaqWPZ3Q6B/uFXarcKupPXAbMWRZSJFrHj5RC6++GP7BnWUhoZ+0O+G+EBGkCCA72C1v08Pc4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEr08HZT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEr08HZT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so10204865e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021994; x=1789626794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDFW7V2b4G6mFPAVAKgZGZP/Dvd2Tg0+0VQwRHhDTAY=;
        b=rEr08HZTGAs6jr6Yo8PdviNvR86fNPY7Ir+6MEAO3YpZs7YLUFSh6TXUuslzYZ9eDU
         lkzkQ4Y4A+V0puDtyyA9y3qO5oRJB3x//77dq+1yUeoEaEYn4LCv4wsfffS/KX0mTLRV
         OmHnamKYsKD60+CFcgEYtDYxoHvJmsFpiImugZmqeI7T8kmISaIZkUzqF5ExeWscnHuA
         U4WCoV/5XF218phxmmdj8XIs7TWWzPqE/3YgxLF71TfBfrSi/Ea35xdawCDf1OsMRrZa
         b9rEDCf8Xq/+CWmHHJwfQCQaTXHl6O+M5wUIR+dP0Jyfkcr2ms0vJ1LWHJwkT3IQP7hs
         OzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021994; x=1789626794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDFW7V2b4G6mFPAVAKgZGZP/Dvd2Tg0+0VQwRHhDTAY=;
        b=skR5Tr1zjCqfAdjT2SXmr8PDmK7GUsCycPGEgrWSt6Mw2YeGV2psCI/GEHasNVKFlZ
         YOrXJ5M3zY3+QCp1NpvAT3xSP/W/aFMeuGyw8/05e2t9eGT18FBF2HLjVKNJR9MVs0+g
         0Jf8sJheTz44odf3aVSjH0IC/vFJyzLQvNxEGf5UlSbsHcJ5+mhJax67WMbGR9Yy+2Pc
         bUxsBT+EFO1gU1O0t9jgWA9JLDUC0CrU4tUhva0V4dOhZLTyDgG+gnxAiKLMoCfB+600
         lVZOzxGBJW7/42Fvd4QNlN93QhXeE+l21wmksX+qOIKzK9yy+UMffSzivGRkJ7JLwyhG
         oRYw==
X-Forwarded-Encrypted: i=1; AKwUvBwg+gES0BdZmXpJ4h8IqYOWyWOvnsToqRUjqHOpFDk/jQ6J1kWhBRGS/4gFgcLPefgFXvSoTfYxwucVSC4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmZ6jLfx5U4aLxf9C4IoiP9UBRmKMwpwneYIhmiPpU3vSYIlDU
	totqWwEMPEiHryptCBSu1D6U6VmFh4dADbcbNdEwEgzK8xqnZ5bHiZod
X-Gm-Gg: AYBFou20OFjZB4KN8WfQ4cJd6YB8vXlNQAJoTmtxVyjfZoQ5aTTjR2MeudNgRuQrCK6
	Eid417iZt+5ITjrYTspRoM98zsgEx1EvwHPypFNAFaXnkCe1ehp9Bm6o7fKFEy4s2TVY8vwHBvM
	Yci5OxlUy5c5DqJEJ6a2QbqYmFP5b+uXjQDpimwzuI6RKR2tpZk8isLRVXdVLBqZdX8A5tdQfTn
	AjOwQWn63SpXp3HK5/K6viw7c/eNa/wuutnsqvkx+0QJo/KxDscM0yfkKqe0Z3hOnwRpFQ4fj1O
	tS3cPVH585Vb3lh09v1HNuFAAxQMwdj2jZaEN8wjJ3pXARuOp/lC0vGbmkptACZH5l0VbsayFUM
	EQk84cWfLGU7hCvtdR7ICGvMQ7ogChIsAzdeuJWc7SNL//kPlj/45mr7PtOJ/+sczCmVpsfdwtP
	hnHWf2mFgmeijj0YLW0g4LwCpJ2VTOWcqrfP820WGpOSk/zM2yl8a3HecgE+yeZlceYGK/vOrkq
	xpmkkiEnTzKel7iQDngosy4t+wRfv+k8/mVi2dDWlIk
X-Received: by 2002:a05:600c:c491:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49d1f368530mr141585555e9.13.1789021993977;
        Wed, 09 Sep 2026 23:33:13 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm48238165e9.2.2026.09.09.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:33:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org
Subject: Re: [PATCH] HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11
Date: Thu, 10 Sep 2026 08:33:03 +0200
Message-ID: <178902198348.4611.5427384880711199776@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <202609100719.bu2saXPQ-lkp@intel.com>
References: <202609100719.bu2saXPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 07:48:31 +0800
kernel test robot <lkp@intel.com> wrote:

> >> drivers/hid/hid-lenovo.c:523:7: error: use of undeclared identifier 'I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD'  

Correct, and my mistake: this patch was one half of a two-patch change
and I posted only the half that uses the identifier.  The #define is
added by the i2c-hid quirk patch, which never made it to the list.

Both are now posted together, in the right order, as v2:

  https://lore.kernel.org/all/20260910063051.4556-1-okerixx@gmail.com/

pw-bot: superseded

Thanks,
Oleg
