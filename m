Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282916;
	b=vPUbcncMdVZQdLYWd0uMHcDLLEryM5eBsYUPfuvsouAuERCj+XheseTmeF1GYlLEcHc5
	 fCSW/898c2LklUKjlCGHl2KERyBn3YVrNnt4k/7IJ9M0vwqIRjPI4NONL5xW+3EsCZvBY
	 +N2ckVS7Cwu5Qh1OuvVUqqodnsWRuLSDtq0NkdFd7wuSAnLUmJSPrFxQuK44NrUao3HXD
	 3gLmORkPPbfgI6a6AIyqUcgGQBKM3ENU6t6djxkdCktgYywQ6XykWF1HRW4qu0E5cBSBK
	 UpaEyMCv+GnE3w3Uoke5A0XGoK/kel8rZgbLvZHGJnbOKIoel1FCBTLAosYGpqOdvgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282916;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=0ULFcL4e+6n3G3BYTpyQ0Jax9vpvQWSN/L5pCMjIYSk=;
	b=W6BNVqOPJOdEcklBSHSuzv/ZxXD3sKOyTqvNLZ1QXKxzyuidJ7t1PQ+eTW35CXMNc/yW
	 b+axDre6XIq5i5DXHLSLPwnlUzSuYJNLBxJBEcKDqiQ0GX6r/rPN4khaVKk2Hu0OEbhQ3
	 qFiQB4nIVio/ukyztjLyjR+skjfPeex7gNhbml+xJ67+eQYi8HrpH5vyN0z3vTfNuVw5F
	 JVoeQdj7vwRmnXjsNh9j6zuUjN4FADX0OLFb4PenwhJpyYmOgJavJcm8ABm+lL5kV5U+d
	 9vxlx4kE9EFgDa2FPMfTxHhcNRANKjFQZRJmpxn7d4FfHesVgubYzuz3gL9X8Plk3SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s4+F7OlG;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E0B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s4+F7OlG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A3AA1C49F47
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:09:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 374DF60360;
	Thu, 29 Oct 2026 14:08:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58CCB10328365;
	Thu, 29 Oct 2026 15:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793282911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0ULFcL4e+6n3G3BYTpyQ0Jax9vpvQWSN/L5pCMjIYSk=;
	b=s4+F7OlGQdsZG+NGuTyHk4OP3xyyVPb+Kobp+25ay0GxP+/LWoKmslXDRLsgRvcGCm7IjR
	b3PdwmhAipHqKhG4SdWPVxDbG5tmr6xW61x+iS5ry5AUUADq2odGB5bmGLDuk2PbOPgc0Q
	I5cjpG9PibYotzZeNSpWtnA2cLqVxB/q5dk+SIEVoG75v8W3x7InEiUtXFtqUKO2livQNm
	FMn1yhPARNcQL2uisFi3PMBh2/1nnjU9cP9AG8UTWqmZ8clabvWkrkVyIsdgYgVZH/T9Bw
	7pJEEJ6ZbwAqG/gSKdAtfDePhcNXnJnQpKgRqJkTPb5YsEh1hpLrVKJ9L459cg==
Date: Thu, 29 Oct 2026 15:08:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akshat Rawat <akshatrawat095@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rv3028: use sysfs_emit() instead of sprintf()
Message-ID: <179328288491.935369.6481765729463819875.b4-ty@b4>
References: <20261022081242.421-1-akshatrawat095@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022081242.421-1-akshatrawat095@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 22 Oct 2026 08:12:42 +0000, Akshat Rawat wrote:
> Use sysfs_emit() instead of sprintf() in sysfs show callbacks
> (timestamp0_show and timestamp0_count_show) to conform to the
> recommended sysfs attribute formatting guidelines in
> Documentation/filesystems/sysfs.rst.

Applied, thanks!

[1/1] rtc: rv3028: use sysfs_emit() instead of sprintf()
      https://git.kernel.org/abelloni/c/55bb5877494d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
