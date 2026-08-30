Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897842EEE60
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788078953; cv=none; b=kWXRHrAPIP4w1VKwwsCm0u9blLmz1YbLQTw8BCLL/QIaDMaDVZxN3cj/ZO5sYpplHTISH8euE9G8kPwWziWhvhewIEbU1/r9Zqkh38LnyZMTLTrqGxhOLV5KZo8WHpJTu+3PaOuDuVsgs03ZpDA13CMtvxjLyr9DYMZThIp/WYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788078953; c=relaxed/simple;
	bh=A4ifKx/Y7UrQjBOJn3HDOEpZ4lNxL9SvaY8VBuTbiXg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KprCVoAThChuEAm/u+2oNmN/r+sYuLq7B0G6Ft19yrtPOLXieLfx+ArMyi1i9pdNKUbfz3PwaE7aQfFJEdd9OBs7P2aVGSXIImWYuIji4euou9jDv5zPGcRLOjhEFGByRaI9kjh946sveouZpQrfdk9zNEBKWiNUfkjZuyzgKbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3mrSJXQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3mrSJXQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48431648f33so540915f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788078950; x=1788683750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgVrC5x1G4IfWTMfMHMlJhQeGiqGU6pwFQaBnJPjxcA=;
        b=I3mrSJXQ8NTIfNt+S3RsrNs1CnV6Bc6wRsvKQ3wSfvvOH6xSJwhx4W8vyMBinUCNFq
         4C6MyjSLgUilSuWBH61hMgbfaUIowBw+XfPCLdX27D1M03UEJslnaLSUIEMcBpQJ7VtH
         bS9hmyVCFCmYtClc6Gfe6aHXrIPF0PkT0zh78XvKp0Z9gBb0EP99Nl6GE6vEDv8fZ5uv
         6NrF4W+kacjqDzDHSIqoJguqWUnGZH0EZ9eA5jDIX6NKTa0Zm5dZi2rlZZZCLS8FowWS
         Z+ZFtVQNzx7tXG/rrabMw5NeUwAYsj7KPcMAV7IVul+D1D4JF+HOIo/JKaDzJ8TAKsS8
         VN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788078950; x=1788683750;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgVrC5x1G4IfWTMfMHMlJhQeGiqGU6pwFQaBnJPjxcA=;
        b=KG1WRen+TbVoEnfMr4JXdAdDg7+zUyiNEaTdlK1OgIPtYnKPZSy5CR1ad45yBibeqb
         M3bC0TwdL8eGWW9u/XeUh2Cncj9/v/Xl8rDU9x/53S4vbp10UPl+tLSGU8N0jf1DmUP3
         zKxQsk93aS0L6GTZzwn4ds1AwJCVzpLK4fZl/CiPEZ/lK0UEYKV+oYDHggDi4ObcuXGb
         gkdmM4t4Uq02rZotCc5JqABMa+YpN02FdQJ96gk90dGMm/9boOG09MqX8fZH+Jj8bSYR
         12LS7/zthZ8BtI5xMRQjQQBnITClyrP8/zDwTK47/vgMay8AATk2TDBebFl1/Ep0ynni
         CfPw==
X-Forwarded-Encrypted: i=1; AHgh+RrhKe7/e2Gz7n+y9PWGKU1zzYUEst/AjEvrQFcz6uiQblYgQ9M2w0GuoCdAA6O8qZU993YesYKUrbCJifs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKvtTI+3TiHXxaLNA2xeia3Q5wKC91QRYQbmOBaTGg/inTOJus
	Hi11+tD0APtpkkct9haLy8vqVn8k/m6WC1RMBkNpjElHJkNXIOOpdoCb
X-Gm-Gg: AR+sD11ldVufFMyfwLK6jN43p2ICzXbftvJnhyY4X981RbCWmxcWIMFCVa0YUA+D+4d
	rSDPilMHCJx/A9OukoHy/gKTRbP2pDX+57G/3lVhlt9cv5+U64yAm5MBSnuZp2AtZLCWWxZQKI5
	WGd2xH/ugtT9eSBkcKL2RVeglCRh0GyUtLDC+R6HBp/OYCLuLmFPnsk7hgFwRLLPodm6NygacB7
	J+oHTAFY8yi47OtPPaPJJTMBuI54QPDfBaV466NXvaeU/hCNeBIWJDJzoyCcTrIa9+3Xy7bfA1S
	9/8bwXRb/iCHsyW5Hj1sU1ymmgk7/DJDCEyr3ufxEnkQqm4Jin5gFrpxCWYeTi1SL4tlA7I1Asw
	aRxxd75T6PGR2GGwiG5SkgIhWHMVYPg9TBDkYpP2v/yg/pN6zLtrmE1fGNBiU+pS9j7yLeTqAoO
	Fl9ltkq6YTkoftSJHfEdpDfUuX05eer/dibBQTmSsqYXKsJ+L1K9ChYZscf5DQKAcrhLs=
X-Received: by 2002:a05:600c:699a:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cd5312c62mr22024085e9.2.1788078949471;
        Sun, 30 Aug 2026 01:35:49 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm133688495e9.8.2026.08.30.01.35.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 01:35:49 -0700 (PDT)
Date: Sun, 30 Aug 2026 10:35:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Subject: Re: [BUG] NOHZ tick-stop error: local softirq work is pending
Message-ID: <20260830103532.544eb946.michal.pecio@gmail.com>
In-Reply-To: <875x0sduce.ffs@fw13>
References: <20260829201401.2b107cd1.michal.pecio@gmail.com>
	<875x0sduce.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Aug 2026 07:56:49 +0200, Thomas Gleixner wrote:
> On Sat, Aug 29 2026 at 20:14, Michal Pecio wrote:
> > I'm getting these warnings on current mainline. Quite reliable trigger
> > is I/O load (like md5sum /dev/sda) on an otherwise idle system:
> >
> > [   86.082138] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  117.959975] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  121.054544] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  121.988208] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  143.932445] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  156.083120] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  156.685222] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  156.789911] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> > [  158.986070] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
> >
> > I see it consistently across several reboots. I also did two v7.2
> > boots with the same workload and these ran cleanly 10 minutes each,
> > so it looks like a merge window regression.
> >
> >
> > It seems bisectable, but maybe somebody has better ideas?  
> 
> It's likely the issue being discussed here:
> 
>    https://lore.kernel.org/lkml/20260824105523.GA4121620@noisy.programming.kicks-ass.net/
> 
> There is a revert queued which probably will cure it for you unless
> you are using Rust drivers. Plus a fix for the remaining Rust
> specific issue is on the way.

Thank you, cherry picking 46094a7708b7 from tip solved this.

And no, I absolutely loathe this cargo cult and it saddens me to see
people's time and CPU cycles being wasted on converting the kernel to
idiomatic C++ with its arbitrary limitations.

Surely all those irq_disable counters in Linux data centers around the
world will have a carbon footprint, even if (hypothetically) they are
"free" on superscalar CPUs with branch prediction?

And all of that for the sake of potential bugs which may or may not
exist, and which look like they could be found (or proven absence of)
by static analysis if required, and because of an experiment 15 years
which showed that static analysis beats reference counting?

Could only be more ironic if Moore's law were approaching a wall and
energy costs were rising everywhere with no end in sight...

Have a nice Sunday everyone,

Michal
