Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93A34040D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967545; cv=pass; b=I4rIEbv9RQh2FUEdiobFFH1fegUW41B3Sz6/XRDDbYleOn9x1VMIl3fw8yPKneh1U9lCEOE9dg0JGHDS2495xzYpnBxfvQ2SuWKiA2e4u2CxxswEQ0QXwGPU6jtEgwxesqrKa9/csVZ0f9w2mtQMM1iyu1Lya8WOSRSi5/IU8LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967545; c=relaxed/simple;
	bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Itr8rLiWFTG01KaFSLyfhkuEOFI35mpolhqUiq8kMdku8Ta5sfGBj1fydTUHo8qVmzUcLYwV0KlDh29j78sqV4AZzlRJQHT6k9Xan5JAoGFhGBarW33Gq5ce7FP2aHs0FjrhQEUnA4kpyeqHkjqXTuTI9OCi82mkUWnZBPk+JU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUl7vdpF; arc=pass smtp.client-ip=74.125.224.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUl7vdpF"
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-66c70f7a790so1793774d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967543; cv=none;
        d=google.com; s=arc-20260327;
        b=O2KGDB/JlfmFL1BW8otDwJ/2jM5ClCLqP1bYWl95GC+pjP7vAGLSqC495PaNnRxTzZ
         XXthYtpibSuguGHWsMvPJ+HqFDrHOQjiDsbS5rERrzlac2Jr6pOWYX0moc6kybX93U7B
         grT+1n7VBMzP7nkcV/W7uYgp5Y7nUJOR9JQhk4vSOJe/v1BJG5eOLEujw1SLiFkNY6lT
         9YhPujbGAnZQ+dQKNZ5gas9vgu8bYj/G19huXZhmDfBMBxZMiWF4AOSp4yczE8gpmgbh
         +ywOK4WyptB00VZRzTOyXH1uo04Whbj816c0o1GcPRWK6rUYlSnoA36lb0RdHascpXY6
         6WLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        fh=A5Ure7g4/bmBSbN3m3oeOqy5+ppkFAn7gqgjTyGqKd4=;
        b=L8F7EJh0ALfjnZfxq9CNC/8b7V/kufX86An50KEz5Jkl2lyDTRQrKsfuq3YQs/RCkF
         oH3YP1m3i0psMYyv6Whc73wFmfarfs0hyn52fEDHbIZhPzNKDH19yYWFx+hpA0e8QvM6
         GTNoBxWClYFMZHLG8W4LVtoMIKUogyrFzBXkKairjrcrX0KnRC8eUFIRVMYJ6m+/gz5x
         ZKnFd7mIjSONBrhOzchRw35tzETon8lfHC9dQEOkivIWuS8SpLbeyzUr6qtoW2OJ5hi8
         412GzIs61Cw6w+ul5Gxjyj5MaYuWAHIRW5zvRDqNDKsSEeUoV31F5aLvrP8xeD90NXuK
         vmvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967543; x=1789572343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        b=mUl7vdpFb3sCeouIaa3a4v3tn8VUZNjeUTtKEytlQYCYTigHmLA4FkJwLlc7i0yQlv
         MxbnDrznPdUwBUAX30jvoQ7XargAqEQZEwpKVxYHuC2CiUx10557QhNQyvevSiOgrVa+
         fa8kx1GtNiOw3dRK2ZMI0q29CQlNWk9aLkCDwSJjAPKRiDtaIEDCdg2kqXfWdV3SuokT
         CEZsU3F+0zlTvegg/C0jcXCAUIKr0jqOvCi3yU+ZBE3mJPzxr1aXk1Jh7KXYiTbmBBZs
         3sM2hnUWy46zHf5bEnpriNIvi6dehr6RusiUzyEOXfQ3Cklfkr18yjnCXy1GHplW24EB
         3jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967543; x=1789572343;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        b=otUefXG1L6xQEitBGcklR5hf0dgCC4veU2+sxtsLi4aeouPq+Yg9wmWjdTk90JGjS+
         XKb/n8wfrYc7OWdrbrsxiq3rJAEJJ3v/b+F1OH3Lxy0W5EonXYX81YPH1DCzVfnSd4bd
         4mRQO8R61EwytvB8ogcPhWHxlmP6f3/qtRrovQeTZnLsi//Mj2ehKWFWPH1ymWrKxORL
         XiRidSaJ6kRoaqAPU9Mg45EvtBqmHbC0khOYLGmUXxcTcS0eXhApjbneRGH6A704s6tP
         CwazZ4m8ptRnZ6sM068+2u9C49TmbBZeqIHmXKxNpcr9xv8bBauQd+siA83oOhIPyniO
         cmWw==
X-Forwarded-Encrypted: i=1; AKwUvBwOQjcfA/SjLGx31FC49iEpgH4gZEwwosXY/y592qdjCIK/FtGqCCIFs7FBbTANdKioMsjVbtH7tf5G/GU=@vger.kernel.org
X-Gm-Message-State: AFuF++nGdVUfTOlWuIcryDFYEhleSZXVWcXrf7ZZ4PGJ89ULyOWBkojg
	CLHFzUcNB8th5UZH20bKFjm4q8K3otQ2W4VxQgKsBkTfZT7LfqYTM0s3hlx9Tn3INduxa6HeegL
	4P3WtacJoUjgqUipQYn34ZubejTrQ35I=
X-Gm-Gg: AYBFou2l3CpAIcnF3qIJ61tcsRPy787dGsP62uc9c9zljzhRC8THCqRiXZmUF3JSqQ7
	T83B6rkAudmYxNAXFlgGqBMacENiIDsNC1hOlzZiKfCCX9cXlWQr54OPmE4f1tAsb5LujeucXfU
	ofroR3o8zC4pcR9W9uH4fXKDGIO//o3HTSUMUTwCmEbbN9TQT0GENyIaBt70RcA/MVNAP80SHT8
	C2Er3xPKfoz/6nZnbcujRT98Fw+3n4QhbzCRGdZU2C0KfvVeCP+Fp8tQeb/2Ma11bbkofsnwRzi
	H/ENzQ4yutyjxxlA0y3vMhNZCzPHUPKdj8Ha3yMUDiyEF5ewtTzBBA==
X-Received: by 2002:a53:bdc5:0:b0:66f:c1be:318a with SMTP id
 956f58d0204a3-66fc1be352cmr7235391d50.97.1788967542918; Wed, 09 Sep 2026
 08:25:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <c991727d-ad63-46ec-a281-d09980ff08ca@kernel.org>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
 <CACGbirTZFsyQhOszpfiHhrd7Red-L_Z_=ke7DbRDe5SQfzi9Pw@mail.gmail.com>
 <bef8f543-ffa9-4cc6-8a7b-6118daf14f76@kernel.org> <c991727d-ad63-46ec-a281-d09980ff08ca@kernel.org>
Date: Wed, 9 Sep 2026 08:25:41 -0700
X-Gm-Features: AcwNN1WmKueNfTKAn_RKSWUyGmYC9EGLG-M4ziRZDzKXzmf-aA6syq0wLvHFrCg
Message-ID: <CACGbirSXP+YSvp=K6q7F2f8-ybgeOs=3OHUw-RNBbZQt81d=HQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

> I think what's happening is that something in your mail sending path wraps long
> lines and breaks the patch format.

You were right. I reproduced the same b4 error using an externally
received copy: outbound delivery wrapped the diff header and removed
whitespace. The copy in my Gmail Sent folder was intact, so my earlier
check missed the corruption. Sorry for the trouble.

I have resent the unchanged series as text/plain attachments:
https://lore.kernel.org/r/CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com

I verified the externally received attachments through b4 and git am.
They reproduce the prepared tree and retain the original authorship
and your Acked-by on patch 2.

I will use this Gmail address for follow-up, given the delivery problems
with my previous address.

Thanks,
Tianyi
