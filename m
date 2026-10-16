Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB93264C4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153998; cv=none; b=a7suxRw6PuGliVpXcfaSZeNkuasHx44mVfWlcfofJIhomdU2DJao3JnFyEU/hkIoymsCCd/W0oU0/K+WGv67+LmZVQndNk+aOP8anUube4aQOjx4ojEQsAXUIYuT8158PH9fITDbCJYIjYfe2N55RWDjeJoaljKs77y61GdA3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153998; c=relaxed/simple;
	bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J558bPFwQpnT77Q86FBOWpUe3mwr4hFRtgSroNHl1J9Bnn2kJDg8N8bbcRuu7lPw2I7SA0R/rUkeYoJ2Jl3B6vSWAhcdPPFDpJ0Nko+WEp16o9Vmvs6UaxoI9DS+5QxKTN06rEN9IlWw9DCnmTSxfeoOQDb3fpMHXQAgCzqYPS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSy/hH91; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSy/hH91"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e915887d9dso26870245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153997; x=1792758797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
        b=ZSy/hH91lOD8gH7+KU1rvhxFa9B6PiBEpj4CcqRV7mCuw0Z0bmTw7JKRqgngdcM6NW
         1s1LIkD8rccyUkeWjkPxkpTC4KfYpLRKvZp0RsmPc3RbUUc5FxWwuFxvVpOYKtr/AL9q
         sZZq1PK/hBEQm/0BbnGGbCIQNvvh7X+7c8/UeV3SaKsYXFQYG38AHQsoG5rCVDR5CSZh
         zxnIdL3sz2MdF+xnXgOFGGLnJgPkTQsO6a1iFbFWjbQZEz/FsnW16Did0O64TtVxkMtO
         GNmpBAOlS5SEzk0vaLrk3xgfEasWPwGNPxfkZn+T3N6HH5Goj8gUGtd3MIAnpBA6nxi4
         69Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153997; x=1792758797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWOJ/i1ritxut7H9K0zmW+82TgFIVjw4t5vcoYvkAR8=;
        b=zlyHOR+HFQI9HPlfUbQCVNHiHsVs6bj4vLtXaV2QDizYCBEcbpp4ZRqkZiGOG6YffB
         IA5IKLoQOXB6a3o4bMUPnbsQpyMAupSberWNEUgucVTP1joFb9T3XSrkXywaC8+txveN
         /29NEkqGGJxe9dUv9fMiOxp5Y1aORh0Ad5zjIpNHWH1JwAsxptLDgyuVY1TkfbCzCsv7
         jYHnCu74op9xgfW9ZuT1QEu5IJgthnKySyE2SZ4UYIjAthit2Kk5JMgaxMQZVEZTMik+
         GeZw0KhzQ3H+1BvE8FsVG17b/rCkBT8b7MU2piy+pY6H0zaz94zfSlyFs5zvoIFEH/lM
         v0YA==
X-Forwarded-Encrypted: i=1; AKwUvBwZj54dI3Z1sz69L9CTIAIYwPOIaY/slf55RpHcGGbPXnXDtxM02JcVkkp2k+AWJwXvqPaHXvT8gxi9L1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCIiDXin/R2VgnYUeThi+Uc63KUzYO2N9YN0wwn+YT9UkIoggs
	mkZWjG99fg0EdaVBxFaUoPzzu23tsNM9zuOInw5TnIWP10fVcQEbKnvUdPS/GJetufo=
X-Gm-Gg: AYBFou20kaYs9mU6h2MjRqLt/d2gz0Z+wp6Xf5AVVuUrqdyCy3ixKsVYKO/aiPHYa5H
	bjbqKa9tb/zvKuzxzeE6MJiP5+Ef3PQxcnN3xVEFWCvaW/2tt2nPnhE4YY/xrnlPMX7yGLdbLm5
	iIWYVyj1+Zf1m9zfX5QvcqmJQRVp+6b4WtQ63/RRHduzCjHFRsfBZme3MgPatb+/RSC650IsG3F
	gTwguBBERQvWJ1lKV8pmAbaQIDFvTB8sIFZnyo0fbJXQguKJyqJ32yw0DUQ2RZpRS9sGRfDKkj/
	QOJscsx28CxBVJVn7sBCWT3Q4mRw8M+Qk4rrrikRg14nuscM8wk+rMVGpWin5qdnrLAr/IBIngL
	RfrC5GZnaRM7sTFFYS9+3lj/RN0XrhVZhZk7+E+1Q6AXbLAI47eynK/9BQxa2dfzqERGJg2KW5v
	cpVbGGUztuWMGGSK7NXwvIh8JoyFNlg1KoSu+Nnkbp39rkWAnV7VrHbxNVOdS2PmJDysY8
X-Received: by 2002:a17:903:476f:b0:2e7:94fb:262 with SMTP id d9443c01a7336-2e842ce2a76mr176597745ad.43.1792153996772;
        Fri, 16 Oct 2026 05:33:16 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d92sm9361255ad.19.2026.10.16.05.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:33:16 -0700 (PDT)
From: wyibo6109@gmail.com
To: Rob Herring <robh@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Fri, 16 Oct 2026 07:32:46 -0500
Message-ID: <20261016123255.1019102-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015201547.GA2868930-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Rob,

thanks for the review.

On 15/10/2026 15:15, Rob Herring wrote:
> Don't need '|'.

Dropped.

> Wrap lines at 80 char.

Rewrapped, everything now stays within 75 columns.

> As this goes under 'serial' nodes:
>
> serial {

Restored.

v5 follows as a reply to the v4 cover letter.

Best regards,
Yibo
