Received: from mail.quicksign.fr (136-ovh.quicksign.fr [91.134.115.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDF3DAADA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.134.115.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916333; cv=none; b=lmHA705kJYdIR76gc26WlXhlrOJZh40CohezXyiaHW9786bqgzpW712KkAP4YFBA5TJTWVDSxU9apojqDcWdznLO835cn7KNmxicSFmzzQlbSiDvqz8ZV3BPSdoL7qYKWauoOdzH4Thdb5fSVyY5vCsX+U0M+EuqV9x9+nrP7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916333; c=relaxed/simple;
	bh=kNM4RxK3UEoEw+OXR1VX9ya/0Y3WQZIM9I7ud45/0tg=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=G5JDt2caTC5ufUG0W7MSqaEjhK5n1LQaY1O0lyrr0AEabfCGHZwB5jZlELZrgtPsQKlPLXQ6Il8F03eLvqrIPlWvE2onqhAkZcKlpR8GPyI0h7Tg7LQU4cXzt1s3ID0RMQK3pDJN4rOj7czLA35R2GQFvBkBU+QMGou+1uTfFBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicksign.fr; spf=pass smtp.mailfrom=quicksign.fr; dkim=fail (0-bit key) header.d=quicksign.fr header.i=@quicksign.fr header.b=eCImT1Ph reason="key not found in DNS"; arc=none smtp.client-ip=91.134.115.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicksign.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicksign.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=quicksign.fr header.i=@quicksign.fr header.b="eCImT1Ph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quicksign.fr; s=mail;
	t=1787915700; bh=kNM4RxK3UEoEw+OXR1VX9ya/0Y3WQZIM9I7ud45/0tg=;
	h=Reply-To:From:To:Subject:Date:From;
	b=eCImT1PhZ/G/o4P1L4AZOAld0IbLiI7Q4A27lAkYHdlKDbN+cMEFBvuq1wlLjkOYL
	 P4SngGiObW89OBWlay9FzuN9xZ9kr2cVr0+cLmDE9SYivmmzShexMBazILAFvsi57E
	 yj6yxhvWB+ovoyXgY3sLYhnBxXeX0ABfrCHTasLjfoBo/yb8dkmepejOo3vq2n8T6z
	 SbICHwoat3usHb6oMlQvBa4leZrxuk8js3VMudlLTQ0d2NmuYqqRAcSNCPlXwrTa78
	 TIFIjfNFR5dUNJM+zaTyXi8cgWHhOrJ3ATfYGSzSmkVOasySlhcWVOR4cZA5LSp22L
	 bO2CUI7MZMwhQ==
Received: from authenticated-user (mail.quicksign.fr [91.134.115.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.quicksign.fr (Postfix) with ESMTPSA id 1784CAD8DE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:00 +0200 (CEST)
Message-ID: <afe06cc733dee7eccbf1b813e2b69d815df9cd@quicksign.fr>
Reply-To: =?utf-8?B?0J/RgNC+0LTQsNC9INCe0YDQuNC80LjRgCDQhtCz0L7RgNC+0LLQuNGH?= <ssu@gov.ua>
From: =?utf-8?B?0J/RgNC+0LTQsNC9INCe0YDQuNC80LjRgCDQhtCz0L7RgNC+0LLQuNGH?= <test@quicksign.fr>
To: linux-kernel@vger.kernel.org
Subject: =?utf-8?B?0IbQvdGE0L7RgNC80LDRhtGW0Y8gKNCy0LjQvNCw0LPQsNGUINGA0LU=?=
	=?utf-8?B?0LDQs9GD0LLQsNC90L3RjykgLdCQ0L3QtNGA0ZbQudGH0LXQvdC60L4g?=
	=?utf-8?B?0JTRltC5INCc0LjQu9C+0YHQu9Cw0LLQvtCy0LjRhw==?=
Date: Fri, 28 Aug 2026 14:18:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=AF =D0=A0=D0=B5=D1=88=D0=BA=D0=BE =D0=96=D0=B0=D0=B4=D0=B0=D0=BD =D0=94=
=D0=BE=D0=B1=D1=80=D0=BE=D0=BC=D0=B8=D1=80=D0=BE=D0=B2=D0=B8=D1=87,=D0=9F=
=D0=BE=D0=BF=D0=B5=D1=80=D0=B5=D0=B4=D0=B6=D0=B0=D1=8E =D0=92=D0=B0=D1=81=
, =D1=89=D0=BE =D1=8F =D0=B7=D0=B0=D0=BC=D1=96=D0=BD=D1=83=D0=B2=D0=B0=D0=
=B2 =D0=BE=D1=84=D1=96=D1=81=D0=BD=D1=83 =D0=B1=D1=83=D0=B4=D1=96=D0=B2=D0=
=BB=D1=8E =D0=B7=D0=B0 =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=BE=D1=8E =D0=BC.=
 =D0=9C=D0=B8=D0=BA=D0=BE=D0=BB=D0=B0=D1=97=D0=B2, =D0=B2=D1=83=D0=BB. =D0=
=9C=D0=B0=D0=BB=D0=B0 =D0=9C=D0=BE=D1=80=D1=81=D1=8C=D0=BA=D0=B0, =D0=B1=D1=
=83=D0=B4. 108/5 =D0=BD=D0=B0 3=E2=80=935 =D0=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=
=85=D0=B0=D1=85 =D1=83 =D1=81=D1=82=D0=B5=D0=BB=D1=8C=D0=BE=D0=B2=D1=96=D0=
=B9 =D1=87=D0=B0=D1=81=D1=82=D0=B8=D0=BD=D1=96 =D1=8F =D0=B2=D1=81=D1=82=D0=
=B0=D0=BD=D0=BE=D0=B2=D0=B8=D0=B2 =D1=83 =D0=B2=D0=B0=D0=BA=D1=83=D1=83=D0=
=BC=D0=BD=D0=B8=D1=85 =D0=BF=D0=B0=D0=BA=D0=B5=D1=82=D0=B0=D1=85 7 =D0=B2=
=D0=B8=D0=B1=D1=83=D1=85=D0=BE=D0=B2=D0=B8=D1=85 =D0=BF=D1=80=D0=B8=D1=81=
=D1=82=D1=80=D0=BE=D1=97=D0=B2,
 =D1=8F=D0=BA=D1=96 =D1=81=D0=BF=D1=80=D0=B0=D1=86=D1=8E=D1=8E=D1=82=D1=8C=
 =D0=B7 14:30 =D0=B4=D0=BE 17:00 =D0=B7=D0=B0 =D1=86=D1=96=D1=94=D1=8E =D0=
=B0=D0=B4=D1=80=D0=B5=D1=81=D0=BE=D1=8E; 3 =D0=B2=D0=B8=D0=B1=D1=83=D1=85=
=D0=BE=D0=B2=D1=96 =D0=BF=D1=80=D0=B8=D1=81=D1=82=D1=80=D0=BE=D1=97 =D1=8F=
 =D1=80=D0=BE=D0=B7=D0=BC=D1=96=D1=81=D1=82=D0=B8=D0=B2 =D0=BD=D0=B0 5 =D0=
=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=81=D1=96 =D0=BE=D1=84=D1=96=D1=81=D0=BD=D0=
=BE=D1=97 =D0=B1=D1=83=D0=B4=D1=96=D0=B2=D0=BB=D1=96 =D0=BC=D1=96=D0=B6 =D0=
=BE=D1=84=D1=96=D1=81=D0=B0=D0=BC=D0=B8 521=E2=80=93527, =D1=80=D0=B5=D1=88=
=D1=82=D1=83 =D0=B2=D0=B8=D0=B1=D1=83=D1=85=D0=BE=D0=B2=D0=B8=D1=85 =D0=BF=
=D1=80=D0=B8=D1=81=D1=82=D1=80=D0=BE=D1=97=D0=B2 =D1=8F =D1=81=D1=85=D0=BE=
=D0=B2=D0=B0=D0=B2 =D1=83 =D1=80=D1=96=D0=B7=D0=BD=D0=B8=D1=85 =D0=BC=D1=96=
=D1=81=D1=86=D1=8F=D1=85 =D1=86=D1=96=D1=94=D1=97 =D0=B1=D1=83=D0=B4=D1=96=
=D0=B2=D0=BB=D1=96! =D0=AF =D0=B2=D1=81=D1=96=D1=85 =D0=BF=D1=96=D0=B4=D1=
=96=D1=80=D0=B2=D1=83,
 =D1=96 =D0=BB=D1=8E=D0=B4=D0=B8 =D0=B7=D0=B0=D0=B3=D0=B8=D0=BD=D1=83=D1=82=
=D1=8C; =D0=BF=D1=80=D0=BE=D1=88=D1=83 =D0=B2=D1=81=D1=96=D1=85 =D0=BC=D0=
=B8=D1=80=D0=BD=D0=B8=D1=85 =D0=BC=D0=B5=D1=88=D0=BA=D0=B0=D0=BD=D1=86=D1=
=96=D0=B2 =D0=BF=D0=BE=D0=BA=D0=B8=D0=BD=D1=83=D1=82=D0=B8 =D0=B1=D1=83=D0=
=B4=D1=96=D0=B2=D0=BB=D1=96. =D0=AF =D1=96=D0=BD=D0=B2=D0=B0=D0=BB=D1=96=D0=
=B4, =D0=BC=D0=B5=D0=BD=D1=96 =D0=B2=D1=82=D1=80=D0=B0=D1=87=D0=B0=D1=82=D0=
=B8 =D0=BD=D1=96=D1=87=D0=BE=D0=B3=D0=BE, =D0=B2=D0=B8 =D0=B2=D1=81=D1=96=
 =D0=B7=D0=B0=D0=B3=D0=B8=D0=BD=D0=B5=D1=82=D0=B5! =D0=9F=D0=B5=D1=80=D1=88=
=D0=B8=D0=B9 =D0=B2=D0=B8=D0=B1=D1=83=D1=85 =D0=B2=D1=96=D0=B4=D0=B1=D1=83=
=D0=B4=D0=B5=D1=82=D1=8C=D1=81=D1=8F 28 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=
=8F 2026 =D1=80=D0=BE=D0=BA=D1=83 =D0=BE 14:30,
  =D0=B0 =D0=BE 16:30 =D1=8F =D0=B7=D0=B0=D0=B2=D0=B4=D0=B0=D0=BC =D1=83=D0=
=B4=D0=B0=D1=80=D1=83 =D0=B1=D0=BE=D0=B9=D0=BE=D0=B2=D0=B8=D0=BC =D0=B4=D1=
=80=D0=BE=D0=BD=D0=BE=D0=BC =D0=BF=D1=80=D1=8F=D0=BC=D0=BE =D0=BF=D0=BE 5=
-=D0=BC=D1=83 =D0=BF=D0=BE=D0=B2=D0=B5=D1=80=D1=85=D1=83 =D0=B1=D1=83=D0=B4=
=D1=96=D0=B2=D0=BB=D1=96! =D0=AF =D0=BA=D0=BE=D0=BD=D1=82=D1=83=D0=B6=D0=B5=
=D0=BD=D0=B8=D0=B9, =D0=BC=D0=B5=D0=BD=D1=96 =D0=B2=D1=82=D1=80=D0=B0=D1=87=
=D0=B0=D1=82=D0=B8 =D0=BD=D1=96=D1=87=D0=BE=D0=B3=D0=BE. =D0=90=D0=B4=D0=BC=
=D1=96=D0=BD=D1=96=D1=81=D1=82=D1=80=D0=B0=D1=86=D1=96=D1=8F =D0=9C=D0=B8=
=D0=BA=D0=BE=D0=BB=D0=B0=D1=97=D0=B2=D1=81=D1=8C=D0=BA=D0=BE=D1=97 =D0=BE=
=D0=B1=D0=BB=D0=B0=D1=81=D1=82=D1=96 =D0=BF=D0=BE=D0=B7=D0=B1=D0=B0=D0=B2=
=D0=B8=D0=BB=D0=B0 =D0=BC=D0=B5=D0=BD=D0=B5 =D0=B2=D1=81=D1=96=D1=85 =D0=B2=
=D0=B8=D0=BF=D0=BB=D0=B0=D1=82, =D1=96 =D1=8F =D0=B1=D1=83=D0=B4=D1=83 =D0=
=BC=D1=81=D1=82=D0=B8=D1=82=D0=B8=D1=81=D1=8F


