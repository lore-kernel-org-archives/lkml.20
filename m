Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830875;
	b=rY+2Eu700Bf2LkzcgDqfv3wgW6NqMOhbXZdD1TTIoEsL37UtCKcch3zXaD887mRvBp+v
	 aBlUKdJNUY6eaRSFM+dQdjgIO41Zdbprjv6IeO27rmjnr1w6TCSwR7ieSKQ3nzJdZrZ4Z
	 f9zDa6Wt3rzsDtYpByXd961HitMd7WhLkPxey7e88k/nLe4jHb9ipIM2hmn6TcfJoJycP
	 KWStinPYBglmfUWtakzQMvIkwGG4wx/YE1j1QakNOEzggdDWdeCGJJZjQR2o2LOSW464u
	 xPLBffvVCvs7QNLZNKaU4c8Gxot8tZ0Pe72VK0dsTw/5d/Z8Tqtre3/dHKaT4g6fAhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830875;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9gML2L5Gbq54P7rLcSn7y+PNPtfoj3QVb3QDNFtDtJE=;
	b=4ogRl88IokOLZuDlbv2CJFF/DzpMPuitLEK1H1RWG1ieBUYMf8jCiOfwcDrCYk1+Rnmr
	 zrOmD+ip8xtzH8lTD9pRPSo/P2MK8Shu0QHf1baNoR8XEEjAdi/HXT0iXSB36VLhF03Fc
	 eR1x9Nol6fd7lS1bXWOx8hSVtm05FgA47q5HcBfF7IwvBaEy6knjXhxCz0U20fYZ5CNeu
	 xtLo2ruKRQZCaSuHcc9fg/ez0MN8cmnzHsi1B2XbN6ez6//fRhOuVxDxOu1NLxovHllO7
	 VV+BfTwP3ApQNU7cSLJZ42SL6jOBaFgHr0MPmgn/6/WmsW9m3S6CetIEvULgRTOGOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=GVO3ygRD;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AEF606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=GVO3ygRD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792830868; bh=9gML2L5Gbq54P7rLcSn7y+PNPtfoj3QVb3QDNFtDtJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GVO3ygRD90JVyKDZtdD2hVIxQtKgpAOPB84Jh+DyZKqBptw8+qJvCIG/YjcUdYC0/
	 J4ZvJNjIMlOcpvjXS2M0HCh59I8Ddd0KrTifRcSxAiRBFB59Xd2WrLQTF9PCOsNY1Z
	 Gb+LLj4nSWJU7x36KwnrTWrWVw7HZylpg6EH6vBs=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 89A27EC4; Sat, 24 Oct 2026 16:34:26 +0800
X-QQ-mid: xmsmtpt1792830866tp1iiyik9
Message-ID: <tencent_6ED0889B53BFA949D48A8F799467EAD8F706@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ0Fa5cEqh1vaxRXZVHuH/WGo/ayj2JH/VIuGklEn1EQ70Y9VYZ5
	 WnWIt2VKCcqIwpfl1gGxwRhci2dLoPaTW4Sq/SGZevJSWlLtGZpgLU8VuwBrkzzemUYJ86lhjR1J
	 iH/8H5nv5020V2YazYed/1J66HEzQD1YkYWaGASErF40+uvfE29v51Cm8qb3ym2H6DKmye8+3egS
	 sOJ4vxPtyvTz2Qk8eQGQD9YfMIYWLjHEQZet3VfDPVIErH5zMPwWIPeCKtz7bYK0Fo/Nu0JzlTp1
	 dcUHgJw7MH1CcvcgLbA/xfozwnRbuoXK/tgV0+DXXPwVSHG4b5Gdcy0LL5pajvR3VT6WheawnSSZ
	 DIxEscmeG5nu/aIMaZXPe9Jpibs5z1zGVw0ePkLYUdWFzSHOSP0gOKh9rI1K6RiZZ1MxEpK2SATi
	 1/sr5rhiV7Vo+rsxCWxY9qnMQ48qx0qjnHYlDBz8bOkIadAtF36mWcjDeW+7CgMmLP8v/By7GJy2
	 gvhy/iYYXQVzXArrszXWVXHaJZvNDXLxav79qkVk4pCkoUn7yd3ikBKLe9e6I4Ty1VPLx9uVEePt
	 HY6wxXOANhAXo1wM6Z54708Bu6VsECFf9AjASK2JtK2g/9e8PMWwaBhMoG1uKj+62bTdMjlMP1Y/
	 sv3UYbXv6UnyJKJPDiGiQt3rD4W2Chw9Oqci6ZxR4fDSQdxlW+R0rgFBIuJKr9AZpRUtS1YdgXQ/
	 BRC5giBTeWzlg+savbuWdTzV0zmA924vRnBRUUc1R77vAGblgf/7SAOgFu4ag7ytadwWf85UvirN
	 0NjEQrlSX8xq32knofXdiZOTOP9p8eHs2SzXymHhBjD2iGq7sLRGD1kx4VBFaMxXObUz72DHhyGS
	 nv0mKdOQx8uiTLOs+ayo0ZiSmDZHJ9byfO/0RiRdm2CuOPlXS0at7AEGyICzOv847VNdxfHLjNre
	 sQ1AQdvS0PZ6VR7bmx3XTib4gpe/exmjPoummq/vyLDr4E+l7CKOXf9YjSm+PGC8VegrBocw+hB6
	 jGcvrJM/omyjxm/QTFvZENO+10DzA54t0d/n6YlGLkIcsBAXocknngXjEfk6uZ4Oe/mCGbgg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Guikun Yang <yangguikun19@qq.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [BUG] jfs: KASAN use-after-free in diRead() panics the kernel on mount
Date: Sat, 24 Oct 2026 16:34:24 +0800
X-OQ-MSGID: <20261024163424.64996-jfs-yangguikun19@qq.com>
In-Reply-To: <20261024135522.65244-jfs-yangguikun19@qq.com>
References: <20261024135522.65244-jfs-yangguikun19@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Dave,

I need to retract my report from earlier today: it is a duplicate of
1sh1ro's report from October 12 and their follow-up with the reproducer
and root cause.

I did a background search before sending, but my keyword search missed
the original report because its subject line does not mention diRead.
That is my mistake, and I should have found it.  1sh1ro's analysis is
also more complete than mine: they identified the exact window
(jfs_mount_rw(sb, remount=1) freeing sbi->bmap between dbUnmount() and
dbMount()), the exact access (BLKTOAG() reading bmap->db_agl2size), and
they have a working reproducer.  My report only had the KASAN trace from
a fuzzing run, which covers the same race at the same offset.

Please treat 1sh1ro's thread as the authoritative report and disregard
mine.  Sorry for the noise.

Best,
Guikun Yang

