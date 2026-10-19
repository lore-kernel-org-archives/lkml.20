Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7C82BE03C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792372053; cv=none; b=cclbB1b4zdgtv1hPNQ8pQOtq/GnysOQWMxKb1XE373yQhR3Ru7hK8Rels76hyocY4D0YbZkSPupXqvPWO+/0JruFOBKZDOmhEaY9Bp+RfHaFnOgO8AXMmDK2KiB+FNmHAV/PZtESG1ox0DqkTzW/jac03Pnx+KW3BxpVEjJNuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792372053; c=relaxed/simple;
	bh=mIiL9PgSJJ8fjuyW++lfEH4uifioW1V5PZY/k9OTv5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkrEn7WgT1IW84TQ2hb+5PEvV8MgeUoCqw+F91vSGREwb+QQJyym/Z63Uw999pc5MYCe15td5yNs3UoE/KHrl9Nhp442n00VRZiUylxQpLL98NtCh3jF05834hrCZa3XzvSF+mmDbp+pA7iJUNbVXs0zisplZdUPfn3j/+Te0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=sTUONO0y; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="sTUONO0y"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so3980792eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792372052; x=1792976852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwsY2GW9uMLA/+aDo+zZetHYH/MOnEHa84gDTy3J3Zg=;
        b=sTUONO0yklJ5hHIOAB+Miun5K4R+NJ3n1FmFTe6ggG5tml+5ujS6qvlfKq4YND879i
         O8JR3wTD0JeECVnKRxOBtuthOJ+Zt656FCrZAjYh3vkmm/ju3W7zoYCn6fRZYspgwsn/
         +Q/mF9NIZODING0RMCYHHHaFPdle3R7HYrB2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792372052; x=1792976852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwsY2GW9uMLA/+aDo+zZetHYH/MOnEHa84gDTy3J3Zg=;
        b=DOYXPE9chyWLA396M3At7V8DoKMhRcYH9g526jrwzUa6yofKA5q35gnNpKd1tek7ZC
         fK5fVdsU3sJlvH3HnG6VvIutNdnrHlVpfQZeBwWHCZTv/JjsmoW7sUTJ94wXoqhZVJf2
         4CpJMd5QztOVkWy2JgF3PRBY+ij6iqa9yJaFjL0m+lU9IlUQyUGWw1UU8nQETgmtEMjT
         8mwPFK49ejOtBWogz4AsNJy/P6RrLACoX9JHh9Q3yhVu4WTYwwZYzlTJnb3hEBMQvAbT
         D3/h++1W1ta08DUJE6iRqhQXZzQOnGTUHDMOrP/XZcRr+v8f2vcE9icsPnZT+FOD5W0c
         iJpw==
X-Forwarded-Encrypted: i=1; AKwUvBx25C3UCUIh3fID3b7f9vF4+CW1j47sgRPXj7VCuLRj8lMSJOjdgkf99IChq9aoSOjOSo4ZKebUjWcC3+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVvrsU9xk0BwUnon2AMbY+gnbraL6WUXaEHDLK23jcmzErkyoX
	a+w9iSAfOEXG5pn1B8LWGem5BG2SWGP2M6a7kwDGNUgy4ChgN5Fv3uxmCUsigy1JLXU=
X-Gm-Gg: AYBFou3nhTBrfABixLabkbFJiA2tO2O8sh09pmYkRmdTwLb/+Tu7SY9KmdWvDpmLqOp
	tD5QtDXuPxwBcHjZnaKUablGmop8lKfGkB3jAlEvM7VZ/u1MnhGGuVigI8m5pNQZGecniQtcRrz
	BFJiCTHHM/6PUn8ZlrwHIzPe7Kkje9mBxyI1eZXPw1e01geOLZVk2HV3Wk8peTUe5kCwoRSfbrp
	0NOa9hGDoPRolP29zy0FCj+6eHbAxiK/k2rFGg56O0HBCae5OgNVW6xnKSuBRuhZyNbXoqi6k7e
	6eNJ/XZJWZLITcFmmIUi3wJXDFBkrq3lR8TZlsUqN4++lHJM4l2jyLiBlNVuYyf7/gbLXqccj7t
	hEzoZaSAUq7lCQtjokJW4BQoyFk9F3XtgToEgbYFyi2Rycuz71+pKan9TBRXqJgHrtrFWFQrPhU
	7j3EVdBwRGuk4pxp+dsIfVB11UC0pM+8UVmu8zgHhYTUD76tiKezTH3Fl73wCe1Pzr7bygMYbsk
	SqN3GrES0BJb3824P7VrZhkpt7MYca+pj19QZ77OmlWvu0eV43uq2oP0TUuAjxhkA==
X-Received: by 2002:a05:7300:7a99:b0:358:f678:46b6 with SMTP id 5a478bee46e88-361a2343165mr9757670eec.22.1792372051354;
        Sun, 18 Oct 2026 18:07:31 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm25934235eec.22.2026.10.18.18.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:07:30 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: netdev-bot+sashiko@kernel.org
Cc: 98lawweijie@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	law.wei.jie@gt.tech.gov.sg,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	petkan@nucleusys.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: usb: pegasus: check rx pkt_len against the received length
Date: Mon, 19 Oct 2026 09:07:04 +0800
Message-ID: <20261019010704.90465-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179229290253.3135.18168766657798775955@kernel.org>
References: <179229290253.3135.18168766657798775955@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko is right. Will be making changes to this patch (2/2) in a v2
patch request, addressing those comments.

    Wei Jie Law
---
pw-bot: cr
