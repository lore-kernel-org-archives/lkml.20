Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A293A3E7A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616035; cv=none; b=cqlKs1UNfhibfkxYrtlsX5RjBBo07bzpcdOOioF4oRSlpXvtbbKlyd8OJl1XG+APRfsln/TdH4mU3YNy1WqQPkYBCWEgpduWBRRSDcQe0+EUlste93srbI3A6hrlbc+4REX6BptK9GwUjWPlu3S9CqObbgDVPzu+Fo+f81FzPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616035; c=relaxed/simple;
	bh=xiYVn57pn0XMpas+wlR8SmSSTnMiv5JdI/rPUiCUEF8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FRrPMlxmiBtUZNTW1wzMydgTuuPM1t1KSun0E7Mm6sJqcQ3haPEAAlPefLfV4aJN03nOXV39ePTduljax1XB0MVv5nicrvQynXm1DKm8Mnw/Csfnsp+1ARS2Xqb/R9sy5G3oc5UsID5qc1J9vTtizr73zBGq+ov0+r5jKie8b7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQJJ9sWv; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQJJ9sWv"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so2547065ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789616024; x=1790220824; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xiYVn57pn0XMpas+wlR8SmSSTnMiv5JdI/rPUiCUEF8=;
        b=SQJJ9sWv8kbqLvyicyIH8dA079Hpdf7sAIGAgsa3gu8az9fmonDf2Wj4CjjeHdDevw
         GG5DXGNWmjOJystNj0aFKHITBrJ4HGEIRiBZgncCCyfssABBwoE9OjohnJi2mP0LKUKr
         Egf2WxTdjAwi163gzObk0VTgGiKgJXLsa0bK4+Lh6hcZYw7+ytQCHpC038wYeFxjgBoG
         wKzMSXHLic/tTqq0X7SnDw6UlRecSPNdDGwgx0Onfiw9m5xIbuhXLyYroSSik1DguWnx
         ZmNMq1sTLuEOvpEHBv1THhC4lQBcket6CLDcZAxkol4Czdoh8q91xdXW77tVLbQSYnoD
         GVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616024; x=1790220824;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiYVn57pn0XMpas+wlR8SmSSTnMiv5JdI/rPUiCUEF8=;
        b=TcOnn4oCOViFRqbM9Vdl2L7V/mL7sgiLBUkD3R0CGHzjhNBgazAl00J2T6rjvrrGi+
         g0P1Q5c4pLVp89PjBgGO5vuKbhdg9I6dTvjll7TAwHYap5uSGH5Hd0cJAEcT6V6d1jqm
         gMj9geTgrQxGYe9mvu3ldCi8qkbCigQ04Q6zF4woNmSUYJV2cmplW0JzPFPOEshU7SdF
         +LcmI2VeYnKqPJatih/jqvdkc/Lg/+8ISwkGGSFJxXZR2kmtzSsaVNk6wQveFiK/088l
         DHqHwU2cHQepFJFA3h5o94ULUKG5BAeIzKEIgr+uT8IUDcr9AnUXyAsJhK3T2ceLGDfO
         M/Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxeChaWcWnmOTQvU1UyC/bslUSG7QW7sb2B37MVy5fvvfW4Ry+U4KtgsXVOP0WjP+vMfgd2B2YMJZ5eEj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nBc+qxlCKCSCS1VqfmIJgxZ0P8AsiQ8oRwHXP3971CKXPgfgnI
	JVZlFkiBjz3o7m6AqJziCm9CfCdsFsnqB5uvnGvrf5b4JMJsFS1rTJlc
X-Gm-Gg: AYBFou3+Cx+dCrmsVmn+dYNQlmiMVNj32vFQghQ9C3j0qH5NQb5fq5YOgAzZfcW4OCg
	xq8BLBe6qgWLqnDqaw/UbWxkpoETVHZMfQKCZyGhNQZ8p5FuKoggzyuNUXm67vGljj9ug14GS+5
	jD0Fgi2QQVkopbN8NnB1kR6ozDHODxgENC8Ht9Eb5ULhDaZRVL9WTBZbHEGZGSbKXImoi4ZPD1Z
	balN3YlHoDCEc3gqcBprUvyRKqD5GY4NqFVf6eBq9rrL/mutf/GCxLt6MThx2JQfWII4Hmv2akD
	wL/IVQAQm7Cr0tpsL0oerIr/e/al/w81EC0eNgOmof4naX3kOU73PNqO6WqZ464AecByML+frTt
	ZlmkeB3fflwqvMI2rQTUJ3UkUReqbv6sVEwKiUcC6Vk3m2ulkXBTT2KecUhIWe1pr+6gfnd0UGP
	BOYO5ZdwPegE1jprFjX60Zz+eLHkW+1Qk08Nj5S81RaHd1eqawl8jWMxKgMu3NsJJvJSJzAukAb
	TG5Dqot2xZo4x9IX9CP8MGEA1TTlrDdIhRPLGEbnZRJWCfpKL6NGhDwK4vkentrUDPHz5cU4QWo
	JcIj
X-Received: by 2002:a17:902:d547:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2dd8dd0b15amr107107475ad.4.1789616024059;
        Wed, 16 Sep 2026 20:33:44 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb5826sm19687585ad.30.2026.09.16.20.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 03:33:42 +0000
Message-Id: <DLH9XN5U55Z6.32MF649M30C6P@gmail.com>
Cc: "Nam Cao" <namcao@linutronix.de>, "LKML" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel" <linux-trace-kernel@vger.kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Wen Yang" <wen.yang@linux.dev>, "Tobias Schaffner"
 <tobias.schaffner@siemens.com>, "Viktor Malik" <vmalik@redhat.com>, "Linus
 Torvalds" <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Gabriele Monaco" <gmonaco@redhat.com>, "Steven Rostedt"
 <rostedt@goodmis.org>
X-Mailer: aerc 0.17.0
References: <20260831090524.106845-1-gmonaco@redhat.com>
 <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
 <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
 <20260903090211.50d15220@gandalf.local.home>
 <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com>
 <20260904074317.01b2c0e1@robin> <DL6O0KLPXLTA.2HJJUXQUVCP5@gmail.com>
 <20260904123108.1fa1d815@gandalf.local.home>
 <20260904132421.111c0279@gandalf.local.home>
 <DL6XBKITK7ZT.3RXK9YGGUYZZE@gmail.com>
 <20260904194620.0c7a8363@gandalf.local.home>
 <CAADnVQJH1SYR_GN6gewF3w_z_Sex9HFE1T1oXkQe6+v18bDTWA@mail.gmail.com>
 <20260904201741.2986efca@gandalf.local.home>
 <CAADnVQ+x4iRNXOg69nUmuJ53pB3-JtroePcyoReATy9+V1aRPg@mail.gmail.com>
 <228FE969-EBFF-4B60-B0E7-C1E4FD82FB8B@redhat.com>
 <DLDSQDSVXFHF.18X2UQUL5Y42D@gmail.com>
 <1f8caa71b79e70f554245bccaa29b66268452dbe.camel@redhat.com>
In-Reply-To: <1f8caa71b79e70f554245bccaa29b66268452dbe.camel@redhat.com>

On Tue Sep 15, 2026 at 7:15 AM UTC, Gabriele Monaco wrote:
>
> Essentially sharing the API simplified how the userspace component handle=
s some
> things and allowed to share reactors.

It's surely tempting to reuse userspace, but unlike kernel the user
space is much easier to change, so let's not add kernel struct-ops,
since they're not necessary to achieve the goal.

