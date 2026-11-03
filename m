Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722326;
	b=Y8hV/kGpabWtLfWDSL8NGY94bwRGjM0ZwFEdCFJMMeysbXHl/zJY7xyghF9NSzgiMq6D
	 sx+wQDDMkIPViD49GCIK5xNl3wsvF2q3uh8V3lABfgSaqxbhtpJbWqtnU7wbHn6O8rPfw
	 eZYuDXX3mey8gpDJnsROErtl3hAqQwwS7SawYtYh2U1OQta+AtC94ZD+sXZKInxrEIaYd
	 Mm2NPnrKRXPrZhfRbguN5/YpfiM173lt4HdBIQZh0ax5Wa79NmejZPagiLhVK5CaPXwMG
	 pIYr2Gv0p/rufvDsGLbqxer0cwXUejtdqJWsUwo0SpaqXrs99LVtnNRM6S7tm8LJtFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SIhXzpAEZmO7QYE476k8BtivWJPPmQcCPe7Sz8TDBx4=;
	b=0EqnqiJSWy/njDRlbTQpbjOGpCF62uSrP/ZAoudKHcO5bJWF54tDbnzkrwZrwyV6lygi
	 SU3lO4m72BzK0hYAORKw/GpnjGXfvcN3y2nVAfiJzvi01FPKIbsxx+GxNgy6x1iFZvzdu
	 6jiC2gblwl0uOXqpEEjSmQnQI9FnzoI2dLTTOYx0vFAEfsG0e9XXgTcnk9DiYnOpNSLgn
	 B8M16qGOqHi1vjSLnwe7tI3/UApB6e+i3TmPosTxc6G43k4l6Ary8Ypy1K0ED9dhsdZV4
	 ByvTQxA/4CCEUQlTx6WFoLViklm3bMeRxcmwheBrmtGAT6Wd5tZpVlNCX8cD+bFOE/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y0Bgw+iR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A833606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A833606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y0Bgw+iR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so43301155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793722325; x=1794327125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIhXzpAEZmO7QYE476k8BtivWJPPmQcCPe7Sz8TDBx4=;
        b=Y0Bgw+iR4Rm+bR641Usxw4xDkDAd1IgamXV+c+oPZY30zyI0P+GU0iW0NTm9/DMAOq
         BtTTbZEgNDvfXXNjVQ88JelaAw8WgyFoVKN7MzZIefb2sNyrijN1PpIxgMeSAekJD/NW
         Dyg//+Ol3qtS2067jNPXTCXDjlIYk3Fki+O5/hnNKuKOCbCnhhSB6GaPjMIM05XGL0uV
         7T30PWOWFWn0WCDQsSENO8Lf5eDyVKRUPpXQMBfWts3O0avzBGcjAL9LdC6dc7I/YvZt
         dfQLKysXQz1nv401sHySisB9dd/7vNpYLTw8ZBuHxIAe67SlY6mGa4TnODRo3tZv/qmM
         6XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722325; x=1794327125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIhXzpAEZmO7QYE476k8BtivWJPPmQcCPe7Sz8TDBx4=;
        b=M/x5kvuciqx+u11yGgjH5TdJvBCaOErHjYkyPu06FOEoOHn5sgAXHQd08JThgvOW2B
         9GZnI1xA6QKQBoT+ycECSIRSVYUsFEqa3mp2Ao9+D2gbggl73PufHsqpRebRgkty2p89
         bAja1c/WmaPo/PDWP79m08AauqnkwNj+I3/ppzs1uhYtCAW1N/vNORtyLSybutxxiLyl
         9GAvZQ1JfUVDB2hbKUxboVHmEotv4j4ui1Oauv9VRR5eD2mi01eesrHmnRDDeYMRle62
         /DPaMV4pf+xxMwKM19kMrMv7mUs3WL4kYOvx53MBXeipBBMpykKxHepDBRzwGp07alFh
         netA==
X-Forwarded-Encrypted: i=1; AKwUvByp9kbDYISWPOa91klEgFVzsuP26Vlydbt+0Lo9HT7c2yRzB2ybQaZkDVZ3JScGesXSyOcHVbJGt+D14v8=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ASN39jfCSQhWg/Gtb5jg7gOcUwQy9ToaeOhHO0EDHJuG3Rj1
	mzCxmKNKlq9lQdJBe/S5ic5HL2xpS8S9wSV8E/owZLWSLfcJkXTSqNHqo1ljF4TjXjk=
X-Gm-Gg: AYBFou2i80+Hib3HaOA4KVIxr2/7q6kIAn8wOhKO/R+QKr453YM+Jihx44N3iqruQj5
	E/H64jERf5NqGBpSQwP4s5IVMshlrB11KkNhO16XyOGsIZYiR5t0v0/f+ibyHQhX60t5pbFfziK
	bUuPej22n3yaKqaVYlKIVsQWAiRxzVAsz9O/kX9p/HMe63S4iVPFlXW4lVbZ3/Tq0Z0f03uph+B
	AKa2+PJUyYyARvgeVOH4X3KTQAMW0y8d57MyjI2zmrkCnMR7DHlINwhxSJPySi5tjK5qHnY1jPu
	y6LsdUoA2KZm59QzyiG+Sx4kWLatRRlB7HA0BMRRjPknlUADaz1f/FUgYmlQzt09cfVbANEwsPr
	i9JNw7NWjr6w1zL96p1V6KROkhdU2clZaVtzfpJFoh0S7nISQXg7t/WmhSuCDus5XUwiPVilhm+
	7flg+5sFzjk4a1RkvZxwjDfBE+z5FjoJ9VfYYAex0767vWn5EDIJOOFuNMy+Oerb4euVTgqF3ge
	BjlCTANo6k9q9QLrp2ti4QfX00pJLPnRz+pt8xQUdCXWYwc6l8uWOAKDkPzdV5minu71zbGpTLQ
	vdghSwdFkZ7HHYNvYA8HhVrgkVCGNA==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr327504115e9.4.1793722324677;
        Tue, 03 Nov 2026 08:12:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm78415105e9.1.2026.11.03.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:04 -0800 (PST)
Date: Tue, 3 Nov 2026 17:12:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/16] printk: Separate code for adding/updating
 preferred console metadata
Message-ID: <auoH0lHg0hCEOFYE@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-5-pmladek@suse.com>
 <auLwTYSza9exX3ba@chrisdown.name>
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
In-Reply-To: <auLwTYSza9exX3ba@chrisdown.name>

On Thu 2026-10-29 15:05:49, Chris Down wrote:
> Petr Mladek writes:
> >The logic for adding or updating a preferred console is currently
> >duplicated within __add_preferred_console(), making the code difficult
> >to follow and prone to consistency issues.
> 
> I checked that the split itself has no functional change. Thanks!
> 
> >-}
> >-
> >-static int __add_preferred_console(const char *name, const short idx,
> >-				   const char *devname, char *options,
> >-				   char *brl_options, bool user_specified)
> >+/** add_or_update_preferred_console - Add or update a given entry in
> >+ *	the preferred_consoles[] array.
> >+ * @i: index of the entry in @preferred_consoles table which should get updated.
> 
> kernel-doc needs "/**" on its own line, otherwise it silently skips the whole 
> block (`scripts/kernel-doc -none -Wall` reports nothing for this function right 
> now). With that fixed, -Wall then also wants a "Return:" section. 
> "@preferred_consoles" also reads as a parameter, maybe just 
> "preferred_consoles[]".

Good to know. I was not aware of it. Will fix in v6.

> I agree with John about keeping the comments explaining user_specified and 
> console_set_on_cmdline as well.

Done.

Best Regards,
Petr
