Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044716;
	b=kuqXvR7lhps1uYLasBlWIpMyR2LZVTpUDs603jL0zuJbEN92R5qqu+8U7XPNKN5hZGi/
	 oQF2+DHX7NN201EzgZ4Nf/EhzCZJrLWm7hpATpggmrH5+ZCxYMKgBi51I7M5adxBdEn7V
	 YwlqE+ilV6WScwXDzm+HGDCK1K6Cp02tNTja7J5DzCv5GIyjyuKJMla6zRizbuEIKxKTJ
	 W25BQb5G9f4Dc+OiBWOtg5gq2qmv8cxkab9mEYHfDBFXLpQqZnZmw4GWwfB/6MaRZ1ao4
	 AoxJpEtpdfo+t9gZoj14NQzrfZB7QA8VdEdDAgtOKh8D42C8gEhqHNwakza1S1ToaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044716;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8oQQEPuk1NTHYZLi+ImL9mMga660e3LtdhEYo097KqI=;
	b=UHfe7CfURKc9NrwFZMOi0q8iEp3boxXryxcWy9igKgYdJTSJjiPo4UovSRNTnL+zdRXW
	 vbnJ0cLcN8YqMQEl3KBTswaw2V2oQA+Vj9/V6ghNPmhiUA4j0iCjlyihNvxeNbkMPqiyU
	 Q7hoiykO3yusSEfu8414B5uXZf4Vl1caMAipPxY/xLVuKjWGTgqcjaPMGDbOCsiWmZ4ib
	 eWU6wJLjcz7Ful2H84zM0xTb+JHm9Zb/lDUN9a1oYekjRVdAIbj1w2W19itlCuNh8losw
	 qvmZ9VRgOj5xvpe/fjgOFlySKbra0itv2YrPwfXK6119Zv3taS2YklpTUs+xUngirTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b="lx3U22/6";
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36085606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36085606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=lx3U22/6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1793044714;
 bh=8oQQEPuk1NTHYZLi+ImL9mMga660e3LtdhEYo097KqI=;
 b=lx3U22/6KpEcfSfRjoLyKfx2XLDBbXzkPwkNFbtjCH80X1TwXTP2HbRJCmpVGUVYwN5p9J5Cq
 +TjdwKECFeZuRM2g5pjFDUnuSZbS9WIEZSl2DJAenJ5NIFCEX2lx3Z36+jTi1XGk5CGRKk3EGMX
 Mxy7okSEzxsJwChkExHHih0XrXeV4p9lfy2xg35e4aRqeCMIHlbvU1LyknuuAGx9DWkNJaZkmKv
 cWieHvJwnSQEnYBeZgkc8H8lfkoiDizQAlwKX8LEmYu5RpyR9PF5ixCwEpOF8gAJ9kfO9UDHNmZ
 WyUR1nWeHskOdXsCr9j7a31hl71Rp4x1F0oSYDbmI9aw==
X-Forward-Email-ID: 6adfb0e90cf61007ac583759
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.18.11
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 26 Oct 2026 15:58:31 -0400
Message-Id: <DMF1AWYEDTHK.24FYL2IMFUQBX@ubuntu.com>
Cc: <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
 <federico.vaga@vaga.pv.it>, <apw@canonical.com>, <joe@perches.com>,
 <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20261009083137.3-1-sashal@kernel.org>
In-Reply-To: <20261009083137.3-1-sashal@kernel.org>

On Fri Oct 9, 2026 at 4:31 AM EDT, Sasha Levin wrote:
> The Maintainers Summit reached consensus to deprecate the Assisted-by
> tag. Remove the documentation requiring it.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/process/coding-assistants.rst   | 21 +------------------
>  Documentation/process/submitting-patches.rst  | 10 ---------
>  .../it_IT/process/submitting-patches.rst      | 10 ---------
>  scripts/checkpatch.pl                         | 11 ----------
>  4 files changed, 1 insertion(+), 51 deletions(-)
>
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/=
process/coding-assistants.rst
> index 051f0d819f68e..509dbf23a099b 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -40,24 +40,6 @@ is responsible for:
>  * Adding their own Signed-off-by tag to certify the DCO
>  * Taking full responsibility for the contribution
> =20
> -Attribution
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -When AI tools contribute to kernel development, proper attribution
> -helps track the evolving role of AI in the development process.
> -Contributions should include an Assisted-by tag in the following format:=
:
> -
> -  Assisted-by: LLM [TOOL1] [TOOL2]
> -
> -* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
> -  (e.g., coccinelle, sparse, smatch, clang-tidy)
> -
> -Basic development tools (git, gcc, make, editors) should not be listed.
> -
> -Example::
> -
> -  Assisted-by: LLM coccinelle sparse
> -
>  Procedure for finding and fixing bugs
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -82,8 +64,7 @@ these steps:
>     another one. The fix must not add build warnings and must pass the
>     checkpatch.pl checks (see submitting-patches.rst).
>  6. Commit the working fix with a detailed message describing the problem=
, the
> -   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
> -   Assisted-by tag, as described above.
> +   solution and a Fixes tag. Do not add a Signed-off-by tag.
>  7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>     Documentation/process/security-bugs.rst shows how to do that.
>  8. Indicate what could not be done. If the fix could not be built or tes=
ted, or
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 7ae79452e1b46..5f4e0156cca78 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -632,16 +632,6 @@ bugzilla.kernel.org is a public place in this sense,=
 but email addresses
>  used there are private; so do not expose them in tags, unless the person
>  used them in earlier contributions.
> =20
> -Using Assisted-by:
> -------------------
> -
> -If you used any sort of advanced coding tool in the creation of your pat=
ch,
> -you need to acknowledge that use by adding an Assisted-by tag.  Failure =
to
> -do so may impede the acceptance of your work.  Please see
> -Documentation/process/coding-assistants.rst for details regarding the
> -acknowledgment of coding assistants.
> -
> -
>  .. _the_canonical_patch_format:
> =20
>  The canonical patch format
> diff --git a/Documentation/translations/it_IT/process/submitting-patches.=
rst b/Documentation/translations/it_IT/process/submitting-patches.rst
> index a742610cb0709..d0e0d6c9ecc2e 100644
> --- a/Documentation/translations/it_IT/process/submitting-patches.rst
> +++ b/Documentation/translations/it_IT/process/submitting-patches.rst
> @@ -691,16 +691,6 @@ un luogo pubblico, ma gli indirizzi email usati l=C3=
=AC sono privati; quindi non
>  esponeteli nelle etichette, a meno che la persona non li abbia gi=C3=A0 =
usati in
>  contributi precedenti.
> =20
> -Usare Assisted-by:
> --------------------
> -
> -Se avete usato un qualsiasi tipo di strumento di assistenza avanzata all=
a
> -scrittura del codice per la creazione della vostra patch, dovete darne a=
tto
> -aggiungendo un'etichetta Assisted-by.  Non farlo pu=C3=B2 ostacolare
> -l'accettazione del vostro lavoro.  Fate riferimento a
> -Documentation/process/coding-assistants.rst per i dettagli su come dare
> -atto dell'uso di assistenti alla scrittura del codice.
> -
>  .. _it_the_canonical_patch_format:
> =20
>  Il formato canonico delle patch
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8a7787d228a63..c9840f5219c2a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -655,7 +655,6 @@ our $signature_tags =3D qr{(?xi:
>  	Reviewed-by:|
>  	Reported-by:|
>  	Suggested-by:|
> -	Assisted-by:|
>  	To:|
>  	Cc:
>  )};
> @@ -3124,16 +3123,6 @@ sub process {
>  				}
>  			}
> =20
> -			# Assisted-by uses a free-form value (e.g. "LLM"), not an
> -			# email address, so skip the email format checks below.
> -			if ($sign_off =3D~ /^Assisted-by:/i) {
> -				if ($email =3D~ /^\s*$/) {
> -					WARN("BAD_SIGN_OFF",
> -					     "Assisted-by requires a value\n" . $herecurr);
> -				}
> -				next;
> -			}
> -
>  			my ($email_name, $name_comment, $email_address, $comment) =3D parse_e=
mail($email);
>  			my $suggested_email =3D format_email(($email_name, $name_comment, $em=
ail_address, $comment));
>  			if ($suggested_email eq "") {

While everyone has been discussing tags, no tags, etc, I want to bring
up that this, in a way, just lowered the bar *tremendously* for people
wanting to contribute to the kernel.

Because now that there is an AGENTS.md, and you don't have to say
whether you used AI, you can use it anyway and nobody will know.

And I wonder how the other kernel newbies who have been spending their
time *avoiding AI* for the purpose of learning how to actually
contribute to the kernel feel about this.

This will ultimately lead to people making their drive-by contributions
because they think it will buy them fame.

I have seen this in the video game decompilation scene, the current
console homebrew scene, and I am expecting it to come here now.

-Josh
