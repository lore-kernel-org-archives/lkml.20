Received: from mail-pz2-f19.google.com (mail-pz2-f19.google.com [74.125.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D863B6BE4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460015; cv=none; b=iuafAUPzwa0ZkYL8fxYfkLRV//qi6E7Z1V6yFdo+5tkyP+dGsjYgZJlkIpLRilimtNRzZMV6P370tmsBJeaHWXIf7hqcUVIE7txi5uWgFlg65gERESBMC/F/ztmeK4rSzg+P+9f+mTtTzWwMF1siVfxpeZBIdC0vErFu73wyKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460015; c=relaxed/simple;
	bh=jiiyXOZojpsENCUnGFE76LMjg/PvEFnumM2R/jc4XRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sioDrJeKX6ca8Tnu9h3M1kwUOrUMAXYI5oUa1Gk45qZwBRjAyXLJbpulb7/jYNN8OLPhuHESVTCF/s/KFhbxDzLm7i+rWDi/wvOBfG8cl2IAFCBd0ilCGOcej8P8FfmBqsmz40upO6irgjT10WvYyH8Z+AKH7jPAe63jc/VIFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6uYjRin; arc=none smtp.client-ip=74.125.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6uYjRin"
Received: by mail-pz2-f19.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso2006797a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460013; x=1790064813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiiyXOZojpsENCUnGFE76LMjg/PvEFnumM2R/jc4XRM=;
        b=G6uYjRinJoNx6dg1TflCMLfa9/ljrnDgRD3QKHQb39O7TujgMUo+pF02nSqFVh0Gek
         qmYpR2DchQi9NgwiWJ95+6YvTRBdqWCeXMqElkBAx4jtfV6cfKDWIMKYQ9v9lSFchXPr
         fEjqUfgzHEb3VK1Ovv+YIy61kv4XvBJOj/gc6BkPBPmZJIIhVdCDPuMDilKjmWiDjQLO
         wsG4wo6VvzThIC6tEJpceKCFejoB6aeOrpHLX2gLl2rKZv+uQAeIx6KjnK6Y7QcfDl2g
         Bz0OMaR1TjgdYUo8/8PE0AclfoC5pFPCudrm/Z8y7+r2DwlEKyWAJUXn7pGerchTzVnF
         c1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460013; x=1790064813;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiiyXOZojpsENCUnGFE76LMjg/PvEFnumM2R/jc4XRM=;
        b=bJhUsDVcG1yOhCJ6bhu2w6fNcxP0dHgiYp0adLCwiXITKzyUIAakCLAv8SxlWHR/il
         ShksD1pFaiSVYPf7tOOi7uj5OQNMIQ2Jt4mRSjg7+IswVQEQahBJrRz7anFZ2zFIhGe6
         dKavsn3Y/10l2lYV+hgH2SdqJuGIZgtwUzffbU5Arief+zmLTS/vi42fRXG2OlZY91Le
         nbu/KfbX3Y754Zo0HyakeRfJutGBhIAlNfqdyvJ18N/xdMaQggSPnqxHMwodaHRTslHI
         sWhLJmD+a6FJEiUck0ksjCNo9OKMyw+9NY/5lEva7LqU+fgoCzZkgwidEAGOsg/TxOmu
         HTHA==
X-Forwarded-Encrypted: i=1; AKwUvBzLsxE7wvfNYKozWiqltRsXWiyI9r/Ne/sUwnfxalN/eYBHJeNbWpmJi9B30J2mht43vs+9WnjGZZtQQSw=@vger.kernel.org
X-Gm-Message-State: AFuF++lc52OnzAPyRn9XVFMvnWWdIRaQb9ggetsMuk6IKO+DhWKwLzdu
	62xV97OhEjvo7sgAqnihgqf6TwopZNEuKld8W2t3Y7aqRL0C5FRsiTUf
X-Gm-Gg: AYBFou1BETi/h2PJc7iVgS6YxEi2sYH6iSnJjCK56BrwKLQRs26aHqH4NovFP8BOjdm
	zId077wlmWEAqTX5YGa4jDDGbXFB41Gkx6+WGeMvTlYdof8zK1At4qBrZMJts5oQvh2mZlSHVIU
	TBqipsmgwqcaq1p1nuuJaSqnbxlbzE8EOcvMY7yYCJfWYmFtmCWEzNA1ThnYNB36io6fZa/wfQr
	ev2PoXx4y70WsNGHI2fEOPZleZG1/Fr85jKKG2+pzKju/BNukdE4lGeQ/ZpruYm80hdPhimRX1q
	VZZ/X5g/ID0TMbUgWYYeeWcvfCL778mWEBu/BY0Zsco2du9pW7PkGLsyHI5gV7rK+s/ktTTLbN9
	7FZ5EQh6vNsL+OinDKsrG6dcEQoiUne+3UUHTulDJ4K57TTVp6XJtWw0KAP37C/zEXZBCvXWeuW
	YbIU2+0ayLdUJ8aD+vaZrn9Tl+tfLTdaSXdRfqq76/970paY3QXAYMRS2LwRMgKazwN6x+K33Z7
	Wfzxz7ANx6XRGypAKK8iciZl5dTkDA=
X-Received: by 2002:a05:6a21:4cc6:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3db40622a50mr12913747637.13.1789460012618;
        Tue, 15 Sep 2026 01:13:32 -0700 (PDT)
Received: from localhost.localdomain ([103.120.31.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm49686987c88.14.2026.09.15.01.13.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Sep 2026 01:13:31 -0700 (PDT)
From: Khawar Ahemad <ahemadkhawar123@gmail.com>
To: maciej.fijalkowski@intel.com
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	syzbot+aa48b5fe7bfda62d1682@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net] ipvlan: unregister upper devices outside pnodes_lock
Date: Tue, 15 Sep 2026 13:43:22 +0530
Message-ID: <20260915081322.7551-1-ahemadkhawar123@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828164918.451364-1-maciej.fijalkowski@intel.com>
References: <20260828164918.451364-1-maciej.fijalkowski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maciej,

Thank you for letting me know, and for the fix — fixing it on the ipvlan
side by releasing pnodes_lock before unregister_netdevice_many() is a
cleaner solution since it removes the problematic lock ordering edge
without touching the AF_XDP paths at all.

Please consider my v6 patch withdrawn. I will not send further revisions.

I am sorry for the noise caused by the multiple revisions during this
process, and I appreciate both the feedback and the patience from you and
the team.

Thanks again,
Khawar
