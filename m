Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DC4CA274
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854792; cv=none; b=rQ4v6O5NGeXtqnR6aCwJ7wecEPrEVr1wvsObyE4k52/WgtrdAlNkcCz2g4k68ClmTkg2XQfiGAXwjBTKKSD8Jp1mkNO3YrrCy8UXGPGL21JdIqgNKvP2ad0fUwATjoEUeqkB/FnKcek7VqOLym2e7LGwOutJrYKqaMWoURbecOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854792; c=relaxed/simple;
	bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm5ssE0pS9H84ElWppvHea42xuhSZvU9wrR3zoGzioB2hnk2t9Dz92l7i13gOB2n+eMyfkb4ZXPko4zckst5I36CAn49Aq7ziK6hQFp9Xyv/TEPkBM2lgkz+G5bE7E8byOyS1ckT8hUsXpkwiSvSKyhZ7WHxQ5Bq4JbIf+a41Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSq+dWxS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSq+dWxS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so404705e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854789; x=1788459589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=iSq+dWxSDpmbLWpinfGMZDTYCpZerdRNe9k+yHS/MGWUuxtjl5pi21qNKCNXmk0LUL
         TUoCdQIbJbSSZ7yJ1DbchhERgCuP7aYZ0D+RhLi9wt0fVcjv56eTqh2p3AyXfD0f3qCm
         b5cKy87m67A0D/dUHlka76w8YZ8Gs3P7orpIOuYG2qJUHtdL0EMadBrvC6oMt3TmSHTF
         8McKTqkhkEtZlm1fSXOGPqW+grDZMmru+B4GazfDVpwrbrvw0ITRUX0U65VyujUXB8KE
         +FCB/gc2aYxcAkllEw82UMP1HRe4dJFhE42jrVV0nrYQlfuIiIEiVbliDvRu8snFNKhH
         0rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854789; x=1788459589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKhAEVoGO6Qib2+bHKs6sCdqjH8YE7UeUi86MuSqJIM=;
        b=GD8IPSBrKWMaFQQVP2WkMFwNTuyY34FCNO0bHTQJ0hb53AoeAzjozKaUmph8Y7+PGO
         9Wn9OjNTwKMZME5YG7eBQ81xZMYFgzqshZ6CY7whNCDsWy64W6g2FS1zff2vV1L6GAI9
         vRPhaIkM546RTunFDaW+rRugQlf2AD2QdCmmduOiEPnXClIs7eiHbIB4KBNkkgTe9WB+
         XNH2AncKgOlWJBFWnQwCaGwxb1VxmuTErCVz0vqIayQDiqha4TxYz+mibKJBYH9DHbQT
         xCKUy7TB43bMwCsvXWXd1pjKGQUbjpwhMK6c4sH1YxmTjT075JjQX75f7Rr9ZYXr3scG
         bCaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU5HsATSItch6mq6JGngrYfPkpCptdbgIqMmzgcKTt4yxtWlSOoZAOXhgTB5aBUT2+Q8AcJz/57Y6X2lw=@vger.kernel.org
X-Gm-Message-State: AFuF++l5Vhm+CFXKzyxlxFe4v3ZqFf5D5kMvzgjcwOujMLvakfwcODL3
	wZGwgT7Y7b0pui7bPDv2IC3NtPl7c+7fylmG63Rtjes5H9BX1+lKwzjG
X-Gm-Gg: AR+sD11Q7aUsLwa5z8Nq75hqmpRBARPTEz8AVGoB6R8sGJQCA1ZuuOtjs/AEPxZWceM
	k++iTiE6gfR76RZ4DBPRHiKozawUnXiLVu8Pexk4K/sFCQ9eDLKPjmrReaB4H5ny40yE6Kepq+n
	9V+c2QGk3quivEKAQ5a14pe0m0rlPAN29tSl2RPoOwx4XHksS2rpwTNdJD48c7AVtMWXO1iE0Gu
	Mc2qhXY7Qyp2ZWloHM5F6J8RJZ0IdRmWTGr4NDo7kfdDqyfc+Eoo26QYUlZez4GL0SnbLdRe32f
	dRMaq5xYV73rCAuolGs+goKFUy+Gb0+dR1ggAwOk+0QL69DP3i8m2CMMCXCUv93Rnc3bP+WciBy
	XjKlodg6366eoDSq4QyrrPCLbC2wE0f3773qFabILLG1W28GF7ibLNVwzCRHnt8dSwokD00UoQi
	mIEV2mw+Z9H8OU/E4A3VMfghng11W3aSaWWahcg0WUEhy2En67gAI6L1U4BxxLXLn5GN9EbFgjC
	N5HcjdeLHCDcs43hs8kQP6bqBTmEyK3Fai9276xhNdP
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr12076895e9.14.1787854789174;
        Thu, 27 Aug 2026 11:19:49 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm3721015e9.0.2026.08.27.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 8/8] media: i2c: Add WV517S lens actuator driver
Date: Thu, 27 Aug 2026 20:19:45 +0200
Message-ID: <20260827181946.2432907-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAt5fsysjAjU38q@kekkonen.localdomain>
References: <apAt5fsysjAjU38q@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. I addressed these points in v2.

The driver now records both Intel's 2014 copyright and my 2026 copyright for
the new V4L2/regmap implementation. Board-specific text was removed from the
Kconfig help and driver comment. Register access uses regmap,
pm_runtime_get_if_active() errors are propagated, and controls are restored
through the control handler after resume.

Maurizio
