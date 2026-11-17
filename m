Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899704;
	b=B2KJ41avy8eO5tz190xkW5V8Cjk3rTMPvD3GxRBIBcubQH2xBIUp6jeu4TlBVTAkEBIX
	 y0h6/CQWOFdq3lgDh5wJ0r+Iv4vc3UghriuAeU1efSkCYbmLqtkHrXf1x3ZO4dhHBTNh5
	 0lELd+H3OaCiRzeEgG6tyKYPSBaGcckglb0SZ1HG0gGDDZrjIqHF+e9PethA+XuWMWYaN
	 gxSy9HKsXGz+GDDRkfyVLFZQGEuyo6kN5TQnr82y9ZjEh/UPBshY/ihNYxEAAfyaUb8Ng
	 U7GNkRXcKlyiYeyPvDvSXwh88rmRKb6D2O9eBW7CkSpTkUhMbGrfYwl98PmLppCFFyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
	b=2T6K7H8G8MdtRgUND3/AyV3xU/5GYVIN8IaWMPOx2TyKMMUNK5Y1z+P77e0rzUVtMNfg
	 FD4ZXVax1eh6yzTPFEacyzZaTd4luL5TjmFHipPjKWzyUK9+4G/cbU3Gr1ULufhTw/CCk
	 m9xZHPG42iGvXIfUqUQhbfYG8IDTBKDxsOlZbWMaaDFCE4zxzMfYgNriEAboLwHs0fno8
	 7qRvueZxSTgt98RQwUJrGe2HA72Qp4h1MSjvouF0RF2bcK8IihoIcVeMUk2FHHCPsJoE3
	 eNWSVwHqFevexcCC1yjGUs5p72gWhwDvVZYRixFKTf7u1jKeKXLRESsLzyI4/G2xzBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEyMdSCn;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C20606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C20606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEyMdSCn
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso27016315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899701; x=1795504501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
        b=vEyMdSCndnU5Xhwh7Mq4hy+9ryUOHWhefCF2211UShOvpGk7DYB7sLU3iVByjfCC2m
         HV0haF21sNhc0Xc7LdfQTSBYlq2wBFX/2o4/dTbrsc7IcPwWrBcvCBPBraZ6VcFyvBU8
         tyn8DnEuA+Vnbldmg242Y1dySkzTm2ihJ0tn3zoQaE+7hVojTe2YEctbRVFp+re7EmUF
         HGUOn4GdUCmZOo3GHkyqnmxgBecVeHNe+YCSlY9WbZ7J50mjXlsS6q8ePUK7nssjnXy7
         bKVtGSOGbqEQs5mlOcSViXEgjMu8RNz9ZF1jz9aWJj5sEvAr6QIL4mYq8j2+kHHRoAjQ
         OtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899701; x=1795504501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6r+ORBINaK76Wfhn5WoRfNF3GVVZeuM4ebd510GSqM=;
        b=TXpIoFIHz7GDFJUwA+G9qX1XjseyJP/nfrrx49R7g203MVJCjl92zGGJdnD5TCsu1B
         ofIsualQeh1eoHtpHuWmJiw8yS6jh+zXRUMFi+dfpakKuz7i7RFRmObqb/+NjHSg97p8
         uFLSgYqnZs8rvgCDQkoDsE4GmrBsjggw9BSvQ7khkS1lOBRrcs8kwFFuyRLErpYfhRUR
         5Cift+U+3SMYRGCkipc6n+ucP3VpUp7m/YHvfH8WXrha82sVSXJpnn8vQyh7dQSQlI25
         kI4aB944Nkgw5b1aVW7wt77BnI9CABcIiVpqeur5dK1iTtkaqatuDKjNzcQVTEoMf8eT
         uwog==
X-Forwarded-Encrypted: i=1; AL+hErEg8/aKjPCoLduThoeOSI3hdc7bg9sZQTS6fPsOXyZrNkrruRwchNaRjT2EC06nydbxqZtkw08Zabv9nBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KBm8ght5/Scx6krNBTJ+buoSyJBuQ4kNRNKgrvs8mOkU/x65f
	YHUMUMsoukkApZDleCFOFgpn4AoVRDiRbKmivDP8+gir8W5h8sTWtwga
X-Gm-Gg: AYBFou2WCxyRg3YIIBNxwTwuIOAMYedYlAJazBhTkuHZ2MhsvjOM7Nx4Px+QYd/Rl3x
	GkpBDtKqSp1J0uAs/GaDAaffoSWCYJeD4dD9TV9SH5uYYgvYBbd8O7IuNDWd/ghe5IAM8o/lK9S
	pZISl0J9gkz3vEYxlcOo2vb67suxRbz6pgXKngCjnyrYGRts1rzcfSI6HV7kNu3XYSt9nohrXuP
	nAC/mrAtPM5Olj+TsmFSnlT+/jQnP1gS3et/BHhBrJn0pMRDmgAZy1KSB0lR9ykd2C/XsFFgnBL
	DzJLZGg4SJF8y7P38t6o3qFembweRgTYZRU38LQtjuZTsDo+7Fu/1yi5fpmY5hKZq68reNrLRHQ
	9Jguit6f6s1/JHpQet35JVBeQVHHA/EPWNCbMGxaqkCw3EkbmU1aveXVqdnQ6t8lbeWNLNQK0Ak
	VWAs0NU4SXQV2BedjTJ9w3cWIjn2xvokkygmz3IeB8OalUWAbfkrza+DeMUxjXxnvkyV7782UxO
	itdxLXUkkXTEsaSKVgUcVSzZLAYQybIqRn4YMkgYddASOPawVB4ZCw3LUFQLNCYqMG3q1Zbf47f
	sK+3VNHF7edDCxnBgxDlI6mmKiZKv2kw/rw=
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr166270075e9.11.1794899701137;
        Mon, 16 Nov 2026 23:15:01 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm6290695e9.15.2026.11.16.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:15:00 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Tue, 17 Nov 2026 08:14:59 +0100
Message-ID: <20261117071459.1649532-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179484804679.162984.8852491396666803433.b4-review@b4>
References: 
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

Hi Toke,

> How about we define a __ath9k_htc_check_wake_queues() function which
> takes a boolean "decrement" as the second parameter, and does the decrement
> under the lock if set? Then we can turn ath9k_htc_check_wake_queues(priv) into a
> wrapper which just calls __ath9k_htc_check_wake_queues(priv, false).

Sure, will do in v2.

Mehmet
