Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65D375F9C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166338; cv=none; b=je/+lDcLW9oG3R2THWgaoRk2mNxUvm3+2ETYvYHRS0xQcunVS7lApK+JT3GEOh6NjKhhn78RyrWWcx9aqyliTsqDMk7SP6D0Fn7FPK7XXurj4RdaoZzpVvVd0970EDb7nJoVvIeHuMJZhmmwVE7EAO9MSPNKosOmeDSZFKO0wqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166338; c=relaxed/simple;
	bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=ZqnF6kBZ8bPP9fOpyYBrTTwL5dGIqTMP8iqnno6OLLUxL8uiHpBaCvn8dNDugOw6oUP8OjWQdwg12G9hT2VgcLzHdYl/8fLRhtB/9tyxpLyLOeAMy4I5HM4AHbnA/WYxFP/TtLTSbeRk+fhV4usZZJgNlp7nk5H5SO8URCBX82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHy0g03g; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHy0g03g"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4877837890fso77638fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166336; x=1792771136; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
        b=OHy0g03gx7siMgxrgc8b8AZ8HWAQQp4scuBLSHuhEvaMZMG69vQ5moJfM/ruNxmd9E
         4tWCQhYQljs1N5bsjxAf1zITMRKID/jhaIV6mWx0nQ/Jy+iI4+Lg8ryDMJrigLXWI2Np
         1YZwDIVUlK5ILajo9jSUvTODOCiHc862qkOav6iQNtGCUPV8t5fM/7cdp9q95UYOMoHX
         NIZQoDEwf7jmtzaLYbQTngm5M62GeIFUtMNH8M+raAkDZoKB96Tb0D6XcL77lF4T6pAK
         TIxT8XzU3XIUX3gdNmv1xB2HjSZwIaAAvl23Mg1F7fm7B+vzagjIqgt5WVgC5i7JqlnI
         heFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166336; x=1792771136;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
        b=TfSkYCR7dUt7eiAQ70+m++m0gKEa6h59b3b0mRCGpvtEaY/5bCUz9K1PwMPQX2oO3E
         Zy0D9XlJhnZSWzzy+DPU6zeF4NyguNvSsDHrNAaZBi/cEU8zAjAEhE9hlcUcIVVbE9Bn
         ttX2pQ/reCeBiwA5KzQsCXvb5s2J0uuFuininI5oZfQkytEDH/DlZ7HYOc7heMDKVvPz
         CIAitDyLsR0BiswV/v5EScZRxzBK8Rc6OQaGsQiGm9OZ0bOEKqZUPsJ16E6cCRRJZvNA
         gbnFOxMs/M8xeecCp9uA++gigVjkYmRK9873dyQI3yACTtvOJ7SXhc6MH7ffeOq4XCrd
         OaIA==
X-Forwarded-Encrypted: i=1; AKwUvBz7Tj5K85ul0tYTgBkihJo5QxkvdRK8sjgXyeGDze08oSMB4g68IF7zUCkjMY5UriaLb0yhHhKSngfxj2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7s+B8u2oKvSODpwRCWgtXMLNNMo+D8yar4sjuPY8PLfz77+Y+
	Wfblo9A2QVI6KajNT6N7EPHJOvp9JGbovl7kiIfZH/AGukTCXHlGq2QK
X-Gm-Gg: AYBFou3b4BpOsI1UXQ6Ruhju+ndvCKi6x6ZIl6S+3sQV9IKiIuHC6GceLmo6NJjPSIF
	sC74unJzFZEO6MrtEreGLoAbHeQJgPhyhsEYLJAVzy2pp+ZhOoR/qMSiHANRHr/E5BpDyBgqMqK
	cWdtrYCWYWS6r8uF8hKRTzKMCM9qwbY9Isz3US33QVXWtoLQZRgMWXoxAYi2/wBtf7V3MlocbDk
	5oJHA1QmS3UxseeQYaxrLp/ld6ncktweMKbyGHMQQL5MojkKhzjHeik/tRCivUyTJIe2PEG6wT3
	sPiBbw748Y7CbxsNWaUvVgno0lYbUY3MKaD5aQYFFjIIBjGyRb0rHGSWS1BiU1C/M5btn73HDtA
	zo93u6mt45u5L6pZy96XC0MWiHOMGEl4XNgn2aPJLvQFNLOb1O7Rym7BEEKpFnjua4mQU9tb/qh
	crM7pCdliYGKaD5GVqH5toa/JBs8yVzGFzSyAVNqcsSd9UrIq2wOFYc86+rElxHQsz3fPFquCW9
	bSM5Md2WPb3Hrn9AnM1fftR9Og3L7GrzaX7fGM9eAk+xglFoiKSzDsd6OxwHzLu0s5bBk2s4+1f
	Fs4=
X-Received: by 2002:a05:6871:c91c:b0:49e:5d89:be9a with SMTP id 586e51a60fabf-4a757a9a88dmr355079fac.58.1792166335764;
        Fri, 16 Oct 2026 08:58:55 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73adff016sm2102314fac.0.2026.10.16.08.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:58:55 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:58:53 +0000
Message-Id: <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mark Brown" <broonie@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Leon Romanovsky" <leon@kernel.org>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>, <workflows@vger.kernel.org>,
 <ksummit@lists.linux.dev>
In-Reply-To: <20261012213452.1863248-5-sashal@kernel.org>
References: <20261012213452.1863248-1-sashal@kernel.org> <20261012213452.1863248-5-sashal@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 05:34 PM Sasha Levin <sashal@kernel.org> wrote:
> +Each confirmed site is a separate bug. It needs its own fix, and its own Fixes
> +tag and stable decision, as described in agents/skills/find-fixes/guide.rst
> +and agents/skills/stable-tag/guide.rst. Sites in different drivers or
> +subsystems usually get separate patches, possibly in one series.

I don't think it's a right message to send to agents and humans.
When the same mistake is made in N places the interface is the problem.
It should be fixed in one common place.
This text tells the agent to produce N spot fixes for N maintainers.
We already see this issue on bpf list, let's not amplify wrong behavior.
