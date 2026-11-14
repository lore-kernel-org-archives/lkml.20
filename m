Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625206;
	b=wS+Wg2J6q8aDOdJ/Nov7abI+wLKoxjTaK7IwQ9Hh8AO83ZYAiQP9XWz4ZfzloLkXEV9C
	 S8WaD5NvKz7cXaRAWIPXAy6SKu34wDg2VHhNSqgfiaayCZS6s3uTQJuR0viXW2WFdeuqJ
	 gpidRtHfoh5aKZBJq0qLxGrlOOihliq5JLLugXekgCTgmExwLY9h/arbk59uq9DWhswP9
	 hgTU7E/h7pSaiVeBnmSX6VJW0VM+sxGHM4WcJl+7HVkhMksPBJJdF8s3laPl7QKn2S870
	 vKdiKoClcC5i9QJ2MOVErZ4n458y9JrpklCB/jjJEoK+mnRUGAGXfxzdggWIKhDs8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625206;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Stat-Signature:X-Spam-Status:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=WsxmtasgHn+rLFrgfZMYWZhQC4nsE6W6yf8UdmqOI34=;
	b=AEzhjc0Zd1OCN75sCecovwVmzms4y1S6sgiF8Yz1G1cq58f5ZQMTW21YmkWr8rIFs1PD
	 o5bjX/O2Y8SN+X0TPePX6MSyb5dd/GZHr1x4O1yZAHaTUbDnSQdpcHbFJoKoWW9fRwsbK
	 9Q75uxSvjKLbgB5988gIy+ZL6I9CdNPnB/Quq1JtCrwo5hQKREWloyJCCDy5x4whfVU99
	 8y0DcZlu84znKqBnr7yShT+f/mFGEBRZ84PjTgyPYzWuQHDKN8jMdLyrkxfd4T2e9lBg5
	 ZBXYaeVN83HCnomEXaPHQLwyncBv6y2dMrsIVeeNrZ2F1H/ebdQscM27K8oPmhXdkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD1606A333;
	Sat, 14 Nov 2026 03:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBD1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id C625D1C3703;
	Sat, 14 Nov 2026 02:59:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id C438635;
	Sat, 14 Nov 2026 02:59:51 +0000 (UTC)
Message-ID: <0825b89ca1dfe1ff20090d6dfdbb725b3f471d65.camel@perches.com>
Subject: Re: [PATCH v3 0/2] get_maintainer: stop sending every patch to LKML
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	 <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga	
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao	 <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi	 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu	 <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
	 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu	 <petr.pavlu@suse.com>
Date: Fri, 13 Nov 2026 18:59:50 -0800
In-Reply-To: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
References: 
	<20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Stat-Signature: uesi7ztwu83iiswwb6pand4mfcmwjj1h
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: C438635
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+6NHpTOHwTqCWQMecoVQo8fJF1L+ARTnk=
X-HE-Tag: 1794625191-458765
X-HE-Meta: U2FsdGVkX1/QgI0mXdWtyZA/tOUBzeC4z/uv0t/VhETSCpgoCZpVtgOnRfnwPHruUeZTBt4PKLY29DvolfIW60bUCX7wEVxEzm9vetqrDcrjacHoy2haP60bgj7Xh3gHj1xYodj0tp2FDU4hubfG4FQlrP7E+h4yKkNtLYkBEpmDSxi/neJUsdUOB09qtC78jsAf9cbv4EGtRI1QdnX//E9kfmU3zd4GfWZxzOW9BB6eNVmvxT5xpIlXR9oK5RRTJVBC2VteONauIsYy0LUg5JF+by1K7JlS9H13mNV/2AgamU+DxL3JUqCjI6uRE6yu5eWOabCWWYM+jHUF+cmh0Nj5hfqZL/UYLMWsEhEuXluLniiBu0kRdLtjUwg2gPrUaAxbHytgLHCFAK5TjCLAZDqvHmOxVzsrr3aDfaGlFyWWtfwBe26mY4ou3Pr/6mNLZVQE4eHonBNjlsD5xt8y8aFjxHFFSJ8eHNa2JJUJvfo=

On Fri, 2026-11-13 at 18:02 -0500, Konstantin Ryabitsev wrote:
> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:

Andrew can you please get this upstream?

>=20
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.
>=20
> This problem is becoming urgent and untenable. The increased volume of
> patches sent using AI tooling has resulted in dramatically higher
> delivery queues and if this change is not implemented, we will have to
> start force-unsubscribing addresses that do not show any developer
> activity or use similar drastic measures.
>=20
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
>=20
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.
>=20
> Several v1 reviewers asked for a catch-all list that would keep carrying
> every patch for those who want to follow all kernel development. That
> is a worthwhile discussion, but it is separate from this series, which
> only restores THE REST to its original role.
>=20
> Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
> and zh_TW versions of submitting-patches.rst carry the same "send every
> patch to LKML" advice and will need a follow-up update once the English
> text is settled.
>=20
> ---
> Changes in v3:
> - Rebased on v7.4-rc2
> - Update the cover to specify that this is urgent
> - Link to v2: https://patch.msgid.link/20261020-get-maintainer-the-rest-f=
allback-v2-0-162aea473488@linuxfoundation.org
>=20
> Changes in v2:
> - Don't count subscribers-only lists (or moderated lists with
>   --no-moderated) as a destination, since get_maintainer.pl doesn't
>   output them; v1 sent patches to e.g. fs/squashfs/ to no list at all
> - Add submitting-patches.rst update describing LKML as the list of last
>   resort (Petr Pavlu)
> - Rebase on v7.3
> - Link to v1: https://patch.msgid.link/20261008-get-maintainer-the-rest-f=
allback-v1-1-7d26d0b7aa34@linuxfoundation.org
>=20
> ---
> Konstantin Ryabitsev (2):
>       get_maintainer: only use THE REST as a fallback
>       docs: submitting-patches: make LKML a list of last resort again
>=20
>  Documentation/process/submitting-patches.rst |  9 ++++--
>  scripts/get_maintainer.pl                    | 43 ++++++++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
>=20
> Best regards,
> -- =20
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>
