Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428422;
	b=Q+Z2RjWEZWjik9AXG4elnaKrWAGBmMF9mcpsiAra7KMQstliWu9wcP9XNweJ7VQstWaU
	 jv3ZnB6S8mgzrLAy6J7QKg9humBxoCVgxGiIG2WtFc7NnokQ4+gFYtzf8JafRa7nGLtxo
	 2vz0qt+PIAGUs7acKrxa0RUwoXfTrSsqRLdZGIOMt1la0N85jZxQxxJvn8cZGK05fTOzD
	 RJm7xB1rzhmuWNnJH2pAHGM6cKVHq0v1azKQH+BeeZT8sPWdWBvyniWvjBIvyFKlAGgKS
	 1OCYJT5kDAx+fRTX/+M+PezoIa83PPMgxeA8LBNVz+XDMVqu+irsfqZbNmD7D+I1Bkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=;
	b=2E75OVqaaLK7byr+vAWIY/fK5vEG/Kj02qee4ms32DzAsothKQPBAe7kNEj4f4pBLDBC
	 gGfVK5eIcqofqBirnZOUwZXhL07qA6UnXMdA87Om8VFPiySwbr5qW54dS1V/M43q8pSuF
	 XN/KZhdss3lanfhStSa8b/BvOKHuUKeVKtOP67gkuSVOxKKfIcjAHIcX9jw/z0Gd6LbE8
	 8+0pD1x1umRCFlnFEcMhaEdzfIYmK9aed9tLf6f8GEdTLGnHnK9JlUKLf3XDKGPlFor8F
	 gBYC9xN/DRV8OTvUEsLLcfoaxxd0zMBhhU4qLvtKGR7pspvjletFpWZFpAx+kCgMQ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=R9JrZi7N;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E9606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27E9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=R9JrZi7N
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53512cd2f85so39198611cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794428421; x=1795033221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=;
        b=R9JrZi7NhUwEn136m7E7v6uW/VyeO3KBnSCiP7uP8RpJdMefZ8oTNA9WKPWMkHrvQ4
         0EDwYZIYVnLJsSemT0msnGLMqFhMKuk4Dgv++96Q0v6mS0RNsDkig9WcT40aqrc5Q/ZP
         KTQvF2GHk+0SLyodeJuDNWtz6mM922L0VqSjINr19G87vX2YhdGIdpbn9w1OR0gNfrrV
         YA80STcTMFbLyLoVjqNgh4UrqwGPpahlWDVwIxHLz7GCLa78O/MLv/Djsor2liS/awpP
         RZb6uDj4L/Xc+oTtWIes+OgGGBzE+T2LYTrYfn1THeLqazb312TL3J0bA/M+WHYabnB+
         fyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428421; x=1795033221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjMHwJowCgljXYdOuz17suaOhns7jTmqFcuqV1/rikE=;
        b=HtaZGn81oDI3nDIk1p1FqY6jGB2C3ToGCNuwntRfXgKLDCH4A2ONffTUYIZBQWBVdE
         QW7cIL+brq7Zy/XER0LRzWfZwz8+alRNCrJJxWPsUxKffFw9/DuL2eZLhiSlSZpNrr+w
         xXzkauelz2KuQnxd0eHpL20CKUUSsfeanrpFCeyxIUrsO/2Xa+T/xzs6JLkR9AHEamvv
         Df6lXcgI+TYr0oonOemOsBSYRvFUR5qa+Ta+XTyBki4P81wnuSR/d8dRntP8hACnSgeY
         OYZBnG/7Dsp4qfeeRFkuQB+lvQbsYs2ELCKdltkv0q7EKDl5TL8+FOGfDrvameNLDgTm
         iuow==
X-Forwarded-Encrypted: i=1; AL+hErE9dqiJ/GxH8/LrLioYHsY1Aie2d1EnhPjpP/RGowggSpZZGQFHWZlIJNzwnuRobmY6xL7hEfd67lmLaf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3G+VSrSezn4q4PISM+qayzAtjELgdiUX7wtjI4yquWInRafGp
	CYAjTytLBGlpCPS6iCWvGLfgwIOt4RzUXcPRk/aXZqXs947YAY8my0fSSzg/ov5wU9JC8W6cRZK
	X9d4eGg==
X-Gm-Gg: AYBFou13ehs6Vdt6+bnEnhjQRZYIBpATwNGu2HcwHhuA3+Vm40XTmp6tvukjbdRor9l
	VxtQPNWf6PS3KGO1nQJN4KMeNWcyqgNL4dBf0w9mTBlvHqMvFw6IuNRAiSPQmEnkjh69LZQjEQf
	7LW7UaoRhMaNgusn5moI0S1v88SglC977gciBS8SoiNVl8OYW4I/VXzgZWDWtfIrEK+2qd+Q/Jq
	HQuyGJKHyyJGy6V755c4t2EBZxtcNJu3gXeMfoBqCp347y19AQw+l7f42QALlYDfizqiZKR6E4W
	VXnWyedZrjBi9kIbQKzb3+76zU4akHo4vt2NJD1LJX9XXbL+sxOBi3hPXggTXHx4593mendlTUa
	G4OMQ5236a1B8TcJxIZhki+guxWhI4RecArX5XKWB86/qP/buComeUADNXrtV9aYzqgmDWWHclR
	WN1hvQKmtnqdlhCLE6W7T093W+lJsTlKOjOfe5gQmd0DNJi03o2/iDpHcvOMmg8UHVnM0RGp1jC
	vRH0tPoCQ7aIRsXv1BLBDjEYCngi8lA5+GxB/uL7lsoVAvSDEzN3IpdRPODAGwEdT9FBoKDLmWE
	HC1ncbr+S+f0yUG9DGNhljv9EJ3iieo=
X-Received: by 2002:ac8:5713:0:b0:545:c5ec:fa3f with SMTP id d75a77b69052e-556c04f0896mr55320911cf.45.1794428420597;
        Wed, 11 Nov 2026 12:20:20 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm57646591cf.16.2026.11.11.12.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:20:19 -0800 (PST)
Date: Wed, 11 Nov 2026 15:20:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu>
References: <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
 <au0oKFb9CmNzc6Cg@google.com>
 <CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com>
 <avOw_4ZkqtKFHu1B@google.com>
 <2c3bda2b-ccc3-4430-8e09-81b25f6fcda7@rowland.harvard.edu>
 <avSa97F1Nu1LTSCA@google.com>
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
In-Reply-To: <avSa97F1Nu1LTSCA@google.com>

On Wed, Nov 11, 2026 at 08:42:31AM -0800, Brian Norris wrote:
> Hi Alan,
> 
> On Tue, Nov 10, 2026 at 10:47:59PM -0500, Alan Stern wrote:
> > So yes, in the current scheme a parent's inactivity period doesn't start 
> > until all its children are suspended (unless the ignore_children flag is 
> > set, but never mind that now).
> 
> But to be clear, that's not actually how runtime PM works today. It only
> works this way for the very small handful of drivers where the parent
> calls pm_runtime_mark_last_busy() in .runtime_idle(). I think several
> people have acknolwedged that this is a bit of a hack, or at least a
> missing feature in runtime PM, and probably should be extended more
> widely.

I have to agree; it seems like something we missed.  But then, I've 
always had something of a blind spot for pm_runtime_idle().  In fact, my 
overall impression has been that in practice, drivers relying on 
pm_runtime_idle() for anything nontrivial would be more or less mutually 
exclusive with drivers relying on autosuspend.  But of course, 
maintainers are free to do whatever they want.

> > The parent's autosuspend delay therefore 
> > should take into account the expected time before one of the children 
> > may have to be resumed, as well as the expected time before the parent 
> > itself may be asked to do something that doesn't involve any children.
> > (Note that if a device has more than one child, the expected time before 
> > any of its children will be resumed can be different from the expected 
> > time before any single particular child will be resumed.)
> 
> "Expected time before a child may have to resume": isn't that child
> last_busy + child delay?

No; that value is the expected time before the child may be 
autosuspended.  Not to mention that you're mixing up clock times 
(last_busy) with time intervals (time before).

>  So that expected time is already in the past by
> the time the child autosuspends.

You must have misunderstood what I wrote.  Think of it this way: Let's 
say the last remaining active child goes into runtime suspend at time T.  
Let's also say that the parent expects none of the children will need to 
resume until time T + D.  Is D sufficiently large to make it worthwhile 
for the parent to suspend and then resume?  If not, the parent should 
remain active.  If yes, the parent should autosuspend -- and the length 
of time the parent should wait before autosuspending is on the order of 
the value of D (let's call it D*) that corresponds to this crossover 
point.  Thus the parent's autosuspend delay should be set to D*, or 
something close to it, in order to achieve both objectives.

> My point here was that I think Rafael was overly concerned about
> precisely tuning parent autosuspend delays at the same time as changing
> the runtime PM core behavior. Yes, they clearly can be tuned in user
> space; but he was suggesting a phase-in / opt-in approach to this
> change, because it might harm system power if it's not re-tuned.

Is anybody really trying to tune precisely parent autosuspend delays?  
On what basis?  I'm doubtful that anyone is sufficiently serious about 
it to be annoyed at this PM core change (i.e., setting last_busy when a 
child suspends).

> > > At the same time, it makes it harder to reason about the runtime PM API
> > > surface -- because currently, .runtime_idle() is a primary reason that
> > > pm_runtime_put() and pm_runtime_put_autosuspend() are different.
> > 
> > I wouldn't put it that way.  My feeling is that pm_runtime_put() could 
> > be replaced by pm_runtime_put_autosuspend(), since they should behave 
> > identically for devices that don't use autosuspend.
> 
> Ah, but that's not actually true! pm_runtime_put_autosuspend() skips
> .runtime_idle(). It (semi)directly calls rpm_suspend().

Like I said above, a blind spot regarding pm_runtime_idle().  And/or an 
impression that a driver might want to use pm_runtime_idle() or 
autosuspend but not both.

Anyway, pm_runtime_put_autosuspend() could easily be modified to call 
pm_runtime_idle() before rpm_suspend() if the device doesn't use 
autosuspend.  That's not likely to bother anybody.

> I appreciate all the responses. One particular part I did have questions
> on, which I'll mostly copy/paste:
> 
> [Rafael:]
> > Now, let me acknowledge that some drivers evidently want rpm_idle() to
> > always set the autosuspend timer instead of suspending the device
> > right away.  That may be because of the "unwanted parent suspends"
> > problem at hand or for other reasons.
> 
> Do we have any idea what the "other reasons" could be? For example,
> because driver writers found it too difficult to find all the
> appropriate places to call pm_runtime_mark_last_busy()? (Does commit
> b3db492e8335 ("PM: runtime: Mark last busy stamp in
> pm_runtime_put_autosuspend()") help? Or should pm_runtime_put() behave
> similarly?)

I have no idea.  Outside the area where I mainly work, I don't know what 
sorts of things driver writers are doing.  If you know any people who 
are doing this, you should ask them directly.

> I see that USB is one of the subsystems where .runtime_idle() calls
> pm_runtime_mark_last_busy(), and I thought you (Alan) might have some
> more background on that.

I don't remember exactly why that was done, but probably it was meant to 
carry out the behavior we've been discussing (autosuspend delay should 
start when the device and all its children become idle).

Alan Stern
