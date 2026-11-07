Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015042;
	b=nQ3ew4gGZRPBXBC/7d94nC1lhovhMV+c5dAoUiMgYfar3+eszGNDhAjTKuwfysrWPruS
	 BUUKHee+L7zG9AXBblb2SVs7A3VAa3VesF9V0BL0zSGQj17jg7/dx7GbwqTne0jp8GXi+
	 LdTk5wp9YwnFdHY+ZgwfeqHWrZxoGftbaXOt+38zCEEwKdBenY/o8Osa908FHpZMn4cs0
	 eWfXC2AoJTeKNe8pe+eLxnX/70hkyD6MpmqN0hFcPBjG52u2EpSrjfpKBBzMd3c+gXlVf
	 TJbfCkpSAe4ns108DEC/2tnp650fajUirhyJ55MnvTn6Xf66Xxl5TlsxpvJKa0Oxxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015042;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oNqfWJWNkhIbxY1Ddya4EkiSd9wgXMcH5iUSDqnalVA=;
	b=KRR7IFHoHa43JoijG+w87pIUVzcpPNIZe4dT1v811aJP452IHKrUkASqXNtgvwxXtxAo
	 tc2RyxCKbkSw9r7BShS32oq3cfg5JfqOXRIgww1S7LS290tAMYuh6uANNs8jRZ58rqq5l
	 LIgO1b6DNtdM7bhAqaRr0/2Ww8TkcH2YYNnB2+mEeHf1zFfKSy0XCdnD+6t4VDz9A0ZqE
	 n+VH6IHUgUG4hIB39PO7OeEblHMH7Vmhl/N8Tp3ogmG7IWjzudqK/+s6LiQs+VeMSXoxO
	 ksnCCF6Z+w8KIeLxwsz7XNnvTJhf5MnKNs7d7keR/EIHxsxDZxSM7XnOirReV8LKvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1PcnW6o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0D606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1PcnW6o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DBE1F008A2
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794015042;
	bh=oNqfWJWNkhIbxY1Ddya4EkiSd9wgXMcH5iUSDqnalVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C1PcnW6o3Gc/ycJ/Jc4lQfKgSJG17Zsw+4e7SDDzCe6G7ByGYQv4sL7lrzZGc/7ut
	 A3pj5TIiVklT/f0ZnkapTLfuQvrUV6jkhkdn7s1iOBi9simjQ+MTMtAeGU1j8bY0M3
	 SX5wFN+gH8Wb6V+t7uD42KfZcG7ATC2ccAPpCPFRD4Dwoy1mlUUNctMM3O2o0TFMGH
	 PFcF/GMd8+gy9WWxjbW/PKr9Vnxb3zM8EvHTELEzxeyDZvCvlZg4Iig7usrlxTyIMu
	 qLOdRKACmHNFoxBL4PDLwZtXRR/t1XnLSwZtscEdGIABC3U4jnSD17GOm3vRPc3hti
	 LyAlkJWd3IxhQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso192211266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:30:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4vjLllwovCRZa/X8VgjDWKUXl2LAtV2LFUs8xCbD4Uwk3mn1PpkOvjFGTz+CdY0D5TtIkiD94DhZvCtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k9NJz1u/waetCQrjGWQE0JKNmX5DAMc4YqNnpK05w+luCp9UW
	9QFp77i/sWw35QQGQiVEG5tyZGhcrm0Hb6DhlpQfkm+alfxA3zDlCAC3IyYOl8nwLz3W6PwQUDw
	YTbvZZfOnAGB399yLcbAPC9Fl+O3215k=
X-Received: by 2002:a17:906:eecd:b0:c2e:856:2a08 with SMTP id
 a640c23a62f3a-c4d3526c795mr325370466b.1.1794015041063; Fri, 06 Nov 2026
 17:30:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103171742.18816-1-icb@fastmail.org> <20261106190622.20990-1-mike.michalo@gmail.com>
In-Reply-To: <20261106190622.20990-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 7 Nov 2026 10:30:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
X-Gm-Features: AclHuK8VZnaqZe5JD4CPKW5EXtSrQjX4j2wGDqVOMh8T-yI_00m-J5FQFMMjg0U
Message-ID: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ksmbd: verify session setup requests before
 signing with their key
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: stfrench@microsoft.com, icb@fastmail.org, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, 
	lsahlber@redhat.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:06=E2=80=AFAM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> ksmbd signs some SESSION_SETUP and error responses with a session's key
> without having verified the request, which lets a peer that does not hold
> the key obtain signatures made with it. This series fixes those cases and
> makes ksmbd sign with the SMB 3.1.1 signing algorithm it negotiated.
>
> 1/4 verifies multichannel binding requests with the session signing key
>     (MS-SMB2 3.3.5.2.4), as reported by Ian Bridges.
> 2/4 keeps the negotiated SMB 3.1.1 signing algorithm instead of always
>     using AES-CMAC, and signs each key with its own algorithm.
> 3/4 verifies signed reauthentication requests and uses the channel key
>     for session setup on a bound channel. A reauthentication with a
>     forged signature used to get a response signed with the session key.
> 4/4 checks the MessageId and signature of a request before signing
>     STATUS_NETWORK_SESSION_EXPIRED, also reported by Ian Bridges.
>
> Changes since v1:
> - 1/4 is new: verify the signature of session binding requests, as
>   reported by Ian Bridges.
> - 2/4 (v1 1/2): reset the negotiated signing state on every NEGOTIATE;
>   Cc stable, since 3/4 depends on it.
> - 3/4 and 4/4 are new.
> - The AES-GMAC signing patch (v1 2/2) is dropped from this series and
>   will be posted separately.
>
> Testing, on a KASAN/lockdep UML kernel with ksmbd-tools: forged and
> replayed binding, reauthentication and expired-session requests, also
> inside compounds, get unsigned refusals with AES-CMAC and HMAC-SHA256;
> randomized requests against these paths and concurrent bind/reauth/
> logoff stress found no signed response to an unverified request and no
> KASAN or lockdep report; the Linux cifs client works with SMB 2.1 to
> 3.1.1, signed and encrypted; smbtorture's session, signing, I/O,
> compound, lock, oplock, lease, notify and ioctl suites give the same
> results as without the series. Ian Bridges also tested an earlier
> revision with his own probes and smbtorture. Not tested: Windows
> clients, and Kerberos expiry with a real KDC (it was emulated with a
> test-only change).
>
> An AI assistant was used to draft the patches and as an independent
> reviewer.
>
> Michail Andreas Michalopoulos (4):
>   ksmbd: verify the signature of session binding requests
>   ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
>   ksmbd: use the channel signing key for session setup on a bound
>     channel
>   ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED

Sashiko=E2=80=99s review mixes pre-existing issues with problems introduced=
 by
this series. I=E2=80=99m fine with addressing just the issues in patch 3/4 =
for
the next version. It would also be reasonable to extend this series
with separate patches fixing the pre-existing issues Sashiko found.

https://sashiko.dev/#/patchset/20261106190622.20990-1-mike.michalo%40gmail.=
com

Thanks.
