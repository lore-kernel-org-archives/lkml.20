Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77692354AE3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562825; cv=none; b=UQW8LMfEn8X9EcLQF17FUw990YySMTJdvAj7fiu3Jua65wwVRnt3oiupVlOI7oTsPWa9FZUMS0tH8XH8dyW6tRgUP8Kz3rsZNx2V/5aJNs9VSmIAtdntyhJ1vc1Lv+Ov9MkGGsiTS3+0oAErQ03tYN7Bi/NP836MNMcOMUS/06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562825; c=relaxed/simple;
	bh=mvh0j17bP4ZxH1uTxYP6X2KgmeRwOrDRPqClmWpV2m8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsofCWXQ7QFym7tQjVzL9k31aXLYYO2IeXdVuzvQMdlGORHltMd2gnAsLBogOdMmJBRcIKb86JY210beeFphJkAEgiUO8j24ouS6lf7ooEk4aQszqKucxknPi3933owYP2I/Qebqam/lQdc69LBj0HIofgnk7IHAZPC6c1mrIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwVpWY5Y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwVpWY5Y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so268013f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562821; x=1790167621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvBYQo4TN3EsmIXlY2JV4QPHccIJn3dUvY6VvRLAt+8=;
        b=dwVpWY5YdxuH6Tzhg4fl4Mj/rAU6q5/E12tfhP6+rrk0zSalshveTNYk9YaweKegK4
         EVF9IlcrJnpD/LNlxy/GlifMYlRBG1LTDb32xaAYYUQaJ26wVvfcuUPLh5qWVuy9bjOf
         0WVExC3Y8wVFGEWXd881jYgod4NingMLXAc6Hdo1W6KLwwP7SdY67sk6tQMx/G4eHcpJ
         936BPvA2l45aJBt3DHhpH1YrbzMjMB1javN6iY6PqoqouduQX0S4vdBwD1wvD5MJE3Hq
         DbeAslsPuIDFWPitZyWTSkGoe66JQpyUV/aWYMcWv/ouic8g9tsh2vH92+H3S+MjPOGY
         qoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562821; x=1790167621;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvBYQo4TN3EsmIXlY2JV4QPHccIJn3dUvY6VvRLAt+8=;
        b=psxH3EB8PVCZdPSRSKIpxHvpooMJ88Pf1bI5oGQZTWmd6vHktmKXnNHqKnVHZ3vpFh
         Y9NnzO3vjd79H3QuRG6DOIoXGJmtLhuYfa8/Jpj5CLrybVBRy3bTpbuEYS03bF8kRXb6
         ZGt7iHJa/DFn4x7Zvv34sbH/LoJhXHOQhT6HGsqXhS+d1sefVLUlBW/FFcpLvDd2b3Q/
         genx5XQJMV2y3xEn6o9Xzzl2I4SdG7YvVepUHD5lXkT5g/ek/e2eC2+uP4egaqm/mE1y
         zl7APo39qYvcMVz+K7n8LK3svKHrEH4IYerIKW25C03nTHp5q0fdsisL1mU8pK5gI5PK
         bBdw==
X-Forwarded-Encrypted: i=1; AKwUvBzAxWtAizPzhoJy5U21mk4e3ED1M6X1PwHp9pxoZYszWdRxNCoUoK197eTwNysZJkjoaxV15AIV+g7Omck=@vger.kernel.org
X-Gm-Message-State: AFuF++myd6YByRWeJnHjlZJJNYRFZbPem8f5I7EaH1F2WTE9xwM3ukt/
	wI/7MzxIBqCWa/RVw+4lqe3GtkWeOMrtrhS0Fet7S+7SQSELPj2eEiT1
X-Gm-Gg: AYBFou2btJX50qRFp2omghwtNkQryXgJcsx6fk7KFfmwU25HWx09LtglY/FPXoDXap4
	OngI/FH8yK3EIptHQpOLBfhPuGsSdU83M/9slwjMG/oabdjMMOOfwgV9VV3MxI9KXN95Odt37zF
	gdqofZgcNjZ8f5XBdpyy4xuMwuFh3N40Dn+47uELuwUUO+0a0J/xEDIHMeYAcqJhE5TfcsXu462
	B4D8zyvPo1/R80EWqCx6yFXQvP1eokurNSVDW5qfy+EiJErF/LRflrYtym3JiKZQf/75LdYJIdK
	h37TnLOOQQX46O2o/OBlPM3VkvKtbgxE6xFC1/td671p+4UMvVWZsIYcnLgvEOpKp2HW1wz/ebP
	9PDxKeZY4jqbwE7U3c8aBAJcFAjdkZS6HAyJSa8rj4YOXNJyTe8KPTbEI7y0lOK2yAJsE0BwKKn
	54ndIvZI9SOivY+bnFoYUasDQ/E3Rd3enhOksRNuqdzlE7RTzd5LDkfnaheJF9VWvYjL/1qD/Mb
	eKXYbJmLdN46hApohGtuMu3IliUxdVeI4zN
X-Received: by 2002:a05:6000:388:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-4870d69a561mr3529251f8f.2.1789562821393;
        Wed, 16 Sep 2026 05:47:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm6894786f8f.35.2026.09.16.05.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:47:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:47:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] sysctl: drop the pointer dance in proc_put_char()
Message-ID: <20260916134700.3e0d17cd@pumpkin>
In-Reply-To: <adblkub2acrgjlgmjs2uu5644zm5fjghjzr5zkyga7uatrfeif@jsumbzlthyfb>
References: <20260822184244.13569-1-include@grrlz.net>
	<adblkub2acrgjlgmjs2uu5644zm5fjghjzr5zkyga7uatrfeif@jsumbzlthyfb>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 13:46:40 +0200
Joel Granados <joel.granados@kernel.org> wrote:

> On Sat, Aug 22, 2026 at 06:42:44PM +0000, Bradley Morgan wrote:
> > proc_put_char() still drags around a char **buffer alias, writing
> > the char through it, advancing it, then copying it back into the
> > slot it was loaded from. That only made sense when the buffer was
> > __user and the char went through put_user() (which could fail).
> > 
> > Since commit 32927393dc1c ("sysctl: pass kernel pointers to  
> > ->proc_handler") the buffer is just a kernel pointer, so the alias  
> > is dead weight. proc_put_long() and the skip helpers already advance
> > *buf directly, so do the same here. No functional change.
> > 
> > Signed-off-by: Bradley Morgan <include@grrlz.net>
> > ---
> >  kernel/sysctl.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> > index f7b7598..2b92b30 100644
> > --- a/kernel/sysctl.c
> > +++ b/kernel/sysctl.c
> > @@ -350,12 +350,9 @@ static void proc_put_long(void **buf, size_t *size, unsigned long val, bool neg)
> >  static void proc_put_char(void **buf, size_t *size, char c)
> >  {
> >  	if (*size) {
> > -		char **buffer = (char **)buf;
> > -		**buffer = c;
> > -
> > +		*(char *)*buf = c;
> >  		(*size)--;
> > -		(*buffer)++;
> > -		*buf = *buffer;
> > +		(*buf)++;
> >  	}
> >  }
> >  
> > -- 
> > 2.47.3
> >   
> 
> I was thinking more along these lines https://lore.kernel.org/all/20260916-lklm-sysctl-void-vs-char-v1-1-c3f8b2eb8b1e@kernel.org/

I think I'd decrement *size before writing to buf.
Should ensure the compiler never reloads *size.
Could also be worth an __always_inline - likely to make the code smaller.

David

> 
> Best

