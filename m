Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76364361DCB;
	Wed, 23 Sep 2026 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148103; cv=none; b=KQDTQQS5QtUnWbBwoaLA/sX+aPBNtbpF0KgfXxV5gE86Y1VyoEFytlaj1JMkJ4w2Pw32GxfNnrFhKMe9Og4YoIT5ziOlBsxZJ+ByUlUzJKqZcGfzKXOMD+N1mTJMY0C/qcUHVowtW1hkVUO4HVI/8yqy1ALzbnj3xxK7EhaNDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148103; c=relaxed/simple;
	bh=9+xTKvtUX821Xc8/upZ0IHaffD66DGwiFzpX6l9xFqM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b0egAp3w+7lwqFjSF1k5rUBi0e0SA9yz8m73o7fJQqJL1H545I0f8DSl0ICtKdiF4A7/Kzn7D+/Q9malfQ0PZ9tgGX8w26vJAmylCUxd7g/mOx3xksLegRqQm3amHSzeh3hINQpdwUsmSRaFfUIWJQzsqmg1tWXK5spuLhhifuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ7m8ah3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ7m8ah3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0611F000FF;
	Wed, 23 Sep 2026 07:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148102;
	bh=DwYfV8ffXv7IYLVAq2KulIdNM2YO8VcTvcyyhtDVgrY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RJ7m8ah3Px2i5vg+uPkiOH4ZAfU6cpBWAOVETlEZ55nB22CR4fYWzsbbOgkS4dEJz
	 NOej8OKG2h/A82wpRI45+hqZkQxiklLJur0ZGW+5LEWImomxFJwrTGahW+UIBufRFF
	 HjBTn/ZSNMhnaGE76jgwAzDLQvnwP6dVtinYgkPsMuxe6Imz+ib1pPmlWgrnJxU2wf
	 k03HmF1wmCtOiPyoDbyLlxorUZIWnAejL7X1OiqCGnkaZxYSoXhLr0rlGwKhP9qtUL
	 UHhgIgJafTUbbKTzGQgs5/TboUEWLGkczDSckPRw6Y+edsOBj+RFE8kzOIBhr9RB61
	 61+6vU58AHFHQ==
Message-ID: <85851bbc-38e3-4829-a531-71e7827b09f1@kernel.org>
Date: Wed, 23 Sep 2026 09:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL
 in cluster functions
To: Rohinthan P <rokinthanp03@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
References: <CAHzb5FFOq=2_piCiFdEun_s2h+Jr90pNLF5O_2umNLkM9-XjkA@mail.gmail.com>
 <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
 <6ab324dd.577d9347.2d1fba.32e4@mx.google.com>
Content-Language: en-US, nl
In-Reply-To: <6ab324dd.577d9347.2d1fba.32e4@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 03:01, Rohinthan P wrote:
> Hi Hans,
> 
> Thank you for reviewing the patch!
> 
> 1. Regarding my name:
>    My correct name is "Rohinthan P". I have updated my email display name
>    and git configuration so that Author and Signed-off-by consistently match.
> 
> 2. Regarding the 'Reply-To' header:
>    That was an accidental typo in my Gmail web settings where 'www.' was
>    mistakenly prefixed to the address. I have fixed and removed that setting.
> 
> Please let me know if you would like me to resubmit a [PATCH v4] with the
> updated Author and Signed-off-by lines, or if you can apply v3 directly
> with the name "Rohinthan P <rokinthanp03@gmail.com>".

No need for a v4, I can make the changes. Thank you for clarifying this.

Regards,

	Hans

> 
> Thanks,
> Rohinthan P
> 

