Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352268;
	b=IjlMiHwDz94RwzO0xnQKHLraz1eIRaYH9zOs1joWpAkbTgo2fwWNcZRpP7EDsOcq5vhH
	 v8EtZJiU6sohWdAVsytVvpKJnBFSwyhVsOVJPQoEWXWpcHpYe2X2K11cHhs/+hWsFjstX
	 IUYDOvX0grDrtpnLUURT/NYahe6YKRsprqRrTB+1J1uQp7y7OmVawVXOVTIq0lJ0PG91d
	 RA5y3s1SfmazxJcn+BQdl00uFS3QwRlU7xPQGnGrIqcGTLnAeAhA8VHpp27vxwGXcdCz9
	 deqwkUR+9T/ung6cYAD/bX/1HoOHDQ6c7BTDXjHX17nHBQW+wVu9UL0ZvBWifGKrWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352268;
	h=Received:DKIM-Signature:Date:From:To:CC:Subject:User-Agent:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MYCoROHDaYVZU65zrhHmzLL5b5Uww6lu+Rr/UYB0+4M=;
	b=gjrqL5T82kFkyXhP0WNcZ7e0+tHt7/XUF9IXwjMQHV3Ia2Vhrv05UtMGAHAszEAkeV7S
	 UXf9YXJ4yE+/IN9PwcEwaW4KFbw5hIktqXANzNeWzZ4sCrpP+ka9XwO/TufGDLyQf1s/U
	 q3mnx4ilswY1xwc4ZTD86HDQ3y8PNJxm+wr4hsJ19Z5DwWLsiMC/meVQ2Vp3DL5+GsYk0
	 n3hecJNNdWlB6vp3ZHKuhy2ADbLZ/AuxN8mMTYkGik2LNAkywbBmBphLYxn+i9b32kf8Z
	 XUrRvHYprdak3nk0L7g5TSqanjaxPEJPBl1MCqqdveXi3XVOwKYMfxvjRlR/rsNme5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ltpwhv/h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9351606A31C;
	Tue, 10 Nov 2026 23:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltpwhv/h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D641F0093C;
	Tue, 10 Nov 2026 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794352267;
	bh=MYCoROHDaYVZU65zrhHmzLL5b5Uww6lu+Rr/UYB0+4M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=ltpwhv/hypmB7bU2ZmevuKSNbQJ1jx3kv+gUx8DwTWn1b5KP911Sawoe26+9m+Zzu
	 0VVDE4aKlTZGvEk+4h+md2al7tBhJEYl61CyXfkDpyprKQLu7ZOaAmljQdUxGp+r+Q
	 cn04SkVGcJppqLFm3hBzv7yn3XuDwwIjHaRz28svwiDB514iHy/UjvSKAN9TmOfpCi
	 egptsT7tZAn9xHMKd5SW+ci5++S8LkG6j+3c59wO/wtqimN5vqWj59msa0TwlvNqCZ
	 i144zY46mozG7VGySo/KUrpd+AIGPCCpXzsFuNP6+o7YGWQSLSyF5uJ1b8ZZVgObkM
	 pmwPL6wL4DDGg==
Date: Tue, 10 Nov 2026 15:11:05 -0800
From: Kees Cook <kees@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>, Mark Brown <broonie@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
CC: Kees Cook <kees+treewide@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the origin tree
User-Agent: K-9 Mail for Android
In-Reply-To: <09ebf7bb-f802-4bbb-ae78-dc4b45c1f693@nvidia.com>
References: <avNzIwARUFPlPyrF@sirena.org.uk> <09ebf7bb-f802-4bbb-ae78-dc4b45c1f693@nvidia.com>
Message-ID: <BC2DBE03-C21B-420A-B163-324BF3C57F2C@kernel.org>
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



On November 10, 2026 12:17:07 PM PST, Joel Fernandes <joelagnelf@nvidia=2E=
com> wrote:
>Thanks for the report! This will save us some pain down the line=2E I hav=
e rebased
>rcu/next on Linux -rc2 and resolved the conflict=2E

These changes were sent for rc1 but Linus ran out of time to apply them, s=
o, next least disruptive tag was rc2=2E Sorry for the pain; I tried my best=
! :)

-Kees

--=20
Kees Cook
