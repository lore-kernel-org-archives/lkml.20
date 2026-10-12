Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D014499AA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796661; cv=none; b=JtJnt7Fz0vcPaj++TcA1xvpOcIvF4+fs5QPGkFoNJcrTAXNnhNK99N/fk0x6MJWPI9VvkY/Thw4Z5dogtAHUT1G/SP70mKjuF1xWTWIorF6c1SYiwBTIUaVrL0rKAprDxBH8jzpzcezzdOSmSg/izhdIPgwN14W2a+RlNt2L6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796661; c=relaxed/simple;
	bh=vvu0r8CNgLquCqjXc2EUudX85AHvSHWoKB7SQGnc4io=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CRrTcW50gx2ZATJm7vIo5Yj0OoxGLfbY25tljttN1OGkUKaFkAAa70CpgrZuTOaim273/Q4iWMHmZt135hMk3SYe7wO25mntnT8zY7NOlxIqVRtdpxiMTbyf46v7tpVKafShsYGfTE3mUWY6Y/QdOOXpeVhz7Y5l+TZbvsxGGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iDT5rFMt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W35bFjKf; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iDT5rFMt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W35bFjKf"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id E9C0CEC0822
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:17:38 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 12 Oct 2026 05:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791796656;
	 x=1791883056; bh=GJY0qHfhdj9lHENat8tBveKPiLmpddTE5X7F/5JKHlw=; b=
	iDT5rFMtIABrxoUiQ7QdTflV2Ff5aTe9/kl0gz8FxvlMRXhSCtvg0XODUpvSSQBY
	bIxXhN+ESwc1ha5UTyuTbvgHnNpQk9GxGfrZAQm/Q9FziZ1/uEjnB82aPeAAo0kN
	Jbp6fTeO4BiVPAOmALuYg+IZffqUU53zZdwnQ5tiB4kBE4sSUjp6Dt6//Mdmc2qz
	xbOyBN92z6QWX/hasYtUhmUa0E6a55Zf8aK3lTcmX8+DZPXNXQEdtYDAJDql8ygX
	ULPfzQos4UQv+ixKuKw4mhKstyiKuvrjfaa8IBUCXStS5/z+ZnDE2qE/69TC37Bg
	3K6z4bzb3Gls6LRebiYs3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791796656; x=
	1791883056; bh=GJY0qHfhdj9lHENat8tBveKPiLmpddTE5X7F/5JKHlw=; b=W
	35bFjKfIiqWzVZrMg8n+HWt9LIaMj5y3vow0bSbYfcc0N8X/uK4OSnZw/zyzjY85
	CVdhx2VyTwzpLEpepAXnw9k2UY7VFVsV3VLpwjcB/9O2FAG6sJpFMfzN9a++upPP
	Q4fIWds2d+2cRctOcVEY2OCgHudxzQclvl+w/Mt81/jGI4Vrgu1huNqS2I8zpNSZ
	ltPt+7MyTMauMJIfxLdDMdB5bBmGEcpcQXr0U2JjCb0cs/YfEJN8ycGtfYbrLzPE
	26WA3ShAn3OG9VJV2QOlNZGqAKtsy0hAoA+P1XlkdfVWukDvILuLHtTIA9nQAUxX
	MND6piYESn/pctuaHBmkQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791796656; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:PXs/GwUY8ebZ7b1z7DMcC6p4OVMxrxbCdIkXcU/ttnB84WG
	CMHMnaqcY4EPhc4NLOssJ/0TVCmsJD3AhPladhGSZkZduqWIeiBdOCv4a1BhuVr6
	G9tckOoOOGwjI2gE9T7Y8FcKQAPrS82PLcahnLUF7Woi9Tz+vrAH+CvV4BMkai1S
	nJ6NL9dqEd+irRX6sw+EIbSc/+kcFC45Z5eHkl0n2rbJQYhbZipyEaJR/4evkTC4
	cXrB/sh/sHwUY664Rty3aUPfic6+Epu/vC0xsa+11Pc3Kdc0y0vFNlAzXlMN9Tdl
	qLVhN+Hrtv5oZXbYAopprFxbF9NCwynjs/4oDKQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bVtpMSKtpLhAe+mMBBoQbWPIbks4fgup1XAJvD3vbco=:vvu0r8CNgLquCqjXc2EUudX85AHvSHWoKB7SQGnc4io=;
X-ME-Sender: <xms:raXMaozfnJWk_rRv2n0uzJiOVbUB5WZq7bgXZRTChT4xLQ3R1N6AnA>
    <xme:raXManHKQf0exSld_99MEYoRwfOzXPUu4ZzDIZ26bKWLUWrbVPj2DV3a7vdGkDcKk
    TBY7CN933x-CLFE0SDRvEMpxhIzA9jvAPPXmAjj0Ayt5p7A-vxrUwB_>
X-ME-Proxy-Cause: dmFkZTFrHEGwKBdVR8IwyDUhNgBLm/x6Ectrg5hjHEv4JpB9TqYBiUC4MIz/WeB/VY+cav
    bPTsUM3S7qwhTFTfV8wWYPu7WnJ/9SVdOg/ka9qBCp9p8r+/Ps3fHFlTE1M7H80I11Mi2K
    hFYAqlQep0Z2JoB0Q6mut7vLvApSpCXTxDx6Ld/9VH/ErXV2gMCrz4TNnfXy5k9qJfw34e
    nY5VTAt8Cf7w+d7m/8+HQM4omRGrcopizMeaD5fTkJjEH+Pid/kvF9V9R87faGzSpFU4Ey
    mPnF9KagJocqP6aLsbL1Rb087DI7j6rbs+k8YEK4gkIpo3+d+zQD1/PNZc6flKvtoLERtm
    IpDxb290wPo7UZ/ZnQPV8EQIstcOYP76q6FDIoSWNQdUBXWfWokrwWSd5Rqd7JdN7NAwNd
    0dyX/gisWLWv7ye2UhF696VRVx+R2fxqARHS5Isvj+I78Jt3XQlwApw0Wyd9oHmz/W5J5V
    tDQaoft1Ky6Y/DGu628KNGev9NdHVksY7rH+6Sdh/XVJHKl8+sAG5mACwBXsLt9aLsQxrf
    nH4Dy33QhCcoOH3ekNTYcELNc3uhBpGcbwweOfsTVKb4F4S66Cd0l5hxGkbYnZDvD/I7+G
    ryBljAMjn+lfH985e81O9hCBLjHH0jhj2mFHoG3ti0+dPi5iz3WdrnQlxr0w
X-ME-Proxy: <xmx:r6XMakkke45n4IRYvHAofzWv47KztiwMtx0P6hkjYCCbHL9Ki8TbZw>
    <xmx:r6XManhKxQU7R-Usv3JT8lK-DnsRMBiRB9cj4mGYz_TKWgKlKPGzLw>
    <xmx:r6XMasffS7WYDmJbsRdsoVjcnkj3OucT7u3v38Nz7NCwV_UbqDd6Bw>
    <xmx:r6XManiBvB0j6rqLAOagmsSbGvkFMPKm4mDKqaj8C1Mve6uiPqMAkA>
    <xmx:sKXMag1JNXA3QvxkXkraEhiRwg_RGFjjf4R7G8pRfkoDDk9M9PAVatDC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C253632A0093; Mon, 12 Oct 2026 05:17:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Anz6JKCoHeJg
Date: Mon, 12 Oct 2026 11:17:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org
Message-Id: <8f4ca3ff-8a71-4ab7-a442-9ba38ec74c63@app.fastmail.com>
In-Reply-To: <20261003144629.GA929824@rayden>
References: <20261003144629.GA929824@rayden>
Subject: Re: [GIT PULL] TEE fix for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 16:46, Jens Wiklander wrote:
> Hello soc maintainers,
>
> Please pull this small fix for the TEE subsystem. I've only had the patch
> in linux-next for a day, but it has passed my local smoke tests.
>

Hi Jens,

It looks like the patchwork bot missed that I merged this one, I have
now marked it as mainlined in patchwork as it was part of last week's
pull request already.

     Arnd
