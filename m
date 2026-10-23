Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748351;
	b=GSG+/xkcdXjYHE2q9oS2HB04gwI4oNzgWvTzRT1GbNRS1jDmN26D1XEXJA5g4Ignxykn
	 SnEXt+NqiCBuFoIn6XmSPm5f45C/L59NDTlS6FM72gf07sqbqXpoVyVrvJZnPbVzSrc+r
	 /gzn+UHCMJWntp9U5Xpt2YThAR2noo/lnhRl3SrVlecNrziE7TxZ2zEJZaSdGjh8gGV3T
	 qOZVsInG0eV6tsVbjVXNYFFJdX0De6GyKIWNGid1bKjlz9ErC8X5ZJobE3m9YRbLg3zzh
	 vdPAZ19kv8h/Fc3AxcoQ52AOlRByO0pJetbUMhu2LGZE+ZZrPUWm6nMwQ/4/WMDhohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748351;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DYRtRbYJzIecKf94Y8Hf2dQuCsjWudl8ekWtZbZxUUE=;
	b=s0194ow0Rf3KNbVnBX0RrwIWD4uWvwvt20of0NQG9Of7Z/g7tjtlFn1FikqBDY1LUdge
	 ffyaoxJ8j2mzjNy1lHQ0hqwNDdFWzc/cS7TwKBpj+cTPCfv8Lczj+4gVp3aB/nt/DBFk0
	 pXW5AM3zHqKyfWev5OHpbclqaUgdhVf0NDPyAYn4bH9anl47rKhJmfzwbn29cOVKdc18a
	 sI52DtWLao+gYqWiV6mBenQekdd8bd9oQzK+lQGcR2UIM2CDpnLSyxE9yLOOV+jdCQ20p
	 tMwg5d3Uj7RYva3prpZYruRxljIvvMe3H1IhtuNivOgwsLw2F853V3aIKcj0RLHMCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=dXFb6oC+;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B58606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=dXFb6oC+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792748345; bh=DYRtRbYJzIecKf94Y8Hf2dQuCsjWudl8ekWtZbZxUUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dXFb6oC+QleMPScBZIeCpLuBj0DDaM1fJOjfmlJXGtI6PXDcB2P2QEc7RqcJAVaM+
	 5KThR/qSWaX1e/jTG6KWwkVP5Ubtr31oE2+jYLvWzykNI0je99TEnAVhnA9TTfUFrV
	 VhSNu94wVOv62J4zaFGtyMhznUuWtvGS83wqBcRo=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 9C336277; Fri, 23 Oct 2026 17:39:03 +0800
X-QQ-mid: xmsmtpt1792748343to8drg1o2
Message-ID: <tencent_FC0BADFC51D31FAE8618D9C4953B9BB42606@qq.com>
X-QQ-XMAILINFO: MJf32pulH481JOyonSMHW8kWaKttrgn4csTxU+iZvEPX0ofa89buxakGZjua4V
	 i6KxRui9GZcf2DtyircQr2RV5ETVGpHihyo7PJmJGhuC2jWe7pMRVeA6b8b5EHznvlGthmvVjmCv
	 oUe8UEkCLGD0Jj7UNFZ0Nml3NRV71cAWceLt62Q4L1AUdk4cz6me8DCHuoQw6H2N7IhPwx6MCr/b
	 ml5tlTvhOVwQ2309ikEYAICRrbcbOv3ZPn6o7YMEtTWmHlC5TXOEiZpHax+a/FaUsv1JO53z4zYg
	 B0NqYA0ryMAtUp1VBoPlzhODpyij/+hXJdzx3htXG9YUoSXppq6WBhvQzv5PJ/Au09ZOgLmzN1nC
	 fjv64qK4D5/7j18JySubqdLGrfazGLOPCJoXdtj+JH7PLKIGvAWklyg7z33JUCS/c5wpgIKdq/rU
	 iexoLEPU0of7PrxPamhCZbjBPM5563zmQIDIGf3bxUMnVSuCXOMiY1B04GGgbPRTF4mDmliHeUjE
	 fWIVJeUqxfQhNIaS0LQR7lPi0MjKU51MPvAnol/chL/A59wEfbQIKyTwJpxZRHZSQ4qQ0S1hhLyq
	 kA/6Gk6tLasDkTNDMUrMopO/i4hlQ1nL2jyDHX1Bja1+afq3oVQd8OrBR3xUk3gO0P5Ue9mfmLHv
	 7KZakcUCvdhoIpYd2bTnDOoLivARqwsHOIqctL+PND2QDdIseSHVveW5+Mf+E3+Qut0fQ9sJIzse
	 Je+qLmlvCTajD1WagHX1qFXs/CIEglwjlCIQzRNMZzGIbC+wpBkh815T+cFQxiYDenPGxQeoa2Zs
	 zogzPVP28X1dqmSLumZhnn+bA+oN4FCs+yvRlHh+3YRq7TC7NEAErGG0YoFQdOJGaH4auKhxZYNa
	 Nqfbs04R5SVZrxX3ymjDFtv8JUkK/koobkmTBaRyU9DnAvC/nf0o8d/+p4fqyGQZgf4rres2fv/y
	 i53C+QgIx86QjG+c5zP75xCmAXR91qVfidPCNH61BBWbqe/H/q/VnhKFI6egSFkYbL8hn/gb3Ffc
	 Q7q4nwXsXoOHLEWRHQzacDCLDmCncCAxwbuHfaTJmm/CE4fO8b1u6hSsQPYb8QOLxSnvarKwC4Ma
	 LqZEOohaeFXSCLQ+Q=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Shuai Liu <847807867@qq.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: fix missing space after comma in legacy flash names
Date: Fri, 23 Oct 2026 17:39:03 +0800
X-OQ-MSGID: <20261023093903.3976761-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023092444.3969022-1-847807867@qq.com>
References: <20261023092444.3969022-1-847807867@qq.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026, Michael Walle wrote:
> Well, that is because they are aligned with all the other entries.
> IMHO this is just unneeded code churn.

Ah, I see it now -- the entries without a separator keep the
second column aligned. I only looked at the checkpatch errors
and missed that. I agree this is not worth churning. Please drop
this patch.

Sorry for the noise.

Best regards,
Shuai Liu

