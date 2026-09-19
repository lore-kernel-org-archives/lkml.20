Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2C3AFCF0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789819099; cv=pass; b=lrbEhllmbv5XSSNjypd2hAahlpuugyRV8g8NZ5c7bOzC2mIeFu/F78rF8Qb6pXcgeYjH2HeaEWYwN8xZypKbMo9T2P1ng43Nrho83/hZEloSKILCqYIqtgoICqE/wYhSEyAUG1YHGCyB/5n25JrHHmMzPnXzDNvehABu8SPBb28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789819099; c=relaxed/simple;
	bh=XbtXTzRAYW02KXholcw2ASApYBFb0BJqI8KGXi9eFzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+HBYFno19slXiQH6RdZrPbC442jXSI9LS/E/F6bwxVvx3CP6CdUH0D4jQ1QsO6ciT1uf56uAG0ATMYCO092U7RQrj3gEPdG755Y3nksjFNg28jDNDDuZ6GlMqHmmN/lQevMK0pDiOPOcvyFFoQLorQeV3VSEzpez4OEAML6py4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUUEP0MT; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUUEP0MT"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1210798a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789819097; cv=none;
        d=google.com; s=arc-20260327;
        b=MZgDX20EBRfZ/pjOtS00T/gL+Ap/rONciJhVi6Tzba2qP/C6XeBkaoz/cvFzXdZpFR
         K5Aa0IdW3UWtDAs6kov7YnK5O286N6Rx3x7sVKMiAs/dlneW4/wdFRP+yTQUmUAfDvDm
         ptswEdhjcV6fW7okk5NF0NQLlpV0ejSv1b8J9tjHIDjcXUwnNzaVRgdCvNIH4NMBdUVB
         u1eYuJuP3VxebUT5lIMI4ZpVvOmOf4CbOxapfjvfYa/k6UHT8OUTK9UR2YnRY695G545
         BMEROydXmDfDgKSqjCqmxZF0V3PwJZeiq8xe/KvwfsjfQ2liYWIEn1tg7uvw4+hk9jvL
         nurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        fh=OBc3P1rDqKFXqv5DVcWPu3MmAS5GEsdzbFkL3tRejPQ=;
        b=YhfznsHgBqUc5KoCAdNXL0ItNwiJ32y6F4L+VibZtNrnSKTr+EGsCwwg4/cUwy6CZU
         Mj74Ct0Fz4IyXY25CR3dNb9dzdjWkmxyP0PR4fFgUrzj+5myiUTz0SKBF4Te2Sy8eq7/
         kXOAq1cpE1XdA4CmOvuMdtzisRBE8ohPcR9SmzK9n/knhPoP4VHcQxnV2jhCuZKn5jOW
         RMeNih5wN18sPoNvRx3jdrFrEzZ1nNvy+AvhaqblPdEaZSgTnIsGp+3u1qDUy/9fIpUS
         cLNXy0saav/C4+OSxWJLRtktilSoSUKfWhBUeC+7ZGI8SmKugoZGH2IZO5Ys/nLFCHvC
         eq4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789819097; x=1790423897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=qUUEP0MTwrU7oXS/DiUBaJTuIiyvZQEpf1ND3OTFPviB12MxddCifYrLA3LrjS13Y7
         LwMcP+alakVZqZE9s6p0xb1IidKBj+yfanTrh8nwWhX7hbOlpxvC3bFD0ityurVfvmVN
         OivAjYJPCbobJhlq28NsvsFRRWGcgxLRRgYYP/JlgbxqpNHK+YWCia3fAxZiGfHxePyL
         jLYlzSTmu2D6XKng+OJMA2L1nvXZoI7ctuU1N0M+YdzKrFY+8dGvBYSDDKjUksZzzdtw
         mZBBRBCe2w6Dx8VDM/uXzuE53ueL1Mt7+VI37vU38C7SDHKdSOuwZPZI14CzMuAwLR8A
         OGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789819097; x=1790423897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=mgi5UEMh2tmQuztTJ52idaLxTE85QG3FIic9PIj09YKnl6YPs55j1vS3DkhBMPfp5r
         jTnua4xhlBAIDNovKXtYiPr3i60Nrv0FXdGSmseeXFjC/CCdVxdc+eVBHksUIQ9rw4b9
         Yad0yb+JLDoaZpRM6wvFZGLPTpVAxGnakEOuQYYrUEWPjq96ICLeOJEGb0q04B/wEupa
         LVM4/hbGhJRftthAVwos5WFLhQgixLdjjKoPn6G5MGfGX0LFasc3LRuIeEGOGMfmsyxW
         u2O8JVSLQVVxE4NSuHMMs0gjR0leqShLcd83e8YhColxUc0eNpObu2rKuZsVw7Ob3gtS
         OaEA==
X-Forwarded-Encrypted: i=1; AKwUvBxMb3fosfsusnvgZCLRlPvi9Bg1eBRH4QBD0/Epx0c4HgEYFCXIWRKI0E+vfRfVfOwR89O1MvJFKvwb1Og=@vger.kernel.org
X-Gm-Message-State: AFuF++ljE5HwhWGCbChts6SAkwJWPKhsQIpnc91Ssg8xiqCmw871N5M4
	v40LPJXqs9+cf8rKW0O1EjENlN0XZEHOIdSshRa14dmNPLkskh9p21oXpwwqTRssfILl5FmRqNt
	1LAUpf1Isr7mDh7yD5Iwi/XagwNhtYqk=
X-Gm-Gg: AYBFou0gtsEJwaZkYe3s46pgn0ZlbMVtrpzMp70DvRtJP+ArstJyBdpe1vbompjGBIB
	iQzf3+qnk+F17L/eEwrCkVswtHhooyBqMuLD0Te7yJ3BisHUZ/Q8/yvnDmRSi7pf722YZuPd5+P
	a5HitfAoKII9LfEA8BWS4FHM6d3bOogVQnAFY/QpM3qQpx7LghoAzd5bx1yiZU6idQBdnnHfmTA
	5brQ9fDJAahweyaUsBzyFffgDeL2EMM+Hp6VToIpcDSlafxGJV1Ix6QF3OTNdhVVyaOt/uBPF2+
	xhoDGO3BfPeuDB4xmfpCR6yPhxeAgRW5pLSZPdpQVoJfbjERbU5HmtXCHQpWDI5dHNzdVbW53v8
	rx8+eJuu+/lAzdeI6UPOAo8EE423ohDmMz9t9Kw==
X-Received: by 2002:a05:6830:442b:b0:806:1728:aed9 with SMTP id
 46e09a7af769-80ddff5b5e3mr6811507a34.5.1789819097212; Sat, 19 Sep 2026
 04:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
 <20260907155300.1411173-1-alan.tseng.cs@gmail.com> <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
In-Reply-To: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Sat, 19 Sep 2026 19:58:05 +0800
X-Gm-Features: AcwNN1UZXEwsL9Pov5f9xi5w8glGlreCvMt_9qTwCiXunjbXeU4yHhZxeZNHtl4
Message-ID: <CACwt7EYh9+MZHC7Qn910iOxvnjd42u_NoSX3+YpjQCxCxtY=6Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2026, Iker Pedrosa wrote:
> A jump from a minimum window size of 3 to 50 delay codes is quite dramatic.
> Could you clarify how 50 was chosen? Is there a specific hardware specification,
> phy datasheet recommendation, or test dataset across multiple boards that
> justifies this exact number?

50 is not my number; Yixun would need to answer where it comes from. What
I can add is what the vendor driver does. In SpacemiT's sdhci-of-k1x.c
(bianbu linux-6.6), the defaults when DT says nothing are:

  #define RX_TUNING_WINDOW_THRESHOLD 80
  #define RX_TUNING_DLINE_REG 0x09

The Jupiter DT overrides both together: spacemit,rx_dline_reg = <0> and
spacemit,rx_tuning_limit = <50>. So 50 is what the vendor pairs with the
finer delay-line step, not a standalone default. That makes the 5/7 ->
6/7 dependency concrete rather than theoretical.

I also need to correct what I said earlier. The current driver already
centres on the widest passing window; the "< 3" check only decides when
to give up with -EIO. Raising it to 50 does not change which window is
selected, only whether tuning fails. The 1- and 5-code windows I reported
were never the widest in their boot (the widest was 74 or more each
time), so they do not show the old threshold picking a bad window.

On the form: spacemit,sdhci.yaml has no such property, so a DT knob
would need a binding change. A compile-time default, with DT override
if the binding maintainers accept it, still seems the lower-risk option.

Thanks,
Hung-Chun
