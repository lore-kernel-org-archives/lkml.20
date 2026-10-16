Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A131ABEDE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792111095; cv=none; b=Cw7j9dI9Q26X2Wbs0+Y5lyKrPnaRdxzoLgdvRckn9BWGFF4xaY6E1UmLsQpCbq7hJpuvbSjx4vphNoBtbjEAGDvw2EHQzP9yLrSih+RJ34vUcUC4wuDzCy+pSQCeXg0XBw5AcGFaY49yrKfm3R+xMyH/0zG8IuOCuFIjDJWGSHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792111095; c=relaxed/simple;
	bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=JyT9NNJp04fXgsteNWen4vbJIq4xqjjY4RVKaIreVEXLWm3D/zZUF9uO3+pB7VwKx9sEpihrvaxm2q9jSw4rKmEHR6L0lKbVRH1Cj7E+zx0wL6Kv1qZ4vN+g3unEJLzMSoow4vaBd1k15oXfNOuUXqjJ1U6Bg6fiZpZFtXGVQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3bkIh7E; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3bkIh7E"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db80fcdf8bso34305415ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792111094; x=1792715894; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=a3bkIh7Ee8Kg3CriNDEwX8oGdI8Qdq5fV8e7jXfgg0J1TidIHQ4ixKF3GGM/J9uPaU
         e9p3Qhm0hYO6htG8BQo38S6WoWM17XaFGJgXz52hh0QoGrW0FDwdFx014NgxccrzmPDu
         tgbpiLo9zoTQFGvOXV/dtf2i06sLTA0NjLV7QioPqD/w0Lj9OfYijzAFuzNuiRYVAi6d
         N0MAhUGZZgq6jxOVaP4SUrgfmC9X+wf0hf06uCR2fckrgo66IiFyfvGxl1JjLyDrCPO/
         S/vw5NXyrspYxKUnw5D8+EHgJ2a0J83wCznPI/OO3Clz8nc6Gz2YW1YzxBTBClAAqsCa
         L4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792111094; x=1792715894;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=iL/WPu47b18mM443UAWdw7Y4pL0hc+bZTjDX4S/gALohW7FK13ubZTyeOtQmJk64Iz
         wk8YqvSuMAva7T696dxEZHjgoMkaN7vdqDiAlTeuzcId4zLGaJewzzK4yy4dp2nSrJht
         1QZ+/L28y7r6qOqQtr7kG82F5Oh2aLMdXdhT6FZYfOEo2GtTreLpE+rEq/B9SWIhupix
         XG74JWCiNnLz1Pr7cxQ+OFuIkjIoM25r3vdaPhISjws3Ma7JCpgV+CVaqtwRs9GUkq3O
         f6pjzMM0vcv0vj+Ak9chDMPH0J9AgLi9ev7fLBmlONLBGlVvK9qphawwgnzRiiKvwmO6
         DyYA==
X-Forwarded-Encrypted: i=1; AKwUvBw1ux5tyR+zOaQm5RImKqYvKB9y/UCEA5mpUaVGyUb5z0RPG9wdAn6jhR4m8017pUlcAQ4ptNWZo21DW7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3WsNd4QiqxhXzsXNLtV+Z1AMgArsFUUq3O1ofeGzYMN1+amLS
	y3R5oXoOkIuQ47iBt9IFEOD/plYki/haLkisTcnkLvyuv7bTJQvlzKqV
X-Gm-Gg: AYBFou2zCh+conT2+u6pvnsCeK3KZcKv+VfezEJzWBMQoAqmhlpMfY55j/2hyQlCB1G
	FG1OuaVtjFvY6dhC2m6G2hbmUF8Q4Qk93asWcXwCmTgGPJZC3AAGGUcwBJFC+0o+OZujpUctMLl
	/ZrxhLurs0mLrAnFvXvfzFF/CdpgbDLChr6UbNFo9dNEaYaKUWENsJuqpaXbxV3vnswI4n/rUCk
	VlQv98qsedZniehTD7bLslMVxl3qUVoWZmmKueHPkQNwJeSmC6V5J/OAfD78HEiIW15TqTXDXuH
	WvxY8PrYmnoqtq8MOX5gMwo/gbwtMxcRVQbByj8KubA3m8pzqzcDmF6ni77JsECZmd/z31mGeeN
	/wFOSNpZo8bT1PZy/S5p4KOCP1aEZ8p5xA8wTJYe3fCpmEokz7EfSsF/orL2+tn9NVmOyA8+2xY
	ydrjAX0BWjjdjqL8sJKOzS+Hz9wlygSF9hhwShXapJPtWZ7bBQmPvRY1drZk9L7DngP94gUwypd
	qTM6Zos1s/rbjEkyraHyWij6f4SqxCsI00bODExaJJwwLVmP984p5fHhSOfacLqLoF0vmoqoDAf
	fL0=
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab3a94ffa7mr15824328a91.16.1792111093664;
        Thu, 15 Oct 2026 17:38:13 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm6462107a91.17.2026.10.15.17.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:38:12 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:38:11 +0000
Message-Id: <DM5UD20248FG.3BXPS76LK06F5@gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] keys: Add well known IDs for
 fs-verity/dm-verity keys
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Alasdair
 Kergon" <agk@redhat.com>, "Mike Snitzer" <snitzer@kernel.org>, "Mikulas
 Patocka" <mpatocka@redhat.com>, "Benjamin Marzinski" <bmarzins@redhat.com>,
 "David Howells" <dhowells@redhat.com>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "James Morris"
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Andrew Halaney" <andrew@amutable.com>
Cc: <dm-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>,
 <linux-doc@vger.kernel.org>
In-Reply-To: <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com> <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 12:38 PM Christian Brauner <brauner@kernel.org> wrote:
> Applied to the vfs-7.4.keyring branch of the vfs/vfs.git tree.
> Patches in the vfs-7.4.keyring branch should appear in linux-next soon.

What is this branch based on ?
v2 was sent against bpf-next, because
commit 264d8fd2794f ("bpf, keys: Add a bpf keyring for program signature validation")
is only there.
All hunks in keyctl.h, key.h and process_keys.c have its lines as
context, so the patches don't apply to -rc as-is.
And patch 3 documents KEY_SPEC_BPF_KEYRING.

I'm confused.

