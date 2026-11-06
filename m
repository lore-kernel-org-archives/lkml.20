Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927212;
	b=HEVWGfXYXij1RvmwQcA6DOeEAZoDe3R+ZtRCkjfS/ZBfhZHy95Ga63zA2LCgXmHqh4iG
	 kaWdfzU9W5evmRN9LuUCFAVWJ7aDRsqQMYlvydrnouzACGMscOfbemq5cs7DBNjE6SlDv
	 Cz/QTX4y8TY8lttzSWq4RBjKXUIa55wLhv1mVz2V8tQkZuhFr0d8I+ckhBbmyZ7PTXp3O
	 kK7r7oAXnHCT+otywi0pnRukG+LByAd/RDBLL5dBbmFiwXDXWPagM52LitUmbOSqDnyj6
	 xMKQve7Eqo7Ocj4JFz9lhIIHEcNRKs8K2YVtzCXMIDDThNMfCYWRSpOFqIsqsDfiS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=;
	b=VQe/TSnLPwTywUK+lUkMd9QqPBpP9cvkZOgu7PqkaRaa6lptQTLRm97Lq0Sb92fcMwlh
	 prxi/ojx6v9YC32LLeE29nfAWJW6EL9LmyH1eJs+PPJ2PtP/CIEjwRqKBoJvhhFnv4ys+
	 1MniaTuVLEuUPpwSAm/QRxd1dUBePxC9jjByqL0oJsiStfr7NTQO3scptniIYNzKc4TQJ
	 gnl3c7s0dwILNmaO8ZWbogi0CrTlBc6etv8eICU4V42BbI2eNhQ+FIQDocY4qxd18amAX
	 Er/Yo0VljQwbkqSGKJkIoZy7IQNT3eYUx+eUWhhPhna1IzBm3hbaenMpqChTIo2a/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TqAPnM8e;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A533606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A533606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TqAPnM8e
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so170409c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793927211; x=1794532011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=;
        b=TqAPnM8eT4V3Yp6wyLQNwAKn2r2fSx7tX0Zqk/qc7IB8izI5Uozb/tMECIjjGEafiz
         1XFCiZQ2hOtqvr4d7yuPXl9kI9njiF+tW6Yk9lkVnHl3M4XW0XVZfynrDFsevN4wVOYK
         wwdDhHPiqM9KD8T7mdEkr/p+auuAZnNazL/nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927211; x=1794532011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=;
        b=AmYqjU+a5HzO4wCaso64939n6GDjt69pwM39c2/aiggsTKCsAjGopXv6YcapJqU2/a
         qMu+dC+B7xPSJ29uMVoDGPFYtoXAAyMv06jcEnGoU0tOxM8+JP2CMNBygd2YXrNlwsH1
         N/1Z++GzYJcvsrFc7JSFK2PYs5a4lXsUTjqu2HhyW4v4HcFVUicoGUn+tCrt2h6WOV+i
         AF8oPZnyb7FnEFKSDTyraYQ3WgTAQ4VTXDra2rW0pW1HIxm4qvcousgYPEZQqhVI05P2
         NhsDSwXHcDdIS8WjkAdfIkleSQRr0ImM7YDPGzZGayRBb67jhjWmiN57bSu1qDNOofZz
         lELw==
X-Forwarded-Encrypted: i=1; AKwUvByHx26X318oBMgKk09UcMnCrpwA5bCGC6KO7P4IH6D7fEiGGynseOfvUaw5tstUiSh7UiTl1/SFt4ewWkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mjuHO+kwQ8z+Q9iTw2OIcNm+OUKNBemIt1kO9VbVIgSV9OSxJ
	nZXhRT7VwkGZNonRxPcxwYvuT6Zrj5zSraoAvnQZnpeT3Ub6TnvFXfkLF2PPrEXSsQ==
X-Gm-Gg: AYBFou1s0pvI/9cdTqnGm+iCMqfqq7sZNS0SSUBl6c5yRbHllzH+wx1HsuKRJNOhCug
	nbzPoSgTFn7Spbw2EQ1y+nDoKaJk2D3fX9jbtUxtbsqMSrYnb0SOFLk+muMpEN/P8DswFBxVM9k
	kn12UhtQfbrch6E6dlbjt20p5ItuQugE/CfR+a8s1tQTUhqQOeZgtCsFkJ3zlxe4sIvmy58CQv3
	zbHb1PUzuicOInJhkktx1kiq1R/oSVaanB3lIj8I5KjyovW1N5dPYc44ymgebkbeu7N0YqbBO0X
	kdsAcHxNeOcgRHSPnUP78XW6fbbwNLO0oUk7XIxlERz8FaadVl8w1b7MW6W0trd5KORcOYv7pvT
	TlNA9xKiwWYi/Y0pUIv+PjDHnA0eWiGR5oY1AsiVuAcEQ84/pbwzyrxH9cPdbBuVaYCjwwkXmgb
	6nWynTbJ/iJODlsOlxuNS7a1ZkPF0jEFgbJ6CgtaZW5gS/ZlgBRdG+5cAG5AaArl0iWF7lTVNPX
	F3f62FPNhTI5tSc57XCGYSMp1jBzLkG62X1KQC2balOQFm4UwHw6Kk0ap+/CX3wSzJsV3NlfanB
	kJiX28bQcWQJloAkqQBBnBeCxEGm+HPzOdakYymqYR9vJgOwmfeBmiXsCtD9sZEwm/g=
X-Received: by 2002:a05:701b:4246:20b0:1b2:558a:d769 with SMTP id a92af1059eb24-1b25d28c272mr1042791c88.4.1793927211233;
        Thu, 05 Nov 2026 17:06:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:bb6d:e00d:d359:7933])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b25e407bb5sm828381c88.1.2026.11.05.17.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:06:50 -0800 (PST)
Date: Thu, 5 Nov 2026 17:06:48 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
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
Message-ID: <au0oKFb9CmNzc6Cg@google.com>
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
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
In-Reply-To: <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>

On Thu, Nov 05, 2026 at 10:18:52PM +0100, Rafael J. Wysocki (Intel) wrote:
> Of course, it will not prevent the parent from suspending if the child
> does not attempt to resume it for a time longer than its autosuspend
> delay.  That's by design and you didn't have to take the time to
> demonstrate it.

To be clear, I wasn't just trying to demonstrate for fun or because it
wasn't clear. I think there's value in putting concrete reproducible
test cases out there. (KUnit is an easier common ground than some
particular piece of obscure hardware.)

> The question is how often those kinds of patterns occur in practice.
> Or IOW, whether or not they occur often enough to justify adding
> complexity related specifically to addressing them.

Well, I tried to keep very close to the spirit of the actual real
reports in question. So when commit c537d3457542 says, "As an example
[...] cat in_voltageY_raw at a 0.2s rate", I think it's not a far
stretch to test 0.1s too. And it's actually quite odd (IMO) if 0.2s
behaves *better* than 0.1s or 0.09s, just because it hits the parent's
rpm_resume() more often.

> > On Thu, Nov 05, 2026 at 12:59:24PM +0100, Rafael J. Wysocki (Intel) wrote:
> > I would love to hear your counterarguments.
> 
> OK, I'll say more about that tomorrow (it's past 10 PM here, time to
> go away from the keyboard).

Great! And don't rush on my account. I'm interested in eventual
progress, even if not rapid. I'm sure you're busy.

Or, maybe I should have gone to LPC...

> > I don't believe your solution solves the problem,
> 
> That depends on what problem in particular you mean.
> 
> It addresses an inconsistency in rpm_resume() and as I said above,
> this needs to be done anyway because it is not only related to the
> cases when children or consumers are involved.  There are other cases
> in which rpm_resume() gets called for an active device and the lack of
> last_busy update causes the device to suspend earlier than expected.

Yes, on second thought, I agree that your patch addresses a real
problem, even if it's not (IMO) quite a full solution for commit
c537d3457542's.

> > and my solution does while also handling
> > the inconsistency you mention.
> 
> I'm not sure about that.

Sorry, I see that part was inaccurate.

> For example, say a device has an autosuspend delay of 2 s.  Say it is
> initially suspended and user space writes "on" to its "power/control",
> so the device resumes.  Now, 1 s later, user space writes "auto" to
> the device's "power/control" and the autosuspend delay is respected,
> so the device doesn't suspend.  Next, 1.5 s after the first resume,
> user space writes "on" to the device's "power/control" and the device
> does not resume because it is active (its last_busy is not updated).
> Finally, user space writes "auto" to the device's "power/control", say
> 1 s later, and the device suspends even though it can be expected to
> stay active for at least 1 s more.
> 
> How is that going to be addressed by propagating last_busy from
> children/consumers to parents/suppliers?

Agreed, your patch addresses some scenarios mine doesn't.

I also agree the power/control behavior is a bit awkward, although it's
not very convincing to me as a use case. (Arbitrary/periodic fiddling
with power/control seems more like a nuisance API than a real expected
use case.) Or if it were, I would suggest solving that by adding
pm_runtime_mark_last_busy() to pm_runtime_allow() :)

To me, a more convincing one is: a non-autosuspending child with an
autosuspending parent, in a situation otherwise similar to commit
c537d3457542. The child is not likely to intentionally update last_busy,
but only implicitly via rpm_resume(). When you solve the inconsistency
with your patch, then it enables my patch to be more effective w.r.t.
the parent.

> Note that I'm not dismissing your proposal, I'm just having doubts
> about the need to do this kind of thing in the core code.

OK. I agree it adds a bit of complexity, but at the moment, it seems to
me like the most thorough way to improve the ergonomics for clients
(drivers) here. And that's pretty much my entire motivation here: to
improve the ergonomics of runtime PM -- even if in this case, it
requires a little (core) complexity.

So, I'd love to hear what can make the ergonomics better here, with less
core complexity.

Thanks,
Brian
