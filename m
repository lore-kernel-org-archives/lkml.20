Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6722251E429
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859943; cv=none; b=m4r1zdGUYe89B5jA9JCk4K6sHHhtA5lu05r7NZ1REd1RbdJTLhRgTozDQeQtTAVMDn1Cg7TbVqZMFNmPErM1ATgPcI/86FLHIgiffTexXHTe48JKPmbpHQhPnv/bOapqOZ2YlesyhFr7cUqAqXT2i9TqjntHmjrMOOyD/j8qscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859943; c=relaxed/simple;
	bh=BqbMqlm4FDsGzMYuRIEmsBVHqYZ0z3pDff8KoOkJopM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjSdDUcg3CwxpgwaGpTGS0QqXTkqlCpV+wQB5lqZ2ek1e4MmcxpFWQwtzeeUKufnUwaphqZur3xk8tnZ9EZhN35RZVQmScx+r7EwVtcaWyAxVp5l53JVp3krdPjRgfEISwOu8V5/UgcGxFf2Cp8sn5HbSlSxn2ZIMMXrg03CkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=is6KQl01; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="is6KQl01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C3E1F00A3A;
	Tue,  8 Sep 2026 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859941;
	bh=idOnIsbF4aqGbbwgFi07xd+2BwFsQcBoIJ7fhbX7sIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=is6KQl01jgWMql6FMQr1xk4ZLTp10tUIpdaw1BuP5Rf1d3EdS7dMLKaiPRZThwuqD
	 Zz3wcM39/XWli/MFxs5l2NuNPSjlU8qMWXqNptPFuT4CFfVUNdkDthAFS1YK6zQLS1
	 nmtpMdpWmBqCCe2wIfrgXYPvi8EvGSNXfa7xlVQe2pGyMROlgXFPsY+GF1r/q/OwTB
	 p+s5pjSRGKJFXbW5tWnRNXxcQRntY9B3rZ83+pI7dTryfPaOjIWD6J8mfxP/35Wwg4
	 NCNXkDMfDYhL3azEtB6DmMI4zns9IM5YqZaboMTZZIo95XbBv3wHc3xcP0mVoCNIyl
	 60gxvEX45F9Tw==
Message-ID: <90cd8ace-b135-45d6-815b-bf7329cbfa4d@kernel.org>
Date: Tue, 8 Sep 2026 11:32:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in vma_add_pgoff
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, jannh@google.com, liam@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
 syzkaller-bugs@googlegroups.com
References: <20260907192517.564ea15aa8c9d47669b3a81f@linux-foundation.org>
 <6a9f8bc6.f614420e.2bf292.0005.GAE@google.com> <ap_Uke89Q9LWoaoK@gremlin>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <ap_Uke89Q9LWoaoK@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 11:25, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 07, 2026 at 09:15:02PM -0700, syzbot wrote:
>> Hello,
>>
>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>
>> Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
>> Tested-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
> 
> Yup there we are :)
> 
> Why is this constantly duplicating I wonder...

Going back to the first mail:

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci

We can see it's based from 7.3-rc1:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-kernelci

And since the problem was introduced there, all kinds of development trees
for 7.4 (or even pending hotfixes for 7.3) based on 7.3-rc1 will now have it.

I guess syzbot has to learn to recognize it's a known problem and ignore it,
or have some repo of known important fixes merged after rc1 it applies on
top of such development trees, as they generaly won't be rebased to later rcs.

> 
>>
>> Tested on:
>>
>> commit:         35b0fb39 mm/mremap: reset unfaulted VMA page offset fo..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15e13af9580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
>> dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>> userspace arch: arm64
>>
>> Note: no patches were applied.
>> Note: testing is done by a robot and is best-effort only.
> 
> --
> Cheers, Lorenzo

