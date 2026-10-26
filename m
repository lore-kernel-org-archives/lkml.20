Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049264;
	b=zesTYCOu+UBO/x5UlpSFaME5oKDuGKrKLfY1xCCxEVNAoH2jp01Ec2REzHSF9GvCIciB
	 TYnnl2xBoZNp13ddeNlWY4oWEWQhQwgcznyL6mu7C1T5DInc0UiMDD3HXAaon/7x5bhsW
	 GfYDi0xjwTVBN6gm1WQrcbcRz89+iREjVghFALktYkoiOJnEuP7hDxgGr/hrR4gQ/2OwS
	 7C4ljhyKHG1ZitXwE5VIenWivoJUTGkNkHpCeShYtIyrgIk83VUo9LDo+mpWrKlNCf5I0
	 Nsgeqn34rVsNysZx8ZKEI2eF5GW7pY2+a0JsHxpGS7UEGQmwI6nC4uRvbRbM6P01PIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
	b=E74eJDJjDT/cqScnCRQ9ovlxZHyjNpSKBnfPAusri9NHi6u9JCYvvbWuwdjHUWz2V3M0
	 ucGojCz8s/ZZAXR8HnHGx2ZXqYs+LpQM9s5ihWRqc083RXSkw1lCM828YbbXuz+q32XI2
	 XAywDUzhzQz+ii6hGM1bZsvef8Kbh/MuRMIi0vkWN+Q9l6/D23Gh+u94Fy+dyEd5mIggh
	 5+ZaNR2t/+48GDx7BAdbUA6BFOJKr2v+jTjqf46sEWI8NspS13qc1P6D0+ogOaxsuEemK
	 j+zC4VQS9ZHPjmxWsQg+H3j+V8iiQQMPqspuLIYOgoAEJgLbiG1PO8mwJxcfhrmMW3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVfiIkOp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62189606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62189606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVfiIkOp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214af2076so25238135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049263; x=1793654063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=hVfiIkOpGt1SfHjeA3VQUL5dVR31nhk+IRqfQbHHzqdXG7uBz9fM6vmxQUyVDrA9Cx
         UgFp7MsXFYKotlf0XrjKUA3ptb6rxs/32XlAjkxGnkeRWVXy4fYuZ5216Ft/0TFt2hIN
         VsFliK0GknuYUrtBdDyR7+iSNhMQfq5PEIIoyip3JSC5+Gf8L+yjuj2K9drJJyq0frXE
         qtxZQd7qQKP2ASJaRdm/tzOvH1bnSA2TeyvvK+hqAQBadQX2Tj3FvVM6rRPSIyodYd/g
         bsKCA6M/LInulcRGuRAXB2BLX8caS78PDfsyu3mnqU8iRUn3pT1XUZGza178GRPG9MBN
         WmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049263; x=1793654063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=aiO7a/nt58WeyJeSdPbLZ46LseDxrT6rcBBZj8vGN4jXFsD5Ss6qEx0RkqqFf4oVor
         e3A4w5jVl8TWbhzMU8Qkc0Amxebn+/hxTey5oxqpK12JHj4TJBMChvnDpZqtHL9VMRXY
         S1spIMRzmO0Seqm//3GEzkLGgzzc3iG+5fUUMxduecAMaR8SBHzzrMBLCOkPYC7a8+6n
         4glJbtSgZlXf1mWUzDYZZasJmOSsOujCKYEWbqjwQYQ62FV2YtZAlMyysL+X3hZA0Fs1
         WCWfPNDVklc6UzZAQsfVulWwTcI5rEYUHiC2A1wPbu4A9/3JZKTeYKqLQqP4izJGQOgr
         5SaA==
X-Forwarded-Encrypted: i=1; AKwUvBx0Hkcvfpv7kVL8aiSqfPSXprK6zpR+uZJe8o950iDVBIDegns261oWcVBIAapo2izdZfPa5ESzMc/NXIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPDlzFpK9FB+kP66LejLomkRT+BZHrdCkdLSrSHN8BWQJqiD43
	7Qpab5fnkbJv9N1C3Bz+FdA1rStnnWJF1hwXJ2/RfO9dS6p5VHeSLlgX
X-Gm-Gg: AYBFou07DRQR3hAPVHgXSDctee6EBtNz8Gh7T4eCzPgHFPcIHboLfcw1DxTcIZTs6dE
	zLoiWFY1FixuQq+DGoVjC4FeE8inyGjz0qpeyAkL5dMk7ZZYlZxAi4BkCWmznALkjF4TQwd2KBm
	Uqf0XowdaCKv81JXxZaqI0lWWUe0mUmhjKVoqjaqBYlgJQWyCZlQejZMJWva6WbwkISGFYr0oPr
	bt0a0GZ8Ii4kkhJxuCwYS5Mg13Z/KSAskYlLB0huChZK4ygrDMiKGrIdZG/XE1XKb8VKUBUBm1V
	O3k6fsUyIE8uKcqKkQBbQf5/o17Ek8P66EXOYSYnNC6EB3We/XSxCLm86O5bKpW2VZX+4c6mT4F
	Lqyqgn/ZGl+HgJ4YFjmgKIqOri/4Rhffolra8pMfkqCObxO8T+oh8lx6EVtQ7wFdlLXpkfbUG/h
	o9ogZTqn2c1qV7ObBlSU64QumW4vdRhwiCSkDLSnjb+9BDNMWb9CEqRWSsGCQKMuW6EiKeKBePJ
	rm2e2BozBL4iio7M3TYNXenaB72IYl23LU2jdvnxtybX8lCdjamSwOgiZDPJMqx6/O4
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr133051625e9.25.1793049262694;
        Mon, 26 Oct 2026 14:14:22 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.244.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm145886715e9.2.2026.10.26.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:14:20 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming errors in nvkm_pstate_prog
Date: Mon, 26 Oct 2026 22:14:18 +0100
Message-ID: <20261026211418.351923-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
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

Hi Lyude,

Gentle ping on these two.  The v3 of the cursor series is in v7.3 now,
thanks for picking it up - but these two don't show up in mainline or in
drm-misc-next, so I suspect they got lost after your review.

Both still apply on current mainline (one line of offset).  On
drm-misc-next 2/2 needs the v3 series to be there first, since its
context comes from "drm/nouveau/clk: don't use the pstate cursor after
the loop" - so either after the next backmerge, or I can rebase and
resend, whichever is less work for you.

Thanks,
Francesco
