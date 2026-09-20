Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6977147209C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929029; cv=pass; b=lClZx55hlE+K3tbKU+XM1pLP9Ut8YFQzLHSZba2Hl+jKBZEIcft+vzqBsMN0JgEhNqrFFspoHvtajqUmr8/ukeCw4CnoZDq/cCbL7UZJNjP6/rH+IzW8pHHLweeaz6Ze0UEZvhJUZALk5ufBlUXoGHQH4HOX2CEMossMr2BCjZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929029; c=relaxed/simple;
	bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGEGZa6BC5bJtHMsLKpJxA96QMmHSkBg9G/Xj0knIOE8fXqJlaX2guoBo3Trm/OS8W8g+dpk64BhXPOiAIOOkZWp/1NmbBIyn1sDGBzDVJ6wmumqF9OnwiXB8GfxFeTU0iJ+4XLn0TABrs836XvvOKjIu9ldWKXedqqRuuWw2h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaG3cl7N; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaG3cl7N"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd3so18546691cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789929025; cv=none;
        d=google.com; s=arc-20260327;
        b=U7Bn1MyOBOXV7gPai9mU2YagcaLK5bLTAcFoHcFwt0PxC2rIOdmnZr3uf62smEDns/
         gUjylOHAed1ub+6ABR/cb0gat4gySyMXqxKW6OQ1thH7Ja+8e/NrsX44pk8VaH687Nf4
         hIGLVXboaBL1g86DJTYLQKHBHuxC5UVVVxu29ftcbPWLMpXS2bm58fHiqIZZfCEmzK1w
         77YbpNOChcDePGKKLe4FJ4CQ3Bg39QHqcDt3toFPRApa1/iZ/UF41EJdMFjmHTUX3PRz
         LjheGvPgddr/wTQTxCcTXzLL+XB/JFB3et+V+IpGUXlplUF00W0CHyb1Mvx77rZiEsDW
         CsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        fh=tidz5qvisWQpY4mYa2MEhE+S9eKBJZxqtdpM5tobHSM=;
        b=b5ZdkFD/ps0idMCgWPsKkTwkjE81gYixC+L4d8nlTt7yowox4OANbVyUhBMIQ+kcLK
         YNs2JhUfuwd64UU+vxsy+6rtmw4Q9w5t/HqvWHEc04rMbqQ2Bw39rinPlWrVZrYIjxyk
         GL1jd+BINzHM34hJqdDcLk5eol5fRsnkIOlFb3/J+u9g0UreE0fvWPcHtuK4c1Vd8Rzy
         qS3jz084g14u5Dlb5q5csTaVkZZgJsGQsS7cA5N/tdrVnMpArkPqBgyX/SLJorGWT5n8
         eWP6OWh4MZ+/8b1n4Q+J0p9f6t/HrAhdyatwXadPy2gBtr80XWwDlen4lYlXjjguD36b
         i86w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789929025; x=1790533825; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        b=YaG3cl7NQlOX5sEaIeBdGcdl7kRSlNCc7iLPPzx9giKTTzeDDzAHyLiFHveLy3ILw4
         DCfxuXs+e2OPW5eYcqV+3Z9dbmmaM8r4EvbyGkdyzdFQuHdruHl9mUZO1a0OhMxfGaZW
         Hcfq1FDpV2GS4Ada57FVhhwVBL2BXrS5hYGhRTlzzdtFlZ03OCtBKJhimZKx9vMgKaKE
         KUO+JtNxvIxcqvvGtUBrdAH39GxjqSxwUjWzEbqYe7TYhSpTD2UNuLFx+VvTkj0lG4jt
         eu30SjOi/ojUee7DWonlvdPfz3IXixkMZkZh5aF9vyXmLJ8vacPdUp3Qv/B5cJy7AW7y
         4c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929025; x=1790533825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FKCEyfg1kyoQKkvyPDSZQB8QNOiucdD/LjiJ9D/YVh0=;
        b=ZBIWlZug2vvUi3RiuZMC0fhn0Y1ub3YHsFupN9rNriMTmJhjXkwkmXb5u2AxRTSbgG
         ZD6ZHEVEGGP2BG035s+BU4L0OZxATQx1O2uE2nv0b69Hy32Yo6EJaCX6XYIx1DwmqYBH
         s5jxY9X8Ph0xl1qXrbqp5BiJB7V3jbtgC3oQRj31jCETfVeuEw29Fay3AwyxawAjmZjX
         mmwoUFXfhSZA0nl7S1AAAALYhtFBZskzfl1uvdVvv//tfphHcbMrdyh4DqA0mRN/IJl9
         nDUM1dO533e2LAhhKzBfJHnAguZgVYXcS8fUu1PHlLHcnf1pgAlUyCvpUtqn8obNIQJH
         0psw==
X-Forwarded-Encrypted: i=1; AKwUvByyrVtM9BRv2BONHh05py9UQN+q64iiYrBcdyT+DP+Up0NW4qsVfUu7I028Axtxf8n1Q4lRD3DUQ5QvCCY=@vger.kernel.org
X-Gm-Message-State: AFuF++mOMcSl6jWVerq1mdLCOLLs6EXrvgXVtAFzw24PqMjEN82aiO+Y
	qDAzHv95Kpr4eCevTQVx2eCIuKwbHH8bO9EtNE+XcvTCpgaLYBooiw4LloM222RIYJFSyvKiy/8
	HmmjexzxMnbbo1eTmPWlmfWeHH8FLPKw=
X-Gm-Gg: AYBFou2uMBWYeyYSsI6yTdASyjZZHatsqhT3wRWs3/CIvom52clbhKMuvwgvGijTy55
	v5KqFpwIV6qa3zXYB4vcke99AXanEBU/fdK8ihlhhcQXMARutTr7wjLjvk1qRploqSuQ6CoJnSc
	dv/z+o1xUQLzNTXFE1389JGnwqINFAKumkzQwoBkyYwZCjJnplrFXFLF7wLnlWaGJwF8+5lAYlC
	ZPE6CneXOMJM/JqMg/EspSI0USIIN2SE9j4kkehSCUKapg35W9836AkRrXvYNLO1Pi7MPUXICrQ
	wbSnbkJP+3JlW5Au0bO9cMrh8H6emA507kamYcckzdgGdPkcTRgGnOBJMvZORStMihpCF0646aR
	9Yhb0I+wGPIx8
X-Received: by 2002:a05:622a:5a1a:b0:532:acb9:5953 with SMTP id
 d75a77b69052e-532b7343d9dmr67177321cf.31.1789929025258; Sun, 20 Sep 2026
 11:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920094058.9664-1-palaomer100@gmail.com> <2026092039-greedily-jailer-80e5@gregkh>
 <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com> <ea6cf31e-0acd-4248-9359-5864bf8f6f94@kernel.org>
 <b33efa2e-75e3-4163-ba1f-712227b438f8@kernel.org>
In-Reply-To: <b33efa2e-75e3-4163-ba1f-712227b438f8@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Sun, 20 Sep 2026 21:29:50 +0300
X-Gm-Features: AcwNN1VyBiPlzPcXjoGv8BVs7qS-DsxYSqZXrQgC6ZmVEyZokGmq-0S-p4wn5dU
Message-ID: <CAKhZXnrnMvZTUiUwtconm+rr3OBy4fpvDcvgxhToVkNED6QH2w@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>, David Lin <dtwlin@gmail.com>, 
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> ... and if you even asked your AI like I did now:
> "how linux kernel developers look at LLM contributions from beginners?"
> I got:
>
> "Linux kernel developers view unverified AI-generated code from
> beginners with heavy skepticism and frustration due to a massive influx
> of low-quality submissions that overwhelm maintainers."
>
>
> "Rejection of AI "slop": "
>
> "Staging area bans: Certain high-traffic areas prone to beginner
> contributions, such as the kernel's staging drivers (drivers/staging/),
> have implemented strict policies forbidding LLM-generated patches ...."
>
> Yet you did exactly what should not be done - were using LLM.
>
> Best regards,
> Krzysztof

Hi Greg and Krzystof

I didn't use AI to generate this code. It took 5-6 hours.

I don't know why you said I used LLM to generate this such code.

Krzystof wrote:
> So you received feedback from Greg, but tried on different part, hoping
> this time it will get accepted?
>
> This looks similar to you previous approaches, e.g. for DT bindings,
> where you received comments and repeated the same thing immediately.
> Three or four time.

I generally write 2 or 3 patches and send them parallelly.
I won't do this again.

I thought fixing some spaghetti code and changing mutex_lock/mutex_unlock to
guard macros is fine.

Best Regards,
Omer PALA
