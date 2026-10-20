Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524554;
	b=ytsmxdzuiAF6h2Scaem4t6wT/5wPNey5ZXKZ5VbePsABlaB678kr6wuvrraRuwk2tg6b
	 jZoUNixxtlEgWDgFb4HRfwdafwF4VnxpWYrB+3N3WMjI5+/q9SSAIuYndyCBSt6M8SguI
	 qAcC5pEyVIYuMl8/3oorvUr+aPcwTZLRG7K32CnNeBkOTuJlqQJ9/44JgZqHAe5Uc0RLd
	 wbhxI5KsJiQ6pwC8fKmthIaBIYGD4WTImoe+b61YE0I9QqwJT5kj0DYppMcdO5FqQ1EmL
	 z1bzWAQskEz6Sb7T/uMQxlfSmbBAG02rjRKiba8LuEa1Qy/Rm2HP4sweNBXL89I7SuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524554;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:To:From:Subject:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=gxmfx2FTSYnlb4ZPvfPHrgeP229HkVA6ZTsjdn5TJZ8=;
	b=OMtRcRmGlR52ufsLQnqilp45OTA7v19p7SH5z32XzXlIgr6sgraK054T32Pi43Slxj9c
	 l3hf7Gh6rjAqt/EeTUNlymtFhrtBmjt+j9moc9mRMZwGTejAhli1egq2+uI8j1XE9H2m4
	 USvFchq/aW09eAlMyxUkaww/QgD/4+eHlg+KhJHLxg3zrZTth1HX0gUUY7Nk62RuyOEzR
	 jlwlruW61q5WRpKW2r2u23FDPuUgW+vIgNdCgUstQqYAbjC67cCZUktGfetrVmnEHF9nj
	 KptZmlv/iyEjZO7ISY8biv225U+ASZy0mGahYBeYLEbLsN2L2EKhc0smYITTOMY2smg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=eMH+1dai;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=eMH+1dai
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8479f46ecd8so7282a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524552; x=1793129352;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gxmfx2FTSYnlb4ZPvfPHrgeP229HkVA6ZTsjdn5TJZ8=;
        b=Jjirffrq67eFKYvqco+GFFVnVfcweRmolePNOtAxR5zj+p6FSUrIayBBOTS5fMqL1N
         SS7nG5h81CN+uWVCYxG4wuphgmGvIfwaY4dg8DqP7KMU+htIEBOR0W9ub0XvglH7uOMN
         LLv5shYPpO08+6kCW9q0rq+7ImMR/shaYAnH4Ls0onlAeAOH36+BZFPfkT9UAP4UMg44
         v7OQt9VscfKqyUA6CzwWNuFpva+QOONqesqMSxeaQwqJap9rMYOrGKEOu8+0/EI7/GkF
         hfW4QQtabhVO3ULSgmMHYahfinDpShSgua1JX396EE8hI6IjggLWCb+83z+96H8hza8d
         FLyw==
X-Forwarded-Encrypted: i=1; AKwUvBx0OS+eIxOec36sDd84a4H8ETZjqM8vtGvT00WLa9dI0isBkRHwTdFMYyNTniA9GJpopCCuuULSwbtHex8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvz2Y+gSrfmtL4UjkB1GAxzD0ElxykdeTg3fpZJT+AYIQUqdDU
	MrFYa1Rn5fpzqY9ygRoRRXqK7EXvJPRLYvd2y9Ab/uZjhDasPzUIZp/0FbS7Vbhp
X-Gm-Gg: AYBFou3UV8cLnwA16db1KWgyQb7iVSGfhedPzNfz8tuYJ1O7TbQuIQNXTKzF1FWl1O/
	yS2veMzzsEr8d69qVA3DGmdIRLk8W51Q3zZhKltjQl8DQ0bwfiTm0QSccez01xxt7VdKs08u7NG
	xfJ8PPBcoR//b1971AaKbkZtHEARXiid/pvmHFxT5WFQz4f7xGKlDpYbk1XMcSVZ3QY44X1e4MA
	TN2kxEmh+QCnPs9kd7E1bV5k0LzsIoN5/iducnYYrnzqINF+EB3UuBdSTSWYWjQrqGOJdaT6iXO
	Ps9S+V8AyioAT1c9CJO/agUI3GA0UFeEJLPvyZ0JJ9Rxo9JSFifDV1J6kNPe6F8KISXDK2glY3N
	a2FH9mEhBVnHKJBZWm0mAZOwUZSlm8/KtEfd5977K7EhLVKSoAXblP86jVrNjjM7jDhaXi+F6Hk
	+tAq2riQO8ULjNAJXGeF3TSgPGiVL6iaoJaOsnqs/yP7bV++BybJQcEMO/+cqEr6Q0ucPihNa8f
	YTpXfxJuymWKK6IbN4jkzSm3YhnFkUUM7oTdbVrQID+6rL5hNo8eHCKL64PI9a7/yeTM3mk/vpa
X-Received: by 2002:a05:6830:211a:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-844ff9f3917mr12384477a34.12.1792524552123;
        Tue, 20 Oct 2026 12:29:12 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd7d5330sm352633a34.21.2026.10.20.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:29:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1BA5605ED;
	Tue, 20 Oct 2026 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1792524549;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gxmfx2FTSYnlb4ZPvfPHrgeP229HkVA6ZTsjdn5TJZ8=;
	b=eMH+1daiOPVltK6bZN5KlM5uhoTkosIs5mPmi+m+v8HfcmLkBEr2zkY6NfjtnddThTsJ+N
	urhzWfPcitbSGIba0zsHY5HWijR5g0P5BVU+QIUdSBxPKrhB0iRZ4Cwd0JL77eaRC/VMxZ
	61zQmkdH+GwiFAMeK1GcsmLOVDtSGCDy2Y/1T8Tok2+V4QGzrK8rO33knDpBitiSoIqE4K
	8IYN6iipxnKhLMgHJAe9WfxOZ2l6Be12OUp8Lj6ubNc0yOR6lZ+3KmbsbMECX2nDTd37Ki
	2q5qkfm69Dl1uOSpXCdggcH5Y4Luh8Qgb6YDLrITFbXZ8jTVP8Sb3lBGi2a4dw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:29:04 -0300
Message-Id: <DM9WX3PL8BM7.EOK1U3SXH7YD@marliere.net>
Cc: "John Hawley" <warthog9@eaglescrag.net>, <linux-kernel@vger.kernel.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH] ktest: Accept quoted bad term in git bisect output
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net>
 <20261020141746.187f15d5@gandalf.local.home>
In-Reply-To: <20261020141746.187f15d5@gandalf.local.home>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 20, 2026 at 3:17 PM -03, Steven Rostedt wrote:
> On Fri, 09 Oct 2026 22:13:23 -0300
> Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net> wrote:
>
>> Git commit 0c0f93e7fa64 ("bisect: print bisect terms in single quotes")
>> changed the completion message to put single quotes around the bisect te=
rm.
>> run_git_bisect() only recognizes "is the first bad commit", so it misses
>> completion and continues the bisect loop with newer Git.
>>=20
>> Accept both quoted and unquoted forms to retain compatibility with older
>> Git versions.
>>=20
>> Link: https://git.kernel.org/pub/scm/git/git.git/commit/?id=3D0c0f93e7fa=
645c1058226a9bfde9e2b4441edf96
>> Assisted-by: LLM
>
> I'm guessing you let an LLM fix this?

Yes, it actually hit the problem while running a test then I just accepted
the fix.

>
>> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>
>> ---
>>  tools/testing/ktest/ktest.pl | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
>> index f94ed2e98887..9d63a1dcdb3e 100755
>> --- a/tools/testing/ktest/ktest.pl
>> +++ b/tools/testing/ktest/ktest.pl
>> @@ -3019,7 +3019,7 @@ sub run_git_bisect {
>>      doprint "SUCCESS\n";
>>      if ($output =3D~ m/^(Bisecting: .*\(roughly \d+ steps?\))\s+\[([[:x=
digit:]]+)\]/) {
>>  	doprint "$1 [$2]\n";
>> -    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first bad commit/) =
{
>> +    } elsif ($output =3D~ m/^([[:xdigit:]]+) is the first (?:bad|'bad')=
 commit/) {
>
> Please nuke the "?:" from the above. It's not needed and I never use it. =
It
> only makes the code more complex. Yes, it's because we don't care about
> saving what is in the "()", but I never remember how to do that and thus =
I
> never do. The perl code in ktest.pl is meant to be easy to read by those
> that know sed and C, and things like this just make it hard to understand=
.

Sure thing! Thank you.
By the way, I just saw the thread on the git ML, are you planning to do any
update to ktest?

>
> Thanks,
>
> -- Steve
>
>
>
>>  	$bisect_bad_commit =3D $1;
>>  	doprint "Found bad commit... $1\n";
>>  	return 0;
>>=20
>> ---
>> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
>> change-id: 20261009-ktest-git-bisect-a894f472843e
>>=20
>> Best regards,
>> -- =20
>> Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>


