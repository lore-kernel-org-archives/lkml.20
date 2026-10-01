Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A93CD8CA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879361; cv=none; b=aXhHuMZ69VbOsAtwPn7+LOpYqWBRgx+JjPbHOMgPVwLwQ1CmwoK1hx9CR/HF+/gQzKWHs7qq+ze0cp+N5U+a5c1iu2ikA1JSWAG1tTaVXMFSjBXt1aMB2Ro4j11s5TcJS3liAoSxFFZ/m0Bv666QEvl9h64t+EMWDt2DHRD/QTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879361; c=relaxed/simple;
	bh=eihITXR/lV6R4KXXfRFaAAazOdb8s96OcPdemuLhZC4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DCKoTSYCMFZ4Uwjt7a1t67G9YzgdAHzntIyfLwOXLM2YG6M0P580jaKqlFo4XxMaIF6b2zditzFw39iD9wz5OjQopWz5dtYfaM5O4ZdVwa4foE9XLnnCZLsJFo7tVf4+ahLvdWjr5pkgsKARvwGwM8gj77xog2e7Up8r5ffs9p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2XKuJWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2XKuJWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EB31F0089A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790879359;
	bh=cdWpqKaLRjWfQ7UCcU+X0OZsv8iuXbfTA80fNlbaitE=;
	h=From:Date:Subject:To:Cc;
	b=N2XKuJWu9R0HtietnHTG34dPQRWzMF9L/BH+LE8j3sF4amMRSWb92F7xxFwOeABb6
	 tlWnZPepOYcPyjg4Z1wROwbjmMPu5nkpDyUGKG2H5dKI+4ZJxsSWW4RD3WUNj3OCeC
	 2GW9CKNSfkkHRQwGmbkIVfIwpSnSGcOWWmMZu41H79z2N14C3U8y3kF9t0eH5miAgy
	 ZKfZO/vAZEP4ETustV2qGWsnvVsib82+3NOXNXHJ/9WCj0xmfMtb9YoDpcwxwRb5sz
	 AKO9h8TlF2PClFap2a8YteWYUd96BMKKa2com/+koeFjWVptfMz3gWvYm7H/waQosP
	 yHur2cBHv5YtA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3ce4795aso2792708e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx18R5CVAQLk/Twas+SzGhcgSQP22C1p2AYaynRjvijjKxpCnVzVpgep2jquR0q1WjPpfhP8luhUGWB6aY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIaTil5UVTdJDIC5h2m7y4fVtJNQc1db4uJNQg2tJN7/j0GzDT
	oVgh7EZvaGEr03GFlp+TFz2/OYQ6qUkdl7HX0RykAdeuxaxSRNLFeSSxFFUFQLxtYO942eWMNhC
	H3s6AINzWSntCbjQ36r8LsbIzZQ9Q3ZI=
X-Received: by 2002:a05:6512:8345:b0:5ba:3e2e:58c with SMTP id
 2adb3069b0e04-5bb9bc2e140mr15905e87.36.1790879358346; Thu, 01 Oct 2026
 11:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 1 Oct 2026 20:27:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gQ8_-9V1DhqO+vYdqVRZSYQj3pVFgH1JgXGmHN-oPd4Q@mail.gmail.com>
X-Gm-Features: AclHuK972LBkQPpDA4Q2YY34hdwmKdy0831I41cd8tbWafIUBWDrpb93DqGJ3W4
Message-ID: <CAJZ5v0gQ8_-9V1DhqO+vYdqVRZSYQj3pVFgH1JgXGmHN-oPd4Q@mail.gmail.com>
Subject: [GIT PULL] Power management fix for 7.3-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.3-rc6

with top-most commit f341dc4d934a69ffbe6c21e3609ee725790188f1

 cpufreq: intel_pstate: Fix max_freq fallback in cpufreq_update_pressure()

on top of commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e

 Linux 7.3-rc5

to receive a power management fix for 7.3-rc6.

This restores the previous behavior on systems where the cpufreq
pressure was not visible in the scheduler and is not expected to be
visible there, but it became visible after a change made during the
7.2 development cycle that had gone too far.

Thanks!


---------------

Rafael J. Wysocki (1):
      cpufreq: intel_pstate: Fix max_freq fallback in cpufreq_update_pressure()

---------------

 drivers/cpufreq/cpufreq.c      |  4 ++--
 drivers/cpufreq/intel_pstate.c | 10 ++++++++++
 include/linux/cpufreq.h        |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)
