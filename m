Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D80371867
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570907; cv=none; b=q+JNHNwmGL+efsXU6ZN+90cMjB1xs18/15rxMqMUIsdZ4ZLpS0rNpl/be5fTWB6HK2EgOI0fHy310Enaz19SG5gE1MH6Hl9Bs+rMlzOgQucWTps8UPN5ihCn/d9CC3FezRRpq27lHr8MuHokjBisolHEAx2ZnRDQcNztw7eN5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570907; c=relaxed/simple;
	bh=yNOZpHwujwy+2/sqpvO+7Bg+1RUIRyAvHnR1tRJn9BI=;
	h=Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type; b=lFOO7v40/MPzum3ePM+NoCI0P2Uj8ieyR3MHQlCppoopsZtL57B3rPZgEcNNTs+8M9nmaj4G4PDmqfcXElx3glZcOkjl+JVHstJ6sCMCgZo50w/r8mAbNAgNLk4MJOE69fe0MScHtHijU13vgYsoasfxq25/Tt+mT4E0GDnZwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei+Zsv/7; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei+Zsv/7"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1853975a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570906; x=1790175706; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yNOZpHwujwy+2/sqpvO+7Bg+1RUIRyAvHnR1tRJn9BI=;
        b=ei+Zsv/7Pqx+OlxaMuu8hf4LPMD0shPFOxl1qstWuYs/PM1YFeFutVqOuvzhAh9x2J
         9L0lzEPCMyEddGawzWCv/tye6t/AYkaCqU6fPliQEKSf6HrL17YesyIMZyCcleQuhZoD
         BHh0YpsXgXP+yi6VfZkMXV55BWQpQ5bQ7unBm9YVl1BZh3WPQC/5xIpj5kM17BySom4n
         ku0jL/TPJC22mJnBxmYPmkdoxuTlg0DlBD3fvlDv6Scher9R1MMa5TP5T/U7Cess5dOT
         f8TZjCmfsQdaPFJ1cM6jYcBB63iSdE0hP1vxkVS67A1C9G/Xx5Sv7R48WHB8k/CJKzrG
         SxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570906; x=1790175706;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNOZpHwujwy+2/sqpvO+7Bg+1RUIRyAvHnR1tRJn9BI=;
        b=LuNMF7/0IhjpXWCYc+Ev38Y7uh/1jlzc3SH3L81EdLKFToiiI4Aql3jR1vosD8I8IA
         py6TcX+rcBY5XRB8uUIAMdGhUyqzHr9pSoVhEkIv6BhAlHvEOqDsCQa5PZ98praSLV2s
         rlT8NMJbmHUc7UzxKmTcGMROK2fBFY/D/RTFDkOZwzqylcbFCTeVQsBiU1ae1ioPYRqv
         FvBAAqXW2ftr/ez/GtWcZpjtIPG1WXFJHJ4VzAMq2y84GvEHTzhurn/h1wkgrl3PHEY3
         Zxd2Jpvcs79+C+oGIzjTqgziR5WzK4A7jZrI2uLIUVDpwBbYOWlyeQBJ2r26UL2UPToh
         Xm5w==
X-Forwarded-Encrypted: i=1; AKwUvBxp1ztTotjO0TOKKuCNHwE9LqNwLENzPuk+f5LmyWxIgtn+7qkOeOHd5QA47t071T5J3/NG/0fcnkVcygQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lEafULcwZoNsHX1nK/ZkZQy9Fn0atrJ39fdJ+uWgUWl6hz/ZL9
	CqNA4sZAikwjP0qrLcLJ8Xxy5fpNTfrz6dvvPIV0R5n6c2A4mnuDWS8C
X-Gm-Gg: AYBFou0knLqH6tCUlKbTqGOuzsYjsDMr5yc2Damn4cz9HHTND7YLvPgh51fNBiMbHGt
	5g+FAfDQ0uVdKrG2afutue9Bny/mJ7+TkSbR70c2x9dweRQBkhUeg+tK7MpablEG/1mkPHE81qo
	gTBDVtLUc5Cgq53XSySv2jng+rLIlNWlW3Uui+SS/J+ft7HDdUB+bJVCKfOY+fwczwDSfdwgtmG
	0MG+352TFv7P9cxJVyREdXfDI0vHJNKS4GGLgSf0+fjq1Sbd16WKay8VXLH2PdSRk4M6Vf3ABo0
	m6oWjcVs6fr62cjK75hEtYw0noBtv7hBXPgJykz2bWGnrHAkdTPY0XxzhMDkm6UwjXpSg2T0SvQ
	ztpMey679VyVSzJviXyNc2CryZ1tCcKqE3pruGdK12fkI/n4Edbh69fgTH2XaGpn9JCrBhNbmF9
	IK+jw50YRMMcAsAd7ew6xR/cuzJ/MLVTZkfODTEzB9aRiDiXbC7Xw1EVcIbytHS8C3
X-Received: by 2002:a05:6a20:3d8d:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3dd5f5de790mr7607051637.16.1789570905798;
        Wed, 16 Sep 2026 08:01:45 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab54e26sm1830321a12.5.2026.09.16.08.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:01:45 -0700 (PDT)
Date: Wed, 16 Sep 2026 08:01:44 -0700
Message-ID: <e1f0afec333802ddf74ca6edd325d37a@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
In-Reply-To:
 <CAHS8izOSaXtZy98UB2ye4-+59JujNb+SyBp+EO=YjnDvYLr85A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: devmem: batch net_iov allocations
 into the page_pool cache
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Nulling is probably unnecessary?

Yeah, not needed technically, let me drop.
