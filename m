Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794477623;
	b=jMaDi0OgPQAHPqeT6h+c+1v+amYnHJz2MrvbURSwMmuHCJEXIPW5EB1QMvBi8MAiw7uv
	 19bwst7DLXr6EvWgzHuw2SuQczKYOkTrc2+QwH2TGP3cKJpy/1pq+9ToV64y6K11rmm1u
	 uUuhxMbrv/U7WDZkOU5+yP2bAauvKQq9lj+C+3CuMXO1h5kY2JFkIA55VwhlfSG0ixGbt
	 aq2x0rJyWD/WfM36+lkN/Y1JDms06GZRSZi7en4z/BTEZe7WNh0alObkmHbSV+rGpMfIM
	 L1vRadl/x91FBC65cu8ZCuLa5LNzr9hIfUTD4isMCqv4Dym7PhMAGjxqpMPms7LmRXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GOBVmnk8YzPpgPMomotcdn7xjuGE+Q0OlwrQ0A/MN0I=;
	b=cwfjGu81t3GL1qaR7yNG8edtJtDnajFsq9PxXL0KUm3Ha/OT6+shpIPJk6t4YwVXz9mp
	 VkKIfSXEFrKLLjanhCOa9DgoH+O7AKgYhtgyQYaITaH9lMy+Xcfu6Jad0MRMy3RASfPbo
	 pBe3dVHWuebZF/nVlp0aW0kq6s+HpZUIL6+79XC/zd5G9iqW31tOz3bczU5GamJPjLxD9
	 WMbpITUmHCLa3Ip7Mp69bba9KQXfViI8+Y3/TSz8FNwXbGP2hHBp0qkrz84mfPro0cpJ6
	 dMiVbeGwLgrYi3C8hE2+YHUoStlKZGniueLmdFtgVB/7YY2XeJdyDpMiBkrx2Ehf6wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=chx8FxGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECE4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=chx8FxGP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d473cfff6so569694966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794477622; cv=none;
        d=google.com; s=arc-20260327;
        b=mPd8U5U9GF0UZKapeotOePB/kxJV5Z10A6ouBVcG76CiD7CnXdve1Zg+cv+sAiLNcU
         6gkCEAWyz0+/kLbSjGJdhfDhloXYcuMegwgtVPyHFLfL8YILvMqtPAvOa2rVU4O2SKnQ
         1ZPgq1cwOkGJg/1wrKkUTLczc8AwRjixU3KaRgqfztQRvlBZbAoChxXfKK6CfnmV8pW7
         UzRhcGXzcsM6ccSK7/AOQf6vd5wkf2yWTduTR6M63G29FL+Gh/qKYC3eRTASCdMhAPjq
         1/BL3W2zA+bFsIhTPYQtJj3QTcPH7DqgkbTN44NATXskfYQWQhC5XHa7lAhKWM/pBF3H
         6nVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOBVmnk8YzPpgPMomotcdn7xjuGE+Q0OlwrQ0A/MN0I=;
        fh=K90wsBTg2ubrIpqjJOHdlibVugF/g7MiOeKCRkGFD0o=;
        b=AB/S+5YMPoMbObbfzGi7Z+eHoOPaLY0jNBehl+QVinNmIX/Z40GXuvlRqhl/78mW/u
         p6Dbuq8lPLIBqxT2/dA2G/xLBUCX5RmZBxgnRqA6ePidpVvOQq3ow69M9MptzrN9kmKr
         K7Srw5BUjIxPTZJRLOj9T4jyj+dafG5xWfs4plBTlmr23k0Kdb2TUGMDapvzx6HgYvS6
         n6PJ2QE9AL+Sgp1HfUvsFCvc2xqmbYSmQkw3/Zdj1VfsPTkKOE0YsVdQV+zGiE2dNJFn
         Dg8j+gVGEOXtk7dNP7h1lEDmQKYj5oEKyhIUebl92CUZ2f5FzrBkaJNW0op38ytqIg15
         jDOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794477622; x=1795082422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOBVmnk8YzPpgPMomotcdn7xjuGE+Q0OlwrQ0A/MN0I=;
        b=chx8FxGPsbVi2E04sy5MlPcV/plopYnOFS+leqDhCfAv0sr8TT3DoRjgjoGUVkPwsp
         jwsjN634T/XQDdKD1xd94GvxWbmC3nk6ZS8TnOZmH68XwA77m+Q9LQe+i+Ilie9rP5PT
         YGCGAjZOxPHiTnSAhL7Fx1LQbi1rt3u1c2o2Wy6Yro3APRgeMnwccJzJ3/W87Zro1S0n
         bG77q/RqtyvoP6Hptd4qZmiK/iB/fP7lIWI2mFpJIDUiBJlDNvGVLaSoxCAclmZD0wo5
         NSIZokO1j4doHufuI1MStNKs6/ERUWR2G43oP5CTyIsPDAbhhaMBvatFBUvD/LsYcJxn
         j4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477622; x=1795082422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOBVmnk8YzPpgPMomotcdn7xjuGE+Q0OlwrQ0A/MN0I=;
        b=PgA1UlcEhMuQcoHnFwSMUPjTETm5OMOoDr8VQU9LFPRh6lZuKR0FlqP/NljnyN5g+R
         AFiGD6Kkh6+fcm91lEF51l+HXh4l3DAtCfvnDPOuBoahfF3pXrizoyPcFwIaGxWJpac3
         7DVgSPWNRgT7gzav8jHu944+4QqpjEQ6HVd4LbEa5Vg90mez1zciC3ec/xhtE+i8Nzik
         JPXndsVX8nsi4cpiP/ham8DHrk/EXpxteIu5XmhH1+iKHpFCFLTnh+6AIO9VXJ+QxGZE
         C8YxRZBL/1ssiwmWAbURpZrlM/j+gYjbRVP/SRQBy6O/piJpYd8irzjBSVZAyNYpcXfB
         0jIg==
X-Forwarded-Encrypted: i=1; AL+hErGB+ecSOkuTuwBOpMlNCvjSAZVXbbGWmLBySGCTViC/pLrvlDbyd89khpRVZiikJUvkNKYl1VvspNDOHPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9OQ4PLl3uJ4HYMq9Y9ZUfNWig1K2znWYxznjxiozvRke4mfKL
	S58HjfMy0WVco0Sn3QK2BxLtgaP0TYhEoP1chmxAtBTN+8o5VnVXTFMN2pHzopAd2r1aAtEFPhf
	OER/fE09sh/OiHhRkW2trkQeMQBduoMTmTdY5748S3g==
X-Gm-Gg: AYBFou2dHIvf7GYub4sY28DSJe/4r1ZijNDiJGrso4CJmusyL28RynO8Atpl9uhRHAc
	h/nM1JON0IKtHML6LJiWaOi2oQ7g6s2uN2EXOw8phfLjnJbD516HbLE7NlCMdB4VqnE/LBg3aA1
	59mwgIRrHWE8HRWy/ne/iNlkVJUp8VPb3NFjfmml4pT2+rpLkXcF8YFV74mF/AhQpylJRZcsOzV
	WGvM5hRp+UCjh5jXv+o0Amuoa5iYGCKcOqHxqngVteeYEGhqeFlY7bZIQf8vRQ20KWSuF4Y5pGL
	VGQlmVETwRkFsvKvpwOBRGLKgYBW47jxWH7bZggA/6zwG2ZGI+d44+tNTqcb7w5cewcG4pQA03e
	IlE7jVU4A9YHMUPo/BrzpGgYGXrtBuEfTqRJwst21batRy4Oecjrd1YOvnKck3ggTAsSm7Q==
X-Received: by 2002:a17:907:72c5:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c5066b3cb3dmr373390566b.18.1794477621548; Thu, 12 Nov 2026
 02:00:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-3-marco.crivellari@suse.com> <avSeXluNMl_XGPEw@localhost.localdomain>
 <20261111165838.GR1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111165838.GR1779021@noisy.programming.kicks-ass.net>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 12 Nov 2026 11:00:10 +0100
X-Gm-Features: AclHuK9821g0qFj73Uq-OCTPrpMk3UiKQ90wPjBd6S-rxSSPTCE9GkD97bJm1aU
Message-ID: <CAAofZF46opLOGOS6Cs2R=QKThp+9TMEb5fuNJAU94JHU-FQ5FA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:58=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> [...]
> So because I only receive one out of four patches, I've been ignoring
> this...

Sorry Peter, I will CC you on the entire series in my next iteration.

Thanks!

--=20

Marco Crivellari

SUSE Labs
