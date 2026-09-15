Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0631A44BCB4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501471; cv=none; b=oG4AV4ozvNKGoWBvClHeUI1uZNyH20xMpbPyPqcCPS6JhLhDrqEvJx8xRSbtvjdRAc90GLuCXMVmYLX4HtIdPi+810G0Y1zTWEj3Td39Fk6IXG3/m2uE67287Z/OiBcF8zJ+OKcXrt0uAnXQaAB0ZMxU6vww7lNBHhf31DSAKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501471; c=relaxed/simple;
	bh=urDHZl8WwDf2LHgRSrUhtMBRlsSjHVTZIirmLX8Q1zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYyZeBjikApQLIGyiK1cOKhwPbOeBPT3Tlswmmm9TCwJT9l0M4Sfo3ljXKvoumtwLzDnh8iFBST6LdtbBcuu/ic1a4Q0hKAqi0KB63sU3y2nvpPNFD/Fb1eRO9kfkRVn+UeTEdLLZAA6MoEkMUYfJBecI35Ff7mprChHmGJf9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+5ReGLS; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+5ReGLS"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155fdso50693241.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501468; x=1790106268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=urDHZl8WwDf2LHgRSrUhtMBRlsSjHVTZIirmLX8Q1zM=;
        b=N+5ReGLSd938RPHUWoSZViAsymxZQKNGC5K7+7+uVDKFPGgHQHBAAxNT8UxWUvFnfy
         sgCMXmhnB7eJ+pxTqDyF1wMjKDDCGwkbBsh60IqzJxBQezxXGHNw6tLAhsJPa3rc1Uqq
         EEUxPYopsQX+HI2B6IGC7wmk0j+bQ8UUYhO8KvIvgdz1A1W/HW0UDPBRtOrGG0K6Hm1D
         okGAV+8pOOTpOUqybj/5tRWqYv7TthnOVos+WV61Z//YDsDkfTINxwLeiSwCaW7YRfc1
         OiGcsG+UW2XCQ+2nwGzhOGUwzXDOpBKfYsnCKU8IJzgUS4FZdQEdCUuO9bOmEyySFc3q
         4HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501468; x=1790106268;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urDHZl8WwDf2LHgRSrUhtMBRlsSjHVTZIirmLX8Q1zM=;
        b=acbxu/1U2lYzocTPW7XA8CAFqk3Lty+XOuMEqC2zxJ4WCq3rbGYWtlWO6xO8DZZwSv
         hXzr8z4DBTlJlQqlxRfrlRDZy8RxmHEg4EyY/4Iy9L3+rBMHm1vguMpl81H+AwUKjj2h
         9iUuj7UnSoi1bXSk2mWB7sHzmTBkH8rZetR7SxH/4ZWaU5gYaMZ89s/irWpCMuLLU3D0
         t7qYas84nYbkbmVTUEuDI4RcPoIL3Mbu1OkYUjZKSmoMI3o/HG73A0fmu7TqQK4U1o8K
         UUjv1rc9Bez0yUsil2eFHTE0VV7JJM72tCRz4aDnXwrkyvaHi3idP+L/HLpRDf9Vl9/J
         fOlg==
X-Forwarded-Encrypted: i=1; AKwUvByJdKvcazeF1RFnfZFe89buvBFgQwrrxEOTHLyR1E21Tv9hAMkL352YH7fYxYM1wuTVd6E6ksOmcN2AYqU=@vger.kernel.org
X-Gm-Message-State: AFuF++k4sKwfotIALFlOBRx9xCZSuHC+azmLe/lq2DJaSv3Qv8ndUPuF
	5eGyh9JjvERFKgs0QeOngcQHO431YMqVQEUsQTSI4wO8Fabz1ZBvVTtZ
X-Gm-Gg: AYBFou0lj5XQDJcBnroh20kwzr1DscjP6UuyLekhnHskKSdVMtBt/OT//Q4F/a+vitP
	8ULGQcMVYWpLnwg5cYJLvZ/F3rIFVugjU7UmiHY9T2ZnXPx2zTPLdtNUCw+8Ds46nk5GAjBkKUR
	cXL3mbkrCWkYz8jTQOaJPrtN5ybxpyDyY5K9WIN3tqCihgIA+iJj0qec47aZddfN2fqjwITq2bz
	V8uqppDeHmLAqkZcj/CCrRT6Fx0iB70qwtH0KMJQdrcvRFz/9JfrCWGmkphCGJk2ahjwbqNmMbC
	ifOd5oV8QuCi5em3on5+U7upnnyoPm0D3lpIviIWfFCOZElt5jMO/LLG/VWlhDBV6AxahNDoced
	qTzgQ20+H8X3SQUertolDN6fQEG6kS95HRMLzb/YgqnyfuD73njZi29uS4SXRCa3wU72RXLK1yX
	VDpMhoMnsVQn7tsWehWGfysFeSyXXpKlWlqsJGXkhg0cyiK4kbsBWJgWuwUx23BeYW
X-Received: by 2002:a05:6102:956:b0:79b:b696:d625 with SMTP id ada2fe7eead31-7a0250c0fe7mr1440137.2.1789501468421;
        Tue, 15 Sep 2026 12:44:28 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98314dd7ceasm498589241.1.2026.09.15.12.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:44:27 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] nilfs2: fix checkpoint root lifetime on sysfs errors
Date: Tue, 15 Sep 2026 16:44:13 -0300
Message-ID: <20260915194413.3314842-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915041206.2430937-1-qwe.aldo@gmail.com>
References: <20260915041206.2430937-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

You're right, the extra mutex is unnecessary. I checked and all
callers of ns_cptree_lock are in process context, so converting it
to a mutex is safe. nilfs_put_root() can then use
refcount_dec_and_mutex_lock() instead of refcount_dec_and_lock().

I'll send a v2 that replaces the spinlock with a mutex rather than
adding a second lock.

Thanks for the review,
Aldo
