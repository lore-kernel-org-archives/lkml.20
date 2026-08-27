Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC536B061
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797675; cv=none; b=RW1WJMLJPHPAn39VIYIpAuP39lrkZsrII5xDk7JdPs2eXBd6o23R4nJOQgxpsBmwgMTnUUDJf1URfkaHRVpXXvbcGkcbyi7boyCyKnMe4VAil0aemcH3VXn58UhfazrfdvmDnSDnPb/cO0znR/3BohxEz0QqRr5yCJZY5qYgUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797675; c=relaxed/simple;
	bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZEc8w6crlGMy/YvisEb3Ra64S36zhyh4j5x06spfmleCA7CefPciPbwAY8hy10Sb5xDRFZINoxL+idYLQ22/V2uRhzhczoHHwxMdfxbMlnLDvPO+XXl7z53y+yBgHDbgebcKYsSQPAkYaX99f1qa9RHKmLRRfeftDwWE1fjWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvcBoqau; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvcBoqau"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2230402a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787797673; x=1788402473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=MvcBoqau9K0wjc1YlMLj634xM9enaV0SgI2MagRraVp3RAp8ltRbJ7IQt89X/iMi+L
         rAzTW2ar1QPLeUhx1Seg6mM5Tgs9LkfbaQ+rlGytWjCDMbGJoCaYh7rBbiEZ/7BSAzCk
         7QGKmEMJLPWCU7SAlCStjwqDk7nSK8eWPcTsV193yEmbKGm6AHQh6sGxxkygFX3whLAI
         Hx228xmo6P9HtorlbF44b2eTyhopypu14Y0jw0z2eeQOwvh6PQR8vHu4gwoqA7KpSmka
         sQc0bjF5dKJ58gPDJiERg4zkT9q0umFYJMXeUE5YUjYBZpaTWI5NpL7mBGmktyzLqRNo
         ni0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787797673; x=1788402473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=ZWqctcDnTkyvfwrPwC/OaBzk6GdhY683SEGLjA/5DzYbbIqzw2GUFwrvxKwh23BC+c
         LBD0pAwjo4bT0h1YmfzIj6dJlKMGVwUFQ6wra2uBpFKda5eF+t6t6lUzsJv/+h0CDI3N
         K4paqFUKHjJu61DmuOwh3/TDzWbaKM3jbj8QLoxgrj5+kghP1uQpLhBaYAs1VZ38dgyG
         kalwKs8IslKfLblpYWkTgpOhNxi8wkO+DmlReagqvrKgGEFVkG+zSiiwN/ytWiz8qcbl
         +DRtbE9P+VRbl/nx14HKxOamKWTM8EoSkHlXNC3UsK3uqOH5KgY5pxOO5HhD7ZEwG3SY
         EPKA==
X-Forwarded-Encrypted: i=1; AHgh+RqsMwL8uYOTGeik3QKtBwarMBLnFfSxCEkKxPryKHL6dXQoRnQXyflbyVpo4JYdQIJdPfk6fzHncZ8ipsY=@vger.kernel.org
X-Gm-Message-State: AFuF++kQhMOz7aRlt4mmzl42fgXdkvyRfgV0ttrRBZxESrmxuJG11G7M
	l1ZJe7bskOPVWgVqLnAcoRHV83Tx2J0qW8+IieD5yCV8RlVIYYl/ffoB
X-Gm-Gg: AR+sD11fjWf/cDKiA2s/tHG7EZIT6X9k6qcHPQpmHMNp+qAYyFPfH6TIWyvL61dIhWT
	UNvrDiP8dsFwphqIpvdQkwH4Oo809Dpz6OQfvdKsp0YtaLJSU9ttu9Xr67v7HhWofXCJpyyfeLk
	SSbtjqRYJhnXk4eHKlWOHrxmII4GkVbiabOUBMrhGlP84mzW65u8eXFxTCmYTYMrXA+kCEpbTTG
	+nXIXNnA1y5+goEWGaNmCjU5Wg/9qtxbcHGNV1Iv4MBBtEewi8yQuNdbGWVkR0vuJmW0vd2coPd
	uNvoOO1gYqtMn2PyKA7jT92GaG2U5LK230qcuaEjwMyJOVtrWUaCdtb55BAbnil4AA2tc3gC/hF
	CiwchFMfxQ49bnquzdM0hJN1naXzehNw1LbiYqz7jVd5/OQi4E5SqIyX2MwyWGZxrZjaPVLSGNO
	jBSnvLeorsopMPkM05MyMa4KCrYyzK3gt3COqxlFgUkjIF7JyOZKxfXYFzPNi+cxZiXddwQRbAv
	EI1dKuCQ8WTAnaq+VjDPj5a
X-Received: by 2002:a17:90b:4c8e:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3966d44daf1mr18399533a91.14.1787797673055;
        Wed, 26 Aug 2026 19:27:53 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80edsm671454a91.1.2026.08.26.19.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:27:52 -0700 (PDT)
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
Subject: Re: [PATCH v2] f2fs: support resizable tail section and unify pinned allocation
Date: Thu, 27 Aug 2026 10:27:45 +0800
Message-ID: <20260827022745.4184511-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826153644.3726384-1-daeho43@gmail.com>
References: <20260826153644.3726384-1-daeho43@gmail.com>
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
