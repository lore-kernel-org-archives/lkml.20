Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9EA376A0B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582608; cv=none; b=LrT5n+zdKtlFuqBb6DsUHAqg7sXI/dIQXwFmPVfVeR2cMPs8R3wkaKGpXQa0ZfO+DBeiboSJ0ojhRk16X28Fu2i1aoTISUd6Z+ue00iKtg6T9ZStZOT+5a8AKcKF1/ybuhrK2Nl0gMHlJIk4EuPMFpUHdp5wgY8HXQFBFPYQCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582608; c=relaxed/simple;
	bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EXjypnWL4ZZ9gj8nYdGuDLixMMP+i2+IHKGVgWIkoYzTDv2+lnqKuWqityt/EQDhVDfE+l3pqH6l+s+t9Li/6QpZyX4Vf5DQhU3CbHMtyfHJdLWMreNt2kfuvrEsJZCvhU0Q0R5n/O087WCtD60ftRjRDIO6a0Hiv7BNcXNBBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbD96BKn; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbD96BKn"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc4aa027fe4so256195a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582607; x=1791187407; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
        b=GbD96BKnlYNdSdrAknuVm8Le8oso988fVVLKo4QAieuK04pTWRQme5peC2e82L3tl/
         1nzHJp8/kVnCE+6DASYcL+JMEgn91rshnxAyrH+b4KX9oQAkeLoTN6LVGfvNjJLPgT97
         RkuuQbrXkh74pb4lN4CTSD0iFwXqLNBGdeKxfXZlzMfB1GgJqFBGCu8dOT1pbrJOkJm0
         0X6yqdbJnrikRU28v4CSDBajTMHcti+SFUmOMGncdM3SOnziJ7NS5wXu0J31pA9hcQws
         M6vz7q2GEj7+9plU1gGQo/2sxisckmjgT5FDCnBvvPDR6l8U37qUVl7D1xcecT0bBO0m
         3pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582607; x=1791187407;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
        b=WcPLO7z2LBTLOyIDMpeQJ9vo7CCNMMFt6Gm6cyn/CQQKQ6LSRIlQMiwnR8obi18yzC
         QHlwVOPJwInOeGyAJnVyFjXIHQvmX5nbmvYwfaPzh8D+Vo9CiPKWhnzChyNEZcWr0ble
         pkTYqrnakJmPx7h+NBCf46E6JqZBXo4UEYVuBlZ0u4S0dvmkNKjg8Grs3PlyAE1cSh1q
         DiFrWRVb3aFbDHTi15DysRJM31hRQifeamOsJ6sXEM7KgJIXVSc5JyVXNdHynnm+QmAq
         Cr0/Lk3z80JbbdutB0+grRe0YQBFWeaX6x7lZN2dfpJ5XFuaIeJsI9l4qbeUnKEJZEV1
         44Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzDUg6O4ODUqijGmyM4+pjhQZ7CtlCQyG4dhBNy7urprdvfON4KPpvyKQMX0bNTEmfclt+qUEyCKQKzUuU=@vger.kernel.org
X-Gm-Message-State: AFuF++mrRrXOZ/yof5rck/iuq8/XcK1DDO/D6BpE7RTtOvZccOqJzUEj
	MgfS5YDOEQ9XP6Xw1u+6tBVPeN9xxRsyrwUhNQRQeImovhPWRyUpS/Cc
X-Gm-Gg: AYBFou0hnWt7YHGUue5b+l1D2tza40LUXTwORWEu60Qpss3u+gUIX5R1xLjmFJ64qqJ
	w80U7yQ6ibEagSm1ZgemWzekPKEjBhSngRyVaqqxsy0lRLxeR46L60Y8UDjqKfsGIdIn3sr2un2
	ls8UQTUULOkkOcIBjJHpUZlW/YowEpRRz02NnipiUzw3QsFgA/E8cUWA0DpDmlhm5oX305/01bA
	oZFMZqlaVwFpxLx9qx5lJebkCymkoj3Ez9N7BerL0TDZxplK05TtYWH9Dn7VPt6VodGEH9YyuUF
	KlBRMgxkjMUlWlPSfXQr1RhAVhc41ADYKN2wYz3rYNeMAYoNIK+1jcTtt38iT6AjHRGilUlXByt
	KCZA5Wj9wPK7+Z4IwXMIbMZOx2Do2Z6QPPxewVE+g9GJtTDy2yWWHKZBTwetWFPJePGhpNOVi5r
	vMseXNFKG6AxG1DeDF4wONQwUVg3/7s3UIagQkDxVoO1hR2pFRRctuqyzv
X-Received: by 2002:a05:6a00:348a:b0:881:fa65:d4fb with SMTP id d2e1a72fcca58-881fa65e5acmr3366523b3a.56.1790582606929;
        Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea19030bsm3775258b3a.11.2026.09.28.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
Message-ID: <6aba1f4e.85d8e643.73376.7e2b@mx.google.com>
Date: Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyan Wang <maximwang110@gmail.com>
Subject:
 Re: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
In-Reply-To: <20260928072801.13714-1-zhanxusheng@xiaomi.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
 <20260927180359.3867508-3-maximwang110@gmail.com>
 <20260928072801.13714-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I noticed this regression shortly after submitting and I've already
dropped Patch 2/2 in the cover letter thread.

Link: https://lore.kernel.org/all/6ab97ce4.a24da115.4bfe6.0f74@mx.google.com/

Thanks.
