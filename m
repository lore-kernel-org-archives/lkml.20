Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794560995;
	b=m+kw73eLbaX8ombhYtgqCX8jS9yk9HkQmIvxdRO+gCjC/7OdMjijoOOwKyRYwEsWgRBP
	 TeXob3jhtlElRuHyVBGYclirrbgYN0gA7Wljp4H0OE/pPcDu1rJLPXw7M9pDtpe8wUnVg
	 8rWNyN5EuWcTbQoxWg6BsPw2LwGa2FPViSJPkyiKpn1rwRY+vyDzGZMWMDOwvoGVO2VWA
	 1R7/X2GsmO6UNtSHlg3DV+24Iq719bFUkONXOkJ2fIt54wjXnPgW816MCfHwhIuadlj9P
	 S9qeCgl0ukblUKmhs0TcpT+MaVhv656m4jXpd6V3c8/FjSn58zbGUy3JcAYb0f4bNoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
	b=sj/KOWknojHJNGdTHwFqrR+mB9dFMDw3ga8Lj+c8PrFonAAkB4AU9c3VdzPCFPf+0Bzh
	 XYs3P+xqGB/yobWM/6c9juU9LydaKVS09sNlqZ449F5zLTes4Ptqkf2Y2wAoX5OZqzYr+
	 /foF8UnxSPud2YQKEsnW/5cmFdQM+HcVcxtkdTTs2lwwS0BUoO+xj8uXVjXVOwtoIbT+u
	 4WYM5NjfHzXahu4ZgFsQsBgDxpGs8xAU9RngPrgRoboopXmTT4EWKvTKuaS5B0lLbUWDY
	 WW9HLyJ0sMyIrHU0S84DBSIcJdaWxwXnkY1Ofy15G8VzQEYO6UfFIoVJjTuO1jg3cBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=cVF2s76c;
	arc=fail smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0512606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0512606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=cVF2s76c
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-451a49abd8aso1196044fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560993; cv=none;
        d=google.com; s=arc-20260327;
        b=fqNP0TcfGWqCXCFSOW+/u/VsmDz7iN9A22r4M6CCvt3Rdw6YXUH536xhBHbRZcmvIU
         aiktVb4zH5+umW4TfWjuW/CyOK+jcO+ajONMSIOndptraIufQ9SJaOL+a9HsJIZ470JX
         xLXdBZPjZ/Ss1SCrvvi4mrGizD/KVoc0x6OMz9UYv/SYpHRxVLwsFPGU86RVNzFH+S8I
         Nj3kMeYiSLxq3MeF301H2R4AXa38S01F0JamuBT5V4wAjP/PJwrDz/xH2dTasN84INP/
         n0rVliqw1vvU8V/XV7X0nxEzg4otTjeE9HbvXgsgP0IWMvtnEsM4aneWqt02EAukWsrW
         5zJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        fh=k3peNdcqWuj/TzNZUEOLKcJVhHV3guuZZMVoqgKhlno=;
        b=o9xxkTeQ+ZX43BTTYmnAa3u10IhLah4KFT/kuFugW85rVs1yhf2dPMw4Wg7VBLUIQZ
         HZyC9YKgwYbGR34nuBtswiw4TDxDLLvBmuLv+IR5iXPhQ8BKW5DSQbNq1xqbB/tmd6KV
         oy8CCDXZmTJ5aEE+alUficU1Yh4P3NSFmGdQb7OItygK871Z2crFfOJF3RVon6srgT1j
         agQ/NV0DM5TZHkv8a14sBteF2E5qzbhgHV7fVOtvkonK9UccJiIpgJLmqNx4KUw2cQZ1
         Lvr7T1VXbWWcXZB2ufyar5eijiGGjvl7KBD+XcvBymcL92krNjI5Dd9XVvE6gi5Oy/oV
         28uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1794560993; x=1795165793; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        b=cVF2s76crrUEBSBW36t5JDEzTv4J7cNTCDmf+lJz7rwwx6KqLEpuy73WkOOYTKprwL
         yqKWkmIv4Kl7sLZFr8Yds98KHN4fZwFGhK8sFRSJ1S455RdEsUYCuGVMDkqFDjVaEsvS
         wCO5BrPQr4RwKdUm2+HSF1rsKJHm2mMV3CWFpmU9gtMpsTS1Z5PCRx8kvfvxZENN3/3X
         +sWEFmk6kdzZeQSm2hzNJet/YI4aB3FL93uHee3qfThMFp+f1vfx4xOwk9BeR28Jm7Bx
         2fHT5JxtJthzpRgDW0upHqz8gcyDOba1Y9X2fySWkzASsU9nZirNvgZ8E0ZOIEU37DQc
         u8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560993; x=1795165793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guR2kn0I9WVyI0WwVW8m8P4IC07cc5z6OUtXdezJXW0=;
        b=yMVfR8o884lxZpuj7RzKa1MkPgppQHVikyy3fOmO4q1W10yq6S9oHFEefU6a/0P3tz
         GrL7LaYAC8ZjPqk5/uawT9DMD0K3SpqpRtY7MEDPgTZ+mj9MmbIpDqZqAUzlkNbAohtt
         5ZDdWxBCTWtQ5hl+emj5CCn985EPVX992RC3qCdYOefoyJxPsDRWQ5E8QaPY2hIo4PKb
         JCoZURd36Roabh9HYubKQa3tEEUECwhSH0MBeQgZZsSJQ6ChA+RBqvLd0WQvlCEF5+34
         iKL/6KzzSl7OzhKb+xYhkM5giaSYJyQL1TSJYsRGIwEcXNbjNVZ2yiker1P0HaBFGJQ0
         tVCA==
X-Forwarded-Encrypted: i=1; AL+hErEGlUavJKf6ipUukgEUZmDlJ02N3NfKUh/5koexXCiR43TWhdMk4FAf1hObDSLhLGVHOxoTNGnf1oki7sA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91WBK6kEWqUr4o3NxHaxtEsgq2wWD8jicUFJLhA6LLaOFPK0Tq
	lr2q/6QcbCfd8AC8s1dPw6Wxpd0nS+sGUYOt6LFoTGyCbxFr8rK5TYsIXmeS3e0eumxfyO5XH5z
	Weusu7os7PINWajzgm4C4wz3lGH2/+qq1iXp9ZktUrg==
X-Gm-Gg: AYBFou1ivlHN4nepmszTVYQ4K5PdqRr7pBmD1pDqoZBlbLn+Juf3BsUK5A1zPtDgNmg
	ErO7WyJIEG+I3cfd1Uq81qxmBgTHeqbV7M1opM34k4L7zMRxNU3nEGwP3gQli12kaxGymtfzNJo
	+f/s7BE7DvO3WCutXxO8n15A8DALKKR5barixlbHEegahnL7GqYF9/3Wua0x/VOOebjbLnmt00p
	Sz/mqqxOol9B9NFUzY8Z+7eo7tqP23owqlvsKXtkAMp/mBqUG8ELXjWWsHaqFv+mRkSGuce51LI
	PQt1ZKo0KzsAVw5JaNxJNJJLVykWN6oI4Q/10trSXjTSUozLWN+YLUU3IXyB7sGATvCAzXZ5P/y
	YEKd9fyjhWjJUfzn/Ba9bSlDMa0dK/XexjY4ytVZWYpi7IPu5/b0ayV4EsDHW2kL+NlhJLwitXa
	zhD8cnVbxBlrLLs7wCXr4ZTUqZJl3pvPUp7JKpsozjRCj8TW6ecEnNXgL/MqtEe+MB092z838F6
	A==
X-Received: by 2002:a05:6870:e135:b0:43b:b245:30ac with SMTP id
 586e51a60fabf-4afdf492b47mr2095487fac.16.1794560993407; Fri, 13 Nov 2026
 01:09:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com> <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
In-Reply-To: <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Fri, 13 Nov 2026 09:09:41 +0000
X-Gm-Features: AclHuK8gjoF7QTD6gz3W2dlc8aBwAvH7LfNyoPplzwlNGb-GET7hpsX60d1d4kI
Message-ID: <CAKV3HMOnY9LXvtFjnNKzfhVwxf7v-ZqDrRfceyLeVLP82x=bnQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

This is a gentle reminder; it has been 10 days since my last reply
without feedback. Do you have any thoughts on it?
Kind regards
