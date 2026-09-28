Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D732FD1B3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588162; cv=none; b=XuvtwQTSL+Q901EqgQKpoa27I6eGYQYArlNzCktQXYTBVbMDfYBzBnG7CVl39k2/jXcZa2hY0nLWnanuzpJHXR/KMvrq0qJk7B4LX8pX0PaLwrXrGkuDKEHAD+uQWjXBEdaf/WwZDnnx8UFh5NLVH8dERhI2YVCczNz66RKvKyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588162; c=relaxed/simple;
	bh=k9YCAPqaKjXX4GNCCsVVvYnITx3IgopI3KXUorJ383A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMKN4qH7NIOsLBFZNpFV0+Equxk5Qvbbao3AN5ZHLIRN8+liiKa5nSmp4JRZuH6rEhrt/v0jkeieJ3AqV/foaL09evimXQrhFq5qulIeQNHzWonz4p66lKyUmzxJiMVe5+3E3wkB3V9RMR+7y6/iVr1KxwexkqssKghKB5yHotQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKl0PJO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKl0PJO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBF51F000FF;
	Mon, 28 Sep 2026 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588161;
	bh=dVWhvUZ4udNzzI2O+Z+Zp7X6fuO5kTVJSnc0EFUOojg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kKl0PJO3Kd8yidrW8+oG8RxS3SiOONtIcHgHWTk8fvYeKkjsOq1adODKvC5ITUbv5
	 fYxsaUrLOdE3rGmTxyzaxYeh5hJnkbeFI60iRnF8nJ0itf3Pq5rZHPqkFdokbO+V/8
	 f3+bEks3DamUmvHa7GioTnbmlDTWg11AxCdcj5t7iKNWgWHl8PaFGuQnRpTo7GAA4R
	 n4b9tp4Y9dx3w5AMMAQdc6yqyx5kR2REr9T44Lo589kOuMI7iDeUrEFGFL9+IrJV0Y
	 tVlxlu4S7BwDUAo94xwRm73Ej1Nw9u6Y9ogU4EdszFI2WTfPGM99GG2XnGQGmYMBXq
	 tDm3Vv6Fs/6ow==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E1D27F40067;
	Mon, 28 Sep 2026 05:35:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 28 Sep 2026 05:35:59 -0400
X-ME-Sender: <xms:_zS6asOdb8b08MWWdLBI4KHdi22UssM-6kTsMukeoLjNYnf937hgtw>
    <xme:_zS6ao_VCSht2o4ZXBPhCue0--PkP9SCKh8-H2Yw2DLxDxTcymSYOmX6ZQvepNMSD
    N-wn7mUJKgtKrDuMFeZnD9_SK9otEXtATQHBYfkCgSantuY5V3B8Ss>
X-ME-Received: <xmr:_zS6auHQoleAzMi1t3XXD0FIHSRRNjP9C0UZ6owG4hLBvgqp_iIfrXFStStQ>
X-ME-Proxy-Cause: dmFkZTGIi4FnZLUxgFpbg7YF5Kghr5zfaTQEvVZcql5H2Vx1ZYBZOiREELxiJ7q8aYSf6U
    viDB9SDRpfhCubXLFiZ7R2iS/cbCNO9H/ZNfpAU08R8DrRDqkd4u3R1sbtadXYDY342P2Q
    tSo84GdOMiAQ54Cck4ZRi/Obnn+9dMkRpz+myK4e13uDh8MUnwnjoCAUte4WmSyuV72lAp
    w1Sf2FcPmeQz2VIf+24l7+TntyoOYQWS2D0qRJ12rXBCsI/HGCvO8a9RGf9I7VCzzazVuH
    qR1Pn7+Xqg90TjFVmpOKBeAdCoLJYuttUGl3K3raAuzbVJayq8Pa2SWd3osfS05GsYaxiT
    zkyHhnGDb1+rOOfE44hxlW1GmRm6uYZwWyDsT2sNjccXgE5+SJ988Kk8qcHOy82qZO9/Xq
    PtzBY3oR+6rM9bygBPkVd+GWx6eWPIxoR450zTKLqS7rim6mSWBf5XP3ek8pQd8N7+WpfB
    PEAygqnjF34ubHdLM9tzzgyH9tQ6pEw3xocvAgYyEIeQ9TECMbgFUMraxXaldkMuDS6u6Z
    xO9XLJ/vaRTfO/15Wh2HsyBzkOS+VK3lFAKrpZtLhPd7Ucx0jJwfaKzQkrg+yNQXoCfmLq
    OX/+hNHGCuvxiXqb3XEQyEd+5XEpVoyM0ZObwEbpGwvfWISsccXQ7R8xLX4w
X-ME-Proxy: <xmx:_zS6angm2wcOIQtFxGNanog0eys2jbOErhsdG0ZbKsbSUN1FwowQmA>
    <xmx:_zS6ajvz-UwI-7fcIcglxgQaOr9fs30RqjgqbdtlIsU-OSL9tifrNQ>
    <xmx:_zS6aisY0B1v-1EcfK6tJz7_V4yXv-NR-B94Sgnf5wPsLMKhMmGxCQ>
    <xmx:_zS6agEwQzB82Z84-5q5HqAWdirIUPcR8X2jt7IszFPGRyy6suUEeA>
    <xmx:_zS6alMpjf8BRI_zOgVX8DVB7tOZRmA785C8TMd8R-G2Ks3ua_vG88y5>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 05:35:59 -0400 (EDT)
Date: Mon, 28 Sep 2026 11:35:58 +0200
From: Boqun Feng <boqun@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@kernel.org, peterz@infradead.org, lyude@redhat.com,
	radu@rendec.net, jserv@ccns.ncku.edu.tw, marscheng@google.com,
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: Make refcount_interrupt kunit test selectable
Message-ID: <aro0_tA4jfEaPb-r@MacBook-0RXW5>
References: <20260823171721.3059733-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823171721.3059733-1-visitorckw@gmail.com>

On Sun, Aug 23, 2026 at 05:17:21PM +0000, Kuan-Wei Chiu wrote:
> Currently, refcount_interrupt_test is built unconditionally when
> CONFIG_KUNIT is enabled, causing it to run unexpectedly during boot.
> 
> Fix this by introducing CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST so the
> test can be configured independently, following standard kunit
> practices.
> 
> Fixes: 07a88e2bcd5b ("irq: Add KUnit test for refcounted interrupt enable/disable")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Thomas & Peter, gentle ping on this, thank you!

If you rather let me send a PR to tip for v7.4. Please let me know.

Regards,
Boqun

> ---
>  kernel/irq/Kconfig  | 12 ++++++++++++
>  kernel/irq/Makefile |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index 05cba4e16dad..6923f37eaab4 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -150,6 +150,18 @@ config IRQ_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config REFCOUNT_INTERRUPT_KUNIT_TEST
> +	tristate "Test refcounted interrupt enable/disable" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds the kunit tests for the refcounted interrupt
> +	  infrastructure. It verifies the correctness of single, nested,
> +	  and multiple interrupt enable/disable state changes and ensures
> +	  that the underlying reference counting mechanisms work as expected.
> +
> +	  If unsure, say N.
> +
>  endmenu
>  
>  config GENERIC_IRQ_MULTI_HANDLER
> diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> index 44c4d6fc502a..0e5df962a149 100644
> --- a/kernel/irq/Makefile
> +++ b/kernel/irq/Makefile
> @@ -16,4 +16,4 @@ obj-$(CONFIG_SMP) += affinity.o
>  obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
>  obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
>  obj-$(CONFIG_IRQ_KUNIT_TEST) += irq_test.o
> -obj-$(CONFIG_KUNIT) += refcount_interrupt_test.o
> +obj-$(CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST) += refcount_interrupt_test.o
> -- 
> 2.55.0.766.g2966f0265a-goog
> 
