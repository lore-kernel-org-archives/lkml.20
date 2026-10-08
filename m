Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495EA3CAA54
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486516; cv=none; b=jp+ohCpV+12lvZu3Kji8ggOe9AHBSEpx3gtlzzklsd8vSOe/NF59GVRKA6kouTKXYi2QpHKd1Z04tTQx1uK4eoJCBL2opy34FQ/cD3qiyHB4XVg9nYtifgtTyvd5BTxpDNR80VT48hegRaGO63l5DGuM7dL+nRVSjfL9PpMA/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486516; c=relaxed/simple;
	bh=XF77qWOGif5zEk8H1AsZ8wT77rFF8rp8IYnHt2iRwn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0xl84NePUPX9nM7tWs71bwE4jv+ESFo1JFM9bdLbYr8W0msF0EqUFbHBfpULSkkqOMfnLK0QUfqWZ+xEuWZ+W5jzup540oyafGHlczCwyN5TRsPYgRaFxTuLsGhdzLTsU39LHBxiRKPya/lAEjecuk2sc+waxFVk62FNnNfB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=JTFS6qXq; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="JTFS6qXq"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c2520ad38so8039797eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486514; x=1792091314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bK56KhP12nN+K16lwK99gcseDIqNs+bzdxiXAeZPNow=;
        b=JTFS6qXqpQ10jACQkZMmgzuW5ln8/PMRBlPNR30qMYGMm6qiWu039B6fR0WZDFOfXs
         /w0vZtwc1ijsgyLzgYzMjzjo8bWxMkRYYIuVvwqrcZXhYL3HFdHjlYmSjNO+ppfYzbSN
         KP+Z1F9q3dxGVtNmx3mHOAXeL00aBnWgKc6vq68EQxbY9YkKaLaLHor/qN1qAMVY3TnJ
         GzQx6oCvMhvhMabw5eX2nU6haQmDirhzINy0bt+ISpxhDg7aBW/kedfBHKaqSz/vaXrd
         ox9ucnbnNaoeblf87RgM2jynvj7sbYnnl7+NBLu2dSi2Dl9QB8bytT1zfSPADelAubmj
         tkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486514; x=1792091314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK56KhP12nN+K16lwK99gcseDIqNs+bzdxiXAeZPNow=;
        b=iA9pJUrNbZL+doCw43OzGrjfwKAQT72Oz3pnr+7LsKPT86nRvUGr+03Wu4+cwozsp7
         RyY8RAniU1Bge0a3ZYBurs+mtUpvO3iMNLd68zukAXBWT1qyKZUueEdDp5EweVVw83M2
         vh924p8dowpDMqAk/LL1TeckBOf2fsCliAlAYmTyhzFx4EmN1awmgyOdcQGLNh/hvNnF
         ceLkvY34Rr9dtJBS02DTYa/arNuF52XMD5Kjmp0MNpsVp9/Smo7NHfn8hLzZzlTvAVIT
         hjSzblyy6chtfMqjsZq7zlJSwFfaGqmXuX1HhcS/tOYgae+TRymvdDdWQGs+fKYaL3Qd
         yKnw==
X-Forwarded-Encrypted: i=1; AKwUvBzmFWxYU/djXp4KDNHYhhzOrJ7Y3ZwB3wIYqpo/TD2voMzoKXtyFwp/hGGyPRmwjw2X2+C9k3ApmRti/jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0gi5VaPvnLw11ar9Sihd49DFZmJ9iALDcsnkHGeG7KrxbyDMk
	nHY/C9jN6RuJQxAGksZvnNg3eOg4zROS/Wy8DFIyB0a4SVCCc5l3W8DDTc3o9vCtKYE=
X-Gm-Gg: AYBFou0WNz2a5sqZ9vf2sgRwxDNLkVkphZx9/kTpi3/p9kiw5FN49xIk9bAIqfZU6sC
	E6OYdLrP0iOFauIPpXiKtxEsp8AJvTe5uJmMpYcB5jbNboXjUXv26ss4P9NpLYpGB68LLqZxK00
	AH6lRm2DFJRGbzS7nVm+MH2GrJCLwboq33/ZXnxUFHdUw+twq5R9cw6TlHw75XmbruR6f6RN+dm
	VYK/MdarxY8Mif6fjDTG5bl5BOLEXq7Zc6POtVZ5IsRocHiyYYsbXhNLAzDiVbl6CNYdIpa+5n1
	BkAPwJ3/zCQiwJL7PonNIgv5ixAoLXmyJ8nf0sSKlnpgk1xptVm+Ihboc5refAka90FoBptWRUa
	/+wbV5N/qpt6IO/cuFBEyIP/Dko8a3nX6YyfGfr0Mf9zAXa+BUr8udx5DKQudzI+fT2BU2molVu
	rIp0WhisX/pLrAXTpfp+RigOp7IC1sdM+rjA+RmfkALFsAuy9fUoojImpigdMSsMwthsyVYa3zL
	cM0fkh/E/A5HFU6HMC/X3ldV0q7P/kYg24spZ617/neT1vAZco7J0m/urtGNc1PbYba4yU=
X-Received: by 2002:a05:7300:c00d:10b0:341:c6ca:1df3 with SMTP id 5a478bee46e88-3515dd78d9fmr8396610eec.14.1791486513944;
        Thu, 08 Oct 2026 12:08:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm80561eec.3.2026.10.08.12.08.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:08:33 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Robert Morris <rtm@csail.mit.edu>,
	Hongbo Li <lihongbo22@huawei.com>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH 6.6.y 0/2] erofs: backport CVE-2025-68251, CVE-2026-53015
Date: Thu,  8 Oct 2026 15:08:26 -0400
Message-ID: <20261008190830.97970-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2025-68251,
CVE-2026-53015. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
Patch 2 also affects 6.1.y and will need a separate backport; this
series contains only the 6.6.y patches.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. erofs: avoid infinite loops due to corrupted subpage compact indexes
  2. erofs: unify lcn as u64 for 32-bit platforms

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472
