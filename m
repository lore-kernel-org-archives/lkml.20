Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46B409620
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343405; cv=none; b=rqZVadFyVFCbu2xl5ieBxDzVfVy6nx+tanVADyIICrfGs/AJ7MY3yabBIptWTBZmw/Cn+mCAvoG5Zhe0vloFgVj0UXgFft5YJ7ng5uKWUpncUSyN7nv8ZzySGKe6OddmAzKqQYu0J71dwO30bmuNSTGeZLYFFzQCvRJ+Taluq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343405; c=relaxed/simple;
	bh=GOXkEtRBSU2bDZdcAcZTgql7Tet3D2LDvYLetDbaQcc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=NqZd9ljmwe1gbDf/eqkitVLb7+f249F81wJ8Rf0XbEB88LqpjrsqYqqqEHYUapfMuTA6Pz9QD7ZX5NAnj1ojz2zsuqLshDgiZK7m/cOYPeLyZLf9E8RUqlgLIyKPnE7A/RxvkU9M4zeLAim20rLlm5FOqOT1IeKJbREBRZMi+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=aGnJryxq; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="aGnJryxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=GOXkEtRBSU2bDZdcAcZTgql7Tet3D2LDvYLetDbaQcc=;
  b=aGnJryxqZIQsDv7PJlsr5gUjN59G85BFRWvYggL+hqs09yClQiU5BWbf
   Kflzq6aJXJSk+ZJLOB29l+Gwyu/T4D5uATkHp6RGoTRKDpseztnsNwBZt
   EqhUO8/zrCUsu8E40qkAv4zY15nscmUUFZMIuuFLUskeoU0Giy7A9gNKz
   k=;
X-CSE-ConnectionGUID: /bjn7IZVQVaLbObCVCDOQA==
X-CSE-MsgGUID: XzvSWS9lS5Owq8TY7Pyusg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,166,1787004000"; 
   d="scan'208";a="160154773"
Received: from 37-169-1-171.coucou-networks.fr (HELO smtpclient.apple) ([37.169.1.171])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:09:55 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match open parenthesis
Date: Sun, 18 Oct 2026 13:09:43 -0400
Message-Id: <53D6A234-940A-4B29-89B2-7EB0E459F077@inria.fr>
References: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, abbotti@mev.co.uk,
 hsweeten@visionengravers.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
In-Reply-To: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
To: Comfort Oyewole <coyewole7@gmail.com>
X-Mailer: iPhone Mail (23E261)



> On 18 Oct 2026, at 10:18, Comfort Oyewole <coyewole7@gmail.com> wrote:
>=20
> =EF=BB=BF-----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> To: Comfort Oyewole <coyewole7@gmail.com>
> Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
> linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
> outreachy@lists.linux.dev
> Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
> match open parenthesis
> Date: 10/18/2026 02:30:05 PM
>=20
>> On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
>> Fix the alignment issue in order to adhere to kernel coding style
>>=20
>> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
>> ---
>> drivers/comedi/comedi_fops.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> This is not a staging driver, why is staging in the subject line and the
> cc list?
> Sorry, I made a mistake while working on my first patch. I just realised t=
he staging drivers are located under drivers/staging dir.
> Is there anything I can do to correct this?

Just work on something else.

Julia

>=20

