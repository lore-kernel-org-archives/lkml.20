Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627671;
	b=JbnnQCX/AviWVGTWsl3GIIOOnkzR4xsu++rfLmq5J5Tt4WSAiurPzfFUOlbH5++rcyPL
	 zWDEhLO0uwwARsRfNIsJECBpfPabwtvXxIYVJuOS6NgsWBzAEE6vHQtDWohTOEZhXWr/5
	 7FrQEfhPkM2I29qR95ky7zuSLBnL4l77CKru6L9SJqDDhVXyrlXUAQpYBscFbxh5Pi4hB
	 2bu7RAFSxPFxvFbXA85wEud+eXqDYgG6Bbcd5dtpbujceQrNpFYc50OH5QnoVcebGAS9w
	 7lWur+MrzM8ARlnt2Ikms5u3r1SmmNfGAUmiTAiSlIIk1lc30YbXJ/N/CB1JzHYr/Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627671;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=X/lPtqrGKgpcO9YK8iWhQIvD8Ds3luqKPmjFbjHEQpw=;
	b=v1VFgYf0iCJt3XrRikern8eDNPDZRx5NH2E0dOBGcdUptXQGzJKjmKasu+4U2/eFAN9X
	 mvSClNk8cKoN9Sgq6e/SYJ0d0YNXo8+9Cmt820XlPmpiX4gb1cwYtpLhhqUiJ0UgmxRBX
	 QGuZUzQHN/V98WHShrYrC1woIJMQ8Zs/gOFYTVmxFWZkhKhsf/UlglIUy6cGLMhXjRiQu
	 laMsVCfikVHDp4VOESf5pzi80epjyI6UsI8ZmHP+tj/3dAmz57Kz5bfovqb2u5GnMQ8ll
	 flyOGLsyaVhZOjbLr4dMBTWUUtehPWMGE37uFxRh+XPUPuF+jqAYRAgxHdl7tkpIBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dawidwrobel.com;
	spf=pass smtp.mailfrom=dawidwrobel.com;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEB60A2618
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEEB60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dawidwrobel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dawidwrobel.com;
	s=protonmail2; t=1793627662; x=1793886862;
	bh=X/lPtqrGKgpcO9YK8iWhQIvD8Ds3luqKPmjFbjHEQpw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j8ajqWEWWKMqzlzmZReFdwm1XUHndjNmG747odNDq6010sbn0Q3GWuyMs8iZ2hXU4
	 DJItrqsI5+anpBqSKH9/jTJK/a5pzWnHPrFvWsVTj2GzLXON2AfVdvj/ImJDc0sleh
	 TELalaVp0oCcX3oyUyb3KD9OvJ4mF579iAoKCkoyLp9paGDFGqIFG1Ye9u3mLrr2oA
	 eRoaER1CSAX4Jyi9Q/XBVe6nX2czS4ljbdW7Uvtp29kNNRF9k6Ad/5LMDjcKukGUk9
	 srbi6IPZq+EW+t/iDcTTws7Ct8CkenSvY2xfVSHD5qGe+/qSsMOcJQX+V0bOkvTq/c
	 8c4562CVnoFJA==
Date: Mon, 02 Nov 2026 13:54:18 +0000
To: Haozhen Li <dezige131@foxmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Dawid Wrobel <me@dawidwrobel.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, me@samcday.com
Subject: Re: [RFC PATCH 0/2] firmware: qcom: scm: QSEECOM app loading and listener support
Message-ID: <6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com>
In-Reply-To: <tencent_123976BCEABEFB4C0F5CE28BCAA346A72405@qq.com>
References: <tencent_123976BCEABEFB4C0F5CE28BCAA346A72405@qq.com>
Feedback-ID: 173987960:user:proton
X-Pm-Message-ID: 1cce23781a92ac116674ae36e491ecc1d8188940
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1.11.2026 17:01, Haozhen Li wrote:

> This work builds upon the QSEECOM transport logic developed by Dawid Wrob=
el
> and samcday [1]=20

I would have preferred you filed your updates to my code as a PR to my
repo at https://github.com/wrobelda/linux/tree/qcom-qseecom-tee/

While my work is indeed AI-assisted, I made a substantial effort to
design it properly and review and fix the code by hand where it
mattered, yet I still don't consider it admissible here for mainline
inclusion yet. Notably, there's also a substantial amount of
documentation I have written by hand specifically to submit it along the
qseecom code. I was looking to file an RFC here this month myself for
all this.

The code in this RFC is, at rough estimate, 80-90% mine. While you did
retain Copyright notice in the source file, I believe the guidelines say
you should have tagged the Co-developed-by: together with a
Signed-off-by:, which you should have asked for from me.

You also mention Sam Day, who filed a PR against my TEE driver, but he
wasn't CC-ed, so I am doing that.

> adapted to modern mainline interfaces (qcom_tzmem, lockdep, and proper
kerneldoc constraints).

What exactly did you adapt, because as far as I am concerned, my code
*already* does exactly all that?

Lastly, as Konrad pointed out, these interfaces need an in-kernel
consumer. My work provides one:

- a QSEECOM TEE driver, which uses the interfaces in this RFC:
  https://github.com/wrobelda/linux/tree/qcom-qseecom-tee
- a Goodix SPI fingerprint sensor driver:
  https://github.com/wrobelda/linux/tree/goodix-fp-spi
- a user-space stack (two supplicant daemons and an fprintd patch),
  described at https://github.com/wrobelda/goodix-fp-spi-linux

As mentioned, I will appreciate your patches as PRs to my repo,
as the FOSS etiquette dictates and let me file a proper RFC once
I decide it's good to go.

--=20
With Kind Regards,
Dawid Wrobel


