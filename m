Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288706;
	b=ofHTgQn01/H2o5Yy05puF8xqB1VWLByZmtSFnP6Xpa4rMnMHpm1cLnB7eL0qNnMIhwje
	 4sNtDbGy1Ebqb7QEwXG/spdPFO1qDpwDVQPCLf7PuNnO9VzfNWgCAMHyMz4ZZ3B+zIsky
	 St6rk3UbQwhZ74ytGtp9Lu2XWZ5VOcLZAeHV1v6pXJgsnsAhI4dyxqZqLohhzRgkJ0aWD
	 UsHVnTWkujpqwiuBLn7J2n4ec4pV4BuqhFA8Nl0V+f08pmBgLkSJ424QEHaLahk5yQ+YF
	 WBRNziwsUJqOsQSVE6kV/voxSWdzpM1pkDHkKypLG5JPTMAdxsRPzMyvuXAc4PHX5qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288706;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v4N6CEsUv8RrVUeKKYOn2SlTG3d00sO7azLy5/TrcQ0=;
	b=5eRHj0AW/w3r+Jfy25cwoMt94IUsKNPz6GKg19/TWSlJqRy+Z6Gshq1EM4589OT1aI+G
	 TJc32p7FiI0Pws287P2ABwr2hfTIbd2e1v9kWQopO1gYOtzvS6L3sdzDMMIvBrJFrl8TL
	 hsvPniVn/Z4lX/hrOBl40ABPS+l2F1x+4+3vcwEWT3ecOByNuEP0mMjVZ0c9d8e/MADKf
	 MbWuim3LwcQbg3lxqF38+ecz7n7WdxbJxX+ZBoEc3fwfHstLcJd9PTTNHvaGyMR+xkSwU
	 7nEfWB+Iv7bx0XAgWrZKvlPkvJKx3+48HjLhJDdIf+AvlcTFJ03o8B+660o2yDGuX9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loPadRfd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B64606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loPadRfd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57601F008A5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794288705;
	bh=v4N6CEsUv8RrVUeKKYOn2SlTG3d00sO7azLy5/TrcQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=loPadRfdjOi8S1VAyFya2up5v9Qwgo3NrNbfFnzSpJGwHO6+00k31kXRHnBvW4i4b
	 csWZpo8GiRr8sBmXlThkF8aPEEVxwJWEO3eMjLRo7SHybFnbNFLwvGvkfBhc3taMMG
	 aiGV/cx5pCO8e3nnqLrsnq8fRqaz5oRAo1xzUP7l4mOOiymbMRZ5o/p4GabY037D69
	 7u3LLaBwraIYvoA69QxZEYJFcrf5xSyyEUNVw0aW+vPKl5JgXJLqkkSzIKfyi6G/wp
	 tgXb+zdU6hVR+e+Yq66ZZBmzgWnpEefYmBxSzFUweRGHv//dNvSdZGjahEUHieBHlx
	 h+xUddk5Y2yVA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c411e139259so39490966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:31:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH1/VEai9gVLB442ipebinHzYkIVfRWeGh8MNNGif3kSxBepzE1c/uQ9cYJTvGjeJ+cTcl4LQ57EdetV3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/p0Ch/QGoR/X4C+C158B26bf/LV3hKh7KzA68StJgUgW2XLB4
	XkG0daGDrm3qFTXOSd20rEhqM0digekeK7XCOWQJNm+dCEWXMxiGWUiJoFESsVcqMv+sAZ/zl1J
	rYq84JhgUzKPnk/Ob9FAt90fvTXrkrj8=
X-Received: by 2002:a17:907:e915:b0:c4d:456c:4a29 with SMTP id
 a640c23a62f3a-c5049582a21mr102830766b.14.1794288704427; Mon, 09 Nov 2026
 21:31:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793168155.git.jan.koester@tuxist.de>
In-Reply-To: <cover.1793168155.git.jan.koester@tuxist.de>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 14:31:31 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-LSxEBXu2P6S1PGid2rzzWELcCncP02guz6zMGkZc5VQ@mail.gmail.com>
X-Gm-Features: AclHuK8YWklN2zsAN-HLO_wYWczPvjiJgKOTtoFW1cA9jTP6jMIMdI7Sxp3hAVs
Message-ID: <CAKYAXd-LSxEBXu2P6S1PGid2rzzWELcCncP02guz6zMGkZc5VQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] ksmbd: Windows SIDs for user and group ids
To: Jan Koester <jan.koester@tuxist.de>
Cc: Steve French <smfrench@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Christian Brauner <brauner@kernel.org>, linux-cifs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:20=E2=80=AFPM Jan Koester <jan.koester@tuxist.de>=
 wrote:
>
> Hi,
Hi Jan,
>
> Windows names owners and ACL entries by SID; for a domain account that
> is its objectSid. ksmbd shows a file's owner, group and POSIX ACL
> entries as S-1-22 SIDs or as its server domain SID + uid, which a
> Windows client can't relate to the domain's accounts, and a SID a client
> sets for a domain account doesn't map back to an id at all. This series
> lets user space, which knows the directory, translate between ids and
> SIDs in both directions, for accounts that are logged in or not.
>
> It applies on top of the UUID/GUID id RFC (uid_r v2,
How is the uid_r RFC going? This series is based on it, so I would
like to know its current status and what you plan to do next with it.

> The user space side is sharedd (FenrirOS' ksmbd user space) with
> adconnect for the directory lookups. Tested in a VM against a directory
> server: owner and group of accounts that aren't logged in, ownership and
> group changes, DACL round trips, a session getting access only through
> a nested group, inherited CREATOR OWNER ACEs, and the directory going
> away (cached mappings stay, new ones fail cleanly).
>
> Questions:
> - Is a netlink round trip per uncached id acceptable here, or would you
>   rather have user space push the mappings of a session's ids at login
>   only? The latter can't cover owners that aren't logged in.
On-demand lookup on a cache miss looks right to me. ksmbd kernel
should cache the results as proposed and query userspace again only
when an entry expires or is not cached. Loading all mappings up front
does not scale well and is difficult to keep current.

> - compare_sids() matches a SID against any prefix of it; the token uses
>   an exact comparison. Should the existing callers move to that too?
Please don't change the existing callers. Some of them rely on prefix
matching on purpose. If exact comparison is needed, add an exact-match
helper and convert only the relevant callers.

Thanks.
