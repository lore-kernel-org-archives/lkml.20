Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104864DDB5F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081771; cv=none; b=oZEw+PvlnCdeS7hZMl484D7oXwvEYNnKjWnS8ofAhspfvGfIJL2CkQaDssRjHQ10bO56geI0khfIt9S8yf2hjC92glPTlpdOlHgwg/PpReEPsYJSwaRmqRot9NDGK4CVckj3WeqeDfsIYsar6FxJW8v0kMigU+7tuVEkETt8K10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081771; c=relaxed/simple;
	bh=1RU0Kydm/QO8mPelcrJzOpchI0itEJYTTDNITU5z6sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXEH4qR0v+kEnI7TkeHw2MHIiSsy3s+nA0bxE9zoJT6smLbwE8N4k+Mo54WEjnh2nQea/2Gf8eOPuSNG0+jb/3cfESjs3/UK1TCeaxzMMNw/1Es4YaBVhbxzAZfbPF9cMPdDh+zmsJAmykoYEMEDdLkc85IcBWidltE9ltSi6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CBm7waLk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CBm7waLk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so24608585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790081767; x=1790686567; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PJhsL+lJDEWlsy1P+VAKjdzPyZEVZBx/BR6qGAMVLY=;
        b=CBm7waLkf1RECVJLUq5O2AnWTfyTm1raSLrdZLm4nOW6vTkEfK33lmeaBL+9FAifRR
         05XyGO4u8f/ltK2WllgJhyBwa7LHRBPJsZ4lPWAVgLhZ5OJ1vayxv6ilYlENtetsNtJD
         cvG7K6BmhF80scf0YBtSYcmOf5x/yUsxSmsE57nbU2AQwlEf0W5PPlTKLsEv+J0Ij8nk
         iageTw80MDFLrfQEdCfeY2TrYB5pxoChG0Cm+xzzCgMltIO+142IoaBKu8nQqF7VtLHj
         Jbb1iRoLHW8pPQwnBysm72JB1xXnHxaPDtGyeqPMhLu7oEm0DalFA9w4OUc8Ao7AB0Is
         Lpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081767; x=1790686567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7PJhsL+lJDEWlsy1P+VAKjdzPyZEVZBx/BR6qGAMVLY=;
        b=GirfEszBjzUS5PLuCeRZZhPEw0/8S99eCPYslBK5+jdlkFomn8MImEVESC7l103pWL
         IjLaCmVyPBRhriDYB68G1GVE38Ogeg1g/tNsHr0mvStD7IdgsPMXlKDqU84LmXKrEFCt
         nTe37Jhc2LVPnTwIPrD731jjrYG0wGxrcIMjiwmtFhoTOb1y9hxYzazMG4s6g+Os+w4P
         DwiUaycadX9AS2feqbjFOyqsZ0eYgyGtA1gerIy4A3NE1+QKe1gzieA/QgTcKthBWSCL
         E4EHWwvCDrgXTesAeMdA0CBSm/I2KZ3GM2iwk58W2i2XxzCd1lT4hTA67XISCb3XbmLi
         VgBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkoeLD3AfGPOTkG3erme47e3X4BR8iygoYw0jh9qranobEoF1xZEplqnCEMrPybAhQWSmX/297006KeuA=@vger.kernel.org
X-Gm-Message-State: AFuF++lHToB7GuzXbUuJRylrJ+z9beV3++jOqKlwwq0ba0f/L4WPRmah
	Zcw5OMdkDDjqhn7x400HO5VxRnbS+sUumb6W3de6KjAIcHo8buiETzhzo9GiRTNLbxg=
X-Gm-Gg: AYBFou3oNF+wdar1mos0dzCe/7KKIngNENQmae/57SYcvr2k7Ic91y3NYmQIzwKpNp/
	loZEPkFStRvmUBLVIUoIfo0nbalwbjozicYm1jWoARV8aE0+TBhuiUxsUk/l/b4WyxFQSoNMpmj
	ufSaPtFbVR5ab4UNrpSCNPuq0r8Admt9BPN22YWCSEWLC6wXouisTh98GyzQOXDnL/R3kEY252E
	Q4vY5bt5m/HWgiDPAfY7eRg3e+P8DeTuQiDqb3eIC7VVa6X2R+ZplGsIcP8YrEcVpdcZm+iNgPi
	aw0UgACwW8BDQHCiD9L4NRR9FY5DxPJSIwGaqpdQzMOwVHnD9UnJ0Zj08Fn+vGe07xDj5VMMVfb
	gMcVro5PFXxRBWzU2sJpUwAJbKDYOU3PFJ568TkujHb2CjNrzfGXcECUdeVFX+84qIrTOIVHLq7
	bndlEpbTbr654BIIA5m+Ol5FVvHOg2rNFSSJ548we69TSr7QWxaEyJkM9gNjaSoPfBFSJZ0MQNE
	nQYv57978Yt
X-Received: by 2002:a05:600c:154c:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fc5743c34mr187732015e9.29.1790081767101;
        Tue, 22 Sep 2026 05:56:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277def8sm5249195f8f.14.2026.09.22.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:56:06 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:56:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: Re: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Message-ID: <arJ65Gt8w_97kbux@pathway.suse.cz>
References: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
 <87zexocir6.fsf@jogness.linutronix.de>
 <44239E18-2EE0-4451-9481-EC4283473AF0@oracle.com>
 <FFC322B2-6CD0-4FCC-BAD1-1C6D50D1CE9F@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FFC322B2-6CD0-4FCC-BAD1-1C6D50D1CE9F@oracle.com>

On Wed 2026-09-16 18:22:12, Aruna Ramakrishna wrote:
> 
> > On Sep 11, 2026, at 11:24 AM, Aruna Ramakrishna <aruna.ramakrishna@oracle.com> wrote:
> > 
> >> 
> >> On Sep 11, 2026, at 1:08 AM, John Ogness <john.ogness@linutronix.de> wrote:
> >> 
> >> This Message Is From an External Sender
> >> This message came from outside your organization.
> >> Report Suspicious
> >> On 2026-09-10, Aruna Ramakrishna <aruna.ramakrishna@oracle.com> wrote:
> >>> Problem context:
> >>> 
> >>> After a reboot, NetworkManager failed to bring up interfaces because
> >>> systemd was stalled, due to a flood of printk warnings.
> >> 
> >> Note that kernel warnings are considered serious and will put the CPU
> >> into emergency state.
> > 
> > I apologize - I misspoke. These were not KERN_WARNs, rather KERN_INFOs
> > being used by RDS to warn of connection failures etc. A flood of these caused
> > the console_lock starvation.
> > 
> >> 
> >>> Systemd was
> >>> blocked waiting on the console lock for over 122 seconds:
> >> 
> >> Also note that the console lock is related to legacy consoles. Rather
> >> than trying to make the legacy console trainwreck more reliable and
> >> non-interfering, efforts should be spent converting legacy consoles to
> >> NBCON.
> >> 
> >> What console driver are you using?
> >> 
> >> For v7.3 the 8250 driver will be NBCON.
> >> 
> >> John
> >> 
> > 
> > This is for the legacy 8250 serial console.
> > 
> > Thanks,
> > Aruna
> 
> Hi John,
> 
> Even if this patch is not applicable to v7.3, it is still applicable to the older kernel
> versions, right? Will this be considered for the stable tree, without being merged
> upstream first? If yes, would you mind reviewing the patch?

The patch is not acceptable as is. In particular, it does not handle
panic, suspend, various emergency situations where the waiters likely
won't be waken or we do not want to risk the handoff.

I agree with John, let's focus on converting console drivers
to the NBCON API.

I am sorry but I personally do not have time and motivation to review
hacks which would be suitable only for stable.

Best Regards,
Petr
