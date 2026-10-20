Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519355;
	b=TejGSACFFKdLA+TH5spJ/bc/kEEu6q3uZln+KAOCAJidOKqcAHxqahU5KXOKzerJN6an
	 qT0VkStUtNAFMfpiPbKwZDGsPBuXEs+PjL6mUOYwd8k46z5hIFRLC9tJBo6kHSX8TMeCG
	 wfmG9F2T2QoNlMzt4TtEHZPskcu9H7MsynKBbJUrKA2Jo6eUbrh81Pigrp6L3yOXbt2eo
	 D+2yD7hGlYc2DCVaT1PPXNOLhWTmXpNNNlpHwP13jzV0jDefCu5OqodVcQIcLuLO8VJKb
	 3BKPmMP0ff+/mlpqoR92fzAiW/atlAqJ4nVCcCntvIKW5bh/Ue/yBIrCufAk++7NBfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519355;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=JsIf75pgBfXgz3QM+D4kRHPKjGuwSu8RptO+WiIEYR8=;
	b=OC0jTUSRJWkkayMauL9LlD7pEqeoIXFEQb15jfMnmM0NQHEn8CDWawcKkO7UhAwioRME
	 +zl5/mPUnrhQO6Wm196cLnbcw5OG9ekN9WgqS5OPLP12yhjhe6MRKElZvvfoBa7Mo2PZL
	 chcmnGywBcBJtP1M2k6IkztEAK5QXpVPJfLlOtxunqyRE5y3Eg8haJEUrf9BEwr/we+zh
	 AdYHrbLGVVXHc1jvrZEe3lI2CFWmJb/AJP8IulKkwdYs+OMp9JcWHN3RJjXUNhLDufKH8
	 2YpcwQN6v8WanzWnSi+WGTq7A1/6BDad1egfQWK9be2qYYs5qjfaX0g3SCae+j8Ly/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=bi2CSdGl;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436EC606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436EC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=bi2CSdGl
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id E52651A0347;
	Tue, 20 Oct 2026 18:02:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 4B0E918;
	Tue, 20 Oct 2026 18:02:31 +0000 (UTC)
Date: Tue, 20 Oct 2026 14:02:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)" <ricardo@marliere.net>
Cc: John Hawley <warthog9@eaglescrag.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ktest: Accept quoted bad term in git bisect output
Message-ID: <20261020140229.41edd7bc@gandalf.local.home>
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
X-Stat-Signature: wmq14fqd119mg7stc8a4mra1zztjszf6
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 4B0E918
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18h+EinY2gdEiYIaT49VcDShNHge0izcpg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=JsIf75pgBfXgz3QM+D4kRHPKjGuwSu8RptO+WiIEYR8=; b=bi2CSdGllEFJ+VRmWXR3y/Ub8Bo2jqMPb122vY33mMixEpzhLUp3HfSwfYCcEBZXJQRMRPAfZnQzo07IdtnF8reUzghYotkfpHGLsLZuRqg1vEnk42SJlr+xPhrjMG9W4ExcYHJiKmkbCHrYmatdK1oHugwbxmoR4B8w/mgtcBM=
X-HE-Tag: 1792519351-803413
X-HE-Meta: U2FsdGVkX19YYyMBcaLHAf9eNjoyuVaHip4m+jK2YCPCwDofsPMiv/WNRQnBTeW6Fv7b8VdAOAjhoaw1YSm6RxilplDHQ7Z3uCmOQJSjb4ARA8BD9R9lyjrpE/1cLuSlry8jFoLtIO3jFX1ZjN2pE5bkPgYcXDWoXjmwRregkG9afCXFBNghcPQVtvT9nkhWJC1aSWP/EYs/nQ4FYL+JcZcJgyX4abMwNNFwoPWKPiKPJfWiXlqLPQo6Mb35H1YLi3JOtqq/DAhXPEAQTl2PTTtXTknY9s5COZ31O8vGKnnPK9lDWubS0vxsaEEEtA37xfW8/VlTxT9gNgV5B53uVIBSMFsW0TDq/F/PSzsOszK//UC2Xjo0qgSr40Y+yQW8L6KF3Ucv1IXfSxYBd+PePA==

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

Thanks for this fix.

I think we need to let the git folks know that the output is being used by
other tooling so they don't change messages so easily.

I'll go and do that.

-- Steve


>=20
> Link: https://git.kernel.org/pub/scm/git/git.git/commit/?id=3D0c0f93e7fa6=
45c1058226a9bfde9e2b4441edf96
> Assisted-by: LLM
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

