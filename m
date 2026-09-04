Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD04A43F0;
	Fri,  4 Sep 2026 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530398; cv=none; b=B/Sq6dgxtxWFxAm+DEWv5Mvfz/BOzhci6HbTTgrL08+MWrov8mpeH51n1jhl6b1g9SjaYtl1IN0uWO5lwKGfptgDOQeiMxsHPrmU74+uQM0gixgsfrrIVPR9TyTB9rwMCUOkQDkBBQp7/njaOWULwN2pVSgF/taHOFkPL3ZE5ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530398; c=relaxed/simple;
	bh=o8nxQ8+MEobjRr1pBtMJCs8boRpyliB6O3go+QJO+sI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BvzjE/Io8ht0XJnu+0+lXKdIxi7nVSlEAKWzXeW/LT0MVZGaLUqJdGHsgkXlOuPEmrdx33F/1MoKwlEnj+SdzcqOuQR5NrTazvzInsI85nIXAp64j2RfzRUo8OVxJhmoI5BRnpeAR7rMfyr6pmYWPM1kuXlIdwXAsJvx4939XQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FH147P66; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FH147P66"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4C6444158A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788530395; bh=o8nxQ8+MEobjRr1pBtMJCs8boRpyliB6O3go+QJO+sI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FH147P66S+wA7eEPGnAsg2B4uoTek+ZIWI4PsxthCDMUqf9zUo8VhV7hLpiMJvUXa
	 BlTYEaWAvlnb/Wrc+KRKv1ybyoJuMaskdFdbmr82iUqZZ9n4CfmiEHs0IxVP+YttT2
	 Xyi6+Z5CT3OfgB8n2BF5XlXPvSQo6D/vDr7ALBM6tzOSKarCPsHt+lqZzmVB4AQCNf
	 WAQuUhIluRz5uikUEKIlb2m6JNWg9DUyocO7/5/2SWRkY9mL7zmH7tq8+e1NMqdqJ/
	 YAy7XRkyzynV4TKd7qAz9DoahEbFQfiduS3u189Auerk/qljPRlZfZf7sZB5WFdhv8
	 cHkHxukLOt0dg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4C6444158A;
	Fri,  4 Sep 2026 13:59:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: verify/bisect: fix typos, formating and
 punctuation
In-Reply-To: <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
References: <20260903154336.732305-3-manuelebnerli@mailbox.org>
 <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
 <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
Date: Fri, 04 Sep 2026 07:59:54 -0600
Message-ID: <874ig52k2t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> On Thu, 2026-09-03 at 09:59 -0700, Randy Dunlap wrote:
>> Hi Manual,
>>=20
>> On 9/3/26 8:43 AM, Manuel Ebner wrote:
>> > Improve readability.
>> >=20
>> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
>> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>=20
>> It looks like you might be misusing the Reviewed-by: tag here.
>> My only reply (to v1 of this patch) was:
>> =C2=A0 https://lore.kernel.org/linux-doc/0475c09c-e165-41a5-b654-5c6aefe=
aab0b@infradead.org/
>
> My thought process was: when I include all you suggestions and your messa=
ge ends with
>> All of the other changes LGTM.
>
> you are good with the result. Thus Reviewed.

Just to emphasize this: you do *not* get to make up Reviewed-by tags; if
it is not explicitly given to you by the person involved, it does not
exist.

jon
