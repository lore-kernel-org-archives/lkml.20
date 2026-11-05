Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884970;
	b=Gs2/NnhnN7BxrLE0Hm50g955XOzdPLQVCZiNKutJ9ntcCtms6iCJ6EJY9VE0Nee35UB7
	 cYPAAAUNo5Wvwv5q1W4j60BpkycnLOHuFimb/jM/EmRY/jA+i8T+20bTsKAe6lh8IGitH
	 433xJXLqjNtv2R7gaKfxz5xVZoIfqILiIPS4RLB0XscfYpF2Smd/LCnuJe9WTn3alqwSa
	 /BIknTp/63kzeIL097NS1LMGbyFusrdp4dINaiN4bL+OVC7NVUtl8v9KjtMzJyOP5lvO9
	 oGWsN2nkdWpk8deAofLjcE3rXYkYradkSjiKzxzfpzobziXhpZjEOeZk+sVHIGIQ9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884970;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hyCHHGbbmA+viHCUOeD0u0cyeXuCDyyU6WJlzk8TPBU=;
	b=pkb3xwSGVF4PZCu9WO+rRRbYx4ofY7yls0bg3gM/CWw1xkg6vhr8AIyjFcHLA7vjdni6
	 Yudd8bWXhoZNM/uiyyL435z03B5CGUQjaPHT0X9wGkYHf4FhqdkmD+/U3gkS7IGhMLUg5
	 B+VuRMefPY3pAHhmiMmYQFmd3p5P02zdI+SjwYMoFmDyJjqgUmEmryPCr0IVmt2arvJ6Y
	 p5bmAmsiPNTbtjQ1U1V/y3eo9C0Up77PYfAKihdp3jtIoxQK7fzrpI02vZs9H5Guh9xDy
	 ydNJMx/riLfnV3x3dRBpQAvr/99R6WXFMVggo91EeLqHcroAN+umT/0WH1VXhio7xzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBZncIgw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B14606D81D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBZncIgw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB39D1F000C1;
	Thu,  5 Nov 2026 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884970;
	bh=hyCHHGbbmA+viHCUOeD0u0cyeXuCDyyU6WJlzk8TPBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TBZncIgwr6KNvmo9eJUl10KdRygW8kka91W2lHkSWzbeDr7bkjnl2C542l+2/vTLT
	 6vOxlg1weaE0dg5ZjP5MzSe+em4F3oSuQoWpIW0GruGShkvQerQTTo/6Nu+n3bC1ll
	 HMyvHR24MN75TjXd43gGs+pvunUNRWv5n1nX0cy/QBfr/u/OCcymkQ5OfXlL8KPYwq
	 V5mutcPW0Mml5NjmH3ncV1KpmPh/7XUBYHHpS5j+iIx55fT8yAklLIBqMAIEXlkdRp
	 OGnZIsP29/8ZeOgPP0fijBVmA3XNWb6rM+bzEDAQquwl43dE3ztnY2pT/JLc7b7/SM
	 mnoqEACnS+vjA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 13:00:13 +0000
Subject: [PATCH v2 2/3] arm64/gcs: Move gcs_check_locked() out of the
 header
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
Message-Id: <20261105-arm64-gcs-store-gcscre0-v2-2-954d5bffd69f@kernel.org>
References: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
In-Reply-To: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dH1M/vyc1MFAQw48E90smOwrG3W8MQm/arC7/achGFE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeNCtvnrqKq0oiLree9b1oQQtbtI8m/43Q/1+Mlyx7Z
 jrrs+m1jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkeCvD/6IzXDUNgjtYbgRK
 n60/reHYvHi+0mTzhxmb9ZnbJu4WD2Vk2L51q1baOsVlCzL/sRpf0Mlqshd+Fr4nbefmrx6dF4W
 8GAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

gcs_check_locked() is currently a static inline in the header but there
is no real reason for this, it is not especially performance critical.
Move the implementation into gcs.c to reduce the size of the header and
make future refactoring a little easier, no functional changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h | 15 +--------------
 arch/arm64/mm/gcs.c          | 13 +++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index bbc22e382cfe..3e6eeeebd282 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -62,25 +62,12 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 }
 
 void gcs_set_el0_mode(struct task_struct *task);
+int gcs_check_locked(struct task_struct *task, unsigned long new_val);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
-static inline int gcs_check_locked(struct task_struct *task,
-				   unsigned long new_val)
-{
-	unsigned long cur_val = task->thread.gcs_el0_mode;
-
-	cur_val &= task->thread.gcs_el0_locked;
-	new_val &= task->thread.gcs_el0_locked;
-
-	if (cur_val != new_val)
-		return -EPERM;
-
-	return 0;
-}
-
 static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 {
 	register unsigned long __user *_addr __asm__ ("x0") = addr;
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 680749611a9a..84add924dc60 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -140,6 +140,19 @@ void gcs_set_el0_mode(struct task_struct *task)
 	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
 }
 
+int gcs_check_locked(struct task_struct *task, unsigned long new_val)
+{
+	unsigned long cur_val = task->thread.gcs_el0_mode;
+
+	cur_val &= task->thread.gcs_el0_locked;
+	new_val &= task->thread.gcs_el0_locked;
+
+	if (cur_val != new_val)
+		return -EPERM;
+
+	return 0;
+}
+
 void gcs_free(struct task_struct *task)
 {
 	if (!system_supports_gcs())

-- 
2.47.3

