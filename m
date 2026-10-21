Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551925;
	b=vzLCsn9xhFTbBzu9nF7GFMzaEc50nJD0XAODa+ZBSp55W8WeHCwOcaILImDZ8HRKCapk
	 G9GKstd+rPUaOEWDcJtQTWzZ+YHkQJf8P8ItCF/koQnLjbllJmZ3d0B30LmGp1Ctg2CYh
	 gpsjiXx9rDckLdQBXwcMwz1FMAvSZYeIgmN+HR30IsKqRA4iRofxqVEMrwEt8lHMlsllK
	 dXMqayhUuMiBxkFAz7MJ75iZERh7n+inv635cmwP5MfcPd/S84N2mF1DofvoBGdTRgaLj
	 jcBUA+8cDMWNAJba+4l9aI5A0KS8dOppm9sL+hMOgi+ikeZxoJrl7G9e4B8Fu1wYrGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
	b=hi8UI8HtkLGXd0+AXqWwPlLEE080ExMkBn69Y4jlYTpbBayfOdMZ5lcVHpGniqn8AEzF
	 VgpFuhBJ7S0kVNf2uJiv/pz/GWVdppoBfFeDzctNal/8/r/NV74bYBbxaLcJBb/XR1I2B
	 60mkOpRAPQqrEawAaROHhMgmE0UQ/u/nUS2y3w1kcat+2XMaBB4fzQqfn8iWxR9PhNQbM
	 NGO3wRyj48Y7SWGaV58oGO0AM5til9vKGF7nbC5mGeKKA+srwGkBS/NOB5qVehUQxwRgj
	 MvqLMHBKYscpH/bK85CZ7ZjoppOBJPvmuSjeVinUuxRRnSBnGtKVOnJQtF0bzYl99mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTUhIXqc;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E8606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 976E8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTUhIXqc
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so270240a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551919; x=1793156719; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
        b=jTUhIXqcHD5paioHMBgpX/nNDFeI6GefwrBU5JCZ9L6hQkgDCCR5V9qDyK90TWxB63
         BUeHPqsNqUAWjxsKRzhiYWN4gg/2tWiSqAFA02QpOTMVZ8HDrd/73VlSzZ/z6Q6Zcjmb
         y/SpBz7FnPTQZRm1MiEuoSZnfDeQH8kZYfIu4tSt+PzCSc9QM3JzSGKAPbcRqH35wiGt
         iIVaNSX1r/6k7vkTPWGRrKb3k7KNyal3wwC2/NRW0KdNFdIthL0IVESKxGtAtYSu8Cn8
         cBxQ9fMunJcJn3KmG5zDQHXwvhba1VSFsi76J/0MovajXPhER5CLkwBZRb//TPZDUhXi
         dl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551919; x=1793156719;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSbx+2JIYEzrqnyu5Jxh+14HH5G/iqzw/BzmiivGbiQ=;
        b=K5j7Z5lWUV8rvfqPGhVrFGWcZFOc6TrNwd5IU4YY6jBqHF4j+4qwqmRXdT8tcwlDOz
         ADWBGawbMCWxykdmn0yilBJVnVwQkzHGDiRQh18jyZXEaz/Ft1U87rzOX5Yn9iOWJx2Q
         X6lGxP30GyhJNnALiAlgW1ejA8J1xwRhapx8HRDkRu1YPWph/lujEXhGZ3BdeZwr+3hg
         S8vpZLxBnQ4zIMuUHImQWj2mg0atmIHubz6hLM2U/TqRYNZ40H0BcqJO0LwObIkqVU6R
         RrstT0ZoIF/WtoVu2G7l/mIdTjTBSQ9LZmIfxmBoE0xvo4u0mgj20KaEj2dOnjSN1EQT
         WtFw==
X-Forwarded-Encrypted: i=1; AKwUvBxn19MraBrw9RgFvoedp+Yybidy5JtYStg05MMZUsnUA1JYLAQfnNt00y4rdD8u5bP1uOkr2NmeFYr8Gik=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3yAYpUXvqPBXUR0G5GPNDrEGsOl5dWOulAPvWDa4exokT0J2V
	0vldJh/75gL2fXtktiSolOAJpI/WR435ilOf59Arwar9oFhSBTvmg0C+
X-Gm-Gg: AYBFou1Aq96g3xdbZ1MFIHexZm85YvapM9qgOx36DJSIRpgtxgJAtt8ro3dtwpzgofg
	qbx1dYvb3BIYCrQsrmGnDf3p/oci0JPWqP86JBoNyHgWqMVE6/Wlj7H94SeqfOdvZ0xa0IeYj2H
	dYAPWoJWhl0vBVyCh+JEzuPViwjhYPsOgdLRoKmdUawnwEWK8dhUGaHf4WcrKGSUpc6sQu7PGRH
	Gzojb20+ZcRMsQ8A28KhNCm8e5DvUhBjvmNXdehwNejWLECKdOgceraxbolip94MjB88mskaDp9
	akL7+6Qk/feImzflol4osXvrc5qqIigZnkieJ+BipbyhdWhunNyFDohwePNnGKddKneE7ghQgh4
	GUM99XAU8WpKawYBY80tchTUyLx2RhCIQn5chOsYlrwRH8LOq1f8cSA2VmGU4F8meuypswlQOB6
	4itMv/Ee+EqkgQElBSDMOlWDDG7EZx0UPSjyHryYAC8ZxnyTsAwPkbtYlWBsiAVjM60zL02uKb6
	bbw5sZufiGV0x2/OkEjHWyg4MrLDr4N4FzXy8/ratMN3ik8UPYF19+ou9eY7jgy3uAKcCu4owyL
	NMhezc6VZ9W0Am2jGXhgqCSo2N7rwxpzQXyC4nJuFb0PQfTpxFQLkxUrSlWK
X-Received: by 2002:a17:90b:2710:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ad86c79924mr698658a91.10.1792551918978;
        Tue, 20 Oct 2026 20:05:18 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad812c565esm1924550a91.10.2026.10.20.20.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:05:17 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 03:05:16 +0000
Message-Id: <DMA6ME9P5EQG.3EI83DBIFMBDE@gmail.com>
Cc: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <rostedt@goodmis.org>, <mhiramat@kernel.org>,
 <mathieu.desnoyers@efficios.com>, <shuah@kernel.org>, <kuniyu@google.com>,
 <liuhangbin@gmail.com>, <mkarsten@uwaterloo.ca>, <masashi.honma@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/6] bpf: Add syscall common attrs support
 for xdp link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>
In-Reply-To: <20261020182700.655edf14@kernel.org>
References: <20261020152804.39863-1-leon.hwang@linux.dev> <179253001886.208021.6536312952037292688.git-patchwork-notify@kernel.org> <20261020182700.655edf14@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 06:27 PM Jakub Kicinski <kuba@kernel.org> wrote:
> Please don't merge changes touching core networking without an ack from
> networking maintainers. I haven't even finished mopping up all the ways
> the XDP link bypasses normal XDP safety checks :/

Fair point. Will wait for an ack next time.

Leon,
pls send a follow up asap.

