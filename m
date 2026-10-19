Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBC481A82;
	Mon, 19 Oct 2026 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388669; cv=none; b=Ek6jxJd9dD2PwvFrDb/0IucZ5Adty4L3PCEE/s+e4/D5jUDRD++DNk+/aY/xwL1cnazsVR671Ogl3H+wDi3FDs/dkhAowR3R06Ctg4Y3Sg07w8yR1STOkWQ0cSb4eVaW53sZDp07hnUAIueduJek4QSlK1tYG3J1Ojv+7LXvEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388669; c=relaxed/simple;
	bh=WdK4qd87+pWtXYg4vFCOJIncXeCGvz8kYAc/aD18wTU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0AL6fECbMCKXxpE/JFRpourrI4a1/afjDh5aiavZHzMfgG3JEhOmIXZ65WsIhm9w5ajScZeM4IkN5J6UjY+vo/XhX8jLdVf0LpEoEfH+V4rkOHrkSajGIAQpqTQt344DU4972xW5+KPQ+RNXPvAdRwrk8be5tbAn5EGjbgcXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RvCQEqdg; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RvCQEqdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792388616; x=1792647816;
	bh=WdK4qd87+pWtXYg4vFCOJIncXeCGvz8kYAc/aD18wTU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RvCQEqdgtR5+YXaYFtng0WBWfdL2NO+ks1Thhoi827g7j0DmMOhRmD/dRCM3ivCvV
	 4n4F979KnL/9CLbN2vExuDo/Ehpl3uOCMAS6QWwaqTKgnvwL4k7I1YJdcshT07fiNf
	 PWSuOAydANTL3jc63Gaob3zar7p3svvtwhnKDfC+rVxVHs8MASCXO1yA5huPjNSU/c
	 5ZAHTsX5SHNlal5/uinindLEB1A/eb/lC6z25qRkqlH84SbgOiAIZE9HaUL3A64zdu
	 bvq8BfYwm4MCeUIGkAy+ZqsaE3+Eu4W8zjp2oZBboa3yty7fLRqw7JN0dWlLzov9Lz
	 lNju8h1+6akCA==
Date: Mon, 19 Oct 2026 05:43:30 +0000
To: George Neacsu <geocausa@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Message-ID: <20261019054322.3675-1-lsa.uz@pm.me>
In-Reply-To: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 33be5735e34940ebe37640d856f61e542a9d0428
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

Retested v2 on the Intel model, on media next with the power-on v4.
Loaded before the IPU driver, the sensor's probe defers ("parsing
endpoint failed" in devices_deferred) and binds once ipu-bridge has
built the endpoint. It then streams 4224x3136 at 29.95 fps, and
v4l2-compliance passes 46 of 46 on the subdev. Through the media device
the one failure is the colorspace, which your separate patch fixes, with
my Tested-by from the same machine:
https://lore.kernel.org/linux-media/20261016-ov13858-colorspace-v1-1-51f037=
9ada0c@gmail.com/
So the Tested-by stands for v2.

Sergey

