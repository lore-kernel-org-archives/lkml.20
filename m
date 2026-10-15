Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F53424654
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044270; cv=none; b=ZGo+rtq1XY9avL9cmJTwCqsaCrdnwzeZqiW5rhraH/PKGxPqmlTB711pYLczys1Jbkbm+KXzfVOeUmvwAHp01csPbP3ktVvR342GV/KlIrOtpv/IrX/E7BPkbPVC7rXXC9kCKpWBQHP8Bb9TglXl5yLQyD2Y7mRc5sbgSxsAZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044270; c=relaxed/simple;
	bh=O9/VfZE7uOoq3sBxGDJzdH/N8wtd83LVuG7+OmY/7V0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GIwtcZ9BJ5Lk3dyseObodRHoaXTgyy+gmXq6+hRNi1VTU8gh1oRh/HQuQi2XKbNVb2xWq4nqZ/lnDZIrbWQA67+rDadQOnBGJsRhl++Tkj7GG1CoU+0YS2JXb3RBbebi/Wjro7jkt7ctP2OH1l2KBK0D/Ov4qBsYbwpyk8rrJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/tRmJQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/tRmJQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED81F000C6;
	Thu, 15 Oct 2026 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792044267;
	bh=aymDNn0FhXlTZxe7DcEC0adYtQX/TQCGI4GGd2aYcOQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=G/tRmJQl4gwV8dKqlsEkCL95kh+od4ZjukhlyswGwf9VwvyvhedcBrKC5mSWupjx7
	 EWZoOyDazPiXCBgscGdIzfh6+VOdTo+TU6vd0MoEfP1w1f5e4Pcc7NK54KTuJItyke
	 9gTEzTOr4SDkG0v0GvOJn8kwh0QxfuA9liZdJzIp3sOPKK7XgFpqBTQP3aA+FzvtnQ
	 /vWsC2IdE5PpKIu5oQuvYI7UptQiBckyxj0750nuVOegvTuiwsdSOe5wh5rg0kzaFF
	 eLCerLEIeUk3e213sIYei3cCv69mZhsKii2OUbDtKsc1+RBIi3UR8W+BTW0p6TxsL+
	 rMeZIA4yiutvA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B0F98198003A;
	Thu, 15 Oct 2026 02:04:24 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 02:04:24 -0400
X-ME-Sender: <xms:52zQaqof2lbwr6VFQDajnQqgNZpJW9HNGeVi8RdiH4RHbPPVIQUQyg>
    <xme:52zQajcLmWupjvDFoSC9iwKGEmNo96U3C3jdaVXpJhtp1Sm0vbNSGeXvzeAqM7WiM
    VrSKgOTHJ3Wc7FTbHgKSntmOGAQLEVHHaCvQDmyr9mQ5_foSV3PlkX7>
X-ME-Proxy-Cause: dmFkZTGC8OYwxY4AeOps4cVTbQ5zEkpdNhG3e7i/iM928wyTLvFkl2YTBb1MmkIxuKLXQN
    W7NXSo13GEJ9yTH3x4U4RfC8QfBIjvH2txELGQKUbyQjClXZco6TRYtD5i8V90r6rogLXB
    FGeRsD9fpip3qxw94FZyuyXnhlyDYOpy9AsHeyHAoCzamIjKaIAR5SI17a1f9WeDgc8Hmx
    TP3LxY5vmAo58OXx/Qmz3hqZ/i5AbuH4Q1d4WkTl6SHVD2XSNFOjF5VrTf4s1/oqdvyNnQ
    KWvs4kAgmU0KO3O8oLlenrXPYHo4+vMSW+f2V5zwWVJ7mHes/9hztBTB4znIw7CC9Vbgrc
    LHSlP6vnMZsKpnLw4rIP8o5VfFo9hB5tmbF1Rtv56v4toD1kaKiK9INbN2/Bq1YSEF6dGN
    lVatspY25p2TMh/RxKG0HPoSFUrbFWObAi+2z+oLuhJTyl8ZPVJBXC+aIUnDWqCTHmm9Om
    /g+FMM8hIPIUUxbuLS0SVgJh5SclxTPdEXABIpbRnJ3Jous5Le/ptMeNLZuETsCaJEbgpN
    wCQvoe7dZw6tmeXRuwsKtIqE5iXhPD3CFuinFaUDRlTIJpdFaPzPcPSQGWIt9m0DwLA1z2
    mX6OrszUGei+v+t7N7SfhOWpwaJ9XPd6Ra1GCqxIHRB6iRti5KchCy4obNCA
X-ME-Proxy: <xmx:6GzQarT7IDWqKcwguNZKW3UxQ6ud-om9YBCVqbrIyxNrWBAiKQw7nw>
    <xmx:6GzQaqnxPjyNVPFlGBTsVKDYsX00EH6NhjMQ3lArfER-OyQdd1dmfA>
    <xmx:6GzQarTw9zbfylZCpemg3C6Qfq3Cl68siK8zJSU8Xzx98gYiy32cPw>
    <xmx:6GzQaoOCWXbY1WFw4cpokSdVNmSeJunTLLw8OsdnRkEDdr5T9uyLDA>
    <xmx:6GzQakVXDUKg6ROLu457PfTPvll9Mplq3PIbMlj6u4RbHsO_6qRhcteW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 66E5FF80093; Thu, 15 Oct 2026 02:04:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 08:04:03 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <ea212c71-90c0-4474-860f-3b1b33f89932@app.fastmail.com>
In-Reply-To: <061fef95-1a27-42e8-86e8-23172ff2425c@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
 <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
 <81c6d97f-850e-4f51-919f-cb3a11f47962@app.fastmail.com>
 <061fef95-1a27-42e8-86e8-23172ff2425c@amd.com>
Subject: Re: [PATCH v4 5/7] x86/sev: Register the guest with the SVSM APIC protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 15 Oct 2026, at 05:56, Melody Wang wrote:
> Hi Ard,
>
> On 10/14/26 2:43 AM, Ard Biesheuvel wrote:
>> I'm struggling to follow the logic here: doesn't this attempt to locate
>> the protocol on non-SEV/SNP systems as well?
>
> Alternate Injection is only working for SEV-SNP guest.
>
>> Wouldn't it be sufficient to do
>> 
>> if (!snp_vmpl ||
>>     !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>>         return 0;
>> 
>> and leave the early_is_sevsnp_guest() check alone?
>> 
>
> The thing is, snp_vmpl hasn't been initialized here yet. We read here a 
> 0. So I need early_is_sevsnp_guest() to initialize it to U8_MAX so that 
> I know that there's an SVSM present.
>
> Then I can enable AltInj.
>

OK.

But there are three conditions where there is no point in checking
whether the protocol exists:
- early_is_sevsnp_guest() -> false
- snp_vmpl == 0
- (sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ) == 0

So this should be

>> if (!early_is_sevsnp_guest() || !snp_vmpl ||
>>     !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>>         return 0;

then?

Btw please don't use bare '1' and '2' as error codes, especially
since you don't actually check the value - just use a bool instead.

