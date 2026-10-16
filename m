Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32943E49B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145067; cv=none; b=TqHC6jrssZnxrbOeWx2GxbN03uJcNKYndRdRoqo2nINctjPEg4LSCULRO8BIQy4b8uXas9UysTv9wsIV7nb9z/XJVOjOiWdcA3N9EZMoUJMisLM+ewxgXzmwPek0hL4Yw/OHI5Id49ahmTAj7+XOGcOSLvKhRgt9fW7rmZwL9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145067; c=relaxed/simple;
	bh=6v7SbVBPbHvuWoMOBe6FaMRmIs3WIREG30fp+deFYpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dueR8E8V/zLWABAeXjiwZ7zbWpiDOba9cnO0DqRB97xaSTVAmvhiW2imlyE2VfFcSaJNZdaXK7XJ9VOeFxlpc7Fwhlw3FnWIyoeS4YdrOnEQExAtpL0/VFe9KlzNxXDZDqC4yaMetRI1OJcPRLW1T2P9GGJKplHNrbOv7OeglBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srdof7GX; arc=none smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srdof7GX"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a406d7afa8so1411679a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145057; x=1792749857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Du4B17GN+QveKazUySHoKkQedCMgGeIDGXNO9kfFt8=;
        b=Srdof7GXuGtm9Dihuj0/avuufz9dZYOpcEopU9FVIduTI9u4EaP9AxDS8d3bNZgmDV
         1v/p7sIyzC3htjozlIDoF5rn47ghPBhRcyAsYLgGmyRMQ8KfhJygBABfVqB9U48PwEcc
         ljCx8Zz8YqhagGhsbeMxA2eutTHmIQOSiWcRpy7aaz3Kwn5ii2U/JwIAjeAI/UP4G5OL
         GohOP/nVn/8QaiKn3cDwJgZtgHY+uUgqv9RCqH+t45yDy72FAMelyyDkA2TXX2VEgo2M
         Vn8514RlxT8/cleH9fvaF/JALMtDnrCU3qHrXJtrYgs6XIkX15qaZNCaJoNF7YpOxFyR
         96ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145057; x=1792749857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Du4B17GN+QveKazUySHoKkQedCMgGeIDGXNO9kfFt8=;
        b=N5lu36RGjFrVt+c6tg75B4LBpubM1fN/6eZn5460DOMMqeUJ1zabsYZicHuR6XJOfN
         aIU+Wtm4ChFWQlDOdDYxWqRxp0puSx4EKoYvTiz5w+wXwLw4wu64A8+1oCbBYY/AMF99
         oMpiZqaRu+sRGVup7uxVqeLOYxiMlrdXQcG+k6k/jtU+QhSSxX/zeXp+dtMf7GhJH2/p
         QUns7th0XyKXs2DsTdCKnQjvSZpgDXfoVJoWs2BwFn6vElV+XMvsoVwkB8kkiRlWWNNA
         AUv6DECW/Ka1aO++7APRlDphU2GsCnPiBLi/JMafBkIU9EOyShliqXibgQE5YZuArgxv
         fCPw==
X-Forwarded-Encrypted: i=1; AKwUvBy4iIKZVEaQ9bdC2WPDcGm8/najE7pkyioaV9kJF4BQMDSoOu8VHoE0uhyXXm0SwUnC3cfy/Is9YVkhj40=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKxu0t2+kBHGOGOxk74OrnkpjesmQ16fVixQL+vaHllSjMNHiO
	1uPnmc7aKi+G/QvoxzS4KBFG/cfAwXptUiBgCvVVFb33UQcXrzVlKyhs
X-Gm-Gg: AYBFou2dqbcWG80EzbrKNSkCovKM5fsHDZCx5qHZjGyGWMPLA5L97dgz2OkZpYEmlm+
	y/BPkxpkFbknh2kaZKx0UjWLqrqm8RvcCf2/5L0kG5f38mfTQGwbcqgOi99hN9M1QTlwmkVY+Mw
	c5B5ZTgC63K9e2HkLbLVmxqhG5qCi5+26++ZYoevqFrRgEzrWeMgEvUIuN90dNg4yYxG2j1QL2A
	KDBg3JHrAfcbr5xETfB8Keu0W4lfqk2PHR+6ainxOBaa4J0C7gyExOU3qQ2UykS5P31uWlbilFe
	8APX+blT+OhxXw/VODqtee7r1YJ2X3dwX7zajoQC2TNx4IiAT4x3GEiYfT2eT4eEqzuCncEYD7F
	EW7QmN300BCs1GfgNpWNT1Fiz1BOnIjjh4rsL/OphdUWGI8Fkm3Qi0lJQE5dbo6GMdjoji79u1f
	THY9Yt8SuWUOprQBtkurh75iWW1tbaHOcNd0Lgh23jE2OwUclqPYAYrKhBWcCXNLylC2+4m4tsO
	fT8QvKtRH6kOZo6uUPsnbLO24NaaV56cRh3YWBYLezY/0ZX8/96mQ4AE8W28tDI459ASU2gifa2
	Xt0fJ53P877TkCBVZ5DMptl4iA==
X-Received: by 2002:a17:907:3d0f:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c31a9ff4c22mr1864689766b.9.1792145057089;
        Fri, 16 Oct 2026 03:04:17 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcae3sm57098966b.57.2026.10.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:04:16 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:04:14 +0200
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <atH2njvkxHjq_75E@thi-server.fritz.box>
References: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
 <20261015081127.1566244-2-thi.zirnstein@gmail.com>
 <atFf1ZbNi29Lbdbb@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atFf1ZbNi29Lbdbb@zenone.zhora.eu>

Hi Andi, 

Thanks for your review and feedback.

On Fri, Oct 16, 2026 at 01:51:35AM +0200, Andi Shyti wrote:
> Hi Thilo,
> 
> On Thu, Oct 15, 2026 at 10:11:27AM +0200, Thilo Zirnstein wrote:
> > Add a function for clearing the bnb bit,
> > It waits for all preconditions before clearing the bnb bit or times out.
> > 
> > Tested on Zynqmp dev board with some custom logic.
> > Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> > 
> 
> Please, don't leave blank lines between tags. Moreover in this
> case I don't need your Tested-by, I believe you tested your patch
> before sending.

Ack

> 
> > Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> 
> I'd need here an ack from Michal.

Ok, but this is nothing i can steer somehow - right ? 

> 
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
> >  1 file changed, 33 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index 5e397a7e63f6..da9cedb86f94 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -230,7 +230,9 @@ static const struct timing_regs timing_reg_values[] = {
> >  
> >  #define XIIC_RESET_MASK             0xAUL
> >  
> > -#define XIIC_PM_TIMEOUT		1000	/* ms */
> > +#define XIIC_PM_TIMEOUT 1000 /* ms */
> 
> Why this change?

Unintentionally, :/ 

> 
> > +/* timeout waiting for bus busy */
> > +#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))
> 
> I don't see much benefit from this define as it's used only once.
> It just makes it more difficult to read.

I think it is a question of personal preference,  
I prefer to read a meaningfull name instead of a "magical" number. 
The driver code has some other defines which are just used one time
( XIIC_PM_TIMEOUT, XIIC_XFER_TIMEOUT_US ), so it fits to the code base too. 

If you not insist, i keep it.

> 
> >  /* timeout waiting for the controller to respond */
> >  #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
> >  /* timeout waiting for the controller finish transfers */
> > @@ -392,6 +394,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
> >  	return 0;
> >  }
> >  
> > +static int xiic_clear_en_bnb(struct xiic_i2c *i2c)
> 
> Why do you need to return an error value if you ignore it
> everywhere?
> 
> > +{
> > +	u8 sr = 0, isr = 0;
> > +	unsigned long timeout;
> > +
> > +	timeout = jiffies + XIIC_BB_TIMEOUT;
> > +	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
> > +		(isr & XIIC_INTR_BNB_MASK);
> > +		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {
> 
> this for loop is quite ugly. I believe that with a do...while()
> you can write a clearer code.

Ack, I can get rid of this whole loop if using 
read_poll_timeout_atomic()
A readback after clearing the bit is not needed.

> 
> > +
> > +		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
> > +		if (sr & XIIC_SR_BUS_BUSY_MASK)
> > +			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
> > +
> > +		if (time_after(jiffies, timeout)) {
> 
> If this is called in a context where interrupts are disabled,
> jiffies might not be incremented and you end up looping forever.
> How about using read_poll_timeout_atomic() instead?

Ack, good catch, i will fix that.

> 
> > +			dev_err(i2c->dev, "Failed to clear bnb\n");
> > +			return -ETIMEDOUT;
> > +		}
> > +	}
> > +
> > +	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xiic_setclk - Sets the configured clock rate
> >   * @i2c: Pointer to the xiic device structure
> 
> ...
> 
> > @@ -1225,8 +1248,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
> >  
> >  		/* Clear any pending Tx empty, Tx Error and then enable them */
> >  		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
> > -				XIIC_INTR_TX_ERROR_MASK |
> > -				XIIC_INTR_BNB_MASK);
> > +						XIIC_INTR_TX_ERROR_MASK);
> > +
> 
> this needs to be aligned properly.

Ack

> 
> Andi
> 
> > +		xiic_clear_en_bnb(i2c);
> >  	}
> >  
> >  	i2c->prev_msg_tx = true;
> > -- 
> > 2.43.0
> >

Kind regards,

Thilo

