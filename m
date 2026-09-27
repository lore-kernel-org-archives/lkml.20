Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A83D9524
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519353; cv=none; b=Rp4qWcnWG2eFoRpCy+HvxAEC6+s5Ko4t9Qp4xj4SCgqZe1kyU3RpvL1mz2Yo1IDZJOiCStU/PBSy/TVEO76lPUiLuEp7hMHKvIacEkccuohWyWGq6Lfg43mLjbiyG6M5hURWK1GA2ue0r4dopRaI8d0glYCCsrLw+BPQaZ/AfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519353; c=relaxed/simple;
	bh=8arve+O6eaBkODv2dOHlZqdr6v/gEaXBSqvvyU+Tc8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFOStKaM8lKVKtecSmkwv1McORzf8Lx2gC/nCaD06wbsc49cUa4NlHJ/58RCoEBvresu70Lb9OHHqMeFeH8VciY+USzsGEZDFM+IAgHHsoGbGdg6WhLSRs1C06tWLe8OlQ64WM8k5NhmBogvDW91phD71AOjFg8uXR4VF1nMhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJBNFZd4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJBNFZd4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so16612025e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519350; x=1791124150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4ebhT5QYUpz7TFUlBXCRNqm87/Ue9x2YV0hzJwFSF8=;
        b=OJBNFZd4doQI8IVGKo1kq0sQydLWWePGwuGIoaMYWOx22OS+INeOSBpj/QNOFQebvf
         UfqZSN5tSxABREgl56RAa8le382wM2R+mTFTk3vpu/VAsbxz2hghgVEi/6QftRWkCCd4
         kE9VpfsPPIZI5v90oGjxPMhA7apqQGquC+6BnNYeL+H6PdOVtTrfKWuYMx9PEWedHFy9
         EX3egtSCJ9sBXpuwtV0tSntopVlaOcG5VtL4Gv9hEkLAx+LFoTovhnDQ41cz6PY3rX7Z
         wJSCY6UewjLz7jCFn3ZJuroUqb4B5Ri1ajyQNajjedlQCH/f4RGdZwTZspYdlhiQDfg5
         UWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519350; x=1791124150;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4ebhT5QYUpz7TFUlBXCRNqm87/Ue9x2YV0hzJwFSF8=;
        b=LH9GduAHzI6Ouxyp/9LIUHXrYObWfiYjZUqrfXhoBR5Fsr4g/TFY4JHoSfnyGE5/4X
         1b2CK7H6exZ79RbRzh32XLT46NGOHVyiq8WMsnajmbiMPVxDtYxJMb5YG4jqi5Przcap
         840b+bqbfYqY+D54E2/2fhlLw+ch+NMI853HEBoLtLlagt/8Xek94KD5iefeWpQP2NO7
         3Hwvwo85SNfCWLFCwcLok8a0b7Ki6N4bSp7n/6bEoIaBBUnQvajrSxgVWImCajDT1ach
         ilUBl6Ep5KjXz84T9+yDEPrMCHW4j/sIa39fJMQtMIBlG66WZrfG1IjtkjIqk7fwwR0H
         KBBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9WtZtOu5ZqsdrTOFOSKqzFxOeiIDQqgTAFMW0PtEGw0nlICHcK+vZ6kHAzccqsW0EEE+76899J+tNFGw=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ6PeX1M7s3MWjjF9x6UjTnXsKtuJz0Ds+VAej2huvkHTT/Vx9
	FSMy2c8T2mGmT75Dsv3Ewa8RKKom5K9dwzrPAXUTKL+Ewt03usEsByQ=
X-Gm-Gg: AYBFou0wYuzigUajK8aDTwPI1FIgTiMvcOiDQZkmFmmdzIgZ6uf4KimSPR4BB5Jo+DS
	XEWCSIwV2StxBbub/3kGhoxxjJ9VFxY8z5Ip3sR2DOJP6dtOC1EQrkYNtjyi+03FXX0kjVVgnW3
	qfs2UujpfaHuSPEZRJh0K1fscAekcd7jDe3qcqL+TPGsnHrkSp8pzTZt0j4RdugCdc5xtEyT/C7
	giu04X+2LYOzm5S754jiARWajDoXFJHyP+ArHCd2cWp1LSvpygwS0ch/OB0fW4i8NKRs9H3BA48
	hMZEfDb+QrqFILO01FDssKlyoyXsNly8F3pN0cLNWxNTh0ipG1AQ2o04eLzKtQGmIFVGcSj6DeK
	QIYsP0sRHIo5JHYDA+R9t/oYNvBKj+PEDLsQczC5W/PAdszNQRG8RP7FuRsTZZyldfqsDLQEL5y
	AtvWDxugCw1Rk3ajafidY1vdPXrR8pDRGr0nJB+DIy+KdnRSdVahHJOu0F+uRzRafAinrol4cgD
	HO0euk3/00wnIdm9+XNE8qktk91AYhtQlXfeC+AmyIcgSTN9oo=
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fe6707bb7mr206961305e9.30.1790519349715;
        Sun, 27 Sep 2026 07:29:09 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:29:09 -0700 (PDT)
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
Subject: [PATCH 2/2] x86/mm/kmmio: Remove misleading ERR_PTR() cast
Date: Sun, 27 Sep 2026 17:25:41 +0300
Message-ID: <20260927142816.15099-3-habilerenturker@hotmail.com>
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

Same issue as the hw_breakpoint fix: arg->err holds the address of the
DR6 value, not an error pointer.

The ERR_PTR() cast is misleading and triggers a false positive from Smatch:

        arch/x86/mm/kmmio.c:596 kmmio_die_notifier() error:
        'dr6_p' dereferencing possible ERR_PTR()

While touching this line, also fix the "unsigned long*" spacing to
match kernel coding style.

No functional change.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/mm/kmmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 6ac981cec..88fb7af35 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -591,7 +591,7 @@ static int
 kmmio_die_notifier(struct notifier_block *nb, unsigned long val, void *args)
 {
 	struct die_args *arg = args;
-	unsigned long* dr6_p = (unsigned long *)ERR_PTR(arg->err);
+	unsigned long *dr6_p = (unsigned long *)arg->err;
 
 	if (val == DIE_DEBUG && (*dr6_p & DR_STEP))
 		if (post_kmmio_handler(*dr6_p, arg->regs) == 1) {
-- 
2.47.3

