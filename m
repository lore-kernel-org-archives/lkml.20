Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182067;
	b=zmKWgZYzAoQw9SFFchIoHXSe9yGTNSYOmeyJFcRnfpuxdb2MhZTWKq2yRvXjtFxn6CKH
	 9Ts9Ivy0XAcuniTaly/ih8StGngUNHRec0pdGNkcvDpzDeMUlxx95zHFxXLkTUYMNF4OX
	 UkiPFrMyKbg0YKTejExleJgkNlS68ej3UJDgu1xqDHw0V+QppY38YfmMpftXHFrhll8wL
	 2tkLh4aSsJFC8kDxNu+mfjr1v3ua8MlUXhIpvy03blj3WTc3Y47G3fp/yQYz3b9DE5t0F
	 KAlUFV0RmOV3euqnHAgEMos1OwM/rLehsa5RuAME5G1Lv9k4z7NsycT9smgezgPqDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182067;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AK4oUkv0Gh66vc4SvN/H9zgEwQlvIyoNNPAFtPmNMZI=;
	b=SezHLasXxMXtaqm73H9Zd5OPN0KCDlY93lve7/PNzH3wC1e7dNjvLovRRFEmccGmFStl
	 dMEzGncoEGn2viZLiVg6kTLWZiDe9z/n5ztiezqFF13ZDCgbPSv4CGqSucKRX4/AYdgnU
	 IaOeUb7dz6egBrqTRJeQWhk/PThkV8UIXRbCPwpqxbXhpBR/gjSY7pIYiqHHrnaDpUvz8
	 wjarhCFCPX/91+EFDX89FSqekiBVZy/akiUReNsllZNZYZ46Uizdyu/C5RX6uXlo6uWV8
	 yWjUO/lCbFYDxjPK+VdQGFu/byDvI2HMqmzuQ8ZDa37xAUK61P/ffv/wD6MIt5gYVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Gz3ueRG3;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B1606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Gz3ueRG3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182064; x=1794441264;
	bh=AK4oUkv0Gh66vc4SvN/H9zgEwQlvIyoNNPAFtPmNMZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gz3ueRG3WsJS++uB2IiHLqoK0scGqkWTBYK8FSqr3uSUu9KKw+FsrTK7I7E8KsQ2F
	 Uo0B9e+BA2Ztp9IokxjZC2UkB5qSV3F8aWVai2imTf4HTXzELeBwo1MLIXuBNcyD0L
	 fKU3rJgWiOFpZMxr0t4qGc4fCZw+DuX3AYJ767OphDyUL0JPSc5xOI7D7IHsIx37zS
	 Gg7xGyjHiaVJcQ6seVRHmfvGq2LjoZA0whmuj18hwgmQuGpk45HylORUzhctlyWR2b
	 bBTLpVJdZzDALfiUbU8tpcqIU/zAw0XnV9s4BzE+F0TtQBBT0a36M7y5DQEt9GrJrY
	 84COjVeGVfMgg==
Date: Sun, 08 Nov 2026 23:54:19 +0000
To: Ian Bridges <icb@fastmail.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: linkinjeon@kernel.org, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ksmbd: read request header for compounded CANCEL
Message-ID: <Wu9V4zPWbwJA62vw5GO0eLPkvQbBdN1rL2HpPNmsCywShlx9nYnQXmt2Ya98ZF6JF3G1dytQtcd_ZfR0qcmsr9F34IchL5FwPIeh7S7TByY=@proton.me>
In-Reply-To: <20261108234653.1918767-1-icb@fastmail.org>
References: <0cRgD2yOWbwKBhBZfP0O2ejMhJmcsRk-SQgKJhFyowKBsLZmKYKUb_iKGC1VTDPMUlJrnX1Qpa-CsfMFLwt8hxFqjGhvOLwzEGkO-0JgtvQ=@proton.me> <20261108234653.1918767-1-icb@fastmail.org>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 49979387b24f3a9ad107fb4af754b07f4c583c43
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
Content-Transfer-Encoding: quoted-printable

Hi Ian,

Thanks for testing this and catching the overstatement. The failure is narr=
ower than I described: using the response header loses SMB2_FLAGS_ASYNC_COM=
MAND and selects MessageId lookup, which can still succeed when the CANCEL =
reuses the pending request's MessageId. Your MessageId 0 case demonstrates =
the missed cancellation.

I don't have a supporting MS-SMB2 citation for the claim that CANCEL cannot=
 be compounded. Please disregard that statement and the resulting =E2=80=
=9Conly non-conforming clients=E2=80=9D qualification. Section 3.3.5.16 des=
cribes AsyncId lookup for async CANCEL, and Appendix A's note for 3.2.4.24 =
documents Windows clients setting MessageId to 0 in that case.

Thanks for confirming that reading the request header fixes both forms.

Noah
