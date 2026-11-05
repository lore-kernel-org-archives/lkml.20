Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901199;
	b=waQ37+S2LAOyw1bBj/B4G67WjyuVqkKOKHgpgE5KMtxVLAo5GDW7nXGDz9OajaOX3BqF
	 l9QUZasF5QT84d/vuxeRDTTYSheZigmfYcRsvMQEhVYXq/kUYTJUBi6iHBQ/N8EvLO0fs
	 XP9E/EiZIVQg0ZZIoiXNj1Wog18AMnJjqv/ZR/DooU+f3w638XtM+7AoqAeEtCvac99Z+
	 NmK7yEGpvQfl5Y8MqhMARV3C8sag607BWxhnyJqhwvpoGhJgzrSwcmHpnIxuXSJeDPZTY
	 sr2gPc+IYvhyC12VmYw7Zjyl7ugP9t9/aWWYXJrR4w3jDo8kqPWnHPlzpomREWOQekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
	b=1zLUzyNad7GTozvsuFjnCCkNIvj/fa6H/4/W6s+EXjgAnKlrJKipIHLgJ4GmjVgKA4rK
	 1EvPP6/atz0fOzuIKYuyupVTmSQI3zUoAGaT8CC7jj9IHlJaZRLPm2jBM/Vuy947cYhrB
	 nQvsSX4DbXdZrl/cExhM0tOYepP4TkfQ2Xu00644J6XEizWZY0oXKg1RuWGmAffjyBIfo
	 d0sdVz2JyTjUhrAvtcZQZrz7TdLzl6c36I6OPgHT9UIIUNClML6+Pm5KTGz5MJLIEhrVo
	 Zp+8O0gnAUWcvyeP0Fei1HNMyHbvYcVliHNiEYUYim2Q8J/jaZf9drdTmvW/8g2hZEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0ewaDC0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D2606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320D2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0ewaDC0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23745565e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901197; x=1794505997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
        b=L0ewaDC0DdnIVizcuLN/6bUZotvexkC4yS4uKLIfK+dEjVuKgDOa6MjMssv6x8deKS
         //ogv9UNKq2j92xv7SynG5IuLzA6xrSpHTtiOtzlfQR9zV+oalxFVMoqyd1iIAIT5QDV
         8gWPwt8WdHfXCz7hznMz2j7vLVmh4KITMBo3KFJ8XRx83PcJv6mk2mr0qtlnPP7uz8rr
         mBCiZDl0z33uHoQ80VTUQMwl5zStIolPNbnAvGrC6nsCgi7Be2SoiC6L+wpTgVkndBJT
         83zvZGpAVXD/Qw9alacNL4DAvOwQNTZhrwLkzgrk6UpdOUkP7rt7FfbOurYx3wJJGuS7
         0Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901197; x=1794505997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=od5bQglY7/GGBrEmPf29Qqq2rBzZfNZGV89tObGuQzQ=;
        b=SxxSbXTdNAlWLh3TLKouvadN2pAefkpQG0t7LssQQUpmhxkSyNvymProGqMaEwTt3B
         jpgMEYnph52Uy+9u7kTblAvGoMQDSgtV+H9bm/ki2p6Gozy9HSS7yHZ4oVnB5YWyTE6Q
         MjXMhq45Fejz9NnGOwHu0LY4PL/L4ADEE0LkI5tVNS0XOUuN9m9R+N9r8ttEQgS0nur2
         ltlojT7FA0Xm/n5zSvoAbcvd/SIM3MVrA3WsbqLxvtnPDTrU2XLWy3cfRKHIftR4U/T6
         aSQpLdmHDm4KPg4DfyBgLWQiC7NRhmuPqJZwcvPu9awDW6wcD1Cxtw2vcmsJJtbBqZc4
         OAbA==
X-Forwarded-Encrypted: i=1; AKwUvBzTW+lcp5q2ysDT5kJNP3zmMkt1c/pk1xOPaXupgKpo6vJbzaXya9fNmJlUZDe0q5zfhE8iTPMfvfIhAV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82YsDUU6h55Yo56dy06X1loPDL52eYbnw1gqtL9F5qs2jaNdjM
	6QWxuKeQZcwkYcTfKON7UZG67/1uq0bp0I+7Ndf7s1uXH0Cc15WI/hF3NHmry4h1
X-Gm-Gg: AYBFou2xYVTf2kv0I0ZcbPDy2RCY+6k2tBab2xGpcN3ryvRAXc4uZ0WITI8lDEpQO0j
	QYOstOrcJPapI5r7fSrkI1tPb3R1/GHpk2Q0/0yI7cj2v/4lfdsSJ48XMzqHvpJoJr1o2xRzOrX
	Fs7N5o2Wnuv0uomWiQMOmgsRokEhq7llIps1KLOAaSSlXC+7M/0qC0niBnirQjsOcCEFsROxP7l
	OQ64/UeycYya/hKjlKOoTF5YglyUBzeWQtroOo95nZSo+57G/24Vly4dBy213YqD/bwxZMxrKeH
	Gf0kxMxjb6bhJAIz32VtsKPCFKBFMt+MbN/lhdqaj7l4rj0/JDIK7P2Md2puqZe5fr4khpYSEq9
	nQMrppfogvORVbr9U5G5euI8SRhbg/pQ5HPsQc1caJNopO3h5mqj5woRmALXtLOyJ+MF1OMPQZt
	lI/o2zsJikPF3a+6kwO/wrNZHxeTaHkep8T5gCMChL/nQYuy7zClCntBVQnilXmUUzza7HQxnIW
	elPN6GFuc11T6ezsrTjejIsY8w+kehiwyfSbPrYH/MkYwO8CjiH/cE9DHWeGdM0tWga7L095+Y0
	frOOfTgUDUdy/aMZqfG0fATds/ayprUMm1bNNynWZJF+2Xxv88Z3Go4+YF5fAWToVJMd3mmmX4l
	VgW2qx+E=
X-Received: by 2002:a05:600c:354c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4ac17d16b1fmr442399235e9.7.1793901197485;
        Thu, 05 Nov 2026 09:53:17 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200647785e9.3.2026.11.05.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:53:17 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 18:53:08 +0100
Message-ID: <20261105175309.2995-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auy_NtEpqMU-g913@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza> <20261105153735.5368-1-parri.andrea@gmail.com> <auysN9YTg8Ih8QLZ@tycho.pizza> <20261105173530.39081-1-parri.andrea@gmail.com> <auy_NtEpqMU-g913@tycho.pizza>
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

On Thu, Nov 05, 2026 at 10:42:07AM -0700, Tycho Andersen wrote:
> But what would it reply with other than EMFILE as you note or SIGKILL,
> both of which it would do inline with the ioctl?

Right, those actions can be handled inline with the ioctl.  That is why
I'm dropping the wakeup changes and helper from v2.

Thanks,
  Andrea
