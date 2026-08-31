Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C094443A8E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193320; cv=none; b=FEnCGt92+cxH0bdaU7AVSp2TsbuFTvBr5DLPn3Sjvft008JJPavqw6re58jwY8Da1IxQAC1bJ08DonMixJvSdf/OJXR55nfZX2Iy9b5ICNM36l2V1W+qzrjNMYSImqzBsZWltBLWn6M0b24DDluhx8X8h4jYhErIiLksjovFlNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193320; c=relaxed/simple;
	bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzeKlILS1baX62OzD3bGbogU2ptRGfNe59Dsm+35+oyu4Vn3CSQ49G7xzIlse1bbEWc73OkLTegqrBDDUFuhC6qqrIuPCdZKPJ/TBoP4TGlf3aYsOAy121g/Tq4ei857RkLGOItvLk8RniVnM1Sy4t+y6aCc/ANNWx2F67+bHmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVS9ufhK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVS9ufhK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2341850a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193318; x=1788798118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=DVS9ufhKxTBmj/QzbffjIvWJvGOPb9Bpf8SZicEZQvTrq6MH6ST3uohfaq0CIWYB6X
         TUpJDyla2scx2DT2jhFlNIv0pL21mUHztO86obiLc1lxgITF9t73N58bLyZ0QTiwUcv6
         bLdcHO2DUDGaMOCdBCtJMfYBh77bEH6c3W5uSTn6ss4+Hh5agBWjMEjQmmkSpI9xeCMK
         Y9+1ZGFgJ98xjzhnTk0aD+LDkLDrqAWMP+5YECbBd9x0ss3tDyiR6bSg39oP4AHA1/ik
         9DSHKQQieUJALe+xGYH6fI3TarVsYShf10NNt8czDzE1BaE1m4qDuzQTCowkC5+pSfGO
         9Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193318; x=1788798118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wASPUEGd3KOv6Fdubi246q8cZj4P8D3ytyUATn9DWg=;
        b=My+10972EmD00mZhNJo5MjI0Ux14tpfYfZzwoVsETyo1//dOjpuGWFJZcVEOB5j25m
         QuVNAcuqiJ42tSvi7+R23RZIZ7x8/j6gx/wX6mRNNfYPgEbQmoAWAqoL6SKW7qJGjTLr
         ZtGhXs9kKKIHig9W31pbce6EGO4m4sNf4nbaDvzs7llr5lntAmzafZ3IG/PdNd7qkWmr
         vVlNaD7cCVnHykdYnNG+RoFwQaywHxtR7J6Gulbo/Q0keAS6B2fVuhFlHJzCsbyxSeF2
         Y6XqJpTXqPdppbIAfVGVrV1DKqrJuMEEPFgUBJNu7iUY8bSTTnhJSvIfIHvVx/otAD1r
         D+LA==
X-Forwarded-Encrypted: i=1; AKwUvByHTBv1srNfnYmTXSrxHsG5DPrag9SxuiTnN2TB6GJSIW9R8H3aDYYbofARAUjKaLXOspClZYvn+DCBwoo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRPPn2YCiCqRyCIBRtsEm4iSL5IjGCQ7j9464w+ExsTyejam54
	J1mrwzvuZFWICymi2h4rVvzXdgCU0SRbuXixnnQ4ROt7slx1/hK8C0Bn
X-Gm-Gg: AYBFou27ddUbrYdec34vl9X0FWfuNau6SuPDKdgOAiONvKv0QHyAvjc2D7r54n5JJ3O
	F0w5NPfK/90OrmnApUp5Gpn9VIdoZNeIa0ZHSQLlRLk9H6FEoK/E2Nowzu0J4hdWk+Femf9goRh
	GhEJuRsP5OFsvbVrH3wMYeYKh7dr/7pRaxRimLOMH6zyWP7FF2QHzWSy2JWuStQvTAQYbvNuC8h
	Sq2F+lRnJSpuDkaPnHg1+N4kdTUtUk1P5HSKNBmtR8QxF4uN6gMj6SJVXsRilkUcwHiwI6A5QPZ
	ygQqd0+YywPc+7qjJp5R4E+i+19blYOF4rpIC7mz63SsDj90ell8Os0qDp1MrQSg+Oq9FcCj+HA
	Xt2joYSs+MVWmf76qNWxk02TmrJ9BLXVzws2RspO46gHnoQp2ivFWLo/meAhfXaJQ6nUkVAjagC
	LyQEO+Gocckcrn2dgKGVsav7OI+Yx6Rls0aU/bwRCPrSoUZcq0Kpnp++/Wq7l/m0uzb0x6FZTv9
	5IEnqHeGwzAMSoX93k=
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr43646750a91.13.1788193318003;
        Mon, 31 Aug 2026 09:21:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:a033:17f7:ad44:4f35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm308743a91.1.2026.08.31.09.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:21:56 -0700 (PDT)
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
Subject: Re: [PATCH] mm/slab: don't use kfree_rcu_sheaf() on PREEMPT_RT again
Date: Mon, 31 Aug 2026 23:21:49 +0700
Message-ID: <20260831162149.8035-1-ngocthang2710.1999@gmail.com>
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
