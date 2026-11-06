Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966417;
	b=1eQFuv0aKqcLlqvZcwGSFIpmmxfvPQb58FXA//Ma1IjZ86uHIUTDlpvsrNq9+e7fTEJN
	 KLKYCZ9Kcvp6erPeIuclbHCMtFLyb0vA2grZHlT/LXSK+lKLdN/1EndWjXUH0ckmAxneD
	 fF6/HJ0tZhdR2UwQ6tNtgEmxCawmgtBX7Oim590JZcKMSElYLepRj/zTYX3Bhd9dqgORU
	 3eGzHH47y2JtjhfDGnEN5Q2KEKDfwGzYO0tQsaCv/kLdVaHOngpgFMSaGTdluTx54el1s
	 VdD1vhLSB+WzNtyFp7Zizk71SkfQqwAe+Jzs56eY+VxXpcqpEWOKbPx7TEtHXwwbp3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P6foIOXPcYLkNrEcUGT37O2aIkquLPqP2LnJ5l7DjDU=;
	b=B5RTf078z2f0uQGDBH/f/FjH3AHQpBadTY+CaAG2BBTxc8VSuLu3JDe4z66w0g5IZ12X
	 7uoxFin+dJabQzbyoqtjFnlwqPKCrD5ZCa/XQiPdbyJEMsxFLgwsE5FeAW4BoG1x7SKpC
	 eoKroEZ6pSDk/YR5mQgehq42/MM18HaQg3gnRYTXbsk/H7SfDgyjkrZUzONKG+PgbT+v3
	 cT+he0rFhW4C2B75XjhIcN06meKnatYtK+pVeSuYTSwFNNIJoyTFVji+gAxuJlcvEJW5o
	 NDsZk8MwwlId/Y1O71N9HhPqVbr5UoLga7bZI0Dtd15jyUE8JczXikqAKnnskn/k7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLJThMmD;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F8606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541F8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLJThMmD
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so225200eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966416; x=1794571216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6foIOXPcYLkNrEcUGT37O2aIkquLPqP2LnJ5l7DjDU=;
        b=xLJThMmD4xI2upLh1Eu/g8qH1kTLZtlIWqhzGWt997Ew+oqlCnN518rsFN8BNoNPi9
         BZm/MgP1wugn8GO00tuKW0W5iIQhimnZvoocSIgkjSiFT7VkrS9ZefntMrzfeLrxj3B4
         EaKAWVEVHWLO57DaJUVOQ9GcsXEbrqnH+ukR7CAfKHZzSKoeTlwaAwa+WvoOzJcOtDt5
         Lziu6y68XAQFG2pNAkeOlfLIrY6mFxB6Se6hIShdfX96hFPHVi4gYgj47V9U0hUctkoQ
         PSJdOBymX9vEVEGgpEHGMC42pUtLxiTLl7+jOe1/8SW5JlLymZW1K/0EX8sjW9PIOTMr
         V9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966416; x=1794571216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6foIOXPcYLkNrEcUGT37O2aIkquLPqP2LnJ5l7DjDU=;
        b=nFYy77+Y1CqCN8sfhPkl+JbSzecFeC/1w/G79cEp7Ghp4HhWVD7o175V7bGeiEHmKw
         WWWyC8fv2KAVM7WnuujVlBgt8L84yRFr61wtqCO2AFKwWUPkvAP0isd6xzVot3wdMZkS
         Gg5wswW0e2RhYWL7ZYmHeCODbGZuResYmVck8G//7POvKnSxQW8ihbC1O6m3D+NoCq0Z
         4fkWKM5Z+YXVu9FXgk15LHpbqOiQyDWAJW7M9EzVb/QJ9RNmVAvXZPaCoAvh38AbDJu5
         I2vJG/4cO2ORsMWuVAoaK9OatYVI4vnXC22YroPWpfGKSj+Dq9WYPKCh+nK3udaUXHbr
         k6BA==
X-Forwarded-Encrypted: i=1; AKwUvBw0LUN7fFzm0cTvwu0Qd1hUtKETm6DLhQJrctzczgHsLtHnI3khb0yRKcPV+y8/S3CdPjuHC2yVQ2wEidc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DraEXiYRzUzuw+8SMs5hCnuOVVhctxsBu9VZAIbdEr7F1Mzsi
	7hlGtos03vU92POr25kRt3nP/8EoQUis19VNG3YT/jQFiBe4ytOQgi7ZbffK+IhToL4=
X-Gm-Gg: AYBFou01E/5c3NKTJNgx0sDhWvBrN73vbB77vEUH6ABv8nh1lmsqg9BrNo4+NGO6jgj
	vSYWNVCkbKDCisgXTK0RT5255ADP1/xkZ9EugkJBCxYtDDU/mxTJ6f9KKs4L+CDoWTbprnLfBRx
	KDi357P9UpTPM1lcUqnAmTNmHd2j7+NSaEwnF7XYX0bryuJobDmOfP20qJkTvz73oTaGwV+RMiC
	SmWyllz3HP3GI+WH5RzJFsOFkRzn7U+S1V6Wbjuh/ftR/9biNQn0cpqbNTdHk5sY/oGun5fMBoC
	DYoWWhIZ0DIiJyp7UT7XCtrfzeJ0kxSIh9X3fZ7I+tUA+2C5YioezO4gOszzt8qk66WHcqtHEzv
	SrzgrJ8TlM20ea6eVYLK7Debcueeao0qWdhUO3WVZjpqMi4xa4IwaVctUMAVmXjPp/tPBH3Qxxk
	UxqoAgWnBqUkHHH5BHZdATYRzKRG+t2CfjN1Vm7Bc0lWirpv+RT36rDKtmLPMJ11w7Ph7DMN4bz
	D6nZS3Xbqybto6kemNAh4Dv+GfOh6/ddwiq3VNoZVE8yAXFM/+E84xTUM9vS27U/QwcR8c8W0kx
	4nJuwTFuQ7sdKMH/huRESfF2YCovPfUGVSMC49qqUQGpB93S4RVjEyinECbO5usI+46KRClqGs+
	quuXl5pp3t90nvQQq2rqcHv9DFx/XSXhEFy1L6g==
X-Received: by 2002:a05:7022:b0c6:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b25d32e840mr2485484c88.10.1793966415992;
        Fri, 06 Nov 2026 04:00:15 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b26294289dsm3510717c88.4.2026.11.06.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:00:15 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hannes@cmpxchg.org
Cc: surenb@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	cerasuolodomenico@gmail.com,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] sched/psi: Check CAP_SYS_RESOURCE in the initial user namespace
Date: Fri,  6 Nov 2026 12:00:04 +0000
Message-ID: <20261106120004.90041-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s
period") moved the CAP_SYS_RESOURCE check for psi triggers from the
open() of the /proc/pressure files to psi_trigger_create(), so that the
credentials of the opener decide whether a trigger is privileged. In
doing so it replaced capable(CAP_SYS_RESOURCE) with a direct test of the
opener's effective capability set:

	privileged = cap_raised(file->f_cred->cap_effective, CAP_SYS_RESOURCE);

Unlike capable(), cap_raised() does not check against the initial user
namespace and does not go through the LSM capable hook. A task that
creates a user namespace has a full effective set inside it, so an
unprivileged user gets privileged triggers on /proc/pressure/* and on
delegated cgroup pressure files: windows that are not a multiple of 2s,
served by the SCHED_FIFO psimon kthread, which the N*2s rule was meant
to keep from unprivileged users. LSM policies that deny CAP_SYS_RESOURCE
are not consulted either.

Use file_ns_capable(), which checks the opener's credentials against the
given user namespace through security_capable(). This brings back the
user namespace and LSM checks of the capable() call it replaced.

Fixes: d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s period")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c5381423334..cf2593183b25 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1347,7 +1347,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group, char *buf,
 	 * Checking the privilege here on file->f_cred implies that a privileged user
 	 * could open the file and delegate the write to an unprivileged one.
 	 */
-	privileged = cap_raised(file->f_cred->cap_effective, CAP_SYS_RESOURCE);
+	privileged = file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE);

 	if (sscanf(buf, "some %u %u", &threshold_us, &window_us) == 2)
 		state = PSI_IO_SOME + res * 2;
--
2.43.0
