Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C04369A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393667; cv=none; b=jxne1rBHQflVp5nYhAbeIaYT7e/AXZU2H8qhjOyFOmnsVKfO58LGvUGrSXOsKDfqBCuRRmuVhuFEJs36+TLq4xj405BHI+CkVgldGlWkbxEhoyZ1NfwaXWsTg04hKiND/k7QryxV3BIzY2lrC9leU7xYqJZb2t77u9lGjdhiYNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393667; c=relaxed/simple;
	bh=qsX6zz1ndtmCRTmjcexyUqOm8UpUEmHQqqgT/Vy9Yzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLGWBs0vXfcZFR1wiKrd702swWxAkiOt+zJhbT0vi31o0F+2Jo1FvKGJYTtwfwTUTSuSyXRmfLkuE8EtI8Kef9SDnHb/9dfr8xffwXoHH2bjnWxXNENxN8DAWj47jAGV4jabml0lSaV9B593/2v8BzwkPxfSSsoACBjzIWXeUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=wKb1VIfe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GKNcClTS; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="wKb1VIfe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GKNcClTS"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 81A3C1D000E2;
	Wed,  2 Sep 2026 20:01:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 20:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1788393661; x=
	1788480061; bh=EGLeA0H3B16nKwdc/sH6bAzOO5i9L7kMWu7bJRr6Fag=; b=w
	Kb1VIfetmqkMFgyXljnGS6fhI3gx9+FEjR/cyhclPWrBVbC2Ixwl4FIe7J++3vDd
	7QjJe6fRbTneL7oIA2PpAN97QCjuwSpsz8BC8m+035I4AoRoq1LNtZNwya6FrYEf
	wtS1E4V/BSTZd2Ejmg9UI7zX2/iqzsgRc000L0gZRU/4ipIkxFvXJ3q5RqOKO0V8
	IlUDdNPKIVva/AIoU7XqZX/5iIvkYb04rTpFzc3yIVL8JDxEaq8HoAGJLl8cuW51
	17ReG5WuHl0bf8lGpWbAL86tSYvNel4U6KqHBmFJ28rmvf5XrBXLbXtxhpKU7jWW
	RMvyEymlZsSc7+ryZEjXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788393661; x=1788480061; bh=EGLeA0H3B16nKwdc/sH6bAzOO5i9L7kMWu7
	bJRr6Fag=; b=GKNcClTS4Rb2Q4GsqxckTQOS/r2FqCLIuBY4FbOjeVkBjUGdszH
	cXUqHBosuYfk42saFmC3FNkJPkytw0s4rKtV0Fm916FRbND6dsdQyaVvQGrv4Mf7
	CSCuR8zd2e4hzuLyyWgLYhxb9M7YxWHY+BxhboOhNZ0GmmPd7KUwmTzeLAjhuai4
	DmkA/DcPaoIRjqfqSWA2bDDFUEwNcrXfLdUzBlOZS2WpB6+M13mJAVdDOm/jDHnw
	u80WPV60EudUQmIUefBMUHNHNH5+qh9Nlxh4LdVJcRtSgZ1PgD030X2+3jMK0ukf
	rAvYWM3PrJqf5/+Y3y7xyzlLhYg5HILatOA==
X-ME-Sender: <xms:vbiYahemZMvQ4CIpCh9Qf3R7Y4m_hycV7cXxhvwO0KerxSGk7inGxw>
    <xme:vbiYam_lEf9SjliTML0hn1_F5nkJ0oPn7XsTyRo4DYJCSyMQ8LTCvTFTZfgq2pVtW
    vZCxz0-rmUm9J4CJDx18uCIELCuYlbalm77ERog5w0pKyNSskVP9II>
X-ME-Received: <xmr:vbiYatnldd3rEOJXRcs1-jmJnYDj3tm1IqZMQoMYDI4zPa9R1Sy_lCxVMK-itMrFtiNiedB1G2IeVzQtkI4Z5sxO4SXZXg>
X-ME-Proxy-Cause: dmFkZTFCCOg3Wl58M9hdHmQy7LDMutYpNIA8NMRTtvwwJQ6ysqQVOmrmbi7/SA2lqCdmSl
    +cBXYJFEhP1RcYg+wyY5xYYlQqPrKjUk5y5Lswr8tbPZy7sX5i3OIIeT9XVjFUFIJXhNqT
    HgViJfW2SipvcoH2Efeo+alsDZDQ12epVdGkrxR26Dw0aSfPbNL8Svu/HvnZjsJPGyYlDy
    vckp3aKouzCGsvTmlPO21uQTzNIlWgPN+gE7mm6AfRkZvakQw3jVH4eJx5hLoYDw86XnZo
    Dg83QyiIsYywLO5oslfdfYgtKsxSoDmi+ZfoX8y1mzZ63z6+26ynJmgJ7H15jGwnkWxEKu
    GeSP48hzo5nQvZXqDf4Emz4Jd2CGPMp2tWRMefDEAi7v8GL+tMQqCkNs9PgBwdLgtBDacY
    8CkGgNT6SUsv0WwYcJE3QDDJVk6IoJKgz+R6ojw/yPk/VS7reErpmYGyT7YqJ8U8fC7ZK3
    HCE+xaPXAaRWo28VSwilXcihgY6GDXeCanmiH6QeZDsMrbdZcvEkOy2D+xnuQjm/aHVFpK
    ZiEzi/yXfi0QXhTF43tJBl/9CwE0zJETgW3AY41FLlhdVZ71cmwjVSkEtQgY7Lqr/aoUw4
    dhycIL/QCw5omKSzgqL/I9/VOXzb/h6c/Z61y55wznpdq/LjqIsiVWN8GSpg
X-ME-Proxy: <xmx:vbiYao9UUVRn3-vwgMhp-aECt6Ax2IEoqpqzvyVg3jEhhEr59Sb7cA>
    <xmx:vbiYarmEQFwGEIPHuUguFKL1fNiCrjjd6qsEaVSHtvM4nptT16zdiQ>
    <xmx:vbiYal15cWrcXTRNmbmOXmR5lUeu1zPy5LK7ygXEKNqY73KRZ8yr-Q>
    <xmx:vbiYampIADvLgi8dDhDZbd0jldi2muxjGxWGpBCfSMXEdb0lNrt5jQ>
    <xmx:vbiYajhDlYbsvxjbjf8SmxnlQdhbcrpQUmBVjDgg8-o5-FZ9jdEo3l4K>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 20:00:59 -0400 (EDT)
Date: Thu, 3 Sep 2026 09:00:57 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/firewire: nosy-dump: fix input file handle leak
Message-ID: <20260903000057.GB2393579@sakamocchi.jp>
Mail-Followup-To: longlong yan <yanlonglong@kylinos.cn>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20260902023914.959-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902023914.959-1-yanlonglong@kylinos.cn>

Hi,

On Wed, Sep 02, 2026 at 10:39:13AM +0800, longlong yan wrote:
> The input file handle opened via the --input option is leaked on
> multiple exit paths:
> 
> 1. When fopen() for the output file fails, the already-opened input
>    handle is not closed before returning.
> 
> 2. When fread() reaches EOF while reading from the input file, the
>    main loop returns directly, bypassing the cleanup section entirely.
> 
> 3. On normal exit (e.g., SIGINT), the cleanup section closes output
>    and fd but never closes input.
> 
> Fix this by closing the input handle on the output-fopen error path
> and in the cleanup section, and by changing the fread EOF early return
> to a break so that the cleanup section runs.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  tools/firewire/nosy-dump.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to for-next branch.


Thanks

Takashi Sakamoto
