Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541536;
	b=wmHhH4pK8MLin4Ugs1rUidlHn3jzf1WUROirGxNl4dbx4YUhH3LqQIPgs1pSBxGb6Iv8
	 1duNNgHc/HLpp4dhuBjsZU4/VP4QUoZ03SOB2e6uuNT+twHgnCC+Glm/JicJwcE4BcE6K
	 Kr6JB0HX393sdEL94Nh7IW9lbRfNV706TwE5rb5Z1wnXiCkeumoePDJhhuoM1I0sFO6br
	 kXLCoyi7FvEx9a2fKTfQDUEWi9rQB/30lFCsqgRa3vMqcUVU6ZvyQ6llGDCpNfAhEw22e
	 2qBnf//kLO4PcFbOtjn7NthQ8eEwzKm6wfdnX3YuQxFWYL909gColjO4sz71Sh9YCDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
	b=K6lD7IrUprJD5swE6uGZEH/t0CsCMyqfQvBvy0O9+2goXzVDNLDTmDhREikx9YqXxC/k
	 S91IKIJVrhtwbuGUmZQgmEiQZA1rEH0nMUuUbP+WBpOll/Gz19paM5tGQQNDg6aqupnBD
	 +tdseIeAbQGTLYJqqbtBvRG6eeG1l78kLDymq9TuClgwwaeihwuX2hsivQHhBClBqS6Vu
	 MtikiXDc4jSuetI5e6JRXLmyKbCBn0QkZvB67Y/a8XmLJ9Lh7ygsHZTud5HL+QsslZIHl
	 4Jwm4lpF5bS3cUs+dvcK6CUposE+vwjLXehyGTlu5yENh606CbwVEUDgiHAEheeZXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALRQwpx5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574B606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6574B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALRQwpx5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso692357eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541535; x=1795146335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
        b=ALRQwpx5p9tM+6YF3sXHZuNicR5nyD9PRChHqxHRRriNug2muZeqC8G5pM4nNWaI8l
         iRPctIMc6xo13YSHAVIrwkBINhyWjEqligELmxKO/juIafzkdHDg5UEyNzLEf4SgavTc
         agwmJ7I7y/WMDUWpJ24NadxXVeBH0xz4GuBIoJirmzzh84kk6+xVKg8PGACj4SsPogTL
         Y3CEG9TOYYjUpGT/Yo8/kOSEvJa5BDDaZysZK5PaB+FnmRdL2dbxjeFMOBy3OtIAAaZP
         ZPGHWWFKuaWiKIcFMb/RvOKnr5IQfrdk3xKIpmAX6hTOMq/XgMlT0XtiBvMHxicAQngT
         FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541535; x=1795146335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8/AvnXIrx41eK9Q4vRZzMy10e9mFZf1Imdul4D70qQ=;
        b=BZnZg9jtxtxDC0xDlHR3L34CqJGY0e52mhHOj96fylTw2Bm6v4MAhNWhPG0/yEmRFc
         NEMBsff/OFYZGOFVOal0TylIzijzj94rDF2hkjkR7FRkya/zR8Jy1TiX+OxiRHa+EfYY
         j2wTiE9gXRWhMxSiNL1+ZFuU9y4t/lkg3KBFvwuYqWWTWquMpUvmLKsBKQxUzLQpUdAR
         WPWsn3vQZAtTb6z5XuZUt4PBPBeHSq2BXooJZMiCYEHYCekUrIUWQzfpxepg/I/ZJWI+
         I9GoEfw8RjANtXuWTU0ziGk5odyUGhfHaTn+bvxfxY8lr0LVzKCTvMIzb2XZJnFPJnQr
         1ehA==
X-Forwarded-Encrypted: i=1; AL+hErF3YQL8L5Q2aTUzEsKtEgKgbL557GoXod/S51C8iX0OXxavmgunRXLWaiYOInQ89ch+t2jLwS/pbtosm8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UqroktmiedJVOh7XTCtdLIObUBirGFpmIIjNZfM4EeVOeXIej
	wDdAKdYGqc/K4ep0yx3jJio7kHGGII0otohYeUydQg5fqy5U1wCtH7gH
X-Gm-Gg: AYBFou3xdeG5YIaLoiNeszlQhPNNZJqr3+vQOWDz8mK5ws0FuNg4mfMY8XLa/l7e7hw
	+kIcjhQBwDai0I8yIgT6gZ5wDFElXa0tebxOq2xvq9mKJHbzRlXkFAL2AFesOpAk4wS1QaNkofo
	shQS9WLM2NIiHFx/GtzkXniAy2rRHviqIQfYytr5WqhMVepb/4c8VNkGfsnk0PhX+NVAzFsqTTX
	mqL9kBSybfe29FQuBukN4CclagRCl/FpCJbnV+bwO55fVZG4vCooztZ8t55PNXPGsvpKgA6u5IX
	PBto9Y53+fsDkREisGSwcpTpvbmFgipEXMbI0W5mBRwZThN3KpoOzbSPT4h7z3cliVatXAGrFN8
	iHGJZCIm8ZpJlH7V6dZ9BAVuehzSnh8eXmxepTAmVbhpbmCrFELnjsAldr5kt+4gkGJGueY1otB
	OX/onJ48+Fn5Yk4s1qt6a2T7g2AIHPr9hdVZoYAHJdJcxFQn5DPTltVsoRr0YBXxRbTYSiyNMpZ
	VmpAHAZtTUqkSEvpbBm8PLfucEUUlkC1YpD9fo9FySJWBR6DXiCVS95Y/9R6O6mVNneSTrcugEJ
	cAkaBknYWsRZ7TQ1npV2
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr1138076eec.18.1794541535230;
        Thu, 12 Nov 2026 19:45:35 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm6099607eec.8.2026.11.12.19.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:45:34 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v5 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Fri, 13 Nov 2026 09:15:08 +0530
Message-ID: <20261113034509.20282-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Luka,

Thanks! I've addressed both points in patch 2/3:
- Moved cancel_work_sync(&si->rc_work) before checking !vif.
- Cleared si->use_cfg_mask = false alongside si->mask = NULL.

I also picked up your Reviewed-by tags for patches 1/3 and 3/3, and will
send the v6 series shortly.

Thanks,
Kalpesh
