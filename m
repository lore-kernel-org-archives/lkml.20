Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619637;
	b=qwz8OZXt1KxY1XOC/VnK+ugGgms0iMUCrFTzF8rY4S1yQBptWo4J52qpde8kSYIP4JSL
	 s98g0h9PaV4ypWiqZi3swhkDa6pIunWGw16P8Z50oTuXozbO67q4sAnjodD1FPNt+ulCW
	 eNFB0kY/nEIJSFU+0uYX6NlqKIbc8pMlgEUTooY27wL/FmCGaca8nolKuz3nzEnS8jvg8
	 jjN/3Ay0ndYBjCdZa3gQ/dps9iMgY9KkXzfmi2scPS6YJnGesQ3BNad7qx1B65hapE5HU
	 YAKLx30v0qRpsHGV8XIar+bJIFXExBH33ARGJg4j+FcNmGPqQzF3w33C6MY4MJ/3IzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5smmWE+vGhxqhwgGmPR4F8hVHSCwizeNx+PLtfEMP9Q=;
	b=K/Brp0okC7MjRFyLn6U1FmAodwtrfF8JHt5Lm2aXoxNYQuDjf7AeAnAeAQkdw46XF0fx
	 HRuUKJjS1owjcxB/TzmQCixDQmkvd6VE0/AqaU93e+NcpcOTQrPiKYQPzlxGwRN8VxmVE
	 kDqHcYkyKWZRtTP7AiqNDVC4bnM4uqZqwQzWvgoqbCaujUH1NTIs09iCcfJhYEHQAgKQo
	 40ihLzAuxgok2bJLPLhwVKZCMgiYLCUyhS0m4IjZeGSy2W0kKtJMVyBrXWelUUBiNZqu3
	 L5+3iiLNSWWtnMfw1FCjlkJX+2qAvYnqSnPVAVoR7U1VZCyOgt7UquZ8obrl37I8lTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYrOIihm;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0E60A2607
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA0E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYrOIihm
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eb0f1b592bso9386285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619636; x=1794224436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5smmWE+vGhxqhwgGmPR4F8hVHSCwizeNx+PLtfEMP9Q=;
        b=iYrOIihmmWOs9SPq4jDKL7HzWHnQCHPuGaIb0AnxDCuAklvQaLIIdwSPfsKbbLikb4
         iVpn1+fae3ccR9Ipe6bW/9aLIbIAV1/jxX5cZRlpT/OT1n/2vZEzNI3ppnTtRdxgqLhT
         NA/IT5jr6Oq3330YAtpTQX8g1euRnlTjJdNUaylITRB8ks9tEzV7IxNqhDng7LF9koWg
         OQ3PhiXWzo38nvLiyO+vUT4vSxLK0anAJko1IRxKv4Ii9vFTmExTZ8jflVfce2kSYyFE
         TCHxubALTrvkXc2hBpFpsG3pIezMuTYBbNMNi9ImFe9wHtMPHKvKQdH+Jq7UteApQJpl
         vErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619636; x=1794224436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5smmWE+vGhxqhwgGmPR4F8hVHSCwizeNx+PLtfEMP9Q=;
        b=gRq4HWNsR6MhFP0RwvIYKthZX1n9mz+B6qdEaTC+d8EBCbU8qAVdxTMrqrGSrLHmmm
         MaLqJswy4EmNb11z+c/NJ5+s0D9H2i+pemiKu8qqS7SpVmh9cr33sp4ua4hesPUynOeo
         RRLWlqOh4sNnVdb2YF0K+zNBw1qHGy0vt0/RgdCyLly49QWdbfKQwH9Bh4PZTtbdB6CG
         DJXXaUOTUJR6OjWeaeCq27Y9R7bmYhT7zu8r6/9y5ZL/luyiK9DgxiQ+UMipeSyC+zxc
         ESytL3d3ok3QRDBWur4wDWY0mEk4IR8PJf78IWcmolOkq61ZV+FXnZyQtp6jS2Wn7NRq
         jEvg==
X-Forwarded-Encrypted: i=1; AKwUvBz8f95NZQfEqtt+mDJxCUYbLuW8AEbIfWmQQ0S32Plt/c29BPoPenvtQtU5eW/+3BBuvoEUcKKuExVzvnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99FBnWqXaz8lSIKLeue+GABEYogzuqjpzOWCJPXevbFQgyXhIA
	EcjtwO+ibSDKh6IYcFDg5XyuzaHvvdc7L8Ph/FwSzFMQ+pChVUco6OrR
X-Gm-Gg: AYBFou1YRzfyMxVjaMupEUoS+whkVlsSbXPpwfcYIofmuoNo+wqaZNq/5JIYF8pxKJN
	F0f1NEuOhhvS6HAb3MPuXXDZ0+niKlb9yu1/+PwFrGUouJthSDkVnneyoZpUyszoQqJdHZS7Lnb
	TFpHnjUZOVawviK23/L9RajxdmD+xTJzu6VcPul4wbt+OowDjchv3tL4GAED/dxqerc3zYlv4Zf
	KQAwpEju5TcgL7acVP5+vFfpgk53PyL2A4GCV26Til67yg/vDGkxz+QNd0tE5pc/9EvA7dqiwew
	D0uBuj4oUdNPq/SGUa/xMb201Bt4FHBtUgsDpHUnpK6cyvTPD2RvcemsQS0xc2rVbasvU6xCaoA
	RXxLqAdmWjjzY5s7DdOCYjs18UoZK9l1PKHjqvgguxMmlywEPLGE96Mslwox7pttHdB6JOeRbro
	UuiPwTSsXrrufReYrHbz8rX+ioAlykamxZq5yqaCjmKGQTTJ1JvY8SPz6oMy0iGPrNo/MWE58Am
	4EDgEf1QneDxt9arLeW43iVMLRF4CNunwSVDY8gKRHQT0r9+Il0egWGh16kgRdp+WADrKmVfVBI
	hRKnyIrET+0Fj3fjwzKmbn8kTCctj/G5tSk+HK/fptgsVwNlgVd2c292sdGrW7i0WVfn
X-Received: by 2002:a17:902:f607:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2eb3646e967mr97761995ad.39.1793619636155;
        Mon, 02 Nov 2026 03:40:36 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39262c47sm26652745ad.38.2026.11.02.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:40:35 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: mhocko@suse.com
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp,
	tj@kernel.org,
	mkoutny@suse.com,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Mon,  2 Nov 2026 19:40:29 +0800
Message-ID: <20261102114029.1259655-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auhiGqKJeukk7t3P@tiehlicka>
References: <auhiGqKJeukk7t3P@tiehlicka>
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

Hi Michal,

This is v1. v2 [1] reworked the check, but your questions apply to
both.

On Mon, Nov 02, 2026 at 11:12:42AM +0100, Michal Hocko wrote:
> Is this a desirable/intended behavior? Shouldn't we move the dead leader
> along with the rest?

Userspace sees it too. After writing the PID of such a process to
dst/cgroup.procs:

  src: cgroup.procs = 85       cgroup.threads = (empty)
  dst: cgroup.procs = (empty)  cgroup.threads = 86 87

Moving the leader would fix that, and memcg would then need no change,
as the PROCS walk already returns a dying leader with live threads.
The catch is that the leader has already gone through
cgroup_task_dead() and is still accounted by controllers: pids, for
one, uncharges it through task_css() when it is reaped, so the move
would also have to transfer its pids charge. Tejun, would that be
acceptable in the core?

> Should CSS_TASK_ITER_PROCS iteration see all processes
> regardless leader being alive after or prior the migration?

With the leader moved, it would. Otherwise PROCS would have to pick a
stand-in thread, which is what this patch does inside memcg.

> Shouldn't this be CSS_TASK_ITER_THREADED instead of 0?

No. Walking a memcg css goes over e_csets[memory], which already
includes the csets of threaded descendants, as memory is not a
threaded controller. THREADED also walks each cset's threaded_csets,
so those would be visited twice. It is meant for walks over
cgrp->self, like cgroup.procs. 0 is also what this function used
before f168a9a54ec3.

[1] https://lore.kernel.org/all/20261027144016.2582880-1-zhanxusheng1024@gmail.com/

Thanks,
Zhan Xusheng
