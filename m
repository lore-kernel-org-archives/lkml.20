Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605195;
	b=I7uq+TDuL7U/dVRDkKvD4uZ/rNXjJJJ4FsfMccloXrF0EMV7mdSKibdlub6wCKkDLGoJ
	 gG340t8VBkCYM1AywCgSRgFZ/p2mqFCJHa49AK3hFKCkwEZc/8wMNSbVKEWo/iKJKK3vg
	 sYu/wNFO3I32irVSyLXoft+XbQkWihNP1Nm2IsSlyYHZl/yWx9Cz3NBzEJ2d7IgFu5kjX
	 gtHop3VhbX4l4OITcaJpYYH/3TFvIOKSvr4eV1KhbvwrcxHFoke7BG3Wk1eWqAh+fP+Xd
	 xbOCWuycYR4ZNlZzW3dtNYCzRpY5DESFY79+Ejcw2/D9VX321kmhLihG8E3LboJpIWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EKHQEVKe3P8J8ao8BGzCfnwn7QspA2SFir6fQkjj/Rw=;
	b=5kDihZ/fC+UtDwf4b+WJQzO+Le7uY3Tne23CppiAkCQXu37+3tNcylba3yNR4vHVWd4I
	 V1ByH77zzIfJvDlCOF3oRHdjdz6xMC7pAVP/ekfVdEP3HwHFFcrFaBkGBfZfrUD0cNQ1p
	 LDu0PqhE9Y29nil5UCKbsNB91/b5dgO2+62sJAjwZ/apuMcinQ1oEOpmL4bYHDXJ0ase7
	 tL3ieVnVLmD/ZzGYdll0BLrnMvDPPPAdBEVNFTBRNvZtuGmTiVVjkZJ5Hc88z7f/w4G92
	 q2DV5UXNNi7rO8l1zSpZav4D6LVotpChOS56HrxuO657dmQ28gg0cCCFOhNv74ycv3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xy9bMYJv;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC814606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC814606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xy9bMYJv
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-9369a6afaf8so53450885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605194; x=1793209994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKHQEVKe3P8J8ao8BGzCfnwn7QspA2SFir6fQkjj/Rw=;
        b=Xy9bMYJv3tkYhDXnapLP6C0yHm2bzQ/rafwOM4Ilu01F65xSFOYh1wFyLwCwBjrT4t
         eDu3BdrIiLJ/qxbERDrPAcbaSTeoA1FdVGyATVWd9xmHI4wkFg+AJDXYiyWhZ2cPaJ+0
         xrXLoQ5Ri7zSUX3YnAWa+bKaJG//8f/f8niC5iQDny3H3Hd3eStHOXj/yUUcNEF6A3lS
         zWuxaPHajm+xUTUSBz7b8JTEfNL2+kS3BB15EkFSgjhqN6OMUH6EF9bh7bBShV+ahGW7
         hngoD7WHZ7YFr6IlRsPIM02XQ3oenYbeLj8qY5kBD02WbEX8g2XcyHE5EyzsGXbPmKEh
         tsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605194; x=1793209994;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKHQEVKe3P8J8ao8BGzCfnwn7QspA2SFir6fQkjj/Rw=;
        b=dkDFPompvE5YsaXnq+kr6KhcRDlWB5bnF1oixz5qIAldHzNuITq7O7oYC4zTuzOw+H
         Q9xLwDBVPHM70uF1a7DlAgL6CmE7BWEr3/X3jVe2fuX254PKLdBjbNzSRFIj8LHrbaDq
         KhwPoPrmdsdUKdTId2Zp0J1s/fn1TQC2Ayz/hKlS5OaOBaHmICi3n1whahmIYyJ9eJsB
         MSubggmS8m3m71jYRWhAKQJ7A08/KylreAP13SR59LalYJxvaA3cMGlwy5ZDvxE3EoOH
         OzDp1TCHPw11aGYTkC5TYoLeiiMAYACE/n1uh+sKOR0rEhSdQ4QnFYujaPU7kh0SsWUe
         qOOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCO+/mAnUaGDyR7jviEVZ0sQsdHEavUtjnmbn6Ci//5i0P4l3cnh0D0YJcoy6pOTE+tkMdoG30mIPpZqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfJoQUvyLKg0v753KKHW6/rna6JBcHFy1ufrG7JB3BQr2uzlM3
	wmnnFfddqnD0ZYthqcVlHmeOHq9fJ3n6EeaoJtGO6gi/jgskEwKknyMy
X-Gm-Gg: AYBFou0V1ZtOZoj3qgmoBhbg0BkHb99CVWTDBn9GUg+5I/xf7kj/Sru2PRdR/P8pScR
	+Ev1PDYaSLwRCxDoYd1gP0rOa+GXMvsh/V72EVXDe/mjsb/RL/G1VqnbnhbXBov/9R8UTCaNok5
	qMiUn+5HwpdeF9mMwXdTQY7g/HLKLSZny1RA9USY3HbA8EDHHBJycVPnq5bAQuZnQOq4weiyaub
	PHIoXPNRVK7eOL1kFWU5yt62yk8WqOdnGtothOz4PIF5o2uUSGQcNOwTvReEGN6SAS/asvDjsuj
	st2IDfd5VS5jNZInTVvyveUKR1b5CS1YDZXmGnkdhGoQXjmf2F+SzNiBFqKdsNoUdUtOb+l4Lg1
	Uqu/GiDVOxfX3q2YDTBys8Kziqi9jNF+kOHhujf0054EKaiobe/ZCNfagCniZCA9ioBzD9WJXrj
	bVqLEZESLteL7giEW5P/FunVkZQ+mFpXnJrisojMQbBtKxbmfQNs3vYI6wV0ArVJD/QjqKXJMTR
	C3w+JUNydpxTSRrVtitai9kb/JY8QHG+hQzEEGCMtQiLWyJMp24qVoWTFX6gDvCB3vi4JoOauGx
	1so/tqkZ0w==
X-Received: by 2002:a05:620a:2987:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93f57f05babmr488590585a.4.1792605193584;
        Wed, 21 Oct 2026 10:53:13 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9af50sm305675385a.8.2026.10.21.10.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:53:13 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>
Subject: [PATCH 0/2] fs: two mount API fixes
Date: Wed, 21 Oct 2026 13:51:51 -0400
Message-ID: <179260511193.411.2849255769062027805@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Two mount API edge cases reported by shaos, both reproduced on
7.3.0-rc7 (58161ead2) with a small syscall probe run as /init under
QEMU with KASAN:

 - statmount(2) with STATMOUNT_MNT_UIDMAP on a mount that is not
   idmapped and a short buffer copied the reserved empty string at
   offset 512, one byte past the declared bufsize, and returned
   success.

 - listmount(2) and listns(2) with a U64_MAX cursor wrapped around to
   zero and restarted the enumeration at the first entry.

Probe output before:

  uidmap buf=100  ret=0   size=101 byte512=0
  lm cursor=MAX   ret=1   id0=2147483651
  ln cursor=MAX   ret=8   id0=1 id1=2

after:

  uidmap buf=100  ret=-75 (EOVERFLOW) byte512=170
  lm cursor=MAX   ret=-22 (EINVAL)
  ln cursor=MAX   ret=-22 (EINVAL)

The in-tree statmount_test (17/17), statmount_test_ns (2/2) and
listmount_test (2/2) pass with both patches applied.

Thanks,
fujo
