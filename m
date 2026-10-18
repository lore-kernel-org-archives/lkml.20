Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E58348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297614; cv=none; b=p1M7Iugk84XPUkzjuoc0nr2BC+r2rXY+4QUIMdlFud+iDvmjsp1EPtHCdWYEhJqXoAhPDy8s0X0eltRzLQq2GN33mb7gNhx7BYX0ZE20Getl55/QFLw4EKgS5SGAL9YHpvFo2bXXtKiPbJi2uZOlG/cq1X1rapXlPwVUa/dfgEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297614; c=relaxed/simple;
	bh=5EnDGBn5faWs0vSedVcIRR2J0uhxk1il75PwY60EzeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvs2bMEzxbTTllS4fdv+B1tRtaKHNaF3fPlfmWOOodgrmxnn8Lrk00v6D/V4xtAJoRzf4KqeEBwiLs4IYlYioAErVH4rk6DfbCDwV5KGTMsovpYtt4jv4QM6jFEBLJ1txskAoS68jB4JE1o/7r6Vjnjxm8C6Kgc9Y5p51aW8G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=F4YwZFkM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MqeGKKz0; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="F4YwZFkM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MqeGKKz0"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F16F37A009D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:26:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 18 Oct 2026 00:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792297610; x=
	1792384010; bh=Ugg2becpbh+5fuknS8AUkWrLcVCmRKyi5cr63rP4LSs=; b=F
	4YwZFkMEvv1HTZrkvFWpsdCD+oL+QbcvSq9e9WCigX9Np3Iq/m6gQSmC7Jr81Luy
	d1X7tezB7FgtctWBjng3z+85kf91rX46IfyWxzCgOh+w6CYBMjl4XZKNP64z697G
	EqP7XRzZv7Aw/T5SbqdH0WOPHZocFo9zGUVo1lQHIJxfsx48Oiuu+F5+Pw301zC1
	LypyKirTU6DK9XAjTgQwWK8qP0Rev2rWmJS0wU3EuaFYhuqch6DovvR4F5QCOimD
	78qKyUoVw8Z6WbqNSE+s/t9DDOFoUdBzkDyHqRB7qGQ2qcxlzbm7Ar2lIksnVhsp
	BAEicALY64+Mv0xL5FgNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792297610; x=1792384010; bh=Ugg2becpbh+5fuknS8AUkWrLcVCmRKyi5cr
	63rP4LSs=; b=MqeGKKz0mexoO4BvghC3cXwYQx3paBYZNPSp65LMJab2eIc72Ml
	UP9rr1bmO3YVDZG+SYS4EhuMCuDrjbEaA0TWPTsWqDAXlYm+3L/+LBdzozMdUvbi
	JN7AFGDZbFerrHjogjD74r3A2ATcbXHsbdkICJEaK42yuGKH5hrudD7ro4Ej0nKe
	GmDUruHC92QH2JE0vWMmA5RwiCYiv5sdZGD9f48HupFL910E6XgSmGkcRFf24IOR
	mJXubAC0qKXYJMXzH3lqo0S0wAU/28qUxArCLk7bi+v1owuuSvydYK+EDPAL5dI/
	qDvTjmCGlJjFqyF6JGE+m+jVf++blvvf2WQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792297610; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:IpbVO6QHQp7j9rAl6Hpaew3y2pwvLVBohe8g/boRU/yuz3B
	4IENk7SHINjYq3kv0ck5KfYZKqQKzmbq6V21qbMOWF8dIll4Hqm2nYzNV7mGoEEm
	O12XHhdCfXZCVLsc2mbFmhi3xXQRD/DsVwzpEuTL/PUGQdBMn7+S8ecQRfG35zI/
	H4TJnD2bBdmsOn6Uu+Ola0QDK9Pj76E7nphem7uCK7+riwAXDg6Rwe6eLQoDXVb0
	l5SU6XcUq9AYB8P7cHnP73bmi8ZS0vkyfIkQ/YJAfzwEl6ilmM5CTicwKqZgLAtU
	QpwOKBm0Qy855gWpuh8ygvAVc2cxbWdlZzCRKPw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:0oMd52GJ9TNmvrB5Ot3oU9AcAbXv+Z57eS/5CkfW+Xk=:5EnDGBn5faWs0vSedVcIRR2J0uhxk1il75PwY60EzeQ=;
X-ME-Sender: <xms:ikrUaiuWg0_K5BFj9K4kh18qJiBgRhGFmVauNVEpU85PTrNL1ZG6NA>
    <xme:ikrUalbbb_UToSlEZdRAdghmn2qVm2kA8sGFmV5HNDM04alxgd8Py_376kmDMXLx8
    HRWxF4HT6yzeHhPe71TvpgGA377Nnh8WJ7_HF2-G_HJSNhFK_tjZ6X9>
X-ME-Received: <xmr:ikrUalUlvrBr_--rYfnfKoN_x-9WDLLu1TwobSOzz0Gwagcm4OWzUcOb1B-y8EY52xICuHDz-gpUXSTYUtfxzRMbh4tk>
X-ME-Proxy-Cause: dmFkZTGBcbqyQHiO4G2NBSu/U+9eiMuDmGEZPc4eXMqRfJVtpQ2bRMCLboO2W3nzSGR+x4
    NT1FiKWvoCojPJzDc0gfC6YHU872V2vqo1Q5lga6J7DxbwzUY14vwIG6koKyKpo2FoSr0e
    9lLj9+BtUV6QiMt+ru0WHPZzgEdLARJRgt9loxAGxVPcCgEvlaWG0tc5LtRbEv8FIjq/P8
    5WkvsJGRPUQB9Ht7ly8TDdnF3XyyOTcfBDz1B5gNPF5h/r+OpNxkVB0pQIopWt0NbbeHc7
    z6X3uEtXm/R62bVm0ZELJw4lamFtASvqLmMZuHPepaDAvyY+qSxJFJhXOzdO4fCAYIcQTT
    9xRJlJr8ydjXEhW/T/DM9cu3odjxQ0XpiVHDY5vAXMp9wL4auYJB5TR2ujhv0Zfo6lHEUr
    CxonlXIbSqHVkrSbLRBil9sXQmLDBpXnWHtXFDPMN8pObKKqO6AFdv3oRIed+BR7cCh2qM
    d5cr7KTg/wx+gtKE6ij0ouRxTLvPX2Q7cm31ISVoHZixnMVLpuXDVU7dGITyTjXZw7PJIA
    gkgkGfMrUjt2WoOCXMZwtezzBvK4hmpfqTpwyBMnrIYFpI/CvRIjHK0BtHwePqgZnjRuEv
    qxQW9Hrjd74VCrET4x1YP0MBXgfk9hJspA/KPWPc+tJPk7ojfXJ4MaCYzyjA
X-ME-Proxy: <xmx:ikrUap4udNRQCRzsPaiSzNXStmk5tI1V4BC0aHlvJQ9seyPGPnjYaQ>
    <xmx:ikrUagiAlrAyKuYAX6K9MHCHhWy7BRGohWVjqYcT5hhdV1coQ8FA-g>
    <xmx:ikrUagerTRDWVe2DR9LtVO1fYOOLxQc2JZjDGEtppj12RTSyfFcZ6w>
    <xmx:ikrUalckrKlTpoZITlYbYNgA29va19B24WLR0XpWMT7fN0ubikGugg>
    <xmx:ikrUamD2F-QpJ7nDkAp2iJCtw3ySaZzNVXBej_BrTdvg7xRrE7_ul-18>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 00:26:49 -0400 (EDT)
Date: Sun, 18 Oct 2026 13:26:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firewire: core: remove unnecessary work cancellation
Message-ID: <20261018042647.GA299334@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261017153339.267337-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017153339.267337-1-o-takashi@sakamocchi.jp>

On Sun, Oct 18, 2026 at 12:33:37AM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> The error callback work is scheduled only after the transaction instance
> has been removed from the pending list, making it pointless to cancel
> the work by iterating over the list.
> 
> This series removes the unnecessary cancellation and uses the existing
> helper function to schedule error callbacks.
> 
> 
> Takashi Sakamoto (2):
>   firewire: core: don't disable error work for transaction
>   firewire: core: reuse helper function for scheduling error callbacks
> 
>  drivers/firewire/core-transaction.c | 30 +++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
