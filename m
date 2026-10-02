Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F89403B0E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969428; cv=none; b=khoxD+MfS3aTBgXG8I7PYdEkIUdqpAX3ICyq1oHsWW1IH+cFtInwf2szHlqOCcQeN2mQOg5OVCheiTGRtBoaYFBv9h68KMpWsKTMyS4DST880DSgrhTsWXwIwcVQF5DdkdmX1usvzKs3AtrT7JQgvtTVMwuT4QFB6+V5hiqGPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969428; c=relaxed/simple;
	bh=pLVNaTP9L662KDxDj0b3v3iNYRp0+xOAOWs+AVXQFYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfK9iYAh5BMGjZtJf+j5OXQVlC0uOyEsJBNMkirMSuuEONqB4jedU6AUJkfTc7tlOaLQk8VBcdolkRXaFCNipz7WfaYqqsiyfRs/ADAIHN/Fv5WkkJBogNKI4pE2a4m8Gq/olL2Bii9kX9AIJhs5f582JgBXtJM6REnnCbHegs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=AypcrKKS; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="AypcrKKS"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so6676799eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790969425; x=1791574225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bp8EWYscaHenCl5GeCUCEIO11ZClZpcPuAQp7e588A4=;
        b=AypcrKKSdwDrZaMCBdZ5LLLGkCo6T5Q185BHhiy5AA6Xuae4D1ub8dAdecycjD1V4w
         sdq+HjICmovro/C+KpH/dpmoMwYBVrLqORmzBxQSZvbd7W9FNVzOBWJavnvITPvnkHQd
         WMxasEL+LUHdgfla3Yjmss656q1yPPFtJW+a4MMHzmSPbI+UHUSvtKWbQdlOsr1OUScl
         txDBKuQwXqZGbf9iABULBIJniY4Nu/UVtGUw0HnAAFevlA78Q3Q12F2iAJ1BmDX1PCI9
         46LlmH8RLDMbL5Li4WTG4MLGhlQj4G9yyo19t4SI26RvP49o5DLSt4aCxPM27y7/GVdb
         5YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969425; x=1791574225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bp8EWYscaHenCl5GeCUCEIO11ZClZpcPuAQp7e588A4=;
        b=x7ZX2wkGZidA0zJ8++fRr7NALk3welpD7TUCGYtOqFTcsZxZUKYNeVcn3Xk3gHcaJd
         82pZmqIWxQQddjWbbJUAtlDhaqJWVrffRcjJM2x8HDSy89BsTbzaTFxmSdAMEO5/lfH7
         obaBCl5oQVV9PEYTU8zCNqw3AMKmVdUBKTa1+g1dM0rO1Qs2ZdZCcjqPuIEK1Lqoef3J
         Z/h+DeHeqklEvVoJ0GrKZDOXYzWRuUUQFXwsrYJiCNuBq9bRRaLMQyaeCoLwJYTv0kBi
         5mTWXOffo2XtFusPCYXb7vYfYPNQA/Wtpo43BBGwHx7ih8g6vMvTmmgwUt2KI0QGVRZx
         jCCA==
X-Forwarded-Encrypted: i=1; AKwUvBywtQjo0/v4v7eGhM4RNYGU3Vx74R+nq08GQxhhFubNFpBrxg1Y7niR7XSn7TseRP0CPEqmgycxsjmVpH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK07z8da7bXLKOdg3dWgDRENGQ590YpI7L6Qtr19AaAUy3bZJjw
	5cJUnqyLoVAW/GzjrU3QGYWeELvRcSjYJzdHruQYWmH62Bg/PwD+jfLnEqgGDYFVny0=
X-Gm-Gg: AYBFou24zabDk7aq5b99ZGUgu4b33Ufl2NRSr0VSVTvntmIy45wewpLnTNkMRfKijwJ
	OBkbzaXltRPGham0uTZhA+ezDcojIXcxrIHCE+JZKP1Y/Pa3kY4bL3Y++k5LqfKfL8k8hqO4TdO
	8ua7z6Yu+7pEQPYILD9p/FX0QpkDOmR3+0zBpnr1ihAxlBQZkO7Hre/FOWID84FIPZNn6nwzrd/
	P+VFwXVsbbs9ttuyNSK6OaHpvw7dDHTyVCh6OQ2h2RM5pP8Iz7n4KAXn+M2ecRkKegJ+LbYirQg
	rzRCMFoYntfpejX3XtnWounudQFyMcfYwO9Nl08ODqJ52BmeQjoNLd/LUiS88B4UyZ4WW2cFEx3
	rOm37wl6E/mvedq5dY9UCIt22il0wNhHDNs7vgr9/KiRPvXHQOsWDq5VDXK2aelyXUxzP2XT651
	187QlavWGSGrn22UrUzml5Yc68hlDbnCrJtgCyBWXIAau2Ov2fFLRcB6I/lVIIao71cL7JNUf+g
	Dsg0ha9/h4CHj0XzcKuWf8PvsG7/9rtqUDtvrM8V4JVPsLUxA8x8TwMioIBYF6fezVkHq0v
X-Received: by 2002:a05:7301:2203:b0:351:1282:3e88 with SMTP id 5a478bee46e88-351128240c1mr293459eec.20.1790969425493;
        Fri, 02 Oct 2026 12:30:25 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm8427448eec.13.2026.10.02.12.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:30:24 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Dohyun Kim <dohyunkim@google.com>,
	Neel Natu <neelnatu@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	netdev@vger.kernel.org,
	toke@redhat.com
Subject: [PATCH 6.1.y 0/2] bpf: backport CVE-2024-41045 and CVE-2024-42239 fixes
Date: Fri,  2 Oct 2026 15:30:15 -0400
Message-ID: <20261002193020.19392-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and bpf maintainers,

These patches are the small, ordered backport for CVE-2024-41045 and
CVE-2024-42239 on 6.1.y. The second patch depends on the first, so I kept
the upstream ordering instead of folding either change into the other.

The first patch is already present in 6.6.y. The 6.6.y backport of the
second patch is queued (6.6.158-rc1). Both patches are already present in
6.12.y, 6.18.y, and 7.2.y. Could you please queue this series for 6.1.y?

AI assistance: An LLM helped identify, adapt, and validate these backports;
I reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

Series:
  1. bpf: Fail bpf_timer_cancel when callback is being cancelled
  2. bpf: Defer work in bpf_timer_cancel_and_free
