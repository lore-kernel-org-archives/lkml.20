Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635868;
	b=Pj4vqlskuiexuXrKfELOQo6GZOAtBoFt+4Fb3bPYkPxux8r7EDrkVXCmGMJfQbztBZq/
	 EvalJlizGr7ml4VLNxCQQEqOraNY9xeuk2OEgCLAfz69ReqD9RlRJWz4EFGgVkqXPeaUs
	 FTk8lof2peflTURSUcvwVEEhYL/91TGDVx7oqTtqolvJRL5QRDSNlOIFCJSCIqmHVl7hQ
	 kNaiPw7YfJ41sJf86BCXA7Rt7wvSFE2h3iJKv5ZAjzv7RYg3v24bLVSAnCkxSkJXRGF/w
	 t+UQUPgcjJh0DQSVWvzoOjQKRGR6YMRiTlWif5tGstHnoq20WAvRu1nrMvjxeDKI8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635868;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=X28oczi+F+vGEpsz5GVItgUa0wPWN4NmUVCpkERcWI4=;
	b=IMYWKLCFmEoEruFwVVOuM0+LqmqcK5eneaVYWcEticgPdyxppqXLulqpY084p9y3LkKm
	 wA1uRMc+qoymBb8vTFUHp8/J6l8ONPt8cWKseXAefDI6SyJEhutM6ws7D1kj0C6fGtkd/
	 Yu9Egv6yYp6XOX6j5dqDaYD4dAadbDQiZw/zaw2+t/l7NvJJQccbBv5uqsKvcqugpDp6J
	 PS8KgQIsQsgr6ieaLH6h9dUtlvRIGy9UIO0AJAsyap6q9CHLK5tVt5mRYH7WLlI/0T//t
	 6CZG/i+w/pW9lL9QuyCc4sIPF9sdkHTU/r+EfyFH0gOvPBwEXlon5iw1tsh1a0X3+Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEBF6070D9B;
	Mon,  2 Nov 2026 16:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEBF6070D9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E850A40196;
	Mon,  2 Nov 2026 16:11:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 4C42D60010;
	Mon,  2 Nov 2026 16:10:58 +0000 (UTC)
Message-ID: <762ca14700309938ddd1b8ecb1a8767fb07b719c.camel@perches.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
From: Joe Perches <joe@perches.com>
To: Jonathan Corbet <corbet@lwn.net>, David Laight
	 <david.laight.linux@gmail.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev	
 <konstantin@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga	 <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao	 <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi	 <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu	 <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan	 <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu	
 <petr.pavlu@suse.com>
Date: Mon, 02 Nov 2026 08:10:57 -0800
In-Reply-To: <87wlqvdylf.fsf@trenco.lwn.net>
References: 
	<20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	 <20261102093206.50b6c9ad@pumpkin>
	 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	 <87a4nrfgjm.fsf@trenco.lwn.net> <20261102150535.6c5689f6@pumpkin>
	 <87wlqvdylf.fsf@trenco.lwn.net>
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
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 4C42D60010
X-Stat-Signature: c9desiqg1e34kuhmf14u7jfd9aexambj
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18Cj6feQ99XY7tmbKPJx3vh8h+4f33qIiY=
X-HE-Tag: 1793635858-467334
X-HE-Meta: U2FsdGVkX1/9XdC3odTKp74ltKxRmZNqV71GkwUkLjTzqRqcMWFoHgmc+/jzDzVC8VtFojVZ409lCBkL8SNEPpuRp2qN3Zfvfrafe9ATp9NjN7HTL17AiMEHcUSdN/oy7LEd1Kf3luaDMOrQuyDquAaOdkxSgfMouHWmH+hGuD6O2r3288CrNyOPa1zJd9BMOfO3vslDy+cn+v19fmXTsSVW2VB+9LYPwjiQCQV1hvFuoiRue/FYEwC6lq7JrFiqzQTi9zoxtA5LrJX+TT02+wA/KbH2SfChtDazA3T47g4Q+CsxmqVZlcYgs6eIxWvY

On Mon, 2026-11-02 at 08:47 -0700, Jonathan Corbet wrote:
> In truth...public-inbox is quite nice for the searching part of things;
> I tend to use that rather than going into the email stream directly.

I gave up on lkml after searching lore became reliable
several years ago.

What might be useful is something on lore/vger to be
able to match keyword searches similar to a finger like
registry and get forwarded threads that match.

Another possibility might be:

MAINTAINERS/get_maintainers is public and requires
senders generating the correct mailto: entries.

Maybe undo that and make lore/vger create all the
to/cc entries using a single kernel mailing address.

And if the received email by lore/vger already
has the suggested entries, don't duplicate it.
