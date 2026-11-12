Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501514;
	b=B74B5pn53FGM5yMSX0E7oACyhQMwyqPQIhZ/xyo6iRS/wV4ncMTWlcRVupAA2EbJ0hL8
	 LuqEcQGTRBJV5yTnUNrWqMcF3J5ZbeRvMX5AJz2YFiI34XoHn05kw8zWrQZgc7iO2PwvD
	 rqTTpyepPGdG9v985D5MXABEsK77eNthhl6lMjcaG/3rBAusqExIXbe3iziWbCox8pXBA
	 28CXWKPBIllFaiIiXYJIhVinl/zWPF4eeb6LnNHpwrkQYI0B3OVuHlWTUgdI+KUI4OqNE
	 y/NRbJj63f8XlFMCMo/OncCCyoqDA9jx7+RAYN4CeurKzOZfdYqi7hIwYvs1VG/pEcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KAyauhGpYq+rx+Ov+2pDwEo7otWeal2Xqa9jMkbqz4o=;
	b=Bt4UcBLu+OH3ipI0Qur491sFDUcOVGuFhz/ZGFPKyB46ut8UFFDzibqBrWIVPofVouie
	 xHCfh4DNHRLz12XJgl8KE+PPI4IDvL0PzEK/WjaIjWnzMmmofeDY7rhooC/fHt6WC+Rsb
	 zkW50Akzvomybna7JVQQXgflcyrJj8T6J+DEAjrvx0HpbbJK+iRzzsjB6AhQzRdE2HVYY
	 NnZrB41klSDSrRuxKoWf4ScC61u7aOXVSaYqxaHWal7tbRMVXjBs23f5Z5xrocLDROtB8
	 tlKrVdbsL9/2Eo/uzPXikOQ1QSbqEp4P7TjmkXeGWfXqieL8+n1f0oyNXurK53sq5LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IPIBqmgs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDD60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FDD60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IPIBqmgs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso2546019f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501512; x=1795106312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAyauhGpYq+rx+Ov+2pDwEo7otWeal2Xqa9jMkbqz4o=;
        b=IPIBqmgsuxWcSkDWAhFvmYMDee+qeQaf0IIB2iyaCJQQIH3nJ+ZDmBOpKavtvLs9tk
         REiWhUkVR2lgZdLeezw6ukJZdzTRxA8hdRJefrKpAQ1agBcRLvj/uU7TrDy6bkyO1Iav
         T8yPeLbJgqQ7dbgKZA1r65bRLsiIUyhpEIJxLH+IsVPlDSbyrIt/kJtuNDpDDY/ooc83
         cbVFZZOCz/4wvL9kkgyFEt/LHKYjYHO+tU2N2sWxMjwZCf02yaR3MotDmxE/BI4rE9Bz
         S+N0RlkOiIGdT8OBDWna2EQonMYhjaPgyiUa0/LKpYB/sYPGasiOUt/72b99xGi1n5hV
         SFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501512; x=1795106312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAyauhGpYq+rx+Ov+2pDwEo7otWeal2Xqa9jMkbqz4o=;
        b=Ms8UnQWKOePnmjNtWsqWKfIECFfKpq6JVx3xTErGkJVNVNMGnhvcXGnXILzC12ejCn
         Iw2P/lx9JxN4MN88B4eIIv4Txb69A9ZtFz3UJdMqJA02lhadi9vxZ3AW/aRRYCfLQDgv
         1mAZhldrO/dlikZ8fDOrJCaa8eto14cC66Qw5mn4JXXxMUcesQee5cmjb5+j87E4tHui
         Bhj9cK2VCTHiPPU4kzarROqCxCMMOueoPGRA6yIsEvMUpMw4AKYYdH/Goj+QJqvhFzHy
         bRzRTLS7egam3p7yaHgoQ2pFxr6NGogE+Q1pbZfnTF8mur55wKL0yxy3XnWbXsS0tm+p
         wm1g==
X-Gm-Message-State: APuU4Z/y9N+IPQYYL1JLZ6asdtL2SiWawDI2PLpviaqWiEeYh4DNC1pE
	lgKopXTrJQa94eyHobp8Mye+PkvzfGZKwAO2iUIt7mULdQTnDkFLDxEmh+Y+T0JgKorGVoIUcrZ
	vIOOsE7w=
X-Gm-Gg: AYBFou3ENkEIVcolGzIlHyR/aRF1MnYdODshRA8D1HcEQqHxV433jxaX5f2Epo6Pi/K
	Kk9KKrCZ450XQ2dKMgi5Ijl3eTEg9zumUhPZUgiMpJaJW6PBOYmIlLk9efi03ncTmCEL+gzwwKd
	Su6l17yeN/UiJRLarT1Wm57FETECOPTAjaIEpbg3iVVQYShhj8OXH94aXEDSgHXWMbmlqOlb7sD
	VTBakGN4jqNjRi2ZtSj78kJ82OuK0tt+BGniXmEJyRxEUM5SKS5jt5YI2nlkluv6EYsEZ3wiwL7
	n4uG3QwUoUc7Lu60LIM6b3wDfEpIvB0GzPp97EcxEGijwzzZAwGc2cx9iDq09VtheSHVpFCL1WC
	IYr30D1kGvZkq3cV3iPtk7GeCTvr57GvWuC2gA6j4WWYGcx3SW9b9Kkr/I/Sd9dAgFxH7IQWa/K
	MRHF1O4h3nb+K1rm4VFKBgprV043qutRgeJYKaoa6lnJKO6uFTIx5NyBIg69U0Qn+aDGZlVDLld
	JU3yF4V5m0yYY3cVHfkhvilYyIzgHhYpCH1Ib0JOYaRJ4yZH5C/IUDhopCe2sAWGO74Fv5LhzR7
	OhIML45JGIa0YwzgzX8fa5VsT5uysrRMsHSfG+nTsNxmhw==
X-Received: by 2002:a05:6000:240b:b0:48e:b1a:fa6 with SMTP id ffacd0b85a97d-499c6da1276mr11397006f8f.40.1794501512093;
        Thu, 12 Nov 2026 08:38:32 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:31 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v3 5/5] Documentation: no_hz: Add tick stop in polling idle
Date: Thu, 12 Nov 2026 17:38:13 +0100
Message-ID: <20261112163813.524336-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112163813.524336-1-marco.crivellari@suse.com>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
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

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
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

