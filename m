Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433002;
	b=eDHqoiVy8fRhKGeGk6aYN2/acO0p7S0R6EyPOI6a86PP4gl2QL0S+7dVdlIQOqDWBrdR
	 nA0nsKxiCscxuhGNKDqeGw4riIHCGYZ6xNZNMINqM+fC/i5I3ngYxrBSd5hvvkCN6icB9
	 ktG9nRS3KzHEjunZZtcVg5j0zBR2Bo7ychdj2zvfZDjefUzUrLFeTygqicngLnkLjx2Oh
	 a/E5OXNWfSoyQCUXcUbbcQNxFw+GSAI19w9/Z/2XrjFx0nBaJwchj0lDa84IuYpEsa2ef
	 D4XMk53jV8+QUWf8hQ7LyXWOb88wG9qiQ8YYOWulASn8sb4lfwFtqGWiTH8DRmks47Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=0UsTtqPbFkPmIIllU2lnhMDYuxkEq5iJvf5QTXV3x/Q=;
	b=wxene56Y38Sgsofa+xs7aUCsjlZ9Ts+WZw5xlTjjitrx7SnnVBNbYGea3pA/sE6epwCJ
	 9a/U66ZnJACPuvcB+eBPRjvXTaO8cLwcXdHPDvq4iz2VVwcDmCIN2Xj3FTi7vSckZGm/C
	 vxTcupLUqGi0WDj3CSJxhnOy8T8oiMk1g2jb6Hgp3xXEQ1uqT/Dp4cgDHbNgIf4xpMtTT
	 O8rn92XpIVuSKc/67nf917Yp3mKon2yeGqy4WiAntIApKa+gpNbx47C0PAuHzR0/1pFt2
	 jAiLolWZ+2A2ETySGoAO4yCIxTRVQCqo/hrsbDmuohWIi7aMm1iipwrv/2UhCDssdgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NrxQb79c;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NrxQb79c
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf243d05so1216756e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794433001; x=1795037801; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0UsTtqPbFkPmIIllU2lnhMDYuxkEq5iJvf5QTXV3x/Q=;
        b=NrxQb79cGmTMyU9hg+Q4Cx5BvKq0Y3NwY95v4yqFaTVBM2i8ccIG4Kd87cQTxnK7/6
         oHpY2F95mVuTzDfatc6878tnT5atwhj82scyVWABTbsN9/AI7r7YzjIMabSKVYPEI820
         YC0kiaDy80DD3Tcsa1p5/Bh6mTe/On4KQ98Fri0saRkMr53oPPZ7eFQ+JVjAPAX1BFhU
         jhr+CS/dF4d6nth2quc7Ni73bqv0n+s/yCO5N4glUiTaQ7LN42GRXMMHxUhDlk/PBxV9
         HVdK9BnpwBjxoLKnyliIErfJ+lH7upxKNfOflCtNT7AybzBsFbQECbZdymkkc+WsS2vf
         qq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433001; x=1795037801;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UsTtqPbFkPmIIllU2lnhMDYuxkEq5iJvf5QTXV3x/Q=;
        b=NT6M8WnY9gD9D2A2wxWnjPnPtvINUChr4jP+gK3rOZnnUAOuI0Dvj5M5eIUBNECTy7
         ANMZjTi4rwRtq9fcuEuFhUWE3KDcVEe1V63Z8OfV9y+ykXLFSlQE/3KpwFgH2J8LbTv4
         RijhDBCPSQ12TezJjnqV0ygMbUrQcDZVemlV0hw60CGvkI+XkeseBqELQTY7/guGPHn1
         E/w6D0/ZKWueOx0M8jlZg7lXGWa17ObBGluFZuMQCEYfRcM5y1hGluUKzBmKjS3j0jeL
         K8IsE7o/BeWPeSOTXiqd7tHNzgaMwMBONrPzaCDviyPrmr/bffvhUv4jgYbbsicxv9El
         yWkg==
X-Forwarded-Encrypted: i=1; AL+hErEl82Z7jRtTzl/kn7tTtpggQDGtCXbuWGl7AIZiQK7Q5+m6KggW9AOeSEiDsJ0zSQrifIXFlSU2UGMC+wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DnNRTeg87+UnfxX68kwjmwhkidi4f/DApOmQDPQz+geJrBO16
	WdaBGXPxWNziASk2soSvJcTJyIe9LdAd4dRS3LotvYTaGTD9BXuI71V4VwS23BpaO5A=
X-Gm-Gg: AYBFou0lywuQRo0A9FFTEHxHeHH2r1lN8y68N8spCMxm41kIsf0kEVdI1NJML7PDaiQ
	wBMYte05mW5UIuJ4KCxMQwy9kV3uO/Scoxh0MjQMZeXRm998aJmWd6AMANN5fTfRrfjTdwPuPoo
	LZJQH2O2rLiwNn6j21vWqsVUDp0NQxbDs3fTam2Hv0iR2NgLFa33TREvCZDVQ6A8F5RNPI+FBE7
	vZMIY3jBUImWJAbhDyv5iUwX58tCY/16sJi9aymul4OUz5iuahvpWTNv8ThyVe0cm7FyVi8cMuP
	6Cx4WCWaShksMNfKkI/2sXsNiCst/e7us/m7hTfvOFhiPt2y9IxeE+59t3EPv7WPqkJqWuIHjhz
	DI1iVKV9H0i5xkVI+YfqJ2sDTFleRfBs/CbgIbCXhG6dWHZCU8OYeR/IBGeHs8ImLHv6JEUZe4Q
	cUzTBu/pv7bJicrfWeENATR0G6alFxg1k7FDqjMaKSTktCTeOuJJah2MZxn/dRh5bifLZ55Zd8V
	Tvl8QfAKM7FXTD9rRsQPic7cNk+FDNpEN/2NP6aUThUzpt9DxQeQl29Eia7N4lzf4KjWldfHfrJ
	YHzl3xYROqnJtCitJni743S6qTw+QPyRTDoonIF0AMDMonOjV05dhBkS8WuKYquCoP/iCSk3gFC
	49a4g3VMTnRRfUWHSGtgAEMZTmvmJ
X-Received: by 2002:a05:6122:c9f:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ee1c3faebbmr1420493e0c.12.1794433000673;
        Wed, 11 Nov 2026 13:36:40 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5afeb2sm4730325e0c.9.2026.11.11.13.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:36:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:36:39 -0500
Message-Id: <DMSPERMRYZKQ.3DKQJXYDDFRS4@soleen.com>
To: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Chris Down"
 <chris@chrisdown.name>
Cc: <rppt@kernel.org>, <pratyush@kernel.org>, <graf@amazon.com>,
 <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
Subject: Re: [PATCH] kho: Prevent reuse of preserved pages after a
 reservation failure
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <avQUquBK6cO6tUUI@chrisdown.name>
 <179443248353.2329176.13720873996862751451.b4-review@b4>
In-Reply-To: <179443248353.2329176.13720873996862751451.b4-review@b4>

On Wed Nov 11, 2026 at 4:28 PM EST, Pasha Tatashin wrote:
> On Tue, 10 Nov 2026 23:09:30 -0800, Chris Down <chris@chrisdown.name> wro=
te:
>> kho_preserved_memory_reserve() reserves each range of preserved memory
>> in memblock and marks it noinit, but ignores both return values. Either
>> can fail when memblock has to grow its reserved array and can't find
>> room, which at this point in boot it may only take from KHO bootmem.
>> The boot then goes on as if the range were reserved, and two things
>> can follow:
>>=20
>> [...]
>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
^^^

I mixed up my review threads and replied to this one by mistake. I=20
intended to reply to: "kho: Reclaim the metadata page left reserved=20
after kexec". Regardless, we are still waiting for v2 on this patch, and=20
I will send a separate email regarding the other one.

--=20
Pasha

