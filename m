Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811386;
	b=V3LoxEFCv9b8Q09W+ZCamI6bwJCwY/I5XgFhyR6QFluRuZHDoXl+9HPw3gdeUmIA5q7T
	 RRj9oe4a1QS0dPQnk36i/FHXCeILVljDJVptiPLFfUgA057vPQG97zjsb5r07/1PDxtDp
	 hRF9WRHEfrFeBKxybYI+oDM9KGSmXYL2krPvvl081Hv9ISpXg+1870cZGa+im6SX2tVT4
	 nkp8btHr8KDUXhZCgdn5Xqcxy3Fpv54TFj+UBbcwg1UlKtKzVCBib1tHNnZ83eVmGA6S+
	 C+lLKLJxlnOzPophh9Ymy+qx/khQ1pa84z7m+EgqdPXsNzlSjZDjemqCjzTAJOeLpNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
	b=Ghgrelztw85sSy/iijx+XwaBVO6XxL1LX6vuLM/Qqnb77bxLRzUNOu8UZEVJGmNtrIwq
	 FrVBNAq72u+suWzZUKpCoc+3AjnDQ6YoX4ZmcPw37gLqB6W+V1DJjQ6ZvCT/VM6mTVauD
	 eHRPGI8eouicmRuzFuo9gyYhhDWpo/5gocBWhW0FcxX2ivjOt007aO1C2wzTGw4UJp1UO
	 QXr+MJog4J/zSPUSw59dtfuwOvMDTFWYW17jmEHBVp4v8xjkLK2n2L4dLau8yV0ZjcvYS
	 vhDaRqn3aKdLZJK5A7bJ72BfWH+GBedEKC7c3L/v5hweLxqckgm2W2FpHDIm7CvSefQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11671606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11671606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1597128eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811385; x=1794416185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=Ds9ImoNFnqIw6Qw1Xrge8SkX9ej0FZa29MRVRM8wFsA0dQhuXWwqhtoYP7h4kad5e+
         CujAQIMvVoW8e/ktVA4RJkhE4uKZXGsISnstiGMOLDEmO9nifwT/0JQRpt004gFRJZka
         aEN6hIa6lRyLDyjswYqiyD8FDsS/G+5MA7geCMPJHINQ1V8ZqZdDIveb0rMC984y8KI3
         eR95uJTOaQOkLl/fbaGQHrdaL5TBwFQZNwuQsEHOhhRuT4aizhsDX+zooDipclNZN4so
         bW+qgoLjH1gb/KVmb6CxV62RY4uS8XAiAEaBZKn2+qXwuceGSXYh9D9dKoNtagpVAIhu
         D+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811385; x=1794416185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=kdsPmg9vY779mPWCjcld1dIPzsawh0I6uSgnl7Ds7QqegcHcszpH/nrab3YJma897e
         Q6MwW7VCS4Ry6y1T6OI/dRpRabYCrCWsGBr9TC6B4/T0EvAfYP4fZJyG5640GH2FnqJv
         67Y01CbrqUmbPFVhudMsjkAWFCykxSmFK/8Wzv/eG7EsgNk9emmRIu7zHh4xah/1+tnr
         /ARBmicD7BNxzLcfxoFst06eu0bM5eygaKWQ1RDRwElHh7ELUook8PcAoYd95W26B0lu
         7cuoUHpCmWfIz1RMt/YIT9jzbBDXUUCv/xByPWKrMSfEdjlAV2s14mtefb8M/oJ4InqL
         zyOQ==
X-Forwarded-Encrypted: i=1; AKwUvByP+2Dl0ihEFVyRLAo4IWEnSyszrhqUs1xBKrDkaW8jWsUozlSr2G4shWCmV14IZQAPTfAOrVkLkHMboWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RUPrWktsEFK7MI8l6SHWzMS6UVbrfGQmh3VaLtRJA4aHJGqpd
	DUDpRY2psx8bxhBn4k+RDBvaKEa6lQhftupu1je3wsTMyKITWpBjV825
X-Gm-Gg: AYBFou2Ju+khlgjl2iMcL/GZCHkcb0exDMl7PTicCv/lV35CWIN5bkMvq6W/5/4Mx1E
	t8wGFSoTd6SQMQnLETYRBNK21tukfr2+vtoEQ8wsr1BAJ6YLWpEg1TEHn7K95GguQJOFQKGLhWD
	5+Uir0OOXY9+yvq1N17w6WkODkMZUjaJGXX136dd4EtvgwnhC24DbLB5DTm3ymRKDhv9qKuI+6p
	I0FrpbriLsceQMHZU5qONaDnIbQhjrMbNl+BmvhZuMYojgonck+6rXUDVGt98YhkywynikjmzEr
	fYQKc74OzXPAvzz2Tqsce/E+v7iqf8R1mXBea7EEbj2JqHO9rMj0txTpOCufhw/pIFV+3e0vn5q
	eAG5H7lCniWiRYnec7p3FclyXqnrhQnUDIOgfP3r0JX9UjZyUPtekFMw1h8YPrPgUP72YVvUZDg
	o62VD0xyHvE3NAgIXrruU1VauIDNk/1ZO1xFABloAZPJTufevV4G4hovM0VHxy1/k5KR5O5Qx8u
	+p7LsxNr3gATBdjntV9t1CrUzxzkmjuee8lzpSHW3MilI1+JHC+S2c1q7OR/12LU9/yymn77Z4Y
	6npzXVcr9pdRR6qY96lVTp/bjiYb8PIHg3A6oy8=
X-Received: by 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr36237962eec.33.1793811384606;
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 07/28] hazptr: Fix kernel-doc of hazptr_release()
Date: Thu,  5 Nov 2026 00:54:25 +0800
Message-ID: <20261104165504.2430480-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 299ad8a07156..0fb48518525b 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -315,7 +315,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

