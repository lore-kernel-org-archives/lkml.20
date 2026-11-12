Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505272;
	b=w1JWPlwZj5pT6YKd4nz6bBS6IYJJiAAmiAgo5s71gM9z7N54WJXQou0hh9TgrG1bMzVh
	 95Bwfuj3HqqEfuDKZxthdaysTw/CLGthubuM2tjv+iZuMFJ0VdCLisOux4a6fe2kaTKWg
	 NiDAxXZgHjbZ68pPgQdzCkDwM0iDCgP/BpDAjleKshosTsCW83iTBMl70DIShY7iL7bDh
	 2hG9hyZoKwamUZ0yKKl/1a8y8jVfiXl62PbjuQmXKBE+ZAF76sfYgRmvXUw/Rjr71h7Kr
	 wNhiWF0LNUYtIzCYFje4KAId8jeZtNhWlO6c3DsQUsUsALxChAa6iNGHVN8DUKlAD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Reply-To:Subject:Message-ID:
	 Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=2aolqZ0MANJqO2ITTwy9HLTmGP2sAdGUYWIDikqk0EM=;
	b=bVlGFo/IV6eYCoKFKh4Tg8YwDVTvuvaFN/Zht+/L+QRgEN1Q+66OP9W30BG6bZLsAI/n
	 Itw0S8m6w5U8O9yoTa+hCs3fGxxupoTl7SL8ZHUKIpNPG970pgGycG7Xo4Yz/6SC+HUS5
	 z4J2bYf2IR/EvWFdcgA9YZKKYLdfBTaNDwGNtMuphXDR7DujVUDi1NcUwQ2mwh14MdXKf
	 HryymsRywU8QU+U+TQsGoTmBHcJBNZXCDFnOpCRxwCDE4wFcere204cck7T8ANEeXsZ6a
	 ZXqLgvU/xhg6TAuXiaMD3IwOwdUaZo+0O/FU9tUttWfRKkx8a8t0ssVqZ+vRAncjrgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhQ1aiLY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B06606A23F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B06606A23F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhQ1aiLY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so302697eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505271; x=1795110071; darn=vger.kernel.org;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2aolqZ0MANJqO2ITTwy9HLTmGP2sAdGUYWIDikqk0EM=;
        b=hhQ1aiLYgeVlwqDAe0A85I92G9zoIxQ+5VvlSYfVdm3BQ0Oe22H9WEcY44juqdOjZq
         XVIHFI9d8eR4Yiylgu+T5w00WSeNv3XQHfwkqSIjqr9w+klegRNfCa76dvXVprAzX5pT
         aOgbewdkeodNPRccq2OwwT2IJ/kkzzArVl92iP2DR3mkGUdrsVFcnv5oUQtrcgxZpV+g
         3jHD6Qqh6umMcohghUjvvBlC2NMx78crawW31DaoNKtTY9ttYZbLB2aVZ2zGLVo35Tjr
         4S+LgauYcF49ungkVdfAcXcmGg/Pqqqez2QMLlubhsmN8CsubBLakMZLkMDD3rAW+ZNQ
         XDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505271; x=1795110071;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:reply-to:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2aolqZ0MANJqO2ITTwy9HLTmGP2sAdGUYWIDikqk0EM=;
        b=HthqEVCJUXy04acqgaQzHKougIPyPu5uNfLV+aroH70fqusIe17eYN3St/lNKygOMi
         TJt6U5Cd1Ke3YLoAYCIm7EXQGVT3tQ5ZgTGTdsvMz1p6DrALn8St45anfi2Prtj+Skrg
         UIC4f5AsMsrbYKN3+kJBARenYLITk8CB5dZcn6Or6haM3pVqtv/i1/dWaf9S0DMVst0z
         S4FemUzFe8f4mlu+Ek4EnqBz0oQat3DR/S7dByJX/w/9pnDOQLpjHzylvSEMvpX0lh8T
         0Hwg80PIB/F/OtAhWZMNBODzbxA3Pb48mRgWTMCrB+MDA3vvfrxMhP+ITUpf2JyxCQnc
         SCWQ==
X-Gm-Message-State: APuU4Z+Dk/yiNA80CxPzUs9pR9pOQkW94G3YEGHcjmK45i73zDHCEgLO
	/bSvuXxwLnFyS5jihSNW3+EmlVUO8O8nrHe7zQztebDcFP6cFFkm+UqOf599jvfqcDB9LRBE
X-Gm-Gg: AYBFou294iw1Qbg1epKUv5ThvxyEsdCMn5BC4imAdoNYhfMPu7NjqHmjC8qP+8oI16h
	rWXE1v6ZLMYssT3/yVpnz1QxcKJ5lAl/ZYZGTARdtoJGjxcubCeM74fPffVk7T/eFRYL4+KG3BN
	Bzxg9/TuRJMNklWMDe2+oqjGiM4OWGBlDXKiBEWl9aDTt9CZ0CvbZb7vQEo6yL77OGPUw2WHY3z
	tjBpsZDDDB7IHiuB0nzvbKLC+rHyE0tartzn6AX8PbB7HrWuD0bRaQuOh7X3dWclO1QmRWuPJ+W
	zxpmtBVxZKJP2DlKOcR7Ar8Z28UcrRpkQ+FODriISlgQLBHCM+Dbuq9iFZi4Ay4NwS7PRDcXt6y
	dU2Gsq7Zmn/Asff2Pc0JmmwWPfqo+i2Zmirs9EFCvq9UFnfbnP6Htmr2LvAURZvrUljYIf26pye
	bHsCZUFu4bvzsbr+pC3v12cmU4dVlWtR9wWUPh1Msw6axcgu1JJ+av05Sx3Mi2syYYydBGBXQgr
	r969a4LP9Fv0M/4pnpO9747TqBcU4IgBD9Erg7BiuVZT7nZKZo5T5i7I6aerJx/f6RE8t7A6A4g
	vyyZM3FaVxEWUA5gukfrtfbA5oLrrFBrysubDam2TJ0Un9GX/DU9VXsTBQ3t0tQZkEWYzCOXL7s
	3STUiJpwcwRePoj9Em/9M7k/tW6NdhHODCrVL2wEbo0S9UH+O
X-Received: by 2002:a05:7300:cc9c:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37686466019mr6414641eec.31.1794505270837;
        Thu, 12 Nov 2026 09:41:10 -0800 (PST)
Received: from server1.emailworld.pro ([104.207.67.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm39261eec.26.2026.11.12.09.41.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:41:10 -0800 (PST)
From: Antoni Lanczynski_Janusz <kadotajuntrb@gmail.com>
X-Google-Original-From: Antoni Lanczynski_Janusz  <kadotajuntrB@gmail.com>
To: linux-kernel@vger.kernel.org
Reply-To: j.antoni@laczynskillc.com
Subject: I'm looking for someone trustworthy and familiar with the local
 market who could possibly help me as a representative. I thought of asking
 you because I feel it could be something interesting for you
Message-ID: <b77aedce-ea65-3c26-a594-6f1c111490aa@gmail.com>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 17:41:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

I'm looking for someone trustworthy and familiar with the local market who =
could possibly help me as a representative. I thought of asking you because=
 I feel it could be something interesting for you. =
Janusz
