Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5DD30DEBA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960396; cv=none; b=O2JIGxfpGyVd2OH9krLu3dyblaJgWkCtv1gQnxFhtV0qJkZE88G/yyBFJkY0ytjmQjbNIYoqWZW6Ol2YfxWSHZG2+PKiPip8reIg97wSrsVx9D3oPbhkMRNFD3Lp8fI/X0gxjES1XieoGXafUWAHnmAmmPg4t/TM0LeTcaGkUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960396; c=relaxed/simple;
	bh=BqleptVklrKDlBDiMIxc39mrkLR5WeFDG+U5RgU5tt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br5I1YDMKhrQO5ldKpSKFiflWLB3feZE/TlmqCi2zkKRcM23QF/2Fmrjy1Zu3l97C0mP9MoUI6rtYehYA8mJ+1tzbdYMnq6UXI8qAjuZQ8B7BAnTV6n9ueYzsid8iSOoh1Nn7vKhbSIj/wHRCUbAPElZkAqOxq943OGJTXXaFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApjFuxfg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApjFuxfg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2603858a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789960394; x=1790565194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqleptVklrKDlBDiMIxc39mrkLR5WeFDG+U5RgU5tt4=;
        b=ApjFuxfgeXDvSmKLCAKv3zcFRV4ItAt4okFUanpI9poC2FwbaRda8HYUlqPdWDHE6m
         q551rDo4oeWfwxzTERi7j6T4fGLHR9Y/gQ9yXUHYD2xsuHwORdhQVpLJUtFTPu4fzFUq
         PJjBjC9ER/v92mk6F7KiyAmxgbGnJ5kGgh3YynPwDr7r1B4OVzNEfuvfWfmYx5awhuPK
         jn2TtFXoYlw2cDg+BXkdzBBKmmm1DCVh58Z+LJ9XQ9oFUX6TvHIJmNEPif5VmM1oC751
         53nVF+E1RLqQp+cHxz5l2eW94e8UVHVFJMEM69z4CK4H+xcPcK8mjBDnA6yNDib/LFhp
         afow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789960394; x=1790565194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqleptVklrKDlBDiMIxc39mrkLR5WeFDG+U5RgU5tt4=;
        b=FILbFoaJQdhkOKo+O6bBjMNYAhLl2DBVxIhmtqrr4iCLc8b8nStcLjwFt7pKpwX3JE
         FXG6X3AtVcMSf9oI2tK4dIBS/tqtX/WfqX3DAP1ysNDo2GzbkD+14tJywRxGzBdKcG7a
         L4PMA9AgQY4nKZBbclJtC1xDsbG0YNfP8EZq+bVcXgifY94428cH/1iyJ1t0iTnqqwmC
         HzGrZHR2aOaGzGUoDJs8Zz2XkPLcbQotobh8IUR5gS+8cQ+QAH4cW1desy+3mzIBzDix
         qMrWrMTOkE2irjrKegoq4Hhk10oA0wI8mmNIaWUSOlrZ3Mts0VjNxldn4UjPpZNvh6+o
         X3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwssqUd3NK4KPjN2RI7fL5tNdfSnOTiPPq2MPRnZI+XntNMU4kLluYvAggmN96Nbs7HfIWwdapw4JTL968=@vger.kernel.org
X-Gm-Message-State: AFuF++lXdyTBeFK1yfW5tx7GdYdGseb3ZLL+QTbg0iEmelguIzrnKlCg
	cB+cJWRQHlBd7Y1jUgdFfdD+jyMReoIMNeZj6pov8u2eIJWHUwC57aGc
X-Gm-Gg: AYBFou1KwQdGmd0PVpEiug+lpgnqBp13n53VfLTm0uWE/HU/N/iC2aAsHddjYjgS3tB
	o5mjVihnlCwxx9kAn9zdDxAaW5YgpdqVa3NdFnavqko41Wz79pcfEPR6eaDDfy1j/FTSX7kpPEx
	NX/dcDT4ZWPy38ENXgwDAXWo8NQOMTcGeESfQHcX4UIce7e4Ghu/YhnlGDjm08H8KSTjF0ED6/s
	IeTpH4QLQGdl5/8XMWi4FA3raRK/Pta5Nv/Hc1AuciLv9wXHWPD2dcHAAM/M8OqKF2dZacCzZuf
	fgPD8dzWFo3k6+NV/URFybMr3mMlOkG4CINvHr8Q4594SYEi+AQhtr4CKNMfV5PUzjGz9eMb0dA
	Etn+QUvwpL8PSezZbjC7+NPBx2KLiLkML65K8vrwIlAqjpUNgtZiIHBP0cqiDqbHuoSzvZa7pyN
	wsuXqwfDud3ulcFJ34FUjdpAIaEU2W1HeW+aiVx0z5wCeTW/GDG8j56Id9kNpOHfk=
X-Received: by 2002:a17:90b:3a4b:b0:3a0:25f0:d898 with SMTP id 98e67ed59e1d1-3a025f0dd9emr5480440a91.47.1789960394342;
        Sun, 20 Sep 2026 20:13:14 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d907sm14845766eec.11.2026.09.20.20.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:13:13 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Tejun Heo <tj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Jing Wu <realwujing@gmail.com>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Qiliang Yuan <yuanql9@chinatelecom.cn>
Subject: Re: [PATCH v4 00/11] Dynamic Housekeeping Management (DHM) via CPUSets
Date: Mon, 21 Sep 2026 11:13:03 +0800
Message-ID: <20260921031304.437934-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
References: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Gentle ping on this series - it has been quiet for a couple of months
since v4 went out, so checking whether it is stuck in a review queue
or just hasn't been picked up yet.

For context, v4 rebuilds the series around the CPU-by-CPU hotplug
cycling approach that Thomas suggested during v3 review, replacing the
RCU-swap-mask/callback mechanism from earlier versions. Patches 1-9
cover sched/isolation, tick/nohz, context_tracking, watchdog and the
cpuset driver logic; 10-11 are docs and selftests.

One thing worth flagging: v4 deliberately does not touch RCU/nocb
offload state. That piece is still being worked out in a separate,
ongoing discussion on Waiman's nohz_full/managed_irq series [1], where
the open question is how to change the nocb mask without paying a
stop_machine latency spike. We scoped it out of v4 so review of this
series would not need to wait on that RCU decision - happy to fold in
RCU/nocb support as a follow-up once that discussion converges.

Any review, even partial (a single patch or a design-level concern),
would be very helpful at this point.

[1] https://lore.kernel.org/r/20260709023221.634684-1-realwujing@gmail.com

Thanks,
Jing Wu
