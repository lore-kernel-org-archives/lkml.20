Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397471;
	b=MVV7S2chav9nVqyW19XEuuLpcIyXpG/m7yRlzWTqeVIh52xf1VpKxV3uHFEcrtxBGYp3
	 e4t0/Lb24sEKGwjQEQ18HemQNNX3M7gMijHpfzvpu6ZIzhSbNEKt9ksbpYooqwbdzwi5O
	 tZEvwd280FX5Q8ONKjw/ZEqVFpsc+hOQN7O9W7cZqgzu60Flhcl/Um4ZPOokTD9oFCOs1
	 Y7eMtqkrE9t7XXfcQJjFbCcAh9NMTaqMyUDhKwLu25KPiapQ0dp7JygKlhO7K8wHpAOSE
	 FlyMoPH77WlsTj9as0cE5d97NiGv3R7EXRloibLQgmUOiB/26wwFKhef2DP9YYrBKNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uZQotJj15ldJbwM1yJHmaszulfbHR2Hwf8ilKBODAxs=;
	b=DmGbMfxXOe0bOe9Fhr4mls0UnAeWclee7EtxpMDs25k9K0P5qyAVkHyBBBOa3PpKz9T3
	 9LdKCvextbGhEVmzAsFor5X2K7kwkdqw0DUfwLgbwjH6JPv6hQP13wXO0/7QkeBm6cUum
	 f341+FjlaaoJYC0apVhHK2toy6glW0aiD/V99rnligXAi9TUim5v44p4rgZVObPg9qvHZ
	 euuI3WvMdH4mamTmht3BB8XEXTzbOGqJMrDZWvxe3DlHcfDnZXZR1aCC7IaPujqgsoXnB
	 93A1HaNdiaCMoIQcYN1DlnvVzKX931lT9Ef0UNxi5w2s3oVbvrlnuZGTG9ED1VUl+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DOQokTxi;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65A606A8BC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A65A606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DOQokTxi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38945515e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794397469; x=1795002269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZQotJj15ldJbwM1yJHmaszulfbHR2Hwf8ilKBODAxs=;
        b=DOQokTxihYcIfl6WTucA/C4Gij0KB0HWiUmsz/xWyRDtoii6QD7rk6IHGc6oKwrvdg
         XtFRCE1wtDItAVUddp3xghR0/vDAzmxbwTES/2qot/Rv0C6DzAqGRio665J02dxPNUuJ
         YXavrBnuNkknsL7dS7YIJ2lO9w1UuKs8+hldnCIDOloda3UsmYxGPHWb68YsAc+PKSzt
         1Slj/8F7wdTSbGp4jZNtHO82ss6EM7z7GTWmf0Fgxv1AovdMV4R1M6M6aXpb1k74ajfF
         NnN6q4x0XabFXxFDNPySfKTeupJoHp4dUROtfnbXrrc+mrfUtmjFW+/YEEA8c7VXjwkz
         8Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397469; x=1795002269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZQotJj15ldJbwM1yJHmaszulfbHR2Hwf8ilKBODAxs=;
        b=v6uZljbhbt8NbohBIRBsLIovNg6VlhN8lTu3O+2hY2Ec8x6gzs/lHxnB7+RdS/X07n
         ZwZcgC5nuCNyJGyS6Oo4kd2YuCx1Uk1m1BylqOBVmnXgJTYwsMfbvu3/ytkdEygG5YIb
         7eWIT3RcKlNRkVjLaGphqYRZuqfXRVR153gWZ0BTeBdEMrrpFv+h3Zypa1lk7Hmpzf94
         N3lCoKCbk8N26Lq5Kau50JGiWpODcVOdpyFBuQoDXYidCBQ1KLimoPe6BD9I4mE3lZNE
         YnKN41XVwDnQxg5xnfa4Goe89gLwTJfz4ztSZSolPML0njFwoBbH/kgPGf/iLFFeGF7I
         k/ng==
X-Gm-Message-State: APuU4Z9ksnSxJ2Eu4/SKuDelQrIsIiH8+ewLFdJ4z9k8xB4ZBLj5Jo/t
	mWi/CovDDiypJdJUM55g+DSzRKYvTzjenqpLbeMfvTupkmfIqzf/v0/5YuHGuv09VbH5z2ddXNH
	aQtiw5bg=
X-Gm-Gg: AYBFou292/SZtk78pmWhpCYoX9XQ3mKEz7kP/P8x5oJKVHsNUNvZFlb7lfRzuxm2Acj
	Q0sazVUWIWaAJJf+PPOqZJbPVCbN416Jtpg6/9ItDVhxCZKGRGtogW9QaDVQMPVopqy3pCapfbR
	BpDhoJkYd9/E+yPBeRmn3gNzt7DxRJ10Vm/No/qMwbm32tDvF7bQM3g57xL0/zC/e/InQrkh3q0
	Sd6/7kjAJRaTyy0u7WNg/FxZWwqVtNp3DYsgV+8Ruc5EMBiBE4qZsP8+7d0hp25U+AI0mOUYGMH
	Z0BQmxgp39cRAT6O1Y9HvRUCc6SfayOFW//R7EldxKW9gGhDa2+Q5cZxxqkjCHHioh7cRLEi6M9
	WlJqVd0DjCOPluleAsVfMlFlYnqHlME+rIieG1jGmL2f+ywTcnnbgvzNVfx7715vfYob8CLl9v+
	rmQEuhxQPjczgo4SY42yW+j+vC2nEzuHedoxcK0iysKFpmgcNCRYuyHjnWk0giPJB2003taCl7z
	IRlJ7C02JN3zTFKwEK7TAvvNdkicyp4U8CJzQb89XMfCLEBl7wGLGf+fsTTBiFjaxeXvF7LZ5np
	a28JgmgLLYjX5ukqkhTtbowe3kKEq/uYYzPPuRUtBTMzpT4Dpzk=
X-Received: by 2002:a05:600c:a0c:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4ba0938b7f3mr42129645e9.22.1794397469073;
        Wed, 11 Nov 2026 03:44:29 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm43238545e9.1.2026.11.11.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:44:28 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 4/4] Documentation: no_hz: Add tick stop in polling idle
Date: Wed, 11 Nov 2026 12:43:50 +0100
Message-ID: <20261111114406.346953-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111114406.346953-1-marco.crivellari@suse.com>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
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

On nohz_full CPUs the scheduling-clock tick is stopped while polling.
Update the documentation accordingly.

Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 4006cab64079..86cea04d2a49 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -246,6 +246,8 @@ Known Issues
 		be even worse than that of dyntick-idle.  Furthermore,
 		this parameter effectively disables Turbo Mode on Intel
 		CPUs, which can significantly reduce maximum performance.
+		Note also that on nohz_full CPUs the scheduling-clock tick
+		is stopped while polling, as in the other idle states.
 
 *	Adaptive-ticks slows user/kernel transitions slightly.
 	This is not expected to be a problem for computationally intensive
-- 
2.56.0

