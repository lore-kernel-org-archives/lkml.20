Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865227;
	b=Ctz+4Oz4rHnQjsFEes3Akpb99MwRmavdFGIvEJsvWlL9jKM9c7dS1DXZXqm+rOgTKSrE
	 i1TtVHxkBx48+3VTjJDg3fzpPFzrmZa5Xyk5wj2YLAZrgLHMpUM6JEiKIssyBRJPSbgRy
	 hTDYEQQLI/bIEWOiX49Q0apmMHGHgT1r+vRElR5V4MovZcs+m8qw0PXdFeEeFCkXijcOu
	 dMDZt6HQzAdV49IZ2ogEuo0J1G+VdT4FOy8tTbJHMcXmC2B54M1QWMt0TK5ywqYm9X1jQ
	 bWTEon0kmBQFtQMZoPcIHYKa1d0nWS5FtUkydAHLsR3R/Ff/NY/7AtOG1ihizi/Zyvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=guxuySiDjFPex5d5UZXMSLCVow0xqFx3SUNRdh1n/Hc=;
	b=gVW5iXGf/qWHVbecrUxL9zZwBHRZQ/YZRnpQDkiKe3J81UzlyfJ7IEFADSrE9TRtdD67
	 vx9Ss/76/vn1HtXxYdFvyO5/jNPJ6Ba/hx9ajbj7Av3XitKtQFILFlsWIbROID3AWjsGl
	 B5W3MyH1Ckltb19WU/Z5/SRrxXNb8Ffjh5nCVo7KUe22fj5IgUi+1sFJ037X52zWbFpIS
	 dAXjmlcdH8rFHr1AzTP5YLHDiS+o9mNpLaemqQlT3C3ky97dHwbUyX/Aja1PpC23I85VU
	 VRKu8nqnxQ38PsKkspuWCc1CY0Q2t8NdukQg5rAtOpdhsg9vOl9sJOLkCduwlR4Ks2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKkz0+AM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C404606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C404606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKkz0+AM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490585eddfcso2816280f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865225; x=1795470025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guxuySiDjFPex5d5UZXMSLCVow0xqFx3SUNRdh1n/Hc=;
        b=oKkz0+AMDMXN2MbYaume/5ijBFXw2UEilp1YUcXVt+/1ijvmke8ziYe28kMFlj1dHH
         O9uDX0mi+CvYhudeI/1woWvvpsubxt9cNyMJqUbu1C4OeU4k90mFRq8Bur5HuAaJTANW
         4SSxDlm4EuxKFa+baVVg8QRRZvr0+7zbbm2zOdP1WODDT6FoLKMlqsGG7aHqwrGDCmxn
         Q2ufjBSVd3RVhPFdeVgyi9SYNlRaONfjCqXzqCnMq5MJ0TShxxikBMrNQbNJsn1dkfOG
         mwltvcbwZoUDZ/UfHLijw6cNCrdFBk6R6G3a1nvoQI+Hwqmk4UTlit8sFsegqQtq8PhE
         4F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865225; x=1795470025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guxuySiDjFPex5d5UZXMSLCVow0xqFx3SUNRdh1n/Hc=;
        b=lNI4h62vId0uKmriQAAIWUG4PF4x7AunbHkho0Pvr2g9q0O+QOR+Wm6R52xkVNKpn6
         qED+BUZuDBFFNeK7OROxtlGgX/5FXPiwa3DBX8aFRPgw3GjhwxA4mw6OFKayXl1pQo2j
         VnFqsbxR1KujaJAlJBG2sEvIC+mcqaB8nZf9STHKJO0wkDdb9t9QHg0xBIavIVY3Dd2u
         QFvfp9e3Hr4c7+ojizBUdK10bQJZdwAHEsUnDeGheOKRnWCvQHZ0XPIYN9z/xBB3Gsm7
         y2nK/Y1dhI907ZK1C3JX7ChjH9Qi+SlP4YRuzOztBoY/FfO7DelyM8N3Z2teui4wl7Jx
         g6dg==
X-Forwarded-Encrypted: i=1; AL+hErHZGw91U0VDcE6RarfiYp1gGGZOR5kqdOHPXa8Pzr0207Qoh6AmV+8yvOiidwIVnG8KTigjQMBkeba+m2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MtC2lrZZDdFid3kFWv9zDayinxrs2CTAXokQ+WD/B0vLEi/E6
	TZ/ly6dKhD6LyhixMKIP7hMZ1pXkBRghsgxhHG6me62OUkeKROK2RrirMCOZ3VFO
X-Gm-Gg: AZFdTZeYchMuLn50KRvMyfvW3PXySJ5TilZvy5rjLHWfZckgvtG/0GiZN3yvzSefL/U
	pk83VsjAe7F6MqRbSSZBlDGSUlW2+1JfagFj7VN0AExu9SKICIMmsEOSiG+OVb4tlRxemrwnzs5
	jrWG2yOGoLCxzxOJsl2p+CJtVKrtH6TumQkNEMUE//kOXaz0U0OBAhFSlkfJCtyk+lqFrrR6aTa
	0VYruSkLC7cMRGOM9zjcmzTPMJ/2TYrY7mAZ/kyr75oLIo8BRkn6cY3XEzUzL7XDrhTyDjFTzlg
	r9weHdHJiC0DjBH23O92fpyqCSabUKraaTSgLN+rUmT2/QJ/A/cfXy3mwBrY8tzvni1LDwemapH
	PmldqBn+ZGsqfjRLM/ibo43lZpBrPjkmQKWHhBF9UiIY18b3w9jOV2vUUzSJ/NvMZ1IXxH6BObw
	721rARzCju8Nb+Ud1/2BGSDoN1SDe6gF8Lq+dxcn11l8mzRN0q90XsgVxuk3ZYMDhthQwdlny3O
	E6104xgNEMs8eywwnB5PbPBhM6hZLQvSlERdbHA+qWUmA5fI4oGGiJ310+9Q2npdJGy9TQvHDVD
	/ZyNzoSxQiTKFmKjqtOtpBfghjNQTe2phB5L47qq/VIZV9wlJdo2jF6HIkUCBS/4T7uGoH/kOri
	2n0nOpJBN2VU=
X-Received: by 2002:a05:6000:2602:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-49c71784d80mr25910373f8f.31.1794865225021;
        Mon, 16 Nov 2026 13:40:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm23985103f8f.12.2026.11.16.13.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:40:24 -0800 (PST)
Date: Mon, 16 Nov 2026 21:40:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: wen.yang@linux.dev
Cc: Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/6] sysctl: replace overloaded extra pointers
 with typed bounds and core stride
Message-ID: <20261116214023.1a1b4205@pumpkin>
In-Reply-To: <cover.1794844686.git.wen.yang@linux.dev>
References: <cover.1794844686.git.wen.yang@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 00:07:32 +0800
wen.yang@linux.dev wrote:

> From: Wen Yang <wen.yang@linux.dev>
> 
> struct ctl_table has long relied on extra1 and extra2 pointers to serve
> multiple unrelated duties, including range limits and caller-specific
> context.  This series addresses both:
> 
> 1. Replace bound pointers with plain unsigned long min and max fields
>    directly in struct ctl_table.
> 
> 2. Replace per-entry context pointers with a core stride mechanism,
>    allowing callers to register arrays of structures embedding struct
>    ctl_table and recover enclosing context via standard container_of().
> 
> This RFC focuses on the core stride infrastructure and two representative
> complex users (netfilter nf_log and IPv4 devinet), as suggested by Joel
> Granados.  The remaining treewide callers are converted in a single
> squashed commit to ensure the tree builds and tests pass cleanly.

I think I would have tried to avoid the indentation changes - just to
make the actual changes easier to see.

...
> 4. Baseline rebase & conflict resolution:
>    - Rebased onto next-20261111 (aaa2f954c21b).
>    - Added proc_dointvec_jiffies_minmax and proc_dointvec_ms_jiffies_minmax
>      to sysctl_check_table().

I didn't spot those in here, but are they even needed?
Without the bounds don't the minmax variants behave like the original functions?
So it was only necessary to add support for bounds to the existing functions.
(The only think that half makes sense is if a caller uses extra1/2 for
something else.)

Related, I think you can reduce the size of the final patch and the likely hood
of some silly errors by making the 'dointvec' functions treat min == 0, max == 0
(ie no initialisers) as 'no limit' rather than 'only zero allowed'.

David
