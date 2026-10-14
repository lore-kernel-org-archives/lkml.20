Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B034E13EE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021932; cv=none; b=Ja6HnFtpraABpcgC/YzPHLNchPhzl5FGsCPHFZ4/PKmxqYRtjDeoIZ/banEYJRt89vETgJa1MHnARXahz7JWYQqUO4MTO56hKAlcbPN/gxL038HSpkIT/8lQsQlQceQ6TEhdBRmLyNl/TDli5W+sZw5n6rL9kaMH/OtDnaBu9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021932; c=relaxed/simple;
	bh=RRLqekvGZQ+53SYPIEm6C+hfQvOWKj/0/1Rnrc6/8sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOCNK1Wxx2wAGRLr7vg5pN0fqXF3elnKBJX87E3TKfafFAcY8r7OwOzhluYbDGK+6450UEXboojteXDSHZoUP3R6d0zUVPM4WpEBDDyMTyWb03glAJP2uiBiao3L9BiUOrHw7cE8bqZpBPDlBJpNi07um5l6KBl1Z6mSnCAMuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU4Q/Tr7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU4Q/Tr7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso788494a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792021931; x=1792626731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=323vij1mo5h7hUHWqUpabgnpKBMGHxI36tWkLHAoZ2I=;
        b=OU4Q/Tr74rMH1Mw9h44mxxaEBwoJ4ha0yvl9MEMQsxIoBh8MYOouk3gvQn3pToYssq
         v/R/oPSt7/6ooj0Hg0Gooi6CkgAUZrlQiBvn3WlA2XyPbdoBb04uHwmWRmnPGtS8hcow
         QUh+ANlne3J/m5OWnntEBOJviOyDDbeWo5BcOFm7bbr3PMDNj7TRKoncoz2ddiisgwN5
         wbBNAPR6V3HPZEc3/GvnHnHXQaKf8vQeX7nWQFS65CU/HwFMfWNdK09AbUg507LTOg48
         udYuF5EHvThqksh/3JrOXPy547Mnyhw8q66aEZerijDlYRUHGDq6V3yFLVNj082AZeOl
         nJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021931; x=1792626731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=323vij1mo5h7hUHWqUpabgnpKBMGHxI36tWkLHAoZ2I=;
        b=HjyO55CqZUBAFMEF/e3Wfmvbyu0ROrzeGW4uMhO6fLaY+iU7z6NrsHUr5N9LCht7fc
         k0Fl5N6vRFZ9CN5En7Ialg/ByGna8s4MlyAzjMe1zxXZraVMP6eSlKhTLY1G7TBVJmnp
         IHgy1QNPpV5tgAIdbq8mz0Af1SWebby15u9pRWyX2VtQPEdKzX9MY7CykbkTKDUz1jhN
         s0zrC5BcgBAXuK5My1hldGt+pcR7mPsTW0Mqsbe21lG0AbbEiY00PTrbspRXmDAvudu5
         fOEKSIGky4N7PMABi1tmWRfkH37iRjVAoJiP6SLxFphc/OI7ms0Xg0FLluFfSTqrIX+B
         S8tw==
X-Forwarded-Encrypted: i=1; AKwUvBwtdlstGCfbHoKbZCT24y4bWWf9ytMEbcAR2xINKt9gbpEncbgL5Hwx3RM44JlNZB2qqWvJP8RqDioTiAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyYSC8BrdksNXZvKI8ho3ujv7uBfDkVkb8NCb2WmCIuuIioVkO
	a2oV9CXPQ4JkG/IvM/cBY8a211AwPrWxSlNJVAaS8uoKYlxtbzYplLbf
X-Gm-Gg: AYBFou1mTWLvnLshLsXqv/nDNrMR7F+pn8TSic02ypfEsc7VqXSplHIRAWjhIKx3xoN
	zYO1Plbv9rJIUpkFGkaQmdww6/5wySxFv8c4TfWQSulFA+EqtIrf8Q5CykU2X/55ojIbLb0SRuW
	5jSaEk1cuYBRGRQSBXgFF9llIX79HDdxaDi0035lFTpuQvAVNZpztvzY5LikFveo76T1BK+zb1o
	qD8e53rgnqqJy2s2aO20VvMu7dqqxs1DGC8N7nNURUMNLWWgFBUxWlnEBP8B2o8QZIbv6uG70gG
	ptce2HxxPRDw6KZQ9yaRV/Shhffli0VRZz664t2E6cd1RDm/c3QWFq79/Z8y5eMVMUXfdWqX312
	lRXiTrRtFZz9AwQi/YMzXBUxtN8Y7RLauxbP6cT4HU8b10rBsuOnDCIP4bzgF3/t5p3yR8bFE/O
	asfoT5aCt5ONY+Yslshi/WuSgWkmuzRZheIPwj9uIhJJjCJLix7pnB3hJ/tVGL19LVSYDQ8XvEz
	Ge9BTvWciTpCPI9nZZqu3+eHhBwT+YQV3R16USn0/bNJdcHjuGFg0GMpC1uC5WN3EbP+0wPY685
	cdtADkmzz5gZJOzhHppLLIaySr8=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr12576549a91.6.1792021930548;
        Wed, 14 Oct 2026 16:52:10 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm1500440a91.2.2026.10.14.16.52.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 16:52:09 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] ALSA: pcm: refresh capture pointers before drain
Date: Thu, 15 Oct 2026 08:52:03 +0900
Message-ID: <core-drain-helper-reply.0c1099dbd0ca4a37@gmail.com>
In-Reply-To: <87jynkcn60.wl-tiwai@suse.de>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com> <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com> <8733u8g0kh.wl-tiwai@suse.de> <87y0c0el29.wl-tiwai@suse.de> <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com> <87jynkcn60.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks, I've reworked the local version along those lines.

The helper takes snd_pcm_link_rwsem for reading and updates each running
member under its own stream lock. It uses snd_pcm_update_hw_ptr() for both
playback and capture. I call it after the existing pause-resume step so a
paused capture stream gets its final pointer update too. The pause and
drain-init actions remain outside the link rwsem.

A pointer error now follows the usual XRUN path and returns -EPIPE before
drain-init. This restores the group-wide error handling from v2 and removes
the "notify" boolean argument introduced in v3 proposal.

While checking this version, I also confirmed three problems in the first
patch: 
1) a reader already waiting for data could lose the capture tail
2) finishing a capture read could stop a linked playback stream
3) DELAYand SYNC_PTR(HWSYNC) rejected capture DRAINING. The local fixes preserve
the unread count when waking the reader, finish capture with
snd_pcm_drain_done(), and use the cached pointer for capture hwsync.

I reproduced all three failures with the helper plus the old first patch,
then checked the fixes in both atomic and nonatomic modes. The blocked
reader now receives all 64 final frames, capture EOF leaves linked playback
in DRAINING, and both position queries succeed without another pointer
callback. The 26 linked-stream checks, including paused drain and pointer
errors, and the 10 existing lifecycle/reset cases also passed under ARM64
QEMU with KASAN and lockdep, but physical real-world device testing is still pending in this time.

There is one concurrency point I'd like to check. The helper releases the
link rwsem before drain-init, and snd_pcm_link() allows another RUNNING
stream to join in that interval. The new member could enter drain-init
without being visited by the refresh loop.
My question is, should we handle concurrent linking across these two steps, or leave that outside this change's scope?

Thanks,
Joonho
