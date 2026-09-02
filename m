Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8894AE8BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389024; cv=none; b=FmFJsbvjmSfFV3mU31Bv28ZVf9EBW3b3w8bcycNIWpW8/WyMNLepZLsBrWBi4jY/XagsFYRv73oJaagPETP0slPeCokoSdAqm1ZLnEsgaTB5wtff3psUb4g1yy7+jJu4JzfZboPGVU85kwEv6694CrwtDUKFfxZMjaWaIhtgR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389024; c=relaxed/simple;
	bh=4t3NyDOHfYgCviYkUeZurrh3wKdbbUrjBdRR0lBhdUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZseXxxNUkazlTXpliMwCxt/uLX31HzyyE+nElScomH7CUnK5PObMAF3rfXMmc9G5ydbCJjlXbiFij+O+uaZwyNXPqQcAAPqzd5XEcTtfR20R/jOO5k2Yh8T1KU3ErwxNiuNvKYSDOPccdF7/agrfTYCKdSyZDptyxA1Nx1zF7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CuVlV+Yx; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CuVlV+Yx"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso2320506a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788389012; x=1788993812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZARBv1ZrOe+OtTA0KU67Dr6OmGufsoJgDRL56vxHR0o=;
        b=CuVlV+Yx6gT2IP48Yt1+5agpD2YjPfyFAyOJ31jcz9WMTilV7Ob8nVWsjbONq6/yZo
         En+eb+AqKPWIA6iSSc/HHIbmjV8WGOQZUDeKnRaY6YO6VD9axdEB9D3ix9flkJV1N1xn
         hZpP9oyn1bHotU8/fWQvpQ6lbfe+h+slS8TxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389012; x=1788993812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZARBv1ZrOe+OtTA0KU67Dr6OmGufsoJgDRL56vxHR0o=;
        b=PthHK9diogBSnyM6lEQLQhaGnfOiHvDsr2gdZ/CXGubarz/2K9t4uTN+R43UTgwaMY
         ayMCp6DnPl6K/D8ez2t28jlqCi/n1ZFiyWQXwjWLhahR7l5QCHILdoRVrssHeXetQ/b1
         GVhz52UPwWDOrLJ7E9+Q2ICa12ID+Bi749V99/ww7Jt1fxPAsBB5jNY6eih9HUNUPRxm
         t6MHD0TakL8milXs+UZ4w6+atOM0Le9JjQdIqwSEZvHTefqWSx3t6FS9TUD8gg44tOA5
         uYPxsyjvWaTivR46UogOzt19meiQh6jWkvy3qBLjDwKTRF+m+FvIoARm13e36MCv/767
         uuqw==
X-Forwarded-Encrypted: i=1; AKwUvBye6cg4L0kJEW0GxxguaRc8D7eDMJE5a/n9HGnlgbJUaaV74qHHyS3/i6gSH5Ud1vfH9yvPQHkqb7suWhg=@vger.kernel.org
X-Gm-Message-State: AFuF++knVpv7vQz/QRgfy9xa4ScMtjkWu2FQktD+PDeJa6qzX+g/jBd6
	eHGRbQpQzJFlLaMASbo/4I3rfKGAVwN4G6ZjnFypM/8QOdpnr74+6BXyOVne0lJZFXVFcQBgiW7
	BmtuGpDs=
X-Gm-Gg: AYBFou1YL9mOV8oW2ZrZOGg9cEaQ9BE05dvRYdMlfqb/5VyyHJCalPymOSdgC86lpah
	DBIWky8FoUyklDf/nlLMcP7ZCJoOUOTmpJtUsUfDx+E4r25+SE4IL71/baXFWcqWjXgrxJYKqeM
	KlxyY5/LV0D3VQKRvuI26Osy/x4mAIJ8ShtKmxjw4vLLTBIxtNM53EtW3e9Jznso1rYAKJT4XtP
	U0OOhbtBdDBPeH2mdbEE5KmXZV1kiDtkO5aU50xzuQr73A4NuXvufGbMInyy3HBmORrH+J6YhDw
	NCucz7CG2+ROk8d8T0Daotjr6hsMPvNHI/dN0f83ZYCXmEIF7w9BEWhRaLFkUKM9TDYuLWOgOM/
	VO5rPW8E1qGYEzMznVxcb2zc1X5aVJGJQjk0kLGiJCQ/Fk8fWwcf5MWhxmdpvJLcG6GlQGaIdId
	iOOpeGJRVBrjAJ2373Af46UdXqpRJ4j7psRdhamvW9ugGqRGgbcVqRpeXRC/LNLiDtOGSH+y98+
	3xPA7vK6PdyYhZG5wgOmKgA+3/EdkLoNp24qAf6RjUYsMHsbGU=
X-Received: by 2002:a05:6402:21c8:b0:6a6:1bfa:90f5 with SMTP id 4fb4d7f45d1cf-6a6825659demr5085108a12.4.1788389011830;
        Wed, 02 Sep 2026 15:43:31 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942fe4sm1592883a12.25.2026.09.02.15.43.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:43:31 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso2320490a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6n0WwjbEgaZbWZi/ZL2wfVDxrwetzD8M6IAm51qY0dNsHTt1nB1fZ2ckcsdIdAd47Qj9f8yemIpCwKqw=@vger.kernel.org
X-Received: by 2002:a17:907:9492:b0:c25:4ba1:5953 with SMTP id
 a640c23a62f3a-c25d548f0c1mr529053066b.11.1788389010882; Wed, 02 Sep 2026
 15:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin> <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin> <20260902092437.00dfaa25@pumpkin>
 <20260902093644.5b0e8a64@gandalf.local.home> <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
 <20260902123933.5c3c8fa3@gandalf.local.home> <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
 <20260902190632.16e9c66d@pumpkin> <20260902142107.511e71f3@gandalf.local.home>
 <20260902215019.5d0c930a@pumpkin>
In-Reply-To: <20260902215019.5d0c930a@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Sep 2026 15:43:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvFPyZM9T3rfCv8WnL7a0GLjO0gSz1LQh0CWTDprdS2A@mail.gmail.com>
X-Gm-Features: AcwNN1XyExXiGAmQ95C2KgVawekSttkWbD2dZZEJiwf1iN2dNaYVT8P42ghPiWk
Message-ID: <CAHk-=whvFPyZM9T3rfCv8WnL7a0GLjO0gSz1LQh0CWTDprdS2A@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: David Laight <david.laight.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 13:50, David Laight <david.laight.linux@gmail.com> wrote:
>
> Actually it wouldn't really to any harm to nuke the __bitwise on those fields.
> It seems to be an attempt to generate strongly typed integers, but it doesn't
> stop you mixing up the values between the fields - there is only one kind
> of __bitwise.

Nope - there are multipel __bitwise.

Each typedef creates a new type. Try this:

        typedef int __attribute__((bitwise)) a_t;
        typedef int __attribute__((bitwise)) b_t;

        static a_t a;
        static b_t b;

        void test(void)
        {
                a = b;
        }

and notice how it warns:

    t.c:9:19: warning: incorrect type in assignment (different base types)
    t.c:9:19:    expected restricted a_t static [signed] [toplevel] [usertype] a
    t.c:9:19:    got restricted b_t static [signed] [toplevel] [usertype] b

because the types of 'a' and 'b' are not the same.

               Linus
