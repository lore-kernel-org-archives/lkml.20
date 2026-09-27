Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE6253951
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519344; cv=none; b=Mz+iG0G9D0np65QL6rcMmx0BEGM4T2jeXhLuKEztAUKoBDviJMezq+QoA7IcvtVR82uc7GdLDj/ONVYpYQ5LttOnfPRUdRZz/asbpOpqmrNYafiP7vgazqQG+2lAZbZQXRn2q64Q65T76AZ+5Q6oAWjrGTzNvsRxsHpfDD0l+GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519344; c=relaxed/simple;
	bh=+oahJfwFqOUyHscmbucorHRqcw2yJ3H5dAvWotW6RCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtNGcLbPQe95AADLB7r11icJbV66lQDpsX1zWrNCHGocPiZRbHzhhsle7ZmyyAH1LryXCTdoOY2ILB1ZkWhjBCbULzocemCJ1l0s6uXd/PLwtGbeGJ3EKAFiteRypD41lbk1MxUecTuMeIKfFfsQJLcVoh7vuPmZR8btTp4LDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8BArbWD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8BArbWD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so16611475e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519341; x=1791124141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jY7qINqE168WGofiIfS8GtydGEuYw1LesO3Yod7eqJ8=;
        b=W8BArbWDI7kgh5kHp8OvywJRu0Evj9HK5THz6yr2fngFsjqL59L6WYUonpLxeeImzB
         uETBVE8Lcgm6sbwsJ8Se7uiIangx2Epob/77Hhoj6d9IVGC78qK6K0tVMR+Xmzd0WPJG
         zwfLIfVJiAjwPN8BvCVUk1ZftYFRVechkLE2IR1lmBnT6OlI0VcPHZwB/iZIh8/cwU7f
         5lL+7VG7qCl1Wn0YiIYFio3iVaLqs2eklmCSJYqoOtXXUWHF5yHQ2UdGm5/PyOTRHQlI
         hnsisWQ6ml8KoY90d10/5Ky3tYMxAgSbJ26Bz8PmFyXA5mQMLn7Yu2/ySJ8H1Fu5niwC
         mnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519341; x=1791124141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY7qINqE168WGofiIfS8GtydGEuYw1LesO3Yod7eqJ8=;
        b=ScFUIQb02Kv+WxEvSFZaMgxCoh00vh05YFeEgGjLDX4UJ4qn1YeqRsrbL+8jBuJ7uH
         1YokmtOVCb4j2hhs4a/eHawlVh0oVnGuektmJaXkphydVpqk/O1wL6oSDDp0U01RNmII
         32ZuCP75T6U+2J3Mp3/5w1O7oVazIINIubTJ7eM1902SG4c05dpIeQy3LdqUOr4nlT3K
         PVygK0I3BSCRP5AbejsxNwcbuTzrgvTQmdLi35b/M5x/HRG3t2YRdHMDlDNY7lKnnKGC
         nbOHjXntWR7RkrTQcANQuEPjJS9+icSpdJrGCp2c8UORhB3arWy7/C/pflbaRboZbamP
         1i1w==
X-Forwarded-Encrypted: i=1; AKwUvBw23Cu5dT3+bVFSZEifHaBdLUEHOd2VLxBgo4BCalUg/yqDb253DkOHIfBGM4ZXEAvU2CrmyGj32dFmAyU=@vger.kernel.org
X-Gm-Message-State: AFuF++loFkTzaWYZyYG35feHkc4cszDD9PakyA9c5RUjqFFvRWAU95in
	kOsBGrsmuR3kwcfPNBBRzWGrC9mHpAbCtoiFDWkwAI1IdC7iuu7owBQ=
X-Gm-Gg: AYBFou2ggla3zgVYvqP98IfpkTDozUJ1NfCQ+vFR7L42CDsc3y7b6KEVxz6/ps0DHHG
	G3pDEKLfCZhCDOpVSebEM9f+YEUo+gYrfpHJI8m+tUoTmSB0oOOr/LgGqd1G70gjKHj/J3Aho5Q
	HaJOMbDxF2FwWn3xpi4T0/qUe3dfKcoMdKNFv0ZWt009T5jy8+SnLTfMHadI9mLzqMP/4NgwM6a
	m6UK860R8ro2e1geHADjYEZpDXO69WqDb54/oiE+FMncL9cTztlRGF8lNt9ijCZz+u57g4WI4FB
	vegkvM/66CDMvFSOdVqpsgfJLpbjLrpQ7/BXW+X+PMM/PaKlRT0WuxQ54oJaBxMgRqSrxSFBa/2
	nfJaM6aSmY+iELelpSnMeWptwW1W/3IYWtkNfevWAaUCTg+QGRj7e6mLtQEC1di335JToadr6az
	WW7w9iLTz2lICQpRDUQ+MxSRceJhcdEEgOJYyIqcGbJMq0dGHfS6p4eSFnNU6XQYAtMyLxqpoV3
	YsIab8Fg97xIkh43/+jZg8qI/56ptC9tuohHEKDKEmxJ5FbMF8=
X-Received: by 2002:a05:600c:870e:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-49fe670b208mr200681385e9.33.1790519340970;
        Sun, 27 Sep 2026 07:29:00 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:29:00 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH 1/2] x86/hw_breakpoint: Remove misleading ERR_PTR() cast
Date: Sun, 27 Sep 2026 17:25:40 +0300
Message-ID: <20260927142816.15099-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927142816.15099-1-habilerenturker@hotmail.com>
References: <20260927142816.15099-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

args->err holds the address of the DR6 value, not an error pointer.

Using ERR_PTR here is misleading and produces a false-positive from Smatch:

        arch/x86/kernel/hw_breakpoint.c:521 hw_breakpoint_handler()
        error: 'dr6_p' dereferencing possible ERR_PTR()

ERR_PTR is defined as a plain (void *) cast. So the compiler generates
identical code with or without it.

No functional change.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/kernel/hw_breakpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index f846c15f2..f142d868e 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -517,7 +517,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 	bool bpx;
 
 	/* The DR6 value is pointed by args->err */
-	dr6_p = (unsigned long *)ERR_PTR(args->err);
+	dr6_p = (unsigned long *)args->err;
 	dr6 = *dr6_p;
 
 	/* Do an early return if no trap bits are set in DR6 */
-- 
2.47.3

