Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F833AFAFF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431376; cv=none; b=AmKg4mCrEfLI4/TOy4BYGsCIK/T9+GRnHXmc0hqWC6nYmxDpls2N3+P9MbwrzvAi5W6f7bmjvHurwf6AyrlLwTFaI41iFA8tVU9eJIh+Y1K1owN2dA+TxworNcF2HUcgQJkIBsCgpTIUSvsTtD4+/C4R4g2/x9/gpWHwOiB9n2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431376; c=relaxed/simple;
	bh=Qy7KDc58LwMFw+LFmbZuYkhFyvYJ8M/s8xiPGiqRlSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOFPVuSRZg6MAzBSNS0ktEr4KbaKCkt6S48p4Y7H8Nk2DbkBC236EH7lBrjzXGailsUe7iPkBlUuFep6nmt49EMwyY7uj2V/6i4wCOPZ2gUGQLzIAwOJ5/GsZ9gUNEDc6BQ/ExscYhSqXYo0tF4SyLRgMrLVIZzF+YMCW7yYG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFmC14r3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFmC14r3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a813079a55so150363a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791431375; x=1792036175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRzqJI5tgXt0j4be7EpqBBdFFXnOhcz/YfnZ4NSC5q0=;
        b=gFmC14r3DLDDOsPkiYFbifbMTZaqgZYF1BTh88oXp+t+2RvhZTizovxf/L76F95byG
         6e6CHjwSOtnc0Zy9fYlntBaLpk8VOLqrev+EWbgQ3nfjlqxGvNM4t8fnMNewp/6knDa5
         Lxll7bJIQIlStQ25jB0poTJEDkI3UB1Tivvns5NljfuJcSI3iD6kL5zVMLV53wobRm54
         e0gcBqYLKVyXTFkLTiOhjRv2zIcrtr5mV9DMs6YQOX8C1Xhyfe/JOpl8v249m29CFWuz
         E44cRJp+nYp+r8lzfDzIecvhakj85Qv4cucMznEjkCqz8g2LJKuWI2xrr57loB7iw0w4
         2ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431375; x=1792036175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRzqJI5tgXt0j4be7EpqBBdFFXnOhcz/YfnZ4NSC5q0=;
        b=KiwUUpY+15bfVGNOvg73D00VwuWVPpnAssOSGpufIHWwq3y9gJNIs8G2v8ki1o8DM2
         LSU7/F729upqTM8UPC8DDXYG3NsqeNcWbVXeHujYKvsDKMvx4v7LIx+KH5TGmIjhG9vB
         K4S7x6kwkliFbwxEpLYkAjL1m5L6JrxMeNgPzWOfxXEhrZ8tsu/n01Hw+D9m7SL28Ylr
         hhSdK2YDuGCUC2dTHnnv+otbD7WTa2YRURgiUa3gA7blwZDzjAKEPwYqhXy/zIXvrLyp
         Z8tlx4aA0JDjYkgYW5E0a0W/lb4LO3+JwB0q1Uf/mAbbsWvrAAKF4a41fjMwL2zryXvp
         eHjQ==
X-Forwarded-Encrypted: i=1; AKwUvByZqJH5Tkuchmjh+dEPCef/pqEK3o/DwJRlPhiYbNWj/H2sQ/PPog5z3S/dgSbw4yPemdGOCacb3Wo8jRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNjSLBaASrJ0em5C9kpEtU62dYIEiCBOfgb/PeIyvllLhtESyr
	PTf6Xv14GQr/TY9Qj4Kv37SDs2ftjtFXVax+r4vHZvDWJGucMZ02O5Ob
X-Gm-Gg: AYBFou0anyQ21hO+2ed6kvPe1DS0hxnm7dxjCJwwvSCiIhdJEte6HVD+mLwimDr46zz
	KcRDahFNHNWhfhg0G2RG6ocaaTpprXX5D9EjNs8unhnT7oB15mApe8VDF9H1jCjItP0e+NZuFj2
	X29eDkeT3pY4ZJ/QYKEFLoU3fsm4WJoEEmyFKFHfX9O9n3QnpKp5z0tK1044//8IdaJExj03vbU
	uDdfVa+ypofLe6m1OzfoZaRIEa0K6g+IaC+51eqPZSUKrfWyvOCNCLF/egRwMv/Bq6dKeRgYtYc
	EQgyfOGtz1ldBb7+3U5QuXLE0wvtyyXRMTfVTtFQDblGbi+tWMT7n+CvJOws1i7PlSkXOJeNwbU
	IefQsTF8oksbhgloPLOfiSk/lF58BIVtooJHOhyUvYN+ZTSoXwpZ3/qllr/6/c11P/OgQvNaUh0
	74chIwijRhRX5s6C2Lkqvw01BeR61d+X0iRaR0hS0QSsz853GOi4A/28UbycjATW28sIEf6SBwS
	KOAkxBwIQMhVEu9Cd1TFCoB2x7cq1VoNPx6AdcS4BWdOXApubtEY/V0+xaZ4hefMgSlCaOBvEEf
	d1psRbzW6Dc2g9I+/Sb84W8ZLr+IY47oqCXfHu8R/l2D2Q0a
X-Received: by 2002:a17:90b:2ec8:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3aadffb8250mr632594a91.16.1791431374811;
        Wed, 07 Oct 2026 20:49:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff8c2396sm2194058a91.11.2026.10.07.20.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:49:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc/lib: prefetch ahead in __csum_partial()
Date: Wed,  7 Oct 2026 20:49:32 -0700
Message-ID: <20261008034932.3180490-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__csum_partial() reads every byte of the buffer once and never touches
it again, so on cores without a hardware prefetcher every cache line is
a demand miss. After a non-coherent DMA the received data is never in
the cache, which makes the GRO checksum validation of forwarded TCP
traffic the top entry in the profile on a 464FP (APM82181): 22% of all
cycles were spent in __csum_partial() when routing with GRO enabled.

Issue a dcbt four cache lines ahead in the main loop. dcbt is a hint and
never faults, so prefetching past the end of the buffer is harmless.

On a Meraki MX60 (APM82181 at 800 MHz, single TCP stream routed through
a qca8k DSA switch, iperf3 median of 3, A/B in the same boot):

  prefetch distance   LAN->WAN   WAN->LAN  (Mbit/s)
  none                370        341
  64 bytes            430        381
  96 bytes            438        397
  128 bytes           438        385
  160 bytes           434        386
  256 bytes           423        383

Prefetching the first lines before the loop made no measurable
difference and is not done.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/lib/checksum_32.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
index cd00b9bdd772..5a14d45c7b9d 100644
--- a/arch/powerpc/lib/checksum_32.S
+++ b/arch/powerpc/lib/checksum_32.S
@@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
 	bdnz	2b
 21:	srwi.	r6,r4,4		/* # blocks of 4 words to do */
 	beq	3f
+	li	r9,4*L1_CACHE_BYTES	/* prefetch distance */
 	lwz	r0,4(r3)
 	mtctr	r6
 	lwz	r6,8(r3)
@@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
 	lwzu	r8,16(r3)
 	adde	r5,r5,r7
 	bdz	23f
-22:	lwz	r0,4(r3)
+22:	dcbt	r3,r9
+	lwz	r0,4(r3)
 	adde	r5,r5,r8
 	lwz	r6,8(r3)
 	adde	r5,r5,r0
-- 
2.56.0

