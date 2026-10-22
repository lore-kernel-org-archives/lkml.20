Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792656964;
	b=KZy/Q9BK70Hvh3M8udZwKdNdJAbrLHWMzEZLaCVL6DoqAakfWStImn4IZLt45pkuPJ30
	 pgqGIRYCw5SbuiIKxgbPEwHPpQdIQHnIHgwej1KBRW2YUtt+CPCDGtknz5czY35FvBrw3
	 s0xn3kSrBxvEvmkP3LJLnqvZX7MqbQdU4EkFmlMnPsDbOu3dHLV4I7sWnaESL7AybBnYA
	 k5ssJK0Q8pL4CSx+6PSbk4u7oCAIlsGI2UqyHhVKw7brd6YeEVT9egHuyMqcJjAIi94O8
	 jTMa/K/tvwblXdMf8PPXT7pQ4q2F6tiJ2BNynx3tqh3uuVHJYbrjxB7fWRdlpt70hig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
	b=X3BNgPzRcC6KNUrzD3TPa+cfQRdUYA6hkU4RlrANyw6fqzxYS9omRLj60NF90i1H56YH
	 JOjzC4gN3Cbeypn5CMH+YFGzXWoywzcZfuxwB4Fg5t5Ef4tBJKLcmVat+GEN/od7duzN7
	 9RfZ67U+w/wcF3SMD1JvKcpHKs2PER6BFIPpoJM+WedNdYeTpaAbEvRz1L+KlBo3ZOG4X
	 AiiZ3k1J/OHZMzoZezt0myu8vb5KAWHjV1+smNCaxMVSlnAEkEmUHLnt9hn0oM9/193wt
	 /Ny39w5b5qc9gCXcBJsQZJQhTVGroZUh11PlT81quf8KFsUKBnIlTToHpiOiFGF4Txg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpj53jGl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B246606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpj53jGl
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9196d8543cbso13934426d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792656963; cv=none;
        d=google.com; s=arc-20260327;
        b=O72c2N5X8Y40HvTad/+aB+nkcpHsIUykUflTEOBtV3KNWe6Pm0RSQRt37AezmM7Kxn
         bepY7JBT4ZmxhP9cRDdG5n9V49NHznbqaGrZkMutnHLzp4yihA6Q+JZo4N4iX6cfzMSm
         pxwmb3YaKKPc3+FFeFjHCDx92IlM2eN0GXtrvndI2SZNG+ALDRkmiVnbTVyhfwzTWGjo
         Fh8Tv3Mjm6WOalhNF576sUnm4WYltJQdKrCVgGL4Bz3jbOVDXTyxiH6LCyGBUiqgulDn
         VON29RccmRh8w09mr+mjJmyQ1omkUjekXfy7Eoh4cv12GU02qwBLMjQLHqXZUNx7Vpmv
         02yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        fh=FRkSXtOnlVbx8ffXcssB3u79Kdj/QE5DUF/LTo+jGKg=;
        b=TxzRP6dmiBf6deSsqFfZSFu6NKb5O2dYxp6/ygDwj7EQyA1K6/7GfECLx3HDD3xPUD
         PAlmYmottJ3f875DTSAOr3tut0o3qCnS/H84vABWww1BEqlTXnYRRHXifa0F3qulTjoq
         Qg68v/iG1WYiWlRuwCxm08kEnLDitqpdVpOEqFcryf80M26BnGYeWL7Ah7tUnsBpIQha
         LK4SbNZ1kTiQaNgberPU1CJ5PYGSKXulmwcJOIrhSPSCciNEXPyiXxBrb0Y9n/3PadyL
         j6m4PtVSLe6TUu9Yzxa3op4Q/g5zskd0BvKMlPH504xxEMsYbu5FBtkZ6zbeYdGJ7Uy3
         lBoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656963; x=1793261763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        b=mpj53jGlB4JLop4p8vC+NfLevU7DyekIe6PQ2ouAeX1vi/tiv8ONerDHBIh7ihOJjs
         cgG5mD/xHAPBK3GHqW9KMUI26IwPqyLZ/QOExaiwV3aCdbqQzd0P4glEMgWxQWOsQAt8
         zlxrh6Eo0/kePEz91UswcJ2oirZpciTOGtgkdzM8BNQxr5i+O6660+1sDoegtJVAfZKS
         usZFq2+fhDXpfhu3PgVgb4Z8y3IN1YtjkvThXRIr5FLLnETHVnuClTn6sJHyuuVgWY0D
         3R5KurpJjZBysA4iCVd1OXHxZ84rztSoLXbD6aGTzcBDhlWl/uWnPBPQL+cj2eVZ4Yvb
         pYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656963; x=1793261763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJBOjlmu+tury2E+zoV82SCM4AoLHSymcLyi7zzP7i0=;
        b=ijs+/u/rASoSwAvY1wSWzhk20UAwl814Lc09U6Pol73B1Yn3vtGYbEBHysUD022iZ2
         yOQiJi4i5ujAxw9dgR9WgkrgK45ID4AkhhIabwLmamVvl+8F3Q3ov6w7oZ48H0Vf4aB8
         MGCMWDlHyfblNrPWsPf0loHvpiEZWUwd55HbvEy6w4qJwclY/SbBPKQyHTBkJkA9rg5n
         fuYqfCZfInawJt29ekfLaFCzWk4hZUe7s8/qt5rmIZueMOVEGaJdD50xpvlGRdczysiD
         yiHupyGtfT1rcFKx1cZ+1tWgoTSvzJmOiLQcToE0WYB7svY+JcWbugUyNu93scVKBMx9
         Y+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ58Wu4f5hECRkTy9A4wYSFG43HbUPoTdHrsS7b5ffaIhJABCfmmGbFtHOdRcLItxXfePnEwRQfK6WIVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJUU+KldAZYPMUqtChzCX27Ov6GMI8+Ic3uQKYB2jZDV0bZkYh
	ZakkxSsB3A2/7XcasNUDrCTCVouFodT4zvt+XANxJhNRNdq2mgEuPX5Msfbx4hB2z+KcRv1aWIs
	DrZ7QJQXLNFGu7fSTC801sY3n+8Mbx1w=
X-Gm-Gg: AYBFou3E4GkPh180pMEton4bwnnwAZltcDeq9DdyoNhJA6Wtl3J+SJZA745JkkuEh4f
	nGRtcqNUHvnUGQ2w5WLupV5XsW0ao4TQsa+u1XWeKFef0GwXmyCgrCbxKwuA4szA9iY31P71tbw
	K0GSRfz1xdCTNU8RD68lXLCfK88g9w9E3/kZ/Rn75FDGlCs/NODQwmiQrhyCjAN/01hxWb3ChzF
	J73V2l3K4K3W8SQy7fghdLErsl577Oyqv7lOQGx4hdHTkPAkG9obuSUxfy64NRcF8/7hW7VJdol
	buafDfx+o7ILQYIl+5CGz6iTFLE9viilYDB57r06FkYFNinzbMAdlHah7JL/CKGs51Iudw7/J2/
	Ml4sEQNseK0YJBX2Q9p/wplu75mdq0RLuGxKZrww=
X-Received: by 2002:a05:6214:2467:b0:914:39cd:e64d with SMTP id
 6a1803df08f44-91c12f01f73mr80371596d6.44.1792656963214; Thu, 22 Oct 2026
 01:16:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007111611.2086-1-syauqicode@gmail.com> <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
In-Reply-To: <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
From: Daniel Syauqi <syauqicode@gmail.com>
Date: Thu, 22 Oct 2026 16:15:52 +0800
X-Gm-Features: AclHuK8Xvppmmud5vsCpQH6FzcXGJZj7S_qHU_EuZI97lJN0nJatEhkLBniCEjU
Message-ID: <CAL4Huyhx6mmoFaYjKNCY6D9Su_WCRHneiJfu3u18Nukstk6H0g@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the separate message earlier, I missed the lists on my
follow-up. Thank you for the review and Acked-by. Is anything else
needed from me for this patch to be picked up?

Thanks,
Daniel
