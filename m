Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8944DA540
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164773; cv=none; b=UV6b98Rn6XOeO933s/9GTyh/VpWbn+bDhB9W4n/5BmaMGMTRp/D0gbdR/YmBvjEVk4z9cwlhXIa2FOyTHeiE359s9hgm0Xhe5uyAQUEVLk9/G36b+ImruhjLZGNJ7Icm6LL/RbIFH4QkOPtPueYyg4DuyAiS9jIkCFnfvD1vxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164773; c=relaxed/simple;
	bh=lyThp7bIz6kj168zSwcpYX6Pcr2CQbMqDAwt8ob+z70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IevIcO5NMpjW6LcokevJvYfb3vsFLHxTVrHtdpDPCySUHPOIsGN1Y4dm5SoBecytWRp298kzJAhrr1Y2xodD+qcAqOQp6N8A+P20LftXEQH77LoScWHrvDAZaE/oU1XP3STZaWTNWZEdr2oLnJ9fPDDfh2bPyi6dd2vKF0jzlj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBXnmgxe; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBXnmgxe"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso448309a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164767; x=1790769567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrzXSXvlSZQsoju04uUevcVwnOSzbxdAq6pl8JZzW5k=;
        b=DBXnmgxegbZBUmOsq3ltZ7SoonG/vyLROHa14W3bPLY0yEqB1VWFo7NC0gPqLMMy/K
         zj/ZBWFLkXNK8uDFTkFYUjWgOGvceYykGRnILOhe9wtj2T564r+wCaDHyGEzOkyX3sQX
         lvnSNeaEHXbtWqhkMleUt0NePUoJjQ/exLHhmx0BGBMEZVMd05F45669JGghJWgvLcYQ
         tusInSmiEsXb/dpfKyzy45GxPaM5YyJnEZ/y8+IuSacGQW4T+SPAK7VaL60wmcrN//L3
         hbzcGzpnlEzriwWqAp312asfccBF1q9rs2k2Eu//HzgJOTcT/89FUG8otdn05cIkCo0J
         Blhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164767; x=1790769567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrzXSXvlSZQsoju04uUevcVwnOSzbxdAq6pl8JZzW5k=;
        b=2dCxTNtRrU3RTL+Tiam24PjLe5eiAH5AUyRpHpmZZkW8GZ1dRbrWKNw2isituy7+6P
         pHtGbV6CzEcYTR14EGhVA/c32lwmboXf/D3WJfd8vxvKRoBJJ0mrMrZjsVgrAyZG29jP
         ADEqIF2Jo6c5AIB/ldhXhUW4sUT1BOIYKvGOXKAf6aNW+qjOakXd6pBMSYBthHQRE536
         hkUzpAFy+fyYFqR62AsY3TjHuzFRTborJFej/k1ivx94IdF0WrxDJb//EfmUQGewMaoS
         do7QXy5vcFE5YCj6qDFp5exEuf/R5vmXoTRZqh30qNUjn5NN8e2dSiYME6sWT49iCpQK
         7QGg==
X-Forwarded-Encrypted: i=1; AKwUvBwl4Pjm81uIR1N72dTY5P3aXQKpphyvbGPK3oND/6u7Tu0iJRBDXWUNH08yjuWanVL5CxUElJYExFYq3Zc=@vger.kernel.org
X-Gm-Message-State: AFuF++nKNTv18Dyqz2DMg3BkWKDXBvQO5MtFvZ7UQLhORD7DFiYK1qbI
	lyY/voObMFSTH3lXA8hQH/C9fogwD9WfQRySSxghcrbh0hX13tchygjY
X-Gm-Gg: AYBFou2iWDHE0GvO/GPaBilPra65y1YhrD5B5D4Af3TkA0wqDOuO+fVbRtQH2MEjehk
	k5GliWpGuh7zpeeTCGiJXXkVQNwU22EGGLs4M75ndAeEqMLwHGwMm9U3AzRxwOCSijj8/5Mo/sI
	P0aEjrELdkQv49masSD7ogIdJ5NRKHZ9xK/ONTmfduaANOIEKPPStb8L+rIXV4Q9L76tdzO5CqD
	D8QA6LXAGuLNFBrm/qAE1AQDu/SwrIYagMt5qfqOmKRGFWgBmLcNjKhcI2q3HAKJhZm4EH1ySKM
	g6R7470wTKgD27Il9vjLLzsjM6CLBWw7Swdedo3qy6xsAPoE9vf5rBs4FTQphv2JugYzaNYeQgT
	sYgyEacA3UngA3KVDTI8mTwv7PFz/pCeojFPzdJpZumm1J9zvs7e9Sx2+ExYOsupJ+nLUFk1crL
	LHTIps9wNtPY/HAoHZSyHMwbxAmEQsS1OBz9PvSEXnpPful5zu21qrvlszb8r5g7s=
X-Received: by 2002:a17:90b:4a45:b0:39e:2530:2102 with SMTP id 98e67ed59e1d1-3a07e56552cmr2048640a91.11.1790164766974;
        Wed, 23 Sep 2026 04:59:26 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae66asm5970635a91.3.2026.09.23.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:59:26 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: idosch@nvidia.com
Cc: dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	alex.aring@gmail.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	razor@blackwall.org,
	eyal.birger@gmail.com,
	nicolas.dichtel@6wind.com,
	lucien.xin@gmail.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/4] net: lwtunnel: accept encap attributes without NLA_F_NESTED
Date: Wed, 23 Sep 2026 20:59:14 +0900
Message-ID: <20260923115914.70760-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923112917.GA2749166@shredder>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com> <20260923112917.GA2749166@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 02:29:17PM +0300, Ido Schimmel wrote:
> If this never worked, then why target these patches at net and blaming
> up to 7 years old commits? I try to follow [1] when deciding between net
> and net-next.
You are right, it is not a regression.  If there is a v2 it will go to
net-next without the Fixes tags.

> Also, did you hit this in practice or was this flagged by AI? If nobody
> is using save/restore and hitting this in practice, then maybe it's not
> worth to loosen the validation performed by the kernel.
It was flagged by an AI review of a new encap I am working on (SRv6
Mobile User Plane, still RFC).  I reproduced it there, and checking the
existing encaps showed rpl, ioam6, xfrm and the ip tunnel options behave
the same.  I have no report from their users.

My motivation was that a feature which exists should not silently fail,
and the series only drops the flag check on the container; everything
nested inside is still validated strictly.  But if nobody relies on
save/restore for these encaps, I am fine dropping the series, and the
new encap will keep nla_parse_nested() like rpl, ioam6 and xfrm.

Thanks
