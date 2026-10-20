Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511234;
	b=hm6nDcpdHvoO3VhIuS8O4cX+qlcZC81vIwlmFccO7Y1Vwgi9wv9Yg09XXHN1FcpyWhjl
	 EEQ5KDDdPOAXfYJhUCgOWkYolqKxR/ieu/4vCXKQjQVWg8m2gRw+LRzpgI5VLhPMgtjTg
	 Hug4gNEPM1v7Zf7S942w0qFXJLstA4eLIS05Vi8mJ3Wxf72NPT9TSAeD2lUzZ8q2mdEL9
	 f1b6z89Ihy+3nWvykqtBfPrMHxaDS+5OfmN6bbdmwJbGSfJxvLHp4jgNXVBUHHGPtbUfa
	 kaK5MzIaY7naTSa3D5SNxdp3r5zRnN9XOTrieKYjYrUGwHS4l8j73ehzgtfZetLUSbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511234;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=tsupAq6qhLg8WJSXIbsSaCVk68CgY4BZHyXeD2ZMBNc=;
	b=E76OoZy9JXJLt7K+nGXsbxmhyStVBkBxPYBDfkXUdv/eSwDgSAtzBMYoqrMPc/Fd8B+Z
	 TJvPDUj4kjzyLfN6j1zLhrE/FPivHNd9OlNftenq1yxOjIr4O7xWzbsITWX8RaBFjry4n
	 OpwFEm6Q5/WsbK9C2jzjWXGncJ589EUXDOevscrD/+FAHwMH7bAicw3DIYtjnYEJeApGL
	 FuLgKTuWiVPN6UR1m7f1qu7PppdoKABWZ31JLuA5QecDIg6UYf0KA/euLjbAidvScm3wh
	 Ecc5VOUpS/sUDwJWI1pBYYSp/fnP7uvYsKUkXZt6BsNeYJopAgH5IiUWZkIrjlGO1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F67606A31E;
	Tue, 20 Oct 2026 15:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F67606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 095DEA7953;
	Tue, 20 Oct 2026 15:47:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 2CFFA20029;
	Tue, 20 Oct 2026 15:47:02 +0000 (UTC)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 08:47:01 -0700
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu
 <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] get_maintainer: only use THE REST as a fallback
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-1-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-1-162aea473488@linuxfoundation.org>
Message-ID: <88c5be32a371b5d73561a82a63426485@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 2CFFA20029
X-Stat-Signature: bz4xqp5u8abfxisp871g1znyofcfmi9u
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/6wHbnWvehosGk4WnohLoBoJEcwQg6gF4=
X-HE-Tag: 1792511222-306555
X-HE-Meta: U2FsdGVkX18z46lUSyMC9X2wSkcGybrf+XXoMvrjgb8sHEHpoPWzP/WnY/jZaiHP4MUYj6ujh8Or8HbklEffRvcOlfVQtxkwnS4kb0KdRvwuGzPwu3eTdEIR+19rjgWPoouLOqoXEVZMUb5CCLA0qXbUGLkI0n7HpmaViAmXAN9somwZvyE2lu55aoXkN7+QPalCNcdLaDGXw5JRkaz++QvFzWReXxIp6IEjL+SB2JYMK8ee2ZWwdcjV6B1xJEfItNuGHpP9Fk4kZcnJq9gxKS3BC6yv2lhsuMNuD1rXkYD8RYuFwv/bIiga85tbzaHbsFuoJLsFXnYtCzLHfk9ul9NsNPfiLF8DwDetcrBuLoA=

On 2026-10-20 08:35, Konstantin Ryabitsev wrote:
> THE REST matches every file in the tree via "F: *" and "F: */", so
> get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
> patch, regardless of whether the touched files already belong to a
> subsystem with its own mailing list.
> 
> Only add THE REST for a file when no other matching section provides a
> mailing list that get_maintainer.pl would actually output. Lists marked
> "subscribers-only" are omitted unless --s is given, and lists marked
> "moderated" are omitted with --no-moderated, so such lists don't count
> as a destination in those cases. Files that match no section, or only
> sections without such a list, still fall back to THE REST, so every
> patch keeps reaching at least one known-public mailing list.
> 
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---

I don't disagree that this is useful but v2: no changelog

Perhaps there's a simpler and more generic mechanism.  I'll play with it 
for a couple days.
