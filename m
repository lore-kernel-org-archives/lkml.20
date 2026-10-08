Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872984A13B9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464611; cv=none; b=ehhWvHjPKgCEOeYIDmh+kg5Il2xjRbyJc9OZHOP7q6RvY4Bya3Fjw+9FYwNnvOmmuXD6L3jIZbu3A4JwlmVcaX6F3bTz5tRLnDg0St05eOhHJJHTsOgFdf8CaC7zslQ18Jp6p8TY32Nn1HfOlyLGb9+l50OFuoTNLEpcJXCBaCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464611; c=relaxed/simple;
	bh=tjHHvBOnmwG0ZHs7tnVhwy6OVxptOIoFLkVOYGXNK0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNeHqaOIPJkPRKdl6DneL1ZQtabte1TkrIOSKMqOH02A7qW9xObaO/f3JLRQWrScRGJclbG7frJY1Lng8Q7SU/9oWLSS1gHzwgUpBvRLzx/Kri0wIDqXVoNx5Or25CM9mJi68l3TeuP3Q9sHuE1RuZntWYA+T6J/jRud/TsClTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=GhdpSs4V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GhdpSs4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8F91F000FF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GhdpSs4V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1791464604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjHHvBOnmwG0ZHs7tnVhwy6OVxptOIoFLkVOYGXNK0w=;
	b=GhdpSs4V8bflIoqwcdpPbvT1rqF+MAEGqN7gji6jQG+TOAYxqxkf5LTPUVVg7jR6+KqouX
	KdX+tx1GHqNSsjMW0+LsUXS7mVYPKEs9hPeKbwF8nQjm/k8Yg30gcayedlG9j3ES3DbprS
	46UBYZfEzpF47ywgdm/1bTu8RkVyOCA=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id acfd6500 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-kernel@vger.kernel.org>;
	Thu, 8 Oct 2026 13:03:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e3846d1caso438522466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0rNXQlHLvCj9RHlMp1Q9SOgoyG4/97drWPkBbNIurQpIG/Vunx+CZxrMbcfkZ6xLK/B5LSQdb8d5dKAA=@vger.kernel.org
X-Gm-Message-State: AFuF++mR/igRN2eUPpqz4c2vtqux9b1hUwO2UycBFp63kTE+2vOdAPtM
	ZTkbLctREEauGZSTR4R6YMafTgVittenV/9U1Rhbyg5V57w0hUdSxEoIHg26+9co780ccJ0uFjv
	9l+J0YLns1oAS2YrGINEh8c2o+uFAZZw=
X-Received: by 2002:a17:907:1ca2:b0:c2e:3124:2394 with SMTP id
 a640c23a62f3a-c317c104ea5mr573093066b.41.1791464602409; Thu, 08 Oct 2026
 06:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Oct 2026 15:03:11 +0200
X-Gmail-Original-Message-ID: <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
X-Gm-Features: AclHuK-Yejlvpf36uWR33GrvVlEEyQTSLxOHNFx01AUdH7X8hSv_BcZkGCtiyPE
Message-ID: <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Thu, Oct 8, 2026 at 2:56=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.

Thanks for communicating this! I had always assumed the opposite,
based on what I saw happening. Glad it's been settled.

Jason
