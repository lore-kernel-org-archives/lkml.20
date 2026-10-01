Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440F519DE2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863656; cv=none; b=QuvpLwsGgup9VF7BY43Z7BHawniErWaqTZv+Z1EKJPoK+zp/Na86EfQBqO3VHASp/xFEr1N03T4XFJIr0AsjE7uMv136bzJwz8TrSM9t9FJcosF87D18uwOwPxnzKGF/WweaBpsDRnHJYWqXl8F3qT5UDn3OJJMSdQxxXlaB5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863656; c=relaxed/simple;
	bh=TuVpEwAlwlnPZRUBPH2tPbpeRZXgxrKHau0lKsr8EPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEAGlvKxhTN0x/3bku3XkV6436encj5kBNhlLdxh5Z8xwg+6QZy6pw5ZJzI54YYcwwk/2hQ9jcgc68pkRZFhkjbfVcLLPP7hhhjAAIgTFqJ4I2vyrLXGBUtlRWsftlyp4n9prpIfRfChmHcPhpHjRF85sptaiLv+ELxonQCp5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GY1LDGZq; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GY1LDGZq"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so261865f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790863652; x=1791468452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaLK6xVc80DoR2HBVg5Dlww4zduxs5a3g6ln9kbuC6Y=;
        b=GY1LDGZqBnxW32dvTykCI63qeWUEH6MpBK9vtGWGOSMNnS40JSGCXCiEnHYo2ABPsB
         6jwaE19Bxu6TkOXmW7pobM6/8pn8U6PzQZjmdEw4jUMsT4VvWsMEARun5D78s4+ya70/
         viba+pt2LCO34+gw9NjjI4aj1BO3O6321BcUWfOQpCD0JM/6g3IL1D1YXL7I+u0GDldq
         q7+ffwaU/k/kbt2d+5NAfUOY6IvUG+Qep8O+BknqeNaDSrfHGlVgUsyOs7yHi6PFthxP
         pwUlyN6pLvF+xiuMz9C2358cqZAl+Kn6Pzg/cpQZjFA9qI52CxhR3MDIGghKjoh0rN+R
         XwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863652; x=1791468452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaLK6xVc80DoR2HBVg5Dlww4zduxs5a3g6ln9kbuC6Y=;
        b=lhC0vfCfHIY9hSe/W9UyXv+5wkwDEMIOOPh1cauKxil07ptUrPI4wzaeWPoljRbsG3
         /BJg/LouO8LMyVZNXvP8l1q/sher++rXfOUVJUxmTOom0qNiJ+oZLI2czZJgA78fN205
         ZXFgJsNDqZI1etqHn+RShNStaFf78kM1qn5JVRtBufF6UlOzgeJZiyHM2wa+Q+LJ1li0
         l7zqBV62/hk2P4IJEY4urPAfjt7B2Qr6RttTPbBHpI3kUM4q6gn8QPv35EcfxMKnE6Vg
         inPA2Yw0WnR4UTyjATZbvBepWvInToDjj8gNPs18iQu6pcvMdGVkJM+32vGbJFmwsRms
         pcmg==
X-Forwarded-Encrypted: i=1; AKwUvBzC2qgxWnUglocXCmxNkkBkJaes2ExD91UA41Qg4Vdm+azn+9XKXL7+VaDTGnU5u8GycsvfE4RHkvXw08Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k/BwCgXL9vkpTik/46u6+QUeJorRmhcIPJ0VH0xX9axi5fePSi
	lwdccrENTuvYevgsi3d6dA9Ne+TYhTQt/AtnfyYSD3cRYbznqJ6Jz9ZojkcCTNsGtD0=
X-Gm-Gg: AYBFou2yP3eG96w8CqoRBDcdqtL0touVXbGPlqfaAnl0Xze6Nyy/HjFE/a8boU6MxRt
	HcKRPnFQ39TMHFU1omj94BrKzjQbe2AHVTo3s8G9dkkBPqsyanlbj8MRO+Qfy6bBYGUs53IVAT8
	vQYlN1Gkzng8qy785duPpjTWnA2mlm59iSJPrSLhYciWXQdV0ZrWWwCmnTIzHMK+oecLkEjqUQY
	0dCcj1ur6DzOumU70gF3nNLOn/ikAqBgPMPbdLKnFemfvI7UvU4Z7joYV9Nb5DXrsdwOdZF0F6D
	RD2MxxEVz9y94WvLvq4+I7slDjiaQGrXfNm7wDR+kALJlUwo1a4d5A51NUkX6uXmRH6wMxTxSpi
	x7Or30GL7Iv1A64iYq0iOSphapyL0GCi7M6mWem1WK1b3SA1TWLVndlGH6T8ZkDz3UsU6HAdjBN
	ZIsXbH3MBMsxe4CvDwUPmNDrKvcX2OegRLFBBTd5ZFlmdZhrTBX0zZ4umIrZoVVcfLt2wj+KN3
X-Received: by 2002:a05:600c:4fcb:b0:4a0:3b9:f16b with SMTP id 5b1f17b1804b1-4a01ab4f2d9mr90543535e9.0.1790863651874;
        Thu, 01 Oct 2026 07:07:31 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023798b54sm39456895e9.13.2026.10.01.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:07:31 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>,
	Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 0/1] braille: nbcon: Fix Braille console for NBCON API
Date: Thu,  1 Oct 2026 16:07:26 +0200
Message-ID: <20261001140727.124398-1-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is v4 patch which tries to fix Braille console driver to work
with serial console drivers ported to NBCON API.

I did a quick turnaround because it would be nice to get it into 7.3.
Many people attend Plumbers conference the following week...

Changes against v3:

  + Removed unnecessary "locked" variable. [John]

  + Allow to use console driver even without write_atomic,
    except for panic mode [John]

  + Added parenthesis around (con->flags & CON_BRL) [John]

  + Exported nbcon_write_context_is_braille() [Sashiko]

  + Fixed many typos and wording [John]


Changes against v2:

  + Use con->device_lock() for non-panic case. Try even an unsafe
    acquire in panic(). This simulates the legacy locking using
    NBCON API.

  + Return when the nbcon context can't be acquired in panic().
    The NBCON API is not ready to ignore the lock. Well, it
    should never happen in practice because the unsafe acquire...

  + Avoid the newline prepend logic in all serial consoles
    ported to NBCON API which have it. Add two APIs for
    checking whether either "con" or "wctxt" is in Braille
    mode.

  + Update commit message and comments in the code.


Changes against v1:

  + Merged into one patch. It is hard to explain nbcon_braille*()
    API without the user.

  + Reworked the locking, see the commit message for more details.

  + Fixed the check of CON_NBCON_ATOMIC_UNSAFE [Sashiko]

IMPORTANT: The solution is not safe in PREEMPT_RT. But it is better
	then nothing. We could either solve it in v3. Or we could
	fix it later.

[v1] https://lore.kernel.org/r/20260922072558.98854-1-pmladek@suse.com
[v2] https://lore.kernel.org/r/20260925141729.173943-2-pmladek@suse.com
[v3] https://lore.kernel.org/r/20261001093946.112999-1-pmladek@suse.com

Petr Mladek (1):
  braille: nbcon: Allow to use a serial console with NBCON API as
    Braille console

 .../accessibility/braille/braille_console.c   | 60 +++++++++++++-
 drivers/tty/serial/8250/8250_port.c           |  5 +-
 drivers/tty/serial/amba-pl011.c               |  2 +-
 drivers/tty/serial/imx.c                      |  2 +-
 drivers/tty/serial/sifive.c                   |  2 +-
 include/linux/console.h                       | 15 ++++
 kernel/printk/nbcon.c                         | 79 +++++++++++++++++++
 7 files changed, 159 insertions(+), 6 deletions(-)

-- 
2.55.0

