Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808706;
	b=tgGq+P7WvEPBJYQYcV/rLDEqi9c+kCQMwxmvW5hPzeJt3SeNuxtCTV7SOLC2Ag7b7qJM
	 KwaCDLnoPr7hJFKYJzUTL+iK9JAxHYTx1QS6rDHE8UbR+gPCBaJR2qBNuyb801/s2ocyS
	 AGfYPyScHeQDe4PC+5IPZuxjK2qmcBjAL3JM3pjf0X06YL0N/XIUYscxc82r4G03Y6a2G
	 y4aQ9MxKmkIj8WVWTH9jObYIXHdUCnt4/JQ+po+il4Mn4N0rW+p/HnoNocRpXyokDQ0MB
	 xEMTFRjGg87XZbqO+ZFezMF6o6TbxvzIc0Ssra02MzcLQg0cq6LhW4rmtZh3N5eYNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=xQ1aiZyvV/glM5Kq6CQPwYObZ5fEkL2UfWZobcfq1ic7epD6yNhRWEU4sLg2WmBrt9Sf
	 JfdjdONPfCR12NFLv/WCUQHXju1xc3SrucYmrNGv80M1ZW0WCsEuPJaWCdiLj/BhZ1CkB
	 vkFJufdthq3aKgGmKPZj08ftHO/u/t5IT38D4j/U5wLmht5rKvXTB/7rjwRw22kjD//hz
	 ZODJ260zbzevGd49KpKzsLvzx+O7STVVk/46giTYGbDyxITpoidxCSylHhK6HFY6XesTu
	 nCzV2XDAHwgJ/5UTd0VmhSzcBJGAsxZuvc6r7Lx8slcoTQCRfwM9aB4H+t6Mjhmy1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntzD+cB5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14109606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14109606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntzD+cB5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1904772eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793808705; x=1794413505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=ntzD+cB5Ax2MdxkWFXtV9/ynYpM1go0Q8dmGJ36rNdgsikHoKKCssFKb4nzZZunaIY
         7RQLa8VQZKSep74Fxcdb94IpfcN+s3p0rivVkV6TkRfGd9m7l6UYhHCZYmp3V+ps0uYP
         fM50paLflEs8K/j9YkEgUEPeYko8RhjC7ss2O+4jZr5DFwbZQp7D0fBI1dzNR/BkXYj2
         ZP75iTaLx78dR04EiJX6hl16bZshM+rpXr/LOv6dV+K1iquoOXaTOiv4OfukckiZkSXs
         hkh6QtAIYzS5DVcIIkQK3mPGQVEoOtexGgQUI0MDHZD8lpY4d70NcCSMV9R9JvQrQjgY
         Wvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808705; x=1794413505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=gDCqF+ZO0Jng3ibej5/e5sAHUjqTPcUv+oInNB5iL0dJP8wvcp3ebqQEAWp5+X14cC
         NhmiQWTZmMgXGss2CMk/JHba4hHmBCBs3SUECEAbbezSU8rj2F6PSLmliYO6C0zCp9Zq
         uAYQGFjWaoUQSdhbgtSGvLuebYDnE+uh9LyfmK8zRbFBy/ISj1t3pIkALDbJh2D4XPd8
         4brHn93nMRoYB2XDlGiMcOfDwOkq7gimc7HnUUgEaCA8kiTXqP+p4BFiKi9orl3f6ABa
         hBH9RTeAtoX0pfHPECuXIdBJgGRD6F6YjCmV4jtwSr1WV72Ax7FX3AHfUThApGeRIoBZ
         hi3A==
X-Forwarded-Encrypted: i=1; AKwUvBxtq3x2aPLMFO1HYpsylkBupC6FtkKSzKNQatgVCSG7zKm125dmp9CjfNDcNO34LoPEPvSI7u+LH7nAnI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SENTWoT85SjrjfLlEtv0Y8X8rINvnwAg7VzkVy4iP9QnVia5/
	ADIPuO5muBy1Xt1s5Gh7wRmgwB84zoW0OzWdHR0fPec/PX1rf1oOolQ6
X-Gm-Gg: AYBFou1QjUreh+t7R8OLSbqBGdeV4aO5HhgiRsb8u/gigjN/0/r6h3DbjpLOBzuHbuh
	n0jRm3+AsjLuQcTQj2sZhW8Hp8DTLZQTNyZJHT8tgtY6b1yXIRrS2yHXe43M4ou7FKaWSyQgE4O
	MZyjam09FeN7t7YywNtIlzB+zylAmfYYrlKXd+T9P4xnFwXs2WjG4HERD8IV9bRnJXQTXv0yuLP
	Yl952Jj60mkFQWvO6t1UTF0RnIFzAyEXKsyhIm0KE03xu9vCSZp1Ezq2kLhHnU9ErlOjgF2G4S0
	VlI7/3k9fTWskpbsRH+iWyq8NTI8AIdQc2Gqbt4OrPEsmVjjAl81rvPU0ws1DHOXUfQz0exp5gh
	wKU/GqJZcgJkxhEy2a2MEM/sXQkXdZFHRvJe+IK408P/9uTFAUEkrvEuasVmCI1fswCR3Dvv3+/
	ODadxf/YPYAF7byXJrO6zQDesUrT7uPcg3FGeNL2jWfImI+CjbJSckLhic5yC2u2MsDLI234z3w
	wkYMR5LBYgEJZhCKcNLi3Ff1XipvV+liB0/tVZOPzj4AJMha3fMBPnhrRvbgu7S1XzAyz0/5yUs
	B1reHZLBN6vqQtrMKllbzFcYTsFAvJUp+Od0Cq1u4PCM+BB9v8Y=
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr29590490eec.27.1793808704617;
        Wed, 04 Nov 2026 08:11:44 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm10250426eec.7.2026.11.04.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:11:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cassiogabrielcontato@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mstrozek@opensource.cirrus.com,
	perex@perex.cz,
	phucduc.bui@gmail.com,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: control: Clear user-provided numid before adding a control
Date: Wed,  4 Nov 2026 16:11:03 +0000
Message-ID: <20261104161103.3674-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87v76evueh.wl-tiwai@suse.de>
References: <87v76evueh.wl-tiwai@suse.de>
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
