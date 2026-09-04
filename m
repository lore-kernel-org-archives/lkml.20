Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E7414A0E;
	Fri,  4 Sep 2026 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500091; cv=none; b=ednOIG1/sc8+Bo5A3eAvHoxr5GP1Y/8ohTfuHBgB9C2NbIlRBT3TZXPA+rtgiKTulIyhIA9Lj/zHAli0y7J8oln/GaCrrmT9ZpBcwZHPldBqSnMTfrkGkT46RBLNLccVrdE6lMtBreLqe7vsKZqUN4zQs98foSVVBEwAxeqv3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500091; c=relaxed/simple;
	bh=LoSIabbGCm3jmP8IHBvygHcW64OGDNns/l+oY3HHAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2n+LthfXIOyPuWdqCefifeJzEgUQgUBoMomVnCXZZLWusIQnUiwpKUb6pRyZnnep+vu6LidaRo82M8pAKomBEbXoSNJD7jeX4RDkYPFEqeVXzOQLexTYVLo4KNtvYSKxi4gdWYPqn5EzKO+6j8+TdNq55RmTuCmMdbRX1KdE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NKESFmSW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NKESFmSW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=noERAy98ksBHJQxSSGOOcw+tFMb50cbPWoj0qJBP4Mo=; b=NKESFmSWQ8HRKMj5l8wqqHRElj
	u+rcPL79KhjjEA2tcRYWH7yB1+oMOgFkQLlVFmvs67LksmNgMx46iHvj9nElPIaJmqGcVv0uGAKHM
	YMJSE9e8KhRnZHFBW47GNbYxpR4Er+bUZBOxqzO7+PeQkqit5uPdiZG9jsPigRrigTNPNepBmZXc3
	6tJHJZsTM1WFVmavMCI0IQCfu4dO3fuLtFjVsEy1biOnvY00gCBAP0mhRsWe1Kw6UdKwMNrQzg+hf
	zop3u9f8PwvBj7fpJETU+kj2M1HfcKEt9oEB/nUDLFC8GWNjiRqV26efiIZCD+bMsykTYjL3TJVYY
	eyOs9evQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MZW-000000014fy-12qQ;
	Fri, 04 Sep 2026 05:34:42 +0000
Message-ID: <24c2aa21-d491-4ee2-9d53-de593353f2cc@infradead.org>
Date: Thu, 3 Sep 2026 22:34:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: verify/bisect: fix typos, formating and
 punctuation
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903154336.732305-3-manuelebnerli@mailbox.org>
 <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
 <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/3/26 10:18 PM, Manuel Ebner wrote:
> On Thu, 2026-09-03 at 09:59 -0700, Randy Dunlap wrote:
>> Hi Manual,
>>
>> On 9/3/26 8:43 AM, Manuel Ebner wrote:
>>> Improve readability.
>>>
>>> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> It looks like you might be misusing the Reviewed-by: tag here.
>> My only reply (to v1 of this patch) was:
>>   https://lore.kernel.org/linux-doc/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
> 
> My thought process was: when I include all you suggestions and your message ends with
>> All of the other changes LGTM.
> 
> you are good with the result. Thus Reviewed.

I understand, but still, it should be explicit (or you could ask).

> I probably did this a couple more times with you and others.
> 
> I'm sorry and I'll pay more attention to this.
> 
>> and in that email I did not write "Reviewed-by: /me".
>> Just because I commented on it does not mean that it merits
>> a Reviewed-by: tag.
>> I.e., a Reviewed-by: tag must be explicitly written by the reviewer
>> for it to be included in a patch.
>>
>> Please see Documentation/process/submitting-patches.rst for more info,
> 
> I'll reread it.

Thanks.
-- 
~Randy

