Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D0446C1B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193492; cv=none; b=OAF6tvosY0Ak0XomBi+SCQ3lNeqChptA6IqziyKyYB9SG3vEVu4mHDDmIjTRhADT8racTNPDkImLTN0cTOwWVbExh8Ki1Ohdk3RhMcZ0RI0rBR+IaA73Fq5O+3qx7vN1TyIpEkIINutc2Gi1YQZOiph7lSeBfCVEQI7o1rHuJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193492; c=relaxed/simple;
	bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hH7vbVQq8jDKLnDEn1KMSTtCbTRr7AGhEvpSivXt91t57vLlDd7qrjZ/UCeo7EfXtxhVkq0ZsnFLgvO/U2MIHmK1ZUfsgo0l7sXB7/sijgpz4kAqoRStVj2qjTLDszqVAhIFn70cC3lu5murNETyOBWizZXPniPIiFJOM+SXrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJbobjNb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJbobjNb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398b3d66515so2319379a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193490; x=1788798290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=YJbobjNb3Ukj4V5tJTuHK+w7WGwoUDiMvWw7c4XJCuqgVBPbWshddHdpvDtrBmnyBF
         t00VPZbawui3C2zno1hkcGS3mISLidrDNRYtz2EMjqM1bSZI44mdTzX09+06TPT71sVZ
         c/MDDyZVbHkETQGqJyCFvVQu36SZ5kghhi+9wKTFb1Bj9ra5qrlS9dMnfSRyiQgZiB5w
         aefCa/vL8ib0Agah2WFWsE4Ivm0Y8+laiF69xGN8wMURvo2uCPPkrVxqSEACgQDTDrMr
         VF1gVn+Y8EeiBY9gfIdulIRQMJ/hmiuwqEg/S3xos2zE5VzuxDIUPv7tP953tj8WnVEv
         bQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193490; x=1788798290;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=TTQEFkT0acS7fMZFrItpkdeX6iKaZX6lMhX3NktH5ZFfboq3ACE7kZQNz+KTGpMBFb
         AcJlShTqUUXzmxeW/EVT9vXJhXcQG3Po8xUD0alZuKu+73ch6IVmhY9UNhA4cqMVlE5O
         zKBl/exEkNrEmPMoZdn6mSSCUVD38Yn/Gh25n10+2ROK54dYFua9dwFeW7AUY5TXg/Ia
         cYfJ8dHXh6DCm9wsuYbRHTEejyiyrbRhH0jY38Lcid8zx8OVdZV1wCpid5w49m+mG/6+
         Scr0rc1267E1Iu9Tx3pHyZuwlai56JNJMa4oXwmJ0vzFYMBAVniNYnVPbfSqmQbukldM
         Rbng==
X-Forwarded-Encrypted: i=1; AKwUvBzVtLYMrSRRGRF5j5/eGvJVPcShcWSnUL26928YxjwU67JPbLQQkFxKrALQaJvrQfv5dNvGFqSNqq3sEIk=@vger.kernel.org
X-Gm-Message-State: AFuF++ku19JKJORXqx3jOpLHYd3FBXBC6Nf+Dc14PmO+u20i2/4q1/vp
	809G7F937g0Cdjsl84aKvpX2wUdchL+TQEWmVy3hMbmK09YcKIV4QdZB
X-Gm-Gg: AYBFou2Vnmu0pavtSgATrHkciWUUZy/ad5ww0WDKVUGTBfouloE5Gr3Zw2A+lULE93o
	NOlxalAGVrWVxZPvrxKzL2DXqdc/w34ysuXNXOaGUpEDTY48r4rO56NOi6m3FOgH4LiPOHtUwOp
	DJT9yss3OEtitjbAdSt/dFK0C5r8K5RNBguLsIyAZdLD8lgHL2naDossb/WlzeMPwqmti0/rj73
	Vv+45Oofya/zMH0UDUs/6zcSTCa7f9TM7mUxDikR5xsDQeNnX1fk5aE4Suo81LhJWbggRKyeXZm
	uSJWmq9e090S6KUqxt3CpFgKK99RiqyONm71SdhGSoM81Uax2FbOsfUJbl/XtuNZXkf4EISL/iJ
	s05nF/2sbGMA7EMO5ZY5LRNmKCMpKc0dMqZ2wbutDK8Lwe7zwLoUf7W8YDp5rvGIsoF0a8LSDWk
	G3gYwVU0dhE4DqA82fXWg7fZziT4NHzZEY1aIE670J7Tj0mKo7vxyWwsfU6eIXpShXrmxBr7qYi
	0eHx750
X-Received: by 2002:a17:90a:e185:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-396d0ecbdb9mr45635347a91.6.1788193490095;
        Mon, 31 Aug 2026 09:24:50 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:a033:17f7:ad44:4f35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm311768a91.7.2026.08.31.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:24:49 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	ThangNN99 <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH] mm/slab: disallow kfree_rcu_sheaf() on PREEMPT_RT again
Date: Mon, 31 Aug 2026 23:24:42 +0700
Message-ID: <20260831162442.8176-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b@kernel.org>
References: <20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks Vlastimil, this matches what I found and is functionally the
same fix I had in my v3. I built this exact logic (skip
kfree_rcu_sheaf() under CONFIG_PREEMPT_RT in kvfree_call_rcu(), same
dead-code removal in kfree_rcu_sheaf()) against commit 08dbfad3f504
with the syzbot .config and reproduced the original splat with
syzbot's C repro (writing "off" to
/sys/devices/system/cpu/smt/control to trigger the
__balance_push_cpu_stop -> select_fallback_rq ->
cpuset_cpus_allowed_fallback -> set_cpus_allowed_force ->
kvfree_call_rcu chain) — confirmed the exact same lockdep report as
syzbot, then rebuilt with the fix and confirmed the splat no longer
appears while the same code path still executes.

Feel free to add:

Tested-by: ThangNN99 <ngocthang2710.1999@gmail.com>

Thanks for picking this up and for the pi_lock/waitlock explanation,
that's a much more precise description than what I had.

ThangNN99
