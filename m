Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33C3438B2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022808; cv=none; b=pdzhBz/b8+Gsa7+tfnz9chJd47ZS8/4kF5UU8Nrd9J5N+qI7a1NkEv8fezQqLKimn68Bu/IjfqWToggTUBkARYekIgLvXmnes9aiH603niFAJjx3ZCYGpxG2Nr12LsLbT27EdOnjcDU6/85b7N6YHNa2ZTzOoajxg2bHmkIYuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022808; c=relaxed/simple;
	bh=kgmg6SoIB/3yUf8ADJjOq9BtOHqc5NPV6pK4yi3t5dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzvZajBW/oMjnvHqYsuc2KaY0l/dDmJY7+rymcTyp59TI34lSAioYaDNM+uzTg31HI/8hH/SV3r2E4Ko+lgdAdVnqtjlQ6vyo8amZkrvmxa8chk6CDw7D6fxvLr/g7z/e1XOA4k6e4lCE/r6fTs1f4tEdsDQE+WY8O1Xs/9pFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJNikCHv; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJNikCHv"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3a51696a650so219022a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791022807; x=1791627607; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRcw9YKb16RzMyTdR3AGPddXtl++CfcN70A3BsA75lk=;
        b=GJNikCHvm/hgN4JYL/J5VdoFhDKnIsauSpAq10ZWfSNBcACmzoOe7oNx2+a0KDp2P5
         0rejilcAKW2Nw3kUtNocBy/WFVPbJz7xwaLQ15rbgZqJgcFp5mP4S7TrDo1u6ApCb4Xl
         6lmSXv1RWQ9nARipivTLHQxxWXEtdoM5NMbh95P4gc8KMUMPhFR1uQioK7RraL+HL0nR
         cH+r1y3LThXHnoNQ0vfmS/0Y6tJibAcv5nSqFth949zQOdXTm784XTGRyYUMqBR0O5ew
         t/QNdUySYUqy4mKcIYLfPdPzSe7ZlmbumnMX9ALYSHopMi25I2whRbfNVp6LfLGF70OD
         O8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791022807; x=1791627607;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRcw9YKb16RzMyTdR3AGPddXtl++CfcN70A3BsA75lk=;
        b=tpGjwhK8k/HgqPA3UvVa7dDc7XZmkdBTXKSziIgK8KvR1mK6/jcDj0g24tkNBWTZLc
         zy19Yo59dufPPloqZkxruNcHdXJd1UgQs4yjJRCyWWJ1q9/aDSw0Epo5i5NdeqReMCmy
         19dpm/Tx4Q2u9uV4Sh9hUNfg9PMloifjpOUTT4IjnGEP6nOBWqmoxY/K0wiOpa3DDTbu
         gJBQkU65vG+RZI+kXpEq3Zcavc5V7GhU2DVdyO0BxL+ZBvhmRGelBDqbkhwUQDaoL1jt
         jnuqytnUPtQ5ifdswrwA3oTOGEFhsquEsEbj+MM4TabYWxTKw1Fw5QowVT/XLV07hlvQ
         RCYA==
X-Forwarded-Encrypted: i=1; AKwUvBwx4GMq8YG780/Vv8LnUGv79XNW+RM7BP5ImGfSMQkB/AUm5JplrOroUTqcyflj5SgNnomsH4Y3M3cPVpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfbLXnZru8gZM56SWKfU1MG7797O3PY3rwnkmgQUQYOaK4yv9r
	y9ze5lbZLIjYxjLSgLSRYojXS3wSpzwp+yPpPRwmc1bFeGiQspJWCvMZ
X-Gm-Gg: AYBFou0kAaXMAtWpTXExriHWJmaMofXn1BCP74dFe6J8+YlFFeyJbwscY21VuvTZqhH
	8qFmbshkkN/LsKkNJ4P/jnrNdLfw7St3w7aQvKtzWke9N+ivKkgeM/bmEZqBS6qYYpGn+zhDoTM
	lmACkZhrLJLKdiuGY896KaVCxKGxuRyfky7gG35sstIvIs8+j0VWscec0YC6YzEe4U2RcaOis1K
	jL1tGX2ul1HZZ5N5O8VeY4JdHw2/KZCBRkWcJcmF8w18zsZA0dnloMfDryqcyoqoDBMHScCqPX4
	1Uy6E2mOU/65nI2m3bcAlWjrHPSg6v5xlqN/zeyHSyiXW8yAsFGZRM8poBIw3LzVoHrpoIwmBKO
	Ni7Y7HdHBKa8AKlFHnvOlTRtLJLw5ckC18TZZ+8onsS7k9KE7K5p4o8vA+XdLhKubNTrT9dFInq
	p3sttM5j4cuFDuS/yoHGv8zuvCBwmK5YPED23DtN4wluEeo8+FtLKK2jntmY9GIbOYh4NV93YFs
	RDVsdiLv5BVUA==
X-Received: by 2002:a17:90b:3b4f:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3a79413ddb8mr898253a91.42.1791022806861;
        Sat, 03 Oct 2026 03:20:06 -0700 (PDT)
Received: from ThinkPad ([240e:46d:7b20:7df:1ddc:2f29:f17a:97e4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm2539110a91.17.2026.10.03.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:20:06 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:19:50 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] thinkpad_acpi: intermittent boot hang in hotkey_poll_setup on
 ThinkPad X1 Carbon Gen 14
Message-ID: <asDVVtAXt8YVbZ3C@ThinkPad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am seeing an intermittent boot hang in thinkpad_acpi hotkey polling
on a Lenovo ThinkPad X1 Carbon Gen 14 (machine type 21V8A028CD).

I originally encountered this while testing linux-next kernels for an
unrelated camera issue.

The problem has occurred with at least:

  next-20260928
  next-20261002

When it happens, boot stalls and many udev/modprobe tasks end up blocked
in async_synchronize_cookie_domain(). One of the blocked tasks had the
following relevant stack:

  hotkey_poll_setup [thinkpad_acpi]
  hotkey_inputdev_open [thinkpad_acpi]
  input_open_device
  kbd_connect
  ...
  tpacpi_pdriver_probe [thinkpad_acpi]
  ...
  thinkpad_acpi_module_init [thinkpad_acpi]

The failure is intermittent. The same kernel can sometimes boot
successfully, while another boot hangs.

I tested two workarounds:

1. Blacklisting thinkpad_acpi allows the machine to boot normally.

2. More importantly, keeping thinkpad_acpi enabled but building the
   same kernel with only

     # CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set

   also makes boot reliable in my testing.

For example, with next-20261002 I built two otherwise equivalent
kernels:

  CONFIG_THINKPAD_ACPI=m
  CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y

and

  CONFIG_THINKPAD_ACPI=m
  # CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set

The first configuration can intermittently hang during boot. With only
HOTKEY_POLL disabled, the machine boots normally into KDE/Wayland and
thinkpad_acpi is loaded:

  thinkpad_acpi 196608 0

The usual ThinkPad hotkeys I have tried also still appear to work
normally with HOTKEY_POLL disabled.

A normal Arch Linux 7.2.8-arch1-2 kernel boots reliably on the same
machine.

This therefore appears to be specifically related to the
thinkpad_acpi hotkey polling path rather than thinkpad_acpi as a whole.

The issue is intermittent, so I have not yet bisected it to a specific
commit. I still have persistent journal logs from both successful and
failed boots, and can provide complete task stacks or test additional
debug patches if useful.

Hardware:

  Lenovo ThinkPad X1 Carbon Gen 14
  Machine type: 21V8A028CD
  Intel Core Ultra 7 356H / Panther Lake

Thanks,
Qiling Zhu
