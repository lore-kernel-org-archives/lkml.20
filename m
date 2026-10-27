Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119236;
	b=NANA3+w/ATsqFHSspr1jn/ii+FDNukKCfp7bL3Om93HvduYuyGP5zhD/0r99mKMdWPO1
	 aiFM2ruQPlr6xBiJ7+irtpJkoNbNmunRII8Pt3JeaVYoGi3jySr4MExINhDjgRAwU6w5Q
	 Lb+MTrZtzCNcjbpc97LOmXmO85aeRzMS/xN1zRkVIQS7v0MCxqhtIXURGvJdIVAVjy3lF
	 RZLNR02eB8cc3aaPVr5x6ZW4eNbJhKy8QMH/K4a26eOBKBo6ej30OjlLusiKwVD3atixU
	 JdDWIM4LBzmH8Dg3hrC6A6XUNwv9v8LdtMUwGOqorQdiWK7Dn2Ns0UBiUJcv/FF235w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
	b=lXKHh/WnHiOdnjkNA/VNVxVInKkgmdRbRnIKWJ7NEZAzSL1EmcRzrUxXr2kaXH76x4JP
	 hwcYrlcu84fAmS1wOvJBrzjzIghGKDaSICsqP2FC4vtN+iJU/Ufefti2cW1vfdGvLxLo9
	 MkOfapYvzaVrNEhgclSbPl7DdFjJc5eUTU60cW2otf6tpOwTFWaVHM1KBvHTpCC2TF8DI
	 dRSyVUMVfl3ptnmSGrCowTEGJlrtidwdDY2xeRsN/aiETCCGIeyqRvU1Nl33PNZoLh4Nf
	 UrXbTLSLWee9ajlI9Fsk3NBrxMv0rLi7oUGa7g22ZzqQfvEn+7CFp/R1ExOMSUVReoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B9pgIkEN
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so95884a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119235; x=1793724035; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=B9pgIkENP1nZt32P35HL6R0QxS18tatDUdKB8+Mex6frfRryvJ9HnZJ7yNzfYATxhk
         mTrYNth1sJ7pCfjLGBXbFdbG3yuaxupUx6NbUaEWi/y1Uy1q26SBQQf/tSjOD1IJGvsz
         l/pr3UYOepZQugq4IDXYNoHxly1ZnTRA2eYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119235; x=1793724035;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vGOrY3CisGPc8VMRVO//aXg6OQh93vx7xg6bEqOVs4=;
        b=SyY4W399i75HiB6n2VlgXI5haFyCOfc0AnpesJRRN08co9kxHqg/xxUMyuYe/VFVZj
         aHOpD6IhwD0tehbi9RJY/KpNTGeJxPmb3MKUaSPqaHSulERFfg7+pV6udbnVvVfuq3f3
         ZTne4igEIYRo7VGm5rPC0Kx4ZhoBGNyX6UAVBM/QABdbZ3EAnYKz6dSpnLmutxAJRUYU
         RJACTWv5VMkuELN1df6HlTZGqV6GbuJP75Y03NBIkyy+nthhERjGdmbgzxZ5kqgGhfBx
         TfE3oLiC8cYqvpxKPnqqul4m35g6aKu0X/Kfmt/akpEI9k1aNVECZv90xIfng0VWb5Rk
         F9ow==
X-Forwarded-Encrypted: i=1; AKwUvBzE6qIfUweVtMdn3hG2Yn2DwnQlu5S6tVYHbiH0Bcw4YjaZWlo6lkMf7u/9aRGyu5Zd6HxVea6sH7MtgYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrc7emhhzbYhKyOdndf2MAX4I9baShjh8KTg4omX9Ss8SYGuUp
	xvH+NEo8uALE7C6qAZJUACtJvYpMXADxjVD1584a8kLlAt/c6esC0LsmAC5k7PLSbVA=
X-Gm-Gg: AYBFou06CtTr8YG+v3gCLlFuJZkvANDo7+d8ukb/fGsUTVdYRTSuq7VHgRVB+M7F/Jp
	AvXeL00vS/i+vTUOOyEiYpuzXK5CpJr8B0akDdTmcLKVKsMhA98GnJRjODMGbNdFlfo0S4vUQUF
	AYSEg2GEPzs8K5rdRtR9eSoUjpbOIVBq0HF5w5IwZOGgdw/gjDrctMNmFWryrnrNuwUWZR9I8TL
	V3IXN43o54muRPz0sMDjacd/2eOmsvQAL4jeRMmJyRK7/XiWTVuap2pAalLRycrvLmjLw+oiVYx
	lBNpN8VtAuSOXTSWJlGm3LMPtyj0lwrZkYT+/EqtPzQR6ix1iIg6x6H/Z9MdacVo2wmYtsfF6M2
	BGq3xYvyFPlFgYHCV1XR+OnIX6Oa1/f901PModF5uJs1gDI3P8Hfs2FM24fSfar4L+U6g0f/8ao
	pFVtGqkTlWVB9K93xknSSyLnj/MmstR0FRtiziXrhTVzVQHv/ck5vQCxNjJZIhuGw4H2K7hY/h3
	6MyJUcNLv8NcE0NXl4GT0zzN0t+Pz8/CNrFJFyoWIZojX8be6JTKeGNF22CvydFpl3eoGCQVXWG
	+hUkOgb9sy7sTmJMbZgO6yb14fF48ZtrgF2bUpqtu8fVU2OV94LwgOP4dDDPc3mevx1+YhtB5pH
	UUL9OkCAlqH90MIj3ps838NGMyQVbTSIOZmMzqq+zFNYQ8lxTGYgOK3HVms3GLlTkMVMU8fEcpw
	==
X-Received: by 2002:a17:90b:528a:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3adead57da9mr8291010a91.15.1793119235223;
        Tue, 27 Oct 2026 09:40:35 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066d631sm4569992a91.17.2026.10.27.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:40:34 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:40:32 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <auDUAN9xAQRQhnCo@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
 <auC7_5XYr31fimvL@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7_5XYr31fimvL@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Lorenzo Stoakes (ARM) writes:
>Sorry, in mm we require commit messages. Even for tests :)

Sure thing, I'll add one.

>On Tue, Oct 27, 2026 at 07:43:25PM +0800, Chris Down wrote:
>> Signed-off-by: Chris Down <chris@chrisdown.name>
>> ---
>>  .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> index ea75ad537620..83b4fadfbfe7 100644
>> --- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>> +++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
>
>Why on earth does 'mseal_system_mappings' have its own directory...??
>
>Ugh I don't know how I let this stuff go on the original series :/
>
>Please, for the love of all that's sacred, move these tests over to
>tools/selftests/mm/. This is an mm feature, for our sins...
>
>You can do the move as a prerequisite patch in the series.

Will do, I'll make the move the first patch.

>(And, again, I really do insist on your change doing some cleanup here as
> well rather than extending this stuff.)

Yep, see my reply to 1/3.

>> @@ -10,6 +10,7 @@
>>  #include <unistd.h>
>>  #include <string.h>
>>  #include <stdbool.h>
>> +#include <sys/mman.h>
>>  #include <sys/utsname.h>
>>  #include <zlib.h>
>>
>> @@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
>>  	EXPECT_EQ(expected, sealed);
>>  };
>>
>> +static bool find_vdso(unsigned long *start, unsigned long *end)
>> +{
>> +	char line[MAX_LINE_LEN];
>> +	bool found = false;
>> +	FILE *maps;
>> +
>> +	maps = fopen("/proc/self/maps", "r");
>> +	if (!maps)
>> +		return false;
>> +
>> +	while (fgets(line, sizeof(line), maps)) {
>> +		if (strstr(line, "[vdso]") &&
>> +		    sscanf(line, "%lx-%lx", start, end) == 2) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	fclose(maps);
>> +	return found;
>> +}
>
>There's shared code for this kind of thing, please don't duplicate a
>/proc/self/maps thing if unnecessary. Also there's a nicer ioctl interface for
>all this.
>
>See vm_utils.[ch].

Oh thank you! I will use that.

>I mean arguably this is an mremap test that belongs with mremap? I guess
>debatable...

Hmm, I'd lean towards keeping it with the sysmap test, since it's really 
testing that the seal is enforced on these mappings rather than anything about 
mremap() itself, but I don't feel strongly if you insist, just let me know.

>This all just seems like work that should have been done in the past when this
>feature was proposed, and doesn't depend on your changes at all AFAICT? Maybe I
>missed it though.
>
>Valuable in itself, but probably worth sending separately as a result? Otherwise
>it's a little disconnected from the actual change you're making.

Yeah, it doesn't depend on it. I can send it separately on top of the move if 
you like, I just don't like touching things without tests where possible.

Thanks for the review!
