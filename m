Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F452B1C4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059175; cv=none; b=h2b3mGdYGzpcTQClj9cNBQ+JztRdzwt9szoJHxVcbrRh9zjJP4XCJBVfU5ErhDUXDqV62eDbVlwlPeV6UR2gRCp6bx4OIOKmWmrIhz0S1rC9V2VNq9iqjuia2rP0iZ0tK5vth53sTGNOeLy+NZzyiMKNJMCaYKMDVHMhjLuMk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059175; c=relaxed/simple;
	bh=IgALGRDOofcqRheiguSNaLkVcTRz8oPngUcPlnxx8O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asLvcaALx73+euFLxIB1NFnUqjwmUCcTyAe6EOJ+K2/2KeqckIYkau/yTxUYLM5tAisiwzfemVsnNdQsbE22rrco+H9zgdWy6vDQwzVzbNAVp98Tj+msh9V8Jdu83/sXhQ8cfQD/uk3ftIwIkIIdaQxluT+CTfduMujwkg93vAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIj09DhG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIj09DhG"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso3224742a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059168; x=1789663968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGkO5SPpG8vTsJvK+53ZWmDGMdLio9cfh5UfDSl6S68=;
        b=mIj09DhG734A7EElZRB9Cp7/iu7KbLUrANknfmERC3DXHxE8m1JTtKU0FblPo/G1BW
         f1TC/w27AHFMEfmchFMAcMoUB9cUcLkirdrJQAnmbS+G1FMLnyGwdYRqL8pctXb81aaz
         JPfz7SBcpHcRHVcELONJc6wyRzLurOAdPdhez1LFm3RDfH2CgyNdOUxc8v1sirok5463
         zwp5w1iiLBY7FktRkDplYHlwc9cNs6PCHb0nELzoX0TQkD0PxR8gFZlc7OPb1NHv8qe/
         gkLO3YiNJRDLkzlojd4FZ0sune9rrIy4YIRfc5GDY5Ggvg4Ri6jyAfv+1upELnz0j1E3
         1Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059168; x=1789663968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGkO5SPpG8vTsJvK+53ZWmDGMdLio9cfh5UfDSl6S68=;
        b=ElucRcXIEbeLPErU7mtykvmOQEl/qNcn38Jjb2VxjxAuxRDmZ0ENIWQ2ZmNLgAu4Wb
         L969+yOYI1m4Y3pRyTVmr/zWxJ2vlPrYW7n6lKXzTuHO/WsgBQSXF1lq85VJZIGhoFhO
         uQjf8b0V8X35yfLVZ3nSYgklzcCiKAZWWI1UqoS/Tc0jR7yAkGI3sOexN9Yj5EG9m+2T
         L5JJMBRcv6P00GgFkmiJ6wWKqKLtE9noV861ErPB0kSPvkIdt2Viy1+Zbw0icZ60+9aw
         5u261XuMrHE9CvFQ5Sr9EhaZk+duHluxbkN7B6szVMXwN2g6dRVsf/iQa8RMDeJF5pSj
         GiMg==
X-Forwarded-Encrypted: i=1; AKwUvByJamt/ljFRmPDLzSYO+iPXuEn0wy9knwqGiW0YdSIGNhX6oTvhV747WkIN8w3FSIyEFc3zo57FLe5kbiM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfISXz7Jb0plvPjzz46xUAUuZF0APw8b7pZiWzERvDVRET1e59
	RuyQDBVnlRuQQZUPgWQfn1znhC4VSQ/zvWnAtUAxgK/IRBzQ5zJldpyj
X-Gm-Gg: AYBFou0RWs651aXZGZJGP98fCaxaELN5P4UlU5FmREEvYl7HkHT4UzSMDGt4u4M1/xY
	mms0WIPjAV4W9562y4oo7jw3mwT8J/VnJ5tYWWIaZ7WJq5qLVSTdD2f3O4v7wurLeRP7kV57kCr
	MkEbPSxT+0STe+dQMtPiyRPeNKPxC34DNQFQpeScsTXh9aMg/SMK0Dw70i2WnFgMhKXjflmF/JZ
	p1Z15Hl2NuySr7d1gPAG7FG9GnexzTG/sUXb7gKHENaXuwhbFMsMyAX0qUzEDY0QYnLpWkGawYY
	kUCByKVbQ30jks1i4xvMqixvglSqyDJNrQXqjNQaucFwMLaVkqeXJnHOmLyojMCwPCotAjAnJIf
	R45fbMnn4dcxI+BuWDOd3lk7Js1MSmS4sX/YM1o6lG0vsgkk+Ph2yZjoEXpsNe7kWgbywlorWfv
	kNqiNcaqKYhyzq9h2IUvC8UnkvvbsY2aSQ9wbE8c3wxXr1ulY/GRPe6G3j2KfhrJ05XOBNa/6Ge
	gfhgkEKe9JEiZcd9Wf+Eyub9YO4042BfYdEwfVW2dJumtl0n9o6ZCYFh3G64sUDNbqdPWS1j0sJ
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39b26277b88mr64406221a91.24.1789059167593;
        Thu, 10 Sep 2026 09:52:47 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm64821a91.3.2026.09.10.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:52:46 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: song@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	akpm@linux-foundation.org
Cc: jolsa@kernel.org,
	ihor.solodrai@linux.dev,
	martin.lau@linux.dev,
	yonghong.song@linux.dev,
	emil@etsalapatis.com,
	mathieu.desnoyers@efficios.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 1/2] bpf: Replace sort_r_nonatomic() with sort_r() in check_dup_ids()
Date: Thu, 10 Sep 2026 16:52:20 +0000
Message-ID: <20260910165222.1186628-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
In-Reply-To: <20260910165222.1186628-1-visitorckw@gmail.com>
References: <20260910165222.1186628-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_kprobe_multi_link_attach() in the same file has been using sort_r()
under the exact same limit (1U << 20) for 4 years without issues.
Switch check_dup_ids() from sort_r_nonatomic() to sort_r() to match it.

This removes the last in-tree user of sort_r_nonatomic(), allowing the
unused _nonatomic() sort variants to be dropped from the core library.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only

 kernel/trace/bpf_trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 29260951aa87..1d7e73ddbafb 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -3826,7 +3826,7 @@ static int check_dup_ids(u32 *ids, u64 *cookies, u32 cnt)
 	 * and check it for duplicates. The ids and cookies arrays
 	 * are left sorted.
 	 */
-	sort_r_nonatomic(ids, cnt, sizeof(ids[0]), ids_cmp_r, ids_swap_r, data);
+	sort_r(ids, cnt, sizeof(ids[0]), ids_cmp_r, ids_swap_r, data);
 
 	for (int i = 1; i < cnt; i++) {
 		if (ids[i] == ids[i - 1]) {
-- 
2.55.0.1003.g10538fe699-goog

