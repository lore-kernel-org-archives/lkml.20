Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2036A376
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755053; cv=none; b=UCfB4QCmetuGQwmlvhho7Z1JyrtnJl/tude34K9J2e/I2g19oYWrT4BpPjkmRle5XlpIAxN7DqIk1iZwyoMq44AKqbt7YrkoQy4JK4qZuyWRnFvDfhe0mrCYcGuc2LbWaxGAzko6x6keDKZd+eFjXy+q32O57wee9/db4oC6Tog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755053; c=relaxed/simple;
	bh=Rsjr1yfqpRZogIYDKpcWoHVl8TF7P3u3pRV0DoL8qxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5jR8BT1QTI94zXO6BRC7oQ1mExj5e0P2BksAgNeHshRwE8rd/MwrS/q8bS6E16NYSwSVw6FDrf2h17+U52ESYkERLLI267c5eC03rcegmoYl6R34CXQZ9GV0ZcNgVhaRiozMViu+97Ypc3yIgViCaF853Daok/t9qTVn4ZSIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE48A/zL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE48A/zL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3285608a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755051; x=1789359851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXfNDY7tWpXp99dzNDmwQ7Ck7bpB01oTJ0ndVCdj1sA=;
        b=jE48A/zL3edtOtoHYsi7GigrcHmea+TpSzQybT5s0blE9eOH9AHZ+vBxX5TC3PDfwp
         81pw+yYMxobf1ukoPHk+EsNLh4BN2MXL4At8kzMj7RtbxDGDemlelI/l4AzucUF/LrYH
         SXAyIjF2K/RUglZVk2r7jeSTX92JPEogXuA/qSw4lPppGtIMo1KUKgeRhA4kJo80Gaoy
         dDc+zzpRfjD1HfxAMccwlKYqLQf9s0pn9OSSy1IzHwc2Se4xBfH+rp0th4Iz8H45Qeec
         r5ua23tP4jB4PP360apLh51t3kea+faVgIuYPm6w3fbHk/LOyjRslaUfp1nl0lSJjyut
         iAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755051; x=1789359851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXfNDY7tWpXp99dzNDmwQ7Ck7bpB01oTJ0ndVCdj1sA=;
        b=Un3fzVNWKOHn3QUAHXHGvCvu/hVMirIK4ymQsTZI5/drchwGhRicP/SHBNsmKem+Ml
         C+Ne88y8po3nRJCOeVRc3Ua8cQ4wep/uj/3qNP40NGsa/jQsSgoGVQi+kvz0i0vwcXXA
         IzztWr9kWAszxPxf3OsQwp76tdtQ2+1tkSBCx2Yyh+BegKTb+7P1X8JO8dUnl+T12NY9
         nDGN2T+GoX/weIgmKS0poIxaMSgEYNC+Wd8BntnrOcgciLm8z2kApWJaULoM8QMCLa3Z
         yxLipwuV9SNzlWYZo+/wgGzh1TikCAUO6ApeXn1NTL0IWcdT47iTcA9jnw8mK4Ch/PBq
         l5mA==
X-Gm-Message-State: AFuF++lB3Cd7+bnanCbDtwTG1ur3XITaELG0uKjHQrmUj/0Ktpp7QcTz
	keSd05zsu4lo+YY7VxXsHu2atmIg+TeWw4TvwScK7/bxIZQXdr+ppZVL
X-Gm-Gg: AYBFou0O7NMFmR0tCbplkJcMr63ONPoKMRaXDAD4inlzc8by/87U9d0TIv1LNo21E/U
	FRjwcZoCFppJQGqMq/DBHs05N/MvkVbKL5hEtkplNE1b+SEr6CrlyFXhqjQWFlkH52TLtmOCa+Q
	DrUhrQZfjinlO5LrT/SBwg2SLAvtpFDwvAu3s1eS6JMgJrZUOTD9bK4TnjBHvtPQxLMJ0AUyxwN
	mZMz+5WSofOkudpO5LmeaZx22iS8fzt5C1OKyeIyWCOtip6LtfXRPw4EO8PqVnPjPH1uI88IvVj
	02Lo5jej8IRDY/VYbZ5vHOJwakocQU8vImAegZbIsbisybqjBby8W62WIdPYNbS4rrk+jTWImkS
	IyrZWzKsfiicyn3nwSToowQPvy6kMBmmhJGhVGwTfwhi3zmFgmpGtf08glrZWVn32FQmvM0dNv7
	Kgu/NGaLSC2cyExVHT3/ekLceUbQ74eXd2I8A0nUBvIyou4ypjYsUcwLehifYy4rRrkAMpsv+D5
	tWoDklEHvYVIw==
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr29533902a91.1.1788755050737;
        Sun, 06 Sep 2026 21:24:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 2/2] xfs: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:53:59 +0530
Message-ID: <20260907042402.12893-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112909.8197-3-hemanth.selam@gmail.com>
References: <20260904112909.8197-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch, one of its hunks is wrong.

  fs/xfs/xfs_zone_alloc.c
    "Stash our zone in the inode so that is is reused for future
     allocations."

This is not a doubled "is"; it is "it is" misspelt.  My change leaves
"so that is reused", which has no subject.  The correct fix would be

    "so that it is reused for future allocations"

Carlos, you also asked me to fold the two patches together and drop the
mechanical wording from the changelog - I will do that in v2 and include
this correction, unless you would rather not see the series again.
