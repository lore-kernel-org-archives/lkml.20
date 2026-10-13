Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F3550DAD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924330; cv=none; b=VfiIrJ0yHEM6wLrT59C+l5X03W59zEWjxG1epc4t8xt3dyjlVXkYhtDi+sGwhRxKRqDM4hbodJSO4ox97vyr0SzQaBPTTw40TTZIugWcsgCa4y727SvuhkzV3vUwWcLk3PjocYnECMMon+NcjW+XgZnFwinkmwXFIO27PIhPTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924330; c=relaxed/simple;
	bh=yf4RMSnfEunnWk24XKCESjvLCRcSQ8/3hZrlo8LL1ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGGI06TK13AECOaSsme/STY6VnMd+xhWi7sq1G5QaMYZS4h6xsx/xzE+sm4nmROL1UejT2wOqe7nCKb9AHsEDokY4WOCrf0G8j2EfnfbWogl2kR87EeffHJRRJZfN1u5ryVBoVaPn9vd0SHVdZ7eN7sY3BELRGjAaSCeSgiYR4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bxRgtcX3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bxRgtcX3"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1601127a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791924326; x=1792529126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=bxRgtcX3Ode4l/Aa08vdOj/oZVC87Mj6KyeruT0JObiLjt5A25XZ2+yZOZOhlyepS3
         96uDtzfgh5GpTrg4g8D0xjPlOAn44QNCmU8H7O24z0qLWJ5hJ0w0praSvjmTYaYlEQdy
         f14mp5CAmIDqbkqWohHZLEI4AYD/x+NY93qRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924326; x=1792529126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=Ic+G24hilerkqUaKCa41SLaFdhhoruOtxdqaToldTEFTdETnTEgvyRh03fhwWCBKHH
         WZyCh+9kxu5bpISEoLelY+jdsydKmWAWEPVXBGdv2nu+4/FORV1pe4qVyhRk+812F8cA
         /HJxmckcSUfFdMACmfd6qwrjMo4ngEXm2ctjoVFGak1QS0BfjXxwXg588BvENuv66ZS8
         0UVrPnwta/5dRrfSs8vNmG4y0GW3Ov3JkrIioVAQPY7NvtL8dmZxrPl775svOVDCnpqX
         mhQKzUaKmrHmAQ8TX1WqbkWys3tjsZ+ZSsDzpqdr+c/vLLvswXs2Zt2dv7zhJK772F5X
         t92Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJUtLu4pQNDrPmgnhmNqoOjd4UpwglHXnFMw4M1tNfbypb00j6YxowLD3jCHJkh8S2mym7ddKH+53s4Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgO4+emfHNBO2MYgd1SoYigMTbIOuJT/EPM3aDscr9cztvDzpk
	qp1aq7LyRGxY7uQQ+JukcJyHBZ+xXlzc8N9WDym4j3c/9YDnqHYMgdZdYiv15wso47ktcRxfnio
	kZUoy8t4=
X-Gm-Gg: AYBFou3CZs+FtcN3ZrwVohJpRzTEZLkwN8BD/Kj156AW2ZzJGAibf7TANxznJAU1lGk
	jkcD0f/sA/XlB72lRBJFixcSueAEOWcJ5Q6e/6ZGOoMG2uslshWP4xRR4Iza3Riu+wwqVs33c6K
	r1ZCfyiYB0yRwprdQYZsddRaPjEp3c9LN6A/Buli+mP37F7kJcIa3ODDizkx8quZVkvLT3pWQf6
	HloQ3CVNaGOtTJG3isEaaDYcOaZVN281C0U59XDYuN3wysC0MVAB3CF92QDLvnNfmxNqm94LdyK
	Rsl70NG3H7IenFuLXofH5pcZGTMEmwhNI039qYD+geggVu2/l5nkU845P2jWQanximtL8U9Oluu
	4TpSjq9/Yp7Zh3hodUZNk7btMZAV+lbMdqHP3o4clM3UkfjdF+c1bSVMYCtH/WtR5oJJWPrE/Xh
	ZUtSXnYJR1tTiu+6yY88DfgX+0DOPUklODesoFVeY1QJS8SUrv1J2Y0VEBw+ygshZnVbpi15X4M
	H7t74DriF3DlD2Xl2CMmBVFt2ikwrbsEtQSF2g1uoz56nZ6/I+Gox9ZFZs=
X-Received: by 2002:a17:907:c8c4:b0:c2d:c0ce:8465 with SMTP id a640c23a62f3a-c31a6999fe9mr1311751066b.0.1791924326522;
        Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm397155566b.75.2026.10.13.13.45.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c31745ad205so889772966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3zwyZB9VYG01MBvsS3xgFWDJ075pFGsFQD8DAE921PDAhQfKMZe3dLKxM9TydrXafD3euFzzSmo9RH1w=@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:c2d:cc6b:27bd with SMTP id
 a640c23a62f3a-c31aa0096d6mr1387682466b.23.1791924325873; Tue, 13 Oct 2026
 13:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl> <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com> <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
In-Reply-To: <20261013201628.GO4214@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 13:45:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
X-Gm-Features: AclHuK_onBbZH1In8K4ATjQxippesrsP-1df32iL1wjxMZwsoKfFWUOiqALbMNk
Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 13:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> What this is about is setting our expectations, telling what we want and
> what we don't want.

No. What you are about is something entirely different. It has nothing
to do with "expectations", and it has everything to do with your
hangups.

I don't understand this whole idiotic concept of "don't use AI for X".

Here's a new rule just for you: don't use compilers for any of your
kernel submissions.

Because if you can't show that you really understand what the machine
is actually doing by writing your code in assembler, then I don't want
to see your code contribution. You clearly aren't competent if you
can't write it that way.

And btw, you had better not use an editor to write that commit message either.

Because I need you to show me that you can actually write a good
commit message without using tools that make it easy to backspace and
hide the mistakes you made while typing.

Ok?

Because otherwise those tool-assisted commits of yours clearly aren't
showing that you know what you are doing.

Do you not see how UTTERLY STUPID those kinds of rules would be?

So no. We're not going to make stupid rules that say "you can't use
tools for X".

The kind of expectations *I* have is that people do their best and I
expect people to understand what they are doing.

But that understanding has very little to do with what tools they use.

And quite honestly, in my experience, the people I respect and call
intelligent are not the ones that shy away from using new and
interesting tools.

                   Linus
