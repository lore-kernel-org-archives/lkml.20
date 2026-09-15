Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545043CEF8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450415; cv=none; b=o2Z5kl61cG+uXzMVOn7ePAJ3cddmng/bRrb467koiv7SmM/SbXp76pa6MfCaqQOXp4wexs7ucb/HZir7hERxP8L3c8SzpiN1hq3AHyw9Q/4HGGL2CpmJDctqkv095F+BOH8IJrFE+WfcgvLLCePrzkyDjn+Om2wL8BK4xbUDUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450415; c=relaxed/simple;
	bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c79dq2FAWIckHBp/PC5cJa2sy7gUdp3VxDsljWK9L1jFkJEobtHnPpM1lidQYc+TWm+vWDacmOqdWaECEypL2vhvfeHbPbrD/j7B0oZDK2kv5eWwHggekUC6wnPOxllR4lz9ivtYOyyAOfQ3sFzhLtwV6klaseb6pSMpzRGcQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2f1Vs2X; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2f1Vs2X"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so3020681a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450413; x=1790055213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=F2f1Vs2X4HCudTGfDWL3XIaOk6lIpppjkyPTzwO8+BYNSIrvY9CI7zWtDPY5AzN6HX
         Dydc7l9P50X9zeFiSKJ1u9b8kMzsETGmrbAuCXrUaOOGQki9khRgx4tCmjr8moJ7aff0
         762WJfpjpTQxpiBgyXGL9F2Y3M8JCJqgYtjooznT3U6JFhPQoKWTBjwtlZ+YSt5sBCkK
         h+Babg0Td9/IsfR79f5KL4VNhXYV0v5cjK47ZNkLIREAzwj22uwy/hhxNfw2MPWpONFZ
         FFodBHwB7gv3XUJCr/suP9OpJjrLHi5v4dibWGi4q2aq/C/VXO8ALpcNLT5lCUHZYtB1
         E3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450413; x=1790055213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=Y3//j6lcjaOpiP886BzirpvHJeYzDFdZjcZOP2upIyChrjbvaspN2yR6Ps9tnbGNHB
         FUk1U+XSUsD0c38+jJZrWRHEBnIZV1p5hd3Jpdp/hpYpY1TIPHczl7jyQC/+1UB7Dosp
         xRTAEMdI9UJdNLJ3QsgueM1+mYNq3yteI2VG0Axn/tAfyehwuUbxKlyh+ClH3jHOUsiv
         fUluaQQcZULCY4mMAi18Md7RmvH1JS+lBO+lYIw6UEozJPj/IY5DfriI4PSpKVbOdZQX
         +pcGLkO4J1k5fiLHu5m3XwrM+/FTHszSKSYnBSMbfN3C0o+D0Qe5/l52AnxYrSAzwK0T
         ZUhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz+c7s1OP6wZhBFphepTbrbAb0QV6OL91Kl3xgMibPvN74Jhnx+QNyzIUwNABo2rBsJXwQ9K7sOBCCHCk=@vger.kernel.org
X-Gm-Message-State: AFuF++mKmCYNC06FReeB+FRut6vnB+uJ/V0mzvNRsLA/ItIC1lWrf23m
	uyuCVkAmGiFYYvGkOnEpYZqMiEWNyirWqklJAUktKwtC4pqzJ7Y1aWIe
X-Gm-Gg: AYBFou2ymFHKi3vutFDvBYLQtm95o+cp01urgRA8+xqKzvTgN90SCEZPC0KFXPq5Ix0
	JYJBkpecnxwPbn/H6cEl3VgZ0W9IYvM3x+j26DxhTigyyBXflSrtUK2XW79+S4saI3CRyoaFCnM
	PAT86XkYkU9OPd8nXaiJSS1hTE4qcJwV1mkjm9aP2A5a/X99D5PefLQqVDUm4DAT2IZ+wd4/XG+
	H7UGOBUCiaKrEuiq1SE+sqpMi4haACtMrUXoKHBFIwKMl/Uz6ju1vsRFhmbfDPHrBNpiaaYw1z1
	OcNf083NNnoigQD56xaQata/NqgF3SMf3E2J+Co9HeJ/LACE4Rsuhu2yOOcOe3EWyTJoNdpzMfX
	XVi/pnhiez3yTo5DoUN+obIzMriYv+fxHdzXVAtPurDOigdTi/mDdHCJbFa5ceQ6f/pUYEktq4H
	U/azHzC+rqZ51QGtt6S41laKy2mHAxK0ONhjMnN/8uX2SSm0jIyD8obxRLeOHQkujA3zC23GOkV
	7YtWvKQCA==
X-Received: by 2002:a17:90a:dfcb:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39dec142834mr13260587a91.25.1789450413078;
        Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm2944462a91.4.2026.09.14.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:33:32 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbnpreetsingh@gmail.com
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on error paths
Date: Tue, 15 Sep 2026 05:33:31 +0000
Message-ID: <20260915053331.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820035203.7-1-bbnpreetsingh@gmail.com>
References: <20260820035203.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

Gentle ping on this one. It has been about three and a half weeks and I
could not find it in char-misc-next or your for-next, so I wanted to
check whether it fell through the cracks or whether you would like
something changed.

Thanks,
Babanpreet
