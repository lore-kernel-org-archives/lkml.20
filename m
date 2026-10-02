Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1F36F8E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965274; cv=none; b=F9Fl90j7djXhScCJ1TRcjDPWoDg6AZ9T45CBkCDrjJz40M/vVHJY0aC+E2nEne8X6XtWzghTMhu0kTTa4HTX2KCbN7CYmr6RHuUXtBwn0c5eBsNRbUykHPglxcNNtgU5mhY5PwRgrO2a+kmfcbdC/w41cUXTdez3s3wdFXwh+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965274; c=relaxed/simple;
	bh=7f/S7CoJrGk1q7EYAcbYAyAPHACsfynPJdO3xTOSshk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CDhATucS75YQQT85shwgATmqb7Kv56TzOrisr1qLQku2BuTxX08ZmB5FfEPoN+fQq0nmIMz8XbZo+9Z0pFWWULQGa1CmMSJD7WEMeBr5hNSH/bfUEViZ23HI7C48g26/5CGiPvXJ93xKk8CPPYueK8VH+y8Y4+J/iHF3oB1ihmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JafEFYsg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JafEFYsg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a006d3fe83so833085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790965271; x=1791570071; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ujd5qi4nwlP9wXVvUg5o3lKTuuQK4FVXJHYGoARDBmU=;
        b=JafEFYsg9VYEkrOCSs4TXuikoACGuIunIwOahVbd4OMx2gR6e1gHU05/ZXqnwMgWyx
         1MVIzf6yFnlOkVlhNaRgkmwWHRDld7ykjr++gyztRmppOrB5ZQjsSTvx1lyox6ApUFH7
         IXDEMSmarJF9S8BdgqFxsWdHqJwoWEtdG4vxFlruUsLv1eGnmGOnIB507o5VvouVe0ik
         EXMhktMjWVhOwVJ2Iu7ChgBpAh7VG4TtyNz6KVHptlkdf0nkfvM5tcejd7VxQ5luHiG8
         uHAx3bzqWasrZ0AgpEVbuTY3IG5V7KemCUcCxmDNtknqcdQZxEv6Yecgwo6VrCfHnPvL
         NN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965271; x=1791570071;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ujd5qi4nwlP9wXVvUg5o3lKTuuQK4FVXJHYGoARDBmU=;
        b=d3gevH8eSxbMCbISbsOViEcazz1QudeiHwbdgLkon3vFGznvaEFI3Euz30sOR1Utno
         xrBxkJfcVRlJ2zj0TpKpAqu/sOUzQUG3iG1+MuliOffzhuOE0ADHlnPfrK9QDm7S4nuI
         3kCMkSVrjd+q2DHC/Luk5P9XzBa5bqmOG8E05nq4sGV15wP4L2Q+kHNCavNiFUJk6Grs
         5CkLoiqSaudKIVztT7a1MCjZr1wKKta0dmm4v/0isrgED6roIUHfLof+Lx0l246kpIKd
         l02fEDNXY3PfsgHdLrKSpmdTHRNtWt3B5WFL2oKTS+NNhvPDpjZ3L5qMgahlwxcZezSG
         5DBg==
X-Forwarded-Encrypted: i=1; AKwUvBzUdas/gVPfJSp7Tc8TBrAX5sVNIA11prNMfUw3PvsJd/F5AT2vaCiLarPhLLlmV9I2G7o85NMFyB9bTpo=@vger.kernel.org
X-Gm-Message-State: AFuF++mlytUtG5mK/PvTNfNL2VpUcmmUY3NqSb/Q3uOPTGLr2giUHTjs
	LhOgjRj1u0P7NMN2+J3LspHe5n2WbRwZnq4IUXmZo18XBKkgHtSMnW6Y
X-Gm-Gg: AYBFou3FHKJrZiNJmkbD3foDNQihj9+5avujtvDX7V4P0K/t3giefWw0TKZlPVuTZpg
	mj1EjJ9IkEIgSEa5GhQUldz/Em4+yAkW0bBhHlHiwJUTuvdPQ2Qog+U8UTJZ69AYTksS6+HRtR+
	M0ToTGWRcMa+7D1eOS7Bgg/Yv+4TW1VAuNN3g4pW8Amx9wfpm/jKlBc6/FGYPniAUJSJYhtX5ik
	qKFovNmABTVwKnuPKtLgqNgVNtyHaLGBwacEq95XkbMekgoJHeqSSc86cDy18PisWS0LSatLlj8
	GqhaqT3a0O3tJngPaHW34OcjCD2beEn806C7SZayvYcz2u2aupwVXOf4EnzhkxkLXJQuFD9X9il
	7enWv8GCK/3ekDVVhBXFNau1i0JkFfHfqnI9XDGqyxGFIKWniY7rCSweYD6SpImMDIoiJw2Zfwg
	YiQXRfGttLgL5mCd4d2Vxnkhfo43byK1ryET3nhi+4RvC5tdBrSPthABpuQssnZ4qkPOTu/zC6v
	GtTrF1Xen0=
X-Received: by 2002:a05:600c:4ca6:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-4a01eb24989mr74619405e9.7.1790965271047;
        Fri, 02 Oct 2026 11:21:11 -0700 (PDT)
Received: from strix.localnet ([197.250.100.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm7546193f8f.26.2026.10.02.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:21:10 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Fri, 02 Oct 2026 21:20:59 +0300
Message-ID: <ZjjQUfHaR8iccs1M_cLsRA@gmail.com>
In-Reply-To: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com> <ar_Jt4eIPy1-uq1-@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartH9UaHpHZRbKrBREmICrngA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartH9UaHpHZRbKrBREmICrngA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Date: Fri, 02 Oct 2026 21:20:59 +0300
Message-ID: <ZjjQUfHaR8iccs1M_cLsRA@gmail.com>
In-Reply-To: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com> <ar_Jt4eIPy1-uq1-@redhat.com>
MIME-Version: 1.0

Hi Brian,

Am Freitag, 2. Oktober 2026, 18:11:51 Ostafrikanische Zeit schrieb Brian 
Masney:

> The commits in the pull have the changelog in the commit message. For
> example:
> 
> https://gitlab.com/stefandoesinger/zx297520-kernel/-/commit/75e4151c9e157d84
> c8c6c365893ecf33d221bca5

Doh, right, a merge doesn't strip them like a git-am does. I'll keep that in 
mind for the next pull request.

> I went to the last series and cherry picked the relevant commits.

Thanks, that works for me. And yes, they were identical.

Cheers,
Stefan

--nextPartH9UaHpHZRbKrBREmICrngA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq/9gsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiISQQAJDoXziAeaDE07B/kRlD
TMRWOtATrwrG5lKmW7BtzBnVA5nz2up4jWpVJvyqkT07v38KHnFde0WG8OQDH1sV
/SilvR3Qd/kMoUUB9Ah1H70ka9PvTfewBn3GpOn7jOo4QPOaGgM1NI5QUuha8jpU
fzEtqAk97Doyl2ZEoGMkiMKygEnUu6IC/wUFjSf6n+apZbf+M3YA0zhvpVXRqsat
B2i+mBafNrqQNQBKzui5FZovbxChN86hnb23j8shDGTV3QGusiNB7F60Pz7rRXcY
1K7MMEjVdJj3pMyLgsmyOubtl3pFP3Gii1EioKU2FKSRTE311xXXBX2GHOEj4zUn
ja5Xb4TVYIJoolB7kEpU0B/k6KllVo5QS+3LAeV8oPZoVzzND9qZoANuS5vv+4Y9
FJ7OGYUDAN+fCxPma50hscRsAyxAmvMjjykL3pZu8aL7jhKjpzZKsBs/KBxZOCqg
lNjrVcwhq9NGMyxnxPXCsiNEbcrhZo9IjVwADpTpLmdUczHYNhp7wLkyg94HFbaY
3ertTJlEYbbYADBf9UnwvY0TBdH2H9kX/kBfu9Ko6CRngMt8jBSL0XIwMf3XHKiO
znmTjBITCE5XsqHPu0XIXey3hHQGIyC33egqIdv7yXjTZy70XHEp95xiLbE3dJ4H
4W2k/yhZQCNjiKxeiIWywcJH
=0hJV
-----END PGP SIGNATURE-----

--nextPartH9UaHpHZRbKrBREmICrngA--



