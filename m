Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF647A861
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196884; cv=none; b=MIHSdDld+wAX5Up3QHawVd69vr0UwV+29i6uetvT4oIDDxVfNy23oXq5bC2nGu+bgHM/WZzor0PqIQO0Di0QSdIl+JQee5tpJL/ZzWpFphes/o7ZsrofKIqVlI1ZwgjS8OJK0g5BECzNhRNoljlsh2dPV3zK5JmcMJ9+c0dAbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196884; c=relaxed/simple;
	bh=4XPT2N01JF/a8I8uCkZqD/PggQiktCdJnKLr2SOgQWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTmKHzuChOuFDLrMaGOtyMgQTuU4NnhsxEgtZM1j8LmPRMw3dcx59IWmcH1RI+LCI0umNxe63g/+q5uEfEqMm+IfiYZUxbWYPWFazmppRF4WoyAeY+ECajDAC1EOdf2CAwDVg9EUuA8VCOpCVLRx4TBD36U2xeyY6fwo25B1Xjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHXLB1Zt; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHXLB1Zt"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so890903fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196881; x=1791801681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJDzU01PRMGfsOq91vpjrIzA8vEoMao+CRPEWuyQBK8=;
        b=MHXLB1Zt9KOUM6mCubT6hs0gBt7gNBOeqK4KhGHLDlosfkulaUX5tUrLaOdHPo4I5R
         1hHYMhDUheKKDsowKDVw7CCRQxJDlNI9aaNaoHUs0ZsWvauq1V5YgdpJIC+cv+hJRmQO
         RfK1FQ/ym3hGkSY3u3dsHaBSiix3M1sbYe4ob9Wn9ZvBP1Ht5s4kmC/e3pdPbFZlzjha
         Q+exr0UGuYFAcvUh8NYf7oY/IuvboUptNJDNSiwMmtB/PXtol7suLLjXYcYe5z1Fe0Gw
         2we4Md5XHRar86DvHsub2LPDPLhiDH8/rkYE6yRVUJvwn2qH23DOgvg7SiCI4QxTmXQi
         Vgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196881; x=1791801681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJDzU01PRMGfsOq91vpjrIzA8vEoMao+CRPEWuyQBK8=;
        b=A7tRffx6N/oaTWxEQpN1ZscuuUin7xjtF+6ZrMSljHY+sVsbLIZSZKrzgfEORRYyAe
         WwSScA4XizBdVFzYusI+eCpADHnX3Z3RlTvJJ5N92+pcvZPYT1NMjiWeZJUwqCPuB4vR
         IN3Kj1FIUqkF+wP2/zUsRKuJed1iLXe2M3+B+X0m3q/+HDHVLrtjMT0HvmzGoM18DADx
         QiQc8calaDemVKA1kvPt0j+/RVM/zIggz6vvLc//4EPNf+NfVhTsj6fNhvfMCIuruRCw
         OQlzQie+f0pKFfriB8kdb81Til9XlvAsqtn06lne4T4eZPn4/A5m4HCMzasPFrxDvW4Y
         Us7A==
X-Forwarded-Encrypted: i=1; AKwUvBykY4CZGI7Bcybzw8fJ/BIobbvlzvYxiB0imwZsE1TFVCtWS5hNyLiB5cWrMj5rSHRnb2L8wy6cphdcwH4=@vger.kernel.org
X-Gm-Message-State: AFuF++l3kET7GVg58F9Mguzja9HSoNOpxDQQVrvQpQrtbkxrqAon061F
	2ekeKlwD/6D0Kuucg2shn3JJTCkQ/sHXHw6Jx7dV3y5j9IRY0gwNw6PO
X-Gm-Gg: AYBFou2BbyLSl3gJ0Dd6QltxGfKXm0MKgy0dTyUu7MoRAxsWgDm2PjXnT0qwJ2+dBb1
	ZT2UrDpgwNqZNjb9mAQOWBSmlV0ozk+BtoQuJPnBrbjiGI7mFcR9rl0J7C/hlPUW9d8Gkn5Hhfz
	diTZlLAwhZjRcHgKGFciUbBbI1ja0B00smrTnnOEYFOr+7aa39lv9rSvTqhrwtuLVSpqRR2O/HE
	GlhLK1BH+BNiNePr5YISUMZPvhxjRWalZQn4Y6rHTEpQMDyLPgZT1pZUM9NWhy1X01M+aQQOCRV
	evK4i8JZhknnLNNehp4nsiPWJYvkwKoQ30vCncoG8tg86KOS8J16TG1e48Olss1yW4uB1w3Lhly
	fRBoytkqGdZq+EqrJREGYsbvCb61Zot7H0wstBzerpCKJzINLDxly0p4I+tdosf7zJscfJ/Rzk/
	/+IwNEfi/XJcVkKpDAVi8L9Z1uB9GyUz1erdltXUnj/rsTqR2Yv9fHZB1cI2nZ8jewhY2jWUnCF
	agnMmArCa+P
X-Received: by 2002:a05:6870:c1cb:b0:486:8f66:d389 with SMTP id 586e51a60fabf-49e15c54c1cmr9259624fac.10.1791196880739;
        Mon, 05 Oct 2026 03:41:20 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:19 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Mon,  5 Oct 2026 05:40:49 -0500
Message-Id: <20261005104050.1786222-9-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4..0425e00c4 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -788,7 +788,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	sort_needed_sec = get_index(shdr_start, shentsize, sort_need_index);
 	sort_needed_loc = (void *)ehdr +
 		shdr_offset(sort_needed_sec) +
-		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
+		(sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec));
 
 	/* extable has been sorted, clear the flag */
 	elf_parser.w(0, sort_needed_loc);
-- 
2.34.1

