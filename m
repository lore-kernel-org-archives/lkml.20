Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284F2472A6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749610; cv=none; b=ZaIhl+2zdhsfp8GYx8Vwn4L17SIIfbrkjE9Paw6UEe5UYSByU6e6Di9OYjV/vgpimFsdfHkybp3iFa8q4Nxi7j+zGkzYGrk6si2f4PJT7wN4+63U53gZSG6zRwspTkJe127kZU3aVrILZ96RXhnn2eBcQ8EN39bI4BIPnaQBB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749610; c=relaxed/simple;
	bh=ddlaVGd3ltNAfEOvv+srNns4yVdiUP05x3OjqW0riH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJS1bCBy4SDPK7zPpU5knYkjdP5PADTOBulLJUTl35MrAO/QggfGtv+D7jrVfzGEw2Zf0A7+CDqsp2XNXwZrrcWBxRWqwPQyCUd4G+3r3Keqm1q1vg2+RnB6DuEXb7GwBqyzHrow0XnuVKt49nkecIHj2Bz/2dTQssdyc0YnZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POf7B0e+; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POf7B0e+"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so342869a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790749608; x=1791354408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddlaVGd3ltNAfEOvv+srNns4yVdiUP05x3OjqW0riH4=;
        b=POf7B0e+ysyAJCxZnJu5msfOxvS9Tzr75qpRz/yvo9fb0wmn7dY4fSM2HpRWlqIAwD
         TOk3eJZMAQGG0lf6WZ4JCBJVsUCxVil+d1H4O1gjZLpUDHhtgRKWV25XpFLtN+SwTnIl
         RkiMFgaU6t0bydlyfcMjXumgCGWYYof/8/hjwEvMy+h6ZKVKH7xxbKAjQNeMqYfi5URi
         R4PxqnzGEr398HvW2sMFZbFQTqBzn5TtuXawbGd3WMxQsD3o6BD8hXM66jYA23DmUJ3g
         PZCT+ROIhGCx3omp0XYBtNXHkUp79qVsaQXsyrISmE7eUy6lBo1l/ssgUnXHzVCt1WC2
         0trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749608; x=1791354408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddlaVGd3ltNAfEOvv+srNns4yVdiUP05x3OjqW0riH4=;
        b=gvWUbRKE7B648NURGEFgrcmM1IM1TxHbncSEWa/01OfrC+PMEANkoRDCPVN7YxjeOJ
         rskf/gN3FxZp8bB7fS24bHk+GAVFWgI6O9VUGW0hTgnfQnm9p23SUyzTB4P/cMN28Tun
         D9OsstyJ/uRU7Qj2f0lxo7fOiuee7p2VTaOj1K3Mlopiq97JWxRabADxEQyjTHEiKHH9
         IVBG3e7lwf43Mg8HtPmzJI671ooP8voEP7QYFgU3yPa6yPRPNDMlkHvk4dYtcuFiG1cV
         6ML5KUubEYy0yRgek4fiOqBnMFDGOuJ8eo8RIG3/p7xWbR3jS8s51tE5bp/DEJFZfjEq
         KxfA==
X-Forwarded-Encrypted: i=1; AKwUvBxFtwH7XkOOQyY/C5NTEF1mZ58fsA3859hNcevQ5iM/UlwiNRhtGPdiv0b9QpyDJTs3YYLqPkj3wN6oZdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFY8y/wP+5yTs7G0FEg8pR3eFdLXsX6ZXSjXstEUTWbnwdczC8
	FSfFaO87FiFSOe/3VEm/7oQr7F/zniKVS84SkJEGFsZ8CZZpjmjbqere
X-Gm-Gg: AYBFou0tQtnOJ1twoSxCUcj9XFZcFBGjT0PouHmde4GS2ZCoduoYC2Xs2ggChm93uDm
	r1Hnpks0jxFr/5B0rAA4RXK+X7ihnnb114BOoJehzJrCedskIssbKMytEZgkaUcp71YsqFnKEW7
	mNUtQ4J7aIYZfZVwJOJTiYX7aD02Ij4FM5ZYxPuAk1Kwz3vPnKxQ1isQyK28HgzlFkPzcHACgc8
	W1M9d31rcYK/zOn7w3xV33UOin5rtclKeUIgWv9CO8YrJwGwDTn1wuqjWSVePsy7RmCNVF8MCGR
	54l2sheDkDK5ljkhQ429L4DX2jwRukDi+Nt587xPe/6vVe2crjigYfvsmR/891j8Ode5WpHm6c/
	HqL7lFheMn0x0tf+j6mXtGJOpnL4zi/S5qx+5Px0+W2M9B2MM6bwZwrly5KYHh/SeoonLhxvxAy
	H0ASXabwt0TAR3pQRiG67dXo/np3gIJQ58T+oubjzj2istOWH6fWqMgwykMB7gFIN6NDZHajCNA
	I8zXo6/rPXDWVGIXfEXf0iy43xMFYEVKMM=
X-Received: by 2002:a17:90b:5606:b0:3a0:e786:84bf with SMTP id 98e67ed59e1d1-3a4d1913a64mr456034a91.60.1790749608041;
        Tue, 29 Sep 2026 23:26:48 -0700 (PDT)
Received: from localhost ([2409:891f:9205:88c0:e839:5391:3544:d94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c758f483sm838559a91.3.2026.09.29.23.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:26:47 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	haohlliang@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers: Clear pending_map on CPU hotplug
Date: Wed, 30 Sep 2026 14:26:42 +0800
Message-ID: <20260930062642.36164-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87bj9fizww.ffs@fw13>
References: <87bj9fizww.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 at 22:08, Thomas Gleixner wrote:
> Why do you need to zero the map twice - once when the CPU goes out and
> then again when it comes back. That does not make sense.

You're right - clearing it twice is redundant. The stale bits come from
migration in timers_dead_cpu(); clearing pending_map there after migration
is sufficient. I'll remove the timers_prepare_cpu() part in v2.

Thanks,

Liang Hao
