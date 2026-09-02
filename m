Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3F233954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319578; cv=none; b=sOKvh6PqTL2ualSCZpyj781tSDwayCy+Kp/qjQcv0JlsTavZjtk7Izcy/tzB0fJEovqCIxfQPMyhivG0Wiuny1NBOn9+ou0CQHDP6md+pBEG6VATmGJe7dytUbIytj1hBRNoAbfwiegbVO2dST87Mr4/mZuVRsBAo7a3HoFJMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319578; c=relaxed/simple;
	bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEvUimN7zitl1x+DFURU07X4tfJPl96GhmRsEE+fsY1q4co5uz2TOUtsV5pXNzhIoVnHHbZwPJXVNbatuBOmXZobxEB2/ddcUDEo4usGe+h6Bu0vJlSvKNWrVzVKdLBLEaFpndcv1Ve5cvblUXQKirx8KUk2x4leQ3BCkdQsnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1AM+Adg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1AM+Adg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39927410578so1068779a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319575; x=1788924375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=q1AM+AdgAm2WTqyxOL0FYpLLgDluAGsO/aLIRO0XSegIdA51LDfE1DNxJHWgbDqou3
         T1Ar53/k8jyUUaQcoUBFECVqxa1OiwSTu5ltToEo2m/EV3vx2Fynfu3QhXlbp2ZLyaxN
         MV2t0Xk0xNjNbPj6hHRtoiCXSLw8rdf8c9gLOpoAETPcaoZkyiPaDzuYvacie0UsO7Gs
         yIBVXa71daJ6XFd60zfR0xmPF+geI9puz6yUDdpzN4kWpwYlwxvy05LnC5AGQZ1QxXby
         bsfNrvU6Pho6LKEWVZJyVnHP6WcaZB6QXro1lOn7No3tLjVFlAj7R8Uz+n6dmf9siwN+
         xdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319575; x=1788924375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=CKlxQZdZXrhnqRFRe5bsaNvPF9n37g1DLScNPvInFxrH7jhEJuxbEyny4zYUVz7H+H
         +cWPIhTQj7hERAZxjW4E9saNF6dsSj3OpbqFBRrgdlqj5DZpZoAJGlXw/rhzSjL+NmSm
         MREIpqdaPwWJz7Qh2BgUHYsTlo0xXlY/qzxdFZR0y1lyl8Aq1vSxQMkgux8+OjEnPfdv
         d8Qqa3rQRet81fZ7AjmHY79fOELG+5xNmZ+CDNxczEH/iX1oLuXhxi8z81JFhgLgikCz
         mQrZVeYKmyXpPvX5D/Iy+UtXP46PHlYzCQzoC/tHTlet9ir+KUXqlGvXS+vDwDA2yADp
         7CjQ==
X-Forwarded-Encrypted: i=1; AKwUvBysJVo7fzWnZ7z3sQp/f2LHJtcDsv3Z/Llyw+L5XFTl+i+I54SP9HUp7AZNHduDY1fdTqysXb0N0aWGW04=@vger.kernel.org
X-Gm-Message-State: AFuF++khFZ0+vwb7rtE/vVoQS/rQpeCPyiX01ynXcJNSjcDoyIADZLqY
	apuDJDd6Hu4cyIRbQMSmyJOvJ+Y/TiY9i8CiKkhcXkey8KShum49+OXF
X-Gm-Gg: AYBFou1uNjFrsnqyAgvTr95IMpZxaV588DJJuENUgwFuzbJ7iJIwcbwqbuWK6mIorqo
	9RVsJWzRgJqzOLajmhRBgpCuAPCPvlAyxV2O32n8yHo4Zdnvy8YtGk1uOtjOT6nw4DO6FvqHpjp
	2FHck0kYNyK24RNya9cLTHuqFWMo02jlP0bvUOWvYIDVvnX570oLcEp7ZaeO6QldevWUkrYimIT
	c5dNmVX9dWyh0UHAmWJojD6m0RPjx7ZHXdgCD/36P+rLqQCA5DMVHpCYaPL66gT2txiRsCkw7pW
	MNVPU0/nq8la2T6NCuk5OBZP9xqS9WDwK2lQKhjnK/lfSHigdalOMi8/P1KsWLj0CsiOQjOkrJ/
	oAkWpGvxbwHqmWZxo5wTFef8yfQnNpgDd0BHx6+eUqdVgT4rkHu9wbfnqA21dkEKdh5jVzAXU51
	Pnabn3aYwsWq/RjvguEaWaKIsv4EXofeOKuoXSpPJ+qFAVYV15EBpwd/3ZVKUloYINl8ieUEEHd
	ohrvtdd7g/2hPSR2Rf5wwYZaxFTV1Yd058=
X-Received: by 2002:a17:90b:4a8e:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-39aedcfc81bmr2701816a91.0.1788319575125;
        Tue, 01 Sep 2026 20:26:15 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d7a9sm2569843a91.12.2026.09.01.20.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:26:14 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: drop pending discard commands before reserving device alias
Date: Wed,  2 Sep 2026 11:26:07 +0800
Message-ID: <20260902032607.292561-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901201740.4040807-1-daeho43@gmail.com>
References: <20260901201740.4040807-1-daeho43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Wenjie Qi <qiwenjie@xiaomi.com>

Thanks,
Wenjie
