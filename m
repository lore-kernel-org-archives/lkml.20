Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254835;
	b=1wIJsh1DQLa+4qOMa07Z2UZlKdyTsm6m6CkQ9ZgztxSmh0QHW3X8bnB2F1TNKLS5EtTb
	 mfAlpFt8mBB1gOrXFmvRS7wpqCqUf7QSTX8Zy9WrTXRPXNY7+qNGOe/XbD8y/OpijreK1
	 pogO0EN2g0Kwxdj3IoFcOF/vG9gCeKu0HHpqspEZkmF921OGgy//GN1Z2X1GJ/Faci2hQ
	 Nn+/TCfBXZLTYcQ8RwPFfKyASBnry4TkmyvssOXfY6y7vpw9WcpoX9wk6NOtTRauS49J5
	 Fy4DSAHg871jkKh0pKzo3PjHgk/XMU5SMkmxmUD8b74HKZ7GKRtRKhuVAKoqsco26Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1DJvgiIz6E4OS/CDgh0DIMI/tXdEJjGu7xdWQ6OMopY=;
	b=jCeqhaUiZUknqVJLF2C19GA2YvQizdSGDFdD45XujLL7JLD5scSTGDPC36MvV9qXTup5
	 j8ZaznlJXYNgEY3lWQ+zsNIdbQYtzkvM6ZFnsKr8l0wBEcwd4XPhGt/JiuNrB4qYiT8hT
	 sHvOwm1CL5sLlBbP8nEyj+CHLhS1C2A0BW8AKiR09V82SEMA0ReAjC3OuozEjtDLPsj8H
	 ppqHAaw4106JPzxF2rLeNknoqqsQNAuSZRmmFOWepvewb5yWsQqnJCKZADrSVBDqvFFKF
	 VOLdER5tjZk4OJtNx7T6lqPyaIfziZnTpeeXf+Wa+PGER8ZmhJWd4iy5QWbSHD46bWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=j5gazHQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22D606A31A;
	Thu, 29 Oct 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=j5gazHQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930AD1F01825;
	Thu, 29 Oct 2026 06:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793254834;
	bh=1DJvgiIz6E4OS/CDgh0DIMI/tXdEJjGu7xdWQ6OMopY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j5gazHQfTHIM2FoD0n+ncl2TB3n9lc4acU4JyoOwzF4zrItU7wpsCz2t6Nwc8HCFB
	 UZeCwdI76vM4PuHzuVyI7Iu1HkdGblZ6VZQi2agJqAOrM9KVEC9Hpa2OVpEYjicOmp
	 YY5yQH0eGwbBRc4RsK5JoPxSAxymQZZUF7qwHw8I=
Date: Thu, 29 Oct 2026 07:20:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
Message-ID: <2026102952-brussels-amply-5bc7@gregkh>
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>
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
In-Reply-To: <485f76be-cd91-413c-afda-2f7ec37f2d29@oss.qualcomm.com>

On Thu, Oct 29, 2026 at 12:40:06AM +0530, Faisal Hassan wrote:
> Hi all,
> 
> A gentle ping on this v2 when you get a chance.

What is "this"?

And it's the middle of the roughest merge window we've seen in a long
time, please be patient and help out with patch reviews.

greg k-h
