Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792927890;
	b=F5yBBQErBHe9zL9IpDFG9T3BucWhy5+dIOspT7645Jjm739ER3gXGHQoJF02k5pMbP1E
	 DRAjNv+jRcpAvuq8rQPmAgUdV5R1OP5y3j9QlEyBpZOkb/h9e1EAql2Lu3b4ZBbDrf9Eu
	 LOsYwCwnQZ0qyH7D9GB7MCIYyQj9e1eRgxiXxJjM17feztPoTpjcu6OZGuIm6U5gl77TS
	 h9thS1PMtGggCx+yFMYPTP8uaQsR2IhI3rmMZiWITL40OD6+GnA2ufKe8jzsV+ocKrF98
	 XKXmc3pnTsZp2lVTKdb43xLuY983tCnuVAqwhj7FDDGCiybuY7xw+IR3E0ppUiF7abQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927890;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=kzzxxGv98m4L+VMMNaqnV9fbpLGIM9/kREZQjUSnEtI=;
	b=13N7n/c6uPLnW6DFwr7DlkD5CCZ5iCZC9J9BaMHNeHxLhHOGa2CnMj7UeNrzKWFeblJx
	 XRj13MWx4Q/W6+Ygym1RZtn6TPOde8JF+/xettmVZaWUPh30y1u94pDBw5MuDNe/jEaTM
	 ImC+IF5MKyirtFHi9uXPauZ1P7clbelC/wEqi7dcoqvRczskMWKje2h9LyVMBgXTOSGF7
	 NpFqgfmgDIzDzS10PmJ+nLnw0qhZkMxLNCB9EIHw665v3jfEvFbh5M2NguwBXdZE25P8v
	 OlV3qE+ZR4H+b0nO63fTwM/YvAe6obmMmBeDFUDW1aaL2+qGb/GZEz0FoZqlITivTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0AzzrU1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC0606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0AzzrU1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED3C1F01825;
	Sun, 25 Oct 2026 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792927890;
	bh=kzzxxGv98m4L+VMMNaqnV9fbpLGIM9/kREZQjUSnEtI=;
	h=Date:From:To:Cc:Subject;
	b=U0AzzrU1ANiod05cyF/HKl9g5MJNsJMX8w4boHPWsBavgfOMn/iNV0Ph1u6KgJZeC
	 3KHUXe4SXTqz80hFSDZzh1QX31V7e2gsB40ilbD3r3bS3ai3GQs2l/fcbfcRFSK7zF
	 qvtDx5e0MJwI1KcxzfqHaEDzM785OYmcr/+dB0aQMuz+R5wqC/JWHeswusebWBXD1t
	 65lkZYWgmspwwoR5RtglxIIS+GnT8xfPBDVpTE8VLMUMeL6/Rs1yhyKq5hibAvRZ+5
	 O+FjJ9uDjHWUkNdPsQPzkaceO+mqjsvk/alcTFGUe+Q0EwYJBV4nEn+Hp3Y/z5SugP
	 44F0ilxs5LYKQ==
Date: Sun, 25 Oct 2026 12:31:26 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <at3ojiqQedHoj3HO@gmail.com>
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

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-25

for you to fetch changes up to 6541fbc942f3b63bb8bd44e34eee6223e0abe719:

Timer subsystem fixes:

 - Clear timer_base::pending_map on CPU hot-unplug, that can
   cause temporal timeout processing anomalous on the next
   hot-replug (Liang Hao)

 - Fix PID refcount leak in the posix-cpu-timers do_cpu_nanosleep()
   signal path (Cen Zhang)

 - Require (CAP_SYS_TIME) permission to set auxiliary clocks
   via aux_clock_set() (Daehyeon Ko)

 - Update offsets on sequence counter retry in
   ktime_get_update_offsets_now() (Thomas Weiﬂschuh)

 Thanks,

	Ingo

------------------>
Cen Zhang (Microsoft) (1):
      posix-cpu-timers: Fix pid refcount leak in do_cpu_nanosleep() signal path

Daehyeon Ko (1):
      timekeeping: Require permission to set auxiliary clocks

Liang Hao (1):
      timers: Clear pending_map on CPU hotplug

Thomas Weiﬂschuh (Schneider Electric) (1):
      timekeeping: Update offsets on sequence counter retry in ktime_get_update_offsets_now()


 kernel/time/posix-cpu-timers.c | 4 ++--
 kernel/time/timekeeping.c      | 8 +++++++-
 kernel/time/timer.c            | 2 ++
 3 files changed, 11 insertions(+), 3 deletions(-)
