Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776094;
	b=f+stSD0LKoxUUywO0qhf/sjM4qyeYoPowWDdZ/Ke649vVjCAsSCjOmoLjKKocv1v1HAD
	 6RadBgx8XfAfzp3iNiNZSaJ+SEJdBg3684VhXW+LINjWfCbwjkA5c55QfnaXPW6OfjH+W
	 pPJC2UCMqMSoOU3fvdGcN+OACMTL/pyW3U1pXWLHNKrJxnzn3VAMLscxNraPAXkAR3Pet
	 xxPrnw0bKgFur9e3+UuE6konlRjjcqpylp3seMHI25kyZT/FNAu7/Zb9Oq9qelbKxmDYF
	 CGIeeZEbzfIe85D7Gy7gono4TbkLsAPoduqTJOaIigbTo5TmZpfW24csUtEGN5pI7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
	b=SxnIRPtkh5WNAvVf3cjjeSMgpeBaV3T1vR0+O5A+QaehfERXw6wOWgcKl08CVZIT1YKA
	 CBYaU/cLUMjTmXa1rY2jxgYmMEFxr3meP9nDRsApYPe0Xc3P2ry58GCaVNQZN6pcuDK8l
	 yrkYBSwzlMnxyqnN69Gj91f9LdboJLJdL0CZKlfrxP5C0Ipi1GBioezGvcFwKTAk/K8C7
	 OL3g7751XnQWXdyx2fO9beymV5AbEYl2CCnBm+FL1ARqWnqV49Xbhuwq21jzAC5tqpfPp
	 EpLBSyZNMRb5XTDHMC6zD6nhi253eXR/JIMiS7KptFZJLFIyK07RP6JS6X+Edxtpitw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=PdYVAMIY;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D31606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D31606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=PdYVAMIY
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e7fc8265aso46936696d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794776093; x=1795380893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
        b=PdYVAMIYU0pKToo8n9Ju3bpTwraMraRAbuOWH3KoYoaUS7aL2L3bu8B2UUoQWiGhZX
         e3lc6HjxpWwcdp1quooLJWSYm1FrCGGCwjJgq9TauBYww/zfdBhCWNSmbUxfiqirrZBT
         h3bmEOFtjLUhpfqyXOc4LSNPZpDKAHy0qT8OfyEPkq+98/hfKFNbkZjhXiKEWJmOnurz
         XYjZ4OapSqpzTviifa5FdHnvwMSEYHLhzj8XmbfN1bmNxfS61+lVdfXwjc0igkiFP/6s
         vKYMo8zpOTXx9neVzIPDKsoyOj+baai5mAr6mdAXJddEP6UIH/jNjcwfzozGHK4h9l2m
         i8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776093; x=1795380893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
        b=MCU+1RgXAarn/r1kw8lLmr+kVgI65bHrDs3gxoAwyFJSTxfby9sj+wJfiNT/rTIT8l
         sr5YEU7Hz5ndAO5tJGCxVmtrOeJ2wJHC45yWRTF+gJJxJfubi4BdHEn29qqbeE971TWv
         BBdWvRKdhKDYqqq0+jESMXnUe8irBjtt8leKHx6ZJ6uZqzFyxeAmhFjZ5qR3CEZwdNNk
         JKkDNYYCspFWYZ7ZH8t55H8LKj/A5O/yuDNQctwPz4fg6HQ27QUo7R9lcUVSDS20fNJC
         SLNCM3NP1AEpnRkLlt69tzYv1tO0yNV5u5Wcs+q/p+hoQJSC10TeoKjs1CIuW0ZKvcwv
         HXUw==
X-Forwarded-Encrypted: i=1; AL+hErE3tQq4nPxR3JMszZJv/XGwuidCFBifmNpkBYcZIq+IU2MVmiTtHDnURydKp03eZaCQVzP+bYOEApKh66E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p4YakyFvLPV6iYF1cpIcV2fWSYD++VuLDl1RDNq+dvPwJPLG2
	WNDoqyu19aKRjuEA+zfJjEQWPyqbjOGEoXqh38t7phftBM3O+qrHqkSLdLW7K3xF+Q==
X-Gm-Gg: AYBFou0zloXGsx6Wfr6xlC62o70Oq3vDSjaZf4hcYakpYpxlttJJYhG5alkqXi3YLlh
	WeeKs6UysNJpSG4QMQWA+kUo/GxmGqoknLy3MWLLJHLhzxyH6Uv0JWC9PZdWnlfhGRJ6Em2omUU
	ru0VARKIsBGrwRt52TU2yJLtw0OQjHkuC7hgwTsVz/I6hjXg0RBzGNU7kp0upSZxmDSOAWE+Q5i
	16JhqoHx5AE182Z3itZZwLK3GimAdR9hZn9uKAwJSxDlKWgr8+5dknX3Zbphqk1e34UkxUVA/ot
	i0qJU2Y5boA7CsNHFu/rGNVjCEkJ7wTj9Z1hUZTD6/s5nuiR1jBXr0W0kw9zi3Gaf0n8aYRr/m0
	fiv3j8DHFHEf5Kv//BAB/f6zvW7AR/AaBE9Z+p26/CuoEIVcRv62Epn55NTZ+9rpqrSxoJLLSI8
	lis2h0FcAtk5GylZVdBHj/BpxTrPJ9vTKgjlo3Wg0MW0LyExurJ+3npK9kRPHsSh3Z9Iha06MqU
	ZeoXz2DQCr/zzc8gKWZ8ZpcOXa/9pQ77h8clIvlw42r7UOAsuNCXBn06c4EcN+TkoIG2NG6wFbu
	h/dz2ARSZdZLvNsZ5K/PxyRHDtYg9Q==
X-Received: by 2002:a05:6214:5409:b0:91e:ee6d:753c with SMTP id 6a1803df08f44-91f2426507emr136814886d6.41.1794776092947;
        Sun, 15 Nov 2026 12:54:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ca2esm70627266d6.6.2026.11.15.12.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:54:52 -0800 (PST)
Date: Sun, 15 Nov 2026 15:54:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [QUESTION] usb: usbfs SETINTERFACE during a runtime reset-resume
Message-ID: <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
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
In-Reply-To: <20261115163709.226641-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 08:37:09AM -0800, Cheng Yongkang wrote:
> Hi Alan,
> 
> I have a question about usbfs and runtime reset-resume. I am not sure
> it is a bug, so I would like to ask before sending anything.
> 
> The kerneldoc of usb_reset_and_verify_device() says:
> 
>   Locking exception: This routine may also be called from within an
>   autoresume handler.  Such usage won't conflict with other tasks
>   holding the device lock because these tasks should always call
>   usb_autopm_resume_device(), thereby preventing any unwanted
>   autoresume.
> 
> (usb_autopm_resume_device() no longer exists; I assume
> usb_autoresume_device() is meant.)

Yes.

> proc_setintf() runs under the device lock but takes no PM reference.
> After USBDEVFS_ALLOW_SUSPEND, the device can be runtime suspended
> while the file is open. If it then resumes through reset-resume,

More to the point, if the resume handler in a driver bound to another 
interface in the same device calls usb_reset_device().

> finish_port_resume() sets USB_STATE_CONFIGURED before
> usb_reset_and_verify_device() runs its restore loop. A SETINTERFACE
> issued at that moment passes checkintf() and calls usb_set_interface()
> while the restore loop is still reading intf->cur_altsetting and
> calling usb_set_interface() to put the interfaces back into their old
> altsettings.
> 
> On v7.3, with dummy_hcd and a gadget that forces reset-resume, I saw
> 1097 SETINTERFACE calls complete inside the resume window over ten
> rounds, all with -EPROTO. There were no KASAN or lockdep reports, and
> I did not see any corrupted state afterwards. I know 7794f486ed0b says
> that I/O to a suspended device fails with an error code, so -EPROTO by
> itself may be expected.
> 
> My questions are:
> 
> 1. Is usbfs expected to follow the assumption in that comment, so
>    that proc_setintf() should hold a PM reference while it changes the
>    altsetting?

In theory, it should.  On the other hand, a bunch of the other proc_* 
routines in usbfs don't hold a PM reference while trying to communicate 
with the device and owning the lock.  (Of course, they also don't try to 
change any interface altsettings.)

I suspect a better approach would be to have the routine fail 
immediately if the ps->suspend_allowed flag is set.  The kernel 
shouldn't be obligated to resume the device on the user's behalf if the 
user tries to do something at the wrong time.

The main thing that concerns me is the possibility of contradictory 
usb_set_interface() calls going on concurrently.  That is best avoided, 
even if it doesn't end up crashing the kernel.

> 2. Or is it up to the program to call USBDEVFS_FORBID_SUSPEND or
>    USBDEVFS_WAIT_FOR_RESUME first, so that this overlap with the
>    restore loop is acceptable?

Well, yes -- user programs should be aware that communicating with the 
device is likely to fail if it is attempted while the device may be 
suspended.

> 3. If it is the first, would taking usb_autoresume_device() around
>    checkintf() and usb_set_interface() be the right fix? In my test
>    the ioctl then waited until the resume finished and returned 0,
>    which changes the current behavior of failing with an error.

If we go that way then yes, this would be the right approach.  (Except 
that I don't see why the autoresume shouldn't occur until after 
checkintf() has run.)

Sorry to be a little wishy-washy about this.  The whole topic of how 
some of the more esoteric core USB features should interact with usbfs 
is not very well defined.

Alan Stern
