Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266319;
	b=UX9vMx65KWvaBpYMVPQq3ss8PDUFCotOtSAygC/VgDhAilo2v5bAc2IDJ5CvtkqrUNLP
	 w6rWGuCFjT92GarTpY8XaL0MrDhgNffb9+uK+EUO+G1mj0EEUerhS4Ip8cQZy5JjbYB3o
	 rBmC0E8N/Prm0XG/WqsvyJAJD+fYPOyDiXTI98Ch2M+F1A2GQTZiTSRZxwGIUiORTUWgJ
	 RxtW455k8zlUejHl1/IItfG1rJV7FVn3k8fouUKRMTeG4JPkaF4CA2EbGIXftt26vhj/1
	 uQ3JjoLDBl2klJEso0ay6bt2QCPFVGqzY6rmKi2L115eWoDXvGGAeGexxN1NoQ5BQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
	b=FampOsx1UFww1QFFHDEybxzncN+cnktpAOg4Mrl8JtkBeDJ2hUZugj4JNJEviiRV8qnq
	 U5tcYKnE6jgRy/0LJKXbRcI3UYRgbECxRMyFHDZ0wCq0svXj3nthrpH2s038SDiqzQmmg
	 f0UcX9ZQq5xz58XBU11oOg4nRKvHpmEl/CFLDUbBW8WDr6xc4EJ8Gwv93lJrpyRVVFXqM
	 O4AbpPTi92nexL3K0FfumrdGdsCow4vluDmqcgAVa8DWC/IIjb0Y37/csJ8Kl4hpVl6RT
	 UvrghRRr/1c5W99RIXpgYSGc6y9guUIijin6Xlwbq0jZVHL9/lgbjKalWwW2NRPHjFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DaiG44gv;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF51606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF51606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DaiG44gv
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so2074950a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266319; x=1793871119; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
        b=DaiG44gvQFUc2NFoW9bP9eCI6vs/ecwoTSVnJ3aKD2Z63cl1rgm32mwC5Tmf5lTisY
         KMUV3KhyVb4xP4bMX8mXM/7fOIUofNF7HtjVMbiH99mTI3fXyIzP0XB3oxM6GobHpnAx
         P2NgOq70zl8swMjVGGPtfsfZn9JBJ0VjuWNRgqyRccAxD9OOUtpbKad5jzrYgir2C+mA
         AH1L0SuEwGYPcMMwlVRqUSwe9aWRFMJ9NCwWM858g9ePVVYl4w4QKJkaq624enwjpgCl
         EP1a0HyYsg031H8AgWJl2fXGeIaxx81gdqXuyeOcnH7mFfCgpKuyro9dRZZb72m0qpY0
         O5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266319; x=1793871119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZioD+xVabIFlu6EJUI2ERb6j17tqqndkB5MsEjuJE1w=;
        b=jHGhs4L7TZw2MsNAqfV5sdYf8tMn8vaUrY6DkTu00vZMtwQrLDAjSot5BCtWPm7qMP
         eCYS2HtA85cR2y5q7GQv6Bth4XqxBpVsoLucFsfF7UpyWaGnGxRp43uvY0YmdC0voyAs
         Gx3hpCWvckJflurQmR0HvAj3E17evA6NCZleTMGuuYw0kViYthJ7HNZwSo2WAQsjRMRo
         5zymf4Cwv823eyk3IBCLVnQRsPKdhZWZN3/koSl7nmtg0M0u5C1tZfJtc/bpY2ehuUUc
         TwgvEvQgwbQ3xL4k0kx2PUdR6eTYLaFCFLWA+I84wdfYXKUiBUQAln3F5uRaDgbF2Ln4
         DgeQ==
X-Forwarded-Encrypted: i=1; AKwUvByrU3tXuNwFqcq/iOX+U2RZ9N4QwGTmzYyspNAMPhea3nbqnAecBnF1vqZDWJYO6FMb/iHM/HsvPIuVhVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ42VAsyiUMVm8bE9cT6ptXLRObvDxl4kI19PUSXhOTrjYNjzN
	YDwp9t2yb2m01QqJYGrhS8S9rBj9EU5hK2qJ3zrmQmUEIfqFI7J8alO+Dx0SsAFUsz61ZngmgcC
	4cL7ETr9BE8asNg==
X-Received: from pjlm17.prod.google.com ([2002:a17:90a:7f91:b0:3a7:e2d8:4f4c])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3882:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ae58287728mr3874401a91.35.1793266318623;
 Thu, 29 Oct 2026 02:31:58 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:31:54 +0000
In-Reply-To: <atbEIOCk16-Z15Kf@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com> <atbEIOCk16-Z15Kf@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029093154.1572188-1-sgsatyam@google.com>
Subject: Re: [PATCH v5 0/6] platform/chrome: cros_ec_sensorhub: Timestamp wrap
 and drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Satyam Gupta <sgsatyam@google.com>, Scott Collyer <scollyer@google.com>, 
	Benson Leung <bleung@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 01:30:11AM +0000, Tzung-Bi Shih wrote:
> It seems the issues raised on v4 haven't been addressed.  I'll stop
> reviewing v5.

Sorry about that, I missed your review of v4 [1] when preparing v5.
v6 [2] addresses all of it:

- Fixed the MAX_M unit mismatch. Measuring the actual drift showed about
  2900 PPM between the AP and a standalone EC (MediaTek) and about 20 PPM
  for the Intel ISH, so v6 keeps a 5000 PPM limit, now converted
  correctly.
- Dropped "m = 0" and used -dx instead of abs(dx).
- Reset batch_state[].last_len when dropping a sample.

v6 also reworks "Fix AP/EC TS wrap". While testing I found that the v5
approach could still unwrap the sample and interrupt timestamps to
different overflow periods, so the sample timestamp is now derived from
the interrupt timestamp (patches 1 and 2).

[1] https://lore.kernel.org/all/as8mAFOdk7wgNqVd@google.com/
[2] https://lore.kernel.org/all/20261029092846.1567475-1-sgsatyam@google.com/

Best regards,
Satyam Gupta
