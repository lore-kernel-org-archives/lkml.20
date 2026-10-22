Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682932;
	b=3gjZ91rDYOd9lCJzINrxUvC//9uCKG8GJFh6Z8QZlRkA71LGLLSzqHOBRuNdapMLuH5g
	 KH4H4jNv8l5sOYZtMSa9k2XahtmK79HqVs+Nfp0yuaaQbzB1/Dd1lbWEPIBf89gUQuay5
	 jy/yB4hcEy+Q200ErtgmMBNpNehc68L2XpEM0XLLSj/FF0UGrfPvmHtP4TB4g5fhsvcMG
	 F3S66us/gRXHg7oDnCefaCmMsDOSEpUXqxRQvcMBsl19siDkSU2W/LB51kzt2IQjsOmiq
	 QhayDgFZNt/9OVO2ZtcCgSHNO1r7g7690VTYeo0hC4h2zo6fufpEJiMNlNkbNiB3Zvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Lsz624Ujxn422+uNKztX7nvwtm9VclLrvyV7Bq0I5Gw=;
	b=l8Ap+FUmmmGI6vTEcRWbRr+cMRUUdsF8dE8twUkE2ZihTx9WWbbjPVg8QFhdqZYlykcY
	 pel3DOrZ7rpXCGYeKznHiHxoKJqhc53IiNdWEUFHpkNCErH6UfHq0QzjJsceJcPhEK9lr
	 5SntqQhr3wTzXUwFdzGhqy8Cd2SWyEEhxiyaIREXU9bl+bQrQjg9xeCcRkEd/0wtGLQ+/
	 KTEqydwOgMauFt2gKSxXsRi5H0L35jdoVzMfKrs7rB8nPEL4qCfQjhSkd+g7yoziY8UH3
	 IrQ5K9gAcQK7ZkSaoUy8Nn7EdNjEE/tPJlKK8ts8QeBcRRvclbgCkLAZh919nWOL2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sbDDSkfM;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE300606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE300606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sbDDSkfM
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso567513241.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682931; x=1793287731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lsz624Ujxn422+uNKztX7nvwtm9VclLrvyV7Bq0I5Gw=;
        b=sbDDSkfMPFjewAjCkKKGsasX77WXa6zLs2wfWZ+Nwehy6pHqJCxC3Vmdlyb7SuaFrg
         I8ynLjFmdgvJpodRwepBu1/bZEl1xHZZpqsiEFuOtG+EYFXLGFC9JZRRE+99dWy8HP9F
         LmvOpVVZR8RmRMqrXTzT9Y3nc35TlAlYH5DBUPB6T/Z8kZA8TMDBLbB+shXAJrKZhAjM
         T5RkazZfrMNwI4LwN9fPBTMbSvPa+0LA4N5VAEBT+gHZrDNyWkw0v3nm1Yhym0I9aeVK
         2liYb3DfH1m7r8EyrpMVX6nKwMp9jqAhNYIVHX5KFh6bFdCPnMNsGeh4NYqqhv5gp2zm
         TWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682931; x=1793287731;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lsz624Ujxn422+uNKztX7nvwtm9VclLrvyV7Bq0I5Gw=;
        b=1Xy+AAjctNZKsHESKoWzpkgvMHQ0YS1y1oJfFP/7F24kh+bORlcNOh5/a7iCGzuHdk
         sWL/uZVjY9pGrVaGUatxWaWvQnW0C9mn8B+h0nrLl7DzZZkYS4a0t6iNrioHle1sp8Uv
         fL8yQcxBj2tlp3c/tZNip3fs0MzUcswTNDXPKFmnO65ORXLxuYiIideMCbRaUNvJlE0B
         Qcm59uqZCVIXyoFxnZ3L/VxlfSF54y7bg2rkONzDDYXc06ExzykRBjZhVgJUY+FBCTTZ
         TYKtaSJHfEdNBOCCeA/YzB0OLM/qBTk10uB1KlItozjbKQcOPcrB6GL5ajRkmdHibO+T
         sH8A==
X-Forwarded-Encrypted: i=1; AKwUvBwwp5gcCt37bi0T1DbWwabNEyY1gFO5WLVJsFInBrnDVbIAGk+sYvW4Z8LQxEsPRK/DfxGO+7kidhM6SME=@vger.kernel.org
X-Gm-Message-State: AFq9FYJimLd8MO07yVtj0eylFlYxVbCznk996hS0uhtT2hOn9qM5GDMa
	m13WzmD3fgWOqAkang88cBSgmxL6s1jLlqmrgWI4ZAqzDRm7wBB9oxNEeDFmFA==
X-Gm-Gg: AYBFou37ercGdtLUy2+Rl5e4zn1DBtdnc2jIdPiScygwuZb1GvjgllS9l/Fh2Bh0VBN
	xhjNcexgbzlASDaaD+tkrgDgb69QORHosx3aejlokzbsL2yZJvaOY+rPOFeECCQc1a3uxm+/EmH
	sbLQXaCpv8w6fr0Cyh3tWYfUfcqewM6cnCqGAtt5v0Dnc6GiWQQ3CJ8Wdln4UGI7OFaAtrMGySc
	SIa5qmicyravoia//ywK8PcaEKXKoQ2dwc6r3vnZvhv0nWdLsS6xbWGzQOfpmRfKuBGmI0CCSvw
	crKcZQCcTJb07NqxMWSO+7bN2V/oAMa95kZU9gUxNpU0aIZ3oYXv4pbLqZrnjesJNyj9E0HpSUw
	sGlp6qt0gfQz52TDBgFIsGpzLe2qWiW3V/E0OHw0qQjZdoAAeDAYV/u+E39njDA289MgNBFshxn
	ql5IeqOTnSHMAzwSR5D83POMGUgqeKvlKNx0qF0G5ySTmwGDH9yPmt6yMHZkfAQarE3D7uTbfGr
	Nn39fJrp+brOZHTWjzIkttiChLVSs/KZwgYDRjOL0Q70ZsaPv0JQLagP9xtPn+kqhGhFhtml7Y2
	e/s0dmef8rJwva/kiBd2R6wLIgSNhyZzxwOpFrMGidibWxOmn3EQnqNc5t6g2aBo1t0F6StSzPr
	dXEMRvQAqMVCo9sCbcGo=
X-Received: by 2002:a05:6102:c8f:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7cc9224c48cmr1822423137.0.1792682930603;
        Thu, 22 Oct 2026 08:28:50 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc1e79eb4sm3164137.1.2026.10.22.08.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:28:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:28:49 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "security@kernel.org" <security@kernel.org>, 
 "maintainer:NETWORKING [GENERAL" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 "open list:NETWORKING [GENERAL" <netdev@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
Message-ID: <willemdebruijn.kernel.178cac71d218b@gmail.com>
In-Reply-To: <CAL4WiipTihtytPEPj5cSY+=t9NwRwRTfUQ_efCSWPT7nQ=0K0Q@mail.gmail.com>
References: <BYAPR01MB3830CECF5D0871064C59BA0280662@BYAPR01MB3830.prod.exchangelabs.com>
 <CAL4WiipTihtytPEPj5cSY+=t9NwRwRTfUQ_efCSWPT7nQ=0K0Q@mail.gmail.com>
Subject: Re: ZDI-CAN-33367: New Vulnerability Report
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eric Dumazet wrote:
> Le mer. 21 oct. 2026 =C3=A0 23:47, zdi-disclosures@trendmicro.com
> <zdi-disclosures@trendmicro.com> a =C3=A9crit :
> >
> > ZDI-CAN-33367: Linux Kernel skbuff skb_zerocopy Improper Ownership Ma=
nagement Local Privilege Escalation Vulnerability
> >
> > -- CVSS -----------------------------------------
> >
> > 7.8: AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H
> >
> > -- ABSTRACT -------------------------------------
> >
> > Trend Micro's Zero Day Initiative has identified a vulnerability affe=
cting the following products:
> > Linux - Kernel
> >
> > -- VULNERABILITY DETAILS ------------------------
> > * Version Tested:7.3-rc1
> > * Platform Tested:debian trixie
> >
> =

> I had to cut this report. Way too long, I could not see a patch in it.

Right. For future reports: please review the documentation on how to
share such findings:

https://docs.kernel.org/process/security-bugs.html

> We were fortunate to receive a report with a patch from another source
> one week ago. Patch will be available soon.

