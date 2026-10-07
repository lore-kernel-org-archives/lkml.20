Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747A537A4AB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390681; cv=none; b=u4Ga69u7R6E76aVvKFOP1b6jzySMZOqboIBh5nAkueSR8CGjRSf26k8KazZXFkBBCx/IVv67WiPR2mYsjHx+f2U6+kcT/cTEa5nswTbtAHmob7uVT7O5Kyee13UEW2xeR6RgluXUoKZGtLtCZmzOVy13yyAeJnGHt1VjaBP+VVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390681; c=relaxed/simple;
	bh=m9N9r2XMeiiGqnOpn8nyCMQVI95vlWAuCvN525gATcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx2ndm2FJDxUEPRieCJjIAwoG//yVPi/2SQW/NxQZoO+qPji/7Kbc2oMZQ9CatclcPUUN8DH+w7Yyb5+MwtlqC32a3TSg9q+zXZ3eKOgdqhbXGCEQbcv88ZxFOLvWL8eD9TQ5AF6NVz6ht328f93GSFVJS4T17Uu/tx3gfZotks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpVt7JJP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpVt7JJP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6d28aa26cso21554235ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791390680; x=1791995480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9N9r2XMeiiGqnOpn8nyCMQVI95vlWAuCvN525gATcw=;
        b=kpVt7JJPYxtLQN+lkotXm/Sr09Boxg+BTmRnc5z52kiilE5+1F8eviHrC1B8nrHgzr
         xj/iAa/SfoXHJmctM/joWj+WjlIEY9RWFm7kFbyrPm0jwbK4R35FVd9QS2taR6kPmrEH
         7KsSMjvrcaBTr8g1+vGR8bKsXqoEBhqotiSbiKfAUT7DPnvhOR4nMgNT35nxzYWmKpen
         LExIeZ4aW5VE57U6p7DZPiSdzF1uz0NJqqhSNWEyJD4bNPUEzDssFk0nMcZX6WFlnqoQ
         uDKe1CAgLV9sdDroK/PwWw62aPNTO36O/xj9X5dyLFlNUu0PXzA+wDuUccbjL7m2+e6s
         N5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791390680; x=1791995480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9N9r2XMeiiGqnOpn8nyCMQVI95vlWAuCvN525gATcw=;
        b=dDgHOhPOhUco7Rd3lLrWFuSjh/mwC7OOR2KtZW7XsMN1IKAgIMTGmUp/RQRfsxf1Yn
         dCCgl65Z+0wqkrrWFL1vU/tSP5FvOrukGNuqn//miqjP60+bbOijc0yzmJWrP3kdJUE6
         OuVYYwprxwXn6d9X+CELMWOVOeN7F68rx/UVSM6ujPsuyNjV4Vo9oZpNIrW5cFHfCqov
         SdG4HfSxfgB3Y3vHLrTVCVh6Ucs1WS69xHN8QaqoiOsWMPNg4SKFppKVU5OcOx6Ns+h7
         w4v8sICQH+heXbjI/oRKO9qBHVJSVpi7AJR0GeYKYannHJYUM7w9YyMDhllGPz4zw0b1
         ftiA==
X-Forwarded-Encrypted: i=1; AKwUvBw2b8AI0JejLVIN9XqsyTzOxBB4fGxoVEDgizE1ZWKbrCEa01tYMKovxpTIaChfkLZ1hNnODtA+xDYcDJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYxGq5qHWoiwV4WGYQA0Xoa76QOdQca+jdy76IoS1TeWUTYK2e
	Sl0G6d5gdwhe2g9a1igzaizK9fFVJ7ewdv0btYJK4TLjbAVVobTbOIkB
X-Gm-Gg: AYBFou00QcmvjoLVzWGlAWifSPWEMTB4nCY2RStC+66BsoIhB91f72oLfJj0BLIHLI7
	l5rAQUqL54v/DSdGO8UTOPHESPBiwMJ6sGtW6H/yL+czceU8e7j6/RjkQAXhNdfp+Y8RwuU79uK
	MRK54mQHpLVRPMWiVdN8Lq1vDRTNktZhccR2ajaTCxFQ2HiZEZPjhFhWnZDgHHAyumuV+cL0aNA
	EIMvcc7yKJRNe79XefPsqRd+5xXix+JVxNYkS5dmqSu3zNMPyTWeFOJO81R5SGgMcOHsiOc4NiF
	+AYBv68c0Np6f5fZ/R9M1YDfKDvnpj4rq/iZIAglzIMn2Kq3nKC4H4oEVZKUNU3TKOtPzbo0lH5
	Fa9/sV2QcQFY0NktlderDQ5zTCfuZxL3Filrlweo5d3Mh+iFBVKBbJ2RxaeoIzce7mvBL08WuPE
	PzlFe6uScKM/8eS1M0jo5x1RVEVD8q1z0B61x/A5cWasg/7gY8DLCUvm3aPvc/0lYQuiNS+9gCx
	BxK+oHVMkQmeFJ6kZDR7i68zZTbCKH0pQ0=
X-Received: by 2002:a17:902:e94f:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2e600516db0mr24203205ad.34.1791390679699;
        Wed, 07 Oct 2026 09:31:19 -0700 (PDT)
Received: from nineveh.sos.local ([131.191.24.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604438545sm15267295ad.6.2026.10.07.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:31:18 -0700 (PDT)
From: Jeremy Bingham <jbingham@gmail.com>
To: ampr.mhd@gmail.com
Cc: brauner@kernel.org,
	djwong@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Bingham <jbingham@gmail.com>
Subject: Re: [PATCH] fs/iomap: document ret parameter of iomap_iter_continue
Date: Wed,  7 Oct 2026 09:31:13 -0700
Message-ID: <20261007163113.891271-1-jbingham@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006154005.232338-1-ampr.mhd@gmail.com>
References: <20261006154005.232338-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a useful documentation only change, and documenting what ret does
there seems useful. For whatever it's worth,

Reviewed-by: Jeremy Bingham <jbingham@gmail.com>
