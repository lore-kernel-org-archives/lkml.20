Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B953361957
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854525; cv=none; b=GJA/j2sCXO0Ni4cQzOALlTcTT+k3yNnUG56nC+UYo62jFJIrtKFUoZOXWXKjlJtca/fvfPXjcZfs8Q99N4uXLd/f+/HVjmPbteTkUtDN5jvxQek473RrdILUNlx/AIm6n1eNzVg2iPYEQOblhaWVP9kE0Jkz4FfkIs5LXX1npfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854525; c=relaxed/simple;
	bh=RBsNvOQrVxRHUyjRqfTfJUZhqdTeMeE1bFwzjn1jGV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0eAwles8t8dS3uNbWDeh0JDBbgmzyp7YHWGLH737PmIgxqZwz6w+YlmttmIFkI2MW2KaUtoqfLOydWI6Hx2eFqhP+SdK+H5edkGJsrd9XVWHQacEmKOl8Mvfgq+er9tQJB2thLd5kFQW59k5A8c/iizmSmuzuY3o9DKmhsahZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+k4ivX2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+k4ivX2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso912705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854522; x=1788459322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBsNvOQrVxRHUyjRqfTfJUZhqdTeMeE1bFwzjn1jGV8=;
        b=N+k4ivX2dm2WVdNFpOg5OzOjPPK0oj5zSRthgrFbCc3FK7Q4UcvEHQNlOHKLmHA5Eb
         xZ+otv25WsMDEB95eynSKvQP2xSTDjbUJPCoB5VK6BZmiQY1L6c20jsaBuu7xtH/tQAU
         o0YAO+i4f6hFEPFYxW0QMv56Ketd++plxB/gta8BBoRElJzhZfIalcnfRMc2pchoXX0z
         DIC9OeMUS9DFS/e++Bj2e+Ly95jfWnySomwRjcmWhwWfzWoKzHL+n7TQS+PIYlWLxRaP
         ER4dmh9kZBjHY++yVpZKjlR/myM20aX0feaAUa0ALWIjYqWPGvv09Q1VovUQ5FZ0k/43
         Cxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854522; x=1788459322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBsNvOQrVxRHUyjRqfTfJUZhqdTeMeE1bFwzjn1jGV8=;
        b=Y8RjeVnVNqFrD3eEvjRR7CazgQCZT12CcUCQsmhRhE5D3yyR56ylo/IHgM7xphkl+8
         xp+8KSHrgREN3rfD2MRz9zCIbxtWJIT2x0u3FaKnWpCkwdMgLrivweTZSmIoIPgvIArO
         oeDteM9KvayqSOwQwlM1B/hwc+RQOtNFGsolto7xM0Zt95nQJIaxn3pg5ZJvCIof7nDb
         ksCVPqyAxSHiCeybV1voYvz3NXWTEXzc6oCXx+zS3hHuXhWmdKTi0+F/DZj6Ij3psYpH
         DO7s8ZCWGu2D2eZf8ZQ1Cdg/SBfRqOpi5o1zpjwQoBGrG9Om+WUkZ9nmOun1D8o14hbg
         GxUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNl6p6Z3tO4A6n/yk0zZHUjOCWxfodWv0SGXCqDOmywF/nSqrBzbPmx3WsFmsY1l3s7QkCudjBHmW7098=@vger.kernel.org
X-Gm-Message-State: AFuF++kXUp9gHo2vWiIodSCEEjhkw2VHMfsEio7IF0WS2rEQSeDKPJ77
	tmk+upzDzvz7LhOid3FZcHKmLOSYYtWNk1qjE5amSt4RrmJFVhv8gKyT
X-Gm-Gg: AR+sD101ld7ByKBF3h+Qm1V8KRRFNWuy63PKZufeQ46O3B/ERZQyD+zsUXUp9n3wyBD
	PS2ORoKFMsrCLHqcBS/QDz/hTJWgu0OaVrIZFGwSje500q0HDi8+HkCdoupF8Mm1rdUcDHtf6hq
	AZjGaiqz9aTDkBOl0FnId+vUoWaKbdwrs6TTvdn3KflA6p41/yR7f3pRdXWiNkmOCRGXrnFId0s
	W3OhxmCC2eW2F0fXJWzG2R9OIEptNNFRRqty4jEAcEVl0FGZauP57GMw4ZZFBE6EOfwCSTSCdE+
	NnR5zcOZsym3FEPZ1he62U+ydUET7D+025JXaHkf+5cC+qy2ygIeTQZRlgOLE4vyiLlpw2uc+WM
	qpVvWT95olgoFireKXvCU8FtbqzwJzt11pQfswoxXb2WumbzWXouvCZoT0eXzWNZAlRuT5WgWi1
	Sp+55cuScIiZdpodTGzjLk00LSNrpr96MTht9trEdLXYronVTK4D0azbHLnzVpymXjUb7EoAC1+
	byCuaZCn85nivoCmywDMh/VWVTV3P9inHC/RbgSiKAf
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b91a67d36mr12068965e9.6.1787854522377;
        Thu, 27 Aug 2026 11:15:22 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm5825985e9.0.2026.08.27.11.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:15:21 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 2/2] Input: drv260x: Map ACPI enable GPIO
Date: Thu, 27 Aug 2026 20:15:19 +0200
Message-ID: <20260827181519.2426159-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAXfjxVv8e-yxJ7@google.com>
References: <apAXfjxVv8e-yxJ7@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed, thank you. I am withdrawing this generic-driver patch.

The enable-GPIO mappings are now supplied by Yoga Book board software nodes
in the platform/x86 v2 series. That series also carries the supporting fix
which attaches GPIO-provider secondary software nodes to the matching
gpio_device.

Maurizio
