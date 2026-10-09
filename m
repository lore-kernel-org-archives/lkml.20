Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D544255F52
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512847; cv=none; b=UIhLBSF3IlLYldxo7LDSdjH6qTP7V1d+C4Dn71o8Qo+xtsxD/jZixtb0lnZ6auAyI9fmwJ+d3HnzKSiTlFsmvFHaGI4rwnXyp9/KAcLpcGkZV2KDKwzO1mwP8jlOWboxCKcRgPL9HKLvhsqf58pjdDh9NfrCr4A7Qq9yw8iEM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512847; c=relaxed/simple;
	bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IOGjLwXQVcJunRPwjFEEFhtn8f9/yNTlbLqElJdL1J/weWSg8VeIzjp7BrozVUQNB8SE0IplZzgsvu0396IODUxrkyV22h2AEb1nZ/nIyJ/y6K9qUUGJUy+jfPmnJUb3INl+1BQATw8RmMlXtDIQynP5u3HPW2WEOU/FrPAZztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0VevoXq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0VevoXq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso2621350a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791512846; x=1792117646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
        b=D0VevoXqUSlXfGT/xvScGUIUboLpPuk5Dww34Q2KwdgxEm8QnzftOItk65ew1YhqNf
         psDpcfcV42I8iSwSN4e68D+Xq9EddKLN8R9cO1SAfLi2olUD1zkuAfyaLgCQ5R1yDB4S
         6IiOMONrImuLKiKcXtDHxH9q5MDo7hZL1kLUvDPeLY7OphDl3aowNsjBv3sWcUnKzJ+k
         3dlEHdtROlbhcEJ6UYMohySoAtY/TTp0wKCBiNdsoWJ8wiYpTqI84zCoAo324rfBsXmc
         Rkb4aJcIkfUfVrsNQ3mxKFhpUEHUgp3nsoeFplMtlNLoTUArjDuriB7nMn/GU8mVFAig
         hD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791512846; x=1792117646;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwGkgzwokMzpIScEyi1ei75DHmBzq41nQT/f/BciPTA=;
        b=Dra9fkl2eZPCU4d6sFmCixUVL7LSFfLpNhANpJ7G85bA8JjlKmE0I4mBg8Zzf02Eii
         r2DQwjFsOkI2ypaMNYb8BHBwbT3SlRaGGs7ZbYBdQxr1AmsJ/3660jcsykHI6UhhWFbr
         nCI6bTIs8n42srj3EMSwo8SfLCtSMn6L7D6ojTBhaJhOihbxVpWq1eIVqst+FJOfIjkt
         RIk0DHsz8tuY3MRsoLY6RuTE8cxskyO6SZ4XjbErbrraZgDt8HF2eigkGyfAjEnDHnOK
         r2VFnIEpsMVX2f0zelCLbCIsLnHN6OAIf+arX0REB0gYsUCp3udKa6bhTadbfPneV2m6
         ctTg==
X-Forwarded-Encrypted: i=1; AKwUvBxbOiwIykQRhk6m7IKSw1Dbh+JIehr/DoJfqBrlkAGENvNtW8wsSVIzIBd/eKPi7i8b49VRXM6z510fjyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP7xL/RB8tBpaZvjyU0YbjuVa3NjzlJay2j33lYIxNLO4mrRJH
	Qk1yCqtPMZIDKGCjsCV4KtPw2balciPYuF0kha5tU8ZS788ymKbgvYw/
X-Gm-Gg: AYBFou0cTDNZQMvz2+zoDiJYrlGHSQ4vVqXixV/8/e6pPKl6b4gmgE+P8bB7BVEHUEl
	fg/koj/IspWerRNq9DMIl8+OUSxeQNbW7OYLiecE+5IS+SRTIseo/fv0FH91dPKii0mUHs2MvHB
	+A2lrMfrcRD1Xk2ncri0pTvgJr0Z3K3/xWRRFY+0PtgG6iVkbpUunC88b+FTVw2dkcPwYejvS63
	wjXPbgfIx7Tmx1pZfnxZt60oRs5M2cZ2h3I1UOlupWhkk7+PigE1kQSu+rgbde9Sy2rygywxriI
	UAWoRT4ne4lvBNubo4EZM7wrqEzVfkm0fOgI7VU49pxU2EjHlPmZtUyIwmgYgDjkr1nkpGVeNo6
	YQCRVetyGXn7wLUW8XJvrgdqlObIbdIlb/3et1N9BItCjG7B+czR+oKcz1IKAd3l7GIdQORlWrg
	QrMLSPvUqYq7C/ogGaQ6FoOmCo/uvcKiu3CrIbeYxkCH3paGAH5EdEZqbIqXwmm0troZps/9BCK
	RMMnAjNflRjOmQRb+YPbr7fsM2MqoC13or5zYvFRT25fzYPL7VRPDRljKQXHvuDP16hM74r7Tcw
	hMAhC+nTbLq1G2p1
X-Received: by 2002:a17:90b:570f:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ab3ac5e4damr522714a91.48.1791512845632;
        Thu, 08 Oct 2026 19:27:25 -0700 (PDT)
Received: from [0.0.0.0] ([2406:da1e:f76:8d20:77ec:b3e7:5372:2d36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm1491593a91.6.2026.10.08.19.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 19:27:25 -0700 (PDT)
Message-ID: <2f94adb3-3390-427a-b223-eccea470ef16@gmail.com>
Date: Fri, 9 Oct 2026 10:27:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gaoyang Wei <yhyxwgy@gmail.com>
Subject: Re: [RFC net-next 00/12] net: add the PON subsystem
To: John Crispin <john@phrozen.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Christian Marangi
 <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Gaoyang Wei <yhyxwgy@gmail.com>, Ziyou Xu <xuziyougm@gmail.com>
References: <20261008143249.3439762-1-john@phrozen.org>
In-Reply-To: <20261008143249.3439762-1-john@phrozen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

Your cover letter explicitly presents this series as following the
framework discussion I started. Yet neither Ziyou nor I was copied on
the cover letter or any of the twelve patches.

Given our participation in the original discussion and the cross-vendor
follow-up, both of us should have been copied. We find this omission
inappropriate.

I've added both of us to Cc. Please keep us copied on future revisions
and related framework discussions.

Gaoyang
