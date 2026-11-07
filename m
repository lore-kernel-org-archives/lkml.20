Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032950;
	b=nECnd9xtvROtXDLmh8gvyNdjT+BtydW1fa+DB9IEWfyqZ4G6R3cePgEi0k5zYx4H2DWp
	 gH5RLvu8o2kV1d/1r5oG90ks0EdMUX2qUQK03hGM1wXqzd84popj56CwD7RJBheLlyaAO
	 YC5Uu91rNbzuqlzll7cYPLnmqa6jCnMEXnmfuywS1kUp3ghcbUcpDxSEz6gLV/HHCC8Fr
	 ojpYvBX1L2CbPkcdRhLdMRtBpDcOCMZbLhkeCbO3u9PP9Cs8T0bJ4/YXcLYXGSf8D1ZJ3
	 nRuoawaopjxyzSkhNbMLxcSYIof2jE1kBdLLgdF5hZwY9JpGrYJRTySt9oZxPUB6Bxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
	b=25FOZNnD68ICCwdWynfFk8wbwyfUa3ZOMMwvBAF9nVQk6zkQZ71xPMA5hz3UgqHKi0Vm
	 hlGU8yHrtQNOCSvRhf1vfEmozxyB7WoO9TqqHrXDSHDAz+/yDEDfC/EmI/uzqBV4nNr8C
	 nLDen+qGU5syuGKqLApmH1mA0VqTOfnJV6XAuSImDVrxRlOhLic/6QkZAJRQK73u8KgUo
	 hX2vh9l+lwtV1ccDJI7Ik1IHhJ/m7oX8HqQSdTyKzw6cG10+B6kH+0ydUvXuBfrDS7hsL
	 kfwOSMQL7YWkfxZERLz8B15g0AmbR/TdbDLx/FtN/YSDtZVpj9y/EPl/Z0jKJOS2tGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4790C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYaIXDeD
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso932083a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032949; x=1794637749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=zYaIXDeD/ZWt27eZTb/FXR1Ei54NEXBrfYk0lGFzIrK04hqXvJbt4RY/udaYZwsuRF
         pMyL/ZYTBPrqyXZl0w51+VFcTtZ7uZpQXL/b1ngiI/AoXN62k2G2D4uwv/4WozQ5OREN
         uMUaMC/JE6irPYbMNmnLX/LBYefPbWV9imrAw7tL2WDIdrjnQM/gQRovFQUfj3D5AWRT
         PrAPoKzlbCKwQtN7ic3//ml8lfhdnvvt5VJJr/aMLo2YwyuB/glDtPWfRS/irwaFqocl
         7K4+eq4WN+t8Ve16MInu8F8YDxxrJRXhmShoMOifWYu6yg8Lee/oeY94kvUKfax0iZh1
         hIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032949; x=1794637749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8O/YtBbFAPp5NwvDGteEcyHryQg3K8JIIIYVXGE7IUc=;
        b=e+8TEAZDGn1Wil9R3FonE+ffE1Y+p6qWBM2pYPMZZgwTnLhpI2ZdpXzt+df3gxecYi
         Hvp6+fCMSCZB6YX6kWsL277Y/IRjJbpDeAT4XD+4DTSKjlZW5LAbMtk3I9KKrdtBSTB8
         trm1qHkJhMJRCKgmmxLnWFvXbLbI49kXkBLe+peTRPrkHrwX4/ic9cY9b512t8Rjvng/
         AJmVB44WEvyKUoBQxuKh8KhzmU04lht1gH8knI8yL5fVByDHdFbaGTukgSTYeSUD+j2z
         AHvkQa9mezW6xSJ+4BXaJJBDnk4AFSgCFjiBKvXIRABvYxnXy5u+CQicFT623kst6h06
         6ysA==
X-Forwarded-Encrypted: i=1; AL+hErG7ATUdX9YfZkYtZMLK2QzMpkSQ+tAnGtBL2UoxVWQuc8F9kJTVrWu23XeRBrSC+XDwq0zYtXS2O1cznSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xc31BQjWO6Q1dG58ANyBYb5TwDX/wFRitD2gXX5SKk+vGKDnX
	K2qeAcxj8VDYFC64OmIrbmx81/aNRFgCUWEXkm4EZmZd8jqKPgDsx7J9
X-Gm-Gg: AYBFou2xytRlnFZzD0S4C/JkdAM63RmSUONcZxb7FJEh1UC7eodEr1makHIY6lCH6/T
	bpMnTUulnDogcqcp6T4qOHpXz3ptxHLG+BXuj27DIw4NPuVNiTPsitAdPXPEjHZG141OpXkF+FL
	+iPehRLDV5oQR83Ewu9AppengV7lj8bCI5viNjGIBUFjdKEglxu4Jg5VxMgKQA/sSgKMFF2X0jN
	AOFrd5J3Fr8eEuJTJCrZRxS8saxJ00ayrrgu+cnEFyRS8SolLeXZ5pHbU26w8nfcsqhRTcdWvr/
	qdDUCKdcVHMbFBjUbr9kGatzVI4ASaFMhlI876RuHZhpVdCpv8tZfT/2z3kM4+RNE/kVybM/tFE
	a+oAjo5iiW1pxua5Q79DCKhik2xeuWdenVPGfYB0cU1slqNqv3W5cNrMe0H2yOIK/9swawrtgwn
	88yi1N36HR4HUjfygAz5ssReCSgeDn0mS9cnb2xpxj8/BfHdJcY1w8m94v5Y3WtpWV21+q6t6tI
	Ceb05PKKA2dziVU/bb96SNbzoo80t6JJn+oi3gx83CBN1Ib7kZ2HSgEeR1Ph0+iXkI5QD09u2OH
	ZJsPSpNG8M8IPVpmVczeJVZBdbdzVZJ5hIEyCN0NXX9x5HEz1Cz3zKZU9AnS/NQ6ZrCRHqM=
X-Received: by 2002:a17:90b:4a89:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b0db6fbf17mr4900373a91.53.1794032949623;
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105854fa9sm2307453a91.15.2026.11.06.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:29:09 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 5/5] selftests/ftrace: Add a stackmap basic functionality test
Date: Sat,  7 Nov 2026 14:28:51 +0800
Message-Id: <20261107062851.3367923-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202648@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-6-lipengfei28@xiaomi.com> <sashiko-outbox-202648@kernel.org>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Sat, 07 Nov 2026 06:07:50 +0000, sashiko-bot@kernel.org wrote:

> Can clear_trace race with the resumed worker and leave the trace ring
> buffer empty when max_ref reaches 2?

Yes. Hits recorded between enable_tracing and clear_trace raise ref but
their cookies are cleared. The worker switches every 10 ms, so in
practice more events follow before tracing is disabled, but the test
should not depend on that. The next version clears the trace while the
worker is stopped and tracing is off, before resuming it on the last
iteration.

Thanks,
Pengfei Li
