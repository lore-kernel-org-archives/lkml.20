Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595017;
	b=Z1h1tiVU7q2yoZXuHlBotMjkEmKEv4PsULYbehqTOqFlo0ndOjdi1z58LGgMkGGhav5f
	 K5wqUxMDuoHogL87cEgfuTPpjbaupn7bLKtEAUi3le+YB4O9xccy3MlR5apmWoE7lcdIb
	 sPvQ+tIpExFLkPxS9EwSwteNMctwJir/TAIkIQw9DxQ4yxhIK4+A4ZdY+q0IasHD/fGMt
	 d4FDgevLtEplSurYMFemPtS9qLjvBW0X9ocMTIjSja2+Q7dFlBIVy2iEVqbOMb7iEJhDu
	 6Qbcl4rbaXHCn4hUd1GEMxt1ooCSHJwxAUhV4uziPYNDo7IXIChaIpey0oeMtZnrB5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595017;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=cGibf219lFshz4zg87xDrPCKkPS0kKQ+/UsjUZBsyew=;
	b=BIfb8HU9DoNoWmxKsf+aaDhrHbIgqcOCSnDARxdn87ok7WQHAp8zlElmEL7w4dIF0tQA
	 9RsibHojMQ6B/AJB+vPwEuYJjU8RuBJ6fTtlMa8+B2foiM1jKtE2SMiWok34bvHOYUEAd
	 0JWFlJcW8NgXZL7D3d6VQOhmYfCoj25IjkbyG8W7YvPOItmsl8JJ7zjMA5uOBA0EPCJa4
	 m9zwQWYwNoFXYQyCLl6E6TiOX+WRSR8hX0f5/EKpNycLt8AGf1Csj8+WizpugoOFngL9m
	 TvC48skhwJBQ8/ifU2NYwNNosv7wDLQ30O1W0/QR70czHKcY3su7+/8lsDGjUkAhcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=XoBlAdga;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97706606B31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97706606B31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=XoBlAdga
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6ADIaZhT3213230
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 13 Nov 2026 10:36:36 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6ADIaZhT3213230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1794594996;
	bh=cGibf219lFshz4zg87xDrPCKkPS0kKQ+/UsjUZBsyew=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XoBlAdgapymF8RMtIL0N1CufRjenq98lGdNkpbnxtywsJ2RWZyqDvVY+o+GvXmMvH
	 YPedAX0wylE3hv7heDsP310ysELYu7b3IbivnkRfTrKLmo5+Tf0b/13JUtkBVCqHhl
	 Ms17hJDSqT+zBrYldIVkyBJgBd462ry+GCvAvn3Uw4Qi+VOP9lYDn/ghHtE4knty9e
	 CnSxzYWU5Rn/5IFc3K993LnR1/BbZ9LZvdPhmLa3ZTOsK0HLGEB5iXEW+b3pHT29kD
	 EO6FukeedblpXHjr2QtkUn1g6fh77CA2JlxayxE7vXEA5pxayMSW2rNHcnR98Sl8Sp
	 7P+P8duU1yAQA==
Date: Fri, 13 Nov 2026 10:36:30 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        David Laight <david.laight.linux@gmail.com>
CC: Usama Arif <usama.arif@linux.dev>, Borislav Petkov <bp@alien8.de>,
        dave.hansen@linux.intel.com, dsterba@suse.com,
        linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
        tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
        riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/2=5D_x86/lib=3A_Use_REP_MOVSB_f?=
 =?US-ASCII?Q?or_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local> <20261113141137.1113517-1-usama.arif@linux.dev> <20261113160300.3f0d0a37@pumpkin> <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
Message-ID: <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 13, 2026 9:34:26 AM PST, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Fri, 13 Nov 2026 at 08:03, David Laight <david=2Elaight=2Elinux@gmail=
=2Ecom> wrote:
>>
>> I was thinking more of something like:
>> (written in the email so untested)
>>
>> static always_inline void *memcpy(void *dst, const void *src, size_t le=
n)
>
>The problem with this approach two-fold:
>
> - many memcpy() calls aren't actually memcpy() calls on a C level
>
> - many memcpy() that *are* calls on a C level should never be calls
>in the generated code
>
>That first case is for things like structure copies etc=2E And it's
>common, and it's important, although for the kernel it's usually a
>non-issue because it's *typicay* a small constant-sized copy, which
>brings us to the second case=2E=2E=2E
>
>The second case is hugely important=2E The compiler needs to turn small
>memcpy() calls into just loads and stores=2E Calling "memcpy()" for a
>known 64-byte copy is hugely inefficient=2E
>
>We used to - long ago - do that "constant small sizes" thing by hand=2E
>It was a huge pain=2E We now rely on the compiler to do it=2E
>
>End result: we must *not* hide 'memcpy()' from the compiler for
>performance reasons, and we cannot catch all cases anyway because the
>compiler generates implicit memcpy calls=2E
>
>This is why I really wish we had the compiler just generate a
>different sequence for 'call memcpy'=2E One that used a different
>callign convention - preferably just the 'rep movs' one so that we
>could just rewrite the call with 'rep movsb' in place=2E
>
>Without compiler support, we're kind of screwed=2E
>
>              Linus
>
>              Linus

Well, we can put a request in for compiler support=2E This equally applies=
 to other compiler runtime functions, for that matter=2E=2E=2E
