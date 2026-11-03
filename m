Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709778;
	b=SoQwjHQNylrBvoRgqzwA190zLyLhIqOogo4dF+iA2c96BW2Kc2n5vPP3VJ2PCRxOJ//Z
	 rk+gQ2P1+2Y6eu2YqkQ5mxhydTlukbJ7L+h/NxDSsx0OTd950bAbF50PfKxCSibCTNKhm
	 z+T0wUSkhlHskDupRlf8oSElm2IUSPuWxpsU4cEASq2CMZuyZX7F+1p6Q65HsbQT4SY+6
	 0ov4j+2uxRxdg1Hpx1GlF7FOwODfI/yfJwreo8EkrUYmbyR7Cpk2VnY2KNRDFcuzBOnn5
	 3JbKXdDbSLraMBfrPBWOZ0U7UUlBw7TbL508tuiTLd2hrMgELCJsYnfTfiaCI+kDCaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ciHSUnx2iyvwoHNlv2Dzk8sL4mtfDhCNXQ+egE7PL1A=;
	b=Ga5lP69cdq4Eip3sv0wk9QcVqB4FZQRnfWPxkdFWbbnR3Ijdmll75bLThDdrkoVAojR6
	 5kzQhYRAHh4pAm0dgTDBtTn6RGNd+PZGvjlhew+Bbf7/xijxamGCScca1YPm9/eeKkxW+
	 h8H2zIPKjUWsqLWZNsVJRV5RU8ij7amTCvPEOed98IVnpW1k1g8AoQ4jrSISfU26TpsX1
	 gHV7/mSOMfrBS9Tpw5nuXjin5E7v6Xknq4uy+YBvlOJxTcHW0uoK46E/ZIPNYz+hSRlWJ
	 MozmGhJuKgCZsFCqtMequYQs19oQ0XqPqEz00pa19sidOCyAvS2gKsJTezrHgPbqqOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cv6tOcZh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6251606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6251606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cv6tOcZh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so40381805e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793709776; x=1794314576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciHSUnx2iyvwoHNlv2Dzk8sL4mtfDhCNXQ+egE7PL1A=;
        b=cv6tOcZhOlrneN2e0L7KVixoOxxuZ8sdvhuc59rLVFokDhOwstRraFITv+AGbVUiDO
         t+VDc0SLgnIqbNkfFEQJ+EaXoXpNRKRjfdYdkjaio1wG/YY8q6hnCfSq83FckBWqRCAY
         6Fy95Z1layXDyp7kvrybPF+uC1Tuv8b8dTBBwFe8kgitIu5WA+qi8yDswTvRrfeatIzy
         fjbOTOShkX503If0jPbS5vpjHcJMIGYwb2/5kQMQU3SCj3rNyyRbB+GnXWxPdwUVuHBH
         LmZ8+/mDst1YOLoP4xmglmO3oLjFTSZVuWHr4SbhWI2BYyGlIbAs9WXupnWkQSLZjpOr
         g2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709776; x=1794314576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ciHSUnx2iyvwoHNlv2Dzk8sL4mtfDhCNXQ+egE7PL1A=;
        b=yfpsx1V69YG5md2Y9onawyOhsaFkPjjgetLVsL8uWBVuWYdUDru7C9xBH3rKemJSn+
         sBfQFy7wk8c8Dz3dyg13wemR4XnXDlynyF+e48T6g5cR/c13WMWCjcVhXZW7kxkH0D5v
         JChcOxV3BPrkXELwBIB19n7zxL0fXFCeuXV6ldDsZm0e0/P4p3mLt0fgVz9LgOEw5aXL
         9+3XYNo2OnH5RrJFw2BtJ2oJubUugzGMgtY0OwEbc/f2x8EFSJIn3d/pBZdyj+Fsrfh4
         Yg4bouBgFvO74+oFBVxFAi94Hff43a57p/jkWRZ3CGgIh8HtRWj3fwp6TZ3opb6fat8V
         riXQ==
X-Forwarded-Encrypted: i=1; AKwUvByPjAxYfptvu0YPbLngSrpAHIpxF5D24rFjecFgsIxCcaQMu045rDG7t33/owHeWU8HWmcZAC7BI+6OX10=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RJiwZ1VfiGLpfWxmnKtlQ+0DDyFKy11LsmacZ3532Dul7VVLv
	kNpNI1zpoCtPcmjaqBBd4hBZp1CaxSVC6grF8sZdTNReKoUHkKeySzJ5
X-Gm-Gg: AYBFou3Y1qtOwnsfYnYhuJL0rxsE9UOhese/jgLB/9MFjqnfO9Fh2iTuI/Q4H4PYCNk
	gLGlL4Hw5GOdo/kP949o3pJt9nmBTbo6PkwSlJTxzwsY7YjU/ylX5b2SZRBzS1QLMS6OXdVbncF
	psKgZG4KID9cL85nQkdOtiCSh/RR/grtFawaijsYKEkZCXA8kFXoxZZqk2LKWMAE9fxShJrxd69
	d1r6+610WLZ6kg8c+qQ3H9pX5koAMgVJO6AnFmrGv4mhX6M6y8Z0nwZ/iU4oZShNLW9Jxdxzpv5
	i0JykUUDO5s14nDOTq83S5RqewayoQ5ntV0tMkYdSuV3uC68ggTQ9iiqx6XGA5ugEg1+8HHPYnW
	l6RX6RYMGry7BnRLSC4oWUyLTBo70f7GX9kBe7rEr9/NRrEzBF5ClmhjOfhfuDoZ2Ug0+WLCRC/
	D74G96J/YnDvqcQRlTWYj3tT+qZb+gkvSOz44GSlAZLi4tno7zdy8mMtp7Rs44a99C73w7d8Ec2
	EMAp0VAfLFQshUxkh+dxaApeYWl0x777h8haec2Etop6XJwrC4Uyb6qRchccPHANAtIl2YVuv0t
	2HZNmsegSd3jFE+3JIxYAmn25g==
X-Received: by 2002:a05:600c:6387:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ac1904a81amr299352705e9.24.1793709775886;
        Tue, 03 Nov 2026 04:42:55 -0800 (PST)
Received: from webserver.. ([149.3.36.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm48802845e9.9.2026.11.03.04.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:42:55 -0800 (PST)
From: Aleksei Fedorov <ring.zero.sh@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Aleksei Fedorov <ring.zero.sh@gmail.com>
Subject: [RFC] sched/eevdf: fall back to the leftmost entity when nobody is eligible
Date: Tue,  3 Nov 2026 12:42:42 +0000
Message-Id: <20261103124242.102319-1-ring.zero.sh@gmail.com>
X-Mailer: git-send-email 2.34.1
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

pick_eevdf() returns NULL when more than one entity is runnable and
entity_eligible() is false for every one of them, including curr. The
caller then dereferences that pointer.

On Ubuntu linux-aws 6.8.0-1066.69 and 6.8.0-1063.66 the fault is
pick_next_task_fair+0x91, mov r14,[rax+0xa0], RAX = 0, CR2 = 0xa0.
Five oopses on one Xen HVM guest, from 2026-10-24 through 2026-10-28.
commit 1560d1f6eb6b ("sched/eevdf: Prevent vlag from going out
of bounds in reweight_eevdf()") is present in both kernels and does
not stop the NULL return.

Take the leftmost entity so schedule() can finish. WARN_ON_ONCE records
the substitution. It does not repair the eligibility state that rejected
every entity.

On a guest booted with this change the warning fired once, on
2026-10-31 16:08:42 UTC, at pick_eevdf+0x22d in kernel/sched/fair.c:967.
The guest was still running on 2026-11-03, with no further oops.

Signed-off-by: Aleksei Fedorov <ring.zero.sh@gmail.com>
---
 kernel/sched/fair.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172f..1b940ced9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1196,6 +1196,18 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq, bool protect)
 	if (!best || (curr && entity_before(curr, best)))
 		best = curr;
 
+	/*
+	 * More than one entity is runnable, but none was eligible and curr
+	 * was cleared. Returning NULL makes the caller dereference the
+	 * result. Take the leftmost entity so schedule() can finish.
+	 * WARN_ON_ONCE records that substitution. It does not repair the
+	 * eligibility state that rejected every entity.
+	 */
+	if (unlikely(!best)) {
+		best = __pick_first_entity(cfs_rq);
+		WARN_ON_ONCE(best);
+	}
+
 	return best;
 }
 

base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.34.1

