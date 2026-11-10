Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275228;
	b=iHIfinIB7sdvzQebqPE5uRMNarl9d046wl1drWBWOFJB+RvPo9bJPCFhKYMTB2EGfelU
	 OrJtgl/PALmfI+UlrUtUDBJcKq1y0+EmK6J7XSlmWWUp+qs5gl2wl6UVxdUOZ+nB21MSz
	 4aatTos/JNFcuYa92/DT/AnsrQIq6iyMffS8RscxsIfTxRq4kj/fjqr8Dm8MJ5pbSu0JL
	 ht8gvs0c1Q6GUsF+YVqDzVPItH+JCgGIiYiwBukHU73VV6BEVrj7ZPS27By02tv4C41JD
	 I9KxZVpLKmwoPcQFIba/UfD/MTGMWRZXttAN3zfNlFMNl7+QlR4AjaVvaF2J+R5XBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LEL6AlxKvcl+FsHW/JpDCSgOXBqy0gm0MHpKrHu3wt4=;
	b=1LuRbHhOzf+kLoIaLLb04i7vpFW9VjlHHcXMw2QGeJxt8c7JCWVX6uveebJaQmW5EXXv
	 7slca1SqC4ub2IMwy7wvnRWXT8oVcrvIQ8frBtUp7B/GyNspKRU7sIzM9PI9JankTTzcU
	 HfK4GSRzTi5D4EksCkJ6E/Ft9d5q6KayLkYHrWXvp6AneMnwSNjMBzYuh176D9N03X9FR
	 SBDZ7dTWJl+ey4Xy2A03DYxMuJJ1saR72OjeIX5QRnOnAln/J9wx+2Mg18DTRjJIDbcqW
	 rMMv/YqkrT8tksvwVK2cMV12d3bf93mmb851U8TuOtG89lLF+Sbeka9pcH4ojwBszQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7M5+nRY;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3860A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C3860A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7M5+nRY
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b31fc13124so11865917b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275227; x=1794880027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEL6AlxKvcl+FsHW/JpDCSgOXBqy0gm0MHpKrHu3wt4=;
        b=m7M5+nRYE7D/zBrG2zhfDQett4NNqo02ooGS+uCiYlLLyv5KL6VWt8SH5EMjVS5CIx
         e/fFs3dBdfGzYu1nFePsu6jerPdvRlhfN08CktX/hfqUQnh5qFOMKkEinTivdin0F5Vx
         CHPcgcfYBL7MecfWsk7Kgj/VWZuHL6dvL4XHRBESE2ODIKsZHKSisG7SjPv03Ti4Vo7/
         nQ2NjvhR8u8Hg4E851BMlHQbs+n4ZJ9Ps9r/avjHxeB8DRf+s/Vx3O4srFLDkPnGnxGp
         YiBYWfMExQtieVrqEYR0z725AJebCrmKyg7+IV09evvMD8x+58Ww4htbXe92QvX6odF/
         lJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275227; x=1794880027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEL6AlxKvcl+FsHW/JpDCSgOXBqy0gm0MHpKrHu3wt4=;
        b=WUTOYCaIpusjf8f6o+lX9yCGCSiaD3iOfpJPGKDDO4YAci7IJsf7uHktyVI13EPJK4
         nmcVNBQafBPQ9kS/DX1US2zVLJNxFCiSrCVofnsh1iSuQbyM45mUyXICRwxuXV4DTYM8
         XxmoP8i7sHpHBVBUxiwbpc0HfSCPPE9pmJ97t5XThWSKHXcwVQDLv6aVx79Ni57EA2xD
         X6WnGDzhy4BfLqBSlphBfHC+AEGMBNyL1XR5kVYaZruzCp3bHhnnPwdrkdjw0MHP7bFx
         pFLKYHNNwT4Byk+rEk/pEtQlYWe5/fcrZWYuk+wQ83tVGW5p5kqmvTb4Q9azmQ3Oa5s2
         SDkQ==
X-Forwarded-Encrypted: i=1; AL+hErHLIOhJxzS/eo5bi5yexlly5BygLYuBFoiR2PI7tCt2ON/Plcvq7lKU4go6U89h7srGk9k2kBjk+7l5Vsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zv+JwXCoDXTprn23831/JKGIKRMXVAqXP0g2Xxa/GJILBWta+
	p0YG5o1tLY+Tjcjn4yWQblpZIU0K/TCkOHrUu3Gcq9IV1FKYMoCwGI6d
X-Gm-Gg: AYBFou3GIZxw2F1WOdZfj63E64sfzaD1tQPtgfkt9xSWsE1sX1FL3ka0qm3VDfTTZLA
	m2jgmlRlQvB6cXAlEgSMti7165aQAtyhv1oV5tTEWUlNVJVY9kJzbgM+iSCrOjD+acXq4bz0Wt5
	xi6p+aV75THO+U8iyCOkRwl6/mJLlQD/1Bl8QSm9YPdDtUZgjJ2OuvEdlCCu4yBML9cCKQi1of6
	CDQlbRhvXVFCYuAXVvFb1NSq7P6URJzviT5G4P+EGr3fxd6GxGhPimtxxtRkqSm8eaU4d7yZqs2
	Vv1RLdYr0nL6O5BvxEKjnZJBSM0cjl9m4RtkSxLAzUWY0VfCE95xIHkaTLjCabeZJsRRugWTjjj
	weZh7F7mparqi3ec7xC1oH5P0me7dtV7wxt0oMmsT6Oc3j6vX+foYr8xrrwI/ktkh6poPFTfAhe
	QHBp0ICl/0CSPOdjH+jxmiIfS6Di+vrmdBkqI0q7ITPtZnNoUB4AXaEc+2id6ZXIjcWnjukssc+
	f//AUOvLc1BQInu17mpr3N11lNnimAQ1OoPb7KgxPBrQVRHoZeSTp8gcb6mbVZj5I7uLsLHvVG9
	hvAk+UT8l9rhLc52tw/m64QUPWsMfxbnXKo1iyXB8nW6Q+tN9+h+H4ur5cRThkJWeJRxMcHsuv7
	KyRgXZLHwCF4QFUESddtCWQ0yXBYiBiY=
X-Received: by 2002:a05:690c:6893:b0:8b0:f116:122c with SMTP id 00721157ae682-8b392990bc8mr8088637b3.8.1794275226465;
        Mon, 09 Nov 2026 17:47:06 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bbf5sm8565117b3.1.2026.11.09.17.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:05 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:02 -0500
Subject: [PATCH 3/8] powerpc/perf: mpc7450: Remove the snoop retry
 alternatives
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ppc32-perf-v1-3-a6e8a55b3b48@gmail.com>
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=B2isEpMHoLMsZdennvH5DlkcYkdYOHPkZFHl4koTbVQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU/p3cXQepCVz9FSfCX/p22iUrZfVh6YXGbGlTgt9
 Gnkx+MXOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaafe4M/1Te/dnHK/
 T1hmT+hx/nfyfqTCm4XXb7RNqrq5uspbPkb1gw/LO99uLZklm1tzvUk6rf3WNz2Le5xczg2k/r9
 2+uHTurEsQHAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The alternatives table treats 0x418, 0x50f and 0x60f as one event, but
the manual (MPC7450UM Rev. 5, Tables 11-12 to 11-14) describes three
different events that share the name "snoop retries":

  0x418  load/store snoops retried by the load/store unit
  0x50f  internal requests that are internally retried
  0x60f  snoop responses of "retry" to any access

On a 7448, over the same workload, counting r418, r50f and r60f
together, and then r418 in a group with r41c:

  r418                 1793
  r50f              1546267
  r60f              2266850
  r418 in {r41c,r418}  670562

r418 and r41c both need PMC4, so in the group the scheduler moves r418
to PMC5 or PMC6, which count other events, and reports 374 times the
real count.  Remove the row.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 5a882d934645..9890c87c58ef 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -184,7 +184,6 @@ static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
 
 static const unsigned int event_alternatives[][MAX_ALT] = {
 	{ 0x217, 0x317 },		/* PM_L1_DCACHE_MISS */
-	{ 0x418, 0x50f, 0x60f },	/* PM_SNOOP_RETRY */
 	{ 0x502, 0x602 },		/* PM_L2_HIT */
 	{ 0x503, 0x603 },		/* PM_L3_HIT */
 	{ 0x504, 0x604 },		/* PM_L2_ICACHE_MISS */

-- 
2.55.0

