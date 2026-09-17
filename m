Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB94A2633
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636030; cv=none; b=LVzcWrkIPMRV2j+4ohBUE3VVYNH1SbR5LklJ4RTYCnqEIfu1+Gxv6VzPzi98mXcLp1LpOdHtJYgx5U9wRZDe5Sb2SrYM+RJVU0QJ1HzISYEcRQ4ZiDa0iVOF7F+dVcxckVo6pdELISglAJxSTgCwbMTp6yKIk6mEddeX8Olu5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636030; c=relaxed/simple;
	bh=W6DTvRWLmpIsiFAlB1cla3wKAoWr3XT+ojA5ZsdvDrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opqf4QmcRjt6tDL8AqhjcvxLsJNx/kFw73YnKd971Mj8JURNSnn0lp10oKMn0X07OEcx9g1z3LBXAXCI2wu2NZKiHpU455yI15ZmujBsCbPgmpiChDQiLCwzfgjzQDSvZlk6T2xHzw7Ita4ciQKcUljzDTJ78SlUzsbORf00I+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cG4RECjJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cG4RECjJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e73611928so2615115e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789636026; x=1790240826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxbi13ouQTHyRdtBDlCDYfBDO36J/sfcBmF9VRStXnQ=;
        b=cG4RECjJ17+bcikV0X96lOtKHY1cwuunqUHAZoRCAMND3KD720QAH1vMtZtugQD+Af
         j+Yvio1WMCimAq0c6ZddZ7iaNLcyw3Uy/3PTSXn8Mwxu8cXX+bzZLCNGLgew4KSEfgWE
         Zs48XxpUB6AGZEhQ1YgcC4Kn7LsW7w7f6QJdvEiJq/IkagyixJ0WzbMhTZKZUqGFiDMs
         wdupwHSS8DMXoiDm9IFl36L2//M3W3XXfnE9WHb3WQk2+CO/drpHrkOssnjve7RScD+U
         yQnTPdhcmPAu3Dbgrkiv1EGr1sPVoGwnGA5PCXeeltKi4HlYqcmZfzMDo1YulvM627Hh
         CGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636026; x=1790240826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxbi13ouQTHyRdtBDlCDYfBDO36J/sfcBmF9VRStXnQ=;
        b=U42VvgydGrHked3Vf2jfXhcFWdrEc3Q5sluO/6rzE5aLpSgXjEVhl9PhMvfZskphU+
         VH4gO7Plw6HADAAA/HKOgnMl+PPiwbxfcw4zgAKTEKV31FpAgJ6LDOP8n6BMve12IwnE
         jTxCH23D01r5rcMfrAoXzIw07OKDHU8h+YN4HiukVsx+kDKkcPFnJzxu5/rZUmsCsrMu
         XTVakoxO/1BR/I7BrNehemo6AHXfgYoQDmplmqG9aaD6Dah2ncHBFN45wPAi9ZJ9ZgHb
         7TvgRvymhiLNXfs0EW3fpy3UtxHL2AM2bdhCTcH1kgayESFx6wZrIuM3yOhJDgPs46+I
         lmjw==
X-Forwarded-Encrypted: i=1; AKwUvBx7jUXG/Tstq/iQkAFj7UID+c0SyzrlCKfA3Bq3Voxq5c+4JZS1b4QV+qCL1k3ZnPAk/ygFIcxnp74RKkw=@vger.kernel.org
X-Gm-Message-State: AFuF++kGn8P5CjMM9xv4lPRAwjh3UPfeVOdpfBfjuiAl63J0v/A00r23
	NFerhJxF2qBQKX3bfe10mefgzaldCQ9X01BiZkJjZ2aCbz5l0eKIlf6RMa37D9fWOOo=
X-Gm-Gg: AYBFou1aezL2wqM2zpK3alif2LbW4TaRzJUA8tG68ZTOYhRm4umgNu4AVclkldeFvvk
	DKSaNjX8wLI0s8Fc3QydFpIHh1BUVxeDCEnHlzKqSMkS1E6ElmPwan4M3KexyXOtXrZk9LbWQ0o
	sTmaLYu3iOpUrherxmC6Mpx8koOZ1rI+RSxX/NH9jMaNI4Shhr4yWBaTnDU6fC2GoyLirVWUPk/
	Mese+wbTEcA01dA2pJNvD+Ga65+evJIpe5HLL943WfOYobPAN5ecXUvN+6ZJFStYvcQwFsPEmcX
	fv/1hRX7LxnwHlBQuSgg7kLec9A+rWQufQMIku3/UyRlntUADxmx8DJseqhiw3l0tDKgQqHEetg
	ybDesRbPhXIQASh8ot/xHI/sjeCVb5KFTxfgahixSBNTEz9qsUoNDEQTYntf6DZBxMc7ZCa/Mfd
	GhIOlgdsP+8SUCWodevI6vBrc8mSr7OjCvVD5GMX+Bl62fKvIjA//yU34qBzKXH8cfh2kpl4V7
X-Received: by 2002:a05:600c:e555:20b0:49d:27ee:79c9 with SMTP id 5b1f17b1804b1-49fbd1c4afamr25264695e9.8.1789636025806;
        Thu, 17 Sep 2026 02:07:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm12476177f8f.12.2026.09.17.02.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:07:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:07:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by
 default
Message-ID: <aquttpMVKX8e6zGB@pathway.suse.cz>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
 <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>

Adding Guilherme G. Piccoli into Cc.

On Tue 2026-09-08 14:07:16, Zack Rusin wrote:
> The core panic path enters a loaded crash kernel before running kmsg
> dumpers, so the VMware logger cannot preserve the panic in the host log.
> Set crash_kexec_post_notifiers during VMware platform setup. setup_arch()
> runs before ordinary core parameters are parsed, so an explicit
> crash_kexec_post_notifiers=0 still overrides this default. The 0644
> parameter also remains writable at runtime.
> 
> VMware exposes no capability bit for this behavior, so the default changes
> for every VMware guest. Running the logger first adds work to the panic
> path and can reduce kdump reliability.

AFAIK, the quality of the notifiers is varying. Running all notifiers
might reduce the kdump reliability even more.

I do not like much the hack with crash_kexec_post_notifiers. It is
an all or nothing option.

Also it was introduced as a quick hack so that users could decide
what is more important for them. But it is not longer a "user"
decision when some platforms enforce the ordering because they
depend on the notifier.

panic() is problematic and it is about compromises. And we need
to balance what is important, what is safe, and what is optional.
This is why I suggested to introduce more notifiers some time ago,
see https://lore.kernel.org/lkml/YfPxvzSzDLjO5ldp@alley/

Guillermo implemented this, see
https://lore.kernel.org/all/20220427224924.592546-1-gpiccoli@igalia.com/
But it has stalled because it touched too many subsystems and it was
hard to get an agreement.

Maybe, we should start with something simple, and introduce
one more panic notifier as a start. It might be called either:

  + "panic_hypervisor_list" because "crash_kexec_post_notifiers = true"
    seems to be primary set on hypervisors.

But I would rather make it more generic and call it

  + panic_pre_crash_kexec or panic_pre_kdump because there might be
    more notifiers which are either 100% safe and useful or are worth
    the risk before calling crash dump.

We could put there x86/vmware notifiers as a start. And we could later
move there other important notifiers.

How does that sound, please?

> A full log transfer uses 1027 low-bandwidth hypercalls; three checkpoint
> attempts are bounded at 3077. In vmcall tests, a maximum-size transfer
> took at most 7.47 ms; three complete transfers comprising 3081 calls took
> at most 21.58 ms.
> 
> The crash report remains suppressed while a crash kernel is loaded because
> the host may terminate the VM inside that call. A future report from the
> crash kernel or kdump userspace can restore the event after saving the
> vmcore.

Best Regards,
Petr
