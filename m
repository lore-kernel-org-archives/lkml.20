Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1536EABE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272805; cv=none; b=gSYOQLnpplcCgT5or9kviNH8fwzaK4tCm1pRYPS4/Wh9htAYaDEvCUfBy0XE/nrHAzsApR0ryENAjSU/MEoSgqHjHKUakxMROjYCsfxFP/FN+pDb6Fk0HoyERsPJd1CgLvudAv4N4/hKyD94/8Z3ebBI9sqx7lSxZsLVBRbNd+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272805; c=relaxed/simple;
	bh=TBoh8x2Y09OyIbQKjDHDrKf8iTEqOpONJ+F/G44QBy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4N3bkp9df4/z+dD68+rVWpfvSgAgBzPlB+ohJgX8wH1UZUra0VgKdfPS3CGtgk0OTgr3AYHrPX5+z2cfpUgoPqSZ3fDzepdRSksEK1+NXbdyyoB9hIYqj8CvO2RYos4T6H+falx+OpD21wgaubdIcIPgKCmBJNXvkgFapxy06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYLBA8cr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYLBA8cr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so16376895e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272794; x=1791877594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBoh8x2Y09OyIbQKjDHDrKf8iTEqOpONJ+F/G44QBy0=;
        b=PYLBA8crnkHpTikLCxN2cQGxVSke0VWJJrtntt2+Rt88wJ5BDULTpFmsGDADFcZ9R7
         jV3OM5jvtofPx/E6YSX5hXY0O3l/9TzDRO5QYewpq6AtThV4DaOUV4u8dRiFVQQ6ogcc
         ZkXUVmhhbOC1/4ZcQkAjpq77jbBBYFudTUQ0eIKDnSJ1ravjnhYcXTJv0yXB6ABNN9By
         BqwNXtDWJxnUnm6ZM813oBpJnTEudzrwIehJLu1kwPQxJbhVclySHqSua2va5EGEnJ+T
         CDuG/cjMhg02Yy8SShFtT6i99CW24jtZf0fGeE53bQZjuNd/pB95S13UHp/4H2PwOZ0A
         HxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272794; x=1791877594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBoh8x2Y09OyIbQKjDHDrKf8iTEqOpONJ+F/G44QBy0=;
        b=e8VydUM7B5fRdFiu2dyv2LjahbLYBp0+pw2vuFfJFxIpmBzOBpHX/l4QMPk3gZT/JV
         emuxxQ+mKkIIcLFfzjYi/ppAUFw/9XDYy+Yo/RNZc3uSzq/ajmnmdnuSTpjnFZ9dLY7Q
         0mcQjVSHwS59Y7r+BcWpTYlYAfZHa9gJQC+7BSeiuOKmBgaqXRWrTx3/aYlx7KYkKXnv
         GWULWpeZ+Skx4BxHhuyXkwPYMnZ7O43hJcZL480yJydS7Nlwpc4TMppIfrne3Du4thec
         gc5hMs/ETn46QDXneZmMe6LZGM10Ur7GCo227i1fx9l51wLOJgAvHAALbIVnX78lcOCN
         3Ujw==
X-Forwarded-Encrypted: i=1; AKwUvBzoh2WgUSdvwq5ZYEq9FGHYLi4e1wmCK/usebg/UwKEaPJ6Q+Ns5QEAEiDpBOpsfdCtLZEEmMbsQ+kBQQs=@vger.kernel.org
X-Gm-Message-State: AFuF++liYD0pW38xnau/PUWJPTwvGYGANz/CeH5Xyqn02iVDhZpuw8cC
	MoUBUMgEEDEfjnPu2T6zzmW4y/4dfOU3qYKgrC4PJTv85d5x37JycaZP
X-Gm-Gg: AYBFou35bTX+GjHybsAUpI+jU3SXnzPut3Y0L4w1ckWm/+pXO5oEYmZxuwAxLoP6jMo
	tTEwupbWklQDHpbuS7vKWyc5ETR1oldYjnhYtpuvg1kCCqPBYbhEN96MBSc6dDe6bMLQ8vVdIEB
	tdcLA0XNweLAqlIQeZNDWtBCMX95oFIXXkKiVM2fSi16qLOlXumpDvnbYd+ddqEaBIY39eNI4ay
	lrF8HwIIPGlq+uhKCP6ZUUIxb3HYXolpPcw/qLr8DL9gw7sfSX3LSIF2bfkZq/MI6nF60RDkcWx
	jQbFqD1BAQXTsuXw16gPgJigm6y49unx1vd2odAyWYtYmXPSkRpi7tWc+eWE9G585qCOYuN+4tw
	xXFgrbPIh4X5bFY5FK39feWGy8KtjPu479OTQYw3t2jv0C/ZyitZAIeDpF9NrWlXzVw/o/nXr/+
	Roy455e+mrm20qbiVMCLOyQGnZwiJDkOdD09PPCAvvkBronERrcR/elbhxsQnq7Spxgr/EBZAe4
	xp6
X-Received: by 2002:a05:600c:4708:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a17b533ff7mr9742515e9.7.1791272793599;
        Tue, 06 Oct 2026 00:46:33 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229ee60sm8311421f8f.34.2026.10.06.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:46:33 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Tue,  6 Oct 2026 09:46:32 +0200
Message-ID: <20261006074632.372846-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <64b006322730e0a078983458932dae35255e65dc@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On 2026-10-05 Luka Gejak wrote:
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Thank you, v4 carries it.

Best regards,
Mehmet
