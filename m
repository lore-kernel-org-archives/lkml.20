Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEA34DD6DB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980861; cv=none; b=iemcEdDQlXCqbL4g7UIkH830LFeMERWCtGXZQdd6VCe83ran129mOxPoGmQEhi+tS/qx8OxBDezuTbcl18jn36UT0GYfZB2hYqfn9mVLu/21eJOJ4uo/iufsbcyou6afh+/9DG1JP34WUPUFcNbId7ZwDDdOzoK98TZNUqMwdw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980861; c=relaxed/simple;
	bh=t+tXOJgINuHz5ua6C+34HLQge1ta50pjf8UE+NV3Ad8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRPURdzqOeyqdXw9NWx/n5Dy7hN3ugNNzuZD+DOghrEE5aeEJj1gt77XlsAukuYjdPF6Ga4Uux+LgARZo7yEN9sfYeLURA+AR05LocKc1OPisH7vaahIhRqwLWwYuIePqtzNMhxdusX19GUqQFz+dY/N1/PyKbpb6IgpYBm/1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKaI3MWJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKaI3MWJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so55071f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980858; x=1792585658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bU5WoXEdNTnz+BAlcIBVqmgTpCbqy4PVyKMuyqbaZGE=;
        b=QKaI3MWJ0JVmVSc1vGOVIC/GF97hRyT3l0VbMBfDtGdJck/2HBAOSMI/EpAmt6oiXL
         Y6yzlzIqiy974y1UWonOY1sjE1KH+nSdpUsA3+0pvq18XIk7eGmEEeGiop56ke+uaCAb
         ho3DjA0gXqIi/8TfhsI8VFrcCbq9xKAS4tqB7Gg5PPuCYFUjmzjX0Otg4AZ5CixfyP0k
         +zbsPtMWLGjZ9DZSq2t16T7hoTZN2xWMWvk8eHx9bYxvm/IRzX4+HIllQmW9z9Yrd0g1
         mdo1IqIEo+U3JOdwdR58vy9/iK4ZgZtQQWJeOzEc5JCyyr/1wW1APWmMtWufefDkg+wl
         hvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980858; x=1792585658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU5WoXEdNTnz+BAlcIBVqmgTpCbqy4PVyKMuyqbaZGE=;
        b=KY3nEVzmufGZyYp56mmMQa9oii3KZEbb7ql16UG1tYk6st+908Q/UOJLQVmxnyokHe
         WwqrDKp7zJPW9MIoZLzyZaSXHnNwDpWm2EA9Oygw4wbcXiZM/Qm25Pv4aHmuglkGtUSy
         4aKuqpjMe9czVM6vaOczmCcgcs5v4OZWFQYRZf9jUEze85Of2q3QJEvfDxh99AVADz+P
         MMGU/n7/LX61RwyxmWemAXi30RgM25vQHvYlGcpmkhYXLmdyhZAvQJejwPjFtruas61S
         D8tOyy5NRFo2En+3uDKv6jAN31A5wNRIbA9FPwBI/beeTlXQgJeq1SW+1OgwyZKe8IFl
         vGtA==
X-Forwarded-Encrypted: i=1; AKwUvBxpogONqXQMNOq5nNMYzDxoB3EkR59mkBW6x8d45dEB06SfuepwpdlBchVpS42U7hfUt1l7B0k0dyJi4Gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/z288p97jeGZDnBAKfcZjyWwdpuKq4HMFFwvr99gKgqTj52Jo
	9+3xNGaWYIlXP1f9NPdfK5jZdchuTkLdg/daCBqqz8xZjhTEm6LeqAdnedDxW7YL
X-Gm-Gg: AYBFou19PcFSvNG0vVK4v/jwOPILqqpEjEcV0ZQZBYavqUrOkZelrPj5THHPgdNFlnd
	nnk9pBbFi/BuWpWpvkw2bJdJ1idLdXQ6NwxKD9J+2ki4boB9iaDC3VOO25a2Y1XmozSOh2cgkzn
	IjMfcGKX5DqioskjniYZpx3ulh5aZ7qqvtQqLb5lRVEmoyKj9c9bJpVD6IfKW/cP+uRhu3NDUuV
	fTI2zHMZuq60kXfvX5eoL3ygG79/UFUL1IKt/2K98431T7FHpy59leTQJyWd7avuxDJIASPmYC7
	uqYehuDesNC48tYPZffMQ2HpVZrLiroyDRYYlHqDMojFjwoKtz9HsEvbcXqt+q1Ae7ThtVFE5yQ
	BMeuOrVBL18kyBjLX+r9/UreW+dWBfSE7YRZxDILaLRHc9Ebl3A/ZTSYu2o6sxHka63lwZVOPlo
	5kI9WJ5LeGVkJFaA33YMUJkdpaIwR8FkVg0KcaukSJ/9bOhTs3IC1eo6kYh4NgGga4oV7PUTebd
	+0SBK6lbjAS3cnx3cQTbFgqKwkrgG5GGSE=
X-Received: by 2002:a05:6000:200f:b0:48c:5669:747b with SMTP id ffacd0b85a97d-48db9465ffdmr35843535f8f.8.1791980858010;
        Wed, 14 Oct 2026 05:27:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaad1sm11373355f8f.17.2026.10.14.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:27:37 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:27:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 2/4] s390/percpu: Drop unused output register from
 arch_this_cpu_add()
Message-ID: <20261014132736.10a32cfe@pumpkin>
In-Reply-To: <4907dbfd-3c5c-483b-be25-b0df83af2d20-agordeev@linux.ibm.com>
References: <20261012114249.2898572-1-hca@linux.ibm.com>
	<20261012114249.2898572-3-hca@linux.ibm.com>
	<4907dbfd-3c5c-483b-be25-b0df83af2d20-agordeev@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 15:24:20 +0200
Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> On Mon, Oct 12, 2026 at 01:42:47PM +0200, Heiko Carstens wrote:
> > The laa/laag instructions return the old memory content, but
> > arch_this_cpu_add() does not need it. Instead of allocating a dedicated
> > output register old__ just to discard the returned value, change the
> > val__ constraint from "d" to "+&d" so it is used as input/output
> > register.
> > 
> > This reduces register pressure.  
> 
> Do you know whether the compiler is may be smart enough to select the
> same register for old and val himself?

Given gcc tends to allocate a new register for x++ I doubt it
(and then has to do a reg-reg move to put it back).

David
