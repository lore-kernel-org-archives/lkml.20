Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB1535FCC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694719; cv=none; b=tSNR6kHuV5RUv5ItZX1B89oTIYc2yhoWPZWWGy1VQx1QYxviMb0uqPuhOcmdL1V8eL/9tKOB0QrOR2CWyYL6UBuEMfzRgt7U1t4t3zDMN+/03F7ZAHSMGreCnMd5gIPbHxTQf+w4Hie167tA1avTs04AECVEO8JR9HtCzldKT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694719; c=relaxed/simple;
	bh=+ZQCFWVK9WD2QuxeJ8q1+LZYa7P8Kb8YN338yRdssps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc6X8sWOO4M7WIZOb3al6RuQEdaOrLXLXdHLhxTjM3FbnGbeqMoug81FEG9kKI7HbXtX0aIRQNuYiZgeccGu0iJJCgmZjBlIxYd7YNqqQnYcl55odQ4n6Z7XhhWICgmDqWYt55/Cu3kLBFjFMkaOAjiaguR51wAUMhqKgtaWk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S76rV3o9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S76rV3o9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so26933165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790694690; x=1791299490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKUHB7aScg13wYBFOACKps8zTxyEvZBOKjvtM5yVoyc=;
        b=S76rV3o9l/opRiC9NcT6WzFoNFEwS5+X/2xttKpHGnYzDSOuxksCoksHzkBJjqQKLf
         X6jeH3H7V9wwRNIjVYIV7Dzyuu4aS8Y/Umd/qSRqLpWRAU4jx6Y9wqEyrO6JSK9ZZLfK
         v6W9VWObY+kKAVcXKPDCtW8BDEP63OLCJVR5BeYelc6jfJRXUSH3J1xQ/DVfwxupkR9f
         ZwYUHGChuiDTqOw+zjuUTb3zhYd2b3BiMQAvwDL9mAnXNtA5jAyC8lZq5Rnrbi8vkWbe
         dQZ6g3g8ENN94sMtQ/W/V0k6N+3qRTBAZMAGAmq0wOohoT+9ORoc8pjn4Tt6sMl0dP3q
         V1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694690; x=1791299490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKUHB7aScg13wYBFOACKps8zTxyEvZBOKjvtM5yVoyc=;
        b=s89Ar7TumIJNt8TXKVIsvpk4ZfjqPuUU1uTWl7AqX9wAvuu9PIhw5fdga8xXQeorBN
         21MuHVSaS1fvXc3/XjoFD7cpNsbJI4hDx9RMTTB7MlwP53BoYNtGOXV1SJeRnp7YZIEn
         atwpRV9vZueuNvb+tFV+N2zPpevEMfALN4Dx5YspTSF0BqkbenmZEk5UrQi7ZFCiq/SJ
         mEz3IkTpxgS9Ylb6WQkHNcG8rpF7PdUieWisHkjEcroooEGGWP6/lcQuxbq+RFv8GXKg
         4sf3xPsWsDMWjLVAVC8SQPY085KkNFO0cUTmKSfWrSlpcF1X/F0MokmjEkIR/94f50d2
         mGxQ==
X-Gm-Message-State: AFuF++lv3P+6lAIPXhzr7TcVwfBuhBgCEAVCDm9KdbkEqR6QifQYESx3
	+eFYhvv2voQyMfEzOsANS2cOFZiuo6IZ/1I+th9k4bTcF4DpRiIG/CgD1Eb2bfPNOAs=
X-Gm-Gg: AYBFou09jMRoaiGgc6kQK1XU7TwY3CS41WFwyPMBqQp4uKqaLzq6Rw4wBPtsDMzwv5e
	/l6cuIdy7tmbV+tp4k+Vys3hhNUGpTb5J1GSI5FcCmCRwcXEqWk5Ge0feDcq4Rw7+Bk02kvc7/h
	vrJc+DpNysnrvCmUnTjeKzN1fR4QgYYnO3gh00sfRijJnMpKZklIqVaOnBJBetIJp/Rxeq4t+Ye
	VqpXmRVHd3JKjaMFT36DvzbwnaP0hqKrMSH0nqWjwHOEK41hQM4Q7W93dSl9So6KO7wMeDiIz2z
	Dg0Cwq+zCIDvFnjTuq+NXKpZWpXG0OyR/KLI7j27XPDQzlAa8zKmSVA75ffu0ydmmOALkl96zQq
	+4q0Ik3alDlJq8NWwMkn35vXmY6Zh0qUgA7pW14XgmQ3zXpJnEPF/pZK7fgzSKsynh2/3F6jz5X
	TYJJ+erypxvks+h7GXO0TiA4XNbcI2om0iBwKWaDWtA1hdxTaqv0WNGr5ldex0e+gsNTIT2lFqA
	xbX+jBCb5x5QpOqzBNnUEwtNg==
X-Received: by 2002:a05:600c:5487:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fe66ee809mr285616115e9.22.1790694689978;
        Tue, 29 Sep 2026 08:11:29 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af505e699sm4789749f8f.20.2026.09.29.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:11:29 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:11:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <arvVH50RJ3CdL_iW@pathway.suse.cz>
References: <20260914143412.1sMcp89V@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914143412.1sMcp89V@linutronix.de>

On Mon 2026-09-14 16:34:12, Sebastian Andrzej Siewior wrote:
> In commit b845b517b5e37 ("printk: robustify printk") initially got its
> delayed wake up which is today implemented via the irq_work. Back then
> it was a variable which was assigned to 1 if a pending wake up was
> waiting. This variable was checked on each timer tick. Therefore it
> makes sense to assign a per-CPU variable with this task to avoid cache
> line bouncing when each CPU reads the variable on each timer tick
> simultaneously.
> 
> Today we have a irq_work which is enqueued onto a list and handled if it
> has work items assigned. This list is already per-CPU.
> 
> We could replace the per-CPU irq_work and the per-CPU printk_pending with
> two irq_work structs: One for PRINTK_PENDING_WAKEUP and the other for
> PRINTK_PENDING_OUTPUT.
> While unrolling the conditions in __wake_up_klogd() it becomes obvious
> that PRINTK_PENDING_WAKEUP is always passed as an argument but never
> checked. The return value wq_has_sleeper() of does not really matter
> it's sole purpose is to enforce the needed memory barrier.
> 
> Redo the irq_work by:
> - Use one irq_work (pending_wakeup_work) for klogd wakes. Schedule it
>   only if there is a sleeper waiting.
> - Use one irq_work (&pending_output_work) for output printing. Schedule
>   it only if PRINTK_PENDING_OUTPUT passed.
> - Drop unused PRINTK_PENDING_WAKEUP.
> - Remove the preempt_disable() section. Its purpose was to ensure that
>   printk_pending and wake_up_klogd_work is accessed from the same CPU.
> 
> Worst case is defer_console_output() where two irq_work are scheduled but
> those get processed one after the other during the HZ tick so it
> shouldn't get worse.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

JFYI, the patch has been comitted into printk/linux.git,
branch for-7.4.

Best Regards,
Petr
