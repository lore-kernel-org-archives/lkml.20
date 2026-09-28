Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAF4E4C30
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608331; cv=none; b=qOge4aYepRWX4qHzE/yPrmYErUQc8bJhNhiuTobIh7aJtnVhyCNe5YZKp18SzWL3a025Yb9NYT9I4s4/suiWj7auvz4lNT8BbAJXs/MJgYmwANFzBkr7fQGj7S5v//LwPiTJDDSrk6e15NKEH0zb1WapLmC15lSTK65Yflg3TZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608331; c=relaxed/simple;
	bh=EE3e01aEZst8RZWnqsaym9NoszJRyItQZt9dUcZ26wU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=swNxIV2io+HPihRu8LJ60AyLqAeDRyl1HAW7JbnuWZOGEkBDz6BH/c8q8A0jLOdmbTImBzpiNF/dgUOiQbf9Y2dTKtLqUjYnA7hOBihszGD+HrWCFmUFdP7P6YwnM6ZXYmfjEUHaJhohwXKL1BIzM9KKaVjrT4QqzxzWoxSmBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=kcCSaThF; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="kcCSaThF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790608322; x=1790867522;
	bh=EE3e01aEZst8RZWnqsaym9NoszJRyItQZt9dUcZ26wU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kcCSaThFjlmeZtfs1zh9tgHXs1cNBR1BgMoPc4I/r+Mf0lkjRCEjBrOZnh90zTVPK
	 xxAc4FxPYFou9PIFzIrXJVmkWeSh0WsFTfThWVqLpqWJqWFGoCbeaTbowFelQKQUNi
	 CHcv8naE/z49qfTKvcRu67AX+m6PKASEGu8n2dmJEmpJNUQ5jmz4KiIIKuPnmsp49a
	 NQvgq9kxd5yW5paHPcaTiB65H7T5tVIEvf4ROsDvpMMYVzgsCyYWqOtlSmMbcZuuFo
	 iZkfuOY4d6PQ9x8RhfXUOE33XXwPavn+9QZGfMBxL/svn1pyrrEU7S1O4KHzW4CMbe
	 8dsHFV5Tdq8NQ==
Date: Mon, 28 Sep 2026 15:11:58 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: =?utf-8?Q?Linux_enthusiasts_see_10-second_kernel_compilation_times_on_the_horizon_=E2=80=94_AI-assisted_patches_cut_build_times_by_nearly_a_third_without_a_RAMdisk?=
Message-ID: <9NDZPLyjXlE9duCFOG4q_ybMwAluU2Ihk1g1uYLCbfW3jFbQ1X6q-SvIvPmAsHEDv_zmfe0MP-tnRTa1mTXGL_0lkhOPnMiyNA0aPxoz5AM=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 79c065d045c3e80049108780d45a385050e7e56c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Linux enthusiasts see 10-second kernel compilation times on the ho=
rizon =E2=80=94 AI-assisted patches cut build times by nearly a third witho=
ut a RAMdisk

Good day from Singapore,

Here is an article which I would like to share.

Article: Linux enthusiasts see 10-second kernel compilation times on the ho=
rizon =E2=80=94 AI-assisted patches cut build times by nearly a third witho=
ut a RAMdisk
Link: https://www.tomshardware.com/software/linux/linux-enthusiasts-see-10-=
second-kernel-compilation-times-on-the-horizon-ai-assisted-patches-cut-buil=
d-times-by-nearly-a-third-without-a-ramdisk
Date of article: 27 Sep 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
28 Sep 2026 Monday 11.11 pm Singapore Time





