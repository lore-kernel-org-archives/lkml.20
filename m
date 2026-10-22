Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668091;
	b=izj9pcDnSF6J14DN+w60K7vdIi5ilzMu3TyAPPScLBRDv2NqbPpFV8yZghD9kyX6wgbP
	 6PF72Aeg5SXBCnqx4WYzgX+Rs0OJVvqP8Bp61iejZuboB4jbU4m15JocnhDBbKKQoq7/D
	 mOGDJoVdtiSSk/h17TO+rhtmhp2Tlq899bFeoVa3gRFYPDRNa/ZA1kKFmgahRivgM4Lif
	 0Xluf7WKGZJgiYOwrDIndnOwsuyCVMlRtYGK5XtvrE9DzoJsfLzk2kuqVDFDY+WQIqJBk
	 4rxBlavy4O7MFd/CIiZq9vkq4os1SYerwAPE/lO5eyau9SNqGK5Lo9CIz7L7xvCjiPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YK5V6UeZ+5TIYQp33vU4MVP0I+g7N2au9bpVxBDnWnI=;
	b=sU+BXH4WDzlgLyNurQiVHsmnQL0Oih+h45SI4va9DcFeM4pwFZuIBT6iK73JDEHL12m0
	 Yz9bH7elVo05w/bPH4hovtCNj7NGVnvGZKg6eJ7oyOtqk26vihvo8qe50Cvwevkraukeg
	 yPHh34GzVBCj/0D4gQoOnp1b2QG8MEipjqPLCDaVwa8jMhtaAiuhkAF7dAmah5Oiy4FMg
	 O13MxuidUv5dpAXQoaPVcgcOXBK5Q0Njb/vK3e9WDi2FiDUlP0JARurfBcUXw6uS3ln7M
	 aFrPiJm2y8PXSgxussUBjnJXFzG/k3B7F9tjS2AAfZxarZDfjxaJZnkxot2rbOsD7eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cW9jK8S+;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E0606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2E0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cW9jK8S+
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1048273f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792668089; x=1793272889; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK5V6UeZ+5TIYQp33vU4MVP0I+g7N2au9bpVxBDnWnI=;
        b=cW9jK8S+5+JFEQzu2vYBukyiRnRVBYQ/ah8hMppajtqwhhK/nqmNV9LwA62KUGaIJZ
         wxWx2rqwqygnvDxcQMGpG9WxGC3dJIdyDvpD59cvcafwTmGFHGZ2veB34HinUmphLpQ5
         7oZPNvh4H09CpxIySP1p/g8fePOMscxNgsjlySv4kf1okUIoKQ3gTi/HFpq9TyjSr5b8
         VI/bOQiX25vu820rQ3uI0VivnR1GKGP7t33XTphuBoCGn8KTY+2eX0mc2bz1ry3OxiHZ
         iHz0PlI3GAvMzy2AqEmKwEB7IjawHv32QQNa2/qI0FPHBls+GwLWkaa4bMmcqwVIYOJ2
         /Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668089; x=1793272889;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5V6UeZ+5TIYQp33vU4MVP0I+g7N2au9bpVxBDnWnI=;
        b=061e20t1aCUU91EMTN0fDZp/wCoby1NkQZRIozcKMIgbikPIIFCs6nPykHVVeCxmX6
         GA01kxr9oQQlkmLTkMEGGqP2Zs6t+sp2sZT115w2qZhMEbohih9gO60ZRmu1fLJtfVlS
         zg2e7IJ3bdPP+j5VP5f/+X/vLh6XE35XNCb8eFCAZkTEEyXp+4LWcHfR4wp8ylDHZ8rW
         7uKeo6gaATsrNELa5fRRM6v2/HvGUXL4qMqWDsi+ZBALYWL7DGntGqJWyVgNNRH+1nXG
         d3rCext4v0W8YXpGL/5Z+jX38qOJb2FmehyCidozXExQ+w4lFAME5QsFF5zycHV9Tvun
         vvTg==
X-Forwarded-Encrypted: i=1; AKwUvBzfTXabCpBygBWD+3bmFuVwTAHAy7FkapViM3RFIjOFhsdCN+NpCAsUf6D+0Mrk3JH9+zYhZlNLPzy6UzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Ci7UnLlvcIPmybbWiUMZWrv/PkZIH3wW1cMgiKFVDfSz8bvz
	3lJW3nV5Jqrr6Efm3unk15vVBdcD/bry7QddKEOyDjLyrSGvCyU1k7QswWJZj7mvPdWJ75+Dztd
	KRKzrCh0=
X-Gm-Gg: AYBFou3QM2Kga46KpVCFswl/a2Qd6zHVFM+MxiWK0al4vtcT7DZiqwt8ZE9dlyktbcM
	Zi+pCcH7MGzNThiloQQOYfxgjZyOskaLcEBrMP9BqoJ2Hs03fzwLMFic0nJKolaLCUVV3WQci0S
	z5hu01nYuJ/1/WG3rBEfpzRbPrpfTmF7I1AvHB4l6N4BFUGzaX4lhgv3uhy5bnMO3qdT76M+AEn
	uPHw+A11C4VDwm0SFG9ubYWHVpGsHTyVA706dNSzVdoM59TfWtLaj6kllFsDzr4UvBS0iJee8p8
	o5NvtzCQX7dzz1YeYisU5zA81rrrJvRd2nlyNhhOFBB7cZVEonGNQvuMWYB8AZWyabCo5F4O8VC
	MOir2yrrDvwKmEaoCudM9e84oX4MSiFpQg3mSNbJexAjRewCd85SUOTpJHGFfC4e5Wrwb18E33K
	+HrEGQMrFCPo2HRwZQE+ZBJolrVi2t0P2m7j6itvxNN510N+Xhw0bt3i7VNUHT4hK3hWCUQ93+t
	jy7siIlm5lHOctBorlVgoBP3mSRnVUWMQ3/tjOQP2Lh49HnNxX+IbBJis7OrIcDidlJ0MvQTeQe
	QSjxFazw+ZIArPX32w==
X-Received: by 2002:a05:6000:26cb:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-48e264c2b7dmr9305222f8f.36.1792668089462;
        Thu, 22 Oct 2026 04:21:29 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835e22sm13246580f8f.44.2026.10.22.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:21:29 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:21:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] printk for 7.4
Message-ID: <atnxt9PVFpXO5wja@pathway.suse.cz>
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

Hi Linus,

please pull the latest printk changes from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4

================================================================

- John Ogness became PRINTK co-maintainer.

- Unregister boot consoles when any proper console is registered at the end
  of the boot phase. Before they were removed only when the so-called
  preferred console, usually set via the last console= parameter, got
  registered.

- Fix computation for increasing  the printk ringbuffer on systems
  with many CPUs and possibly long backtraces from all CPUs.

- Cleaned up irq_works handling for deferred printk operations.

- Use acquire/release semantic for filled_random_ptr_key.

- Allow to use ':' in console options.

- More code clean up.

----------------------------------------------------------------
Andy Shevchenko (1):
      lib/vsprintf: Use EXPORT_SYMBOL_IF_KUNIT() to export symbols

David Engraf (1):
      printk: Remove console options before decoding the name

Jinjie Ruan (1):
      lib/vsprintf: Use acquire/release for ptr_key publication

Petr Mladek (3):
      MAINTAINERS: Make John PRINTK co-maintainer
      Merge branch 'for-7.4' into for-linus
      Merge branch 'for-7.4-console-registration' into for-linus

Sang-Heon Jeon (1):
      printk: increase the ring buffer for more than 16 CPUs by default

Sebastian Andrzej Siewior (1):
      printk: Use two irq_works instead per-CPU

Wang Wensheng (1):
      printk_ringbuffer: Avoid needless read of prb_desc

Xiaochun Li (1):
      printk: Remove remaining boot consoles when a real console exists

 MAINTAINERS                       |   2 +-
 kernel/printk/printk.c            | 130 ++++++++++++++++++++------------------
 kernel/printk/printk_ringbuffer.c |  17 ++---
 lib/tests/printf_kunit.c          |   1 +
 lib/vsprintf.c                    |  19 +++---
 5 files changed, 88 insertions(+), 81 deletions(-)
