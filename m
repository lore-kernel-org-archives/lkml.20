Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net [178.154.239.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FCB442120
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467689; cv=none; b=d3LUlXHIMC7wfH66iNnDWAm58hYj+pJW6e1sH7CkD0NFeuKf09FxEDs6LgYyv0olvu6jESxItDF0eWyAP6fhocIlpCnA3uQa+bflWX67kuKKE0jNsc0vJGbN0j/BfND+h0jkfKlvNxJy6jPiXWLCqBEzTqFn7BwlUytrahg58oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467689; c=relaxed/simple;
	bh=CDnaeJfFuH1+gspwsTW1C4tYCdURuN0uth1/vqPJWto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZ0bRHV6xOeRin2G6DgfInWRjsjG33NZL7xu4Y4mbh1fkOVE4vUSVvKymG3l2bqVBR/LaQ5djHsFy3aJlyDXsNqP2XLE9/kS4DaGrIsgeQMP8RrPWFD9JuKzXLNkiPteSKK8plfvKq37Ctsre+92JOpGeODAT0mu5D5NOWNbyTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=uAk54gbj; arc=none smtp.client-ip=178.154.239.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="uAk54gbj"
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:fa2:0:640:41ee:0])
	by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id A69A280AD8;
	Thu, 03 Sep 2026 23:34:34 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:d5c::1:3a] (unknown [2a02:6bf:8080:d5c::1:3a])
	by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA id WYsZl6waMuQ0-SJOJ4uIE;
	Thu, 03 Sep 2026 23:34:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1788467674;
	bh=HBcAjfpMlA7r60pPF6BOpwXqiGeqg7IHcYn4i21hws0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=uAk54gbjsyrsqbPeh6xGMu3IEHk2AqRIhGR7cPeS7Iz080EYc6Imz/NalWxaQFfh+
	 i5WFVpaRYiWhNNiMlnfZbErjpTFgOUMR10/FW+fvBHryw1OYrhCwq4Kuh82VePsBsh
	 QLQZ5HQsv+ebLZ8VVF3NsT64Jw7etZxOLC6BEbl8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <5c57eb31-3548-4e0a-8b02-315057d029b8@yandex-team.ru>
Date: Thu, 3 Sep 2026 23:34:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>,
 Kyle Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Russ Anderson <russ.anderson@hpe.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
 <87tso69jdu.ffs@fw13>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <87tso69jdu.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/3/26 11:20 PM, Thomas Gleixner wrote:
> On Thu, Sep 03 2026 at 01:01, Daniil Tatianin wrote:
>
>> From: Daniil Tatianin <99danilt@gmail.com>
> ...
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> Seems you can't decide which of your alter egos is author and signing
> off on the patch.

Yeah, sorry about that. Originally had my git email configured 
incorrectly. The right one is in the S-o-b (the one I sent the patch from).

