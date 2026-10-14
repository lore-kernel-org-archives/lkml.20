Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EB3F8ECA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997290; cv=none; b=exsxpCPQdkr4P7eAPoe2+l9lgc8l/3e+x6X9zMSrCjOy8iZM5bMBZlnfiqBPVSewm9UX3U9R8oI57ABO6pvlLtIvBwtuwEu/GlvVhy55ZbDr9hetQngS8z7vZD/qnXFhtJUgXI4qk5TJEaQyDVG+r2iimnaXhi8xzuE7R7sE0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997290; c=relaxed/simple;
	bh=Kdc6yC4xRjvpZvivtkFQl4egG4a2TmHEsEe5UY+hyoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cx0zjG/hFPUdeJVXf8FP1oZ1WZjzzMyCAjXYmQtHbRxut3XzNul0AL4jpTBJ0Vubryg+jf2KN/QwWQsiPKmDBvT4O+CcuCVphfaOvG1L0DZNBMULLkneqK53MVLouSOcWbE7Wk2T1PHRh5Wvici6MfYjzJ/C2VoYJsT4hIj8/2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fW1nLXln; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fW1nLXln"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so774756366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791997287; x=1792602087; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/J2ax6te+1JRzLcB5oiAyce7s6PHnNfpG49L6qJGy4=;
        b=fW1nLXlnBECQ7oS+J9+xtNkZCJNTaK5lZ83ZE4EKSy3392VigHevDm7I6HvQqQpGpE
         k3ylNKRB8jxQQSDU6hrr3lSUQvTeB2W0gsnOIZnWqct5g1lHQojb2A/3JOtfjexg5d4B
         /QlGbe6TA4qDx85pw1VqoXBEBbFkqTmz3fW84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997287; x=1792602087;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/J2ax6te+1JRzLcB5oiAyce7s6PHnNfpG49L6qJGy4=;
        b=WQjLhTxfYhOO5X4R8DcLGWEGi3yHDAfcOz5Pzqfwn3xR/It/GuFpxfPevpfv7pxL53
         /OAK0Mx9VeJkPxh5Wa6lnxY2GAZzjF/7WSPwkCMha2lI2eXoyq39Gf0/Zk8eyQ+HWBgY
         l/v56LrzJtgrrBdItUIfs/Usig6YbZGWetyvbGR2x2m/1UPG+xlU+eSlFkGI5uVaM8my
         Cl91jIB5+G3NB1H4DvvwsDhN4BjSPF6Iez9go/y1BPUP/Buyw23LScf2xYC4rLpSZHBx
         AGLmV7+RmXx7sXCqdbxaER/PQswX7Dfq3yiqM+iG287VEgDM2jcsFrdJOMz9Ch0YDA4l
         cd9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOEFQRw/GfG3ZKK/+blm+aprCfirOgjFXU4QvdKzXGudyUMbDrjrHpgk1qCRn5UcOXocECPGAX7vC/fdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0ch0ImxYKXNa3IeLhZbxmuuPDOAVZPl4sZy66CwH/F6VRRz7n
	EiD57uBpBSap0HzzNSL8bXiJfhP3fNi690wPqz0iEXeLxjSV8NQFQValgtqCtxwYnM505MZaGJx
	HDldvmxA=
X-Gm-Gg: AYBFou0fZEEqbqj8pLsPSZFjpevPHhP3sCvR3WYr1+WOiIA7yFDVnaCMmQpRwldeh/p
	GgX113jMNbGG1ysoeDQc6b1vXyzOWaMk6XgRczrDVzA8w1d5aAnHmqGVNkRl5p1FsNDpj+52jV3
	VMQ7FaIW7w2DWzJSnRMPqIpX8aneXxrIabD5frFcdvIkiL7qB0fr1J2SrpqO2XRz6XDoIJjpAUT
	SyAvZDZ/9Nwk2/9e5s3XzVD3TU3tBj1Zb/grm+sXLXnJcLwkxTQin4ko4VB5ShXH7v5qCquvsHq
	6sASK0Su+12cRo8521HcSjB0xFGsfSdx+pQLGkkekSCiXV8/kKxdjBP2/G3VN9YUXuLBDWY5EcY
	h3Fshb9BWP1Q7VU+XvSNm/uEsCyr9GjxFYdWaWUKxvgYXsxIzzoYSivfPqI+i6C5hhQLMbsw5cC
	u0OjT2Ijp1o6mR/StLd6PP5TXWRtvtmsLQv1iGW2PUJgfP2y26TjJnviNhXgV8k+MPZKbGhyNE3
	GMPKaqmw02OWxVj1HTfTDvItEUKMHbxTdkXSre5T0bAr9lK
X-Received: by 2002:a17:907:9801:b0:c29:4fcb:2886 with SMTP id a640c23a62f3a-c31a9fd831emr1537567766b.39.1791997286998;
        Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6beaf65sm7613766b.3.2026.10.14.10.01.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e8c710847so544437466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwtnKpg7uxQs/QeTYufWs/9QzJvpx4OotY2dBnytPPlJO8bf2Fm3WQfGARtL7wrlcpBIL/V3tnaBgUVXU=@vger.kernel.org
X-Received: by 2002:a17:907:968f:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c31a9afb3b6mr1614699966b.14.1791997286294; Wed, 14 Oct 2026
 10:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014160144.1835860-1-jarkko@kernel.org> <20261014163550.GA327771@quark>
In-Reply-To: <20261014163550.GA327771@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 10:01:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7cq3pdpGV4mnErRqxTmUm2UA87+v4N-nni2tQNw6Bkg@mail.gmail.com>
X-Gm-Features: AclHuK9QDUgl4J1rJvqvCYjnkQ4RS2QijjPUkASw7HMcAk5l4Pr5JiIIEojmQ2Q
Message-ID: <CAHk-=wi7cq3pdpGV4mnErRqxTmUm2UA87+v4N-nni2tQNw6Bkg@mail.gmail.com>
Subject: Re: [PATCH] lib/tests: kunit for associative array
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Rae Moar <raemoar63@gmail.com>, 
	Ryota Sakamoto <sakamo.ryota@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, 
	Petr Mladek <pmladek@suse.com>, Dmitry Antipov <dmantipov@yandex.ru>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)" <linux-kselftest@vger.kernel.org>, 
	"open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)" <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 09:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Would this effort (and Linus's effort) be better spent on converting
> keyrings to use an rhashtable?

I agree that it would be lovely to just get rid of assoc_array, since
this is the only use for it, and no other use has grown in the (many)
years it's been around.

                Linus
