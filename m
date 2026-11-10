Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287226;
	b=SkQtfJaSyXgQIozTGT4TKOhfIpNq28a8+1Ejcw/vpKOafxaAWCTM5PafkfcXO657EJBx
	 6sTVUARAzsGXU/aOGySofWqeZEZwtfLm8MVQd2jKI5CYaN4x/K+nj2ew7vYlTp2hJQlyd
	 8K5Awk7irIp7oppJVss9cZ8iuxcr/yR+gwwCGIeddudjq3Mge1MkD5Q1cRCtKf8tgOrED
	 dbyyPhJWJvGzNhrjDa25k75WdbLTO6TuOplh6ae65HpsCVKVfRg41K+PcjEi/cD5SD1Gz
	 mWPU0BGvgzen/pes7k2SggMrcyNB4kTXa2tO7llozRoc/KejWQ7G/jODeu/EJD1me3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2seNUxR80lWFNHMOtGuOcjLvb6hw83oNlRxRNGGUWvE=;
	b=g0vom2wiehOxniMN+zP8uAiG3u4K3uLZtQC4NvdIwTwWOUUI5bAnu19h8m7+G31vdqmb
	 Iah/RrHfZpJ5uZ+yvT1WIC87TTP2M4o7VWnF9QnPPcOZnZL9fkaFhI7LyjXk3gXB+C7Ct
	 StuuRAad0z5Z0mc4iMSPrN4ijgJN2A6+zkdeaZi9I+0mUesXUSSSn5wDdc7peQieUUCKt
	 nd6ML9/X45XHVd3M/yAdQIcbZJQ6ilZhPUoVY1b56jqtNePnde2uvpi5Cqfq00OlHiV0g
	 nfrD7DmIhx80mj4gg0JKTj42+QnrJ3GnPxxcbM7+F9RMTNCc0QD0lR0254V34XltGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EAE606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EAE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so961953f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287224; x=1794892024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2seNUxR80lWFNHMOtGuOcjLvb6hw83oNlRxRNGGUWvE=;
        b=RrHrfSaIVpM2K4HeISySsCLIZtTr3OAmsV/fbhIoDU9kdTR4n3neXbP0Zz05yXyFvu
         E1Ui98TCx5k8HQ7m5cLPKzS+YyC/8LvUyjoC1nIa62L4rx2olkfYSuCWE5dQNGjY36EZ
         fx5rK3W99cyX7FWcmgzvkJbjYc1x0ATkiO8OxONjJWo71U/kChncsbghmWuPOmV6UnZY
         TkSZvDAM+YGF3IYdziOQkbzSMdhQYfIg1MYQnDEnklpG/wddvXRb8qId2/zFt9TpiUMh
         QBd3xiQAllVLE8iGa6Tcjw/EViDA3uetNQbyL4EvD2UlmdG1/CvCqe0tW3w4ia/hntVY
         vibw==
X-Forwarded-Encrypted: i=1; AL+hErFMXWzEYJka0z5NhNAaW7JbW4zOjgiwQ3es+eIB0r7aRmUbm/YWiiG7VYZQ+Bt6uFa6D28Yrl9/K3LHPps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eg7Y3feE7F6Jb23knYMqi3grWJXwXkyQc6RDGe8ZxrRIG2nOS
	T0SE/j32TeRgikeRAVuB+2Gj3TnXZlZrUq0HxEaGByeJg9Hg4Y06jE2U
X-Gm-Gg: AYBFou2JcmjdQFlaAOjtcLezFDYs1OsnTmSjlXIGW3BXWJL8HdxNbBsJ/7FTEhasSF9
	NFtLvIiQxEh1AoNOoS1024Jr0lybXjPm4RqRu305LiuWo1uGmsY/u06UxfwvLdxVeJyt0Fcrul1
	wuadAWwsG16nlt217AUGYx3wHUi3aY69qqV4ed5IOfEeirSm44jZ68WELwW3qUKYRPr0NdD4JPL
	DVx6rb2ErKBxo3d3In6Il0fRa9BNbgLB2TGJ0PxErCKrDndMfcW4rCChHr54sWiCfuZrGBlK8Zb
	V2mODrliC8lp0ea0V4C257WWzKXt3wvnf5T80GZg2cNN+oOgC17Do/ERpBbhsdJX7mx2+noX6zA
	UJvLIqC69ew3x5LR6i6CnG3h2VLuEw2qalqlWLuzzRaFA2rlDERPFXZtz8V/jm3Qih5wDNyA4W+
	BeWSrqXoekxgLkUCXKpON4tqq78mm1ey2IigbVZp6HyBBW5IrDoFtB/aXPCDxVQCpipxUj+S90v
	y4OvM4AIauueP+5ONq5XvbzivlcLlioP+ty6rAzH5+l5oqu2RuReABquo9poNRYS+5Ex0VKoZ/R
	2CoJUihxGOuyNw/XmQPNpnwIq5KU67i/6M1ITATN4y9IY5GgbHf7/bDpWyLZUK3oTWbh2WWNIYF
	wm9rbaPICDkpIcmdDL2f2zoEpGkEa7/NkxC5ABrMsywIX1fG10S42ypflCVE74EOvJeSN7TFluX
	luprHLFDlSIg==
X-Received: by 2002:a05:6000:25fb:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-498305da14amr2288609f8f.45.1794287223902;
        Mon, 09 Nov 2026 21:07:03 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm1332172f8f.20.2026.11.09.21.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:07:03 -0800 (PST)
Date: Tue, 10 Nov 2026 08:06:59 +0300
From: Dan Carpenter <dan@cryspen.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH] rcuscale: Constify struct rcu_scale_ops
Message-ID: <avKmc-690MOAGJc5@stanley.mountain>
References: <3f546f8e102ef271e7d5ac6d8b6a1f44d0fb20cb.1794085327.git.christophe.jaillet@wanadoo.fr>
 <20261108230623.GA3148953@joelbox>
 <2727df26-9f09-48c9-90b5-2d1416c3b2b1@wanadoo.fr>
 <730e60cb-30fd-43a3-8152-543b4ba5878e@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730e60cb-30fd-43a3-8152-543b4ba5878e@paulmck-laptop>

On Mon, Nov 09, 2026 at 10:44:16AM -0800, Paul E. McKenney wrote:
> On Mon, Nov 09, 2026 at 06:32:15PM +0100, Christophe JAILLET wrote:
> > Le 09/11/2026 à 00:06, Joel Fernandes a écrit :
> > > On Sat, Nov 07, 2026 at 10:02:25PM +0100, Christophe JAILLET wrote:
> > > > 'struct rcu_scale_ops' is not modified in this driver.
> > > > 
> > > > Constifying these structures moves some data to a read-only section, so
> > > > increases overall security, especially when the structure holds some
> > > > function pointers.
> > > > 
> > > > On a x86_64, with allmodconfig:
> > > > Before:
> > > > ======
> > > >     text	   data	    bss	    dec	    hex	filename
> > > >    45585	  24946	   2816	  73347	  11e83	kernel/rcu/rcuscale.o
> > > > 
> > > > After:
> > > > =====
> > > >     text	   data	    bss	    dec	    hex	filename
> > > >    46545	  23986	   2816	  73347	  11e83	kernel/rcu/rcuscale.o
> > > > 
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > ---
> > > > Compile tested only.
> > > 
> > > rcuscale is a test kernel module, is it worth adding boilerplate for
> > > non-production code sighting security reasons?
> > 
> > Oups, now I better understand Bradley Morgan comments.
> > 
> > I didn't notice it was a test module.
> > My patch makes no more sense, as it is not hardening runtime, so feel free
> > to just drop it.
> > 
> > Sorry for the noise and not seeing it by myself.
> 
> Although the header comment does say "Read-Copy Update module-based
> scalability-test facility", maybe there is something that should be
> done to more clearly mark code that is not to be used in production.
> And maybe to inform the LLM review bots of this.
> 
> But this is bigger than just RCU.

Christophe has been constify things for years and years.  There is
an argument to be made that it's just the right thing to do whether
this is test code or not.  Someone might copy and paste it, for
example.

Of course, everyone is overloaded with AI.  I feel like normal cleanup
patches are more likely to get NAKed because everyone is just totally
overwhelmed.

regards,
dan carpenter

