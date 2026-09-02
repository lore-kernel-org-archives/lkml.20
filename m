Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58A47CC69
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350018; cv=none; b=ugE1+zR4kSvDdXv9xfF9/2IAJL6EDh4egwYkIlVtmCX5EPyX1CRoASLHQOTTwFj9JxbeleZ1g6Q73ZLrzmloKaG38sr57OvEFdjUsPza0iVvLU5JcA1hg++K+6/PAcmlJMfA8OBGXOGz7LHFK2O09RrUDRuxocRVmu72BZXi+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350018; c=relaxed/simple;
	bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWDtlGbQ1xWIRXaanO+2+YNbBeHEV1LM2sONX7YLyN1qinH3hJNTEO6w3IJUJuWH3WJBUNMGvACpg4xTeZpydm6S7xVQ/relLV35dZDm2ZgB0rqfnUZRneA0F50fzf5rPCgPUZxXAdy07f2U3Us9a5+f4hDLvCr7Bhhw5APAtIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bns+FcVl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bns+FcVl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01663d816so7812555ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349999; x=1788954799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
        b=Bns+FcVl4cBip5L8Ge7Ze2kHDKakek3TNswqeS7JuFoBSX1rkWVDXVv4qz7SzgTfpN
         iW4+12PLYkACGhxO87QyRQ/D/hxqMX/6U2MEsPeaC27H5kkhQjbu6nKeyLORyrDqt9ND
         ci9PEC5Ko7iL2kC5UDIm5fIqYIPUDWUE7Q22VNRHF+4y+j8oTBqIIpJZDLFj9y61j7NU
         99TTcUS3ypk4chghOSCm/Rj4W5LN85hkMbhAPM8lqlPSo0QH6AZy39huyzNh6IavPjN6
         /fcygmcmcRPF5QcOTw1Y2drwXsVvtv8t9sIWD9jsIVlxpv1w9ldyqwEFgaOFDu9hbTX8
         n1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349999; x=1788954799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
        b=sg+r24qpKGRJykB3Zd/4Bic+FLMkYNhTXNHjuwAsRZEz7CuPIZBJe6neDeEgcIf+do
         XHpqwlsgveimgrrJD0tHfdx8YXj7iQsRhNmWTb3yDnshbpBQBof6Ut9DFb5fvwt3N7mw
         M2jHZAzmZGA9SABBOEciDLIRnOYiFSc4xldD2Tofg/T87eeoextY0+aDeU7pwGv4ka+o
         pbWw8fQk55T28t4QQpzasy4x3FyFTgHrxP4EGAeJkQV5j1XgTrc7hB/xXpOjn1YO6qGc
         E2aDVOT4gpl0iaeCG9HXmHz+46xd3iAEKPGJiBIxjLwfb/ATZB0R59cXq4eUrtpXMrNW
         t5Tg==
X-Forwarded-Encrypted: i=1; AKwUvByN9rKwyqk1QpOBWbep99pua0EZ9+ReusibaWzWKLKfE3MP1Dh79spM0pUb93+LtvDCQtojh5e4qwERVSc=@vger.kernel.org
X-Gm-Message-State: AFuF++mWJpt+t4Cn3pL9Z50dGAALylLtqQCFPIOm/2RyXsIxsiEHB1xM
	6szSCS3A+eG69EqXCG+8Eriys1I7V/MFMiIXI5MY+Pqi+SHHS7IDNEvq
X-Gm-Gg: AYBFou3qY67CQpDTS3cLTqXDk0ATPJDt93vNAALMM/vHwlQjRHYM4eaIQ8tGY+/EZoZ
	tVv5yLLRgKnhzOMMNVDriZiP6YJ+14/jkoMbR1IpUnCl7dBTYxH4/zCgsDOj+tqSa6lqIJdgGlK
	8nLQIhHqkCj/kh/WgpgrD5cmYOxElG6PEHE1ff8zkQ2FV9AAArGpPYNA4oiS6cBYMUr2XOuKF9K
	taJ49BzLNAYRklMVb2V37bsx4aPh6oN42721MoZY7/cdTgJjqmi+7FnA9krUHG28gaF+cgbjIdf
	xWUDCp0car4hsvIDWaGg9ejQmIYGj5Wbw07Ey7TLpw/EQR8U+rOsYoJkhwgq23IO3vBEFBOBbOs
	qaEl+0TeQWidK/NZUXndVVFRIo1hwfOM/XkgMmiiMM4CrcaGmAJy1PAr1uj/GF1DDVAoawkXsSc
	ps39HJQgurS+DYuzhbQC1sOr4cAwb0hXFbSAE3hY0VarfxUMljib2uYU0nAldCWf1GCXEkrQujH
	w4=
X-Received: by 2002:a17:90b:17cf:b0:398:d286:344d with SMTP id 98e67ed59e1d1-39aee178e92mr6171529a91.22.1788349999114;
        Wed, 02 Sep 2026 04:53:19 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9ec9a3sm8352811c88.3.2026.09.02.04.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:53:18 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: kuniyu@google.com
Cc: hangbin.liu@linux.dev,
	liuhangbin@kylinos.cn,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
Date: Wed,  2 Sep 2026 11:52:54 +0000
Message-ID: <20260902115254.3544355-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
References: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 11:49:46PM +0000, Kuniyuki Iwashima wrote:
> It's not flagged since NULL is passed via nl_add_rtattr(), not directly
> to memcpy().
>
> Also, the behaviour will be well-defined with N3322 in C2y.
>
> Given there is no real harm and we do not bother revisiting this,
> there is no need to change that.

You are right, and thanks for the correction. The NULL is laundered
through the function parameter, so it is not diagnosed at the call site
the way my changelog claimed. Together with N3322 making this
well-defined, I agree there is nothing worth changing here.

Dropping the patch.

Hangbin, thanks for the review as well; sorry for the churn.

Thanks,
Chaithanya
