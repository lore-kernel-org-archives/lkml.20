Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079D47A0C4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156230; cv=none; b=bYLIHq+lYVjFYoWrK28v+5IIIUMCY3+UyMWox4T9PlUJsQRPauOUJ1l05q80dRLOVVb4/4eiReNqu6BLr9OzTNQT+71P7Dg3udS7SsEtO1SQEypLP9/sqqYmFVoy9TP+o8yxEDrC2ORAPwwLwsiSS0kTYtstPRBeP62UzeO8pn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156230; c=relaxed/simple;
	bh=+YkASmJoXSPlWECvkX9kiXUOqzSsWerVDmQqdKVTLsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh6TLuBkxfwenYGfiagxC2TXyTrgRjHVehgPXYdF3fZtjyOZ3oDOO5TWZcQixKEe9AiaMo1GQzHhpOEaklFLJ+rTCMNDoYKH+r9n1umUXwWuc1hBA05+5GmZUkhUZOtf2uCeOylWMe28MPizkKLz0pxfNQ/zZknaN7sLdJmxqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dH9Gpbao; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dH9Gpbao"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso619202f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790156226; x=1790761026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wYRG6d5+J9eGtmMpcUXDXy6Zdka+BZ+zSFwU9RUxfSw=;
        b=dH9GpbaoFsdRCqU+wr5FNfpglliwXFXjjfn0VoURYt9uiYGK7DkLZfGxqj0KqrVl/G
         748xLP36/9H1h6C+eGrPDZSXB3YhASEJfdBc5Z59l/bcu7WcDpXcCbuPUUPCJ2fVPMqW
         PIujHYwUgsY706Ek2fs6hjXzX9nmoigI+mPuQ2d2e42YSpg14Wj+9EKbFfH7lB5h17Id
         Mu0d9QKHWVXLQOvnWKUm7xRDNTGDQDjUoE0rY7ezX4gweY+owt/tWpRE2XT4o4iMt4Dl
         nIh6WdR6jA8fKMwOSyMx58pBACWdkykDggNL2OAKcCCaIwShhnXnuZGcNkvCbXoaxEW1
         l1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156226; x=1790761026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYRG6d5+J9eGtmMpcUXDXy6Zdka+BZ+zSFwU9RUxfSw=;
        b=c8yyGI8VxtV9svq4dsVidLz1MBIf3vhdoMBN2NvWyXh3McD5iqHC83sJNyoUSfMAKD
         ajs8uFYUd1Q7M06EyVzE6+eZce6SsQJEHrdk45iN29cPCfYSgr/Z05gCAD1fyFUBIUyx
         QrDmfLbJ+mezrNpm/R5IFv3hx0dOLSofxKUmC5pYhOjd9OzyJvGrKezkqVG5zP//CADG
         4JjK3iYBI/nE84sKE4MKmQeTBrFtn02pNtkrRiT5+43LKYJz33mz4p1qI4aPlwgIDbzr
         MzLK7GxZxfxxC1ECHGNsTta38bbFFAksUlAji1hsf1MzOFjvKO7gteIfQDE9LcLUQiMU
         n9Ng==
X-Forwarded-Encrypted: i=1; AKwUvBz37KAT2lWRGPIv9cBMq4zltjQv20AvYTzv1s+8gMxkRgr7+CF8zNNmalzLXwgoGZ321roxUuiy5tY6Kr4=@vger.kernel.org
X-Gm-Message-State: AFuF++k7J4P+KF4UdgqVUhy7zKHldCLTYHsw7ISovFKR9ioJdTV3uDlU
	OXvJ+zNMvB3kcT5+y4TctumfksegwS2Gh1yL5mvAovgUYjQek7Ngm5rtdw6VzRlwpKuMjrxfphW
	IQ0I/7Lk=
X-Gm-Gg: AYBFou1URED73APZHJkHFzSLUGA+KheSXuuwTz3uudvMe5XGSQAK9ytggnRfmOISXEe
	j6slbf14NnlwKWoUB9ko8k5UgthPZA5AHX16l7NOBfDOUxAdqnuE8NvdZJj/svMTcg+hhpZgqEi
	R5V1RBS2/Vhkktm59qTXe+iy4Pai7UBSiPY8RlSvdHxayepRi2UV4y+rp4PzmJjyv0YgBxfsUUW
	47bazP0FDzq6bGVIKJP9UPk9w5WsRBabanYUqk7hOlgO13rOyBONOAqZyCRsx9za9BUrArKDbvh
	iz7MBHgYPPOZJe3d2a9YgTxJ+jXDJFdl3Saewv8A/oGlt2+CJRH4YCNkJobW0skYybSkrZC8eLD
	XDedzd7U88mgHILkBI/0+FRIW44kw/K8svcF11Mig7vTzfCOtWGr5eD6UI6+B448yZHKToygoul
	PWbSd5Ct6aW8dgjMTuJTeai8PMplU5TmRnqqbhiSG9KBKVWwSxmwecZOyK5CKhfxVKHNBti/G5W
	KtNnqI+OU4fkkY=
X-Received: by 2002:a5d:59c9:0:b0:487:7fd:730 with SMTP id ffacd0b85a97d-4886705713bmr3846878f8f.13.1790156226130;
        Wed, 23 Sep 2026 02:37:06 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm5084247f8f.10.2026.09.23.02.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:37:05 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:37:03 +0200
From: Petr Mladek <pmladek@suse.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: tony.lindgren@linux.intel.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <arOdv1HHPWzXgW7h@pathway.suse.cz>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917060754.37315-3-david.engraf@sysgo.com>

On Thu 2026-09-17 09:05:51, David Engraf wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.
> 
> Fix by handling the options first which will add a NULL terminator to the
> string.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>
> ---
>  kernel/printk/printk.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 6d3d18a50da74..f4803fe05a0aa 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2646,24 +2646,25 @@ static int __init console_setup(char *str)
>  	if (_braille_console_setup(&str, &brl_options))
>  		return 1;
>  
> +	/*
> +	 * Decode str into name, index and options. Start with options, since
> +	 * it might also contain a ':' used for DEVNAME.
> +	 */
> +	options = strchr(str, ',');
> +	if (options)
> +		*(options++) = 0;
> +
>  	/* For a DEVNAME:0.0 style console the character device is unknown early */
>  	if (strchr(str, ':'))
>  		devname = buf;
>  	else
>  		ttyname = buf;
>  
> -	/*
> -	 * Decode str into name, index, options.
> -	 */
>  	if (ttyname && isdigit(str[0]))
>  		scnprintf(buf, sizeof(buf), "ttyS%s", str);
>  	else
>  		strscpy(buf, str);

Sashiko AI has the following comment:

| Does moving the options parsing and null-termination earlier in this function
| leave the loop below with an unreachable condition?
| 
| Since str is now truncated at the first comma before being copied into buf,
| buf will never contain a comma. This means the comma check inside the loop
| over buf appears to be structurally impossible to satisfy:
| 
| 	for (s = buf; *s; s++)
| 		if ((ttyname && isdigit(*s)) || *s == ',')
| 			break;
| 
| Can the comma check be safely removed from the loop condition?

And it is right. The original code copied the original string into
"buf". The new does not copy the options any longer.

It would deserve some refactoring to make the code cleaner.
Something like:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index f4803fe05a0a..966744fb4bcc 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2672,17 +2672,18 @@ static int __init console_setup(char *str)
 		strscpy(buf, "ttyS1");
 #endif
 
-	for (s = buf; *s; s++)
-		if ((ttyname && isdigit(*s)) || *s == ',')
-			break;
-
-	/* @idx will get defined when devname matches. */
-	if (devname)
-		idx = -1;
-	else
+	if (ttyname) {
+		/* Detect @idx in ttyname and remove it. */
+		for (s = buf; *s; s++) {
+			if (isdigit(*s))
+				break;
+		}
 		idx = simple_strtoul(s, NULL, 10);
-
-	*s = 0;
+		*s = 0;
+	} else {
+		/* @idx will get defined when devname matches. */
+		idx = -1;
+	}
 
 	__add_preferred_console(ttyname, idx, devname, options, brl_options, true);
 	return 1;


I see two possibilities. We could either merge this cleanup into the
original patch and send v3. Or we could add it on top of the original
patch.

I would slightly prefer v3 and have both changes in a single patch.

Best Regards,
Petr
