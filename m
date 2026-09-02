Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840E36F438
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372398; cv=none; b=Z1g3YQ/RKAQFrLFAqytBtJDa6xKAEmhimjIORATFJypqxZ2ZiH+FrudmX/qfL5sq/xT8gLOVeYoVc3Bto211CHyaARplh6KkCJmXNQKZXFvZF006g0WKppwjW1hyprEfH8sfkINpVpVaFw+qNX+3eeXO05yjx1LAWZpokehAzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372398; c=relaxed/simple;
	bh=3LBB477/E25DlDtwLs0N0HtL6psARV770n83CKm9u2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYOLKKBrtFR5eXUpyCulV4BcWCmtPzrb9yUMxJEUSHHfF04Eao8F3Ir3M7DYcgaugdFO61PFwT9fLncVpILZp6hLrvIz0wX7UzLvkABP042A/A0cQ6JiRQC8udDpxIpZr+DylkALV9VeRKfCQ1DAiVps1/YeV/9tsyfOojygS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpi8GGRF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpi8GGRF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so15703595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372395; x=1788977195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frsLmNxkkux8DLb2VpK67bZCWGAgpvQW5U8Nrc1BdxE=;
        b=Hpi8GGRFM6xUL9TYpX5aDWwfpLtVq8w3KMYP7bFbb/Nd9jfmJ4yab94GD7unRqzk3i
         Jo2pSOde2M1hoBBDdrUHfX11yPe/ivLBb5cadfeupsfrR3mTMtZW1mU3dkicxjgCcY+5
         JWs2orUXna0WqpVydam/MKNFmwrT8c5rTppTlBBUS2fuPfw1cnT21lhrrCv1gHQjg5Dr
         4qY9omoPKENqWFdrJD7GqYxlTZxe847x7FyAk406x2+OmdBEVIloLej1kjo3hgmyHe22
         2t3L+5PPIv/EacWxDIJvPki3NpJHJGjoFF3TzqFkVzPy7NC5lHS0KaqZTUncLbtH5+ps
         7IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372395; x=1788977195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frsLmNxkkux8DLb2VpK67bZCWGAgpvQW5U8Nrc1BdxE=;
        b=L/6TCC1ocsHB6P/VNCDW+gFrJo9CvTG6r0JKm/wvcpTHTjblRqpbe/F3KdgfICAZRS
         MpL+TcQlXRHgG0Av3Nr9MZIL61wKHmSvEHMHDuZbQ+kBNqLZi1rgW4XO6EPBzn4veKqT
         zzWVYrblw6HJ9924k+dEE2um2Ay8ZYtCyBZivNa1rJ5rNnMCWWnaQCe3XzVn4b1c+YwJ
         1HJD9JENzdYFs5vqJzjJ+//KZquW0WnCywMpNdJtHyYcO5BbpBFMHCMaR7XGwtDdc21S
         MIi22YlgscuwbZqtyKRRQdhCzzpmGnPTxr2r0lZUuD2nyEGIEjCpnOqCHgzorC2tFPki
         uIuA==
X-Forwarded-Encrypted: i=1; AKwUvBywIz3DE6qObK50unjdFeqibkLxdWLyrU921C4yWgJUbVtDS6KvHGLs6ql13UHkfbVBL+ybX7riG/omCF8=@vger.kernel.org
X-Gm-Message-State: AFuF++nNWieLcuBSOY4Bn9Cz47kyJnlFYhlchzNPkuhCTMsBNhWoHAEk
	OhJq1419cejtX4t5CdIpQbrNdwVVPf902mUMT1oR02Wz1WV0j3bngI8j
X-Gm-Gg: AYBFou3zuKT9FsGhzpxj6G/b69x3LV1X5o2E5fF8WCFjabD1C+kEIgTw+s/YnqVCk9U
	LL81gINiRq5XfMEcxwy0c27GIkU6chhMT3TRk4sGz9gXKW7aefin4n5KfdTZuLpD0KPEABflOYJ
	8Lr9rdSUH/5RxOl/L1a4ySrCFhTpGBAxVoTXaw5eGTyOTpbh5RijPm2zjmrCEzARuGBQTGZSslY
	+7Ua3PVMPbSW3qwrnJcJAD9D2wKExbT3IjQH4jWhOyAoOF9vvFVtJmHt5v1R1mze3XvZ5z0HzWT
	s/I1xAwc0jIi9YNPfuFZpXOauj/wyYrNk5sXyoAYB9HZ8Ynl1e8/cFugzViprwQCJU4OzHWchhC
	fsQd/SlUqmrkvwxCuveH69pir48sZVhDIvQNhPnfhpwF/pD8JFLAaylaFiV2ZlHsoYcGI63A6a0
	eNgqiqc6cgg7vYAlnvXQ4daiiggvcrhqR5PmZO/QqAey4ncjt6aRx0Hn6LNUCMdEsKes4MXCqg2
	b8SX0DdaR9JsvKtnnY9VeIbRMs=
X-Received: by 2002:a05:600c:6208:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49ce57f7113mr139018275e9.8.1788372394487;
        Wed, 02 Sep 2026 11:06:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm29821565e9.3.2026.09.02.11.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:06:34 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:06:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Christoph
 Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van
 Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260902190632.16e9c66d@pumpkin>
In-Reply-To: <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
	<20260901222909.05d6239f@pumpkin>
	<1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
	<CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
	<20260901192523.0e989b10@robin>
	<20260902092437.00dfaa25@pumpkin>
	<20260902093644.5b0e8a64@gandalf.local.home>
	<a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
	<20260902123933.5c3c8fa3@gandalf.local.home>
	<e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 09:44:49 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> On 9/2/26 9:39 AM, Steven Rostedt wrote:
> > On Wed, 2 Sep 2026 09:31:41 -0700
> > Bart Van Assche <bvanassche@acm.org> wrote:
> >   
> >> $  git grep -nHE '__field.*(blk_opf_t|enum req_op)' include/trace
> >> include/trace/events/f2fs.h:1185:		__field(enum req_op, op)
> >> include/trace/events/f2fs.h:1186:		__field(blk_opf_t, op_flags)
> >> include/trace/events/f2fs.h:1241:		__field(enum req_op,	op)
> >> include/trace/events/f2fs.h:1242:		__field(blk_opf_t,	op_flags)
> >> include/trace/events/jbd2.h:364:		__field(    blk_opf_t,  write_flags		)
> >> include/trace/events/nilfs2.h:207:		    __field_struct(enum req_op, mode)  
> > 
> > Perhaps these should be converted to normal types and assigned with
> > __force. There's no reason to have the value in the ring buffer be of a
> > __bitwise type.  

There are already a shed load (or two) of __force casts in the defines
(further up the same file) that handle some of those fields.
They probably go away if the __field() used u32 and any casts added to
the TP_fast_assign() expansion instead.

> Yikes. Typecasts in general and __force casts in particular should be 
> avoided whenever possible, isn't it?

Anything __bitwise is pretty much going to need an __force cast before the
value can be actually used.
But the syntax should have been __force(type, value) so that the compiler
doesn't see a cast.

David
 
> 
> Bart.

