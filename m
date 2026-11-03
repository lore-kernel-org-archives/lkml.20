Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673468;
	b=4P4HLE44GQw5Ys6Pz501QQsRYhA06PerVLyx1txsLE8F1Bh3NSLtSQztkZhZ72XELzEH
	 QKUA8N5WHG1vG9BnMvTb6f2Cl1MuMelOW0F+DN2KfxPhm3u/gZegFlRZHrlWA6a0VfIDP
	 /1Aw+o3MaYqf4NVT6h0Jd55yjk+AKQQAi7FcxmaraEuzB6dgoRWDGl1ljBuYfvQ09GYyr
	 1MrZIOBQlTeo+MuT0OkXDIJyzFh25sz2IsNMrKHGYZDV+JXLEiNzISxD/lpAPPq5ibTLs
	 6NUiCVNrwUDrD2M/YbJWU/8+NwCeyfs3M3U734iHu+QDFINEtGBOcNZiGRI5B8NFB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=;
	b=bJvt4oOzS4sN5WJn1at1+ksQ1koyqCK/1jOX69sgc0oJNhsoS7DztUkUuin8HaMJDL1I
	 zvblYQYzfGyiQqeHFvJ1aP9LB3g9pezgLZooOs6eLeqZ6gGYOuRE438+U1DTOXDVJA+wY
	 3eyUFXi7F7rxeMyzwPlZrI2bcmYelcVIK4AUZ+yFLY6j7eiFl4/7cmNKjG0Wwd8AvgMef
	 usKylATsXke0Hkg2QuWvS/hdpruCA/A2UokIRy6NqssS81fv0gl3rgz3Lo1ulTjTYh5x9
	 t9fD7SkAbP1zurRzuVHD6dJoXReCn0SJHXhM6z7Cjiq8pB7dAQtr9v1N58zl2lKxF9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g080rFoP;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF400606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF400606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g080rFoP
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea0efd636dso33507035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673467; x=1794278267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=;
        b=g080rFoPDiAmYQkytqEN5TwRHCf/UNtmoe6wnN42uiWJqkW+IM6Z2klbo8F2JjzJmR
         d8Sa6txmq5cmMlXTk4HZDZWrVJZyE/5/+qaVPs+m99dHpPFteJ1aYb6j7XrFM/VDzsbe
         765upSnho6Blgg0osE9Zz5kZvqX+6gHUfzweOiqBjlb5Zgr4frFJdt8kWeAyH80RF/mE
         +gwfVq7UB/Z6rsh/lM7yGRzf8tfiVi/xJNoPGqyD1wXlDV5Tarz/XGTMhvNnmz/ZS6CP
         CnOJFFiZcSxkc9AvlEf4g4ugX6RvCPc+5Mfsd14aJnGWXjYTJUINUYeZRStnS2CwNToE
         AnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673467; x=1794278267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=;
        b=nrgDcVZlK7yum6FYpdx7cyLkBC8XVwqO+pcTI6rhx2lo+ZXtEaozp5Ab7VaJy/OJ0x
         GjuDRouLi389T4R1MZ9NHdfFa54W35zcnX0qP0/PYLGEPt3x2alPM1RxraYX18GFoZmp
         CkRTUfkX2jJGkpykXShGVHNZ+uka8kSiUJJKCdtwxuZJVhBHaXniH3ItGnJ0Q2ggtlm/
         GmhEzp6U4nhTPPfNG7DwtIsZ6jEe3YmYgvsAABHkyT3JJpI6/RABpFxUVQlVf2SdSqyU
         34jgTBvp8huhbiGzPyKD3lotr5A45ipq9G2MEGkv8XsctD5ViNPLy4j5A/7w4ow8qf1R
         37UQ==
X-Gm-Message-State: APuU4Z8fT6gnarTnZb2bE58gyR3RLEwQmpOn+j+anGxMGt9gibr9JDcj
	zjzoWn6l1U/xPql79rAUniJPwGi7YF/cKq1T8ijOHFGzhQl0O5d/DF0Z
X-Gm-Gg: AYBFou256c9aO/4pw4D0UXz0Luy/GWS7ycHSEvFkfWOhqNzckVGfbILQV5lBfe+Q+xt
	umW0dnkFjUuKKMs4/MKYGByoMDmNUj+6T2jiUD3gvm8xUGL8RU7WQvmkg9NzjHpWOd71aIL9pgU
	aOWCxNMOQo9e9+97iEhmUB6mF4HBpaooigg0dU8KHBUfOlKMZcMLXrpQzAU/wDrqqQIusXfmwN5
	mzvW3W2mTjNZgMyJtAZq0WkDfNGz9E4RgIeXN0j0kEXBlUchVQLyWG5iYSls/WzLva7lAPbHtZp
	gkGtFt8QB6hTIkXWtcYIQ0+APiwkTqTvtQWmF0Adof2qxDYHKBxBA1XDY1INwGyoyghY7YU6vJX
	uA1UY5ViZ07kVRfqmPeRE1BDlkqX9ZFc/e4+Qq0s2guWtexYUNRZeOW6p6sjy/slSOpv80ABR6g
	3QFnSPo0jFFCnvnecTj48BtKWLhHBlH5YmWOPwsL3/yEWSgBkWIlId72PaRgS2rykeaWPQ3LmQe
	XUkOLYAMNt9PW/jdx/QHebQTaUGI7i24TB+UC5hYwBzVSnzC3vqpiOyo+bIDgDKNecAxcbfjXSn
	eVakSbd2zRctOlHO49WoN7fC+pLrjkEOew==
X-Received: by 2002:a17:902:fdad:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2eb3649422bmr128568295ad.21.1793673467085;
        Mon, 02 Nov 2026 18:37:47 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm33189015ad.61.2026.11.02.18.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:37:45 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Tue,  3 Nov 2026 10:37:42 +0800
Message-Id: <20261103023742.2624994-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
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

Hi Ben,

Sorry to bother you again. I was looking at how the driver derives
mpam_pmg_max, and I think there is a similar blind spot:

mpam_msc_hw_probe() folds every MSC's MPAMF_IDR.PMG_MAX into the
global mpam_pmg_max, regardless of whether the MSC has any monitors.

Concretely, on our platform the DSU has no monitors and reports
PMG_MAX=1. Our memory controller MSC has monitors and currently
reports PMG_MAX=0, but if we later add PMG support and report
PMG_MAX=31, the global value would still be clamped to 1 by the DSU,
and resctrl would only expose 2 RMIDs per CLOSID instead of 32.

Should the convergence only consider MSCs that have monitors?
The PE-side value from MPAMIDR_EL1.PMG_MAX would still apply, as
that is the maximum PMG the cores can tag traffic with.

Thanks,
Ping
