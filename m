Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002176;
	b=E4ASKzBO4I94JRHs3kmY8dOvTSqMhdijtnYl68GE9I9AsL8AcRPxEq+pRqC6kLxBbMs3
	 7HfUkw5s8YJ9uAJjG8yM044z+8hDozMtimEIuitUExJLNBgyZD3mfGmH3WVA1Ag8lyMhC
	 pAIplKc9/5x9RoVwkPt8N4zlwuNMkuRXogIKLnQb+FiXki6Y8Bw0YIN+xG4WjV++2OCPy
	 ruNe4L21B+xWTyDiDpBW2S7L8ugR7XJzj5ywN0E7ubAlDYD6q1gN8YdYjG95ZyZMVvArB
	 WEOkoEJctCARChLSVoAmlP+qIZr2BInv6neIogGrNgr3FT0YxgBRXJm/Fdnf4F87Q6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=3TLmpE00RNnysrJO4l3u4AF92XWrESeobBzUxOKilu4=;
	b=ZuQKKmiTgy/nyConPU7oTnSnX9ZE9d82LcX4QNKHK+qQTkZ191FgN7PSyetED0F1Ggpf
	 NkUhMHr2qXhQaWD2sBexEAegBfV7UD8pYpn4BUt+7IswCKaDf0xFYitwG5efUCXJi6PU8
	 VXKFC8P01hQhWy54cP/7e61QQOtr/mSYmm0p1NavY6fyz6pHKGJ+BCon1jyND0LdbePLN
	 t333nP/06XhlRT67IeAsCe7R8kNYHJdju/CPJlhmjzjLDcMx6L0VZxx6YzCvxfOuchrSi
	 j/mkmv+EqflrpL4dQJyKC799OMiu/Mk9OPizrxAc+2jv/uuuEvtg9jEwoaz4fI/1Png==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OU+ZQlx1;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB953606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB953606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OU+ZQlx1
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so2185988c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794002175; x=1794606975; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TLmpE00RNnysrJO4l3u4AF92XWrESeobBzUxOKilu4=;
        b=OU+ZQlx1YvJKkEY0fv7BZgiu3t9pQUUyIkW1sSiX1TCXXtOtLZWhQ5V+HpbFEjXF+c
         K/psVmYCDzmoBxPyAa3pS8taz4InEzNb0iUKqjc8NAnB64a+If/0QoQT+LqEaGr7CxDb
         E///GHunjmqhRbaMCFtcFJcBhVhGrZVR9F6YFqCrx/zRw1QIo3/pNQIqAm1azwI84dnG
         AXiEFtiOD94ub9EN5sRG+LNVGLIaR7j9ZH6o5AjS682iW0uAYxYagS51etTH8YDL2x4g
         PPgNQGFvSCyzK7F5sulhVhnirUy4wsLEvcAM8I2Rml0T63D+MolzcP9popKBNfMSFgPY
         XZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002175; x=1794606975;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TLmpE00RNnysrJO4l3u4AF92XWrESeobBzUxOKilu4=;
        b=DCRdgVm087yqMRttjO90zgs9nqD5sYz6AN9EUJsmrsnpykvPNsWR3ZDopeap6OdllW
         rJcClfPhKSnVYBVbEKCkumOyESIZ+5lPO9X4UjUAT+xSMwrXv4HYNOwmN1vhJSOflLyJ
         A4ewlpYCncrb8dDnHV/mb0WtSchC7yKXk0duX/YFRn8bvJWidcKIKU0lI8+p6MdmbiI/
         3NQ2jy4PX4WDUGxidnRsDC7BLbjmOE0Zx7HYF0AcHcaM9+RfX1HM0weAqKPuvgZsrCwG
         mSEBgLhigQnVGqThXPEf12ijp4pirlJgiYzwkrsBiQ6i0jFd+Jxj3v+Mg3HuTPzNA0iE
         U/Jg==
X-Gm-Message-State: APuU4Z/yyfF3Wk0cRqVOutKa2gPxz3hfzssrj8Tknh37FZX5Wnm76MUb
	njdm4lz5tOT5xBeGYpYcRq8WCiKY42fXofEc5sfuc9ZO6Dui7p4fHTlA3/IVkNXtY+aTyMWuXwV
	JWB9gGXw=
X-Gm-Gg: AYBFou1svkTaNPYiPAecDsYlvPCqrqxik4XcOAhXPlsbyghWhjt8n6nu5c5zvDps/EZ
	3s6ICN9Cxyyw/3qtn+KdnmOCVikOIwr6LoVlXcf+NbObU03Ca2hyYgpqBhlj6cMSbgwKvbY4njc
	GwqOdxAqY/a6qM/Sjf7ekZaVrdLblBgxXG4CWsHmbI9zTvMdQ/UxkQHhnhqPga8/XbZs4T5m57m
	GOgYrSWoEGQa5nRpbgPFYnbwOjVJHk8CX4J1WsFNXNz8HRGWtewys35g9Qqm4A3cxDE+0jNi3mX
	+H6BxsMPkwFqcKpnJ+Dkl/CRJfipYbiP6jVNXPGcMayHFGfutKhD3x2k+hHh7LF4vfNg5FgVcTB
	WDLsFDyO6Qnuh/lapX+QZ+06ULN9GZMVnI3ZLANXcKcbShm352yrnLeaVUrucXZqutL3EeWqAoJ
	KEsGLh5niwIFbX/ncXFBs8S7bVyhk4FTJLTr07HBUqS6LQ4nVrmNpnlSsyEAzL15LSOwZ5ZTkFx
	/m+6XSUVqdGKNdEUnjx70zc7u/cqKLT3Yn2KJ8AJNuUomi8BEVq6WivL7rPosIAHwZ3J0kYYk9j
	z73Yk2nzFK04QLVxyXZLKRPT6ejUnsuMg56Pqdbd18uaCBytuv3LIE7Fz5E=
X-Received: by 2002:a05:7022:3b81:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b25d38b6f0mr5590619c88.44.1794002174488;
        Fri, 06 Nov 2026 13:56:14 -0800 (PST)
Received: from localhost ([129.210.115.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm8606643c88.18.2026.11.06.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:56:13 -0800 (PST)
Date: Fri, 6 Nov 2026 13:56:12 -0800
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Subject: [ANNOUNCE] kmorph: rebootless kernel crash recovery and live update
Message-ID: <au5M_M_RzWfXLr0T@pop-os.localdomain>
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

Hi all,

I would like to announce kmorph, a tool built on multikernel, the
kernel work that runs several Linux kernels side by side on one
machine. kmorph uses it to let a machine survive a kernel crash, and
upgrade its kernel, without rebooting at all:

    kmorph:      https://github.com/multikernel/kmorph
    multikernel: https://github.com/multikernel/linux

The problem
===========

Today, when a production kernel panics, the best we have is kdump, and
kdump costs two reboots:

  1. The crashed kernel kexecs into a capture kernel, which has to boot
     from scratch, bring up a small user space to save the vmcore.
  2. The machine then reboots again, usually through the firmware, into
     the production kernel, which boots from scratch once more and
     restarts every service.

On a large server that is minutes of downtime per crash, and the
capture kernel sits idle in reserved memory the rest of the time,
doing nothing until the moment it is needed.

What kmorph does
================

With multikernel, each kernel owns its own CPUs, memory and devices,
and the kernels talk to each other over vsock. kmorph uses this to
replace both reboots with a takeover. A second kernel, the successor,
is booted ahead of time on a CPU or two and a slice of memory beside
the running kernel, the predecessor, and watches it. When the
predecessor panics or hangs, the successor fences its CPUs, adopts and
resets its devices, restores the network identity, optionally saves a
kdump compatible vmcore, then hot-adds the remaining CPUs and memory
and becomes the machine's kernel. Detection to a running successor
takes about one second, with no reboot, no firmware and no operator.

The same takeover gives a live kernel update: "kmorph upgrade" hands a
healthy machine over to a successor running a newer kernel. Either way
the new kernel can arm a successor of its own, generation after
generation.

All of the novel work is in the multikernel kernel: fencing, device
and IOMMU handover, and CPU and memory hot-add from a host device tree.
kmorph is plain C orchestration on top of its interfaces, and
integrates with distros the way kdump does, through dracut,
initramfs-tools, kernel-install and a systemd service. It works today
on both x86_64 and ARM64, and RISC-V support is in progress.

nginx back within 2 seconds
===========================

Restarting user space is usually what dominates recovery time, so
kmorph can start selected services inside the successor while it is
still on standby:

    standby = nginx.service

nginx then runs in the successor before anything goes wrong, with its
ports already bound to the machine's addresses. When the predecessor
panics, the successor takes over the NIC, restores the addresses,
switches the root onto the real disk with pivot_root and lets systemd
bring the rest of the machine up around nginx, which was never
stopped. In our testing nginx is serving requests again within 2
seconds of the kernel crash, compared with minutes for a kdump cycle.

Two seconds is where we are today, not where we want to stop. Our
goal is zero downtime: a kernel crash that the services on the machine,
and the clients talking to them, never notice.

How it differs from KHO and LUO
===============================

Kexec HandOver (KHO) and the Live Update Orchestrator (LUO) solve a
related problem, with three key differences:

  - KHO and LUO still go through a kexec reboot, so the new kernel's
    boot is on the critical path. kmorph's successor is already up and
    running before the handover starts.

  - KHO and LUO need a healthy old kernel to serialize its state, so
    they cannot help on a crash. kmorph handles a crash and a planned
    upgrade with the same takeover.

  - KHO and LUO preserve only what a participating subsystem
    explicitly serializes before the kexec. With kmorph, memory is
    preserved by default, because multikernel hot-removes memory
    together with its struct pages.

Join us
=======

This is still early, and we would very much like the community to help
shape it. Feedback of any kind is welcome: on the design, on the kernel
interfaces underneath, on the takeover sequence, on what it would take
to make this useful on your machines, and on the workloads and hardware
we have not thought about yet. Bug reports, testing on real hardware,
patches and reviews are all highly appreciated.


Thanks,
Cong Wang
