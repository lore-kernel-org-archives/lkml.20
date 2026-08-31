Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB563DAAB8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164331; cv=none; b=Qp+bzSMIpgEsl/putPxTmyYTALzNUwBHd5sj/s7su/mb/rXNVoLNvFfd6ermGw8wLs1zhbt5wkxlNgm2/rb8MaXh5Ao880tbwNTjRxVNyYPqAMlI6Eu7E0vhyj1mx9reCIpWMYfCJYCrO99J9wO2nlU5H0VODiHC3dste6VWLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164331; c=relaxed/simple;
	bh=OGZ36eVnke4tTcBWMGg0DVkujCKu6QNnJRUk2KiiASY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEb0RCNrTX5q+mF3VbslEtDgDXkD8rudlqFKY3Ok3cAPYwUmYBN7dM4ZkuNI9rT2FZ4l31KsSHzhYHfrB140waEIwMthvoROHSQ862cpSYnEuhs3Q41dpFbo+yCNekWnBDGJaqrCLWZkq43DBLy3Rwt/A+Bonm3n7fJi2itf1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CqY9q5tU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CqY9q5tU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so30566845e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788164328; x=1788769128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tst+Trl4h4Agv5k3AjzQ58WIzFViygExwZ23EkFHejs=;
        b=CqY9q5tUqconGe0A1taoMD0fXYqEzXPtcd8w4Bu3dD4GLhWrMLNePa8M2RHRs8vXjm
         5XSu/fEwbquIff8NvmW1IJXHYsVm6PuJDkPKEtsp7FpzC8n4DPYqqxd5l/WNhRX0PNYC
         6/KTwRXg4qsjMd7JzS7gRXUt1KqLBW7Ta7aYZ5FpG+AqkOH6HAMOmCx9njCzZDN/ej8g
         pWYohfqZRt8WZmsbRbcJ3F1E4I4iaDKrRUmPQvL8GtwwDwEF1I6gFBz9BNFqpwJw5kt+
         8UqvFnLhQm8JeW74nvnmMFdL/NfJxKAgdsPh2LcFmRx/2kdYIhVzhjAuEPaMQKjyKkvC
         X8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164328; x=1788769128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tst+Trl4h4Agv5k3AjzQ58WIzFViygExwZ23EkFHejs=;
        b=ZX/X4s4NBr1xHq4m2/VSh1/EQb2vQGLhw6Q8kBT6TytGeW7TWA4xPDSfGsGUI4pcFw
         kqiQRaZaTf2hRtNj/zcS6cljhGoGkP7c8GFTvAK2iymSjdp7JRUkJ7kKYN9mNhiNGnGR
         1gy197LzMtZB7W82ZYagYuZ0q+hZ1nrLLLOuhE/NUTP5kidxaotsbZA26u/x11v7s+9A
         X3nlC4VV7cg0JZYzl6O4/FT934aB8V1ZL9Ak6+ccbtQVAjVGBNBQqv9bFqWVFU5ciSnP
         XrXuH2OBdgz+Pzuw2CHNQuRVPNjbFrrcH2itJxFXMTmZVLqetGaacv7FM85aLftj/c+H
         JE2Q==
X-Gm-Message-State: AFuF++lFJU2dl8kScpdudJWqJRtF6RNPOqyQptzzt1WF1TnHKC/6zvwI
	DxASiGhtS8R5xDVszq/VQKwea82nhSpvxAnWA2CdNTbxZUQa7lplz4bXfHJV7CPDFxucFVQ5z0C
	VLDpW/6A=
X-Gm-Gg: AR+sD11FfRK/eoysSHBjmtoMwNmasHJfK0FfdScgEuCyjXTaJdfKhg0YvXyMG+jpCgg
	cdvv5jNvo5SXfc6sl5V3ncJcc0dTzxIiYL0+ON+aNSOO4JDTJ7xTs8DfZkjGwRuDywLjkU5RJn6
	YLnVWk2IciPrIk3FSx9P7hL26rSBeeWMldrYIp3xgjUAfuct1yuRYaa7IDXacymvRRHX++rV7K7
	tcdxwAo7rHoeXfiWluLeEn7Z4yGdZ5NacyynIH+rKb/0nELZ+ZPXxeEkZl9dwDl8jcoQEFLY3Y0
	mVjGPWVGcIeCEn8BXIDTYatN9y/CWFSKUux17qk3APCLbvkeiF0D2LdI8OVDFL9Rf595KeV5YpY
	8IS12+w6Gi64jE3igUnIyCyUVwYRGrJgQCT2YShqERq7kbVicT6VmtoNPha705ZPNf5EGCv9eOy
	hV0gw061IYykFQ3MG8TxADOCCXZ6oz5HvohEWtEeGjIsI8ZmmOZv7UZljUqkYJXMM0vKAR+nuWH
	lK39ci/Hoc=
X-Received: by 2002:a05:600c:3103:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49b91c4fa9amr352262635e9.9.1788164327870;
        Mon, 31 Aug 2026 01:18:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm273218065e9.7.2026.08.31.01.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:47 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH 2/2] Documentation/no_hz: Change dynticks-testing repository name
Date: Mon, 31 Aug 2026 10:18:09 +0200
Message-ID: <20260831081823.67972-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831081823.67972-1-marco.crivellari@suse.com>
References: <20260831081823.67972-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise, so fix the URL.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..dd624b7c3f42 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -206,7 +206,7 @@ something else is in the way?  This section helps answer this question
 by providing a simple OS-jitter test suite, which is available on branch
 master of the following git archive:
 
-git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
 
 Clone this archive and follow the instructions in the README file.
 This test procedure will produce a trace that will allow you to evaluate
-- 
2.55.0

