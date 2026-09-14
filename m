Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F034A78E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376608; cv=none; b=nYg/Is2YVwKNntY2BlSrtSdg/ZjZGMgT9wDy1bWbk2ZvlQe7LXw5QAtUqhprTPVT9tnfh14XAtRShtdg8ALHaOUTA+vk922PLxp4WlQKqfbQrwvI0OGXyk20tUwWOW3PV0FWe1wN9815ROAU38xrxKq1GzE8sUSkfN6EBlVgPwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376608; c=relaxed/simple;
	bh=WI+TVWUFTFDe7DBtvoFy8AKTnIzHqypmjcK/F4DWbag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYvqu3Bu6/iP85RarXP5c0DC+oABw1IJTaU48Lr8P2rlXZjkmYsSiG3QXURUZFgXaCgb/0QplwweBV0YW2Hdu8qIGuruXfMo99hcV41JdnNcM8OqEFmRzfRGXBZX42oBHuXaWvQQLYHh2TAV2PIAwMs/1zJc+dZYBwI2jUyjKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=N76Z206n; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="N76Z206n"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3222047a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1789376605; x=1789981405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofrWejGiR6SHoGCutK5goPX44BYR7HPIj9AuQ4bpEgY=;
        b=N76Z206n2xCNteZ19+62Brw0emy15QDAFLlQRqyxOqZqI/RpIXtblcEDI6br4/zZA0
         nv/WQRgKR2rfTob4xFt43b474Dpk7ijqjQR99s3p8pwUj82KLKzGMDclP8MNJH6Qgyej
         30O0OgLRvjmIVm8CBUiAcQpJsmvO8q4Vgq0E//DnMmT56ftIHAdXwNHByWVvfqfu7JNM
         kr8QvcO3PD7d7ha+Xb44BGvPnlQxb956enbs13s5iCfS+pC9W8irVpvDKJUfHsYCVAr5
         nJfwD2OFEQDm+NwyZHxA8G8O/xVlL8ED8cx+w4Fvur+K4TabKuaotGFAyNpBHSpn4jl3
         1mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376605; x=1789981405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofrWejGiR6SHoGCutK5goPX44BYR7HPIj9AuQ4bpEgY=;
        b=WXEn4jMjs7RL7Rr60RDRdBKIA/09ePkobnvyZFGe2qy1wYpqeDeoDWx2ZllyYsFrXb
         sY6NTQhWQGolldh+3ZGKyZHC3yLUcTYaZjeV1E5Y8vifya9YgVM5mo7SOXTabyRNw3Y7
         FknfF80yvu/q+xpFiVQJzTjaDAauDBm2TaWRnSci+peo29XyKp/A2/RDLXVPywcqte7W
         rIzLMDAMT6Eyr4VybB40IOq2K8TkeCv614V2gNogemiU9A+pM8ciNLI/hOt1MgyjvtuF
         HDk/IhMuCy3QvAdNxwqHsNlA8p0cTaKnJrzzxk1DPjEnS5tIW5t9yaSzRASbfhCmBf+1
         +DBA==
X-Forwarded-Encrypted: i=1; AKwUvBz+3Es9BEhderPLkX2Vg/MoOSPt9P6wxCsKsBmhCBvn6O6YAk37eWhWDtipJqPfss27acHZOa//z+nA8kM=@vger.kernel.org
X-Gm-Message-State: AFuF++kS8QiZSHMgpoPc/9ttT3sEDZXHYGuhy3oeOVR4SJTzw9L1o/hm
	QFeZwpbJyyNx69O33eqoMwHdL12pE7/solo7JBXXVLnumcfRe4AcR7VzcZKdB4y/2omkOl+k8SK
	gtzHqZdh6mHmim8Yg6/40vgDZPqFNT1oeCbgJsEOCDLEdwOeciGLiHTUHIUc=
X-Gm-Gg: AYBFou3+RCKNFhRzZrxXOMbvLrCXlhhXFBtnNdyTjNtF6xqGWOvPbpgmG1LiIMk+7rO
	qVQ2aIl6rR+mW8dNSZhL0fLPyuRFLrm111u1STILFUnYoQ6csZCucS5uj5gWD3Bp8pxgCwtqZOO
	XmiYB2JRsDpUJecbed0gL2A6OB7FHXR0Sd+/PjpWEpIxF/zHgZUe2CXdKDjFKOZA4MeaMUJydBR
	805qOKdKGNK5WpIMWCosHLJ4N13qd7isZsP34shVBJIx1+Q74lcPRyJyv08Cu6NDeo566sBLUDJ
	mVmL+h7ccQIJ7623AjHWctMnPakVsVqRvgLF6yfuM66ZOvoRUcnhhSa2ctBDNqeLagOIQcGDYij
	sclt0OAyvoECVWmAF4S75gmlL1hlnfput4JIpX0LDHPdo+DVrCdfPP2JAbEn5sJJVjvGk8TTR9z
	j289lo0H4Wt3A2kdGll0BV4EFflzU+nWy517lb4Jg+1wTEtpBd8yksHaRqc2DFIm7Qc8S46G42o
	mAALAwEcQ==
X-Received: by 2002:a05:6402:46c8:b0:6a6:8dd:c76b with SMTP id 4fb4d7f45d1cf-6a9f61e5270mr2016134a12.1.1789376604966;
        Mon, 14 Sep 2026 02:03:24 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:ae69:df2e:3415:7d4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b593d7dbsm3953252a12.22.2026.09.14.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:03:24 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] ovpn: Fix the return value in ovpn_bind_from_sockaddr() kernel-doc
Date: Mon, 14 Sep 2026 11:03:10 +0200
Message-ID: <178937657696.1981013.15922073260198899920.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911231352.12706-1-kmehltretter@gmail.com>
References: <20260911231352.12706-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Sep 2026 01:13:52 +0200, Karl Mehltretter wrote:
> ovpn_bind_from_sockaddr() returns an ERR_PTR() on failure, never NULL,
> but its kernel-doc says "NULL otherwise". Say ERR_PTR().
> 
> The wrong text came in with commit 80747caef33d ("ovpn: introduce the
> ovpn_peer object").
> 
> 
> [...]

Applied, thanks!

[1/1] ovpn: Fix the return value in ovpn_bind_from_sockaddr() kernel-doc
      commit: 1087c84dd9554a427f6ca6e350c22688eebd3075

Best regards,
-- 
Antonio Quartulli <antonio@openvpn.net>
