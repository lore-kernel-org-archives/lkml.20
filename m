Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533451;
	b=NANHuFXqhYECu4EK0VycJGh/QkBy62QCc0zI1akibG4pzYB6bu87n21fjCx6z2wjJ1G3
	 j8XAhIApakO7RXkbsacduDiCUrXh97Q1HnHDs3Hs7qJo48Xm4JWoO7cLd4/yzyWbAVsyX
	 JyaN0L0SB9CyKm/Rs4T99Y5DuMRe/wO+2d36yZ1Cyet686F8R537//u21f19URIrkfi5A
	 GPR/86ITD1J5ms+b01c+OiMZ86NbDuDbKi0KIssSIBNjYvtR+RHeYDmVERSCimKldKBEC
	 hcNStxCULGVowVtkIv8ckk6AK5Crl6JMEqRDAbnqEXJGC/DS6R3OAinrBtNvIGVyu/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533451;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1biL32O0URscMupcZUKkJxDdoG2Ofnd/Dm3Cof5TZFQ=;
	b=LXIeH87Vz8ovFu6Y9aeKC6f5FlkvSDG49iUb7+GKqfYakrDtYwL6rQ62fBur45j8JbNW
	 bwbgMfmUhUl7HNfWtV6EmFDcDtnZP2ut7SXzKlf000b7mEFs4NRTSnkOiVtL16y2th1K8
	 CIOvHb6tDHw8nZd3abzMRmHp4U5V1ObIoThPu+68E9kNyiZ0MsguUzLk/WZ0VhWEtr5Cj
	 UpMsWhhLHKxd9w4owtA0W6ChYrXloqX3hJD8NAG7k9cTP+I1tIjRcnbe2yRVv5OI1YaDl
	 WGkytfBDwxCXOROyOTFBL/XgUgDCLE9MOGcliRQpIaXrYenmuf7eradRtOw4qooUk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=lBRnV7mV;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99E606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D99E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=lBRnV7mV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792533438; bh=1biL32O0URscMupcZUKkJxDdoG2Ofnd/Dm3Cof5TZFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lBRnV7mVfrW7VswgoXZznyYkjoATiYslPUS46JaekVe5f2Ra4TxGR2xm9W+2jvyX8
	 GjtGmnW5ttmzvvqWoJGBPoURKxpCkmQtSjWwDPxoT42jmcilC1aCMeadlVfTbPYfEd
	 c2KWQmy8X8rS2/8qeqzMOrkfTIU0G8DSqf4WcuOk=
Received: from localhost.localdomain ([223.104.162.184])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E5019018; Wed, 21 Oct 2026 05:57:16 +0800
X-QQ-mid: xmsmtpt1792533436tnhh6uyor
Message-ID: <tencent_965A48896102A91E4AAB7D27396396967508@qq.com>
X-QQ-XMAILINFO: NVgpBExadli5wLHnwMJlroZsmHF7koQ7QZnu6YJyU//I3xTKR+Z+4RnmIJzNhl
	 I/UwCFcwwNaR/98pmvj4lzlcCeMTK1l7Sc8IpXnERXrqKgVYvOiufXEpLNjNkNQLdpH+2jLI4FDJ
	 sBCCDSeIBcaltnTK9Q4BS3KM2pnQo7oSLpmhlUJfQY9Ir4V4dhZg1hwL/WHnAIJsjA9X2PqFnSdR
	 bKratYXEk2Anm/sSyKWM6xMSNU9VDkbbnhVsPhFr3vrrS7tUchOtQC4MGFnomvedhxCUg+mUw8Y8
	 WpBvCdwoeKY2Zms6v5KA7JVnJgJBjBHI6U5oAgg+FnnPHwLcnEYbrSZ9eQXttOj0XX09O+V/KFXe
	 lhOKVN1HqNbR9uB5IY1ZGZNtjlG5OJgyyDE0det43aUp5esWkoCttU/uHyORIJp+jQc9vcyt6YG/
	 BtfBPkfjLERW0tXIhBwh57DntvoG3VX5VE70QG3InO5eYTjTRv0C5ZgtAJdtO+Okm9IMWwfO7sNh
	 dTzckap+WZ3gNe7QoKSjZeZ1lp+TnyNSmDzpF5fAKgMW7VlLyKs9gqSjakLeZRKQ2MBFRDN9LEoR
	 9eUXoxJ/LQdpmXR71yR/4C7MauIx+8Jhkjm4x4nTn6Tw24ci2yIqMgtHi3COu2W59lOu6CNIkTf5
	 S2RHowRa4r1aEA8iK5f1tFpDW8t/+vH5kaXoIplTu+/0qIJZyebD61IjhYtiH6pzIh7pGb75oqk9
	 aFUmZkiTsI4f22EC2zA5/fZUB0zBMN1gz6TJghclFqVKFljMa/ECeCDE5Rzf6GxaR0MVhWYdbOxS
	 BcsPy1eaK8y2rQ9TvR4xjpRdp0fdjgC6IkA5yMiXYNEOI5lLW5/eDf6gLB2QvimYei3cpFGptV7d
	 kV69ts7MNx0inwEkgHrIqzIhx8tpmMvw73FJZV5mY/dgWuPGpQ3D9/9PXm9AYVIY0AaUWTbANfFK
	 KBuR03cDFO7CZZ3v/AhzAq7k+eA1hvdlVQLYl+EZgq5+rVIveWjgJbCNnnK+sU4NQAz3gzxrqhVV
	 FgDnPIe6M2dKTxusx8/bgTwYWTiJUGAK54I0g3Vs3JDoVExyJamWG/HYFteQk23QMyMeLFYhqqfo
	 Gv+rcB3ncwKf2h9arofdoyQuJ0wA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Ye Mingxuan <level_zero@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers/base: return bus_add_driver() errors
Date: Wed, 21 Oct 2026 05:57:15 +0800
X-OQ-MSGID: <20261020215715.396-1-level_zero@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026102017-irate-stalling-aba6@gregkh>
References: <2026102017-irate-stalling-aba6@gregkh>
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

Hi Greg,

Sorry for the flood of identical messages you just received - that was my
sending script going wrong, not an intentional resend. It is stopped now.

My full name is Ye Mingxuan, and the two questions you raised were
answered in my earlier reply: the patch is being dropped.

Sorry again for the noise.

Ye Mingxuan

