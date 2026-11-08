Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158674;
	b=BsHsR8HV41O50sWyvesZlU8J8gAkdunYYvQnQK5kvJbeo/rXJvXTLW0mtasgDe0tdIWg
	 ezgdD8vJUFTWz/B4bRYGXW7n5Qt/I4L4MsZEgPfxvval/DgaW5TKqBeUPbUoOqmHNnNQ1
	 fNWXh7kwy7Jxf2ExX0CY0qDu/tvncq7lQ29JDg9PHTG9vhoG2yEWXOYC5sEUPjSHw8ReP
	 DF5MngXuoeeA8Rjg58qp7qjJIbeH3F5iQP85sokSydI1ck9dMW2ynFwfNWPK/fSVLWVx/
	 HXKpTeJkY/vig5sqKETRKqC03s+AB84vSAsgbA11PspvyRk8F4MaKFW7FlhJRaqPF4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158674;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NmyEWJc1Ic7Z/rksgvIEk89eDaTsRIbN9HNjuWwu8cA=;
	b=iW+/sKov/SdiE+8kpSQ3IEwdYXLRNQyzdyu8KzK6gKzU5nsS8ZCJNqoSsSHJbFRmvfWA
	 KfT6Tkwaipy3WV+foH/B5rDNc0TKc24tMDx1jxx4kSzcVRLpN+bwPWY2COoiLb5j1Pvxn
	 1pibP1AU3l6kRpg3nUiwM+3OZ6gI4pix31XreDVjI+GD1wp51AVIRki350+K4eaWHjY09
	 uvnTyjOgvSI3tMP4PX4lZjIR36XK5wg/F34kWjMKWRxIpDftlTXGv4aq/VcdLYIVqjdIC
	 /3by2V4a9/BNobApFneN2Imjy4XxuZYZNMcGrhO8/8Tguq07OrVX+O6Bvzi3vR451Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FFYQAXc1;
	arc=none smtp.remote-ip=203.205.221.210
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76853606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76853606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FFYQAXc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158653; bh=NmyEWJc1Ic7Z/rksgvIEk89eDaTsRIbN9HNjuWwu8cA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FFYQAXc1xWyQuIB8eNGgGZFRoX5FVVTGO/y40V3IEqfHmD2995JverP+VZ+9ns7m9
	 DAmzshq8bAi0d9wShpzOrUFqTt2EkRnPNHDDZjOsormulSp+WWZOsSg3uexDhewceX
	 y8+fOBUETQkhjpwCjJNfYuAS14DYu9HfBoTmteyQ=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158651t44il0cdn
Message-ID: <tencent_8AA2EA5638DD0246FDAA553AD6E31759410A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznPs19ki3w231F8oYPXsRSoFBm+zE6AJTP782SOyUS7n++LFzCih
	 NZFiATXOwMZ2XKgUIgs8aM95A0UE9BIKjaC1HQ53Qo+IiTdh8SPn6XVX5jMl4n8K6BjjDAI2O3Tv
	 F23Nlircw7FAKRQ1EsoibqMHhnz0NbGMBintRwebUYlQdiL04IlDRf5AQHvWsA/n9NtY5/+Fo1MP
	 JDLlO7eVfHh1EmBKLHbuh0yH/j4fdmQwP8nZg99EXHGYAH+QZ8+fqVy2VNzER8HvAB7ggbPUCE+K
	 CxeWkK8Ib+y57VJT6TPXJIDlnbYvYJEdqmKcsFd+yBon6ud+W/3lwt/GChqoHzJuBPo0UqVkb1S9
	 TCqW7I3ulc3PyrodtSz1RUxy4yTJGuRgM3RSD/p+4vBKbDrcSydynZ88+4DhbECDp8JbbhvZLMKZ
	 ikJyxZO1bgqcZLPg7a22Kptd080qH/0Exm8+HoioVHuSg+lHH2oL8XcWTOvYbUvKls8woq0+4/Fr
	 w0h6ODcVTjCga2/hObCwaj2G2Key/DoUmJpBwOwhsUiY0RFqKfAJebcfBqhXTBRDYoRqIZfN+XI8
	 +L2QDb6+VLAzCaX0vIqdOa/PxWt36Zj+JePWM2eDpxONy8uJl1M3tPlVk7iDcUIrV0fvyMUuE3BI
	 Gxjmc5oSdyI5e6GeHsB6Eal8dbE2hjiG0AJqdvp/LF957fI7FZ+vPH3J008+IuqpF08s+nw7XD7y
	 1Zv/cY0wP44AWuM6XPs1fDzW/9fETUA6wOyi76b5dvWbmotdaH0PtPgy/8n0VQDDxBMXIgWn/jQ/
	 Y+jEmodRCFLUTEXlIsaVcZpceEYMv8LC8Sa3uW7s0ku02UFe/cLgMYo03gG++nPkE3vSTloa9Qo2
	 r/aL+fMT/c4ojJ5h6blioZm7dm37nsSPq9kYlA1/Jweweb9rSW7eg3cYtxtLsQ/eeoGPM2FSeTqR
	 Vj1V7J81iM3mnhYLbLUmwsjBrmenJs+JMImCC2Oeu1yWgPp76AoLCBR5wJjYlD8WPgl6dwH//GBL
	 v4hOJufPox5T48dsWT4SSqq03aogLTm0NLsd7eBH98mu1aNqSBA6ohIwhbDfUWlhZsf9tT3yC0Xx
	 0vS0yO
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Jiawen Liu <1298662399@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: atmel-ssc: handle clock enable failure
In-Reply-To: <2026100111-tinwork-unglue-3b65@gregkh>
References: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com> <2026100111-tinwork-unglue-3b65@gregkh>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.11620130792194703406@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Greg,

Thanks for catching this. The Signed-off-by name should match the From line;
I'll use my full name, Jiawen Liu.

I'll recheck the patch against the current tree and the recipient list before
preparing an update.

Thanks,
Jiawen

