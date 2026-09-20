Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F683E51C6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900652; cv=none; b=GtM3o3mEYU//K9/18Pb2sR3j30OA25YwTecGRMkDXRdp8tOvEeDiwMbRMnOE2LekWeBUhzhAd3ME/9RK5q5Gxq3bTMMY73niiXzxsvI7zr3PKTtUC7lbc4R2+vXVqrMgO7eyFhny4tBrf8FxZhMNyNDAx02pKkW6bNJwy2dWD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900652; c=relaxed/simple;
	bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jI5OhN6S/bFSwSGne71LGc17qPwAh6gXQFrEmEKrVTgKiUYbH7gT09l9YQCbqwCbwZuvP2Rs73IbG7haqcrahEKBKPmVOfFt2JuIp9O4nHS+JFUtmDEZKX86vPV+ZeMYwvZl/Yi1Zpz0wra7Q/s7yMoO6ezVmTxcyHkFNCivqsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBfVRUpU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBfVRUpU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so11769075e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789900649; x=1790505449; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
        b=YBfVRUpUeM8Ytzhd2h2iQzkZYycGxk6J5H3ZksKp+fRhbqj7qRxm/EAD5mRbqfNz/s
         w3WceFqzoZe0t3/RASwQn+kor5CJI1q2aZKhmJmksABwL0rYLJypBelegKcc0R3dwTx7
         dlb3PDKNAIv7OvYVLtbUZ25E2h3AOEWcOJj2f2VC5xq7eyCfll5ZZEennBwkH/AJLHmo
         vWJEZ5LROFJiRvvLZqJmn1Qiz962rztSY1ac75ldRN4mXq8Lw0vDXWKEqTv14YbDyl9B
         fX5IhiQfbMKF0+hRa/Y9PMiKcu9GUiDqWTNtBG2hKeZj4k0YZczr8s9LgYgNXHLGi566
         aYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789900649; x=1790505449;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
        b=FBRiutFrY1+OU6YquZa5ScALcrHchJLwNTBpbzslBOstulj0tUca6V8wJH46hENngU
         rBgyl7+r2+abK04miV8QfqYtabxih2YhiQtIM19AQtXDPgwABFjzAVWp9/st96r15Z4G
         4CGXoekbSEAmefwOhM2v9ryAFQ3enujI9Ju5DcmnnnMsWsjapv9KHgR1wE1siFAsjTQc
         pJeb8vTWr2uID0edlKHbZ+3C0tVgEu5luIpvlZB/bUA9WZ+7rxGHNPnk7MBDQqvBqtb9
         srim19JCm+f3EE1jL5Ud6xCOc4HRJVmFxeHfPZ3Mxg3gGEUYq8tFUBwW+8ZV2MWEAzoX
         0dHQ==
X-Forwarded-Encrypted: i=1; AKwUvByqwi24JckV8i3TfnmVdadlioWOIrE1YNjkffjR9LxyCNM9OauUeo/Wt/wnyEooRbPbXqGfWHTR9LHE1Jc=@vger.kernel.org
X-Gm-Message-State: AFuF++m1TKgoG6+HE5UvyDkgwwvnjv7ktMeZDMP8m8sCG0TPUZdkNaNB
	w5An/H/Socg26wLpGQ0ddcYOTkWl6B1rwf0NIMwHI3EsrMLLLdyX9xQ7
X-Gm-Gg: AYBFou1lq30yMnXUTOb8TrCn3k8xpIXpg9LNI8Ojw25n8b3su3g0D9LgxANVHCG9ecb
	Ps/Z8L6hN2ww9MuZjtJMUY1dFr5YxHtCGNeF1tQpZ4JKYcDyrNtSPxWzBgzdUmcfT34btFoM/X+
	EHBkYmhmnUp/Lr2SoyDrZNoJSS1yUdZAbGpiRsmS29M5miGwVcgNYhtaUpMgC2Fxf7Dfae+5Mb7
	QryuQqDWae/G/yNHd+XFmfhmpsWePq/40yvCD+svjfVKgXM2QphzUggcRkm+c0mTtNo3x7igzwH
	jQYfwOdY+Ng0KgYZbJ5Tt+ZiBR4vhO2dyEt5g/Ae0MsBhQjZ1qjlbfNWRqa0T2fvLkZVfRi+aL0
	wxfGK6h8bAGgUgpa8ZwKroMlw1M3hul1JfgP1zATYUsxWvSZTVa+/z49/ibGRSu8aH9qUDK6VD4
	Hfq/q0mS+Hze4ywNxJMMWrepbxOt4XlW2YgTZh29pKjRhP5W627m0NtXIowpAYAkpqjZxcBDshU
	t1Z//Ben39LEW3ttcLhp0suzl3DxGQ=
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be8mr95949865e9.14.1789900648846;
        Sun, 20 Sep 2026 03:37:28 -0700 (PDT)
Received: from localhost ([176.220.200.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm102353495e9.1.2026.09.20.03.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 03:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 13:37:00 +0300
Message-Id: <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>
Cc: "Vaibhav Hiremath" <hvaibhav.linux@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Vaibhav Agarwal"
 <vaibhav.sr@gmail.com>, "Mark Greer" <mgreer@animalcreek.com>, "Viresh
 Kumar" <vireshk@kernel.org>, "Rui Miguel Silva" <rmfrfs@gmail.com>, "Bryan
 O'Donoghue" <pure.logic@nexus-software.ie>, "David Lin" <dtwlin@gmail.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
From: "Omer PALA" <palaomer100@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Omer PALA"
 <palaomer100@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260920094058.9664-1-palaomer100@gmail.com>
 <2026092039-greedily-jailer-80e5@gregkh>
In-Reply-To: <2026092039-greedily-jailer-80e5@gregkh>

Hi Greg,

I thought someone (not you) can allow this.

I want to contribute kernel but i dont know what should i do.

I wrote 3 devicetree schemas, 2 performance fixes, 2 mutex/spinlock
fixes and 1 syntax fix.

All of my work got NAK.

Can you explain me what should i do?

Best Regards,
Omer PALA
