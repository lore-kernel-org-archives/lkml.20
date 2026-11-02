Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613186;
	b=Gn3PwjTLZY5S5mNLvwIKhpGMEl8IcpYXwMB2C7OpHjEE6HG9DyM/vHdRmwbiCPTE9GVL
	 8hEOPxIs2m+y5S0gOteW/u95MNjtoxMkI/W/41Au1MNyIS1ygTka8j++3wpAd/w7Gk/Q3
	 y4tRpd5CWROCZr/hykBoXS8G6Bd8xlKiKNJIYa33JNObd1cImkn/OQE5kyy7Dy96bBR+0
	 8rti4uYUkZl9YXXIQiq6aNnpczKShGuG+ZdmgIOXKoG4f0z0gs7Bc7VvQBoFXoWEm53IK
	 FSrN5sCq3gWfYY68Z2vn88PfAz6tddZddwvY8q01pIjCp600Q2qAIRL1mwqCLtC7Ozg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U4e/HCkTNylRsmi8X4W/UinfEijmoIExq4OMj38bBYY=;
	b=r6zXNUVXxVGZb9u4xjPyWKg3vJFbTfYVfSePf0VHzJuUcgq+qjY8NV/kF6NTpYpe7Bdn
	 jkKWFrTpUq8GEP33PiPiZvh0qfT/V5uNLs8WJGDWJ5n3TVCmxzqkofWpj8t7JCbOr3AL4
	 WS372TS9DdljUJ1ZUZHN1gOazZoRuFpj3fIc/hOKDc7tuj0vnjPq/17s1fk3nTd/IQazY
	 7jPqmnabjis+e6J4sOlCp+OLMRfH8ZL2eVFS5N2Rw7hRP9IWBYyhFHoaUK7ibd1SMd2ek
	 lls5Qes8aL3aEciUc5GzOODJEXX/HesYD/6x5/4tOhv/4lQ+8xUnfrgYWJcg3BBwoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S249brKC;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6E606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F6E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S249brKC
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9d7791b00so20991915ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613185; x=1794217985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4e/HCkTNylRsmi8X4W/UinfEijmoIExq4OMj38bBYY=;
        b=S249brKCPZgC3J8sQaLmT8ILKpyHUiEKilVRekXjW9umgNy+bewsg0WKRb1KodNbbk
         EOho3wj6a+C/szTvn1OU3AIMxrgZR8faiaZWLZ8VUdMBpOruNcavkkdIgCnSpWU4voM/
         as8/2eiXipcQ/mmMdz7cPKCFMpp7+fyMe8RtgDASuWr6CYMCj5vs+9Bn6rfSrcvR6zFT
         fM+NrocyRnUzSA5W3pr3cygl6OS/n/a1gL+ugQ7dM+FEi5fE49m1bC4QHUB7Akc4bCHb
         lgcVTvcxX1UUAEPLrL8+SUJNAEWiWSjfFBKzGKRhgpG62Ve3tVJ/CySUQ47UQpUAS2RB
         VbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613185; x=1794217985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4e/HCkTNylRsmi8X4W/UinfEijmoIExq4OMj38bBYY=;
        b=ZFpMrdJExbccdK0/kA/8GV2mrUDCP3Zmq02yyGOiAhC0JL+JAVbIHdrRz/Hop4VGo2
         747GcnLOIF/pkMirI+qmjS5OREm1Y/BxrJvbSVc+ocyqAbH7H92Lq51gAZKGbbJc8nHb
         5NXHWvdNJHziB63XOLdVtzXR03/+VnNhXt2KgmefPxFTkePKyIkv9U8PmVjsnllHMAk9
         QSV3iCkKTgpjYq6jzH9BLOjVATwa4Ct8/Jlg/dZwKRffOktAi3il5MJRXHcN93jBATTZ
         YBZVEPe59Miz3MkkEC7yprfSBDjUylXaKpgFd3EzUVisvUaJk1zOWl+1CENKdx+Oi0/I
         7Rmw==
X-Forwarded-Encrypted: i=1; AKwUvBz0kMLVuXk8Ks9MOdissjmBSB5VhuA4EKFZojAu4NI+kAuWSERHKkowF7Fg6Pot4GxZ5ikFmpejG0DxFVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HHwW2sWRjJkOJOlrorhKaQFyWuaznpcSuwASvCGZwz27XOkhH
	QrH4M2t2VcDuexfSK1C98d7Awfy18uKI26ymK7BKoDUtcnEI4JZE9+lZ
X-Gm-Gg: AYBFou1GCrwOvwGwlC4Lj5UMBy8bJdEeq5Jx/Xc/fEIbr4REf13QqhqbJOAqxdO+gSz
	9N+RseMRDWGlsa97Ugc0Sx5aV8rotp8ImBw7AiNWqGZVz6gH5i/lJC9eJ6cvj363iWm+01LFF61
	TJhkXxi2MIVoKtFLXr8jWYtG9sGcKgF9eo5wng82dOpCKWKzsKl0MOm1S7JJoSlZF/yCy8hv0/T
	kezmjef+7UUBCohJrfLjal75B8541U/LJdrCUk9mhT5Fp+I2nT6RZ9O/SsxRj0aFJbKk+zezowq
	SZA2LzS7LHmlVX4l3fKZpeu40vyPB/kiXCEK1XtrH84+8a/Hkp9d4JPoIQt+kzuLm1Hc2dighNv
	eU1eTs3JbqXRFYRwUpX7Ve0FduMy+VaHmQd/8bgmrwfPi0WM2/YOJYrZXG4uZn1ndlhqcYMlAVU
	+2IRxjwA/zhDCpExNlxgd//EyynqTx7lk4vMUsw/9O1Ft1TQWpmIsWBTVXlENESWyydjGnlW9r4
	7x1/BtaGFOJulD+zbWPYjfjyCOMJyWKJVFBH53pIQ74v5kIqT9HlmJcUr8jx0QnyPHdEfjOzbVh
	1xdbUmHiZ68lsOjm6hOTs2u83fe1Wo0N6NETjzd+WcQuqsOVamkiFUs=
X-Received: by 2002:a17:903:18a:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2eb364de913mr93536715ad.47.1793613185064;
        Mon, 02 Nov 2026 01:53:05 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fc4bsm26472485ad.12.2026.11.02.01.53.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:53:04 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk
Cc: john.garry@linux.dev,
	nilay@linux.ibm.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] nvme: Do not drop the cdev reference twice when cdev_device_add() fails
Date: Mon,  2 Nov 2026 17:52:57 +0800
Message-ID: <20261102095257.37287-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102095015.36448-1-izaiahsun@gmail.com>
References: <20261102095015.36448-1-izaiahsun@gmail.com>
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

I sent this without my sign-off, sorry:

Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>

I can resend it with the tag in place if that is easier.
