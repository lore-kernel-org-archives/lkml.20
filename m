Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104253;
	b=CbsST14dBdCbEssF4FYajxIPYdOWGvlqEhgkY0d8MKtNlNBHFtKhHHnEDJmfFkEC4rbn
	 axFBWVMpK2iY7vqwMD1GSicVX9VXDJ2NslSFLqWadqlMhdk5xaCiUElx+CCtOW9lbx11N
	 Bo0WByhoR3X9zo5ShNbJsaOA/fwYRJfWBvVRTKo7NwZ9ywdywKNAD5fx11oLG2mpmqLq4
	 AD2Su4qKCFH5tdPUYXI1JXX5755kQK+iCbR0Q6fGEZSJk5p5xZ95i8ZCAImYHnVSi+BuK
	 wujuNdQhGusUE9EAPtqSjt25GGp7oHFs/C/iaimn0rvXur7A3rXo3PkfbtowSPMXHAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104253;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=5xtAgPkupZ2Cx5ClqjBT9P/DniTi3I8J8PI81JNBZDY=;
	b=h2tfcazx91dIqEwIcWrwPwoW9fDiL7VG3NKbCuQKl8iUHJiVY5XmTDGHqrSjWJY6nM7+
	 6gdAv+6mLGbubfVcVJcLRok7Ppq/QghXSaPkkoiBRbXv2kftdSFT9P7vZZakibYAL8ekE
	 Y6HlS6U1DfqZVTA50efZlqZXI/r6aHoU73i3CcOodpfZcRmnBJEJdkBznLFVpR9bRiqre
	 p5QScC0VdfFAdsz4mqBwHn3sVVQb9Zd3AeCu6vOZ5XHPTijL1F16VpYoV1t5mPFNVLL1U
	 GECvV/ZmL1l2or7KdX3S6HVWGVyRLhPsl+q4VnjjIFf2wTSDAsI9eh+wfuQhlnAR1Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.16
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B03606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 8A049C0417;
	Sun,  8 Nov 2026 02:17:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 7D9BF6000A;
	Sun,  8 Nov 2026 02:17:29 +0000 (UTC)
Message-ID: <22778bf51435b9e03d2a18bba70abb729bc003f7.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Fix bad FILE_PATH_CHANGES on headers
From: Joe Perches <joe@perches.com>
To: =?ISO-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>, Andy
 Whitcroft	 <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 18:17:28 -0800
In-Reply-To: <20261107-checkpatch-file_path_changes-v1-1-8b11814560d8@google.com>
References: 
	<20261107-checkpatch-file_path_changes-v1-1-8b11814560d8@google.com>
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
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 7D9BF6000A
X-Stat-Signature: 3drr9nkazrsh9whkd5uzewekqata8rou
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/E+aZRfbPsnRwXQNgpkA/rKkpw1Jfp+z8=
X-HE-Tag: 1794104249-715167
X-HE-Meta: U2FsdGVkX18+/XjUP1X5UviHw4vkvfdHY7q6jZPQsn8KJsu95M/jaesdO6+G98ovsdUgmdWb1XD9jMixvKnRE+bSsH7IHTRpvVnvdBtc5uaiUCW8A5t+cMFeoZ/fZCgphIgIbavQ4PKGsswFEkxIgq1srN8H0EYZGN6AlVwLjOocr01DmfiXV3ssJHCV0d783wNBE325O/itobMM8S5jdI+ObQ65JVOZRg2A1JOpUkF2c/arrG6GHrOH0maN01J4iYWOqplrqp73W0JrPZYnEMgCgFygvehkOqlWIi+In1MJXsBclUO/qLLzppMGPp4rgbgbNZE3CQ6CaefrxHvU5S95KWjaGwBnlEQii6b7UL5Aj2zybAgTra+LDgdLgEtCkZEFJ/kn7lpb9K3VNfnjfA==

On Sat, 2026-11-07 at 16:02 +0100, Pierre-Cl=C3=A9ment Tosi wrote:
> The FILE_PATH_CHANGES warning ("added, moved or deleted file(s), does
> MAINTAINERS need updating?") added by commit 13f1937ef339 ("checkpatch:
> emit a warning on file add/move/delete") was guarded by !$in_commit_log
> so that commit message lines would not be mistaken for diffstat or diff
> header lines.
>=20
> However, it was still evaluated on the initial email header lines
> ($in_header_lines =3D=3D 1) such that a title using the rename notation e=
.g.
>=20
>     Subject: [PATCH] foo: rework bar_{get=3D>set}_baz()
>=20
> triggers a false-positive warning. Furthermore, that same (wrong) code
> path sets $is_patch prematurely.

cute.  Thanks again.

Acked-by: Joe Perches <joe@perches.com>

>=20
> Instead, only test for FILE_PATH_CHANGES when !$in_header_lines.
>=20
> Fixes: 13f1937ef339 ("checkpatch: emit a warning on file add/move/delete"=
)
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b8b64f720191..03e3e4b72cdd 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3481,7 +3481,7 @@ sub process {
>  		}
> =20
>  # Check for added, moved or deleted files
> -		if (!$reported_maintainer_file && !$in_commit_log &&
> +		if (!$reported_maintainer_file && !$in_commit_log && !$in_header_lines=
 &&
>  		    ($line =3D~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
>  		     $line =3D~ /^rename (?:from|to) [\w\/\.\-]+\s*$/ ||
>  		     ($line =3D~ /\{\s*([\w\/\.\-]*)\s*\=3D\>\s*([\w\/\.\-]*)\s*\}/ &&
>=20
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-checkpatch-file_path_changes-ac920c85bc7e
>=20
> Best regards,
