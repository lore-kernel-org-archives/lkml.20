Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398726;
	b=LAzs6b4patpzzGQJ1M2SkoimGyhiwe107ZHwKP+HCfZjMSKw1U3tjGZRy9M/nLSN4B20
	 OWHGtEZFA8Bp0ct48b9bVtL3LerJ6sK0K1VtGMFfknRGZl5yiuxg7B+Mm6Py/UvO2x9Gf
	 ltIGgZrviEH0gPHLcA6Ciy0/5kJ8hBXWYvd/Dv1KFxVi3mDxd5pmxOPscSU56rlo758Rp
	 jte+IaEdsvTFXYkzO7x7FtG12w7QXSI4l9i1aRcJQXxNHcBodWIx/sVgk6t+MlDDiNfDB
	 bGu9y2dzhv8S1NycnuSDUpfN95+E9ma/W8HtqUOKoP18AijqvWz2HsU4k6l29reuaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398726;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6Sj6DMCJ5WBb+EzhP+baurrsRYP3tCbsUikKZVtrDqc=;
	b=AmaSlN98KHzLEO2fyPVW4UzthmyKq6Z9lFfdnjOBjGKoDC4SRTcvfivQocrb7scSUn73
	 YbY3Ky/jeArOLu8+Hg1dakyvVZTGLoa7UKaLV40gPEPgNz4pt/QaM+LdlNBxdcosdgB6A
	 tHUQjsAqv2q39GpeEc1oYsiX8NmTuH6ye0lbguI+Tx4rxF6V0Oum5zsbOcHkn1SA7qrx+
	 2uApQuk0zJxMjy8U7ApbXfVx7ts7rmQncEQcCN8bl9dqIwo9yXvuRTbaLC+s6e3DPIVsG
	 RQG0wIRqA2yDMO0590ZBOFfZnkPYiricjTB7kwa6C/BKJaaLmlvoa8+gVaYGcVqQRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cksK99uW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cksK99uW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304911F000C1;
	Fri, 30 Oct 2026 22:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398725;
	bh=6Sj6DMCJ5WBb+EzhP+baurrsRYP3tCbsUikKZVtrDqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cksK99uWxqxth6X97mG0RY9BdJR/0gqI4a67XeTUACf1N9nO8oVu9y5r/yTsU5Z2O
	 bGa9CQWlIy6cXAnqrfCJU3WmPcn8d/n8IYrVv0Jq7kj6gDV6S/pUsbvT1LhdVKlSVm
	 GICOjnAGQHXBmuMdQb7HVMfiUKhEw/cjdYtAZYF4/kGGiveQZ4siZ+DjrgCt2yk32/
	 pe8zzRvldFV3oVOuQLymB0qld/RgVdOg3ecN99S6cKwdniMvcnaVybWMygt8d5n4hJ
	 FRh22Oy+Cf2PslfMJh0KVAqb/cKqQjYYUixsCVXoaupCwdnvpGhNPHFNbc73zNTOoI
	 cTVf2sZFGd+5A==
Date: Fri, 30 Oct 2026 18:18:43 -0400
From: Sasha Levin <sashal@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Joe Perches <joe@perches.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auUXw9NhaVCwl0JB@laps>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
 <auTDEy_vyMixVRTU@redhat.com>
 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
 <auUPo66ISiR2gzmi@redhat.com>
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
In-Reply-To: <auUPo66ISiR2gzmi@redhat.com>

On Fri, Oct 30, 2026 at 10:44:03PM +0100, Oleg Nesterov wrote:
>On 10/30, Joe Perches wrote:
>> Dunno.  Depending on the current failure output
>> maybe adding something like the below is better:
>>
>> use Module::Load::Conditional qw(check_install);
>>
>> if (!check_install(module => 'JSON:PP')) {
>>     die "$P: --json not available - missing perl module JSON:PP\n";
>> }
>
>But why? Why make get_maintainer.pl depend on yet another module?
>FYI, on my Fedora 44
>
>	$ perl -we 'use Module::Load::Conditional qw(check_install);'
>	Can't locate Module/Load/Conditional.pm in @INC (you may need to install the Module::Load::Conditional module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
>	BEGIN failed--compilation aborted at -e line 1.
>
>And for what ???
>
>If we want to "improve" the errmsg, we can use "eval { require JSON::PP; }; die ... if $@"
>but this looks absolutely pointless to me.
>
>
>Let me repeat. If JSON::PP is not installed, then get_maintainer.pl
>with --json:
>
>	fails the same way before or after this patch, I see nothing to improve.
>
>without --json:
>
>	fails before this patch, works after this patch
>
>
>Sorry, I really can't understand your concerns.

I think that Oleg's change makes sense. The only reason I originally relied on
JSON::PP was because I was under the impression that it falls under the "pure
perl code" guidelines and gets autoinstalled with perl.

-- 
Thanks,
Sasha
