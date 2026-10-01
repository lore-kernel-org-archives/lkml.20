Received: from mx.swemel.ru (unknown [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE453E51FC;
	Thu,  1 Oct 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851559; cv=none; b=ckQBTkFQhsD9Tu5yEIsUHuDbm/iqadiG+Q4iyyU0XILMUaqQx8JFj+7BFHB8SaMwZIPvPv4IfA5UaHMIrSRVXhWaVwm4wx6rT9x0L63CiHHts6oifs5/WAZBLMWg73dtvqdGTIu6NPBsq8kdS7tYi6bgMk5b9l2dO9bB28G9988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851559; c=relaxed/simple;
	bh=SaWjJYGUQ7c8OMKwCk0VdRzn2DP0wuxI578A85RVXjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMxtp7/N15Ac3waPE/4H30EIxF2Xc1J88TtIUESwEueMFfFHWcb6xM1MzGOyuqA3GC/aaEbLKzvvi9TIFB6pqRQun/EVlv7Z01ytdkZCPj5FKZbtvTweHXGzdkpob4ccK8UPC1tVXlL6F3/xCMF9dpj0UKT6lkymgk01RQ4DD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swemel.ru; spf=unknown smtp.mailfrom=swemel.ru; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1790851066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ws6HwGRYvEC9/7mLPTRmtGGSscHu4/UF85e0oD/ZwUg=;
	b=XcoLnISB/1Aa+vGGAEYRoNxFcz6ICLWk8HLeHMEjY/TwxHMSNhgPlAbszi1YrR1oyJn6VZ
	1rr7tvlMzYVMzIeQNU3bMqZDtRjCpLXMe0RMJGfLsXXPSiU8Lc3x5BPQwKbaz5J2xbDtiA
	CPpQLGGdE+23ez8HGlxur91d69V1GAo=
To: syzbot@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nogikh@google.com,
	stern@rowland.harvard.edu,
	syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	wangjinchao600@gmail.com
Subject: Re: [PATCH] usb: gadget: dummy_hcd: prevent unbind via sysfs
Date: Thu,  1 Oct 2026 13:37:46 +0300
Message-ID: <20261001103746.11108-1-arefev@swemel.ru>
In-Reply-To: <18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org>
References: <18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello.

I would like to gently ping regarding this patch. 

It addresses a clear null-pointer dereference vulnerability in the dummy_hcd driver
reported by syzbot, which could potentially lead to a use-after-free race condition
under certain scenarios. Disabling sysfs unbind attributes via `.suppress_bind_attrs = true`
seems to be the most robust way to synchronize the lifecycles of dummy_hcd and dummy_udc.

Are there any concerns or further changes required to get this patch accepted?

Thank you for your time!

Best regards,
Denis Arefev <arefev@swemel.ru>
