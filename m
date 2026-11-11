Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394767;
	b=yODs7IUxy3Kpd9Ca+0A0uFZKRMU1awoF9+UVzm3UzrOVLUHE6z/IDTkLs8cvwzTEv0Tt
	 jg6JZKRsNo7YdWceP1lOhN1CIJmmXQ6lEcTNj6EOQw2Q32WCSBD04z6KbhC8Cpsg6bKac
	 O5nPIruVYh0Csyq3EuJzNXtE3P5Ekf8rzgxTjSU7vm2XzKBrFONE62IpKHwF5DdYBiSqs
	 JfZEYCAwfhTfaBlxr+eCbaIRY/7ZfHNylQuerGj+Us/So5/3vD67Cwh5JwQAFb0jlVz8w
	 g+DSLdd3mYupbAIuCPXj4VtR6+jzLiSO7zn+80leZuHNFK/agwOXlZ3TOZDMXw1ohyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=t53J8btXQ2meN9xlgmaKrTYV0JXO/Ke4lyxNxioXToauiJ0WMiPaEiLeiw1pvhSmlKbb
	 Mtmb9irBMd3zULeDpyqZpGI2ipX+nWVyt+UGyaD7XoiYjI3cQwjcYUbtdbPQ6tqYsWIBY
	 6v6v/164/W0Q+8IXhoFHimWz9nTwNL6o/s3QuhmU4enr4658OJ3QmOz9elPl1F644KkJ3
	 NQaCauzwDnlT12KqXB4VKd1KHMMvgyS7hgsdqds44DrcwxUnBnIUdRTt5ENie3q8CUbnX
	 /WV+CS0f2ABB8nZud7mUu5kbHJW7QgAj9+EUA4yyZM6DBl49q/BkV2Xxi+Jdv+S571A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzgJ50o2;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D95B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzgJ50o2
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5963899eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394766; x=1794999566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=jzgJ50o2ITwSxxgDaLwhe9bWux9JjZB0ky0fdJgTV8MPlZSI6BvT8RWM/D5Y2Cvrjw
         zTUcVE0qM8i6YiJ407eD9cbPC2rOAVeUgk2AwaMHcCSRh/Bi2twfEaG21xlovSMrSHmR
         BeqjPW3UYLWv0lWappN+SgtRs/yznVjY3y1Tbf1FF+360BGSoD+Jf8dVTKb9IuH16jeb
         srXj6/681BBaHaTA7jYQHg7SgwJYl7IqdcBWrGFq6FeSQKJqDcE0zbuS/C+DKYUw/2Kt
         ixZCSYxcTvMNrwlTeHU/OsLRoQ38o8EHJyiVhkDz3YNLgjV6ZLAursqaffEvur8+rI6n
         zLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394766; x=1794999566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Sslx2qG9MV+YeuUs+lreUkrYb1r1M6Jkqwr92dflJDQ65CFH9vz5bXc4z0FFU0WCo8
         F80XeaUhbxwVr2TsLElDVZzApjyin/IV2i0sv3WrrKkVMeJTlDN0AXaAUlV81OXK+mNO
         L7+ziPfcb2RrLvKX1LkpGqoz3aaXFZ/A0YtCn2IVbTyKjr6zeOFyozpYwIUkvoUWtHfa
         aSU6GQHh4PhX7yCfZKDWEMOJYeQ9et0XuYHvB/g6SSursuNPBqNMlphEQS2Xecuni+pR
         oezO940Oy7DA32/vFMFEoatN5btVsGuEBL+p95p3TBu+54jTqOYmfUG9ihBDOmRy7VSr
         dJ7w==
X-Gm-Message-State: APuU4Z/F5mXmvBGWSQAAAp4t0yzgPfI7/+/xYx0qwkot+r4P9PKcfafz
	PEkJpyKayklzgvqZY2pam43r1bdNrKTK9W0GHKo9FiCaZSpNZCb4w18m
X-Gm-Gg: AYBFou30pSU3/8jBcb/z6S9+/0dmgI4nMlzwprA+4g66cySfZpbAA+CHhFv52mm4OX1
	4zYYsMd0PszfwlyziNLi13UP/kjzzhyf1cyfUc05DwRPBcQoWda3JnVD96UxMqJnYfgQfenPkKK
	7mI89wa5G8iL+bp5HZkKEj967bS5Tu9rKyLZR8T/tnUs7kBvbRhpNWDgOYBEjVhS7nQfM8/J5lf
	lJ8N5NdC8qz/7b1xAhvnc+C1mnrwNNvJtBFwqEjyurJEXhKQShMAj0C/gfDCo/YH1jM+67bEv6E
	9He4IO4AfjimMTTvwLp6EZd45vfYZGwZ+0m47jSpFVykFaxZpdvUW43FCOkxp8ZYZ/n5NQ8hbXQ
	eucx62UToZZHjgBB7smasFSmQzEngNMgFff7oLYi6EAf951KyzLvBdD/zRA/8hk/bfIPt42Cgti
	58XzFuzzvVJEvv39z2nCuTBrxw8Z+cvkzk1Ce44nCk4GXDUTc43VM9y1pdN9aDXpVJTKuuWfd8t
	eiBujFiXcLGPzorm5TaGk3IO4kOyd0mbviD/jWS+2Tzy9sEROeYLZhtmaS7ylzRfWV50oGQ1ZOy
	gChlWhV/qSEIgV/Q2YhLaVms0LvePATyG2xBS8ptaauptHQSOx0=
X-Received: by 2002:a05:693c:69d5:b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-37686d34204mr3123191eec.33.1794394766119;
        Wed, 11 Nov 2026 02:59:26 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm15880508eec.7.2026.11.11.02.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:59:25 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Wed, 11 Nov 2026 10:58:58 +0000
Message-ID: <20261111105858.2619-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ld6zu4oa.wl-tiwai@suse.de>
References: <87ld6zu4oa.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
