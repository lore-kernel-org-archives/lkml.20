Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520271;
	b=17e2nScqVMAOPCoOZttiw7hI1p14vQ6WXjI8YHgNC445zExIHpCUmWUa9Ot44yr2HN7G
	 O7K3YNDT7gt3mGXFRUJ0zyzDh5k1T8OKhNrP+T8k6JOHlD0Pk+yUEasrhGzSNSZzXE5Ml
	 W8yUmrA9SbS8Tiflvm7bP6MsaUfJiUfbQBxZUdDeBLGq4dOd03sWMZ19SGXnsRK8xf6sf
	 qjo5MahkoyCP95FPymq9PScKT4sRk2Xjpfyf6jfuDJUjz94O5rdGRRadb0kDB3zE7tNGy
	 QKeU+PCXR7lIqqumUXsv3zz6ZW3vCbClFvfEG9RFd06KMprxxZWFY6cE09fgv6RP/jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520271;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=6HAfQcAu0vvl0UM7BFrEXCErJNjX1Cztu9ag76aJxVQ=;
	b=MAGDdV7ouaCg+zDmTdj3K4focFehqJUtL0+3W7Ci8Jz4QXcxghQfjjRm1+Q3SzElkkTj
	 lT67WkEYGQr5phGhKWrdGeyeSgomCcKcOgsAwFT8xqFrKq1SkspUY8cqtrfOJuHvJhM1p
	 cl6EZJ0q7fnhFzCwJHaCAavJtN070ZBco5n/zvOOYhQ4sdPYQXKTuFaWysIN683mGK2Ur
	 f/9f6bigtLg9Nh0g6QTcpr9r81RgZTVfRNTQXODuhwV7IXrhuGmK3zRo4Bv4MjmZMn/8x
	 Qauyu8CrlvIszCzbXgnfi1bj3hdwiB1MeFaTuP3l/2bWZaA5D5YoUFLNSa2Gj9ToyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=VOWd+wUP;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEDD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=VOWd+wUP
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 1A688A035C;
	Tue, 20 Oct 2026 18:17:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 7A70C20016;
	Tue, 20 Oct 2026 18:17:47 +0000 (UTC)
Date: Tue, 20 Oct 2026 14:17:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)" <ricardo@marliere.net>
Cc: John Hawley <warthog9@eaglescrag.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ktest: Accept quoted bad term in git bisect output
Message-ID: <20261020141746.187f15d5@gandalf.local.home>
In-Reply-To: <20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net>
References: <20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 7A70C20016
X-Stat-Signature: o74beuzt9btyo69sbuuk4mu5bcuche7k
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//M4gQdEG4DWxkhYDYUqKqt/TUjzGry88=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=6HAfQcAu0vvl0UM7BFrEXCErJNjX1Cztu9ag76aJxVQ=; b=VOWd+wUPNJhaavzvTFnoZ/nMXR5yLRyKBsBJtJdwLSiyEgw0YIW/JpTAQM9OvqL/vH9SCJwnUfgXHH4gWZcu1zwdaFn0bJo9R8l7NDULfKlilR9X5veeravHZ2I2d4Nr5mJaXOl/nHEG931a9YXXaaRB/IQjPdwXFzDNLfyJJQc=
X-HE-Tag: 1792520267-95416
X-HE-Meta: U2FsdGVkX19H8g8Epk0Qhs9et2piykOnM5NmWkHUTIdl+xwvwKOkm5GP+r9sGj/RmygN6/MnFk1wEARTcilNfvswUerYZCYfMB+SxF8Gs3uApHWAGgh8nF5XSfZOT173pdW1MT1Cgac2VUrUsMcIL9cvlu6GiNHUUcr6KAse3eaBTn8i7b4Kgm1O80PYz52y28TQmbavVSWS0TJPEqkC92Hz3yHQNOINGr/sVEueuze19sd9gx8+t/QECjD5o/a3GJp21p6hF7P0H3RIsdzpn8nb8qNAOCPC5BL6K5tp/IR0VvLCJyGaVhwBHGDR7Xo6X25DBNkiFY38IxBolCD7dBvwlBbHsETqPN2mNZE1yYgbG8JYNS6XUMz4RUDYNqCZHn2BHb4eaDBzI75m6nXqsA==

On Fri, 09 Oct 2026 22:13:23 -0300
Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net> wrote:

> Git commit 0c0f93e7fa64 ("bisect: print bisect terms in single quotes")
> changed the completion message to put single quotes around the bisect ter=
m.
> run_git_bisect() only recognizes "is the first bad commit", so it misses
> completion and continues the bisect loop with newer Git.
>=20
> Accept both quoted and unquoted forms to retain compatibility with older
> Git versions.
>=20
> Link: https://git.kernel.org/pub/scm/git/git.git/commit/?id=3D0c0f93e7fa6=
45c1058226a9bfde9e2b4441edf96
> Assisted-by: LLM

I'm guessing you let an LLM fix this?

> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>
> ---
>  tools/testing/ktest/ktest.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
> index f94ed2e98887..9d63a1dcdb3e 100755
> --- a/tools/testing/ktest/ktest.pl
> +++ b/tools/testing/ktest/ktest.pl
> @@ -3019,7 +3019,7 @@ sub run_git_bisect {
>      doprint "SUCCESS\n";
>      if ($output =3D~ m/^(Bisecting: .*\(roughly \d+ steps?\))\s+\[([[:xd=
igit:]]+)\]/) {
>  	doprint "$1 [$2]\n";
> -    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first bad commit/) {
> +    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first (?:bad|'bad') =
commit/) {

Please nuke the "?:" from the above. It's not needed and I never use it. It
only makes the code more complex. Yes, it's because we don't care about
saving what is in the "()", but I never remember how to do that and thus I
never do. The perl code in ktest.pl is meant to be easy to read by those
that know sed and C, and things like this just make it hard to understand.

Thanks,

-- Steve



>  	$bisect_bad_commit =3D $1;
>  	doprint "Found bad commit... $1\n";
>  	return 0;
>=20
> ---
> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> change-id: 20261009-ktest-git-bisect-a894f472843e
>=20
> Best regards,
> -- =20
> Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>

