Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480348;
	b=dDZUQ1TZRjSHgCJmK5LTbvHdoZROy9RW2Nt8qE5NXEsF4395ePXQnqBwcLt7vNrfOmdc
	 iobWakkcxisVAjSqFtbc6lCUm/79c53SDrki8IqlnN/8WiNHmGYjFGOnH4aOvvjoNtSFH
	 m/fPlG07YzSsUUMLstQ+KeXF0TEmjKCqkk4jM348yZyQNwk9kJBEQ7vE5ovRuhp32Ierb
	 YBkfztNEk9f9yhUBhSsUROQzyDu4q8o1kpRMLsfl0gAUnDsHs7DQroz6HDazLbddU8p1m
	 lTCFDmsvjyp4TAMlKovkcmEnD5G2oePR+GyUZdCIRleFA6Fy42OpmpasFKgm34gZ7Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
	b=0Yv+/InBk8Dm1/d+TxeEINlqcNAqi4Q1H1BgaY2N4D4BibJYY/sQ1MDnyAnjyWq+8Q9F
	 ns0//vv0e7/2qEPBiFbK4y9JS0osrFy0v57+POFWgCFiq5zEeKcH1tEfjBluzcqisZfZF
	 tSSAa4MMoUwQ5HEsU5LeJBWkXGYC3jj3Ssh0AhUfRYkJp40E7Q2IPlOS3l/Txu9pLWw+C
	 4WJZG1jbMuR9hs6oGF7hQhkcCIiATs3WWhyPlN4LhkW7mSygNzyNNO5eVKF2flqZROro2
	 JHFRXYEfpNYk2Sfe74Fmwyklycfi9v/HW8VGgTapAW9yYgMGfx3I7JP3TN1yd1fIMQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcPiMBtA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5F606A8A8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF5F606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcPiMBtA
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2433562eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794480347; cv=none;
        d=google.com; s=arc-20260327;
        b=VVxbcq7Vw6vrlmXZbTDAYptlBiCHojKLD8sxmaaAi01hwBHgIeQG8aje7Bjsn+xjGK
         c8udaOtwYXRLrB2SYcO1DGuUgmfrURpNN7nf9T4DEbXoTx3hOJoH3c7kR9oT9fmgqMPA
         yryXuDVFtgTdN07LpB4KK8ynWIvci90Y73CJXHm4RIWLOCCbVZj/LWHmP2P7BZx1gZTQ
         BI3sWCsSxoaQqPwl4tkzywt5XY3f6YeFyk9YQBCYBXyhBrFni4+Z0UqxB7TXah4RBy5T
         xl9ph+6+81RNOH5c9In2mCHGPG4JjnPECQDDq+utg3Fm4tuX3rdQLspBG9D+piNxnNCS
         pTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        fh=CPruOmcUOcWRoD2p3XFomAPPlDtQUW6qJm4cw5RJLTA=;
        b=j00+7JLj7LygBeHyAa7CpKUA345oCE8Mzxx44iKyL36z9/fpnUkB32aw09xjqBGBJZ
         VVLcyiaXmYCusXQca8dVdZGobsRAsDnkPtHfnAj68HR0XVCiZcPcj01sNON5XGba2K41
         sb5BQwLWFLSVWqP6RneD73Hto2IjF2W4YkuNcV1JCSPHA3QcKyUXQeRdM1f+ig5AOc8w
         yn4Y4XfAR0LolGtTtMQWiBjxXEf8Oz+TYFzdmSwNFOg3tAZR1MsvTSCElkfsad0RCh5j
         akFFhbjwWMQIOs+d9n7qaGyOa2pfcRSrTcrm8XpnPXvp8hk9QgK7z2Nokh+djPawj1Qj
         NxOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480347; x=1795085147; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        b=xcPiMBtAELHn3sgyKErFDHKe52oZIdZV/+UcUTJI51MVq34g1dR2eDj2nxtlt6O8gN
         ujxl9Kp9NnxitTdfcTiU7WqI0qa/lANz4ihDJAVj0BDAMGEHP7tr+TCelsKdxbzp18G3
         76DyE+oRDfmbDAilSh4EmN3LaR10QHrrnzWL9YKFcGqWSCIHGZYuP1NjuC1z+BZN3dFM
         8snWKAclZQnbkdGtLr68y3k5r2aQuv9o4eFn/9v/7VnPHBWCpEpPHp7/LGS5cDcJrUgg
         2dKjCloKWuJEZjPp+YRKZgkOxYf+LYmZJAACS2/6j4uCcShl9ONNzfmKBhuj3OeIQYKM
         8Chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480347; x=1795085147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        b=eDcrk9me3NkDCXHarFtxQQEjBM1Z7VWXjN+zepdZdPiGi64LQvEKXmfsrMyzN4YCkY
         JnRrY8L5WG65amcDz4YILpuKRSLTF2LjNWqknCwtJK1s/RtlLuSWVJBmlDCpCIbu7+gl
         zqR7rCSPrAEYruZhJqm4KPXbMCoD/yFlFDxxcszBZ8G8fuXgsnSCKNYpgkoP0hNomISl
         OHR/hYzsFnIku6AkVot48TMVaXMskYNMg3yaRcFEtwNBkaQiz7Gla+vx3NoKlGdnU7dl
         FEN1qTf+/JsyyHVk9z6gIkV8T34HiXmajde1xeWJ3cv41eHroORRdgettGSUOlQFffK6
         9YHA==
X-Forwarded-Encrypted: i=1; AL+hErEW+qdDs53q0snEwreK9i0n22UJ30uX05wKYM/Xa+pnHZBHSmfCNlWUoz6OcSLdiZeRFRM/7Ar6jigwm2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9nhS+qDSD31kiidqFKKOQ0CcDtb8tGxMeUfzzdO81JSE7GZCc
	SwcDj9ckTQ4UXXc38e1kc3wXtMuWakCIcBJCtBBUyJi4KmJF9zYBefnJ9qjN4d7APd91HYPUbij
	taImRx/ths1gIcTi3lnfHWxsNrwQpVXE=
X-Gm-Gg: AYBFou1+yfAzYs9oTvdFQxgBgvZgMcFrdw7cYmhd+olzTrCziU/L9900PP/rQD4G+PY
	1kbEPiIccb2RvOhAYd0rr/8ayZ8Q3t1ohCleOSnivkC67FPCNxq0sGWYb9xc9LBo/S6AIzVUfPf
	bVBOTPdT9ZRbxE8v09dZXEtPumB/vcDNyPnPm5KXIFc39mLY5B7hF0wmyNBjg0KNhHV1COq0FVl
	PHQknD1rCznZt9unZQuGAk7vVa3ZqV1T4fQg9j8AdQAHQy/CPLxxeI3sIgZaAllJ33YtlAGM1rq
	EsixtKXv3UzYlQJZg6uounBq+TUaRka53h/DcY6g8NolUfMbLaL8Ikv4tsWEbLI17PSE+G6UCEM
	A/YQCK0oQYEk4SsJjHYie6zrXqhKWF3g4IJJ4M0M=
X-Received: by 2002:a05:6820:1621:b0:70d:77b7:6879 with SMTP id
 006d021491bc7-7191788d816mr3318135eaf.36.1794480346869; Thu, 12 Nov 2026
 02:45:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avA1wXhTMs9eY2NF@chrisdown.name> <6B8E9261-3FF8-441B-8F47-7D35834A8D35@gmail.com>
In-Reply-To: <6B8E9261-3FF8-441B-8F47-7D35834A8D35@gmail.com>
From: elenchist <elenchist.dev@gmail.com>
Date: Thu, 12 Nov 2026 19:45:34 +0900
X-Gm-Features: AclHuK8UhlNcIj8rZxl-jPAQ-TNb4Ro929pQ1QbaMvl25O9AF4j0sdfra1fF6R8
Message-ID: <CANYAW49zq97w7ptUO6xkXZ3e+CNMzWH7qxQ1bQu4an1L6_kXuw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM victims
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Tejun Heo <tj@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

My mail client turned the backslashes in the reproducer into yen
signs, sorry.  Every yen sign there should be a backslash: the printf
format in overkill.c ends in backslash-n, and in run.sh each of the
two "$" right after "echo" has a backslash in front of it.
