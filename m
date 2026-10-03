Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AA39A06D;
	Sat,  3 Oct 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015704; cv=none; b=ALmk8L1v7WtLc5TfJq4qqPUgUz3ObICbtI2rlT6p2acX4SKC1BjGwnvL98Cx1lRjYziRTZQNB+1ROfF2GfX6bfJ5YWPlHSUHuyLcGP5NR2qKpaYboterkQr+2VMLIqKwTwkZ9mzWgbYBhsh35ks1kBEAyx16WF5ugtLlfgDU5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015704; c=relaxed/simple;
	bh=/2wSMWC1jy3pPSWfenPfsdtRpjJ9mDdFD4veSkZ6wEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ctecWcdXgvAC3LWdSgCFozc6+mB2aNIuevu5QbVoCy8V9z4o/GsD/eDuqly2U3Nyeq0GXSmVW0ef5AYkOnQhAaEtIbUDNX9NU7rMK/oER+B29PafNN1yfUpBUE80W8LEpwIkDOeLRBQJogUANCPgvLhvylyvkDdycO5A6He+Hso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWT7hW4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWT7hW4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7691F0089D;
	Sat,  3 Oct 2026 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015701;
	bh=ANHO5yshAXbDep/Swbd697tknx8nOzPeU4wu2DpQyOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bWT7hW4zGivvbnl9fKa+ZcQR4IfO7Zu0ggL2hdMx8jb7ZHr58kvYAt87lK4xHuid9
	 0N6/5C1I2mKtXXKYf2JaAzqiiYa71AE8JL5xdVhpTna5MTCrReGyf7NPi7vs4R19b8
	 MEjBp4GPf1eUFUT+NBeM7fL6iU3/8mphauDBnNI0PY3xJMIQSChhqEH3IjnoyEhNvq
	 tfia3yx8EEzpiRsXUGqNYGlMX6nhpg4NmF4nTZmQs4eGPDaaF/kDFUPRvxJ4ZK4Jxt
	 ABqBxeiSISPDfX+NnK2g39yFIxKVjrXQMNSn3ntuYAb7DesSmiNRxwhaSpAVjaJiS+
	 qADmx5G+Qec5g==
From: Vinod Koul <vkoul@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
Cc: flove@realtek.com, oder_chiou@realtek.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260929-rt766-wake-v3-1-09c0b82c72a6@realtek.com>
References: <20260929-rt766-wake-v3-1-09c0b82c72a6@realtek.com>
Subject: Re: [PATCH v3] soundwire: intel_auxdevice: add rt766/rt767 codec
 to wake_capable_list
Message-Id: <179101569832.158974.16885332546336665063.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 10:21:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 29 Sep 2026 16:24:06 +0800, Shuming Fan wrote:
> rt766/rt767 have wake capability. Add it to the wake_capable_list.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: add rt766/rt767 codec to wake_capable_list
      commit: 2e9eff8847a46530ab937696f340b9d5bea2e4ef

Best regards,
-- 
~Vinod


