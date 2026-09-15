Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A82EEE89
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436784; cv=pass; b=TzyvQm1DrpiE8WE7CRexNa9bfeLhjXLiI+j/fHfMLWXCTwNYymQ/L92elOorZdC0y4GFiGT1Y9RTd0QOYcYG90yFm+aLOVbuTQ+ajz0g9FIvg1apKWGBAsQwmf6CeElZzCzp+0wE9ukvnZgwSM8o6WrG6L9DsCXOukOoAlt1fQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436784; c=relaxed/simple;
	bh=e6Rtsf4PevE9PvTtJeXKgCS6wQBFKBQ/vL+iN3PKGt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B47fbDr6hcd8e2+k5O8cObqBwazvOUcd1SGeeWcB/4/wLrmCVTNwGv0tsRnonL+OZ7QYFMGLoEUW8ysFBHKg9UgUjroIKzpQaRCMeYggI1FXRb2F8SBTVt4rR2MnaHIK9cV4LJ7M/WqxINtk/H3HPUw+jJjKHHfA7hxwsSPdtsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9DenRCp; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9DenRCp"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-939fa4f2b81so229191685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789436782; cv=none;
        d=google.com; s=arc-20260327;
        b=dvKmxfHB142th5J31UVY1DSQ5hUNZFVUn+JrMlOhnaycjyh400l0EXvJ0PFZGKSIQd
         WafyEg2Xor41AIvAT+LBrDHmFU23CmTUbyQVfY6m4N3fVZ1806zt6HzcqxTvSRj2k+2v
         ALXqMG9//2/vTaEqvLZXFPdDVxgyS3CzC/ITzA3j62kUU6xec05WnX0n07iUgNvEp5O6
         bCyAu1K346+vc62zqeY4JR5azB61I4MBFN9EjujuYfX7D7LvVA83hxCmhcAebMGWpgkP
         meJKyMGoyxuBBrvE1w+7F3/4/2pLkVRfW3q9rxpIEFIHDjRven5eXHZ+APOCuTVO57pD
         NH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6Rtsf4PevE9PvTtJeXKgCS6wQBFKBQ/vL+iN3PKGt8=;
        fh=uICDKwt98EV8KG3lgdfw7QxEVpQxl9hVaM+4lKlqcbQ=;
        b=cxACAtOF+KnySzY4AwD9RtRqCg0lVwjqdQxkpV3NQxlhqoZp7fcg8aeMeHB1aWVL1v
         rPEPjDiyPU9+IIGOX8Wzd5tKm6b0AxpPmDXoUFHMoWKyPllwzCvR+znlzHxQ3YfJ43yL
         RJo1nM7ajpuOfbliWFwF14Pkn7MyoU6HHG1r8C9KaK2E2+gEM+Q+kcyW+bb+ejiwMqUn
         uIWkvxAKGllabsX5DXTePWDjzPtoVwe8Pgln02llFH3NJIW02lfuS9zus97pAlDEuWhM
         IFXCwzCxokvIiGHPfc0Of7zOb+1r7stDGw6mWaEK9VNT3XALPrikUJT1kZRQdDO5c+qU
         gL9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789436782; x=1790041582; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6Rtsf4PevE9PvTtJeXKgCS6wQBFKBQ/vL+iN3PKGt8=;
        b=P9DenRCpycIhvKBEnE5Blys7N7jAk35Mx8jMdYJwjom7r06FqhU0ALOgPMPsa83Tai
         VUEKtTP/52wbmH1hLCYSPRoxWh4D7c09xFqh5YXiiH/H/trCdg3KMcjkmzno/4iwS/uV
         ozpGYFT8efZRIt0zI11lkp4GXR1/JQnrmF9s29GVEGiHNi0Dy8WaiB5XicYsuZ3rdAIN
         STjOnpGzoUYrWi7Humky5guIwcEqhdVhTvDHD6TvM3algLqdGvmXvD+NXFKujd6YmFbZ
         yn8Pu9hcvd60GgBAeAzSLCf5N4oR+8e+CA365+VkrfFQ8hS4pTgfzDzPD1MEOoKE4hm3
         7p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436782; x=1790041582;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6Rtsf4PevE9PvTtJeXKgCS6wQBFKBQ/vL+iN3PKGt8=;
        b=1nI0WKewJ+bd7zNI+rPz9a6XmGhGKEbEbRDqmVCi1tNGIMkE6lPV54R98DKjVUr8BJ
         DoMVSpaqw26XidAM9TKUFnNioi/clUsmyKvPzr+S4Nb5DqLgs5cgmGrWzQfkkVDjClYN
         Tep64Q/qusABbjls5iHgrIPYnlRSI2+3d8Zz/Tqqqe6OJVyH417ga/7yjY1lxViXshln
         lcxjFb8qRKAypJ3dkJC37gZtq0eaYml5+9MVGferVGSQZAxw2y3mC3mSs23NHNRymlwr
         mMeDwN5EL9yWJpwqKnjxwa+yxgSnBG+yyQ/VrGGgEe6L8Q8lNXtgMxuGYUdXz/+R8T+4
         wSsw==
X-Forwarded-Encrypted: i=1; AKwUvBwR3l8TGw2heWTapznsb+bGm6ENgkbsWEGGi+yzmMUGOiF132tj8Ngr/ZiNQ5umiB0t5BskIwDJ/WZ1Kmk=@vger.kernel.org
X-Gm-Message-State: AFuF++mlp8uEPH0PPLQEo8PLHwW1KdkS5Yi5WQeL69r5bHk/I9NRrSKc
	djwsS981Ckp+IphFB8FfqaySFbDeRx0jL5lMoQfAR1lda2qnTLN6YHwUwK1oOriSwmh6FJbYBvS
	ltqxwyCGW2DHKF8Yg5Nz9BXWfDwWxhX4=
X-Gm-Gg: AYBFou0pVojmEEyQUChbDDCrDXOfa5SNV6pyX2SAgCYRMp6Xkp7NtbHVPg8q7p/kG3E
	PTlP1WFvcnc3WD49PwDJ33NpkAvmp71qkn4fefXQzSIXarG0hXECMuBjUU/NY3AcI9BqVwXTbZ3
	Kac4Fh6SyBIzU/IszTxmU5qZ2ZdjP1ru+S5SDrEuHpRzp6qnPldy9WecCf9dImWSaBrAc0TPF0d
	KGBJFJSuqsL5phHmuM3XIDNkoq3T9CIvzbLLt6/+4fiP9OQWg0P2+p74LjKqvVyHisw9DcZfvF+
	9L2kmoECUd5bcCwBpvJU+iOB22SBu7wUqLPsz7mT6rSmS+nuCd8a/g5dGJWvd1kFTzE/8sdkhNK
	9r/91s+NN8EkBug==
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id
 af79cd13be357-93a299fbf2amr786358885a.38.1789436781627; Mon, 14 Sep 2026
 18:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
 <20260910192314.209ecb01@kernel.org> <CAC4WM+zvK1zFuPfS5WnzuDR3b_DRX==x_S=Gg7LSLgZb9=33Ng@mail.gmail.com>
 <20260914161206.40a049ed@kernel.org>
In-Reply-To: <20260914161206.40a049ed@kernel.org>
From: tmbates12 <tmbates12@gmail.com>
Date: Mon, 14 Sep 2026 21:46:09 -0400
X-Gm-Features: AcwNN1UKqvRlDTRMq_Mwwijf6RGioo_kqiYxUoeC2Q2xdHrrH8YWaJ_FckKKh7Q
Message-ID: <CAC4WM+yDbV90Az8g1iTY=UepiDc7a4cWoo3tOEN62VYm55u5MQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] netlink: fix ynl spec tooling robustness bugs
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2026 16:12:06 -0700 Jakub Kicinski wrote:
> Do you mean kernel side code gen for OVS? I thought we have specs for
> most of OVS already, we just don't use them for kernel code gen (since
> it's a pretty stable code base).

Sorry, I was unclear on this, I have a feeling that I misread your
earlier point,
I didn't mean to sound like I was proposing any OVS work. Neither on the
the spec nor the kernel code gen. I do agree that 4/4 doesn't have any
necessity pinned to anything in-tree with that context in mind now.

I'll be sending out the repost for 1/1 shortly, and once I flesh out the rest of
the doc keys in the yaml.

I'd assume that starting the bridge spec out as an RFC would be appropriate
while we see how much work it'll take, but I'd just like to confirm beforehand.
