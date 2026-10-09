Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68F4EF15D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568101; cv=none; b=iNQQ9E1HkN7z6JcyYoM+Uh9/qLvqJjb+13m/VBghOYM3gfPzBHDLjKat7FFKUPpaV+Wx3j/21nir1fbcOMpYNfYydg6Y3wY2MATyCRfm1losYLeWnrCX4jhOb/jV5JQGBYcwvJlYcQUTItLjIz+VVoUwgLkHSG9XCMsuIhGUtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568101; c=relaxed/simple;
	bh=ZB+QhjWlZihQRfvMv/Dj875JM0J+8Z4G9ddtInYgxfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzkBlFx6romqzkyxQFnRdcXXFv7Z1O027VIwPeBH8CYdG07T8y3MJCySpXr/fV3+R4RldrNkmKdCDojkjbX5/aXmrfTZjTbXQ+GBjy3XZvVuocvtZOOre+lSTPiWY8hiEupctQB5BCAbIt9jfspvJZD5zNEeVYw5IJEHIp8yiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biE+TwwW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biE+TwwW"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so3600680e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568098; x=1792172898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIoLucY46RoOKAE4YSSq9qK6HFpOXQ4Dt4VNaChanAo=;
        b=biE+TwwWREc9Dgg/R0yHvgk7JCDD01AOWNsS3sAKOdxatRnJ22vN2FmAKMpWXqd8el
         mtfE1dxIOwze2nRvYlCmINnmG4ifPn1HAaIrnXx+9OxFGFNMXEpUBSJaoeJomW+nax3N
         LES0AaCT6xs1xfhQZbrfqMRc4UiXuJJ4t+uLdCX5ziQFlwTp1gVPT1EJA0feyrddCQR6
         TNsDYx8Bu7QLG30wPzXfgcXZK17G4IHOZadX89C08HQw+lWYbJVpWl6pgHRtFa6yk1Tb
         NXkkBqvuNHEz3RKsWwWaQpjAd6a8AvjmHhZ2MHspbnDMIQ1h2mmFe3/Sg8TCf+OPfaWP
         KTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568098; x=1792172898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIoLucY46RoOKAE4YSSq9qK6HFpOXQ4Dt4VNaChanAo=;
        b=IhDYM7oJQzB3Ifwe/Gsi69Rayfmq37ohpMrA9Wz7ZRS6/+ujjeeR9qwo+ScTkfm8D8
         +1RXuJY3NWFrucN8QMOM0YlF/EHvxm4g0TZaTUP1eBBzBNM2o+rkjoyjd9NeeLVBqUyk
         ePThbIik0EqC3nJAWPmRmprBtKj0GumxHXe8szUJIWTlwr/aYu0qWYwuBWIe0gPdzy6P
         lOz0EMnenmAK6EffZa0Tdx/uoyjuOgdysCORxwHmfTLQ6gVnW9bp123cWmqgZ0R/rz0l
         jXLsh1G2XAvWdW2B6yTiSMu6k/sW3NF5PuNroLdU76DL/fdJT4PDr1Bu9R1QpxWoUV+Y
         UWyw==
X-Forwarded-Encrypted: i=1; AKwUvByUdmWb0Uz+GsTAVpVUBUA8aSeTJq+P1eb6aqiosElweEUZ3BXRpETCPGDk6loF4Hq+ibr4MnKSUozkVn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuHM86TbcKVrigYz5833ZRHrfq4M39ikC4Zeu99BbrCneUuCSp
	0xbw3NmUyJE5vjS5VukLiO+5oWRdH7VAXpUtwtpU3UG8+1T/bxveXohO
X-Gm-Gg: AYBFou2aSHBVT+ghQLS9QMXQ0PVU0WmqKrA0ReFL1+I8lxPATFhNsLV7YVE6jfTyHVh
	p3aw/8Srh6fphyzC59YN3BtHP8EFNYPJ6Zu/DnkxyetRxOCfggElk1U9losoIQfnylxLtfGbHBp
	ZHvVcVZe5Xm9iTZgdBRFcTdEJ00xqNcWOs4VJuQ5YW7h8YTaDm93Kcz66HljcJyeHWYd7CiAiw0
	JV03TgnN83igbR+Hgrs7tGrId0OvRoMft5gDjt0zhT1DO41NLLOBvE/oPj8ulg4gBSy7PYE7XOo
	vkZ748QimoHePRNgho9MPflQgB3ZzFnv3BJy0Egws7fx2LfYz1Ur0dkScr/FA8ivDjFrauzMMIy
	q+aisA6CPVyLspk4/AmnOYhD9pICMWTPGmhYIDkfEJAEyddfS0aBwxwAxZwlBn1LlXpY4fWKik3
	k00uaYItnIlFmCRGNXFDPrKaHoqKBefTrXyPHLRxV4cpG8JRh4VVmsN5I5kNvGsSH7Myz8UjQ76
	949VGeOdhuwFUCFMiCOCAutp9seqtrVK17H5bR4OxD+jAR3xW4eH0DmdM+9hTk=
X-Received: by 2002:a05:6512:2c8b:b0:5b8:bc5e:d0fc with SMTP id 2adb3069b0e04-5bcde6cfc3emr972437e87.38.1791568097844;
        Fri, 09 Oct 2026 10:48:17 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm852635e87.63.2026.10.09.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:48:17 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	memxor@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf v2 1/2] bpf: test_run: Fix false -EBADMSG after skb leaves CHECKSUM_COMPLETE
Date: Fri,  9 Oct 2026 20:47:47 +0300
Message-ID: <20261009174755.22026-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009174755.22026-1-skokovmaksimevg@gmail.com>
References: <20261009174755.22026-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With BPF_F_TEST_SKB_CHECKSUM_COMPLETE, bpf_prog_test_run_skb() computes
skb->csum over the packet from the network header to the end and marks
the skb CHECKSUM_COMPLETE. After the program has run, it recomputes the
checksum and returns -EBADMSG if it does not match skb->csum.

bpf_skb_change_tail() resizes the skb with __skb_trim_rcsum() and
__skb_grow_rcsum(), which move a CHECKSUM_COMPLETE skb to CHECKSUM_NONE
and leave skb->csum as it is. The post-run check still compares against
that stale value, so a correct program fails with -EBADMSG. After a
trim, skb->csum still covers the removed bytes. After a grow, later
writes cannot update skb->csum, even with BPF_F_RECOMPUTE_CSUM, because
skb->csum is only adjusted for CHECKSUM_COMPLETE skbs.

skb->csum only holds the packet checksum while ip_summed is
CHECKSUM_COMPLETE. With CHECKSUM_NONE the stack does not rely on it and
validates the packet in software, so there is nothing to compare. Only
do the check if the skb is still CHECKSUM_COMPLETE after the run. A
program that keeps the skb CHECKSUM_COMPLETE but leaves skb->csum stale
still gets -EBADMSG.

Dropping the checksum offload is documented behaviour of
bpf_skb_change_tail() ("implicitly linearizes, unclones and drops
offloads"), and the stack does the same in other places, for example
skb_forward_csum(). The test harness has to accept CHECKSUM_NONE either
way, whether or not the helper is later taught to keep
CHECKSUM_COMPLETE.

Fixes: a3cfe84cca28 ("bpf: Add CHECKSUM_COMPLETE to bpf test progs")
Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---
 net/bpf/test_run.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 513354e928cb5..d73cd247f8cd0 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1237,7 +1237,13 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 		memset(__skb_push(skb, hh_len), 0, hh_len);
 	}
 
-	if (kattr->test.flags & BPF_F_TEST_SKB_CHECKSUM_COMPLETE) {
+	/*
+	 * A helper such as bpf_skb_change_tail() may have downgraded the skb
+	 * from CHECKSUM_COMPLETE. skb->csum is then unused by the stack and
+	 * there is nothing to validate.
+	 */
+	if ((kattr->test.flags & BPF_F_TEST_SKB_CHECKSUM_COMPLETE) &&
+	    skb->ip_summed == CHECKSUM_COMPLETE) {
 		const int off = skb_network_offset(skb);
 		int len = skb->len - off;
 		__wsum csum;
-- 
2.47.3

