Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721465;
	b=qseP5svzdnMRqfAP8o/cmJ8jFV+7GuHj3AOTmt1qp81PHwNIu+ZeTm/KwAImvJ+JX4AR
	 MCe1D1w9QcFp8UHOu/WHgAylZ9N9yHa1AHzbjHkF87Yd24eBd3iWouOf2DEp2sH6DX/U4
	 LasLpuDQV779h+yVIYw8po64Y7t/w+4IzXh4v496Liy/YsdviF5FBV3mgOt9pRi5zWIW3
	 GdLSClRjMLm5psp+JvCNu9Bqtj/0gvyq+4LHUFnsd/bHzAKUTf+aRHi+QEFNR5LQdlr0z
	 IJ/8M0LJtAwhE+LaG0pIt83mI/OAoMvgsWt3dcC+nHYYcASm3HMA6rHJ7dCDcVwAaXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aln50v0aoKBzqhGbJMmUlhCOqpkuSXDrmBoJJHHZAPg=;
	b=seM2WhjbmmwN77E13jo91cQ8mRNaktv9407ZdImR5B0UcvG1qwXw2Zxloy3LS9BNDoBC
	 l20mEFoX/v9ALWiKrf2l4CNQhLySOrzsAM9cOUmPp04nbkcpALdCx6sHyihZLmZTcSJ+i
	 I6WpXC9TXgzfAigq5n1h2EdGMGt2gDPeqF5L2rwMfIw3exHGi8JkOVejDFcsPNaTb4zsO
	 1z90xgtJzEkkJXEaJy7A0UALJ1sCiWIVBuodRBHwsS9KGMaxRBxdZBiQK4gHm863HoJvo
	 r+RVCmzL1r2zdaDRcDfrV35xNjEac2Oy/lFSdEzLk3pbMuR6y9VHiCv4Gmr/yRGFQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X4FpSHpV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3260A382F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E3260A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X4FpSHpV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso519685f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793721463; x=1794326263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aln50v0aoKBzqhGbJMmUlhCOqpkuSXDrmBoJJHHZAPg=;
        b=X4FpSHpVy6uUXBwY/TcPN+bm3X9rRp/JRqsWmaFy2uigdcS+56Rx9u7p/N8n4nBSjQ
         fIyyeMM3y1+OO3LOt4aFKW/EnmyaFVSUMI/TgvPjv2f2gcdO1ZNJfy9iFNs/HlFfxeN0
         AR/OA7LqSPenm6VoTwwg4Hl835opiCrfQ0CBA/42pSd8GJh5l9Xa16EudWTfmJO1XMnk
         UMoSCoS9Ptz4+TlqKRON8DcSjEv5DccUxqmrmUWGnkieccJjc3usswcQG+LNnRiu5Tki
         jLj2Iu2P5UmH1d/zl0FsshQotXHjuRgxem+A893Rcf6SYMvXyvEioyqv3CMrr8K0KHD9
         LT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721463; x=1794326263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aln50v0aoKBzqhGbJMmUlhCOqpkuSXDrmBoJJHHZAPg=;
        b=Q5shpO+sFO6KoAG27pQ+sVk/FMXlQU9wdJ02Ild8FBpUuRmoX8LqzLiIRAOclzpZ0x
         q2bnBFcxfrVSGYfOQjcEn5gqgl0mbMAmwVL3s5fzaoNzjp6vmnByH16n3IFG9z6mCt0O
         OGVOrILfP/TG/aOX/1ROS4/lV+U5CQ3u+b8VkN15R9/Zq0HkwVvY/bfs/8Sq3GA6TQ5f
         H20thc3cZnVPo/sUgPC3BMKoTcl8emEkzO9tWip98krlSq6Po+TYv/FOjGv38YP8XiMO
         vXk+VHJjyVeZL144IGrockydr0S3t6iRFBzfMYrNM16b73jYGxS94SKFJxBS+TTUGtsf
         peOA==
X-Forwarded-Encrypted: i=1; AKwUvBznStG0Rf5LSA1VhgKtIJkx8OACNqgaxqn4ik3DT93fNtj7ZhTu8O4dx8C/0bg77VHB2Hnep18vGxT/JOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SFzT9q8tdw7dKjYb2Ec9ySBivRUWueo+AR2shDuEZTKNp9cBL
	NxfutUorEEeluAN9XXcj+oNZoWnNkF5/r7T/PcThMGouuKogUDXFgJ/wT++1/mKfR7U=
X-Gm-Gg: AYBFou01fRmkvNT7w3TJs22KhQC7J57v2kOyEAvpVjcwk3WvnBYrwV7OL0sAi15SGkj
	Vbcl3d6VDPS0Y7vt4whxQUZkTm6UdeljW+gaDGgIRUxGsurzm9GRaiY7plR5mx4dh8dv+RRAt2T
	8yY+uhXkeN0144lmZ3h0GG4qGqlpfeGZyiFsXRFsjqTdcN10WGx4qco/D0Gp9qVzQEVumjInsQC
	ucxTjmfz1ueZuLfcxn0NxKAj1mOlmgIhnlDPXacfzyeIX0rNpFlXiU0TVY/CyFPfJjtxaoLpmRG
	nbSUuvP4imOJdlonQVUTnlgo6JaYRQ36qz1Mx6fWUy7AkUVb/I5PmM1iE0KMdZ+xXAP0DI9xVV9
	wAJQnfx+YQQROJAE/dEVoKdaQmtMuqpg1RkyNeeVnydffHeZk/TQ2tlJy8l8PPG3wMlKYIEkqEH
	e2lWLDgIKRiHuQhiw9Xigp2fcOLs7uFiB3gzXc6ySXBjVjL8BacBRmyE01iSL0W3iEuyvakkmIt
	F0e9ToG5TDVwBW+LL4J4fsFClfj0DcPmqBEhUQodG6ryYH0OPmIRrcXQH6SJs4P1I9kgwAiY09I
	ad1MTSjyFkUNr7duccTNLV2nCrGTEA==
X-Received: by 2002:a05:6000:26c8:b0:48e:6dd7:4d13 with SMTP id ffacd0b85a97d-48e6dd74d5bmr32790980f8f.14.1793721463064;
        Tue, 03 Nov 2026 07:57:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm25948956f8f.43.2026.11.03.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:57:42 -0800 (PST)
Date: Tue, 3 Nov 2026 16:57:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/16] printk: Separate code for adding/updating
 preferred console metadata
Message-ID: <auoEdNHVTRBNYszx@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-5-pmladek@suse.com>
 <87cxsv4acy.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxsv4acy.fsf@jogness.linutronix.de>

On Tue 2026-10-27 13:11:33, John Ogness wrote:
> On 2026-09-29, Petr Mladek <pmladek@suse.com> wrote:
> > The logic for adding or updating a preferred console is currently
> > duplicated within __add_preferred_console(), making the code difficult
> > to follow and prone to consistency issues.
> >
> > Split the code for adding or updating entries to avoid code duplication.
> > Make it clear what operations are done only for new entries.
> >
> > Use this opportunity and replace an int with an unsigned int for
> > iterating over the preferred_consoles array.
> >
> > It is a preparation step before adding more consistency checks.
> > No intended functional changes.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> 
> Reviewed-by: John Ogness <john.ogness@linutronix.de>
> 
> Some minor comments below...
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index c3e50f19a32b..174aee533a53 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2577,35 +2584,56 @@ static int __add_preferred_console(const char *name, const short idx,
> >  	if (name && idx < 0)
> >  		return -EINVAL;
> >  
> > +	if (!pc->name[0] && !pc->devname[0])
> > +		is_new_entry = true;
> > +
> > +	if (is_new_entry) {
> > +		if (devname)
> > +			strscpy(pc->devname, devname);
> > +		if (name)
> > +			strscpy(pc->name, name);
> > +		pc->index = idx;
> > +	}
> > +
> >  	/*
> > -	 *	See if this tty is not yet registered, and
> > -	 *	if we have a slot free.
> > +	 * Historically, the preferred options are stored only by the first
> > +	 * caller who prefers the particular console.
> >  	 */
> > +	if (is_new_entry) {
> > +		pc->options = options;
> > +		braille_set_options(pc, brl_options);
> > +	}
> > +
> > +	if (!brl_options)
> > +		preferred_dev_console = i;
> > +
> > +	if (user_specified) {
> 
> Here you drop the comments:
> 
> 	/*
> 	 * @pc console was defined by the user on the command line.
> 	 * Do not clear when added twice also by SPCR or the device tree.
> 	 */
> 
> > +		pc->user_specified = true;
> 
> And here you drop the comments:
> 
> 	/* At least one console defined by the user on the command line. */
> 
> > +		console_set_on_cmdline = 1;
> > +	}
> 
> The comments seem useful to help track all this. I do not see this
> information preserved anywhere by the end of your series. But you have a
> better understanding of the big picture. If you think the comments are
> insignificant and/or misleading, I am fine with you dropping them.

Heh, they did not fit 80-characters per-line, so I dropped them ;-)
OK, I am going to add them back the following way in v6:

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+/* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2607,6 +2608,10 @@ static int add_or_update_preferred_console(unsigned int i,
 		preferred_dev_console = i;
 
 	if (user_specified) {
+		/*
+		 * @pc console was defined by the user on the command line.
+		 * Do not clear when added twice also by SPCR or DT.
+		 */
 		pc->user_specified = true;
 		console_set_on_cmdline = 1;
 	}

I'll keep your Reviewed-by. Speak if you do not like it, please.

Best Regards,
Petr

